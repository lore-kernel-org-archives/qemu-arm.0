Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ay18-20020a5d6f12000000b003143cb109d5sm2929399wrb.14.2023.09.25.07.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 07:48:55 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4EBD91FFBD;
	Mon, 25 Sep 2023 15:48:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	John Snow <jsnow@redhat.com>,
	libvir-list@redhat.com,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-s390x@nongnu.org,
	Song Gao <gaosong@loongson.cn>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Nicholas Piggin <npiggin@gmail.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Cleber Rosa <crosa@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bin Meng <bin.meng@windriver.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	qemu-ppc@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 02/31] tests/lcitool: add swtpm to the package list
Date: Mon, 25 Sep 2023 15:48:25 +0100
Message-Id: <20230925144854.1872513-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230925144854.1872513-1-alex.bennee@linaro.org>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Y4j8TWVS+K+A

We need this to test some TPM stuff.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/cirrus/macos-12.vars                    | 2 +-
 tests/docker/dockerfiles/alpine.docker               | 1 +
 tests/docker/dockerfiles/centos8.docker              | 1 +
 tests/docker/dockerfiles/debian-amd64-cross.docker   | 1 +
 tests/docker/dockerfiles/debian-amd64.docker         | 1 +
 tests/docker/dockerfiles/debian-arm64-cross.docker   | 1 +
 tests/docker/dockerfiles/debian-armhf-cross.docker   | 1 +
 tests/docker/dockerfiles/debian-ppc64el-cross.docker | 1 +
 tests/docker/dockerfiles/debian-s390x-cross.docker   | 1 +
 tests/docker/dockerfiles/fedora-win32-cross.docker   | 1 +
 tests/docker/dockerfiles/fedora-win64-cross.docker   | 1 +
 tests/docker/dockerfiles/fedora.docker               | 1 +
 tests/docker/dockerfiles/opensuse-leap.docker        | 1 +
 tests/docker/dockerfiles/ubuntu2204.docker           | 1 +
 tests/lcitool/libvirt-ci                             | 2 +-
 tests/lcitool/projects/qemu.yml                      | 1 +
 16 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/cirrus/macos-12.vars b/.gitlab-ci.d/cirrus/macos-12.vars
index 80eadaab29..5f3fb346d1 100644
--- a/.gitlab-ci.d/cirrus/macos-12.vars
+++ b/.gitlab-ci.d/cirrus/macos-12.vars
@@ -11,6 +11,6 @@ MAKE='/opt/homebrew/bin/gmake'
 NINJA='/opt/homebrew/bin/ninja'
 PACKAGING_COMMAND='brew'
 PIP3='/opt/homebrew/bin/pip3'
-PKGS='bash bc bison bzip2 capstone ccache cmocka ctags curl dbus diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson mtools ncurses nettle ninja pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy socat sparse spice-protocol tesseract usbredir vde vte3 xorriso zlib zstd'
+PKGS='bash bc bison bzip2 capstone ccache cmocka ctags curl dbus diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson mtools ncurses nettle ninja pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy socat sparse spice-protocol swtpm tesseract usbredir vde vte3 xorriso zlib zstd'
 PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme tomli'
 PYTHON='/opt/homebrew/bin/python3'
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index d25649cb4f..42f6928627 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -100,6 +100,7 @@ RUN apk update && \
         sparse \
         spice-dev \
         spice-protocol \
+        swtpm \
         tar \
         tesseract-ocr \
         usbredir-dev \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 68bfe606f5..d97c30e96a 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -107,6 +107,7 @@ RUN dnf distro-sync -y && \
         socat \
         spice-protocol \
         spice-server-devel \
+        swtpm \
         systemd-devel \
         systemtap-sdt-devel \
         tar \
diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker b/tests/docker/dockerfiles/debian-amd64-cross.docker
index 0991938595..00bdc06021 100644
--- a/tests/docker/dockerfiles/debian-amd64-cross.docker
+++ b/tests/docker/dockerfiles/debian-amd64-cross.docker
@@ -55,6 +55,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sed \
                       socat \
                       sparse \
+                      swtpm \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index 61dbc3ff24..9b50fb2f63 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -124,6 +124,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sed \
                       socat \
                       sparse \
+                      swtpm \
                       systemtap-sdt-dev \
                       tar \
                       tesseract-ocr \
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index 74eabb274e..2dae3777f7 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -55,6 +55,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sed \
                       socat \
                       sparse \
+                      swtpm \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index 1ebd6ebd00..180ed836e6 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -55,6 +55,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sed \
                       socat \
                       sparse \
+                      swtpm \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
index 59091fed02..d6be2f0cc5 100644
--- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
@@ -55,6 +55,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sed \
                       socat \
                       sparse \
+                      swtpm \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index 48b2f28310..ec0041d6aa 100644
--- a/tests/docker/dockerfiles/debian-s390x-cross.docker
+++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
@@ -55,6 +55,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sed \
                       socat \
                       sparse \
+                      swtpm \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index afa988574f..08799219f9 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -55,6 +55,7 @@ exec "$@"\n' > /usr/bin/nosync && \
                socat \
                sparse \
                spice-protocol \
+               swtpm \
                tar \
                tesseract \
                tesseract-langpack-eng \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index cf93a0ca60..f8e4cb70d3 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -55,6 +55,7 @@ exec "$@"\n' > /usr/bin/nosync && \
                socat \
                sparse \
                spice-protocol \
+               swtpm \
                tar \
                tesseract \
                tesseract-langpack-eng \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index f00e9e267c..9e9c71fa94 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -118,6 +118,7 @@ exec "$@"\n' > /usr/bin/nosync && \
                sparse \
                spice-protocol \
                spice-server-devel \
+               swtpm \
                systemd-devel \
                systemtap-sdt-devel \
                tar \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index ed04b4d6da..dc0e36ce48 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -100,6 +100,7 @@ RUN zypper update -y && \
            socat \
            sparse \
            spice-protocol-devel \
+           swtpm \
            systemd-devel \
            systemtap-sdt-devel \
            tar \
diff --git a/tests/docker/dockerfiles/ubuntu2204.docker b/tests/docker/dockerfiles/ubuntu2204.docker
index 94c2c16118..2ca9cff79c 100644
--- a/tests/docker/dockerfiles/ubuntu2204.docker
+++ b/tests/docker/dockerfiles/ubuntu2204.docker
@@ -124,6 +124,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sed \
                       socat \
                       sparse \
+                      swtpm \
                       systemtap-sdt-dev \
                       tar \
                       tesseract-ocr \
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index e3ed1e5da1..36bc517161 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit e3ed1e5da101943e53d8d89424e17b22120743f5
+Subproject commit 36bc517161c45ead20224d47f2dc4fa428af6724
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index 6f0885170d..82092c9f17 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -110,6 +110,7 @@ packages:
  - spice-protocol
  - spice-server
  - ssh-client
+ - swtpm
  - systemd
  - tar
  - tesseract
-- 
2.39.2
