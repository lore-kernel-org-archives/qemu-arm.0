Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l5-v6sm30361wrn.92.2018.06.19.09.21.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jun 2018 09:21:45 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 6B1B23E0C1C;
	Tue, 19 Jun 2018 16:44:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	cota@braap.org,
	famz@redhat.com,
	berrange@redhat.com,
	f4bug@amsat.org,
	richard.henderson@linaro.org,
	balrogg@gmail.com,
	aurelien@aurel32.net,
	agraf@suse.de,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PULL 23/56] tests/tcg: enable building for ARM
Date: Tue, 19 Jun 2018 16:44:02 +0100
Message-Id: <20180619154435.18898-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180619154435.18898-1-alex.bennee@linaro.org>
References: <20180619154435.18898-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 40KyByV0asAq

This allows us to use the docker cross compiler image to build these
tests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v5
  - add EXTRA_RUNS for mmap tests

diff --git a/tests/tcg/arm/Makefile.include b/tests/tcg/arm/Makefile.include
new file mode 100644
index 0000000000..8e7eac008f
--- /dev/null
+++ b/tests/tcg/arm/Makefile.include
@@ -0,0 +1,8 @@
+# Makefile.include for all ARM targets
+#
+# We don't have any bigendian build tools so we only use this for armhf
+
+ifeq ($(TARGET_NAME),arm)
+DOCKER_IMAGE=debian-armhf-cross
+DOCKER_CROSS_COMPILER=arm-linux-gnueabihf-gcc
+endif
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index bc6962ecc6..0312293dca 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -1,6 +1,6 @@
 # -*- Mode: makefile -*-
 #
-# ARM - included from tests/tcg/Makefile.target
+# ARM - included from tests/tcg/Makefile
 #
 
 ARM_SRC=$(SRC_PATH)/tests/tcg/arm
@@ -11,3 +11,6 @@ VPATH 		+= $(ARM_SRC)
 
 hello-arm: CFLAGS+=-marm -ffreestanding
 hello-arm: LDFLAGS+=-nostdlib
+
+# On ARM Linux only supports 4k pages
+EXTRA_RUNS+=run-test-mmap-4096
-- 
2.17.1
