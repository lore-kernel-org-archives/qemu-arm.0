Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id a9sm3360785wmm.48.2019.05.09.09.59.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 May 2019 09:59:14 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 49CCF1FF90;
	Thu,  9 May 2019 17:59:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH  v1 03/23] tests/tcg/multiarch: add support for multiarch system tests
Date: Thu,  9 May 2019 17:58:51 +0100
Message-Id: <20190509165912.10512-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509165912.10512-1-alex.bennee@linaro.org>
References: <20190509165912.10512-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Uv225jW09YTU

We can certainly support some common tests for system emulation that
make use of our minimal defined boot.S support. It will still be up to
individual architectures to ensure they build so we provide a
MULTIARCH_TESTS variable that they can tack onto TESTS themselves.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/Makefile                                 |  1 +
 tests/tcg/multiarch/system/Makefile.softmmu-target | 14 ++++++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 tests/tcg/multiarch/system/Makefile.softmmu-target

diff --git a/tests/tcg/Makefile b/tests/tcg/Makefile
index 1cdd628e96f..6fa63cc8d53 100644
--- a/tests/tcg/Makefile
+++ b/tests/tcg/Makefile
@@ -96,6 +96,7 @@ else
 # build options for bare programs are usually pretty different. They
 # are expected to provide their own build recipes.
 -include $(SRC_PATH)/tests/tcg/minilib/Makefile.target
+-include $(SRC_PATH)/tests/tcg/multiarch/system/Makefile.softmmu-target
 -include $(SRC_PATH)/tests/tcg/$(TARGET_BASE_ARCH)/Makefile.softmmu-target
 ifneq ($(TARGET_BASE_ARCH),$(TARGET_NAME))
 -include $(SRC_PATH)/tests/tcg/$(TARGET_NAME)/Makefile.softmmu-target
diff --git a/tests/tcg/multiarch/system/Makefile.softmmu-target b/tests/tcg/multiarch/system/Makefile.softmmu-target
new file mode 100644
index 00000000000..db4bbeda44c
--- /dev/null
+++ b/tests/tcg/multiarch/system/Makefile.softmmu-target
@@ -0,0 +1,14 @@
+# -*- Mode: makefile -*-
+#
+# Multiarch system tests
+#
+# We just collect the tests together here and rely on the actual guest
+# architecture to add to the test dependancies and deal with the
+# complications of building.
+#
+
+MULTIARCH_SYSTEM_SRC=$(SRC_PATH)/tests/tcg/multiarch/system
+VPATH+=$(MULTIARCH_SYSTEM_SRC)
+
+MULTIARCH_TEST_SRCS=$(wildcard $(MULTIARCH_SYSTEM_SRC)/*.c)
+MULTIARCH_TESTS = $(patsubst $(MULTIARCH_SYSTEM_SRC)/%.c, %, $(MULTIARCH_TEST_SRCS))
-- 
2.20.1
