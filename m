Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE2BCD6E55
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 18:27:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUqIc-0000ce-7M; Wed, 03 Jun 2026 14:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wUqIV-0000Ya-Ao
 for qemu-arm@nongnu.org; Wed, 03 Jun 2026 14:26:36 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wUqIR-0003al-QE
 for qemu-arm@nongnu.org; Wed, 03 Jun 2026 14:26:35 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-46015dc517aso2820902f8f.2
 for <qemu-arm@nongnu.org>; Wed, 03 Jun 2026 11:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780511190; x=1781115990; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5Q0hKICo4kl90EEUv9EvxXccnGV5ZbdN4gD+7JWEWr4=;
 b=aZK4i7xwbKrRbhw/axmjuq8XABHQRU4p1g8DHrSeEk0PCOmJHDdypSXW/MGS+SQuCh
 BKmwu1wfjMVQfw2Wh8hP+xaiE6HYdjx6RjKOpLySAbJk0f9IB7S6Kudsfdg29KwGeHmm
 N40TLI5Roh1pwV68lF79/jkro1Ym/QgsdvnRg5ly6agf/eACLsHJp9NS814tEBJ9Npyv
 Ak6WEZWdMzTZFt59cM0D3/l3Ct2fK5zD092LGHmYJn+o9+qoK8TcP09NOV4fMnVsRtfj
 BIUwiBKh5o2FGdVToHIOJtmy7qow60/VsF61xewa/zXQl2xCus1mmbeJ2ZpGNI1q/MVA
 3F9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780511190; x=1781115990;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5Q0hKICo4kl90EEUv9EvxXccnGV5ZbdN4gD+7JWEWr4=;
 b=mQpnfArIfX5HCjLNuaONf9H+LcXWNbE/haFB1WGbx455P6QN7S1h92BghfMXbNS+xI
 DexGrilaH8ZXubNxo9vxEpqcXyJNBhls7VZTy2E27vYAz0INDb+S8BKYSqH6nA2fk2za
 eBWTRqD7B6SmrpY+0NVP2H861r4vyuhYzpAcAFX3IJNUZNZzcDDN8GD43kotClkbZCyl
 vv4gxec3ivy7gLcbmO+CGx6etsyN62YhdQ/tdtDXozZsGjAQ0IKlyCNru4o7t54PDATD
 yN/37PbwaC6mz8j7W8V8MiKD6AAGjDOSkEK6XaMJfD2WF6hjdmu8e/9MXqY9qZgaKefR
 Q60Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9+mwJpFaKiuCd+3uoo0js7o+UDDLumf0kY59QpjTuw2L3oaPEeOTpOhEAf0JNhzm1a1qCmWU/19Q==@nongnu.org
X-Gm-Message-State: AOJu0Ywgfr2Aj0JbPeQd44b3GpGf0ZEMC4aZTHT2CQ3dWiNXbr9Mn8Ao
 ptMwgAeObIAFc3VZnF7LeJk6DxheUia4+QLCFirPaL1rlpQJ6k0HlSZ4jTKMTCEip4LRxzBo5tC
 C0Fujh40=
X-Gm-Gg: Acq92OH1XNQUPyTYpdz85Z56ZzdpB1So6KBC6V8xE0vOyB2X1BPhSjNcjQVK4shtY0L
 Q4+SfeZGnr0fUVSTMx3baNa9zuPRH4uyCGTB/oOEcOvelx40os/rqrmFAOFyI4556E0ZyUlIpyS
 POueanNvmTXxL4Gz9FXcfNiP2/EMecpx4eUQ7rok4+6+jFaeL6/AKjqmub/eN0oAJP58u8BlGNj
 4WrRhQQkovPRj0ye1cIfh8dX8fsXSYlwdlGZjNb4Xo14cogkQe+90r8+r33P1/kGTakVvPZw8Rc
 ikRrSxHKPVaAJTem3f1a1VXDlrjyNor6yo6Z9Gzz2LrnqkjlQyv82HExwrt4K0wgaE08CW0hVs9
 o0qF2d1wYu92ncj0pX9+sRqx6nejltDy7a25Oi6NjKva+EZaPw+TUUAMYVGnWKXyMZGWeFyQe8L
 UibC2zyE7o+idIFG+e4tjdNin8JDta9CdahwMWFQ==
X-Received: by 2002:a5d:5292:0:b0:45b:d891:56bb with SMTP id
 ffacd0b85a97d-4602186fc27mr4516109f8f.38.1780511190217; 
 Wed, 03 Jun 2026 11:26:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:d530:6a6b:58a7:e220])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ed944sm9793127f8f.13.2026.06.03.11.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 11:26:29 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Wed, 03 Jun 2026 19:26:25 +0100
Subject: [PATCH v2 6/6] tests/tcg/aarch64/system/gpc-test.c: Basic test for
 granule protection check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-jmac-gpc3b-v2-6-115c51936962@linaro.org>
References: <20260603-jmac-gpc3b-v2-0-115c51936962@linaro.org>
In-Reply-To: <20260603-jmac-gpc3b-v2-0-115c51936962@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

* Sets up granule protection tables
* Enables GPC and bypass windows
* Performs memory accesses in the protected region to
  check for allowed and disallowed reads.

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 tests/tcg/aarch64/Makefile.softmmu-target |  11 +-
 tests/tcg/aarch64/system/gpc-test.c       | 165 ++++++++++++++++++++++++++++++
 2 files changed, 175 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index 47b32968fb..d76ca52e63 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -53,7 +53,10 @@ memory-sve: memory.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
 
 memory-sve: CFLAGS+=-DCHECK_UNALIGNED=1 -march=armv8.1-a+sve -O3
 
-TESTS+=memory-sve
+gpc-test: gpc-test.c $(LINK_SCRIPT) altboot.o $(MINILIB_OBJS)
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) altboot.o
+
+TESTS+=memory-sve gpc-test
 
 # Running
 QEMU_BASE_MACHINE=-M virt -cpu max -display none
@@ -74,6 +77,12 @@ QEMU_EL2_MACHINE=-machine virt,virtualization=on,gic-version=2 -cpu cortex-a57 -
 QEMU_EL2_BASE_ARGS=-semihosting-config enable=on,target=native,chardev=output,arg="2"
 run-vtimer: QEMU_OPTS=$(QEMU_EL2_MACHINE) $(QEMU_EL2_BASE_ARGS) -kernel
 
+# gpc tests need EL3 and RME
+QEMU_EL3_MACHINE=-machine virt,virtualization=on,secure=on,gic-version=3 -cpu max,x-rme=on
+QEMU_EL3_BASE_ARGS=-semihosting-config enable=on,target=native,chardev=output,arg="3"
+run-gpc-test:  QEMU_OPTS=$(QEMU_EL3_MACHINE) $(QEMU_EL3_BASE_ARGS) -kernel
+run-gpc3-test: QEMU_OPTS=$(QEMU_EL3_MACHINE) $(QEMU_EL3_BASE_ARGS) -kernel
+
 # Simple Record/Replay Test
 .PHONY: memory-record
 run-memory-record: memory-record memory
diff --git a/tests/tcg/aarch64/system/gpc-test.c b/tests/tcg/aarch64/system/gpc-test.c
new file mode 100644
index 0000000000..f26b23efaf
--- /dev/null
+++ b/tests/tcg/aarch64/system/gpc-test.c
@@ -0,0 +1,165 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *
+ *
+ * Copyright (c) 2026 Linaro Ltd
+ *
+ */
+
+#include <stdbool.h>
+#include <stdint.h>
+#include <minilib.h>
+#include "boot.h"
+
+#define ID_AA64PFR0_EL1 "S3_0_C0_C4_0"
+
+#define GPTBR_EL3 "S3_6_C2_C1_4"
+#define GPCBW_EL3 "S3_6_C2_C1_5"
+#define GPCCR_EL3 "S3_6_C2_C1_6"
+#define VBAR_EL3 "S3_6_C12_C0_0"
+
+#define get_sys_reg(register_name, dest) \
+        asm("mrs %[reg], " register_name "\n\t" : [reg] "=r" (dest))
+#define set_sys_reg(register_name, value) \
+        asm("msr " register_name ", %[reg]\n\r" : : [reg] "r" (value))
+
+const uint32_t gpc_granule_size = 4096;
+const uint32_t gpis_per_64_bits = 16;
+
+int main(uint64_t sp)
+{
+    uint64_t out;
+    uint64_t pfr0;
+    uint64_t gpt_base;
+    uint64_t rme_status;
+    uint64_t currentel_raw;
+    uint64_t currentel;
+    uint64_t gpcbw;
+    uint64_t gpt_table0_addr = (uint64_t) realms_gpt0;
+    uint64_t gpt_table1_addr = (uint64_t) realms_gpt1;
+
+    /* Mask is FNG1, FNG0, and A2 */
+    const uint64_t feature_mask = (1ULL << 18 | 1ULL << 17 | 1ULL << 16);
+    const uint64_t in = feature_mask;
+
+    get_sys_reg("CurrentEL", currentel_raw);
+    currentel = (currentel_raw >> 2) & 0x3;
+
+    if (currentel < 3) {
+        ml_printf("FAIL: Test must be run at EL3 (it is %d)\n", currentel);
+        return 1;
+    }
+
+    get_sys_reg(ID_AA64PFR0_EL1, pfr0);
+
+    /* rme_status is 1 for RME, 2 for RME + GPC2, 3 for RME+GPC3 */
+    rme_status = (pfr0 >> 52) & 0xF;
+    if (rme_status < 2) {
+        ml_printf("SKIP: System does not support RME (RME=%ld)\n", rme_status);
+        return 0;
+    }
+
+    /* Configure the level 0 table for the first 4GB of memory */
+    realms_gpt0[0] = gpt_table1_addr | 0x3; /* Covers GB 0; table descriptor */
+    realms_gpt0[1] = 0xf1; /* Covers GB 1; full access */
+    realms_gpt0[2] = 0xf1; /* Covers GB 2; full access */
+    realms_gpt0[3] = 0xf1; /* Covers GB 3; full access */
+
+    /* Pick an artibtrary location to read inside the first 1GB. */
+    uint64_t fault_location = 0x10202008;
+    uint32_t gpi_index = fault_location / gpc_granule_size;
+    realms_gpt1[gpi_index / gpis_per_64_bits] = 0;
+
+    gpt_base = gpt_table0_addr >> 12;
+    set_sys_reg(GPTBR_EL3, gpt_base);
+
+    /*
+     * Default values:
+     * PPS=0:     GPC table 0 protects 4GB.
+     * RLPAD=0:   Realm physical address spaces are normal
+     * NSPAD=0:   Non-secure physical address spaces are normal
+     * SPAD=0:    Secure physical address spaces are normal
+     * IRGN=0:    Inner non-cacheable
+     * ORGN=0:    Outer non-cacheable
+     * PGS=0:     Physical granule size is 4KB.
+     * GPCP=0:    All GPC faults reported
+     * TBGPCP=0:  Trace buffer rejects trace
+     * L0GPTSZ=0: Each entry in table 0 protects 1GB.
+     * APPSAA=0:  Accesses above 4GB must be to Non-secure PAs
+     * GPCBW=0:   Bypass windows disabled.
+     * NA6, NA7, NSP, SA, NSO are all reserved values for GPI.
+     */
+    uint64_t gpccr = 0;
+
+    /* Switch on granule protection check */
+    gpccr |= 1 << 16; /* GPC enabled. */
+    gpccr |= 0b10 << 12; /* SH = Outer shareable */
+    set_sys_reg(GPCCR_EL3, gpccr);
+
+    /* Access some memory outside the GPC forbidden region */
+    uint64_t x = *(unsigned int *) (fault_location + 4096 * 16);
+    ml_printf("Fault address: %lx\n", exception_fault_address);
+    if (exception_fault_address != 0) {
+        ml_printf("FAIL: Memory access was blocked by GPC, "
+                  "and should not have been\n");
+        return 1;
+    }
+
+    /* Access the GPC forbidden region */
+    x = *(unsigned int *) fault_location;
+
+    ml_printf("Fault address: %lx\n", exception_fault_address);
+    if (exception_fault_address != fault_location) {
+        ml_printf("FAIL: Memory access was not blocked by GPC, "
+                  "and should have been\n");
+        return 1;
+    }
+
+    rme_status = (pfr0 >> 52) & 0xF;
+    if (rme_status < 3) {
+        ml_printf("SKIP: System does not support GPC3 (RME=%ld)\n", rme_status);
+        return 0;
+    }
+
+    /* Clear the exception record */
+    exception_fault_address = 0;
+
+    /* Enable bypass windows */
+    gpccr |= 1 << 29; /* GPC Bypass windows enabled */
+    set_sys_reg(GPCCR_EL3, gpccr);
+
+    gpcbw = 0; /* Base 0GB, Size 1GB, Stride 1TB */
+    set_sys_reg(GPCBW_EL3, gpcbw);
+    ml_printf("GPCBW configured\n");
+
+    /* Access the GPC forbidden region again */
+    x = *(unsigned int *) fault_location;
+
+    ml_printf("Fault address: %lx\n", exception_fault_address);
+    if (exception_fault_address != 0) {
+        ml_printf("FAIL: Memory access was blocked by GPC, "
+                  "and should have been allowed by bypass window. code=%lx\n",
+                  exception_type_code);
+        return 1;
+    }
+
+    /* Clear the exception record */
+    exception_fault_address = 0;
+    /* Reconfigure GPCBW to 1GB start */
+    gpcbw = 1; /* Base 1GB, Size 1GB, Stride 1TB */
+    set_sys_reg(GPCBW_EL3, gpcbw);
+    ml_printf("GPCBW reconfigured for 1GB start\n");
+
+    /* Access the GPC forbidden region again */
+    x = *(unsigned int *) fault_location;
+
+    ml_printf("Fault address: %lx\n", exception_fault_address);
+    if (exception_fault_address != fault_location) {
+        ml_printf("FAIL: Memory access was allowed by GPC, "
+                  "and should not have been allowed by bypass window. code=%lx\n",
+                  exception_type_code);
+        return 1;
+    }
+
+    return 0;
+}

-- 
2.43.0


