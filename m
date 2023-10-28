Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id m1-20020a05600c4f4100b004063d8b43e7sm7264686wmq.48.2023.10.28.03.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 03:33:18 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 1F57A5F76C;
	Sat, 28 Oct 2023 11:33:13 +0100 (BST)
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
Subject: [PATCH 11/17] tests/docker: use debian-all-test-cross for riscv64
Date: Sat, 28 Oct 2023 11:33:05 +0100
Message-Id: <20231028103311.347104-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231028103311.347104-1-alex.bennee@linaro.org>
References: <20231028103311.347104-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: seF6WbrOtprX

Maintaining two sets of containers for test building is silly. While
it makes sense for the QEMU cross-compile targets to have their own
fat containers built by lcitool we might as well merge the other
random debian based compilers into the same one used on gitlab.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure                                     |  4 ++++
 .gitlab-ci.d/container-cross.yml              |  7 -------
 tests/docker/Makefile.include                 |  1 -
 .../debian-riscv64-test-cross.docker          | 19 -------------------
 4 files changed, 4 insertions(+), 27 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/debian-riscv64-test-cross.docker

diff --git a/configure b/configure
index 2d8c7a0312..20247bc149 100755
--- a/configure
+++ b/configure
@@ -1348,6 +1348,10 @@ probe_target_compiler() {
         container_cross_prefix=powerpc${target_arch#ppc}-linux-gnu-
         container_cross_cc=${container_cross_prefix}gcc-10
         ;;
+      riscv64)
+        container_image=debian-all-test-cross
+        container_cross_prefix=risc64-linux-gnu-
+        ;;
       sh4)
         container_image=debian-legacy-test-cross
         container_cross_prefix=sh4-linux-gnu-
diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 0b48bf0172..1436ef8784 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -67,13 +67,6 @@ riscv64-debian-cross-container:
     NAME: debian-riscv64-cross
     QEMU_JOB_OPTIONAL: 1
 
-# we can however build TCG tests using a non-sid base
-riscv64-debian-test-cross-container:
-  extends: .container_job_template
-  stage: containers
-  variables:
-    NAME: debian-riscv64-test-cross
-
 s390x-debian-cross-container:
   extends: .container_job_template
   stage: containers
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 04ac5f9c79..0e8133109d 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -125,7 +125,6 @@ docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
 DOCKER_PARTIAL_IMAGES += debian-loongarch-cross
 DOCKER_PARTIAL_IMAGES += debian-microblaze-cross
 DOCKER_PARTIAL_IMAGES += debian-nios2-cross
-DOCKER_PARTIAL_IMAGES += debian-riscv64-test-cross
 DOCKER_PARTIAL_IMAGES += debian-sparc64-cross
 DOCKER_PARTIAL_IMAGES += debian-xtensa-cross
 DOCKER_PARTIAL_IMAGES += fedora-cris-cross
diff --git a/tests/docker/dockerfiles/debian-riscv64-test-cross.docker b/tests/docker/dockerfiles/debian-riscv64-test-cross.docker
deleted file mode 100644
index 6e631295bc..0000000000
--- a/tests/docker/dockerfiles/debian-riscv64-test-cross.docker
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
-        gcc-riscv64-linux-gnu \
-        libc6-dev-riscv64-cross
-# As a final step configure the user (if env is defined)
-ARG USER
-ARG UID
-RUN if [ "${USER}" ]; then \
-  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
-- 
2.39.2
