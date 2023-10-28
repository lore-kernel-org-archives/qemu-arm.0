Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id c9-20020a7bc849000000b00405d9a950a2sm7076142wml.28.2023.10.28.03.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 03:33:14 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 96E265F79E;
	Sat, 28 Oct 2023 11:33:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alexandre Iooss <erdnaxe@crans.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Kyle Evans <kevans@freebsd.org>,
	qemu-arm@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Brad Smith <brad@comstyle.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 06/17] tests/docker: use debian-all-test-cross for power
Date: Sat, 28 Oct 2023 11:33:00 +0100
Message-Id: <20231028103311.347104-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231028103311.347104-1-alex.bennee@linaro.org>
References: <20231028103311.347104-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ajvkN6oVwoZj

Maintaining two sets of containers for test building is silly. While
it makes sense for the QEMU cross-compile targets to have their own
fat containers built by lcitool we might as well merge the other
random debian based compilers into the same one used on gitlab.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure                                     |  4 ++--
 .gitlab-ci.d/container-cross.yml              |  6 -----
 tests/docker/Makefile.include                 |  1 -
 .../debian-powerpc-test-cross.docker          | 23 -------------------
 4 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/debian-powerpc-test-cross.docker

diff --git a/configure b/configure
index 37d1b10b87..8707bd2e78 100755
--- a/configure
+++ b/configure
@@ -1325,12 +1325,12 @@ probe_target_compiler() {
         container_cross_prefix=nios2-linux-gnu-
         ;;
       ppc)
-        container_image=debian-powerpc-test-cross
+        container_image=debian-all-test-cross
         container_cross_prefix=powerpc-linux-gnu-
         container_cross_cc=${container_cross_prefix}gcc
         ;;
       ppc64|ppc64le)
-        container_image=debian-powerpc-test-cross
+        container_image=debian-all-test-cross
         container_cross_prefix=powerpc${target_arch#ppc}-linux-gnu-
         container_cross_cc=${container_cross_prefix}gcc-10
         ;;
diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 61f23561b7..ec56990bc5 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -76,12 +76,6 @@ mipsel-debian-cross-container:
   variables:
     NAME: debian-mipsel-cross
 
-powerpc-test-cross-container:
-  extends: .container_job_template
-  stage: containers
-  variables:
-    NAME: debian-powerpc-test-cross
-
 ppc64el-debian-cross-container:
   extends: .container_job_template
   stage: containers
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 654f24b188..356986d687 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -122,7 +122,6 @@ docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
 	$(call debian-toolchain, $@)
 
 # These images may be good enough for building tests but not for test builds
-DOCKER_PARTIAL_IMAGES += debian-powerpc-test-cross
 DOCKER_PARTIAL_IMAGES += debian-hppa-cross
 DOCKER_PARTIAL_IMAGES += debian-loongarch-cross
 DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
diff --git a/tests/docker/dockerfiles/debian-powerpc-test-cross.docker b/tests/docker/dockerfiles/debian-powerpc-test-cross.docker
deleted file mode 100644
index 23779413d3..0000000000
--- a/tests/docker/dockerfiles/debian-powerpc-test-cross.docker
+++ /dev/null
@@ -1,23 +0,0 @@
-#
-# Docker powerpc/ppc64/ppc64le cross-compiler target
-#
-# This docker target builds on the Debian Bullseye base image.
-#
-FROM docker.io/library/debian:11-slim
-
-RUN export DEBIAN_FRONTEND=noninteractive && \
-    apt-get update && \
-    apt-get install -y eatmydata && \
-    eatmydata apt-get dist-upgrade -y && \
-    eatmydata apt-get install --no-install-recommends -y \
-        gcc-powerpc-linux-gnu \
-        libc6-dev-powerpc-cross \
-        gcc-10-powerpc64-linux-gnu \
-        libc6-dev-ppc64-cross \
-        gcc-10-powerpc64le-linux-gnu \
-        libc6-dev-ppc64el-cross
-# As a final step configure the user (if env is defined)
-ARG USER
-ARG UID
-RUN if [ "${USER}" ]; then \
-  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
-- 
2.39.2
