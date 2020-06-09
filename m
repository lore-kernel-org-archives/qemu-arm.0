Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id h12sm2807281wro.80.2020.06.09.03.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 03:38:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E55D61FF9B;
	Tue,  9 Jun 2020 11:38:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 12/17] tests/tcg: add simple commpage test case
Date: Tue,  9 Jun 2020 11:38:04 +0100
Message-Id: <20200609103809.23443-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200609103809.23443-1-alex.bennee@linaro.org>
References: <20200609103809.23443-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: eO5DKbTj24zL

The COMMPAGE are a number of kernel provided user-space routines for
32 bit ARM systems. Add a basic series of smoke tests to ensure it is
working as it should.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200605154929.26910-14-alex.bennee@linaro.org>

diff --git a/tests/tcg/arm/commpage.c b/tests/tcg/arm/commpage.c
new file mode 100644
index 00000000000..c76e70cb8bd
--- /dev/null
+++ b/tests/tcg/arm/commpage.c
@@ -0,0 +1,61 @@
+/*
+ * Verify the COMMPAGE emulation
+ *
+ * The ARM commpage is a set of user space helper functions provided
+ * by the kernel in an effort to ease portability of user space code
+ * between different CPUs with potentially different capabilities. It
+ * is a 32 bit invention and similar to the vdso segment in many ways.
+ *
+ * The ABI is documented in the Linux kernel:
+ *     Documentation/arm/kernel_userspace_helpers.rst
+ *
+ * Copyright (c) 2020 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <stdint.h>
+
+#define ARM_COMMPAGE      (0xffff0f00u)
+#define ARM_KUSER_VERSION (*(int32_t *)(ARM_COMMPAGE + 0xfc))
+typedef void * (get_tls_fn)(void);
+#define ARM_KUSER_GET_TLS (*(get_tls_fn *)(ARM_COMMPAGE + 0xe0))
+typedef int (cmpxchg_fn)(int oldval, int newval, volatile int *ptr);
+#define ARM_KUSER_CMPXCHG (*(cmpxchg_fn *)(ARM_COMMPAGE + 0xc0))
+typedef void (dmb_fn)(void);
+#define ARM_KUSER_DMB (*(dmb_fn *)(ARM_COMMPAGE + 0xa0))
+typedef int (cmpxchg64_fn)(const int64_t *oldval,
+                           const int64_t *newval,
+                           volatile int64_t *ptr);
+#define ARM_KUSER_CMPXCHG64 (*(cmpxchg64_fn *)(ARM_COMMPAGE + 0x60))
+
+#define fail_unless(x)                                                  \
+    do {                                                                \
+        if (!(x)) {                                                     \
+            fprintf(stderr, "FAILED at %s:%d\n", __FILE__, __LINE__);   \
+            exit(EXIT_FAILURE);                                         \
+        }                                                               \
+    } while (0)
+
+
+int main(int argc, char *argv[argc])
+{
+    void *kuser_tls;
+    int val = 1;
+    const int64_t oldval = 1, newval = 2;
+    int64_t val64 = 1;
+
+    fail_unless(ARM_KUSER_VERSION == 0x5);
+    kuser_tls = ARM_KUSER_GET_TLS();
+    printf("TLS = %p\n", kuser_tls);
+    fail_unless(kuser_tls != 0);
+    fail_unless(ARM_KUSER_CMPXCHG(1, 2, &val) == 0);
+    printf("val = %d\n", val);
+    /* this is a crash test, not checking an actual barrier occurs */
+    ARM_KUSER_DMB();
+    fail_unless(ARM_KUSER_CMPXCHG64(&oldval, &newval, &val64) == 0);
+    printf("val64 = %lld\n", val64);
+    return 0;
+}
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index 11c39c601ea..3da09a38be7 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -68,6 +68,8 @@ run-semiconsole-arm: semiconsole-arm
 run-plugin-semiconsole-arm-with-%:
 	$(call skip-test, $<, "MANUAL ONLY")
 
+ARM_TESTS += commpage
+
 TESTS += $(ARM_TESTS)
 
 # On ARM Linux only supports 4k pages
-- 
2.20.1
