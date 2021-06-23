Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id o11sm39675wmq.1.2021.06.23.06.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 06:47:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 34CB91FF8C;
	Wed, 23 Jun 2021 14:47:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v4 2/2] tests/tcg: port SYS_HEAPINFO to a system test
Date: Wed, 23 Jun 2021 14:47:56 +0100
Message-Id: <20210623134756.30930-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210623134756.30930-1-alex.bennee@linaro.org>
References: <20210623134756.30930-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: o52BoFXWaH/t

This allows us to check our new SYS_HEAPINFO implementation generates
sane values.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/system/semiheap.c | 74 +++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 tests/tcg/aarch64/system/semiheap.c

diff --git a/tests/tcg/aarch64/system/semiheap.c b/tests/tcg/aarch64/system/semiheap.c
new file mode 100644
index 0000000000..d5613dca59
--- /dev/null
+++ b/tests/tcg/aarch64/system/semiheap.c
@@ -0,0 +1,74 @@
+/*
+ * Semihosting System HEAPINFO Test
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <inttypes.h>
+#include <stddef.h>
+#include <minilib.h>
+
+#define SYS_HEAPINFO    0x16
+
+uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
+{
+    register uintptr_t t asm("x0") = type;
+    register uintptr_t a0 asm("x1") = arg0;
+    asm("hlt 0xf000"
+        : "=r" (t)
+        : "r" (t), "r" (a0));
+
+    return t;
+}
+
+int main(int argc, char *argv[argc])
+{
+    struct {
+        void *heap_base;
+        void *heap_limit;
+        void *stack_base;
+        void *stack_limit;
+    } info;
+    void *ptr_to_info = (void *) &info;
+
+    ml_printf("Semihosting Heap Info Test\n");
+
+    /* memset(&info, 0, sizeof(info)); */
+    __semi_call(SYS_HEAPINFO, (uintptr_t) &ptr_to_info);
+
+    if (info.heap_base == NULL || info.heap_limit == NULL) {
+        ml_printf("null heap: %p -> %p\n", info.heap_base, info.heap_limit);
+        return -1;
+    }
+
+    /* Error if heap base is above limit */
+    if ((uintptr_t) info.heap_base >= (uintptr_t) info.heap_limit) {
+        ml_printf("heap base %p >= heap_limit %p\n",
+               info.heap_base, info.heap_limit);
+        return -2;
+    }
+
+    if (info.stack_base == NULL) {
+        ml_printf("null stack: %p -> %p\n", info.stack_base, info.stack_limit);
+        return -3;
+    }
+
+    /*
+     * We don't check our local variables are inside the reported
+     * stack because the runtime may select a different stack area (as
+     * our boot.S code does). However we can check we don't clash with
+     * the heap.
+     */
+    if (ptr_to_info > info.heap_base && ptr_to_info < info.heap_limit) {
+        ml_printf("info appears to be inside the heap: %p in %p:%p\n",
+               ptr_to_info, info.heap_base, info.heap_limit);
+        return -4;
+    }
+
+    ml_printf("heap: %p -> %p\n", info.heap_base, info.heap_limit);
+    ml_printf("stack: %p <- %p\n", info.stack_limit, info.stack_base);
+    ml_printf("Passed HeapInfo checks\n");
+    return 0;
+}
-- 
2.20.1
