#!/usr/bin/bash

# Build the base container first
(cd axiom-sim && docker build -t medicineyeh/axiom-sim .)
# Build the second container which is based on the axiom-sim
(cd axiom-dev && docker build -t medicineyeh/axiom-dev .)
