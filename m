Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id o18sm8645529wmq.23.2021.06.10.03.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 03:26:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E1A1A1FF7E;
	Thu, 10 Jun 2021 11:26:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Andrew Strauss <astrauss11@gmail.com>
Subject: [PATCH v2] semihosting/arm-compat: remove heuristic softmmu SYS_HEAPINFO
Date: Thu, 10 Jun 2021 11:26:17 +0100
Message-Id: <20210610102617.17281-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: IcMSK7170Mco

The previous numbers were a guess at best. While we could extract the
information from a loaded ELF file via -kernel we could still get
tripped up by self decompressing or relocating code. Besides sane
library code like newlib will fall back to known symbols to determine
of the location of the heap. We can still report the limits though as
we are reasonably confident that busting out of RAM would be a bad
thing for either stack or heap.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Andrew Strauss <astrauss11@gmail.com>
Reviewed-by: Andrew Strauss <astrauss11@gmail.com>
Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>

---
v2
  - report some known information (limits)
  - reword the commit message
---
 semihosting/arm-compat-semi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 1c29146dcf..8873486e8c 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -1202,10 +1202,14 @@ target_ulong do_common_semihosting(CPUState *cs)
             retvals[3] = 0; /* Stack limit.  */
 #else
             limit = current_machine->ram_size;
-            /* TODO: Make this use the limit of the loaded application.  */
-            retvals[0] = rambase + limit / 2;
-            retvals[1] = rambase + limit;
-            retvals[2] = rambase + limit; /* Stack base */
+            /*
+             * Reporting 0 indicates we couldn't calculate the real
+             * values which should force most software to fall back to
+             * using information it has.
+             */
+            retvals[0] = 0; /* Heap Base */
+            retvals[1] = rambase + limit; /* Heap Limit */
+            retvals[2] = 0; /* Stack base */
             retvals[3] = rambase; /* Stack limit.  */
 #endif
 
-- 
2.20.1
