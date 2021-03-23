Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id r17sm13251449edm.89.2021.03.23.09.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 09:53:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8C66B1FF91;
	Tue, 23 Mar 2021 16:53:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v2 05/22] semihosting: move semihosting tests to multiarch
Date: Tue, 23 Mar 2021 16:52:51 +0000
Message-Id: <20210323165308.15244-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323165308.15244-1-alex.bennee@linaro.org>
References: <20210323165308.15244-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /0oY4sveTO2v

It may be arm-compat-semihosting but more than one architecture uses
it so lets move the tests into the multiarch area. We gate it on the
feature and split the semicall.h header between the arches.

Also clean-up a bit of the Makefile messing about to one common set of
runners.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210312102029.17017-2-alex.bennee@linaro.org>
Message-Id: <20210320133706.21475-6-alex.bennee@linaro.org>
---
 tests/tcg/aarch64/semicall.h                  | 18 +++++++++++
 tests/tcg/arm/semicall.h                      | 15 +--------
 tests/tcg/riscv64/semicall.h                  | 22 +++++++++++++
 .../arm-compat-semi}/semiconsole.c            |  2 ++
 .../arm-compat-semi}/semihosting.c            |  5 ++-
 MAINTAINERS                                   |  1 +
 tests/tcg/Makefile.target                     |  3 ++
 tests/tcg/aarch64/Makefile.target             | 18 -----------
 tests/tcg/arm/Makefile.target                 | 22 ++++++-------
 tests/tcg/multiarch/Makefile.target           | 31 +++++++++++++++++++
 10 files changed, 91 insertions(+), 46 deletions(-)
 create mode 100644 tests/tcg/aarch64/semicall.h
 create mode 100644 tests/tcg/riscv64/semicall.h
 rename tests/tcg/{arm => multiarch/arm-compat-semi}/semiconsole.c (93%)
 rename tests/tcg/{arm => multiarch/arm-compat-semi}/semihosting.c (85%)

diff --git a/tests/tcg/aarch64/semicall.h b/tests/tcg/aarch64/semicall.h
new file mode 100644
index 0000000000..8a3fce35c5
--- /dev/null
+++ b/tests/tcg/aarch64/semicall.h
@@ -0,0 +1,18 @@
+/*
+ * Semihosting Tests - AArch64 helper
+ *
+ * Copyright (c) 2019
+ * Written by Alex Bennée <alex.bennee@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-3.0-or-later
+ */
+
+uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
+{
+    register uintptr_t t asm("x0") = type;
+    register uintptr_t a0 asm("x1") = arg0;
+    asm("hlt 0xf000"
+        : "=r" (t)
+        : "r" (t), "r" (a0));
+    return t;
+}
diff --git a/tests/tcg/arm/semicall.h b/tests/tcg/arm/semicall.h
index d4f6818192..ad8ac51310 100644
--- a/tests/tcg/arm/semicall.h
+++ b/tests/tcg/arm/semicall.h
@@ -1,5 +1,5 @@
 /*
- * Semihosting Tests
+ * Semihosting Tests - ARM Helper
  *
  * Copyright (c) 2019
  * Written by Alex Bennée <alex.bennee@linaro.org>
@@ -7,13 +7,8 @@
  * SPDX-License-Identifier: GPL-3.0-or-later
  */
 
-#define SYS_WRITE0      0x04
-#define SYS_READC       0x07
-#define SYS_REPORTEXC   0x18
-
 uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
 {
-#if defined(__arm__)
     register uintptr_t t asm("r0") = type;
     register uintptr_t a0 asm("r1") = arg0;
 #ifdef __thumb__
@@ -23,13 +18,5 @@ uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
 #endif
     asm(SVC : "=r" (t)
         : "r" (t), "r" (a0));
-#else
-    register uintptr_t t asm("x0") = type;
-    register uintptr_t a0 asm("x1") = arg0;
-    asm("hlt 0xf000"
-        : "=r" (t)
-        : "r" (t), "r" (a0));
-#endif
-
     return t;
 }
diff --git a/tests/tcg/riscv64/semicall.h b/tests/tcg/riscv64/semicall.h
new file mode 100644
index 0000000000..f8c88f32dc
--- /dev/null
+++ b/tests/tcg/riscv64/semicall.h
@@ -0,0 +1,22 @@
+/*
+ * Semihosting Tests - RiscV64 Helper
+ *
+ * Copyright (c) 2021
+ * Written by Alex Bennée <alex.bennee@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-3.0-or-later
+ */
+
+uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
+{
+    register uintptr_t t asm("a0") = type;
+    register uintptr_t a0 asm("a1") = arg0;
+    asm(".option norvc\n\t"
+        ".balign 16\n\t"
+        "slli zero, zero, 0x1f\n\t"
+        "ebreak\n\t"
+        "srai zero, zero, 0x7\n\t"
+        : "=r" (t)
+        : "r" (t), "r" (a0));
+    return t;
+}
diff --git a/tests/tcg/arm/semiconsole.c b/tests/tcg/multiarch/arm-compat-semi/semiconsole.c
similarity index 93%
rename from tests/tcg/arm/semiconsole.c
rename to tests/tcg/multiarch/arm-compat-semi/semiconsole.c
index 6ef0bd2450..1d82efc589 100644
--- a/tests/tcg/arm/semiconsole.c
+++ b/tests/tcg/multiarch/arm-compat-semi/semiconsole.c
@@ -7,6 +7,8 @@
  * SPDX-License-Identifier: GPL-3.0-or-later
  */
 
+#define SYS_READC       0x07
+
 #include <stdio.h>
 #include <stdint.h>
 #include "semicall.h"
diff --git a/tests/tcg/arm/semihosting.c b/tests/tcg/multiarch/arm-compat-semi/semihosting.c
similarity index 85%
rename from tests/tcg/arm/semihosting.c
rename to tests/tcg/multiarch/arm-compat-semi/semihosting.c
index 33faac9916..b3fd16cd12 100644
--- a/tests/tcg/arm/semihosting.c
+++ b/tests/tcg/multiarch/arm-compat-semi/semihosting.c
@@ -7,12 +7,15 @@
  * SPDX-License-Identifier: GPL-3.0-or-later
  */
 
+#define SYS_WRITE0      0x04
+#define SYS_REPORTEXC   0x18
+
 #include <stdint.h>
 #include "semicall.h"
 
 int main(int argc, char *argv[argc])
 {
-#if defined(__arm__)
+#if UINTPTR_MAX == UINT32_MAX
     uintptr_t exit_code = 0x20026;
 #else
     uintptr_t exit_block[2] = {0x20026, 0};
diff --git a/MAINTAINERS b/MAINTAINERS
index 9147e9a429..8249014614 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3284,6 +3284,7 @@ M: Alex Bennée <alex.bennee@linaro.org>
 S: Maintained
 F: semihosting/
 F: include/semihosting/
+F: tests/tcg/multiarch/arm-compat-semi/
 
 Multi-process QEMU
 M: Elena Ufimtseva <elena.ufimtseva@oracle.com>
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 24d75a5801..cab8c6b3a2 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -32,6 +32,9 @@
 all:
 -include ../../../config-host.mak
 -include ../config-$(TARGET).mak
+ifeq ($(CONFIG_USER_ONLY),y)
+-include $(SRC_PATH)/default-configs/targets/$(TARGET).mak
+endif
 
 # for including , in command strings
 COMMA := ,
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index bf53ad0087..56e48f4b34 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -41,24 +41,6 @@ AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4
 mte-%: CFLAGS += -march=armv8.5-a+memtag
 endif
 
-# Semihosting smoke test for linux-user
-AARCH64_TESTS += semihosting
-run-semihosting: semihosting
-	$(call run-test,$<,$(QEMU) $< 2> $<.err, "$< on $(TARGET_NAME)")
-
-run-plugin-semihosting-with-%:
-	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
-		-plugin $(PLUGIN_LIB)/$(call extract-plugin,$@) \
-		 $(call strip-plugin,$<) 2> $<.err, \
-		"$< on $(TARGET_NAME) with $*")
-
-AARCH64_TESTS += semiconsole
-run-semiconsole: semiconsole
-	$(call skip-test, $<, "MANUAL ONLY")
-
-run-plugin-semiconsole-with-%:
-	$(call skip-test, $<, "MANUAL ONLY")
-
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_SVE),)
 # System Registers Tests
 AARCH64_TESTS += sysregs
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index ec95156562..5ab59ed6ce 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -29,37 +29,31 @@ run-fcvt: fcvt
 	$(call run-test,fcvt,$(QEMU) $<,"$< on $(TARGET_NAME)")
 	$(call diff-out,fcvt,$(ARM_SRC)/fcvt.ref)
 
+ifeq ($(CONFIG_ARM_COMPATIBLE_SEMIHOSTING),y)
+
 # Semihosting smoke test for linux-user
-ARM_TESTS += semihosting
 semihosting: CFLAGS += -mthumb
-run-semihosting: semihosting
-	$(call run-test,$<,$(QEMU) $< 2> $<.err, "$< on $(TARGET_NAME)")
 
 ARM_TESTS += semihosting-arm
-semihosting-arm: CFLAGS += -marm
+semihosting-arm: CFLAGS += -marm -I$(SRC_PATH)/tests/tcg/$(TARGET_NAME)
 semihosting-arm: semihosting.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 
 run-semihosting-arm: semihosting-arm
 	$(call run-test,$<,$(QEMU) $< 2> $<.err, "$< on $(TARGET_NAME)")
 
-run-plugin-semihosting-with-%:
+run-plugin-semihosting-arm-with-%:
 	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
 		-plugin $(PLUGIN_LIB)/$(call extract-plugin,$@) \
 		 $(call strip-plugin,$<) 2> $<.err, \
 		"$< on $(TARGET_NAME) with $*")
 
-ARM_TESTS += semiconsole semiconsole-arm
+ARM_TESTS += semiconsole-arm
 
 semiconsole: CFLAGS += -mthumb
-run-semiconsole: semiconsole
-	$(call skip-test, $<, "MANUAL ONLY")
 
-run-plugin-semiconsole-with-%:
-	$(call skip-test, $<, "MANUAL ONLY")
-
-semiconsole-arm: CFLAGS += -marm
-semiconsole-arm: semiconsole.c
+semiconsole-arm: CFLAGS += -marm -I$(SRC_PATH)/tests/tcg/$(TARGET_NAME)
+semiconsole-arm: semihosting.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 
 run-semiconsole-arm: semiconsole-arm
@@ -68,6 +62,8 @@ run-semiconsole-arm: semiconsole-arm
 run-plugin-semiconsole-arm-with-%:
 	$(call skip-test, $<, "MANUAL ONLY")
 
+endif
+
 ARM_TESTS += commpage
 
 TESTS += $(ARM_TESTS)
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index abbdb2e126..a3a751723d 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -69,6 +69,37 @@ run-gdbstub-%:
 endif
 EXTRA_RUNS += run-gdbstub-sha1 run-gdbstub-qxfer-auxv-read
 
+# ARM Compatible Semi Hosting Tests
+#
+# Despite having ARM in the name we actually have several
+# architectures that implement it. We gate the tests on the feature
+# appearing in config.
+#
+ifeq ($(CONFIG_ARM_COMPATIBLE_SEMIHOSTING),y)
+VPATH += $(MULTIARCH_SRC)/arm-compat-semi
+
+# Add -I path back to TARGET_NAME for semicall.h
+semihosting: CFLAGS+=-I$(SRC_PATH)/tests/tcg/$(TARGET_NAME)
+
+run-semihosting: semihosting
+	$(call run-test,$<,$(QEMU) $< 2> $<.err, "$< on $(TARGET_NAME)")
+
+run-plugin-semihosting-with-%:
+	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
+		-plugin $(PLUGIN_LIB)/$(call extract-plugin,$@) \
+		 $(call strip-plugin,$<) 2> $<.err, \
+		"$< on $(TARGET_NAME) with $*")
+
+semiconsole: CFLAGS+=-I$(SRC_PATH)/tests/tcg/$(TARGET_NAME)
+
+run-semiconsole: semiconsole
+	$(call skip-test, $<, "MANUAL ONLY")
+
+run-plugin-semiconsole-with-%:
+	$(call skip-test, $<, "MANUAL ONLY")
+
+TESTS += semihosting semiconsole
+endif
 
 # Update TESTS
 TESTS += $(MULTIARCH_TESTS)
-- 
2.20.1
