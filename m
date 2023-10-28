Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id x14-20020a5d444e000000b0031980294e9fsm3568243wrr.116.2023.10.28.03.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 03:33:14 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id E12995F7A1;
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
Subject: [PATCH 09/17] tests/docker: use debian-all-test-cross for mips64
Date: Sat, 28 Oct 2023 11:33:03 +0100
Message-Id: <20231028103311.347104-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231028103311.347104-1-alex.bennee@linaro.org>
References: <20231028103311.347104-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kpH9dDNbSfLU

Maintaining two sets of containers for test building is silly. While
it makes sense for the QEMU cross-compile targets to have their own
fat containers built by lcitool we might as well merge the other
random debian based compilers into the same one used on gitlab.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure                                     |  2 +-
 .gitlab-ci.d/container-cross.yml              |  6 ------
 tests/docker/Makefile.include                 |  1 -
 .../dockerfiles/debian-mips64-cross.docker    | 19 -------------------
 4 files changed, 1 insertion(+), 27 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/debian-mips64-cross.docker

diff --git a/configure b/configure
index c7c811fb02..2bcbf0fc36 100755
--- a/configure
+++ b/configure
@@ -1327,7 +1327,7 @@ probe_target_compiler() {
         container_cross_prefix=mips64el-linux-gnuabi64-
         ;;
       mips64)
-        container_image=debian-mips64-cross
+        container_image=debian-all-test-cross
         container_cross_prefix=mips64-linux-gnuabi64-
         ;;
       nios2)
diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index cf2fcaa59e..f863a14664 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -40,12 +40,6 @@ hexagon-cross-container:
   variables:
     NAME: debian-hexagon-cross
 
-mips64-debian-cross-container:
-  extends: .container_job_template
-  stage: containers
-  variables:
-    NAME: debian-mips64-cross
-
 mips64el-debian-cross-container:
   extends: .container_job_template
   stage: containers
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index f482b1e92d..b4296d3c5e 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -123,7 +123,6 @@ docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
 
 # These images may be good enough for building tests but not for test builds
 DOCKER_PARTIAL_IMAGES += debian-loongarch-cross
-DOCKER_PARTIAL_IMAGES += debian-mips64-cross
 DOCKER_PARTIAL_IMAGES += debian-microblaze-cross
 DOCKER_PARTIAL_IMAGES += debian-mips-cross
 DOCKER_PARTIAL_IMAGES += debian-nios2-cross
diff --git a/tests/docker/dockerfiles/debian-mips64-cross.docker b/tests/docker/dockerfiles/debian-mips64-cross.docker
deleted file mode 100644
index ba965cf564..0000000000
--- a/tests/docker/dockerfiles/debian-mips64-cross.docker
+++ /dev/null
@@ -1,19 +0,0 @@
-#
-# Docker cross-compiler target
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
-        gcc-mips64-linux-gnuabi64 \
-        libc6-dev-mips64-cross
-# As a final step configure the user (if env is defined)
-ARG USER
-ARG UID
-RUN if [ "${USER}" ]; then \
-  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
-- 
2.39.2
