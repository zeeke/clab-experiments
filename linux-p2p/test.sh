#! /bin/sh

testConnectivity() {
    docker exec "clab-${TOPOLOGY_NAME}-peer1" ping -c 3 -W 2 "192.168.1.2"
    assertTrue $?
}

. "$(dirname "$0")/../test/lib.sh"
