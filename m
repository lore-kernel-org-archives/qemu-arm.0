Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 65sm24507366wrb.62.2019.02.28.12.25.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Feb 2019 12:25:39 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 86D111FF86;
	Thu, 28 Feb 2019 20:25:37 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	edgar.iglesias@gmail.com,
	jcmvbkbc@gmail.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH  v2 03/16] tests/tcg: add QEMU_OPT option for test runner
Date: Thu, 28 Feb 2019 20:25:24 +0000
Message-Id: <20190228202537.4638-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190228202537.4638-1-alex.bennee@linaro.org>
References: <20190228202537.4638-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xfXWQOodJe8p

This will allow tests to modify the QEMU invocation with for example
different -cpu stazas without having to define a whole new set of
runner types.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

---
v2
  - default QEMU_OPTS to --monitor none for system emulation
---
 tests/tcg/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/Makefile b/tests/tcg/Makefile
index 55feab0f67..097e6374ea 100644
--- a/tests/tcg/Makefile
+++ b/tests/tcg/Makefile
@@ -54,10 +54,13 @@ LDFLAGS=
 # The QEMU for this TARGET
 ifdef CONFIG_USER_ONLY
 QEMU=../qemu-$(TARGET_NAME)
+QEMU_OPTS=
 else
 QEMU=../qemu-system-$(TARGET_NAME)
+QEMU_OPTS=--monitor none
 endif
 
+
 # If TCG debugging is enabled things are a lot slower
 ifeq ($(CONFIG_DEBUG_TCG),y)
 TIMEOUT=45
@@ -108,7 +111,7 @@ RUN_TESTS=$(patsubst %,run-%, $(TESTS))
 RUN_TESTS+=$(EXTRA_RUNS)
 
 run-%: %
-	$(call run-test, $<, $(QEMU) $<, "$< on $(TARGET_NAME)")
+	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on $(TARGET_NAME)")
 
 .PHONY: run
 run: $(RUN_TESTS)
-- 
2.20.1
