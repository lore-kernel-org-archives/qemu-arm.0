Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a7sm25915726wra.43.2019.09.11.09.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 09:50:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D3B691FF92;
	Wed, 11 Sep 2019 17:50:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH  v5 5/5] target/arm: remove run-time semihosting checks for linux-user
Date: Wed, 11 Sep 2019 17:49:59 +0100
Message-Id: <20190911164959.11003-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190911164959.11003-1-alex.bennee@linaro.org>
References: <20190911164959.11003-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: le4/2ybrOx14

Now we do all our checking at translate time we can make cpu_loop a
little bit simpler. We also introduce a simple linux-user semihosting
test case to defend the functionality. The out-of-tree softmmu based
semihosting tests are still more comprehensive.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/arm/cpu_loop.c         |  3 ---
 linux-user/arm/target_syscall.h   |  3 ---
 tests/tcg/aarch64/Makefile.target |  5 ++++
 tests/tcg/arm/Makefile.target     |  5 ++++
 tests/tcg/arm/semihosting.c       | 45 +++++++++++++++++++++++++++++++
 5 files changed, 55 insertions(+), 6 deletions(-)
 create mode 100644 tests/tcg/arm/semihosting.c

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 8d65de5b9f4..e28c45cd4ab 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -325,9 +325,6 @@ void cpu_loop(CPUARMState *env)
 
                 if (n == ARM_NR_cacheflush) {
                     /* nop */
-                } else if (n == ARM_NR_semihosting
-                           || n == ARM_NR_thumb_semihosting) {
-                    env->regs[0] = do_arm_semihosting (env);
                 } else if (n == 0 || n >= ARM_SYSCALL_BASE || env->thumb) {
                     /* linux syscall */
                     if (env->thumb || n == 0) {
diff --git a/linux-user/arm/target_syscall.h b/linux-user/arm/target_syscall.h
index afc0772e194..f85cbdaf56f 100644
--- a/linux-user/arm/target_syscall.h
+++ b/linux-user/arm/target_syscall.h
@@ -18,9 +18,6 @@ struct target_pt_regs {
 #define ARM_NR_set_tls	  (ARM_NR_BASE + 5)
 #define ARM_NR_get_tls    (ARM_NR_BASE + 6)
 
-#define ARM_NR_semihosting	  0x123456
-#define ARM_NR_thumb_semihosting  0xAB
-
 #if defined(TARGET_WORDS_BIGENDIAN)
 #define UNAME_MACHINE "armv5teb"
 #else
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 9758f89f905..509f1afa93d 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -21,4 +21,9 @@ run-fcvt: fcvt
 AARCH64_TESTS += pauth-1 pauth-2
 run-pauth-%: QEMU_OPTS += -cpu max
 
+# Semihosting smoke test for linux-user
+AARCH64_TESTS += semihosting
+run-semihosting: semihosting
+	$(call run-test,$<,$(QEMU) $< 2> $<.err, "$< on $(TARGET_NAME)")
+
 TESTS += $(AARCH64_TESTS)
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index 7347d3d0adb..3b7fc9a64be 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -27,6 +27,11 @@ run-fcvt: fcvt
 	$(call run-test,fcvt,$(QEMU) $<,"$< on $(TARGET_NAME)")
 	$(call diff-out,fcvt,$(ARM_SRC)/fcvt.ref)
 
+# Semihosting smoke test for linux-user
+ARM_TESTS += semihosting
+run-semihosting: semihosting
+	$(call run-test,$<,$(QEMU) $< 2> $<.err, "$< on $(TARGET_NAME)")
+
 TESTS += $(ARM_TESTS)
 
 # On ARM Linux only supports 4k pages
diff --git a/tests/tcg/arm/semihosting.c b/tests/tcg/arm/semihosting.c
new file mode 100644
index 00000000000..09c89cb481a
--- /dev/null
+++ b/tests/tcg/arm/semihosting.c
@@ -0,0 +1,45 @@
+/*
+ * linux-user semihosting checks
+ *
+ * Copyright (c) 2019
+ * Written by Alex Bennée <alex.bennee@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-3.0-or-later
+ */
+
+#include <stdint.h>
+
+#define SYS_WRITE0      0x04
+#define SYS_REPORTEXC   0x18
+
+void __semi_call(uintptr_t type, uintptr_t arg0)
+{
+#if defined(__arm__)
+    register uintptr_t t asm("r0") = type;
+    register uintptr_t a0 asm("r1") = arg0;
+    asm("svc 0xab"
+        : /* no return */
+        : "r" (t), "r" (a0));
+#else
+    register uintptr_t t asm("x0") = type;
+    register uintptr_t a0 asm("x1") = arg0;
+    asm("hlt 0xf000"
+        : /* no return */
+        : "r" (t), "r" (a0));
+#endif
+}
+
+int main(int argc, char *argv[argc])
+{
+#if defined(__arm__)
+    uintptr_t exit_code = 0x20026;
+#else
+    uintptr_t exit_block[2] = {0x20026, 0};
+    uintptr_t exit_code = (uintptr_t) &exit_block;
+#endif
+
+    __semi_call(SYS_WRITE0, (uintptr_t) "Hello World");
+    __semi_call(SYS_REPORTEXC, exit_code);
+    /* if we get here we failed */
+    return -1;
+}
-- 
2.20.1
