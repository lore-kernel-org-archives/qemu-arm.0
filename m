Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id y6-20020a1c4b06000000b003f17e37ce60sm1218590wma.47.2023.05.03.02.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 02:12:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D8CB21FFC9;
	Wed,  3 May 2023 10:12:46 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Juan Quintela <quintela@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Andrew Jeffery <andrew@aj.id.au>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Beraldo Leal <bleal@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	David Hildenbrand <david@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 18/22] scripts/ci: clean-up the 20.04/22.04 confusion in ansible
Date: Wed,  3 May 2023 10:12:40 +0100
Message-Id: <20230503091244.1450613-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091244.1450613-1-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: q4mNmuCbkCl/

We have a bunch of references to 20.04 (which s390x is still on)
although we are basically building on 22.04 now. Clean up the textual
references and use lcitool to generate the full package list to be
consistent.

We can drop "Install packages to build QEMU on Ubuntu on non-s390x" as
when we upgrade the s390x builder to 22.04 it won't need this
workaround.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .../custom-runners/ubuntu-22.04-aarch32.yml   |   2 +-
 .../custom-runners/ubuntu-22.04-aarch64.yml   |   4 +-
 scripts/ci/setup/build-environment.yml        | 111 ++++++++++++------
 3 files changed, 80 insertions(+), 37 deletions(-)

diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
index 50e5646a44..b8a0d75162 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
@@ -1,6 +1,6 @@
 # All ubuntu-22.04 jobs should run successfully in an environment
 # setup by the scripts/ci/setup/qemu/build-environment.yml task
-# "Install basic packages to build QEMU on Ubuntu 20.04"
+# "Install basic packages to build QEMU on Ubuntu 22.04"
 
 ubuntu-22.04-aarch32-all:
  extends: .custom_runner_template
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
index 13e14a0f87..57303c12e1 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
@@ -1,6 +1,6 @@
-# All ubuntu-20.04 jobs should run successfully in an environment
+# All ubuntu-22.04 jobs should run successfully in an environment
 # setup by the scripts/ci/setup/qemu/build-environment.yml task
-# "Install basic packages to build QEMU on Ubuntu 20.04"
+# "Install basic packages to build QEMU on Ubuntu 22.04"
 
 ubuntu-22.04-aarch64-all-linux-static:
  extends: .custom_runner_template
diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index 78b1021cd4..f344d1a850 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -24,7 +24,6 @@
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
         - ansible_facts['architecture'] == 'aarch64'
-        - ansible_facts['distribution_version'] == '20.04'
 
     - name: Update apt cache / upgrade packages via apt
       apt:
@@ -33,87 +32,131 @@
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
 
-    - name: Install basic packages to build QEMU on Ubuntu 20.04
+    # lcitool variables -f json ubuntu-2204 qemu | jq -r '.pkgs[]' | xargs -n 1 echo "-"
+    - name: Install basic packages to build QEMU on Ubuntu 22.04
       package:
         name:
+          - bash
+          - bc
+          - bison
+          - bsdextrautils
+          - bzip2
+          - ca-certificates
           - ccache
+          - clang
+          - dbus
+          - debianutils
+          - diffutils
+          - exuberant-ctags
+          - findutils
+          - flex
+          - g++
           - gcc
+          - gcovr
+          - genisoimage
           - gettext
           - git
-          - glusterfs-common
+          - hostname
           - libaio-dev
+          - libasan5
+          - libasound2-dev
           - libattr1-dev
+          - libbpf-dev
           - libbrlapi-dev
           - libbz2-dev
+          - libc6-dev
           - libcacard-dev
-          - libcapstone-dev
           - libcap-ng-dev
+          - libcapstone-dev
+          - libcmocka-dev
           - libcurl4-gnutls-dev
+          - libdaxctl-dev
           - libdrm-dev
           - libepoxy-dev
           - libfdt-dev
+          - libffi-dev
           - libgbm-dev
+          - libgcrypt20-dev
+          - libglib2.0-dev
+          - libglusterfs-dev
+          - libgnutls28-dev
           - libgtk-3-dev
+          - libibumad-dev
           - libibverbs-dev
           - libiscsi-dev
           - libjemalloc-dev
           - libjpeg-turbo8-dev
+          - libjson-c-dev
+          - liblttng-ust-dev
           - liblzo2-dev
-          - libncurses5-dev
           - libncursesw5-dev
           - libnfs-dev
-          - libnss3-dev
           - libnuma-dev
+          - libpam0g-dev
+          - libpcre2-dev
           - libpixman-1-dev
-          - librados-dev
+          - libpmem-dev
+          - libpng-dev
+          - libpulse-dev
           - librbd-dev
           - librdmacm-dev
           - libsasl2-dev
           - libsdl2-dev
+          - libsdl2-image-dev
           - libseccomp-dev
+          - libslirp-dev
           - libsnappy-dev
           - libspice-protocol-dev
+          - libspice-server-dev
           - libssh-dev
+          - libsystemd-dev
+          - libtasn1-6-dev
+          - libubsan1
+          - libudev-dev
+          - liburing-dev
           - libusb-1.0-0-dev
           - libusbredirhost-dev
           - libvdeplug-dev
+          - libvirglrenderer-dev
           - libvte-2.91-dev
+          - libxen-dev
+          - libxml2-dev
           - libzstd-dev
+          - llvm
+          - locales
           - make
-          - python3-yaml
+          - meson
+          - multipath-tools
+          - ncat
+          - nettle-dev
+          - ninja-build
+          - openssh-client
+          - pkgconf
+          - python3
+          - python3-numpy
+          - python3-opencv
+          - python3-pillow
+          - python3-pip
           - python3-sphinx
           - python3-sphinx-rtd-theme
-          - ninja-build
+          - python3-venv
+          - python3-yaml
+          - rpm2cpio
+          - sed
           - sparse
+          - systemtap-sdt-dev
+          - tar
+          - tesseract-ocr
+          - tesseract-ocr-eng
+          - texinfo
           - xfslibs-dev
+          - zlib1g-dev
         state: present
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['distribution_version'] == '22.04'
 
-    - name: Install packages to build QEMU on Ubuntu 20.04 on non-s390x
-      package:
-        name:
-          - libspice-server-dev
-          - libxen-dev
-        state: present
-      when:
-        - ansible_facts['distribution'] == 'Ubuntu'
-        - ansible_facts['architecture'] == 'aarch64' or ansible_facts['architecture'] == 'x86_64'
-
-    - name: Install basic packages to build QEMU on Ubuntu 20.04
-      package:
-        name:
-        # Originally from tests/docker/dockerfiles/ubuntu2004.docker
-          - clang-10
-          - genisoimage
-          - liblttng-ust-dev
-          - libslirp-dev
-          - netcat-openbsd
-      when:
-        - ansible_facts['distribution'] == 'Ubuntu'
-        - ansible_facts['distribution_version'] == '20.04'
-
-    - name: Install armhf cross-compile packages to build QEMU on AArch64 Ubuntu 20.04
+    - name: Install armhf cross-compile packages to build QEMU on AArch64 Ubuntu 22.04
       package:
         name:
           - binutils-arm-linux-gnueabihf
@@ -128,7 +171,7 @@
           - zlib1g-dev:armhf
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
-        - ansible_facts['distribution_version'] == '20.04'
+        - ansible_facts['distribution_version'] == '22.04'
         - ansible_facts['architecture'] == 'aarch64'
 
     - name: Enable EPEL repo on EL8
-- 
2.39.2
