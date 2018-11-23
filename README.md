# AXIOM-beta-docker
This repo contains the docker files for AXIOM projects.
* __axiom-sim__ is a user level application simulation for running AXIOM beta environment. It is very convenient for testing.
* __axiom-dev__ is a user level application simulation for developments. It is very convenient for building custom program and kernel modules.
* __axiom-qemu__ is a full simulation (including the FPGA IPs, on-going) environment. It is used for testing the kernel modules and the real interaction to hardwares.
* __axiom-pkgbuild__ is a x86_64 environment for building packages in [AXIOM-packages](https://github.com/axiom-PR-playground/AXIOM-packages). It can also be used for building custom programs and kernel modules if you know how to cross-compile your application. Two environment variables are set in this container, `ARCH=arm` and `CROSS_COMPILE=arm-linux-gnueabi-`. The compiler version is gcc-7.3 from Linaro, one of the best ARM-utility provider.

# Build and Publish/Release
```
# Build all the containers
./build.sh
# Release the containers for users
docker push medicineyeh/axiom-sim
docker push medicineyeh/axiom-dev
docker push medicineyeh/axiom-qemu
docker push medicineyeh/axiom-pkgbuild
```

## Build individual docker container
1. Enter the sub directory
2. Run `docker build -t {Name} .`

# axiom-qemu Dockerfiles
This docker container has serveral files for different presets of QEMU.
The __Dockerfile.base__ is for building the basic QEMU exeutable without a entry point and any config files/binaries.
As for __Dockerfile.axiom-beta__, it is based on the base container and add presets for a specific target platform, AXIOM beta. The entry point is also set up for ease of use.

To manage the different versions of presets, we use tag of the container to identiy the presets. So, one can run `docker run axiom-qemu:latest` for the base container and `docker run axiom-qemu:axiom-beta` for the AXIOM beta preset.
