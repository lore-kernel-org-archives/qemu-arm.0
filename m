Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id m2sm4446648wml.34.2021.03.05.05.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 05:54:54 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 496E51FF8F;
	Fri,  5 Mar 2021 13:54:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bug 1915925 <1915925@bugs.launchpad.net>,
	Keith Packard <keithp@keithp.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v1 3/3] semihosting/arg-compat: fix up handling of SYS_HEAPINFO
Date: Fri,  5 Mar 2021 13:54:51 +0000
Message-Id: <20210305135451.15427-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305135451.15427-1-alex.bennee@linaro.org>
References: <20210305135451.15427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XyDcwVw5C2O1

I'm not sure this every worked properly and it's certainly not
exercised by check-tcg or Peter's semihosting tests. Hoist it into
it's own helper function and attempt to validate the results in the
linux-user semihosting test at the least.

Bug: https://bugs.launchpad.net/bugs/1915925
Cc: Bug 1915925 <1915925@bugs.launchpad.net>
Cc: Keith Packard <keithp@keithp.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/arm/semicall.h      |   1 +
 semihosting/arm-compat-semi.c | 129 +++++++++++++++++++---------------
 tests/tcg/arm/semihosting.c   |  34 ++++++++-
 3 files changed, 107 insertions(+), 57 deletions(-)

diff --git a/tests/tcg/arm/semicall.h b/tests/tcg/arm/semicall.h
index d4f6818192..676a542be5 100644
--- a/tests/tcg/arm/semicall.h
+++ b/tests/tcg/arm/semicall.h
@@ -9,6 +9,7 @@
 
 #define SYS_WRITE0      0x04
 #define SYS_READC       0x07
+#define SYS_HEAPINFO    0x16
 #define SYS_REPORTEXC   0x18
 
 uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 94950b6c56..a8fdbceb5f 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -822,6 +822,78 @@ static const GuestFDFunctions guestfd_fns[] = {
     put_user_utl(val, args + (n) * sizeof(target_ulong))
 #endif
 
+/*
+ * SYS_HEAPINFO is a little weird: "On entry, the PARAMETER REGISTER
+ * contains the address of a pointer to a four-field data block" which
+ * we then fill in. The PARAMETER REGISTER is unchanged.
+ */
+
+struct HeapInfo {
+    target_ulong heap_base;
+    target_ulong heap_limit;
+    target_ulong stack_base;
+    target_ulong stack_limit;
+};
+
+static bool do_heapinfo(CPUState *cs, target_long arg0)
+{
+    target_ulong limit;
+    struct HeapInfo info = {};
+#ifdef CONFIG_USER_ONLY
+    TaskState *ts = cs->opaque;
+#else
+    target_ulong rambase = common_semi_rambase(cs);
+#endif
+
+#ifdef CONFIG_USER_ONLY
+    /*
+     * Some C libraries assume the heap immediately follows .bss, so
+     * allocate it using sbrk.
+     */
+    if (!ts->heap_limit) {
+        abi_ulong ret;
+
+        ts->heap_base = do_brk(0);
+        limit = ts->heap_base + COMMON_SEMI_HEAP_SIZE;
+        /* Try a big heap, and reduce the size if that fails.  */
+        for (;;) {
+            ret = do_brk(limit);
+            if (ret >= limit) {
+                break;
+            }
+            limit = (ts->heap_base >> 1) + (limit >> 1);
+        }
+        ts->heap_limit = limit;
+    }
+
+    info.heap_base = ts->heap_base;
+    info.heap_limit = ts->heap_limit;
+    info.stack_base = ts->stack_base;
+    info.stack_limit = 0; /* Stack limit.  */
+
+    if (copy_to_user(arg0, &info, sizeof(info))) {
+        errno = EFAULT;
+        return  set_swi_errno(cs, -1);
+    }
+#else
+    limit = current_machine->ram_size;
+    /* TODO: Make this use the limit of the loaded application.  */
+    info.heap_base = rambase + limit / 2;
+    info.heap_limit = rambase + limit;
+    info.stack_base = rambase + limit; /* Stack base */
+    info.stack_limit = rambase; /* Stack limit.  */
+
+    if (cpu_memory_rw_debug(cs, arg0, &info, sizeof(info), true)) {
+        errno = EFAULT;
+        return  set_swi_errno(cs, -1);
+    }
+
+#endif
+
+    return 0;
+}
+
+
 /*
  * Do a semihosting call.
  *
@@ -1184,63 +1256,8 @@ target_ulong do_common_semihosting(CPUState *cs)
         }
     case TARGET_SYS_HEAPINFO:
         {
-            target_ulong retvals[4];
-            target_ulong limit;
-            int i;
-#ifdef CONFIG_USER_ONLY
-            TaskState *ts = cs->opaque;
-#else
-            target_ulong rambase = common_semi_rambase(cs);
-#endif
-
             GET_ARG(0);
-
-#ifdef CONFIG_USER_ONLY
-            /*
-             * Some C libraries assume the heap immediately follows .bss, so
-             * allocate it using sbrk.
-             */
-            if (!ts->heap_limit) {
-                abi_ulong ret;
-
-                ts->heap_base = do_brk(0);
-                limit = ts->heap_base + COMMON_SEMI_HEAP_SIZE;
-                /* Try a big heap, and reduce the size if that fails.  */
-                for (;;) {
-                    ret = do_brk(limit);
-                    if (ret >= limit) {
-                        break;
-                    }
-                    limit = (ts->heap_base >> 1) + (limit >> 1);
-                }
-                ts->heap_limit = limit;
-            }
-
-            retvals[0] = ts->heap_base;
-            retvals[1] = ts->heap_limit;
-            retvals[2] = ts->stack_base;
-            retvals[3] = 0; /* Stack limit.  */
-#else
-            limit = current_machine->ram_size;
-            /* TODO: Make this use the limit of the loaded application.  */
-            retvals[0] = rambase + limit / 2;
-            retvals[1] = rambase + limit;
-            retvals[2] = rambase + limit; /* Stack base */
-            retvals[3] = rambase; /* Stack limit.  */
-#endif
-
-            for (i = 0; i < ARRAY_SIZE(retvals); i++) {
-                bool fail;
-
-                fail = SET_ARG(i, retvals[i]);
-
-                if (fail) {
-                    /* Couldn't write back to argument block */
-                    errno = EFAULT;
-                    return set_swi_errno(cs, -1);
-                }
-            }
-            return 0;
+            return do_heapinfo(cs, arg0);
         }
     case TARGET_SYS_EXIT:
     case TARGET_SYS_EXIT_EXTENDED:
diff --git a/tests/tcg/arm/semihosting.c b/tests/tcg/arm/semihosting.c
index 33faac9916..fd5780ec3c 100644
--- a/tests/tcg/arm/semihosting.c
+++ b/tests/tcg/arm/semihosting.c
@@ -7,7 +7,13 @@
  * SPDX-License-Identifier: GPL-3.0-or-later
  */
 
+#define _GNU_SOURCE  /* asprintf is a GNU extension */
+
 #include <stdint.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
 #include "semicall.h"
 
 int main(int argc, char *argv[argc])
@@ -18,8 +24,34 @@ int main(int argc, char *argv[argc])
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
+    char *heap_info, *stack_info;
+    void *brk = sbrk(0);
+
+    __semi_call(SYS_WRITE0, (uintptr_t) "Hello World\n");
+
+    memset(&info, 0, sizeof(info));
+    __semi_call(SYS_HEAPINFO, (uintptr_t) &ptr_to_info);
+
+    asprintf(&heap_info, "heap: %p -> %p\n", info.heap_base, info.heap_limit);
+    __semi_call(SYS_WRITE0, (uintptr_t) heap_info);
+    if (info.heap_base != brk) {
+        sprintf(heap_info, "heap mismatch: %p\n", brk);
+        __semi_call(SYS_WRITE0, (uintptr_t) heap_info);
+        return -1;
+    }
+
+    asprintf(&stack_info, "stack: %p -> %p\n", info.stack_base, info.stack_limit);
+    __semi_call(SYS_WRITE0, (uintptr_t) stack_info);
+    free(heap_info);
+    free(stack_info);
 
-    __semi_call(SYS_WRITE0, (uintptr_t) "Hello World");
     __semi_call(SYS_REPORTEXC, exit_code);
     /* if we get here we failed */
     return -1;
-- 
2.20.1
