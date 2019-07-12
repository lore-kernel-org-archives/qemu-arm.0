Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 32sm5552970wrh.76.2019.07.12.04.18.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 12 Jul 2019 04:18:51 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D2C321FF93;
	Fri, 12 Jul 2019 12:18:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH  v1 6/7] tests/dockerfiles: update the win cross builds to stretch
Date: Fri, 12 Jul 2019 12:18:48 +0100
Message-Id: <20190712111849.9006-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190712111849.9006-1-alex.bennee@linaro.org>
References: <20190712111849.9006-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: q7brUDoL7gco

While fixing up pkg.mxe.cc they move the URLs around a bit and dropped
Jessie support in favour of Stretch. We also need to update the keys
used to verify the packages.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include                         |  6 +++---
 tests/docker/dockerfiles/debian-win32-cross.docker    |  4 ++--
 tests/docker/dockerfiles/debian-win64-cross.docker    |  4 ++--
 .../{debian8-mxe.docker => debian9-mxe.docker}        | 11 +++++++----
 4 files changed, 14 insertions(+), 11 deletions(-)
 rename tests/docker/dockerfiles/{debian8-mxe.docker => debian9-mxe.docker} (56%)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index aaf5396b85d..dbd58e548c1 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -85,7 +85,7 @@ endif
 
 # Enforce dependencies for composite images
 docker-image-debian: docker-image-debian9
-docker-image-debian8-mxe: docker-image-debian8
+docker-image-debian9-mxe: docker-image-debian9
 docker-image-debian-amd64: docker-image-debian9
 docker-image-debian-armel-cross: docker-image-debian9
 docker-image-debian-armhf-cross: docker-image-debian9
@@ -96,8 +96,8 @@ docker-image-debian-mipsel-cross: docker-image-debian9
 docker-image-debian-mips64el-cross: docker-image-debian9
 docker-image-debian-ppc64el-cross: docker-image-debian9
 docker-image-debian-s390x-cross: docker-image-debian9
-docker-image-debian-win32-cross: docker-image-debian8-mxe
-docker-image-debian-win64-cross: docker-image-debian8-mxe
+docker-image-debian-win32-cross: docker-image-debian9-mxe
+docker-image-debian-win64-cross: docker-image-debian9-mxe
 
 docker-image-debian-alpha-cross: docker-image-debian-sid
 docker-image-debian-hppa-cross: docker-image-debian-sid
diff --git a/tests/docker/dockerfiles/debian-win32-cross.docker b/tests/docker/dockerfiles/debian-win32-cross.docker
index 0a4970c0683..c787e432454 100644
--- a/tests/docker/dockerfiles/debian-win32-cross.docker
+++ b/tests/docker/dockerfiles/debian-win32-cross.docker
@@ -1,9 +1,9 @@
 #
 # Docker mingw32 cross-compiler target
 #
-# This docker target builds on the debian Jessie MXE base image.
+# This docker target builds on the debian Stretch MXE base image.
 #
-FROM qemu:debian8-mxe
+FROM qemu:debian9-mxe
 
 MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
 
diff --git a/tests/docker/dockerfiles/debian-win64-cross.docker b/tests/docker/dockerfiles/debian-win64-cross.docker
index b27985b1b1f..a7068ed6ac6 100644
--- a/tests/docker/dockerfiles/debian-win64-cross.docker
+++ b/tests/docker/dockerfiles/debian-win64-cross.docker
@@ -1,9 +1,9 @@
 #
 # Docker mingw64 cross-compiler target
 #
-# This docker target builds on the debian Jessie MXE base image.
+# This docker target builds on the debian Stretch MXE base image.
 #
-FROM qemu:debian8-mxe
+FROM qemu:debian9-mxe
 
 MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
 
diff --git a/tests/docker/dockerfiles/debian8-mxe.docker b/tests/docker/dockerfiles/debian9-mxe.docker
similarity index 56%
rename from tests/docker/dockerfiles/debian8-mxe.docker
rename to tests/docker/dockerfiles/debian9-mxe.docker
index 2df4cc8c5c9..5bc8a6d5c36 100644
--- a/tests/docker/dockerfiles/debian8-mxe.docker
+++ b/tests/docker/dockerfiles/debian9-mxe.docker
@@ -1,15 +1,18 @@
 #
 # Docker mingw cross-compiler target
 #
-# This docker target builds on the debian Jessie base image.
+# This docker target builds on the debian Stretch base image.
 #
-FROM qemu:debian8
+FROM qemu:debian9
 
 MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
 
+RUN DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt install -y --no-install-recommends gnupg dirmngr
+
 # Add the foreign architecture we want and install dependencies
-RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D43A795B73B16ABE9643FE1AFD8FFF16DB45C6AB && \
-    echo "deb http://pkg.mxe.cc/repos/apt/debian jessie main" > /etc/apt/sources.list.d/mxeapt.list
+RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C6BF758A33A3A276 && \
+    echo "deb http://pkg.mxe.cc/repos/apt stretch main" > /etc/apt/sources.list.d/mxeapt.list
 RUN apt-get update
 RUN DEBIAN_FRONTEND=noninteractive eatmydata \
     apt-get install -y --no-install-recommends \
-- 
2.20.1
