Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v5sm2549670wre.50.2019.07.10.06.13.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 10 Jul 2019 06:13:38 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 970071FF87;
	Wed, 10 Jul 2019 14:13:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for semihosting-tests 2/2] semihosting tests: add v7m tests
Date: Wed, 10 Jul 2019 14:13:25 +0100
Message-Id: <20190710131325.21442-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710131325.21442-1-alex.bennee@linaro.org>
References: <20190710131325.21442-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: traRMqTFe7p5

M-profile has yet another way of triggering semihosting calls using
the BKPT instruction. To support this we need to add a M-profile setup
so we use the nice and simple microbit model which has a Cortex-M0 in
it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - add copyright headers
  - better linker script
  - use .type foo, function instead of hacks
---
 Makefile         | 14 ++++++++++++-
 microbit.lds     | 47 ++++++++++++++++++++++++++++++++++++++++++++
 semicall.S       |  8 +++++++-
 start-microbit.S | 51 ++++++++++++++++++++++++++++++++++++++++++++++++
 usertest.c       |  4 +++-
 5 files changed, 121 insertions(+), 3 deletions(-)
 create mode 100644 microbit.lds
 create mode 100644 start-microbit.S

diff --git a/Makefile b/Makefile
index 7ad2512..1296fde 100644
--- a/Makefile
+++ b/Makefile
@@ -40,6 +40,7 @@
 
 A32GCC := arm-linux-gnueabihf-gcc -marm
 T32GCC := arm-linux-gnueabihf-gcc -mthumb
+V7MGCC := arm-none-eabi-gcc -mcpu=cortex-m0 -mfloat-abi=soft
 A64GCC := aarch64-linux-gnu-gcc
 
 A32LD := arm-linux-gnueabihf-ld
@@ -47,6 +48,8 @@ A32LD := arm-linux-gnueabihf-ld
 A32LINKOPTS := -nostdlib -lgcc -Xlinker --script=baremetal.lds -Xlinker --build-id=none
 A64LINKOPTS := -nostdlib -lgcc -Xlinker --script=baremetal-a64.lds -Xlinker --build-id=none
 
+AV7MLINKOPTS := -nostdlib -lgcc -Xlinker --script=microbit.lds -Xlinker --build-id=none
+
 QEMU_BUILDDIR := ~/linaro/qemu-from-laptop/qemu/build/x86
 
 ifdef GDBPORT
@@ -62,11 +65,13 @@ QEMU_SYSTEM_AARCH64 = $(QEMU_BUILDDIR)/aarch64-softmmu/qemu-system-aarch64 $(SYS
 all: usertest-a32 usertest-a64 usertest-t32 \
 	systest-a32.axf systest-t32.axf \
 	systest-a32-hlt.axf systest-t32-hlt.axf \
+	systest-t32-bkpt.axf \
 	systest-a64.axf
 
 usertest-srcs = usertest.c semihosting.c semicall.S printf/printf.c
 
 systest-srcs = start.S string.c $(usertest-srcs)
+microbit-systest-srcs = microbit.lds start-microbit.S string.c $(usertest-srcs)
 
 usertest-a32: $(usertest-srcs)
 	$(A32GCC) --static -o $@ $^
@@ -95,6 +100,9 @@ systest-a32-hlt.axf: $(systest-srcs)
 systest-t32-hlt.axf: $(systest-srcs)
 	$(T32GCC) -DUSE_HLT -o $@ $^ $(A32LINKOPTS)
 
+systest-t32-bkpt.axf: $(microbit-systest-srcs)
+	$(V7MGCC) -DUSE_BKPT -o $@ $^ $(AV7MLINKOPTS)
+
 systest-a64.axf: $(systest-srcs)
 	$(A64GCC) -nostdlib -o $@ $^ $(A64LINKOPTS)
 
@@ -125,6 +133,9 @@ run-systest-a32-hlt: systest-a32-hlt.axf
 run-systest-t32-hlt: systest-t32-hlt.axf
 	$(QEMU_SYSTEM_ARM) -M virt --display none --semihosting -kernel $^
 
+run-systest-t32-bkpt: systest-t32-bkpt.axf
+	$(QEMU_SYSTEM_ARM) -M microbit --display none --semihosting -kernel $^
+
 run-systest-a64: systest-a64.axf
 	$(QEMU_SYSTEM_AARCH64) -M virt --display none --semihosting \
 		-cpu cortex-a57 -kernel $^
@@ -132,4 +143,5 @@ run-systest-a64: systest-a64.axf
 run: run-usertest-a32 run-usertest-t32 run-usertest-a64 \
 	run-systest-a32 run-systest-t32 run-systest-a64 \
 	run-usertest-a32-hlt run-usertest-t32-hlt \
-	run-systest-a32-hlt run-systest-t32-hlt
+	run-systest-a32-hlt run-systest-t32-hlt \
+	run-systest-t32-bkpt
diff --git a/microbit.lds b/microbit.lds
new file mode 100644
index 0000000..55050c3
--- /dev/null
+++ b/microbit.lds
@@ -0,0 +1,47 @@
+/*
+ * microbit.lds : simple linker script for baremetal ARM-M test cases
+ *
+ * Copyright (C) 2019 Linaro Limited. All rights reserved.
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
+ *
+ * Memory layout is for the BBC Microbit board which puts RAM at 0x20000000
+ */
+
+RAMSTART = 0x20000000;
+/* 2kb stack, from the top of RAM */
+STACKBOT = 0x20003800;
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
+    . = RAMSTART;
+    .data : {
+        *(.data)
+    }
+    .bss : {
+        *(.bss)
+    }
+    /* linker should complain if data+bss run into this */
+    . = STACKBOT;
+    /DISCARD/ : {
+        *(.ARM.attributes)
+    }
+}
diff --git a/semicall.S b/semicall.S
index 1418a42..6213cea 100644
--- a/semicall.S
+++ b/semicall.S
@@ -29,6 +29,7 @@
 #endif
 
         .globl __semi_call
+        .type __semi_call, function
 __semi_call:
 #if defined(__aarch64__)
         hlt 0xf000
@@ -51,8 +52,13 @@ __semi_call:
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
index 0000000..f5e7a8b
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
+        .word reset_thumb       /* 1. Reset */
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
+        /* declare as a function so pointers are appropriatley "thumbed" */
+        .type reset_thumb, function
+reset_thumb:
+
+        bl main
+        bl semi_exit
+        # not reached
+1:      b 1b
diff --git a/usertest.c b/usertest.c
index 16ef0fe..d95cf90 100644
--- a/usertest.c
+++ b/usertest.c
@@ -1,5 +1,7 @@
 /*
- * usertest.c -- top level test file for usermode tests
+ * usertest.c -- top level test file for usermode tests.
+ *
+ * System tests also call this main after start[-microbit].S
  *
  * Copyright (c) 2015 Linaro Limited
  * All rights reserved.
-- 
2.20.1
