Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id o18sm54598841wrg.40.2019.02.28.12.25.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Feb 2019 12:25:40 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AA12B1FF89;
	Thu, 28 Feb 2019 20:25:37 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	edgar.iglesias@gmail.com,
	jcmvbkbc@gmail.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 06/16] tests/docker: add debian-xtensa-cross image
Date: Thu, 28 Feb 2019 20:25:27 +0000
Message-Id: <20190228202537.4638-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190228202537.4638-1-alex.bennee@linaro.org>
References: <20190228202537.4638-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8p26SQ58cv0g

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Xtensa cpu supported:
- dc232b
- dc233c
- csp

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - the compiler only works for system tests (no libc)
---
 .../dockerfiles/debian-xtensa-cross.docker    | 31 +++++++++++++++++++
 tests/tcg/xtensa/Makefile.include             | 11 +++++++
 2 files changed, 42 insertions(+)
 create mode 100644 tests/docker/dockerfiles/debian-xtensa-cross.docker
 create mode 100644 tests/tcg/xtensa/Makefile.include

diff --git a/tests/docker/dockerfiles/debian-xtensa-cross.docker b/tests/docker/dockerfiles/debian-xtensa-cross.docker
new file mode 100644
index 0000000000..afd2ab9163
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-xtensa-cross.docker
@@ -0,0 +1,31 @@
+#
+# Docker cross-compiler target
+#
+# This docker target builds on the debian stretch base image,
+# using a prebuilt toolchains for Xtensa cores from:
+# https://github.com/foss-xtensa/toolchain/releases
+#
+FROM debian:stretch-slim
+
+RUN apt-get update && \
+    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata
+RUN DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt-get install -y --no-install-recommends \
+        bison \
+        build-essential \
+        ca-certificates \
+        curl \
+        flex \
+        gettext \
+        git \
+        python-minimal
+
+ENV CPU_LIST csp dc232b dc233c
+ENV TOOLCHAIN_RELEASE 2018.02
+
+RUN for cpu in $CPU_LIST; do \
+        curl -#SL http://github.com/foss-xtensa/toolchain/releases/download/$TOOLCHAIN_RELEASE/x86_64-$TOOLCHAIN_RELEASE-xtensa-$cpu-elf.tar.gz \
+        | tar -xzC /opt; \
+    done
+
+ENV PATH $PATH:/opt/$TOOLCHAIN_RELEASE/xtensa-dc232b-elf/bin:/opt/$TOOLCHAIN_RELEASE/xtensa-dc233c-elf/bin:/opt/$TOOLCHAIN_RELEASE/xtensa-csp-elf/bin
diff --git a/tests/tcg/xtensa/Makefile.include b/tests/tcg/xtensa/Makefile.include
new file mode 100644
index 0000000000..423c00a5d3
--- /dev/null
+++ b/tests/tcg/xtensa/Makefile.include
@@ -0,0 +1,11 @@
+# Makefile.include for xtensa targets
+#
+# The compilers can only be used for building system tests
+
+ifeq ($(CONFIG_SOFTMMU),y)
+DOCKER_IMAGE=debian-xtensa-cross
+
+# default to the dc232b cpu
+DOCKER_CROSS_COMPILER=/opt/2018.02/xtensa-dc232b-elf/bin/xtensa-dc232b-elf-gcc
+DOCKER_CROSS_LINKER=/opt/2018.02/xtensa-dc232b-elf/bin/xtensa-dc232b-elf-ld
+endif
-- 
2.20.1
