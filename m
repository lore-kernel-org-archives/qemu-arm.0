Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id j4-v6sm3366wrr.47.2018.06.19.08.44.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jun 2018 08:44:48 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 55F443E0C0F;
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
Subject: [PULL 22/56] tests/tcg: move ARM specific tests into subdir
Date: Tue, 19 Jun 2018 16:44:01 +0100
Message-Id: <20180619154435.18898-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180619154435.18898-1-alex.bennee@linaro.org>
References: <20180619154435.18898-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: teJDk60+kt96

These only need to be built for ARM guests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

---
v2
  - do VPATH manipulation in tests/tcg/arm/Makefile.target
  - merge with fix hello-arm test
v4
  - update MAINTAINERS

diff --git a/MAINTAINERS b/MAINTAINERS
index 57c828644f..75a163f557 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -135,6 +135,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: target/arm/
+F: tests/tcg/arm/
 F: hw/arm/
 F: hw/cpu/a*mpcore.c
 F: include/hw/cpu/a*mpcore.h
diff --git a/tests/tcg/README b/tests/tcg/README
index 469504c4cb..625f2326e6 100644
--- a/tests/tcg/README
+++ b/tests/tcg/README
@@ -5,15 +5,6 @@ or they are architecture specific.
 
 
 
-ARM
-===
-
-hello-arm
----------
-
-test-arm-iwmmxt
----------------
-
 MIPS
 ====
 
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
new file mode 100644
index 0000000000..bc6962ecc6
--- /dev/null
+++ b/tests/tcg/arm/Makefile.target
@@ -0,0 +1,13 @@
+# -*- Mode: makefile -*-
+#
+# ARM - included from tests/tcg/Makefile.target
+#
+
+ARM_SRC=$(SRC_PATH)/tests/tcg/arm
+
+# Set search path for all sources
+VPATH 		+= $(ARM_SRC)
+
+
+hello-arm: CFLAGS+=-marm -ffreestanding
+hello-arm: LDFLAGS+=-nostdlib
diff --git a/tests/tcg/arm/README b/tests/tcg/arm/README
new file mode 100644
index 0000000000..e6307116e2
--- /dev/null
+++ b/tests/tcg/arm/README
@@ -0,0 +1,11 @@
+These are ARM specific guest programs
+
+hello-arm
+---------
+
+A very simple inline assembly, write syscall based hello world
+
+test-arm-iwmmxt
+---------------
+
+A simple test case for older iwmmxt extended ARMs
diff --git a/tests/tcg/hello-arm.c b/tests/tcg/arm/hello-arm.c
similarity index 100%
rename from tests/tcg/hello-arm.c
rename to tests/tcg/arm/hello-arm.c
diff --git a/tests/tcg/test-arm-iwmmxt.s b/tests/tcg/arm/test-arm-iwmmxt.s
similarity index 100%
rename from tests/tcg/test-arm-iwmmxt.s
rename to tests/tcg/arm/test-arm-iwmmxt.s
-- 
2.17.1
