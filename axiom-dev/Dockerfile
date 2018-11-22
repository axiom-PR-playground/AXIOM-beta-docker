FROM medicineyeh/axiom-sim
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
      /var/cache/pacman/pkg/* \
      /var/lib/pacman/sync/*

CMD ["/bin/bash"]
