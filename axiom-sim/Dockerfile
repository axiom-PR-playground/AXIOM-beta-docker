FROM scratch
LABEL maintainer "medicineyeh"

ADD ArchLinuxARM-zedboard-latest.tar.gz /
ADD additional/ /

RUN ["/usr/bin/qemu-arm-static", "--version"]
RUN : \
    # chmod /etc, because during add, there is /etc/resolv.conf
    # mounted (and therefore /etc/ created with the umask of the host)
    # if the umask is not ``
    && chmod 755 /etc \
    && pacman-key --init \
    && pacman-key --populate archlinuxarm \
    && pacman --noconfirm -Syu \
    && pacman --noconfirm -S vim wget git sudo \
    && rm -rf \
      /usr/share/man/* \
      /var/cache/pacman/pkg/* \
      /var/lib/pacman/sync/* \
      /README \
      /etc/pacman.d/mirrorlist.pacnew
# Over-write again after the system upgrade
# This is currently used to fix empty CA certificate file problems after installing 'ca-certificates'
ADD additional/ /

# Upgrade AXIOM built packages, i.e. linux kernel, FPGA IPs, boot binary
RUN : \
    && cd /root \
    && wget -q https://github.com/axiom-PR-playground/AXIOM-beta-linux/releases/download/v4.6.0-0/linux-axiom-beta-4.6.0-0-any.pkg.tar.xz \
    && wget -q https://github.com/axiom-PR-playground/AXIOM-beta-linux/releases/download/v4.6.0-0/linux-axiom-beta-headers-4.6.0-0-any.pkg.tar.xz \
    && wget -q https://github.com/axiom-PR-playground/AXIOM-beta-Platform-Supports/releases/download/v0.1/FSBL-xilinx.v2018.2-0-any.pkg.tar.xz \
    && pacman -Syy \
    && pacman --noconfirm -R linux-zedboard \
    && pacman --noconfirm --force -U ./*.pkg.tar.xz \
    && rm ./*.pkg.tar.xz \
      /var/lib/pacman/sync/*


CMD ["/bin/bash"]
