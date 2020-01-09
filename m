Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q15sm8326055wrr.11.2020.01.09.06.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 06:19:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2CCA01FF9D;
	Thu,  9 Jan 2020 14:19:00 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL v2 13/14] tests/tcg: extract __semi_call into a header and expand
Date: Thu,  9 Jan 2020 14:18:57 +0000
Message-Id: <20200109141858.14376-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200109141858.14376-1-alex.bennee@linaro.org>
References: <20200109141858.14376-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fkhpaBAW2JXm

There are two types of ARM semicall - lets test them both. Putting the
logic in a header will make re-using the functions easier later.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

diff --git a/tests/tcg/arm/semicall.h b/tests/tcg/arm/semicall.h
new file mode 100644
index 00000000000..d4f6818192d
--- /dev/null
+++ b/tests/tcg/arm/semicall.h
@@ -0,0 +1,35 @@
+/*
+ * Semihosting Tests
+ *
+ * Copyright (c) 2019
+ * Written by Alex Bennée <alex.bennee@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-3.0-or-later
+ */
+
+#define SYS_WRITE0      0x04
+#define SYS_READC       0x07
+#define SYS_REPORTEXC   0x18
+
+uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
+{
+#if defined(__arm__)
+    register uintptr_t t asm("r0") = type;
+    register uintptr_t a0 asm("r1") = arg0;
+#ifdef __thumb__
+#  define SVC  "svc 0xab"
+#else
+#  define SVC  "svc 0x123456"
+#endif
+    asm(SVC : "=r" (t)
+        : "r" (t), "r" (a0));
+#else
+    register uintptr_t t asm("x0") = type;
+    register uintptr_t a0 asm("x1") = arg0;
+    asm("hlt 0xf000"
+        : "=r" (t)
+        : "r" (t), "r" (a0));
+#endif
+
+    return t;
+}
diff --git a/tests/tcg/arm/semihosting.c b/tests/tcg/arm/semihosting.c
index 09c89cb481a..33faac9916e 100644
--- a/tests/tcg/arm/semihosting.c
+++ b/tests/tcg/arm/semihosting.c
@@ -8,26 +8,7 @@
  */
 
 #include <stdint.h>
-
-#define SYS_WRITE0      0x04
-#define SYS_REPORTEXC   0x18
-
-void __semi_call(uintptr_t type, uintptr_t arg0)
-{
-#if defined(__arm__)
-    register uintptr_t t asm("r0") = type;
-    register uintptr_t a0 asm("r1") = arg0;
-    asm("svc 0xab"
-        : /* no return */
-        : "r" (t), "r" (a0));
-#else
-    register uintptr_t t asm("x0") = type;
-    register uintptr_t a0 asm("x1") = arg0;
-    asm("hlt 0xf000"
-        : /* no return */
-        : "r" (t), "r" (a0));
-#endif
-}
+#include "semicall.h"
 
 int main(int argc, char *argv[argc])
 {
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index 0765f37ff04..41aa26f4e17 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -31,9 +31,18 @@ run-fcvt: fcvt
 
 # Semihosting smoke test for linux-user
 ARM_TESTS += semihosting
+semihosting: CFLAGS += -mthumb
 run-semihosting: semihosting
 	$(call run-test,$<,$(QEMU) $< 2> $<.err, "$< on $(TARGET_NAME)")
 
+ARM_TESTS += semihosting-arm
+semihosting-arm: CFLAGS += -marm
+semihosting-arm: semihosting.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+run-semihosting-arm: semihosting-arm
+	$(call run-test,$<,$(QEMU) $< 2> $<.err, "$< on $(TARGET_NAME)")
+
 run-plugin-semihosting-with-%:
 	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
 		-plugin $(PLUGIN_DIR)/$(call extract-plugin,$@) \
-- 
2.20.1
