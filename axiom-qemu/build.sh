#!/bin/bash -e
SCRIPT_DIR=$(dirname ${BASH_SOURCE[0]})

# Enter the script directory
cd $SCRIPT_DIR

# Build the base container
docker build -f ./Dockerfile.base -t medicineyeh/axiom-qemu .
# Build the container with presets
docker build -f ./Dockerfile.axiom-beta -t medicineyeh/axiom-qemu:axiom-beta .
