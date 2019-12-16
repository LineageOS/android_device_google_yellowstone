#include <cutils/sockets.h>

int socket_loopback_client(int port, int type)
{
    return socket_network_client("localhost", port, type);
}
