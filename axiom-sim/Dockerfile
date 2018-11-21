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

CMD ["/bin/bash"]
