#! /bin/sh

testConnectivity() {
    waitForBGPRoute "192.168.3.0/24" "spine"
    waitForBGPRoute "192.168.4.0/24" "spine"
    
    # Verify connectivity
    docker exec "clab-${TOPOLOGY_NAME}-host_a" ping -c 3 -W 10 "192.168.4.2"
    assertTrue $?

    docker exec "clab-${TOPOLOGY_NAME}-host_b" ping -c 3 -W 10 "192.168.3.2"
    assertTrue $?
}

. "$(dirname "$0")/../test/lib.sh"
