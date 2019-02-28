Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w24sm3971010wmi.40.2019.02.28.12.25.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Feb 2019 12:25:40 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9E9D11FF88;
	Thu, 28 Feb 2019 20:25:37 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	edgar.iglesias@gmail.com,
	jcmvbkbc@gmail.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 05/16] tests/tcg/mips: fix hello-mips compilation
Date: Thu, 28 Feb 2019 20:25:26 +0000
Message-Id: <20190228202537.4638-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190228202537.4638-1-alex.bennee@linaro.org>
References: <20190228202537.4638-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Ppjd0IUkl8EO

The compilation flags for proper building are in the source tree. We
also fix exit to 0 so the result is counted as a success.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/mips/Makefile.target | 11 ++++-------
 tests/tcg/mips/hello-mips.c    |  2 +-
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/tests/tcg/mips/Makefile.target b/tests/tcg/mips/Makefile.target
index 086625f533..1a994d5525 100644
--- a/tests/tcg/mips/Makefile.target
+++ b/tests/tcg/mips/Makefile.target
@@ -8,15 +8,12 @@ MIPS_SRC=$(SRC_PATH)/tests/tcg/mips
 # Set search path for all sources
 VPATH 		+= $(MIPS_SRC)
 
+# hello-mips is 32 bit only
+ifeq ($(findstring 64,$(TARGET_NAME)),)
 MIPS_TESTS=hello-mips
 
 TESTS += $(MIPS_TESTS)
 
-hello-mips: CFLAGS+=-ffreestanding
+hello-mips: CFLAGS+=-mno-abicalls -fno-PIC -mabi=32
 hello-mips: LDFLAGS+=-nostdlib
-
-# For MIPS32 and 64 we have a bunch of extra tests in sub-directories
-# however they are intended for system tests.
-
-run-hello-mips: hello-mips
-	$(call skip-test, $<, "BROKEN")
+endif
diff --git a/tests/tcg/mips/hello-mips.c b/tests/tcg/mips/hello-mips.c
index c7052fdf2e..4e1cf501af 100644
--- a/tests/tcg/mips/hello-mips.c
+++ b/tests/tcg/mips/hello-mips.c
@@ -60,5 +60,5 @@ static inline int write(int fd, const char *buf, int len)
 void __start(void)
 {
     write (1, "Hello, World!\n", 14);
-    exit1 (42);
+    exit1(0);
 }
-- 
2.20.1
