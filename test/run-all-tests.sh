#! /bin/sh

set -e
for d in */ ; do
    if [ -f "$d/test.sh" ]; then
        echo "Running test: $d/test.sh"
        bash "$d/test.sh"
    fi
done
