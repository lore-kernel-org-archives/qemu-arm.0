Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id d6sm2530500eje.20.2021.03.12.02.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 02:20:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 28A9B1FF91;
	Fri, 12 Mar 2021 10:20:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: keithp@keithp.com,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v5 5/5] tests/tcg: add HeapInfo checking to semihosting test
Date: Fri, 12 Mar 2021 10:20:29 +0000
Message-Id: <20210312102029.17017-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312102029.17017-1-alex.bennee@linaro.org>
References: <20210312102029.17017-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Cohp9Ve8PP1J

Query the SYS_HEAPINFO semicall and do some basic verification of the
information via libc calls.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v5
  - drop asnprintf, just mix printf output
  - don't use brk() but do sanity check
---
 .../multiarch/arm-compat-semi/semihosting.c   | 44 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/multiarch/arm-compat-semi/semihosting.c b/tests/tcg/multiarch/arm-compat-semi/semihosting.c
index b3fd16cd12..8e9cfb578c 100644
--- a/tests/tcg/multiarch/arm-compat-semi/semihosting.c
+++ b/tests/tcg/multiarch/arm-compat-semi/semihosting.c
@@ -8,9 +8,13 @@
  */
 
 #define SYS_WRITE0      0x04
+#define SYS_HEAPINFO    0x16
 #define SYS_REPORTEXC   0x18
 
 #include <stdint.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
 #include "semicall.h"
 
 int main(int argc, char *argv[argc])
@@ -21,8 +25,46 @@ int main(int argc, char *argv[argc])
     uintptr_t exit_block[2] = {0x20026, 0};
     uintptr_t exit_code = (uintptr_t) &exit_block;
 #endif
+    struct {
+        void *heap_base;
+        void *heap_limit;
+        void *stack_base;
+        void *stack_limit;
+    } info;
+    void *ptr_to_info = (void *) &info;
 
-    __semi_call(SYS_WRITE0, (uintptr_t) "Hello World");
+    __semi_call(SYS_WRITE0, (uintptr_t) "Checking HeapInfo\n");
+
+    memset(&info, 0, sizeof(info));
+    __semi_call(SYS_HEAPINFO, (uintptr_t) &ptr_to_info);
+
+    if (info.heap_base == NULL || info.heap_limit == NULL) {
+        printf("null heap: %p -> %p\n", info.heap_base, info.heap_limit);
+        exit(1);
+    } else if (info.heap_base != NULL && info.heap_limit != NULL) {
+        /* Error if heap base is above limit */
+        if ((uintptr_t) info.heap_base >= (uintptr_t) info.heap_limit) {
+            printf("heap base %p >= heap_limit %p\n",
+                   info.heap_base, info.heap_limit);
+            exit(2);
+        }
+    }
+
+    if (info.stack_base == NULL) {
+        printf("null stack: %p -> %p\n", info.stack_base, info.stack_limit);
+        exit(3);
+    } else if (info.stack_base != NULL && info.stack_limit != NULL) {
+        /* Error if stack base is below limit */
+        if ((uintptr_t) info.stack_base < (uintptr_t) info.stack_limit) {
+            printf("stack base %p < stack_limit %p\n",
+                   info.stack_base, info.stack_limit);
+            exit(4);
+        }
+    }
+    printf("heap: %p -> %p\n", info.heap_base, info.heap_limit);
+    printf("stack: %p -> %p\n", info.stack_base, info.stack_limit);
+
+    __semi_call(SYS_WRITE0, (uintptr_t) "Passed HeapInfo checks");
     __semi_call(SYS_REPORTEXC, exit_code);
     /* if we get here we failed */
     return -1;
-- 
2.20.1
