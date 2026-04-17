Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247FAF436BD
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 16:44:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDmIR-0003TI-9k; Fri, 17 Apr 2026 12:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wDmI6-0003OS-OX
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 12:43:40 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wDmI4-0004tR-NC
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 12:43:38 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43d74086e5bso801406f8f.0
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 09:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776444215; x=1777049015; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jegsx2j0KNykYcl6zcYZCE4ioLA7NDTkcLRBUWft0eM=;
 b=YnTkU+ywaq+Oma4fuB7LB5HL5Z66ujXPuieQU0ZN7a82dK+K3IkIhUaNZ2w1RbV37d
 jWC8NYKo2lxdL+LF90DTNVdNjV4NZPrGyvxTA7feMD9Kq1fj4S1eVLvNxLmG+fUycn5+
 +2XD/Jr79GuOde4GAvIqTReSJzLY6FSTRAjbG+gD9KugLm15LtMHRlbXs9Db7lh0+bOE
 cCnbj5tdy+Ev+bFHSXHfnb3COLARevy1iQG8e49aSFgMgp7NO4G3cWRJJSh7gflFq+8F
 XboGf3mNCPT76H27DJQDLJhEpCCkhQgCTMpqywY3BCQcABOFK717xakLwIliifTjJpkr
 cnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776444215; x=1777049015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Jegsx2j0KNykYcl6zcYZCE4ioLA7NDTkcLRBUWft0eM=;
 b=Fg7CXMRlCPwKe74jFk9peJ77p8PjzlFfFs4fQhP/MToNpnWzyaHtv0I1g3NQgpeHqw
 HdgLEBfkdPPkYTbBnaJsN0yW8uZZLX/ZenVgh1vW4EaRcoiulFEI9mAu8jk5h7NVYK9c
 u1gouJE17KnFcQz8BAV1prBEp58lNImiJnXIJKBF1W5/j3+eaa3PI9/C62e3PRtmuLpq
 Ytj3/thc4iI9LpKODN42hgWi3siYe/Dp8QlCdF622GSDTJnfefGVr5gk3tWLRCUlPBIb
 tVMaA66kMp1a0KVgxW/t4G+LLdAcMh81/PEX+KQ7xfuvJ6SZqOGJZzoq33WNZ4GOO/3U
 whHg==
X-Gm-Message-State: AOJu0YxfxtN7VP6/eAE0ZsgukhWoLZSpbHGHPvfGAOtAnLrotXirES3A
 LzI4CVbibCI3yiHvYjtUr9rSTVfaVJGX1B9FW0IcWJpA1fb97R4iduEUtvWo0+YpDAE=
X-Gm-Gg: AeBDietHLVxqlEmbBJL3KqEqvsTxJunX12Fcxsv9vakD1OU1ZY6brDSW0dPvv2Ppn/x
 j0+KOhsXx7kvlpkgQP/8LTVssh1YeErA9q63sp2gBHbWsyJwZX1yK5oyLarWaHxpM8ubsHYNhzK
 Il0AKJZ8uDT+OK2fIThT7gDY9G9kHfBvNyuxk4D0IW7rT5fDh8fbTx0wJTdnh+gd7sCAfIUjCdE
 dXKGywOZoir8jsJgvBYArqkZsmiDluo3Pb/eW3re6Iq8hcBlX7rzJAakauUjXSrhDITpuENdvAQ
 ELEC11i+U0/FKiIY1CR9a//za75U7PmVc/2cFDLCY5A2h3JTYgokEYrYV7NvBIagQKyzXCL1CKx
 GqRW2Vs5l/7DNFtsTvj5ukMhLDl060r7/0qRAT0YFJUWs3NIL6bpc3vZYO9aD5Glbv/aRz7xvk6
 /tDknBLpCnnQK0nuM2YlBaeWn0KWdmh+aSgg==
X-Received: by 2002:a05:6000:1868:b0:43d:7a97:78af with SMTP id
 ffacd0b85a97d-43fe3e24bd3mr5618940f8f.42.1776444215022; 
 Fri, 17 Apr 2026 09:43:35 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cb1249sm5031092f8f.5.2026.04.17.09.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 09:43:32 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0BA665FA43;
 Fri, 17 Apr 2026 17:43:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 6/7] tests/tcg: create a mini-gic3 library
Date: Fri, 17 Apr 2026 17:43:26 +0100
Message-ID: <20260417164328.1009132-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260417164328.1009132-1-alex.bennee@linaro.org>
References: <20260417164328.1009132-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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

Just enough GIC to trigger timer interrupts.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/system/lib/gicv3.h      | 60 +++++++++++++++++++
 tests/tcg/aarch64/system/lib/gicv3.c      | 70 +++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.softmmu-target |  2 +
 3 files changed, 132 insertions(+)
 create mode 100644 tests/tcg/aarch64/system/lib/gicv3.h
 create mode 100644 tests/tcg/aarch64/system/lib/gicv3.c

diff --git a/tests/tcg/aarch64/system/lib/gicv3.h b/tests/tcg/aarch64/system/lib/gicv3.h
new file mode 100644
index 00000000000..05c4c2f538b
--- /dev/null
+++ b/tests/tcg/aarch64/system/lib/gicv3.h
@@ -0,0 +1,60 @@
+/*
+ * GICv3 Helper Library
+ *
+ * Copyright (c) 2026 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef GICV3_H
+#define GICV3_H
+
+/*
+ * This duplicates just the bits of hw/intc/gicv3_internal.h we
+ * need for basic functionality.
+ */
+
+/* Virt machine GICv3 base addresses */
+#define GICD_BASE       0x08000000  /* c.f. VIRT_GIC_DIST */
+#define GICR_BASE       0x080a0000  /* c.f. VIRT_GIC_REDIST */
+
+/* Distributor registers */
+#define GICD_CTLR       (GICD_BASE + 0x0000)
+#define GICD_TYPER      (GICD_BASE + 0x0004)
+#define GICD_IIDR       (GICD_BASE + 0x0008)
+
+/* Redistributor registers (per-CPU) */
+#define GICR_SGI_OFFSET 0x00010000
+
+#define GICR_CTLR       0x0000
+#define GICR_WAKER      0x0014
+
+#define GICR_IGROUPR0   (GICR_SGI_OFFSET + 0x0080)
+#define GICR_ISENABLER0 (GICR_SGI_OFFSET + 0x0100)
+#define GICR_IPRIORITYR (GICR_SGI_OFFSET + 0x0400)
+
+/* GICD_CTLR fields */
+#define GICD_CTLR_ENA_GRP0   (1U << 0)
+#define GICD_CTLR_ENA_GRP1NS (1U << 1)
+#define GICD_CTLR_ARE_NS     (1U << 5)
+
+/* GICR_WAKER bits */
+#define GICR_WAKER_ProcessorSleep (1U << 1)
+#define GICR_WAKER_ChildrenAsleep (1U << 2)
+
+/**
+ * gicv3_init:
+ *
+ * Initialize GICv3 distributor and the redistributor for the current CPU.
+ */
+void gicv3_init(void);
+
+/**
+ * gicv3_enable_irq:
+ * @irq: The IRQ number to enable
+ *
+ * Enable the specified IRQ (SPI or PPI).
+ */
+void gicv3_enable_irq(unsigned int irq);
+
+#endif /* GICV3_H */
diff --git a/tests/tcg/aarch64/system/lib/gicv3.c b/tests/tcg/aarch64/system/lib/gicv3.c
new file mode 100644
index 00000000000..9cfd033a8ec
--- /dev/null
+++ b/tests/tcg/aarch64/system/lib/gicv3.c
@@ -0,0 +1,70 @@
+/*
+ * GICv3 Helper Library Implementation
+ *
+ * Copyright (c) 2026 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <stdint.h>
+#include "sysregs.h"
+#include "gicv3.h"
+
+static inline void write_reg(uintptr_t addr, uint32_t val)
+{
+    *(volatile uint32_t *) addr = val;
+}
+
+static inline uint32_t read_reg(uintptr_t addr)
+{
+    return *(volatile uint32_t *) addr;
+}
+
+void gicv3_init(void)
+{
+    uint32_t val;
+
+    /* 1. Enable Distributor ARE and Group 1 NS */
+    val = read_reg(GICD_CTLR);
+    val |= GICD_CTLR_ARE_NS | GICD_CTLR_ENA_GRP1NS;
+    write_reg(GICD_CTLR, val);
+
+    /* 2. Wake up Redistributor 0 and clear ProcessorSleep */
+    val = read_reg(GICR_BASE + GICR_WAKER);
+    val &= ~GICR_WAKER_ProcessorSleep;
+    write_reg(GICR_BASE + GICR_WAKER, val);
+
+    /* Wait for ChildrenAsleep to be cleared */
+    while (read_reg(GICR_BASE + GICR_WAKER) & GICR_WAKER_ChildrenAsleep) {
+        /* spin */
+    }
+
+    /* 3. Enable CPU interface */
+    /* Set Priority Mask to allow all interrupts */
+    write_sysreg(0xff, ICC_PMR_EL1);
+    /* Enable Group 1 Non-Secure interrupts */
+    write_sysreg(1, ICC_IGRPEN1_EL1);
+    isb();
+}
+
+void gicv3_enable_irq(unsigned int irq)
+{
+    if (irq < 32) {
+        /* PPI: use GICR_ISENABLER0 */
+        uintptr_t addr;
+
+        /* Set Group 1 */
+        addr = GICR_BASE + GICR_IGROUPR0;
+        write_reg(addr, read_reg(addr) | (1U << irq));
+
+        /* Set priority (0xa0) */
+        addr = GICR_BASE + GICR_IPRIORITYR + irq;
+        *(volatile uint8_t *)addr = 0xa0;
+
+        /* Enable it */
+        addr = GICR_BASE + GICR_ISENABLER0;
+        write_reg(addr, 1U << irq);
+    } else {
+        /* SPI: not implemented yet */
+    }
+}
diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index 5770ae1fb0c..543d638e819 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -106,6 +106,8 @@ run-pauth-3:
 	$(call skip-test, "RUN of pauth-3", "not built")
 endif
 
+gicv3.o: gicv3.c gicv3.h
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -c $< -o $@
 ifneq ($(CROSS_CC_HAS_ARMV8_MTE),)
 QEMU_MTE_ENABLED_MACHINE=-M virt,mte=on -cpu max -display none
 QEMU_OPTS_WITH_MTE_ON = $(QEMU_MTE_ENABLED_MACHINE) $(QEMU_BASE_ARGS) -kernel
-- 
2.47.3


