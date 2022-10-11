//SOURCES: https://stackoverflow.com/questions/21023605/initialize-array-of-strings
#include "conversion.h"
#include "copy.h"
#include "error.h"
#include <arpa/inet.h>
#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <netinet/in.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <stdbool.h>

#define BUF_SIZE 1024
#define DEFAULT_PORT 5000
#define BACKLOG 5
#define ZERO 0
#define MAX_FILE_NAME_LEN 100
#define HUNDRED 100
#define DEFAULT_DIRECTORY "./"

struct options_client
{
    char *file_name;
    char *server_ip;
    char directory[100];
    in_port_t port;
    int fd_in;
    int socket_fd;
    int fd_out;
    char** file_names; //Array of char pointers (strings)
};


static void options_client_init(struct options_client *opts);
static void parse_arguments(int argc, char *argv[], struct options_client *opts);
static void options_client_process(struct options_client *opts);
static void cleanup(struct options_client *opts);
static void initialize_string_array(int argc, struct options_client *opts);
static void set_default_directory(struct options_client *opts);
static void add_file_args_to_array(char *const *argv, const struct options_client *opts, size_t index);
static void send_files(const struct options_client *opts);
static unsigned int number_of_non_option_arguments = ZERO;

int main(int argc, char *argv[])
{
    struct options_client opts; //Singleton

    options_client_init(&opts);
    parse_arguments(argc, argv, &opts);
    options_client_process(&opts);

    cleanup(&opts);

    return EXIT_SUCCESS;
}


static void options_client_init(struct options_client *opts)
{
    memset(opts, 0, sizeof(struct options_client)); //0 == NULL
    opts->fd_in  = STDIN_FILENO;
    opts->fd_out = STDOUT_FILENO;
    opts->port   = DEFAULT_PORT;
    set_default_directory(opts);
}


static void parse_arguments(int argc, char *argv[], struct options_client *opts)
{
    int c;

    //a) Handle all options first
    while((c = getopt(argc, argv, ":s:p:P:")) != -1)   // NOLINT(concurrency-mt-unsafe)
    {
        switch(c)
        {
            case 's': //-s 127.0.0.1
            {
                opts->server_ip = optarg;
                break;
            }
            case 'p': //-p 5000
            {
                opts->port = parse_port(optarg, 10); // NOLINT(cppcoreguidelines-avoid-magic-numbers,readability-magic-numbers)
                break;
            }
            case ':':
            {
                fatal_message(__FILE__, __func__ , __LINE__, "\"Option requires an operand\"", 5); // NOLINT(cppcoreguidelines-avoid-magic-numbers,readability-magic-numbers)
                break;
            }
            case '?':
            {
                fatal_message(__FILE__, __func__ , __LINE__, "Unknown", 6); // NOLINT(cppcoreguidelines-avoid-magic-numbers,readability-magic-numbers)
            }
            default:
            {
                assert("should not get here");
            };
        }
    }

//**********NOTE: optind will now represent the index of the first non-option argument!**********

    //All file handler (*.txt)
    if(argv[optind][0] == '*') {
        //Do something
        printf("%s\n", argv[optind]);
        return;
    }

    //Initialize an array of file names (strings) in memory
    initialize_string_array(argc, opts);
    size_t index = ZERO;

    //Multiple File Handler (NOTE: fopen() checks for a file in current dir)
    while(optind < argc)
    {
        //a) Check if file exists (before adding into array)
        add_file_args_to_array(argv, opts, index);
        optind++;
        number_of_non_option_arguments++;
        index++;
    }
}

static void add_file_args_to_array(char *const *argv, const struct options_client *opts, size_t index) {
    FILE* file = fopen(argv[optind], "r");
    if(file) {
//        printf("%s exists!\n", argv[optind]);
        sprintf(opts->file_names[index], "%s", argv[optind]);
        fclose(file);
    } else {
        printf("%s doesn't exist!\n", argv[optind]);
        fclose(file);
    }
}


static void options_client_process(struct options_client *opts)
{
    if(opts->file_name && opts->server_ip)
    {
        fatal_message(__FILE__, __func__ , __LINE__, "Can't pass -i and a filename", 2);
    }

    if(opts->file_name)
    {
        opts->fd_in = open(opts->file_name, O_RDONLY); //MIGHT HAVE TO USE THIS FOR FILE BYTE TRANSFER

        if(opts->fd_in == -1)
        {
            fatal_errno(__FILE__, __func__ , __LINE__, errno, 2);
        }
    }

    if(opts->server_ip)
    {
        int connection;

        opts->socket_fd = socket(AF_INET, SOCK_STREAM, 0);
        if(opts->socket_fd == -1)
        {
            fatal_errno(__FILE__, __func__ , __LINE__, errno, 2);
        }
        printf("[+] TCP server socket created!\n");

        //a) Create and set server info
        struct sockaddr_in server_info;
        server_info.sin_family = AF_INET;
        server_info.sin_port = htons(opts->port);
        server_info.sin_addr.s_addr = inet_addr(opts->server_ip); //Set to server IP from args[]
        socklen_t server_info_len = sizeof(server_info);

        if(server_info.sin_addr.s_addr ==  (in_addr_t)-1)
        {
            perror("Cannot Connect to Server. CODE: Invalid IP");
            fatal_errno(__FILE__, __func__ , __LINE__, errno, 2);
        }

        //b) Connect to Server
        connection = connect(opts->socket_fd, (struct sockaddr*) &server_info, server_info_len);
        if(connection == -1)
        {
            fatal_errno(__FILE__, __func__ , __LINE__, errno, 2);
        }
        printf("[+] Now "
               "Connected to the server on port %d!\n", opts->port);
        printf("=================================================="
               "================================\n");

        //c) Send Files
        send_files(opts);
        printf("[+] Files Successfully Uploaded!\n");
    }
}

static void send_files(const struct options_client *opts) {
    char file_name_buffer[BUF_SIZE] = {0};
    char buffer[BUF_SIZE] = {0};
    int converted_num_of_args = (int) htonl(number_of_non_option_arguments);
    int file_size;
    char file_size_string[10] = {0};
    char receive_message[100];

    // Send expected number of arguments (files to be sent) to server
    if(send(opts->socket_fd, &converted_num_of_args,
             sizeof(converted_num_of_args), 0) == -1) {
        perror("An error has occurred while transferring number of arguments to server!\n");
        exit(EXIT_FAILURE);
    }

    // Get confirmation that server got file count
    while(1) {
        if(read(opts->socket_fd, receive_message, sizeof(receive_message)) > 0) {
            printf("SERVER SAYS: %s\n", receive_message);
            break;
        }
    }
    memset(receive_message, 0, sizeof(char) * 100);

    for(size_t i = ZERO; i < number_of_non_option_arguments; i++) {
        //a) Open file
        FILE* file_ptr;
        file_ptr = fopen(opts->file_names[i], "r");
        if(file_ptr == NULL) {
            perror("[+] Cannot open file!\n");
            exit(EXIT_FAILURE);
        }

        //a) Send file names to server, await response from server
        printf("\nSending %s ...\n", opts->file_names[i]);
        if(send(opts->socket_fd, opts->file_names[i], sizeof(opts->file_names[i]), 0) == -1) {
            perror("An error has occurred while transferring file name to server!\n");
            exit(EXIT_FAILURE);
        }
        while(1) {
            if(read(opts->socket_fd, receive_message, sizeof(receive_message)) > 0) {
                printf("SERVER SAYS: %s\n", receive_message);
                break;
            }
        }
        memset(receive_message, 0, sizeof(char) * 100);

        //b) Get file size, send to server (as string), await response from server
        fseek(file_ptr, 0, SEEK_END);
        file_size = ftell(file_ptr);
        fseek(file_ptr, 0, SEEK_SET);
        sprintf(file_size_string, "%d", file_size);
        printf("File Size: %s\n", file_size_string);

        if(send(opts->socket_fd, file_size_string, sizeof(file_size_string), 0) == -1) {
            perror("An error has occurred while transferring number of arguments to server!\n");
            exit(EXIT_FAILURE);
        }
        memset(file_size_string, 0, sizeof(char) * 10);

        while(1) {
            if(read(opts->socket_fd, receive_message, sizeof(receive_message)) > 0) {
                printf("SERVER SAYS: %s\n", receive_message);
                break;
            }
        }
        memset(receive_message, 0, sizeof(char) * 100);
//
//        //d) Read from file -> Save to buffer -> Send buffer to server
        while(fgets(buffer, BUF_SIZE, file_ptr) != NULL) {
            if(send(opts->socket_fd, buffer, sizeof(buffer), 0) == -1) {
                perror("An error has occurred while transferring payload to server!\n");
                exit(EXIT_FAILURE);
            }
        }

        //e) Reset Buffer for next iteration
        memset(buffer, 0, sizeof(char) * BUF_SIZE);
        memset(file_name_buffer, 0, sizeof(char) * BUF_SIZE);
        fclose(file_ptr);
    }
    close(opts->socket_fd);
}

static void set_default_directory(struct options_client *opts) {
    memset(opts->directory, 0, sizeof(char) * HUNDRED);   //0 == NULL
    strcpy(opts->directory, DEFAULT_DIRECTORY);
}

static void initialize_string_array(int argc, struct options_client *opts) {
    //a) Allocate space for (argc - optind) amount of pointers to strings
    opts->file_names = malloc(((unsigned long)(argc - optind)) * sizeof(char*));
    if(opts->file_names == NULL) {
        perror("Memory allocation has failed!");
        exit(EXIT_FAILURE);
    }

    //b) Loop and allocate space for each file name (string)
    for(unsigned int i = ZERO; i < (unsigned int)(argc - optind); i++) {
        opts->file_names[i] = malloc( MAX_FILE_NAME_LEN * sizeof(char));
    }
}

static void free_memory_strings(struct options_client *opts) {
    for(unsigned int i = ZERO; i < number_of_non_option_arguments; i++) {
        free(opts->file_names[i]);
    }
}

static void cleanup(struct options_client *opts)
{
    printf("==================================================================================\n");

    if(opts->file_name)
    {
        close(opts->fd_in);
        free_memory_strings(opts);
        free(opts->file_names);
        printf("[+] Memory successfully freed!\n");
        printf("[+] Disconnected from the server.\n");
    }
    else if(opts->server_ip)
    {
        close(opts->fd_in);
        close(opts->socket_fd);
        free_memory_strings(opts);
        free(opts->file_names);
        printf("[+] Memory successfully freed!\n");
        printf("[+] Disconnected from the server.\n");
    }

}
