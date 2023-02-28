Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id d2-20020adfef82000000b002c5801aa9b0sm10744540wro.40.2023.02.28.11.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 11:14:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 679971FFCA;
	Tue, 28 Feb 2023 19:06:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Darren Kenny <darren.kenny@oracle.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	qemu-arm@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	Thomas Huth <thuth@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	qemu-block@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Laurent Vivier <lvivier@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 23/24] tests/docker: add zstdtools to the images (!AWAITING UPSTREAM)
Date: Tue, 28 Feb 2023 19:06:52 +0000
Message-Id: <20230228190653.1602033-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RIvL04jbqgIE

We need this to be able to run the tuxrun_baseline tests in CI which
in turn helps us reduce overhead running other tests.

[See https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/361]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/alpine.docker                | 1 +
 tests/docker/dockerfiles/centos8.docker               | 3 ++-
 tests/docker/dockerfiles/debian-amd64-cross.docker    | 3 ++-
 tests/docker/dockerfiles/debian-amd64.docker          | 3 ++-
 tests/docker/dockerfiles/debian-arm64-cross.docker    | 3 ++-
 tests/docker/dockerfiles/debian-armel-cross.docker    | 3 ++-
 tests/docker/dockerfiles/debian-armhf-cross.docker    | 3 ++-
 tests/docker/dockerfiles/debian-mips64el-cross.docker | 3 ++-
 tests/docker/dockerfiles/debian-mipsel-cross.docker   | 3 ++-
 tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 3 ++-
 tests/docker/dockerfiles/debian-s390x-cross.docker    | 3 ++-
 tests/docker/dockerfiles/fedora-win32-cross.docker    | 3 ++-
 tests/docker/dockerfiles/fedora-win64-cross.docker    | 3 ++-
 tests/docker/dockerfiles/fedora.docker                | 3 ++-
 tests/docker/dockerfiles/opensuse-leap.docker         | 3 ++-
 tests/docker/dockerfiles/ubuntu2004.docker            | 3 ++-
 tests/docker/dockerfiles/ubuntu2204.docker            | 3 ++-
 tests/lcitool/projects/qemu.yml                       | 1 +
 18 files changed, 34 insertions(+), 16 deletions(-)

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 33e4823400..51f0957c67 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -110,6 +110,7 @@ RUN apk update && \
         xfsprogs-dev \
         zlib-dev \
         zlib-static \
+        zstd \
         zstd-dev && \
     apk list | sort > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 28c5e7e43c..2a0ed397e8 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -118,7 +118,8 @@ RUN dnf distro-sync -y && \
         which \
         xfsprogs-devel \
         zlib-devel \
-        zlib-static && \
+        zlib-static \
+        zstd && \
     dnf autoremove -y && \
     dnf clean all -y && \
     rpm -qa | sort > /packages.txt && \
diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker b/tests/docker/dockerfiles/debian-amd64-cross.docker
index 5d03b5c22d..afb1cbd046 100644
--- a/tests/docker/dockerfiles/debian-amd64-cross.docker
+++ b/tests/docker/dockerfiles/debian-amd64-cross.docker
@@ -56,7 +56,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sparse \
                       tar \
                       tesseract-ocr \
-                      tesseract-ocr-eng && \
+                      tesseract-ocr-eng \
+                      zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index febc46e700..28e2fa81b1 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -127,7 +127,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tesseract-ocr \
                       tesseract-ocr-eng \
                       xfslibs-dev \
-                      zlib1g-dev && \
+                      zlib1g-dev \
+                      zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index b9501a21bc..b4f7a7f903 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -56,7 +56,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sparse \
                       tar \
                       tesseract-ocr \
-                      tesseract-ocr-eng && \
+                      tesseract-ocr-eng \
+                      zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker b/tests/docker/dockerfiles/debian-armel-cross.docker
index f21742ede5..4b4191f824 100644
--- a/tests/docker/dockerfiles/debian-armel-cross.docker
+++ b/tests/docker/dockerfiles/debian-armel-cross.docker
@@ -56,7 +56,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sparse \
                       tar \
                       tesseract-ocr \
-                      tesseract-ocr-eng && \
+                      tesseract-ocr-eng \
+                      zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index decdeda6f2..c9b6b2e563 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -56,7 +56,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sparse \
                       tar \
                       tesseract-ocr \
-                      tesseract-ocr-eng && \
+                      tesseract-ocr-eng \
+                      zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/tests/docker/dockerfiles/debian-mips64el-cross.docker
index 1df05fcf20..cfe4f9a0d7 100644
--- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
@@ -56,7 +56,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sparse \
                       tar \
                       tesseract-ocr \
-                      tesseract-ocr-eng && \
+                      tesseract-ocr-eng \
+                      zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tests/docker/dockerfiles/debian-mipsel-cross.docker
index 019b8dcaff..8e521fc9ee 100644
--- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
+++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
@@ -56,7 +56,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sparse \
                       tar \
                       tesseract-ocr \
-                      tesseract-ocr-eng && \
+                      tesseract-ocr-eng \
+                      zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
index 3ceab4c502..b1b8277f3f 100644
--- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
@@ -56,7 +56,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sparse \
                       tar \
                       tesseract-ocr \
-                      tesseract-ocr-eng && \
+                      tesseract-ocr-eng \
+                      zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index 6c216dde48..af39568ce5 100644
--- a/tests/docker/dockerfiles/debian-s390x-cross.docker
+++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
@@ -56,7 +56,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sparse \
                       tar \
                       tesseract-ocr \
-                      tesseract-ocr-eng && \
+                      tesseract-ocr-eng \
+                      zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index a5689b616b..f092b333c9 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -59,7 +59,8 @@ exec "$@"' > /usr/bin/nosync && \
                tesseract \
                tesseract-langpack-eng \
                util-linux \
-               which && \
+               which \
+               zstd && \
     nosync dnf autoremove -y && \
     nosync dnf clean all -y
 
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index c066c20241..f35cd5145e 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -59,7 +59,8 @@ exec "$@"' > /usr/bin/nosync && \
                tesseract \
                tesseract-langpack-eng \
                util-linux \
-               which && \
+               which \
+               zstd && \
     nosync dnf autoremove -y && \
     nosync dnf clean all -y
 
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 4dd1fce890..e030c5fb1e 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -130,7 +130,8 @@ exec "$@"' > /usr/bin/nosync && \
                xen-devel \
                xfsprogs-devel \
                zlib-devel \
-               zlib-static && \
+               zlib-static \
+               zstd && \
     nosync dnf autoremove -y && \
     nosync dnf clean all -y && \
     rpm -qa | sort > /packages.txt && \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 7ea22a8c1e..335d3e071c 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -120,7 +120,8 @@ RUN zypper update -y && \
            xen-devel \
            xfsprogs-devel \
            zlib-devel \
-           zlib-devel-static && \
+           zlib-devel-static \
+           zstd && \
     zypper clean --all && \
     rpm -qa | sort > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index ed5855295f..2c3d539949 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -126,7 +126,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tesseract-ocr \
                       tesseract-ocr-eng \
                       xfslibs-dev \
-                      zlib1g-dev && \
+                      zlib1g-dev \
+                      zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/ubuntu2204.docker b/tests/docker/dockerfiles/ubuntu2204.docker
index 6fea090f02..3f7d30e5d0 100644
--- a/tests/docker/dockerfiles/ubuntu2204.docker
+++ b/tests/docker/dockerfiles/ubuntu2204.docker
@@ -127,7 +127,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tesseract-ocr \
                       tesseract-ocr-eng \
                       xfslibs-dev \
-                      zlib1g-dev && \
+                      zlib1g-dev \
+                      zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index 2854748f49..af3700379a 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -116,5 +116,6 @@ packages:
  - which
  - xen
  - xfsprogs
+ - zstdtools
  - zlib
  - zlib-static
-- 
2.39.2
