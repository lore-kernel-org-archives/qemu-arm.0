Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id ku15sm5624043ejc.25.2022.02.10.03.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 03:30:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B81B91FFBA;
	Thu, 10 Feb 2022 11:30:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v5 2/2] tests/tcg: port SYS_HEAPINFO to a system test
Date: Thu, 10 Feb 2022 11:30:21 +0000
Message-Id: <20220210113021.3799514-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220210113021.3799514-1-alex.bennee@linaro.org>
References: <20220210113021.3799514-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: g5sTGiAZ12J7

This allows us to check our new SYS_HEAPINFO implementation generates
sane values.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v5
  - static init of heapinfo structure
  - clean-up comment on why we can test stack position
  - add memory clobber for semicall
  - test we can read/write to a portion of the heap
  - fix MAINTAINERS
---
 tests/tcg/aarch64/system/semiheap.c | 93 +++++++++++++++++++++++++++++
 MAINTAINERS                         |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 tests/tcg/aarch64/system/semiheap.c

diff --git a/tests/tcg/aarch64/system/semiheap.c b/tests/tcg/aarch64/system/semiheap.c
new file mode 100644
index 0000000000..4ed258476d
--- /dev/null
+++ b/tests/tcg/aarch64/system/semiheap.c
@@ -0,0 +1,93 @@
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
+        : "r" (t), "r" (a0)
+        : "memory" );
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
+    } info = { };
+    void *ptr_to_info = (void *) &info;
+    uint32_t *ptr_to_heap;
+    int i;
+
+    ml_printf("Semihosting Heap Info Test\n");
+
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
+     * boot.S put our stack somewhere inside the data segment of the
+     * ELF file, and we know that SYS_HEAPINFO won't pick a range
+     * that overlaps with part of a loaded ELF file. So the info
+     * struct (on the stack) should not be inside the reported heap.
+     */
+    if (ptr_to_info > info.heap_base && ptr_to_info < info.heap_limit) {
+        ml_printf("info appears to be inside the heap: %p in %p:%p\n",
+               ptr_to_info, info.heap_base, info.heap_limit);
+        return -4;
+    }
+
+    ml_printf("heap: %p -> %p\n", info.heap_base, info.heap_limit);
+    ml_printf("stack: %p <- %p\n", info.stack_limit, info.stack_base);
+
+    /* finally can we read/write the heap */
+    ptr_to_heap = (uint32_t *) info.heap_base;
+    for (i = 0; i < 512; i++) {
+        *ptr_to_heap++ = i;
+    }
+    ptr_to_heap = (uint32_t *) info.heap_base;
+    for (i = 0; i < 512; i++) {
+        uint32_t tmp = *ptr_to_heap;
+        if (tmp != i) {
+            ml_printf("unexpected value in heap: %d @ %p", tmp, ptr_to_heap);
+            return -5;
+        }
+        ptr_to_heap++;
+    }
+    ml_printf("r/w to heap upto %p\n", ptr_to_heap);
+
+    ml_printf("Passed HeapInfo checks\n");
+    return 0;
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index b0b845f445..251f96af9e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3536,6 +3536,7 @@ S: Maintained
 F: semihosting/
 F: include/semihosting/
 F: tests/tcg/multiarch/arm-compat-semi/
+F: tests/tcg/aarch64/system/semiheap.c
 
 Multi-process QEMU
 M: Elena Ufimtseva <elena.ufimtseva@oracle.com>
-- 
2.30.2
