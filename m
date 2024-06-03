Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04d9c89sm9324185f8f.60.2024.06.03.10.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 10:53:35 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id C10975FA08;
	Mon,  3 Jun 2024 18:53:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	qemu-s390x@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Radoslaw Biernacki <rad@semihalf.com>
Subject: [PATCH v3 12/12] scripts/ci: drive ubuntu/build-environment.yml from lcitool
Date: Mon,  3 Jun 2024 18:53:28 +0100
Message-Id: <20240603175328.3823123-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240603175328.3823123-1-alex.bennee@linaro.org>
References: <20240603175328.3823123-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: That+R9FD6tN

Now lcitool can write the package list for us we no longer need to
duplicate the information directly in build-environment.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20240529160934.982373-10-alex.bennee@linaro.org>
---
 scripts/ci/setup/ubuntu/build-environment.yml | 131 +-----------------
 1 file changed, 7 insertions(+), 124 deletions(-)

diff --git a/scripts/ci/setup/ubuntu/build-environment.yml b/scripts/ci/setup/ubuntu/build-environment.yml
index e82097b465..edf1900b3e 100644
--- a/scripts/ci/setup/ubuntu/build-environment.yml
+++ b/scripts/ci/setup/ubuntu/build-environment.yml
@@ -32,135 +32,18 @@
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
 
-    # lcitool variables -f json ubuntu-2204 qemu | jq -r '.pkgs[]' | xargs -n 1 echo "-"
-    - name: Install basic packages to build QEMU on Ubuntu 22.04
-      package:
-        name:
-          - bash
-          - bc
-          - bison
-          - bsdextrautils
-          - bzip2
-          - ca-certificates
-          - ccache
-          - clang
-          - dbus
-          - debianutils
-          - diffutils
-          - exuberant-ctags
-          - findutils
-          - flex
-          - g++
-          - gcc
-          - gcovr
-          - genisoimage
-          - gettext
-          - git
-          - hostname
-          - libaio-dev
-          - libasan5
-          - libasound2-dev
-          - libattr1-dev
-          - libbpf-dev
-          - libbrlapi-dev
-          - libbz2-dev
-          - libc6-dev
-          - libcacard-dev
-          - libcap-ng-dev
-          - libcapstone-dev
-          - libcmocka-dev
-          - libcurl4-gnutls-dev
-          - libdaxctl-dev
-          - libdrm-dev
-          - libepoxy-dev
-          - libfdt-dev
-          - libffi-dev
-          - libgbm-dev
-          - libgcrypt20-dev
-          - libglib2.0-dev
-          - libglusterfs-dev
-          - libgnutls28-dev
-          - libgtk-3-dev
-          - libibumad-dev
-          - libibverbs-dev
-          - libiscsi-dev
-          - libjemalloc-dev
-          - libjpeg-turbo8-dev
-          - libjson-c-dev
-          - liblttng-ust-dev
-          - liblzo2-dev
-          - libncursesw5-dev
-          - libnfs-dev
-          - libnuma-dev
-          - libpam0g-dev
-          - libpcre2-dev
-          - libpixman-1-dev
-          - libpng-dev
-          - libpulse-dev
-          - librbd-dev
-          - librdmacm-dev
-          - libsasl2-dev
-          - libsdl2-dev
-          - libsdl2-image-dev
-          - libseccomp-dev
-          - libslirp-dev
-          - libsnappy-dev
-          - libspice-protocol-dev
-          - libssh-dev
-          - libsystemd-dev
-          - libtasn1-6-dev
-          - libubsan1
-          - libudev-dev
-          - liburing-dev
-          - libusb-1.0-0-dev
-          - libusbredirhost-dev
-          - libvdeplug-dev
-          - libvirglrenderer-dev
-          - libvte-2.91-dev
-          - libxml2-dev
-          - libzstd-dev
-          - llvm
-          - locales
-          - make
-          - meson
-          - multipath-tools
-          - ncat
-          - nettle-dev
-          - ninja-build
-          - openssh-client
-          - pkgconf
-          - python3
-          - python3-numpy
-          - python3-opencv
-          - python3-pillow
-          - python3-pip
-          - python3-sphinx
-          - python3-sphinx-rtd-theme
-          - python3-venv
-          - python3-yaml
-          - rpm2cpio
-          - sed
-          - sparse
-          - systemtap-sdt-dev
-          - tar
-          - tesseract-ocr
-          - tesseract-ocr-eng
-          - texinfo
-          - xfslibs-dev
-          - zlib1g-dev
-        state: present
+    # the package lists are updated by "make lcitool-refresh"
+    - name: Include package lists based on OS and architecture
+      include_vars:
+        file: "ubuntu-2204-{{ ansible_facts['architecture'] }}.yaml"
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
         - ansible_facts['distribution_version'] == '22.04'
+        - ansible_facts['architecture'] == 'aarch64' or ansible_facts['architecture'] == 'x86_64'
 
-    # not all packages are available for all architectures
-    - name: Install additional packages to build QEMU on Ubuntu 22.04
+    - name: Install packages for QEMU on Ubuntu 22.04
       package:
-        name:
-          - libpmem-dev
-          - libspice-server-dev
-          - libxen-dev
-        state: present
+        name: "{{ packages }}"
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
         - ansible_facts['distribution_version'] == '22.04'
-- 
2.39.2
