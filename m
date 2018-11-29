Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2691243wrt;
        Thu, 29 Nov 2018 10:52:12 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VMUqM6qgZEK5yQgm+2oGHk2qV6qkIW/i4n7Fm4KaXjEAZvglhgt/LVSNvu0DBLfyHtmUmC
X-Received: by 2002:aed:2e04:: with SMTP id j4mr2533503qtd.47.1543517532309;
        Thu, 29 Nov 2018 10:52:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543517532; cv=none;
        d=google.com; s=arc-20160816;
        b=Yqp23XhNbM/VluvS9lcVvoTq2070k5JGGXPpgV7WCEx/haIOqkSIo5gfbPCegA/EM5
         lWf/5FasIYl3rWzo3y2XApW2cpcuOvtl0lDnRuLYgqqXUNknS0aUyHHfLG2j2ebdt84g
         iV1a3lwY4RpXTIozGyA9RxEsLae/Zp6zhxO1nyGIg1qjxlUsdjlyrXbdy+rqAgTalpqp
         Bp+I85swn6FQ3eMQQCYFFEg/JIs3Asxtzpz7t3Te7+VjCJvRqPwbB91hX1O+0R0w0KJw
         VeXmOgq5o1iNlKZjIJF9i/oF6f6jM4o0ecY6BT+KPXINAVUqgFPe3ln45HqP0TzerPll
         /dFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=vXtzpxcieQv8DKY3Rfs2ZAZ4z/uMGxz7ynYDZUN8n+Q=;
        b=uks8G3HgU7eEVM68T5/iX2Sn4zphgw+vluF+EGGNRGy5J9ugd5Jf744/BHJx89qAgo
         1/A0XrYyui+s64A2Ye4h5U/w3PL1dyvvCVL86bZbiDdXRG6TVn3AuD42GxBKNRCYHOl+
         9JkUkpb1s/fd/oSljOkDv7cXBAcRM+++62LjpU7jqSOlyBkoZMbMYWRhq92sAuJHbm40
         YHWT8pBmMF4XTqYMrFbDoknKp5ELa4Aa3/zTQms15Exp95+6QFqCNmDOlzbB5sKZQjkr
         bzRbBHcQoB3e4Y/aGWsXmejw3jOiXDz55O2sY+3aaAD3ijsYkWh7c2bwj5wYZiA6Aei+
         MNJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of stefanha@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <stefanha@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id w11si870311qvf.141.2018.11.29.10.52.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Nov 2018 10:52:12 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanha@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of stefanha@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9DEB6A7E9;
	Thu, 29 Nov 2018 18:52:10 +0000 (UTC)
Received: from localhost (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7054760FE6;
	Thu, 29 Nov 2018 18:52:06 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu.ml@steffen-goertz.de,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	joel@jms.id.au,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	jusual@mail.ru,
	jim@groklearning.com,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [RFC v3] target/arm: add ARMv6-M UNDEFINED 32-bit instruction test
Date: Thu, 29 Nov 2018 18:51:13 +0000
Message-Id: <20181129185113.30353-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Thu, 29 Nov 2018 18:52:11 +0000 (UTC)
X-TUID: zdnJUdPwDPWS

Test that 32-bit instructions declared UNDEFINED in the ARMv6-M
Reference Manual really do raise an exception.  Also test that the 6
32-bit instructions defined in the ARMv6-M Reference Manual do not raise
an exception.

The Intel HEX (.hex) file is included to save people the trouble of
installing a cross-compiler toolchain.

To run the test (make sure qemu-system-arm is in your $PATH):

  $ cd tests/tcg/arm
  $ make run-test-armv6m-undef

Based-on: <20181029194519.15628-1-stefanha@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
Note that this patch depends on "[PATCH] microbit: do not rely on
-kernel option", which in turn depends on "[PATCH v3]
tests/microbit-test: Check nRF51 UART functionality".  I'd still
appreciate review because I have yet to figure out a clean way to
integrate this qemu-system-arm test into make check-tcg (which only
supports linux-user targets!).
---
 tests/tcg/arm/Makefile              |  26 +++++
 tests/tcg/arm/test-armv6m-undef.S   | 154 ++++++++++++++++++++++++++++
 tests/tcg/arm/test-armv6m-undef.hex |  22 ++++
 tests/tcg/arm/test-armv6m-undef.ld  |  21 ++++
 4 files changed, 223 insertions(+)
 create mode 100644 tests/tcg/arm/Makefile
 create mode 100644 tests/tcg/arm/test-armv6m-undef.S
 create mode 100644 tests/tcg/arm/test-armv6m-undef.hex
 create mode 100644 tests/tcg/arm/test-armv6m-undef.ld

diff --git a/tests/tcg/arm/Makefile b/tests/tcg/arm/Makefile
new file mode 100644
index 0000000000..6923129b84
--- /dev/null
+++ b/tests/tcg/arm/Makefile
@@ -0,0 +1,26 @@
+-include ../../../config-host.mak
+
+CROSS = arm-linux-gnu-
+CC = $(CROSS)gcc
+OBJCOPY = $(CROSS)objcopy
+
+SIM = ../../../arm-softmmu/qemu-system-arm
+
+SOURCES = $(wildcard $(SRC_PATH)/tests/tcg/arm/*.S)
+BINARIES = $(patsubst %.S,%.hex,$(SOURCES))
+
+.PHONY: clean
+
+all: $(BINARIES)
+
+clean:
+	rm -f $(BINARIES) *.o
+
+%.o: %.S %.ld
+	$(CC) -nostdlib -Wl,--build-id=none -x assembler-with-cpp -T $(patsubst %.S,%.ld,$<) -x assembler-with-cpp -o $@ $<
+
+%.hex: %.o
+	$(OBJCOPY) -O ihex $< $@
+
+run-test-armv6m-undef: test-armv6m-undef.hex
+	$(SIM) -semihosting -M microbit -device loader,file=$<
diff --git a/tests/tcg/arm/test-armv6m-undef.S b/tests/tcg/arm/test-armv6m-undef.S
new file mode 100644
index 0000000000..d18ca56b4a
--- /dev/null
+++ b/tests/tcg/arm/test-armv6m-undef.S
@@ -0,0 +1,154 @@
+/*
+ * Test ARMv6-M UNDEFINED 32-bit instructions
+ *
+ * Copyright 2018 Red Hat Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2
+ * or later. See the COPYING file in the top-level directory.
+ */
+
+/*
+ * Test that UNDEFINED 32-bit instructions fault as expected.  This is an
+ * interesting test because ARMv6-M shares code with its more fully-featured
+ * siblings and it's necessary to verify that its limited instruction set is
+ * emulated correctly.
+ *
+ * The emulator must be invoked with -semihosting so that the test case can
+ * terminate with exit code 0 on success or 1 on failure.
+ *
+ * Failures can be debugged with -d in_asm,int,exec,cpu and the
+ * gdbstub (-S -s).
+ */
+
+.syntax unified
+.cpu cortex-m0
+.thumb
+
+/*
+ * Memory map
+ */
+#define SRAM_BASE 0x20000000
+#define SRAM_SIZE (16 * 1024)
+
+/*
+ * Semihosting interface on ARM T32
+ * See "Semihosting for AArch32 and AArch64 Version 2.0 Documentation" by ARM
+ */
+#define semihosting_call bkpt 0xab
+#define SYS_EXIT 0x18
+
+vector_table:
+    .word SRAM_BASE + SRAM_SIZE /* 0. SP_main */
+    .word exc_reset_thumb       /* 1. Reset */
+    .word 0                     /* 2. NMI */
+    .word exc_hard_fault_thumb  /* 3. HardFault */
+    .rept 7
+    .word 0                     /* 4-10. Reserved */
+    .endr
+    .word 0                     /* 11. SVCall */
+    .word 0                     /* 12. Reserved */
+    .word 0                     /* 13. Reserved */
+    .word 0                     /* 14. PendSV */
+    .word 0                     /* 15. SysTick */
+    .rept 32
+    .word 0                     /* 16-47. External Interrupts */
+    .endr
+
+exc_reset:
+.equ exc_reset_thumb, exc_reset + 1
+.global exc_reset_thumb
+    /* The following 32-bit UNDEFINED instructions are tested by executing
+     * them.  The HardFault exception handler should execute and return to
+     * the next test case.  If no exception is raised the test fails.
+     */
+
+    /* Table A5-9 32-bit Thumb encoding */
+    .short 0b1110100000000000
+    .short 0b0000000000000000
+    b not_reached
+    .short 0b1110100000000000
+    .short 0b1000000000000000
+    b not_reached
+    .short 0b1111100000000000
+    .short 0b0000000000000000
+    b not_reached
+    .short 0b1111100000000000
+    .short 0b1000000000000000
+    b not_reached
+    .short 0b1111000000000000
+    .short 0b0000000000000000
+    b not_reached
+
+    /* Table A5-10 Branch and miscellaneous control instructions */
+    .short 0b1111011111110000
+    .short 0b1010000000000000
+    b not_reached
+
+    /* The following are valid 32-bit instructions that must not raise a
+     * HardFault.
+     */
+
+    /* B4.2.3 Move to Special Register (moves to IPSR are ignored) */
+    msr ipsr, r0
+    b 1f
+    b not_reached
+1:
+    /* B4.2.2 Move from Special Register */
+    mrs r0, ipsr
+    b 1f
+    b not_reached
+1:
+    /* A6.7.13 Branch with Link (immediate) */
+    bl 1f
+1:
+    b 1f
+    b not_reached
+1:
+    /* A6.7.21 Data Memory Barrier */
+    dmb
+    b 1f
+    b not_reached
+1:
+    /* A6.7.22 Data Synchronization Barrier */
+    dsb
+    b 1f
+    b not_reached
+1:
+    /* A6.7.24 Instruction Memory Barrier */
+    isb
+    b 1f
+    b not_reached
+1:
+
+    /* Success! */
+    movs r0, 1
+    b exit
+
+not_reached: /* Failure :( */
+    movs r0, 0
+    b exit
+
+/* When a HardFault occurs, return to pc+6 (test cases are 3 halfwords long) */
+exc_hard_fault:
+.equ exc_hard_fault_thumb, exc_hard_fault + 1
+.global exc_hard_fault_thumb
+    ldr r0, [sp, 0x18]
+    adds r0, 6
+    str r0, [sp, 0x18]
+    bx lr
+
+/*
+ * exit: Terminate emulator
+ * @r0: 0 - failure, 1 - success
+ */
+exit:
+    movs r1, 0
+    cmp r0, 1
+    bne 1f
+    ldr r1, ADP_Stopped_ApplicationExit
+1:
+    movs r0, SYS_EXIT
+    semihosting_call
+.align 2
+ADP_Stopped_ApplicationExit:
+    .word 0x20026
diff --git a/tests/tcg/arm/test-armv6m-undef.hex b/tests/tcg/arm/test-armv6m-undef.hex
new file mode 100644
index 0000000000..6a32548e3c
--- /dev/null
+++ b/tests/tcg/arm/test-armv6m-undef.hex
@@ -0,0 +1,22 @@
+:1000000000400020C1000000000000001D010000B1
+:1000100000000000000000000000000000000000E0
+:1000200000000000000000000000000000000000D0
+:1000300000000000000000000000000000000000C0
+:1000400000000000000000000000000000000000B0
+:1000500000000000000000000000000000000000A0
+:100060000000000000000000000000000000000090
+:100070000000000000000000000000000000000080
+:100080000000000000000000000000000000000070
+:100090000000000000000000000000000000000060
+:1000A0000000000000000000000000000000000050
+:1000B0000000000000000000000000000000000040
+:1000C00000E8000028E000E8008025E000F80000DB
+:1000D00022E000F800801FE000F000001CE0F0F7D4
+:1000E00000A019E080F3058800E015E0EFF305803B
+:1000F00000E011E000F000F800E00DE0BFF35F8FDA
+:1001000000E009E0BFF34F8F00E005E0BFF36F8F21
+:1001100000E001E0012005E0002003E00698063041
+:10012000069070470021012800D101491820ABBE7C
+:0401300026000200A3
+:04000003000000C138
+:00000001FF
diff --git a/tests/tcg/arm/test-armv6m-undef.ld b/tests/tcg/arm/test-armv6m-undef.ld
new file mode 100644
index 0000000000..43dbbf17d5
--- /dev/null
+++ b/tests/tcg/arm/test-armv6m-undef.ld
@@ -0,0 +1,21 @@
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
-- 
2.19.1
