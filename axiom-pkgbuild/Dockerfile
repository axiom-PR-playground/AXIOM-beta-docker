# Arch Linux with base-devel package groups
FROM base/devel
LABEL maintainer "medicineyeh"

ENV ARCH=arm
ENV CROSS_COMPILE=arm-linux-gnueabi-
ENV linarolink="https://releases.linaro.org/components/toolchain/binaries/7.3-2018.05/arm-linux-gnueabi/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabi.tar.xz"

COPY additional /

RUN : \
    && pacman -Syy \
    && pacman -S --noconfirm \
        bc \
        git \
        wget \
        sudo \
        openssh \
        xmlto \
        kmod \
        inetutils \
        dtc \
    && rm -rf \
      /usr/share/man/* \
      /var/cache/pacman/pkg/* \
      /README \
      /etc/pacman.d/mirrorlist.pacnew

RUN : \
    && cd /root \
    && wget -q -O arm-linux-gnueabi.tar.xz $linarolink \
    && wget -q -O arm-linux-gnueabi.tar.xz.asc $linarolink.asc \
    && CHK_SUM1=$(md5sum arm-linux-gnueabi.tar.xz | cut -d ' ' -f 1) \
    && CHK_SUM2=$(cat arm-linux-gnueabi.tar.xz.asc | cut -d ' ' -f 1) \
    && [[ "$CHK_SUM1" == "$CHK_SUM2" ]] \
    && tar -xf arm-linux-gnueabi.tar.xz -C /usr/local --strip-components=1 \
    && rm -rf arm-linux-gnueabi.tar.xz

RUN mkdir /workdir

WORKDIR /workdir
CMD ["/bin/makepkg", "-f"]
