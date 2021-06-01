Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id h14sm2467620wmb.1.2021.06.01.02.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 02:07:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id F069B1FF7E;
	Tue,  1 Jun 2021 10:07:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Andrew <astrauss11@gmail.com>
Subject: [RFC PATCH] semihosting/arm-compat: remove heuristic softmmu SYS_HEAPINFO
Date: Tue,  1 Jun 2021 10:07:15 +0100
Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: SwlkschI1MtV

The previous numbers were a guess at best. While we could extract the
information from a loaded ELF file via -kernel we could still get
tripped up by self decompressing or relocating code. Besides sane
library code has access to the same symbols in run time to make a
determination of the location of the heap.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Andrew <astrauss11@gmail.com>
---
 semihosting/arm-compat-semi.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 1c29146dcf..041b4f6c04 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -1165,12 +1165,10 @@ target_ulong do_common_semihosting(CPUState *cs)
     case TARGET_SYS_HEAPINFO:
         {
             target_ulong retvals[4];
-            target_ulong limit;
             int i;
 #ifdef CONFIG_USER_ONLY
+            target_ulong limit;
             TaskState *ts = cs->opaque;
-#else
-            target_ulong rambase = common_semi_rambase(cs);
 #endif
 
             GET_ARG(0);
@@ -1201,12 +1199,15 @@ target_ulong do_common_semihosting(CPUState *cs)
             retvals[2] = ts->stack_base;
             retvals[3] = 0; /* Stack limit.  */
 #else
-            limit = current_machine->ram_size;
-            /* TODO: Make this use the limit of the loaded application.  */
-            retvals[0] = rambase + limit / 2;
-            retvals[1] = rambase + limit;
-            retvals[2] = rambase + limit; /* Stack base */
-            retvals[3] = rambase; /* Stack limit.  */
+            /*
+             * Reporting 0 indicates we couldn't calculate the real
+             * values which should force most software to fall back to
+             * using information it has.
+             */
+            retvals[0] = 0; /* Heap Base */
+            retvals[1] = 0; /* Heap Limit */
+            retvals[2] = 0; /* Stack base */
+            retvals[3] = 0; /* Stack limit.  */
 #endif
 
             for (i = 0; i < ARRAY_SIZE(retvals); i++) {
-- 
2.20.1
