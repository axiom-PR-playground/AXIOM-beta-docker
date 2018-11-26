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
    && pacman --noconfirm -S vim wget git sudo htop \
    && rm -rf \
      /var/cache/pacman/pkg/* \
      /var/lib/pacman/sync/* \
      /README \
      /etc/pacman.d/mirrorlist.pacnew
# Over-write again after the system upgrade
# This is currently used to fix empty CA certificate file problems after installing 'ca-certificates'
ADD additional/etc/ca-certificates /etc/ca-certificates

# Upgrade AXIOM built packages, i.e. linux kernel, FPGA IPs, boot binary
RUN : \
    && pacman --noconfirm -Syy \
    && pacman --noconfirm -R linux-zedboard \
    && pacman --noconfirm -S axiom-beta \
    && rm -rf \
      /var/cache/pacman/pkg/* \
      /var/lib/pacman/sync/*

CMD ["/bin/bash"]
