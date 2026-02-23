Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AC3EC1112
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:11:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZM8-0004WB-CJ; Mon, 23 Feb 2026 12:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZLF-0002wH-9Q
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:32 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZL9-0000T0-Td
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:28 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48069a48629so47262375e9.0
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866202; x=1772471002; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xnLatPeKAUqiKYWLfB7xxZkhhx5vWjxgFw6UbAcOb1o=;
 b=nAI4tTixjMkYX72BZCq+KRXom+EnGvGzgrX/+cgGRtc3C8NB3Dd7GVBmQCHRuMDhh+
 ZHzKDB1nppfWVxx1hybS5pQ9jXvezI3K4scGBdmRW0vFZurG9SmOt2eu7IdHp4aUZsaI
 TkFPw6pyvjbfGG4xule4fTRdtUyQUtT1GZBB6H+xgN61XmnSAg+1tQxXhOnQiXa4NgDc
 e9zRi31KuhpTdOzipV1lKDT+BKAvkNudQK+oRye1q5AKncHslSn/sVsiG5ilOU2bTn1w
 +MnVq/J7MdPXY/bN5dNDZJDeEfM+Vn0+C705nmfyHggblEQx72/ohdiysCxTPjsf0y7x
 U3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866202; x=1772471002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xnLatPeKAUqiKYWLfB7xxZkhhx5vWjxgFw6UbAcOb1o=;
 b=g4nd0LOgEyhtLFCSvH+w31a3zxXKkOzGYW5BCN4mc3S6W3uKepKUsdiC/Bro9RGFoZ
 G9rVqHCmz9HBNRV9o+QA6wJ6iBlm1TtH7YPOWR4QFcMS4BVm2B84FyDxKPz6X2zyf8Jc
 eZYlhy7Qyrxf4aweB7crG/tVrsYzNYSFjNjAEqmGNS51PQHdKYYITH2ac5n6Kx8Y9vGQ
 VWVZQm9I0GsKRra+/Ccndn/0pxuk7z/RhsS1/CY6RYZO4PotGQfnlLsRdvJVKYrQ9yTr
 gZZxUfjBQfapL47pBXF1mxiZAwoS8GyCX87+uuS9ZzL7zqYk3vtjXHNg8zbOfpqFUfrI
 Bv5g==
X-Gm-Message-State: AOJu0Yx7nPoA53PLoD71gBFnGtPoJ8ErJ5pR1B+JPkL4fubfAAVxiWaS
 yosB4tgMByURQGiNQqh6im7cOKhxAGMS8EFBY7sqo/vGVRtW+fJAYycpX39XovYA13vrCIA7fsR
 /7Tkn
X-Gm-Gg: AZuq6aLcN0dxeQ2hHOe/B9srsVf+ph0HBfGIcywyhS9mhqaZQzqPr9e8LOTfm/MC0iu
 KKbqKOoMAYUs/zJ6OYs5eEzbuwNF34hzYJjNCe1xqNnuSCIAkEp3iPfBqHTg3qUwgzGy/70j7c5
 Spjz3kJ3OLZkr40F5gmrB5I17egtD462HYp+WqJtB3Q/uQ/WFVkM2V1Xd0iz+t4sDsw/JYPrYRp
 1rk17LWx1ribErAUHnnivkaaQ0Z07xE9Zdo0gxQhYUDjXQgagjOM5nlrUO1PuMu/qRMB0J4Y6m2
 aWchfIWu6Ig1P1xn9lX7Im0PJBzdwxH04ZjERYVVY6nz0v9ybIVxRinxQyfsDeo+AYhASJTL+Bn
 epp6KRH1x3IFuKWAyWQ8WG/ROy44I48ulCwDzPri0V6FSKza5/wW6oQkf7v/R4mXb3B/xPvZ8WW
 E5kl43zM33w3BcMKk3K9/V7ObDU31Yikrpq1P1BCdougCfkCIj3vs6Uy4jDrV7aNAFWpeEsQjPv
 34yTfZqJOStsFhh8pYTUk4KjIIaOCQ=
X-Received: by 2002:a05:600c:1e1d:b0:480:6999:27ec with SMTP id
 5b1f17b1804b1-483a95bebcdmr171943985e9.13.1771866202287; 
 Mon, 23 Feb 2026 09:03:22 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:03:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 62/65] hw/arm/virt: Handle GICv5 in interrupt bindings for PPIs
Date: Mon, 23 Feb 2026 17:02:09 +0000
Message-ID: <20260223170212.441276-63-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

The GICv5 devicetree binding specifies the "interrupts" property
differently to GICv2 and GICv3 for PPIs: the first field is the
architectural INTID.TYPE, and the second is the architectural
INTID.ID.  (The third field defining the level/edge trigger mode has
the same values for GICv5 as it did for the older GICs.)

In the places in the virt board where we wire up PPIs (the timer and
the PMU), handle the GICv5:

 * use the architectural constant GICV5_PPI for the type
 * use the architected GICv5 PPI numbers for the interrupt sources
   (which differ from the old ones and don't need to be adjusted via
   INTID_TO_PPI())
 * leave the irqflags as-is

Add some commentary in our include/hw/arm/fdt.h file about what the
the constants defined there are valid for.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c        | 23 +++++++++++++++++++----
 include/hw/arm/fdt.h | 10 ++++++++++
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 6775062c5d..05c92e8482 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -421,7 +421,15 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
                                 "arm,armv7-timer");
     }
     qemu_fdt_setprop(ms->fdt, "/timer", "always-on", NULL, 0);
-    if (vms->ns_el2_virt_timer_irq) {
+    if (vms->gic_version == VIRT_GIC_VERSION_5) {
+        /* The GICv5 architects the PPI numbers differently */
+        qemu_fdt_setprop_cells(ms->fdt, "/timer", "interrupts",
+                               GICV5_PPI, GICV5_PPI_CNTPS, irqflags,
+                               GICV5_PPI, GICV5_PPI_CNTP, irqflags,
+                               GICV5_PPI, GICV5_PPI_CNTV, irqflags,
+                               GICV5_PPI, GICV5_PPI_CNTHP, irqflags,
+                               GICV5_PPI, GICV5_PPI_CNTHV, irqflags);
+    } else if (vms->ns_el2_virt_timer_irq) {
         qemu_fdt_setprop_cells(ms->fdt, "/timer", "interrupts",
                                GIC_FDT_IRQ_TYPE_PPI,
                                INTID_TO_PPI(ARCH_TIMER_S_EL1_IRQ), irqflags,
@@ -700,11 +708,18 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
     qemu_fdt_add_subnode(ms->fdt, "/pmu");
     if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
         const char compat[] = "arm,armv8-pmuv3";
+
         qemu_fdt_setprop(ms->fdt, "/pmu", "compatible",
                          compat, sizeof(compat));
-        qemu_fdt_setprop_cells(ms->fdt, "/pmu", "interrupts",
-                               GIC_FDT_IRQ_TYPE_PPI,
-                               INTID_TO_PPI(VIRTUAL_PMU_IRQ), irqflags);
+        if (vms->gic_version == VIRT_GIC_VERSION_5) {
+            qemu_fdt_setprop_cells(ms->fdt, "/pmu", "interrupts",
+                                   GICV5_PPI, GICV5_PPI_PMUIRQ, irqflags);
+        } else {
+            qemu_fdt_setprop_cells(ms->fdt, "/pmu", "interrupts",
+                                   GIC_FDT_IRQ_TYPE_PPI,
+                                   INTID_TO_PPI(VIRTUAL_PMU_IRQ),
+                                   irqflags);
+        }
     }
 }
 
diff --git a/include/hw/arm/fdt.h b/include/hw/arm/fdt.h
index c3d5015013..da5c9d4a8f 100644
--- a/include/hw/arm/fdt.h
+++ b/include/hw/arm/fdt.h
@@ -20,9 +20,19 @@
 #ifndef QEMU_ARM_FDT_H
 #define QEMU_ARM_FDT_H
 
+/*
+ * These are for GICv2/v3/v4 only; GICv5 encodes the interrupt type in
+ * the DTB "interrupts" properties differently, using constants that match
+ * the architectural INTID.Type. In QEMU those are available as the
+ * GICV5_PPI and GICV5_SPI enum values in arm_gicv5_types.h.
+ */
 #define GIC_FDT_IRQ_TYPE_SPI 0
 #define GIC_FDT_IRQ_TYPE_PPI 1
 
+/*
+ * The trigger type/level field in the DTB "interrupts" property
+ * has the same encoding for GICv2/v3/v4 and v5.
+ */
 #define GIC_FDT_IRQ_FLAGS_EDGE_LO_HI 1
 #define GIC_FDT_IRQ_FLAGS_EDGE_HI_LO 2
 #define GIC_FDT_IRQ_FLAGS_LEVEL_HI 4
-- 
2.43.0


