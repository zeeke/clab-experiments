#! /bin/sh

TOPOLOGY_DIR=$(dirname "$0")
TOPOLOGY_FILE=`ls "${TOPOLOGY_DIR}"/*.clab.yml`
export TOPOLOGY_NAME="unknown"

setUp() {
    echo "Setting up test environment"
    containerlab deploy -t "${TOPOLOGY_FILE}" --reconfigure
    TOPOLOGY_NAME=$(containerlab inspect -t "${TOPOLOGY_FILE}" --details --log-level error | jq -r 'keys[0]')
}

tearDown() {
    echo "Tearing down test environment"
    containerlab destroy -t "${TOPOLOGY_FILE}" --cleanup
}

. "$(dirname "${BASH_SOURCE[0]}")/shunit2"
