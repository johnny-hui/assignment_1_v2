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


struct options_server
{
    char* file_name;
    char* directory;
    const char *ip;
    in_port_t port;
    int fd_in;
    int fd_in2;
    int fd_out;
};


static void options_server_init(struct options_server *opts);
static void parse_arguments(int argc, char *argv[], struct options_server *opts);
static void options_server_process(struct options_server *opts);
static void cleanup(const struct options_server *opts);

#define BUF_SIZE 1024
#define DEFAULT_PORT 5000
#define SERVER_IP "10.0.0.154"
#define BACKLOG 5

int main(int argc, char *argv[])
{
    //a) Initialize Server and Socket
    struct options_server opts;

    options_server_init(&opts);                   /** DEFAULT = when user typed nothing : ex) ./server */
    parse_arguments(argc, argv, &opts);           /** User type and processing input */
    options_server_process(&opts);                /** Set all the process input with server option struct */

    //b) Do Client Stuff

    //c) Cleanup
    copy(opts.fd_in, opts.fd_out, BUF_SIZE);
    cleanup(&opts);

    return EXIT_SUCCESS;
}


static void options_server_init(struct options_server *opts)
{
    memset(opts, 0, sizeof(struct options_server));   //0 == NULL
    opts->fd_in    = STDIN_FILENO;
    opts->fd_out   = STDOUT_FILENO;
    opts->port     = DEFAULT_PORT;

    struct sockaddr_in server;
    socklen_t server_info_len = sizeof(server);

    server.sin_family = AF_INET;                               //Supports IPv4 (inet) addresses
    server.sin_port = htons(opts->port);              //Open on port 5000
    server.sin_addr.s_addr = htonl(INADDR_ANY);       //Opens all connections on server machine (see ifconfig) => Example: ./client -s 127.0.0.1 (Client can connect to any server connections open by INADDR_ANY)
}


static void parse_arguments(int argc, char *argv[], struct options_server *opts)
{
    int c;

    while((c = getopt(argc, argv, ":i:o:p:P:")) != -1)   // NOLINT(concurrency-mt-unsafe)
    {
        switch(c)
        {
            case 'i':
            {
                opts->ip = optarg; //IP of server
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

    if(optind < argc)
    {
        opts->file_name = argv[optind];
    }
}


static void options_server_process(struct options_server *opts)
{
    if(opts->file_name && opts->ip)
    {
        fatal_message(__FILE__, __func__ , __LINE__, "Can't pass -i and a filename", 2);
    }

    if(opts->file_name)
    {
        opts->fd_in = open(opts->file_name, O_RDONLY);

        if(opts->fd_in == -1)
        {
            fatal_errno(__FILE__, __func__ , __LINE__, errno, 2);
        }
    }

    //Defining Server Info for Socket and Initializing Socket
    if(opts->ip)
    {
        //Create Socket Server Info Structure
        struct sockaddr_in server_info = {0};
        int result_bind;
        int result_listen;
        int option;

        opts->fd_in2 = socket(AF_INET, SOCK_STREAM, 0); //Open socket connection (0 for TCP)

        if(opts->fd_in2 == -1)
        {
            fatal_errno(__FILE__, __func__ , __LINE__, errno, 2);
        }

        server_info.sin_family = AF_INET;                         //Supports IPv4 (inet) addresses
        server_info.sin_port = htons(opts->port);             //Open on port 5000
        server_info.sin_addr.s_addr = inet_addr(opts->ip);        //Ip of server
        socklen_t server_info_len = sizeof(server_info);

        if(server_info.sin_addr.s_addr == (in_addr_t)-1)
        {
            fatal_errno(__FILE__, __func__ , __LINE__, errno, 2);
        }

        option = 1;
        setsockopt(opts->fd_in2, SOL_SOCKET, SO_REUSEADDR, &option, sizeof(option));

        result_bind = bind(opts->fd_in2, (struct sockaddr*) &server_info, server_info_len); //Bind the address struct to socket

        if(result_bind == -1)
        {
            fatal_errno(__FILE__, __func__ , __LINE__, errno, 2);
        }

        result_listen = listen(opts->fd_in2, BACKLOG);                                   //Listen for connections

        if(result_listen == -1)
        {
            fatal_errno(__FILE__, __func__ , __LINE__, errno, 2);
        }

        opts->fd_in = accept(opts->fd_in2, NULL, 0);                          //Accept the connection to client

        if(opts->fd_in == -1)
        {
            fatal_errno(__FILE__, __func__ , __LINE__, errno, 2);
        }
    }
}


static void cleanup(const struct options_server *opts)
{
    if(opts->file_name)
    {
        close(opts->fd_in);
    }
    else if(opts->ip)
    {
        close(opts->fd_in);
        close(opts->fd_in2);
    }
}
