Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y13sm13204858wrg.8.2019.09.18.09.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2019 09:58:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 497281FF87;
	Wed, 18 Sep 2019 17:58:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pavel Dovgalyuk <dovgaluk@ispras.ru>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [RFC PATCH] tests/tcg: add time counter to memory test (WIP, aarch64 only)
Date: Wed, 18 Sep 2019 17:58:09 +0100
Message-Id: <20190918165809.3719-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190918153335.20797-1-alex.bennee@linaro.org>
References: <20190918153335.20797-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cYxBze8+vvje

To better support testing record/replay we should output something
that would otherwise be variable had it not been pegged to icount.

[AJB: needs a bit of work to nicely work across architectures although
most have some sort of counter].

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Pavel Dovgalyuk <dovgaluk@ispras.ru>
---
 tests/tcg/aarch64/Makefile.softmmu-target | 1 +
 tests/tcg/aarch64/system/boot.S           | 6 ++++++
 tests/tcg/minilib/minilib.h               | 3 +++
 tests/tcg/multiarch/system/memory.c       | 6 +++++-
 4 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index b4b39579634..698d9b26b63 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -51,5 +51,6 @@ run-memory-replay: memory-replay run-memory-record
 		  -icount shift=5$(COMMA)rr=replay$(COMMA)rrfile=record.bin \
 	   	  $(QEMU_OPTS) memory, \
 	  "$< on $(TARGET_NAME)")
+	$(call diff-out,memory-record,memory-replay.out)
 
 TESTS+=memory-record memory-replay
diff --git a/tests/tcg/aarch64/system/boot.S b/tests/tcg/aarch64/system/boot.S
index b14e94f332d..fb7574e9c06 100644
--- a/tests/tcg/aarch64/system/boot.S
+++ b/tests/tcg/aarch64/system/boot.S
@@ -220,6 +220,12 @@ __sys_outc:
 	ldp x0, x1, [sp], #16
 	ret
 
+	/* return some sort of counter value */
+	.global __sys_counter
+__sys_counter:
+	mrs x0, CNTV_TVAL_EL0
+	ret
+
 	.data
 	.align	12
 
diff --git a/tests/tcg/minilib/minilib.h b/tests/tcg/minilib/minilib.h
index e23361380ae..29c097c545b 100644
--- a/tests/tcg/minilib/minilib.h
+++ b/tests/tcg/minilib/minilib.h
@@ -12,10 +12,13 @@
 #ifndef _MINILIB_H_
 #define _MINILIB_H_
 
+#include <inttypes.h>
+
 /*
  * Provided by the individual arch
  */
 extern void __sys_outc(char c);
+extern uint64_t __sys_counter(void);
 
 /*
  * Provided by the common minilib
diff --git a/tests/tcg/multiarch/system/memory.c b/tests/tcg/multiarch/system/memory.c
index d124502d730..fe32ed27bf8 100644
--- a/tests/tcg/multiarch/system/memory.c
+++ b/tests/tcg/multiarch/system/memory.c
@@ -454,6 +454,8 @@ int main(void)
 {
     int i;
     bool ok = true;
+    uint64_t start = __sys_counter();
+    uint64_t end;
 
     /* Run through the unsigned tests first */
     for (i = 0; i < ARRAY_SIZE(init_ufns) && ok; i++) {
@@ -470,6 +472,8 @@ int main(void)
         ok = do_signed_reads(true);
     }
 
-    ml_printf("Test complete: %s\n", ok ? "PASSED" : "FAILED");
+    end = __sys_counter();
+
+    ml_printf("Test complete in %" PRId64 ": %s\n", start - end, ok ? "PASSED" : "FAILED");
     return ok ? 0 : -1;
 }
-- 
2.20.1
