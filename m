Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id t63sm1621003wmt.6.2019.07.03.03.22.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 03:22:18 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 119FD1FF87;
	Wed,  3 Jul 2019 11:22:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH for semihosting-tests] semihosting tests: add v7m tests
Date: Wed,  3 Jul 2019 11:22:08 +0100
Message-Id: <20190703102208.10086-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fnteN2CsgE7U

M-profile has yet another way of triggering semihosting calls using
the BKPT instruction. To support this we need to add a M-profile setup
so we use the nice and simple microbit model which has a Cortex-M0 in
it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile         | 24 ++++++++++++++++++++---
 microbit.lds     | 32 ++++++++++++++++++++++++++++++
 semicall.S       |  7 ++++++-
 start-microbit.S | 51 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 110 insertions(+), 4 deletions(-)
 create mode 100644 microbit.lds
 create mode 100644 start-microbit.S

diff --git a/Makefile b/Makefile
index 1fea97e..9f04cdd 100644
--- a/Makefile
+++ b/Makefile
@@ -40,6 +40,7 @@
 
 A32GCC := arm-linux-gnueabihf-gcc -marm
 T32GCC := arm-linux-gnueabihf-gcc -mthumb
+V7MGCC := arm-none-eabi-gcc -mcpu=cortex-m0 -mfloat-abi=soft
 A64GCC := aarch64-linux-gnu-gcc
 
 A32LD := arm-linux-gnueabihf-ld
@@ -47,7 +48,9 @@ A32LD := arm-linux-gnueabihf-ld
 A32LINKOPTS := -nostdlib -lgcc -Xlinker --script=baremetal.lds -Xlinker --build-id=none
 A64LINKOPTS := -nostdlib -lgcc -Xlinker --script=baremetal-a64.lds -Xlinker --build-id=none
 
-QEMU_BUILDDIR := ~/linaro/qemu-from-laptop/qemu/build/x86
+AV7MLINKOPTS := -nostdlib -lgcc -Xlinker --script=microbit.lds -Xlinker --build-id=none
+
+QEMU_BUILDDIR := ~/lsrc/qemu.git/builds/arm.all
 
 ifdef GDBPORT
 SYSGDB := -gdb tcp::$(GDBPORT)
@@ -60,11 +63,15 @@ QEMU_SYSTEM_ARM = $(QEMU_BUILDDIR)/arm-softmmu/qemu-system-arm $(SYSGDB)
 QEMU_SYSTEM_AARCH64 = $(QEMU_BUILDDIR)/aarch64-softmmu/qemu-system-aarch64 $(SYSGDB)
 
 all: usertest-a32 usertest-a64 usertest-t32 \
-	systest-a32.axf systest-t32.axf systest-a64.axf
+	systest-a32.axf systest-t32.axf \
+	systest-a32-hlt.axf systest-t32-hlt.axf \
+	systest-t32-bkpt.axf \
+	systest-a64.axf
 
 usertest-srcs = usertest.c semihosting.c semicall.S printf/printf.c
 
 systest-srcs = start.S string.c $(usertest-srcs)
+microbit-systest-srcs = start-microbit.S string.c $(usertest-srcs)
 
 usertest-a32: $(usertest-srcs)
 	$(A32GCC) --static -o $@ $^
@@ -93,6 +100,9 @@ systest-a32-hlt.axf: $(systest-srcs)
 systest-t32-hlt.axf: $(systest-srcs)
 	$(T32GCC) -DUSE_HLT -o $@ $^ $(A32LINKOPTS)
 
+systest-t32-bkpt.axf: $(microbit-systest-srcs)
+	$(V7MGCC) -DUSE_BKPT -o $@ $^ $(AV7MLINKOPTS)
+
 systest-a64.axf: $(systest-srcs)
 	$(A64GCC) -nostdlib -o $@ $^ $(A64LINKOPTS)
 
@@ -123,6 +133,9 @@ run-systest-a32-hlt: systest-a32-hlt.axf
 run-systest-t32-hlt: systest-t32-hlt.axf
 	$(QEMU_SYSTEM_ARM) -M virt --display none --semihosting -kernel $^
 
+run-systest-t32-bkpt: systest-t32-bkpt.axf
+	$(QEMU_SYSTEM_ARM) -M microbit --display none --semihosting -kernel $^
+
 run-systest-a64: systest-a64.axf
 	$(QEMU_SYSTEM_AARCH64) -M virt --display none --semihosting \
 		-cpu cortex-a57 -kernel $^
@@ -130,4 +143,9 @@ run-systest-a64: systest-a64.axf
 run: run-usertest-a32 run-usertest-t32 run-usertest-a64 \
 	run-systest-a32 run-systest-t32 run-systest-a64 \
 	run-usertest-a32-hlt run-usertest-t32-hlt \
-	run-systest-a32-hlt run-systest-t32-hlt
+	run-systest-a32-hlt run-systest-t32-hlt \
+	run-systest-t32-bkpt
+
+run-alt: run-usertest-a32 run-usertest-t32 run-usertest-a64 \
+	run-systest-a64 \
+	run-usertest-a32-hlt run-usertest-t32-hlt \
diff --git a/microbit.lds b/microbit.lds
new file mode 100644
index 0000000..24840a3
--- /dev/null
+++ b/microbit.lds
@@ -0,0 +1,32 @@
+/*
+ * microbit.lds : simple linker script for baremetal ARM-M test cases
+ *
+ * Copyright (C) 2019 Linaro Limited. All rights reserved.
+ *
+ * Memory layout is for the BBC Microbit board which puts RAM at 0x20000000
+ */
+
+RAMSTART = 0x20000000;
+STACKTOP = 0x20004000;
+
+ENTRY(exc_reset_thumb)
+
+SECTIONS
+{
+    . = 0x0;
+    .text : {
+        *(.text)
+    }
+    .data : {
+        *(.data)
+    }
+    .rodata : {
+        *(.rodata)
+    }
+    .bss : {
+        *(.bss)
+    }
+    /DISCARD/ : {
+        *(.ARM.attributes)
+    }
+}
diff --git a/semicall.S b/semicall.S
index 1418a42..e6316c4 100644
--- a/semicall.S
+++ b/semicall.S
@@ -51,8 +51,13 @@ __semi_call:
 #else
         /* traditional svc */
 #if defined(__thumb__)
-        /* NB: assumes not M-profile (which is BKPT) */
+#if defined(USE_BKPT)
+        /* M-profile T32 */
+        bkpt 0xab
+#else
+        /* A+R Profile T32 */
         svc 0xab
+#endif
 #else
         svc 0x123456
 #endif
diff --git a/start-microbit.S b/start-microbit.S
new file mode 100644
index 0000000..db1f06e
--- /dev/null
+++ b/start-microbit.S
@@ -0,0 +1,51 @@
+/*
+ * start-microbit.S - assembly code for startup on baremetal M-profile tests
+ *
+ * Copyright (c) 2015 Linaro Limited
+ * All rights reserved.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in
+ *    the documentation and/or other materials provided with the
+ *    distribution.
+ * 3. Neither the name of Linaro Limited nor the names of its
+ *    contributors may be used to endorse or promote products derived
+ *    from this software without specific prior written permission.
+ */
+
+        .syntax unified
+        .cpu cortex-m0
+        .thumb
+
+        .text
+
+vector_table:
+        .word STACKTOP          /* 0. SP_main */
+        .word exc_reset_thumb   /* 1. Reset */
+        .word 0                 /* 2. NMI */
+        .word 0                 /* 3. HardFault */
+        .rept 7
+        .word 0                 /* 4-10. Reserved */
+        .endr
+        .word 0                 /* 11. SVCall */
+        .word 0                 /* 12. Reserved */
+        .word 0                 /* 13. Reserved */
+        .word 0                 /* 14. PendSV */
+        .word 0                 /* 15. SysTick */
+        .rept 32
+        .word 0                 /* 16-47. External Interrupts */
+        .endr
+
+exc_reset:
+.equ exc_reset_thumb, exc_reset + 1
+.global exc_reset_thumb
+
+        bl main
+        bl semi_exit
+        # not reached
+1:      b 1b
-- 
2.20.1
