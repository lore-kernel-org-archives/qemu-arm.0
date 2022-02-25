Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id dt24-20020a170906b79800b006d57e9289f2sm1228264ejb.49.2022.02.25.09.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 09:20:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9E5811FFBE;
	Fri, 25 Feb 2022 17:20:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	crosa@redhat.com,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	sw@weilnetz.de,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v2 06/18] tests/docker: introduce debian-riscv64-test-cross
Date: Fri, 25 Feb 2022 17:20:09 +0000
Message-Id: <20220225172021.3493923-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Sr8G7E+sY2x2

Cross building QEMU for riscv64 still involves messing about with sid
and ports. However for building tests we can have a slimmer compiler
only container which should be more stable.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220211160309.335014-6-alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-cross.yml                     |  7 +++++++
 tests/docker/Makefile.include                        |  2 ++
 .../dockerfiles/debian-riscv64-test-cross.docker     | 12 ++++++++++++
 tests/tcg/configure.sh                               |  2 +-
 4 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 tests/docker/dockerfiles/debian-riscv64-test-cross.docker

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index d38f657131..e622ac2d21 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -131,6 +131,13 @@ riscv64-debian-cross-container:
   variables:
     NAME: debian-riscv64-cross
 
+# we can however build TCG tests using a non-sid base
+riscv64-debian-test-cross-container:
+  extends: .container_job_template
+  stage: containers-layer2
+  variables:
+    NAME: debian-riscv64-test-cross
+
 s390x-debian-cross-container:
   extends: .container_job_template
   stage: containers
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index cce9faab36..e495b163a0 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -214,6 +214,7 @@ docker-image-debian-all-test-cross: docker-image-debian10
 docker-image-debian-microblaze-cross: docker-image-debian10
 docker-image-debian-nios2-cross: docker-image-debian10
 docker-image-debian-powerpc-test-cross: docker-image-debian11
+docker-image-debian-riscv64-test-cross: docker-image-debian11
 
 # These images may be good enough for building tests but not for test builds
 DOCKER_PARTIAL_IMAGES += debian-alpha-cross
@@ -222,6 +223,7 @@ DOCKER_PARTIAL_IMAGES += debian-hppa-cross
 DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
 DOCKER_PARTIAL_IMAGES += debian-microblaze-cross
 DOCKER_PARTIAL_IMAGES += debian-nios2-cross
+DOCKER_PARTIAL_IMAGES += debian-riscv64-test-cross
 DOCKER_PARTIAL_IMAGES += debian-sh4-cross debian-sparc64-cross
 DOCKER_PARTIAL_IMAGES += debian-tricore-cross
 DOCKER_PARTIAL_IMAGES += debian-xtensa-cross
diff --git a/tests/docker/dockerfiles/debian-riscv64-test-cross.docker b/tests/docker/dockerfiles/debian-riscv64-test-cross.docker
new file mode 100644
index 0000000000..1d90901298
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-riscv64-test-cross.docker
@@ -0,0 +1,12 @@
+#
+# Docker cross-compiler target
+#
+# This docker target builds on the Debian Bullseye base image.
+#
+FROM qemu/debian11
+
+RUN apt update && \
+    DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt install -y --no-install-recommends \
+        gcc-riscv64-linux-gnu \
+        libc6-dev-riscv64-cross
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index adc95d6a44..0663bd19f4 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -180,7 +180,7 @@ for target in $target_list; do
       ;;
     riscv64-*)
       container_hosts=x86_64
-      container_image=debian-riscv64-cross
+      container_image=debian-riscv64-test-cross
       container_cross_cc=riscv64-linux-gnu-gcc
       ;;
     s390x-*)
-- 
2.30.2
