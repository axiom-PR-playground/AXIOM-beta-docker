FROM axiom-sim
LABEL maintainer "medicineyeh"

RUN : \
    && pacman -Syy \
    && pacman -S --noconfirm \
        base-devel \
        bc \
        git \
        openssh \
        xmlto \
        kmod \
        inetutils \
    && rm -rf \
      /usr/share/man/* \
      /var/cache/pacman/pkg/* \
      /var/lib/pacman/sync/* \
      /README \
      /etc/pacman.d/mirrorlist.pacnew

CMD ["/bin/bash"]
