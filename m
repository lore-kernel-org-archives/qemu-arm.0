Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04d954fsm9279647f8f.52.2024.06.03.10.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 10:53:35 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A5FD55F860;
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
Subject: [PATCH v3 11/12] tests/lcitool: generate package lists for ansible
Date: Mon,  3 Jun 2024 18:53:27 +0100
Message-Id: <20240603175328.3823123-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240603175328.3823123-1-alex.bennee@linaro.org>
References: <20240603175328.3823123-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: aTLX6a5sNqKy

With the new ability to output YAML we can build the package list for
our ansible setup scripts. We will integrate them in the next commit.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20240529160934.982373-9-alex.bennee@linaro.org>

---
v2
  - MR now merged into libvirt-ci
---
 .../ci/setup/ubuntu/ubuntu-2204-aarch64.yaml  | 127 ++++++++++++++++++
 .../setup/ubuntu/ubuntu-2204-armhf-cross.yml  | 127 ++++++++++++++++++
 .../ci/setup/ubuntu/ubuntu-2204-s390x.yaml    | 125 +++++++++++++++++
 tests/lcitool/refresh                         |  16 ++-
 4 files changed, 394 insertions(+), 1 deletion(-)
 create mode 100644 scripts/ci/setup/ubuntu/ubuntu-2204-aarch64.yaml
 create mode 100644 scripts/ci/setup/ubuntu/ubuntu-2204-armhf-cross.yml
 create mode 100644 scripts/ci/setup/ubuntu/ubuntu-2204-s390x.yaml

diff --git a/scripts/ci/setup/ubuntu/ubuntu-2204-aarch64.yaml b/scripts/ci/setup/ubuntu/ubuntu-2204-aarch64.yaml
new file mode 100644
index 0000000000..8d7d8725fb
--- /dev/null
+++ b/scripts/ci/setup/ubuntu/ubuntu-2204-aarch64.yaml
@@ -0,0 +1,127 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool variables --host-arch aarch64 ubuntu-2204 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+packages:
+  - bash
+  - bc
+  - bison
+  - bsdextrautils
+  - bzip2
+  - ca-certificates
+  - ccache
+  - clang
+  - dbus
+  - debianutils
+  - diffutils
+  - exuberant-ctags
+  - findutils
+  - flex
+  - gcc
+  - gcovr
+  - gettext
+  - git
+  - hostname
+  - libaio-dev
+  - libasan6
+  - libasound2-dev
+  - libattr1-dev
+  - libbpf-dev
+  - libbrlapi-dev
+  - libbz2-dev
+  - libc6-dev
+  - libcacard-dev
+  - libcap-ng-dev
+  - libcapstone-dev
+  - libcmocka-dev
+  - libcurl4-gnutls-dev
+  - libdaxctl-dev
+  - libdrm-dev
+  - libepoxy-dev
+  - libfdt-dev
+  - libffi-dev
+  - libfuse3-dev
+  - libgbm-dev
+  - libgcrypt20-dev
+  - libglib2.0-dev
+  - libglusterfs-dev
+  - libgnutls28-dev
+  - libgtk-3-dev
+  - libibumad-dev
+  - libibverbs-dev
+  - libiscsi-dev
+  - libjemalloc-dev
+  - libjpeg-turbo8-dev
+  - libjson-c-dev
+  - liblttng-ust-dev
+  - liblzo2-dev
+  - libncursesw5-dev
+  - libnfs-dev
+  - libnuma-dev
+  - libpam0g-dev
+  - libpcre2-dev
+  - libpipewire-0.3-dev
+  - libpixman-1-dev
+  - libpng-dev
+  - libpulse-dev
+  - librbd-dev
+  - librdmacm-dev
+  - libsasl2-dev
+  - libsdl2-dev
+  - libsdl2-image-dev
+  - libseccomp-dev
+  - libselinux1-dev
+  - libslirp-dev
+  - libsnappy-dev
+  - libsndio-dev
+  - libspice-protocol-dev
+  - libspice-server-dev
+  - libssh-dev
+  - libsystemd-dev
+  - libtasn1-6-dev
+  - libubsan1
+  - libudev-dev
+  - liburing-dev
+  - libusb-1.0-0-dev
+  - libusbredirhost-dev
+  - libvdeplug-dev
+  - libvirglrenderer-dev
+  - libvte-2.91-dev
+  - libxen-dev
+  - libzstd-dev
+  - llvm
+  - locales
+  - make
+  - meson
+  - mtools
+  - multipath-tools
+  - ncat
+  - nettle-dev
+  - ninja-build
+  - openssh-client
+  - pkgconf
+  - python3
+  - python3-numpy
+  - python3-opencv
+  - python3-pillow
+  - python3-pip
+  - python3-sphinx
+  - python3-sphinx-rtd-theme
+  - python3-tomli
+  - python3-venv
+  - python3-yaml
+  - rpm2cpio
+  - sed
+  - socat
+  - sparse
+  - swtpm
+  - systemtap-sdt-dev
+  - tar
+  - tesseract-ocr
+  - tesseract-ocr-eng
+  - xorriso
+  - zlib1g-dev
+  - zstd
+
diff --git a/scripts/ci/setup/ubuntu/ubuntu-2204-armhf-cross.yml b/scripts/ci/setup/ubuntu/ubuntu-2204-armhf-cross.yml
new file mode 100644
index 0000000000..0cc34cd10b
--- /dev/null
+++ b/scripts/ci/setup/ubuntu/ubuntu-2204-armhf-cross.yml
@@ -0,0 +1,127 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool variables --cross-arch armv7l ubuntu-2204 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+packages:
+  - bash
+  - bc
+  - bison
+  - bsdextrautils
+  - bzip2
+  - ca-certificates
+  - ccache
+  - dbus
+  - debianutils
+  - diffutils
+  - exuberant-ctags
+  - findutils
+  - flex
+  - gcc
+  - gcovr
+  - gettext
+  - git
+  - hostname
+  - libglib2.0-dev
+  - libpcre2-dev
+  - libsndio-dev
+  - libspice-protocol-dev
+  - llvm
+  - locales
+  - make
+  - meson
+  - mtools
+  - ncat
+  - ninja-build
+  - openssh-client
+  - pkgconf
+  - python3
+  - python3-numpy
+  - python3-opencv
+  - python3-pillow
+  - python3-pip
+  - python3-sphinx
+  - python3-sphinx-rtd-theme
+  - python3-tomli
+  - python3-venv
+  - python3-yaml
+  - rpm2cpio
+  - sed
+  - socat
+  - sparse
+  - swtpm
+  - tar
+  - tesseract-ocr
+  - tesseract-ocr-eng
+  - xorriso
+  - zstd
+  - gcc-arm-linux-gnueabihf
+  - libaio-dev:armhf
+  - libasan6:armhf
+  - libasound2-dev:armhf
+  - libattr1-dev:armhf
+  - libbpf-dev:armhf
+  - libbrlapi-dev:armhf
+  - libbz2-dev:armhf
+  - libc6-dev:armhf
+  - libcacard-dev:armhf
+  - libcap-ng-dev:armhf
+  - libcapstone-dev:armhf
+  - libcmocka-dev:armhf
+  - libcurl4-gnutls-dev:armhf
+  - libdaxctl-dev:armhf
+  - libdrm-dev:armhf
+  - libepoxy-dev:armhf
+  - libfdt-dev:armhf
+  - libffi-dev:armhf
+  - libfuse3-dev:armhf
+  - libgbm-dev:armhf
+  - libgcrypt20-dev:armhf
+  - libglib2.0-dev:armhf
+  - libglusterfs-dev:armhf
+  - libgnutls28-dev:armhf
+  - libgtk-3-dev:armhf
+  - libibumad-dev:armhf
+  - libibverbs-dev:armhf
+  - libiscsi-dev:armhf
+  - libjemalloc-dev:armhf
+  - libjpeg-turbo8-dev:armhf
+  - libjson-c-dev:armhf
+  - liblttng-ust-dev:armhf
+  - liblzo2-dev:armhf
+  - libncursesw5-dev:armhf
+  - libnfs-dev:armhf
+  - libnuma-dev:armhf
+  - libpam0g-dev:armhf
+  - libpipewire-0.3-dev:armhf
+  - libpixman-1-dev:armhf
+  - libpng-dev:armhf
+  - libpulse-dev:armhf
+  - librbd-dev:armhf
+  - librdmacm-dev:armhf
+  - libsasl2-dev:armhf
+  - libsdl2-dev:armhf
+  - libsdl2-image-dev:armhf
+  - libseccomp-dev:armhf
+  - libselinux1-dev:armhf
+  - libslirp-dev:armhf
+  - libsnappy-dev:armhf
+  - libspice-server-dev:armhf
+  - libssh-dev:armhf
+  - libsystemd-dev:armhf
+  - libtasn1-6-dev:armhf
+  - libubsan1:armhf
+  - libudev-dev:armhf
+  - liburing-dev:armhf
+  - libusb-1.0-0-dev:armhf
+  - libusbredirhost-dev:armhf
+  - libvdeplug-dev:armhf
+  - libvirglrenderer-dev:armhf
+  - libvte-2.91-dev:armhf
+  - libxen-dev:armhf
+  - libzstd-dev:armhf
+  - nettle-dev:armhf
+  - systemtap-sdt-dev:armhf
+  - zlib1g-dev:armhf
+
diff --git a/scripts/ci/setup/ubuntu/ubuntu-2204-s390x.yaml b/scripts/ci/setup/ubuntu/ubuntu-2204-s390x.yaml
new file mode 100644
index 0000000000..16050a5058
--- /dev/null
+++ b/scripts/ci/setup/ubuntu/ubuntu-2204-s390x.yaml
@@ -0,0 +1,125 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool variables --host-arch s390x ubuntu-2204 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+packages:
+  - bash
+  - bc
+  - bison
+  - bsdextrautils
+  - bzip2
+  - ca-certificates
+  - ccache
+  - clang
+  - dbus
+  - debianutils
+  - diffutils
+  - exuberant-ctags
+  - findutils
+  - flex
+  - gcc
+  - gcovr
+  - gettext
+  - git
+  - hostname
+  - libaio-dev
+  - libasan6
+  - libasound2-dev
+  - libattr1-dev
+  - libbpf-dev
+  - libbrlapi-dev
+  - libbz2-dev
+  - libc6-dev
+  - libcacard-dev
+  - libcap-ng-dev
+  - libcapstone-dev
+  - libcmocka-dev
+  - libcurl4-gnutls-dev
+  - libdaxctl-dev
+  - libdrm-dev
+  - libepoxy-dev
+  - libfdt-dev
+  - libffi-dev
+  - libfuse3-dev
+  - libgbm-dev
+  - libgcrypt20-dev
+  - libglib2.0-dev
+  - libglusterfs-dev
+  - libgnutls28-dev
+  - libgtk-3-dev
+  - libibumad-dev
+  - libibverbs-dev
+  - libiscsi-dev
+  - libjemalloc-dev
+  - libjpeg-turbo8-dev
+  - libjson-c-dev
+  - liblttng-ust-dev
+  - liblzo2-dev
+  - libncursesw5-dev
+  - libnfs-dev
+  - libnuma-dev
+  - libpam0g-dev
+  - libpcre2-dev
+  - libpipewire-0.3-dev
+  - libpixman-1-dev
+  - libpng-dev
+  - libpulse-dev
+  - librbd-dev
+  - librdmacm-dev
+  - libsasl2-dev
+  - libsdl2-dev
+  - libsdl2-image-dev
+  - libseccomp-dev
+  - libselinux1-dev
+  - libslirp-dev
+  - libsnappy-dev
+  - libsndio-dev
+  - libspice-protocol-dev
+  - libssh-dev
+  - libsystemd-dev
+  - libtasn1-6-dev
+  - libubsan1
+  - libudev-dev
+  - liburing-dev
+  - libusb-1.0-0-dev
+  - libusbredirhost-dev
+  - libvdeplug-dev
+  - libvirglrenderer-dev
+  - libvte-2.91-dev
+  - libzstd-dev
+  - llvm
+  - locales
+  - make
+  - meson
+  - mtools
+  - multipath-tools
+  - ncat
+  - nettle-dev
+  - ninja-build
+  - openssh-client
+  - pkgconf
+  - python3
+  - python3-numpy
+  - python3-opencv
+  - python3-pillow
+  - python3-pip
+  - python3-sphinx
+  - python3-sphinx-rtd-theme
+  - python3-tomli
+  - python3-venv
+  - python3-yaml
+  - rpm2cpio
+  - sed
+  - socat
+  - sparse
+  - swtpm
+  - systemtap-sdt-dev
+  - tar
+  - tesseract-ocr
+  - tesseract-ocr-eng
+  - xorriso
+  - zlib1g-dev
+  - zstd
+
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 9d8e9c6a4a..b25e3ac4dd 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -80,7 +80,7 @@ def generate_dockerfile(host, target, project="qemu", cross=None, trailer=None):
 
 def generate_cirrus(target, trailer=None):
     filename = Path(src_dir, ".gitlab-ci.d", "cirrus", target + ".vars")
-    cmd = lcitool_cmd + ["variables", target, "qemu"]
+    cmd = lcitool_cmd + ["variables", "--format", "shell", target, "qemu"]
     generate(filename, cmd, trailer)
 
 
@@ -90,6 +90,13 @@ def generate_pkglist(vm, target):
     generate(filename, cmd, None)
 
 
+def generate_yaml(os, target, arch, trailer=None):
+    filename = Path(src_dir, "scripts", "ci", "setup", os, f"{target}-{arch}.yaml")
+    cmd = lcitool_cmd + ["variables", "--format", "yaml", "-a",
+                         arch, target, "qemu"]
+    generate(filename, cmd, trailer)
+
+
 # Netmap still needs to be manually built as it is yet to be packaged
 # into a distro. We also add cscope and gtags which are used in the CI
 # test
@@ -209,6 +216,13 @@ try:
     #
     generate_pkglist("freebsd", "freebsd-13")
 
+    #
+    # Ansible package lists
+    #
+    generate_yaml("ubuntu", "ubuntu-2204", "aarch64")
+    generate_yaml("ubuntu", "ubuntu-2204", "s390x")
+
+
     sys.exit(0)
 except Exception as ex:
     print(str(ex), file=sys.stderr)
-- 
2.39.2
