Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cecc21sm484887666b.166.2024.09.10.07.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 07:07:34 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D33825F7B4;
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
Subject: [PATCH 02/26] tests/docker: update debian i686 and mipsel images to bookworm
Date: Tue, 10 Sep 2024 15:07:09 +0100
Message-Id: <20240910140733.4007719-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910140733.4007719-1-alex.bennee@linaro.org>
References: <20240910140733.4007719-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0FGMr97gA9MG

Whatever issues there were which stopped these being updates when the
rest were have now been resolved. However mips64el continues to be
broken so don't update it here.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/debian-i686-cross.docker   | 10 ++++------
 tests/docker/dockerfiles/debian-mipsel-cross.docker | 10 ++++------
 tests/lcitool/refresh                               |  4 ++--
 3 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/tests/docker/dockerfiles/debian-i686-cross.docker b/tests/docker/dockerfiles/debian-i686-cross.docker
index 3fe8ee623d..2328ee1732 100644
--- a/tests/docker/dockerfiles/debian-i686-cross.docker
+++ b/tests/docker/dockerfiles/debian-i686-cross.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all --cross-arch i686 debian-11 qemu
+#  $ lcitool dockerfile --layers all --cross-arch i686 debian-12 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM docker.io/library/debian:11-slim
+FROM docker.io/library/debian:12-slim
 
 RUN export DEBIAN_FRONTEND=noninteractive && \
     apt-get update && \
@@ -48,16 +48,15 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       python3-opencv \
                       python3-pillow \
                       python3-pip \
-                      python3-setuptools \
                       python3-sphinx \
                       python3-sphinx-rtd-theme \
                       python3-venv \
-                      python3-wheel \
                       python3-yaml \
                       rpm2cpio \
                       sed \
                       socat \
                       sparse \
+                      swtpm \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
@@ -69,8 +68,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     dpkg-reconfigure locales && \
     rm -f /usr/lib*/python3*/EXTERNALLY-MANAGED
 
-RUN /usr/bin/pip3 install tomli
-
 ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
@@ -145,6 +142,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       libvdeplug-dev:i386 \
                       libvirglrenderer-dev:i386 \
                       libvte-2.91-dev:i386 \
+                      libxdp-dev:i386 \
                       libzstd-dev:i386 \
                       nettle-dev:i386 \
                       systemtap-sdt-dev:i386 \
diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tests/docker/dockerfiles/debian-mipsel-cross.docker
index 0d559ae4ba..4ac314e22e 100644
--- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
+++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all --cross-arch mipsel debian-11 qemu
+#  $ lcitool dockerfile --layers all --cross-arch mipsel debian-12 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM docker.io/library/debian:11-slim
+FROM docker.io/library/debian:12-slim
 
 RUN export DEBIAN_FRONTEND=noninteractive && \
     apt-get update && \
@@ -48,16 +48,15 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       python3-opencv \
                       python3-pillow \
                       python3-pip \
-                      python3-setuptools \
                       python3-sphinx \
                       python3-sphinx-rtd-theme \
                       python3-venv \
-                      python3-wheel \
                       python3-yaml \
                       rpm2cpio \
                       sed \
                       socat \
                       sparse \
+                      swtpm \
                       tar \
                       tesseract-ocr \
                       tesseract-ocr-eng \
@@ -69,8 +68,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     dpkg-reconfigure locales && \
     rm -f /usr/lib*/python3*/EXTERNALLY-MANAGED
 
-RUN /usr/bin/pip3 install tomli
-
 ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
@@ -143,6 +140,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       libvdeplug-dev:mipsel \
                       libvirglrenderer-dev:mipsel \
                       libvte-2.91-dev:mipsel \
+                      libxdp-dev:mipsel \
                       libzstd-dev:mipsel \
                       nettle-dev:mipsel \
                       systemtap-sdt-dev:mipsel \
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 199d5fad87..c60490a7fa 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -159,7 +159,7 @@ try:
                         trailer=cross_build("arm-linux-gnueabihf-",
                                             "arm-softmmu,arm-linux-user"))
 
-    generate_dockerfile("debian-i686-cross", "debian-11",
+    generate_dockerfile("debian-i686-cross", "debian-12",
                         cross="i686",
                         trailer=cross_build("i686-linux-gnu-",
                                             "x86_64-softmmu,"
@@ -171,7 +171,7 @@ try:
                         trailer=cross_build("mips64el-linux-gnuabi64-",
                                             "mips64el-softmmu,mips64el-linux-user"))
 
-    generate_dockerfile("debian-mipsel-cross", "debian-11",
+    generate_dockerfile("debian-mipsel-cross", "debian-12",
                         cross="mipsel",
                         trailer=cross_build("mipsel-linux-gnu-",
                                             "mipsel-softmmu,mipsel-linux-user"))
-- 
2.39.2
