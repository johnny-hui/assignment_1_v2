//SOURCE USED: https://stackoverflow.com/questions/5752353/c-strcat-garbage-characters
//SOURCE USED: https://stackoverflow.com/questions/12510874/how-can-i-check-if-a-directory-exists
//SOURCE USED: https://stackoverflow.com/questions/7430248/creating-a-new-directory-in-c

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
#include <memory.h>
#include <netdb.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <strings.h>
#include <dirent.h>

#define BUF_SIZE 1024
#define DEFAULT_PORT 5000
#define BACKLOG 5
#define MAX_IP_LENGTH 20
#define MAX_NAME_LENGTH 100
#define HUNDRED 100
#define ZERO 0
#define DEFAULT_DIRECTORY "./"

struct options_server
{
    char file_name[100];
    char directory[100];
    in_port_t port;
    int socket_fd;
    int client_fd;
    int file_fd;
    int fd_out;
};


static struct sockaddr_in get_client_info(struct sockaddr_in *client_addr, socklen_t client_addr_len,
        char *client_ip, char *client_host_name);
static void options_server_init(struct options_server *opts);
static void parse_arguments(int argc, char *argv[], struct options_server *opts);
static void options_server_process(struct options_server *opts);
static void cleanup(struct options_server *opts);
static void initialize_server_info(const struct options_server *opts, struct sockaddr_in *server_info);
static void set_default_directory(struct options_server *opts);
static char *get_client_dir(const struct options_server *opts, const char *client_ip);
static void make_server_directory(const struct options_server *opts);

static void make_client_directory(const char *client_dir);

int main(int argc, char *argv[])
{
    //a) Initialize Server and Socket
    struct options_server opts;
    options_server_init(&opts);                   /** DEFAULT = when user typed nothing : ex) ./server */
    parse_arguments(argc, argv, &opts);           /** Set all the process input */
    options_server_process(&opts);                /** Initialize socket and perform client handling */

    //b) Do Stuff
//    copy(opts.socket_fd, opts.fd_out, BUF_SIZE);

/*    cleanup(&opts);*/

    return EXIT_SUCCESS;
}


static void options_server_init(struct options_server *opts)
{
    memset(opts, 0, sizeof(struct options_server));   //0 == NULL
    opts->socket_fd = STDIN_FILENO;
    opts->fd_out    = STDOUT_FILENO;
    opts->port      = DEFAULT_PORT;
    set_default_directory(opts);
}

static void parse_arguments(int argc, char *argv[], struct options_server *opts)
{
    int c;
    while((c = getopt(argc, argv, ":d:p:P:")) != -1)   // NOLINT(concurrency-mt-unsafe)
    {
        switch(c)
        {
            case 'd':
            {
                memset(opts->directory, 0, sizeof(char) * HUNDRED);
                strcpy(opts->directory, optarg);
                make_server_directory(opts);
                break;
            }
            case 'p':
            {
                opts->port = parse_port(optarg, 10); // NOLINT(cppcoreguidelines-avoid-magic-numbers,readability-magic-numbers)
                break;
            }
            case ':':
            {
                fatal_message(__FILE__, __func__ , __LINE__, "\"Option requires an operand\"", 5); // NOLINT(cppcoreguidelines-avoid-magic-numbers,readability-magic-numbers)
            }
            case '?':
            {
                fatal_message(__FILE__, __func__ , __LINE__, "Unknown", 6); // NOLINT(cppcoreguidelines-avoid-magic-numbers,readability-magic-numbers)
                break;
            }
            default:
            {
                assert("should not get here");
            };
        }
    }

    if(optind < argc)
    {
//        opts->file_name = argv[optind];
    }
}


static void options_server_process(struct options_server *opts)
{
    if(opts->file_name)
    {
        opts->file_fd = open(opts->file_name, O_RDONLY);

        if(opts->socket_fd == -1)
        {
            fatal_errno(__FILE__, __func__ , __LINE__, errno, 2);
        }
    }

//Defining Server Info for Socket and Initializing Socket
    //a) Create Socket Server Info
    int result_bind;
    int result_listen;
    int option;

    opts->socket_fd = socket(AF_INET, SOCK_STREAM, 0); //Open socket connection (0 for TCP)
    if(opts->socket_fd == -1)
    {
        fatal_errno(__FILE__, __func__ , __LINE__, errno, 2);
    }
    printf("[+] TCP server socket created!\n");

    //b) Initialize Server Socket Info
    struct sockaddr_in server_info;
    socklen_t server_info_len = sizeof(server_info);
    initialize_server_info(opts, &server_info);

    //d) Set options for socket
    option = 1;
    setsockopt(opts->socket_fd, SOL_SOCKET, SO_REUSEADDR, &option, sizeof(option));

    //Bind the server information to socket
    result_bind = bind(opts->socket_fd, (struct sockaddr*) &server_info, server_info_len);
    if(result_bind == -1)
    {
        fatal_errno(__FILE__, __func__ , __LINE__, errno, 2);
    }
    printf("[+] Socket has now binded with server information and to port number: %d\n", opts->port);

    //e) Actively listen for connections to server (based on server info)
    result_listen = listen(opts->socket_fd, BACKLOG);
    if(result_listen == -1)
    {
        fatal_errno(__FILE__, __func__ , __LINE__, errno, 2);
    }
    printf("[+] Listening to any connections...\n");

    //g) Handle multiple clients one at a time
    while(1) {
        printf("==================================================================================\n");

        //Initialize client address info and populate once accept()
        struct sockaddr_in client_addr;
        socklen_t client_addr_len = sizeof(struct sockaddr_in);

        opts->client_fd = accept(opts->socket_fd, (struct sockaddr *) &client_addr,&client_addr_len);
        if(opts->client_fd == -1) {
            fatal_errno(__FILE__, __func__ , __LINE__, errno, 2);
        }
        printf("A new client has connected!\n");

        //Get client IP and Host Name
        char client_ip[MAX_IP_LENGTH];
        char client_host_name[MAX_NAME_LENGTH];
        client_addr = get_client_info(&client_addr, client_addr_len, client_ip, client_host_name);

        //Make a directory for client under downloads folder
        char *client_dir = get_client_dir(opts, client_ip);
        make_client_directory(client_dir);

        //Receive data from client (1. Num of args, 2. File Length, 3. File Name, 4. File Payload)
        char file_name_buffer[BUF_SIZE] = {0};
        char payload_buffer[BUF_SIZE] = {0};
        unsigned int num_of_arguments_received;
        char file_size_string[10] = {0};

        //1) NUM OF ARGS: Get # of arguments from client -> use it in for loop to write file x times
        if(read(opts->client_fd, &num_of_arguments_received,
                sizeof(num_of_arguments_received)) == -1) {
            perror("An error has occurred while receiving number of arguments from client!\n");
            printf("CLIENT IP: %s\n", client_ip);
        }
        printf("\nNumber of files to be uploaded: %d\n", ntohl(num_of_arguments_received));
        num_of_arguments_received = ntohl(num_of_arguments_received);

        //1) NUM OF ARGS: Send acknowledgement to client
        const char* response = "Received number of arguments!";
        send(opts->client_fd, response, strlen(response), 0);

        for(size_t i = ZERO; i < num_of_arguments_received; i++) {
            int file_length = 0;
            char* response_file_name = (char*) malloc(BUF_SIZE * sizeof(char));

            memset(payload_buffer, 0, sizeof(char) * BUF_SIZE);
            memset(file_name_buffer, 0, sizeof(char) * BUF_SIZE);
            memset(file_size_string, 0, sizeof(char) * 10);
            memset(response_file_name, 0, sizeof(char) * BUF_SIZE);

            //FILE NAME: Get from client
            if(recv(opts->client_fd, file_name_buffer, sizeof(file_name_buffer), 0) == -1) {
                perror("An error has occurred while receiving file name from client!\n");
                printf("CLIENT IP: %s\n", client_ip);
            }
            printf("\nFile Name Received: %s\n", file_name_buffer);

            //FILE NAME: Send ack to client
            strcat(response_file_name, file_name_buffer);
            strcat(response_file_name, " is being transferred...");
            send(opts->client_fd, response_file_name, strlen(response_file_name), 0);

            //FILE LENGTH: Get from client
            if(recv(opts->client_fd, file_size_string, sizeof(file_size_string), 0) == -1) {
                perror("An error has occurred while receiving file length from client!\n");
                printf("CLIENT IP: %s\n", client_ip);
            }
            file_length = atoi(file_size_string);
            printf("File Size Received: %d Bytes\n", file_length);

            //FILE LENGTH: Send ack to client
            const char* response_file_size = "Received File Size!";
            send(opts->client_fd, response_file_size, strlen(response_file_size), 0);

            //FILE PAYLOAD: Get payload from client
            if(recv(opts->client_fd, payload_buffer, sizeof(payload_buffer), 0) == -1) {
                perror("An error has occurred while receiving file length from client!\n");
                printf("CLIENT IP: %s\n", client_ip);
            }
            printf("File Payload Received: \n");
            printf("++++++++++++++++++++++++++++++++++++++++\n");
            printf("%s\n", payload_buffer);

            //FILE PAYLOAD: Send ack to client
            const char* response_payload = "Received Payload!";
            send(opts->client_fd, response_payload, strlen(response_payload), 0);

            //Free file_name pointer
            free(response_file_name);
        }

        //Free client_dir pointer
        free(client_dir);
    }
}

static void make_server_directory(const struct options_server *opts) {
    DIR* dir = opendir(opts->directory);

    if(dir) {
        printf("[+] %s directory already exists!\n", opts->directory);
        closedir(dir);
    } else if (ENOENT == errno) {
        int result = mkdir(opts->directory, 0755);
        if(result == -1) {
            perror("Cannot make directory!\n");
            exit(EXIT_FAILURE);
        }
        printf("[+] The following directory has been successfully created: %s\n", opts->directory);
    }
}

static void make_client_directory(const char *client_dir) {
    DIR* dir = opendir(client_dir);

    if(dir) {
        printf("[+] %s directory already exists!\n", client_dir);
        closedir(dir);
    } else if (ENOENT == errno) {
        int result = mkdir( client_dir, 0755);
        if(result == -1) {
            perror("Cannot make directory!\n");
            exit(EXIT_FAILURE);
        }
        printf("[+] The following directory has been successfully created: %s\n", client_dir);
    }
}

static char *get_client_dir(const struct options_server *opts, const char *client_ip) {
    char* client_dir = (char*) malloc(100 * sizeof(char));
    client_dir[0] = '\0';
    strcat(client_dir, opts->directory);
    strcat(client_dir, "/");
    strcat(client_dir, client_ip);
    return client_dir;
}

static void initialize_server_info(const struct options_server *opts, struct sockaddr_in *server_info) {
    memset(server_info, 0, sizeof(struct sockaddr_in));   //0 == NULL
    server_info->sin_family = AF_INET;                            //Supports IPv4 (inet) addresses
    server_info->sin_port = htons(opts->port);            //Open on port 5000
    server_info->sin_addr.s_addr = htonl(INADDR_ANY);

    if(server_info->sin_addr.s_addr == (in_addr_t)-1)
    {
        fatal_errno(__FILE__, __func__ , __LINE__, errno, 2);
    }
}

static struct sockaddr_in get_client_info(struct sockaddr_in *client_addr, socklen_t client_addr_len,
        char *client_ip, char *client_host_name) {
    strcpy(client_ip, inet_ntoa(client_addr->sin_addr));

    getnameinfo((struct sockaddr *) client_addr, client_addr_len, client_host_name,
                sizeof(client_host_name), NULL, 0, 0);

    printf("Client Hostname: %s\n", client_host_name);

    printf("Client IP: %s\n", client_ip);

    return (*client_addr);
}

static void set_default_directory(struct options_server *opts) {
    memset(opts->directory, 0, sizeof(char) * HUNDRED);   //0 == NULL
    strcpy(opts->directory, DEFAULT_DIRECTORY);
}

static void cleanup(struct options_server *opts)
{
    if(opts->file_name)
    {
        close(opts->file_fd); //Maybe?
        close(opts->socket_fd);
    } else {
        close(opts->socket_fd);
    }
}
