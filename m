Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b15sm2457454wrm.47.2019.02.07.10.37.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Feb 2019 10:37:48 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E61601FF87;
	Thu,  7 Feb 2019 18:37:44 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 07/16] docker: add debian-buster-arm64-cross
Date: Thu,  7 Feb 2019 18:37:35 +0000
Message-Id: <20190207183744.5054-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190207183744.5054-1-alex.bennee@linaro.org>
References: <20190207183744.5054-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pzTHLTvCyhdL

We can't build QEMU with this but we can use this image to build newer
arm64 testcases which need more up to date tools.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include                 |  1 +
 .../debian-buster-arm64-cross.docker          | 15 +++++++++
 tests/docker/dockerfiles/debian10.docker      | 31 +++++++++++++++++++
 tests/tcg/aarch64/Makefile.include            |  2 +-
 4 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 tests/docker/dockerfiles/debian-buster-arm64-cross.docker
 create mode 100644 tests/docker/dockerfiles/debian10.docker

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 7032c68895..83d43c50e4 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -90,6 +90,7 @@ docker-image-debian-amd64: docker-image-debian9
 docker-image-debian-armel-cross: docker-image-debian9
 docker-image-debian-armhf-cross: docker-image-debian9
 docker-image-debian-arm64-cross: docker-image-debian9
+docker-image-debian-buster-arm64-cross: docker-image-debian10
 docker-image-debian-mips-cross: docker-image-debian9
 docker-image-debian-mipsel-cross: docker-image-debian9
 docker-image-debian-mips64el-cross: docker-image-debian9
diff --git a/tests/docker/dockerfiles/debian-buster-arm64-cross.docker b/tests/docker/dockerfiles/debian-buster-arm64-cross.docker
new file mode 100644
index 0000000000..33ada13806
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-buster-arm64-cross.docker
@@ -0,0 +1,15 @@
+#
+# Docker arm64 cross-compiler target
+#
+# This docker target builds on the Debian's Buster base image. There
+# are no QEMU pre-requistes so this image can only be used to build
+# test cases.
+#
+FROM qemu:debian10
+
+# Add the foreign architecture we want and install dependencies
+RUN dpkg --add-architecture arm64
+RUN apt update
+RUN DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt-get install -y --no-install-recommends \
+        crossbuild-essential-arm64
diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
new file mode 100644
index 0000000000..aeeb151b52
--- /dev/null
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -0,0 +1,31 @@
+#
+# Docker multiarch cross-compiler target
+#
+# This docker target is builds on Debian cross compiler targets to build distro
+# with a selection of cross compilers for building test binaries.
+#
+# On its own you can't build much but the docker-foo-cross targets
+# build on top of the base debian image.
+#
+FROM debian:buster-slim
+
+# Duplicate deb line as deb-src
+RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
+
+# Install common build utilities
+RUN apt update
+RUN DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata
+RUN DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt install -y --no-install-recommends \
+        bison \
+        build-essential \
+        ca-certificates \
+        clang \
+        flex \
+        gettext \
+        git \
+        pkg-config \
+        psmisc \
+        python \
+        texinfo \
+        $(apt-get -s build-dep qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
diff --git a/tests/tcg/aarch64/Makefile.include b/tests/tcg/aarch64/Makefile.include
index de32c91235..5d4e4c6f99 100644
--- a/tests/tcg/aarch64/Makefile.include
+++ b/tests/tcg/aarch64/Makefile.include
@@ -3,6 +3,6 @@
 # We don't have any bigendian build tools so we only use this for AArch64
 
 ifeq ($(TARGET_NAME),aarch64)
-DOCKER_IMAGE=debian-arm64-cross
+DOCKER_IMAGE=debian-buster-arm64-cross
 DOCKER_CROSS_COMPILER=aarch64-linux-gnu-gcc
 endif
-- 
2.20.1
