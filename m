Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d259f56f6sm478231866b.81.2024.09.10.07.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 07:07:34 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B879D5F78C;
	Tue, 10 Sep 2024 15:07:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	Zhao Liu <zhao1.liu@intel.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	devel@lists.libvirt.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 01/26] tests/docker: remove debian-armel-cross
Date: Tue, 10 Sep 2024 15:07:08 +0100
Message-Id: <20240910140733.4007719-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910140733.4007719-1-alex.bennee@linaro.org>
References: <20240910140733.4007719-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: R1z+9VdcR0UE

As debian-11 transitions to LTS we are starting to have problems
building the image. While we could update to a later Debian building a
32 bit QEMU without modern floating point is niche host amongst the
few remaining 32 bit hosts we regularly build for. For now we still
have armhf-debian-cross-container which is currently built from the
more recent debian-12.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-cross.yml              |   6 -
 .gitlab-ci.d/crossbuilds.yml                  |   7 -
 .../dockerfiles/debian-armel-cross.docker     | 179 ------------------
 tests/lcitool/refresh                         |   6 -
 4 files changed, 198 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/debian-armel-cross.docker

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index e3103940a0..9a3ebd885e 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -22,12 +22,6 @@ arm64-debian-cross-container:
   variables:
     NAME: debian-arm64-cross
 
-armel-debian-cross-container:
-  extends: .container_job_template
-  stage: containers
-  variables:
-    NAME: debian-armel-cross
-
 armhf-debian-cross-container:
   extends: .container_job_template
   stage: containers
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index cb499e4ee0..459273f9da 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -1,13 +1,6 @@
 include:
   - local: '/.gitlab-ci.d/crossbuild-template.yml'
 
-cross-armel-user:
-  extends: .cross_user_build_job
-  needs:
-    job: armel-debian-cross-container
-  variables:
-    IMAGE: debian-armel-cross
-
 cross-armhf-user:
   extends: .cross_user_build_job
   needs:
diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker b/tests/docker/dockerfiles/debian-armel-cross.docker
deleted file mode 100644
index 8476fc8cce..0000000000
--- a/tests/docker/dockerfiles/debian-armel-cross.docker
+++ /dev/null
@@ -1,179 +0,0 @@
-# THIS FILE WAS AUTO-GENERATED
-#
-#  $ lcitool dockerfile --layers all --cross-arch armv6l debian-11 qemu
-#
-# https://gitlab.com/libvirt/libvirt-ci
-
-FROM docker.io/library/debian:11-slim
-
-RUN export DEBIAN_FRONTEND=noninteractive && \
-    apt-get update && \
-    apt-get install -y eatmydata && \
-    eatmydata apt-get dist-upgrade -y && \
-    eatmydata apt-get install --no-install-recommends -y \
-                      bash \
-                      bc \
-                      bison \
-                      bsdextrautils \
-                      bzip2 \
-                      ca-certificates \
-                      ccache \
-                      dbus \
-                      debianutils \
-                      diffutils \
-                      exuberant-ctags \
-                      findutils \
-                      flex \
-                      gcc \
-                      gcovr \
-                      gettext \
-                      git \
-                      hostname \
-                      libglib2.0-dev \
-                      libgtk-vnc-2.0-dev \
-                      libpcre2-dev \
-                      libsndio-dev \
-                      libspice-protocol-dev \
-                      llvm \
-                      locales \
-                      make \
-                      meson \
-                      mtools \
-                      ncat \
-                      ninja-build \
-                      openssh-client \
-                      pkgconf \
-                      python3 \
-                      python3-numpy \
-                      python3-opencv \
-                      python3-pillow \
-                      python3-pip \
-                      python3-setuptools \
-                      python3-sphinx \
-                      python3-sphinx-rtd-theme \
-                      python3-venv \
-                      python3-wheel \
-                      python3-yaml \
-                      rpm2cpio \
-                      sed \
-                      socat \
-                      sparse \
-                      tar \
-                      tesseract-ocr \
-                      tesseract-ocr-eng \
-                      xorriso \
-                      zstd && \
-    eatmydata apt-get autoremove -y && \
-    eatmydata apt-get autoclean -y && \
-    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
-    dpkg-reconfigure locales && \
-    rm -f /usr/lib*/python3*/EXTERNALLY-MANAGED
-
-RUN /usr/bin/pip3 install tomli
-
-ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
-ENV LANG "en_US.UTF-8"
-ENV MAKE "/usr/bin/make"
-ENV NINJA "/usr/bin/ninja"
-ENV PYTHON "/usr/bin/python3"
-
-RUN export DEBIAN_FRONTEND=noninteractive && \
-    dpkg --add-architecture armel && \
-    eatmydata apt-get update && \
-    eatmydata apt-get dist-upgrade -y && \
-    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
-    eatmydata apt-get install --no-install-recommends -y \
-                      gcc-arm-linux-gnueabi \
-                      libaio-dev:armel \
-                      libasan6:armel \
-                      libasound2-dev:armel \
-                      libattr1-dev:armel \
-                      libbpf-dev:armel \
-                      libbrlapi-dev:armel \
-                      libbz2-dev:armel \
-                      libc6-dev:armel \
-                      libcacard-dev:armel \
-                      libcap-ng-dev:armel \
-                      libcapstone-dev:armel \
-                      libcmocka-dev:armel \
-                      libcurl4-gnutls-dev:armel \
-                      libdaxctl-dev:armel \
-                      libdrm-dev:armel \
-                      libepoxy-dev:armel \
-                      libfdt-dev:armel \
-                      libffi-dev:armel \
-                      libfuse3-dev:armel \
-                      libgbm-dev:armel \
-                      libgcrypt20-dev:armel \
-                      libglib2.0-dev:armel \
-                      libglusterfs-dev:armel \
-                      libgnutls28-dev:armel \
-                      libgtk-3-dev:armel \
-                      libibverbs-dev:armel \
-                      libiscsi-dev:armel \
-                      libjemalloc-dev:armel \
-                      libjpeg62-turbo-dev:armel \
-                      libjson-c-dev:armel \
-                      liblttng-ust-dev:armel \
-                      liblzo2-dev:armel \
-                      libncursesw5-dev:armel \
-                      libnfs-dev:armel \
-                      libnuma-dev:armel \
-                      libpam0g-dev:armel \
-                      libpipewire-0.3-dev:armel \
-                      libpixman-1-dev:armel \
-                      libpng-dev:armel \
-                      libpulse-dev:armel \
-                      librbd-dev:armel \
-                      librdmacm-dev:armel \
-                      libsasl2-dev:armel \
-                      libsdl2-dev:armel \
-                      libsdl2-image-dev:armel \
-                      libseccomp-dev:armel \
-                      libselinux1-dev:armel \
-                      libslirp-dev:armel \
-                      libsnappy-dev:armel \
-                      libspice-server-dev:armel \
-                      libssh-gcrypt-dev:armel \
-                      libsystemd-dev:armel \
-                      libtasn1-6-dev:armel \
-                      libubsan1:armel \
-                      libudev-dev:armel \
-                      liburing-dev:armel \
-                      libusb-1.0-0-dev:armel \
-                      libusbredirhost-dev:armel \
-                      libvdeplug-dev:armel \
-                      libvirglrenderer-dev:armel \
-                      libvte-2.91-dev:armel \
-                      libzstd-dev:armel \
-                      nettle-dev:armel \
-                      systemtap-sdt-dev:armel \
-                      zlib1g-dev:armel && \
-    eatmydata apt-get autoremove -y && \
-    eatmydata apt-get autoclean -y && \
-    mkdir -p /usr/local/share/meson/cross && \
-    printf "[binaries]\n\
-c = '/usr/bin/arm-linux-gnueabi-gcc'\n\
-ar = '/usr/bin/arm-linux-gnueabi-gcc-ar'\n\
-strip = '/usr/bin/arm-linux-gnueabi-strip'\n\
-pkgconfig = '/usr/bin/arm-linux-gnueabi-pkg-config'\n\
-\n\
-[host_machine]\n\
-system = 'linux'\n\
-cpu_family = 'arm'\n\
-cpu = 'arm'\n\
-endian = 'little'\n" > /usr/local/share/meson/cross/arm-linux-gnueabi && \
-    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
-    mkdir -p /usr/libexec/ccache-wrappers && \
-    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabi-cc && \
-    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabi-gcc
-
-ENV ABI "arm-linux-gnueabi"
-ENV MESON_OPTS "--cross-file=arm-linux-gnueabi"
-ENV QEMU_CONFIGURE_OPTS --cross-prefix=arm-linux-gnueabi-
-ENV DEF_TARGET_LIST arm-softmmu,arm-linux-user,armeb-linux-user
-# As a final step configure the user (if env is defined)
-ARG USER
-ARG UID
-RUN if [ "${USER}" ]; then \
-  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index ac803e34f1..199d5fad87 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -154,12 +154,6 @@ try:
                         trailer=cross_build("aarch64-linux-gnu-",
                                             "aarch64-softmmu,aarch64-linux-user"))
 
-    # migration to bookworm stalled: https://lists.debian.org/debian-arm/2023/09/msg00006.html
-    generate_dockerfile("debian-armel-cross", "debian-11",
-                        cross="armv6l",
-                        trailer=cross_build("arm-linux-gnueabi-",
-                                            "arm-softmmu,arm-linux-user,armeb-linux-user"))
-
     generate_dockerfile("debian-armhf-cross", "debian-12",
                         cross="armv7l",
                         trailer=cross_build("arm-linux-gnueabihf-",
-- 
2.39.2
