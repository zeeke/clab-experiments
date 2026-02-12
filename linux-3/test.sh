#! /bin/sh

testConnectivity() {
    docker exec "clab-${TOPOLOGY_NAME}-n1" ping -c 3 -W 2 "192.168.3.3"
    assertTrue $?
}

. "$(dirname "$0")/../test/lib.sh"
