Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c847d7fsm52703371f8f.60.2025.01.08.04.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:18:02 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 226965FD97;
	Wed,  8 Jan 2025 12:10:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	qemu-riscv@nongnu.org,
	Radoslaw Biernacki <rad@semihalf.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Laurent Vivier <lvivier@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Bernhard Beschow <shentey@gmail.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	John Snow <jsnow@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Alistair Francis <alistair.francis@wdc.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Cleber Rosa <crosa@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-s390x@nongnu.org,
	Eric Farman <farman@linux.ibm.com>,
	Weiwei Li <liwei1518@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Li-Wen Hsu <lwhsu@freebsd.org>
Subject: [PATCH v4 26/32] tests/lcitool: remove temp workaround for debian mips64el
Date: Wed,  8 Jan 2025 12:10:48 +0000
Message-Id: <20250108121054.1126164-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108121054.1126164-1-alex.bennee@linaro.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: eh1jrhNSHsIl

From: Daniel P. Berrangé <berrange@redhat.com>

The workaround applied in

  commit c60473d29254b79d9437eface8b342e84663ba66
  Author: Alex Bennée <alex.bennee@linaro.org>
  Date:   Wed Oct 2 10:03:33 2024 +0200

    testing: bump mips64el cross to bookworm and fix package list

Is no longer required since the affected builds are now fixed.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20241217133525.3836570-1-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .../dockerfiles/debian-mips64el-cross.docker  |  9 ++++++
 tests/lcitool/mappings.yml                    | 29 -------------------
 2 files changed, 9 insertions(+), 29 deletions(-)

diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/tests/docker/dockerfiles/debian-mips64el-cross.docker
index c09a8da890..9f6c4763c5 100644
--- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
@@ -93,13 +93,18 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       libcmocka-dev:mips64el \
                       libcurl4-gnutls-dev:mips64el \
                       libdaxctl-dev:mips64el \
+                      libdrm-dev:mips64el \
+                      libepoxy-dev:mips64el \
                       libfdt-dev:mips64el \
                       libffi-dev:mips64el \
                       libfuse3-dev:mips64el \
+                      libgbm-dev:mips64el \
                       libgcrypt20-dev:mips64el \
                       libglib2.0-dev:mips64el \
                       libglusterfs-dev:mips64el \
                       libgnutls28-dev:mips64el \
+                      libgtk-3-dev:mips64el \
+                      libgtk-vnc-2.0-dev:mips64el \
                       libibverbs-dev:mips64el \
                       libiscsi-dev:mips64el \
                       libjemalloc-dev:mips64el \
@@ -119,6 +124,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       librbd-dev:mips64el \
                       librdmacm-dev:mips64el \
                       libsasl2-dev:mips64el \
+                      libsdl2-dev:mips64el \
+                      libsdl2-image-dev:mips64el \
                       libseccomp-dev:mips64el \
                       libselinux1-dev:mips64el \
                       libslirp-dev:mips64el \
@@ -134,6 +141,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       libusb-1.0-0-dev:mips64el \
                       libusbredirhost-dev:mips64el \
                       libvdeplug-dev:mips64el \
+                      libvirglrenderer-dev:mips64el \
+                      libvte-2.91-dev:mips64el \
                       libxdp-dev:mips64el \
                       libzstd-dev:mips64el \
                       nettle-dev:mips64el \
diff --git a/tests/lcitool/mappings.yml b/tests/lcitool/mappings.yml
index f8186b0e69..74eb13d62b 100644
--- a/tests/lcitool/mappings.yml
+++ b/tests/lcitool/mappings.yml
@@ -6,23 +6,6 @@ mappings:
   flake8:
     OpenSUSELeap15:
 
-  # Due to https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1081535 we
-  # have to disable all packages that depend on libgl1-mesa-dri:mips64el
-  gtk3:
-    mips64el-deb:
-
-  libdrm:
-    mips64el-deb:
-
-  libepoxy:
-    mips64el-deb:
-
-  gtk-vnc:
-    mips64el-deb:
-
-  mesa-libgbm:
-    mips64el-deb:
-
   meson:
     OpenSUSELeap15:
 
@@ -81,18 +64,6 @@ mappings:
   python3-wheel:
     OpenSUSELeap15: python311-pip
 
-  sdl2:
-    mips64el-deb:
-
-  sdl2-image:
-    mips64el-deb:
-
-  virglrenderer:
-    mips64el-deb:
-
-  vte:
-    mips64el-deb:
-
 pypi_mappings:
   # Request more recent version
   meson:
-- 
2.39.5
