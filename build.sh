#!/usr/bin/bash

# Build the base container first
(cd axiom-sim && docker build -t medicineyeh/axiom-sim .)
# Build the second container which is based on the axiom-sim
(cd axiom-dev && docker build -t medicineyeh/axiom-dev .)

# Build the QEMU container
(cd axiom-qemu && ./build.sh)
# Build the second container which is based on the axiom-sim
(cd axiom-pkgbuild && docker build -t medicineyeh/axiom-pkgbuild .)
