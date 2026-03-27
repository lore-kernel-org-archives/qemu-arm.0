Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBABE10ED65E
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:24:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65ED-0003bN-4u; Fri, 27 Mar 2026 07:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Ca-0007ll-Hr
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:18:08 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65CX-0000HT-R2
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:18:08 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-43b949bf4easo1165539f8f.0
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610281; x=1775215081; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ji4M7/zlXLPLxa6vnn4WlUzf8phK32eQHNKPiB6p3iM=;
 b=Gzb8LvQskAVU9rQmNYqnAXX/hHYLAYqNSyrzPD6LhpQtjEBpW6CHVe9kpSuwM4HZpl
 PFf1kRukH+Id/DH2OyG30Cz4z/xV5M/rZgjnw9LZEUM06IWbcEryLW3Ge6ztfAdvt4fv
 o0HmPSlAqExPpfx5Be1EPKKcerzKtg3p1AlwTBnw/eRJQ1sPpdRJJAtMiw0pbSF3D7oO
 AByXvaiEVKR7VkX9WZtudqxbFf6VksxYeBGt8gT7ddnQWhp7QGg6djN1eBKzVkn9I6D8
 ck1m3ew7vJXauJQXD5wFJfPgEeIaGlBJ56stjysvNb0BCbr+6iKOM0ks2ACKB9zB/QdH
 KsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610281; x=1775215081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ji4M7/zlXLPLxa6vnn4WlUzf8phK32eQHNKPiB6p3iM=;
 b=K9VpEzjywlwNONLEuL89InKInGG4OdAIkvWqO7LkgcP+P0KK3KB/Yym/4YFaIAKgqb
 s+Is+n4KjnHe1Enm78pXie/rr72kf+eB5WX/C2gFF4TfhmtRHajgdJoffSvHW+iEZTtQ
 FWmvKdjEZobReXlZdPAqH0vlRF6s0zwJBck0nKWtwvPAYmSybvZnEk5TFe4M1hulWTdL
 tGAv+FRkFsH4LLRX2allM+Lq9rOJZtPdJX+/kXDikoJnOGFFU5Ay4dLB3PPK7PKD4d7A
 iJK5g84n2TCtTYWpOgswJZ9VXpBm6xiEUd41SNSsxuCpFYAkBkQb6Ia4iBXym3thed5m
 Ek+A==
X-Gm-Message-State: AOJu0YwR529ql7BQx+bgNSR7CxJJ4DMVp21R9EXYKwUHHq5FDBDoWjGz
 RTtONBUCgN59z6vTEZsAkgUgjvjnb4oisv5dgPWoOVEDB4e9fevbYKOur3ajRnJT3Wju7VfyGzi
 u0DZuV/o=
X-Gm-Gg: ATEYQzxhUHmmmOjj/QqUvQwGBbfC8ZJlFVkc54ytbY5qDr1Dm/Spu19BVlMekUU8CAm
 qq9IQqTJTj1UXq1dtBP+F7kKCDkqcUXqv+QGsD1ryqpSBZBx47Nd1fBijJET0bCOdsZpJOGkWkw
 C/sCKP8lsTo6kz7RcV677Te/BuKxEod0SK9OBZuo9XRllweuxa819r/XtcpZX8t3NKVJ4lV2CDd
 a4/KhQPrg2QYs8p7+mBCWB+oYJnXdJTA7oykF0pgIsOo9Nqu6uRpRbXN8AYWtw1MPEDPopuaSN1
 BvDsjgimZsAeQotau1RjYGYb/d+znx2BBQvTGMdHG554sfySPnnDNBzX1iE8k9oZJQx/AOGKOg3
 4Ch8mjLCKM9jV55ftMixmvCl54x7c4oNVr3cMFDMDin+CMW6gWbg365OkhxrVLJboKJdpeWdhxD
 NbUSrpE5iUOaJGmFDbOrVQNc52eAxwnqonHYUuMutWBT4f9sgnhUpKPdfNi80irU2SARkXPx10o
 +O0Bmmaj5vbDs/2ba/GH8Kd9mnTGdKOeOu/PajOlw==
X-Received: by 2002:a05:6000:410b:b0:439:cc5e:a6d5 with SMTP id
 ffacd0b85a97d-43b97a62151mr5327271f8f.23.1774610281203; 
 Fri, 27 Mar 2026 04:18:01 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:18:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 62/65] hw/arm/virt: Handle GICv5 in interrupt bindings for
 PPIs
Date: Fri, 27 Mar 2026 11:16:57 +0000
Message-ID: <20260327111700.795099-63-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/arm/virt.c        | 23 +++++++++++++++++++----
 include/hw/arm/fdt.h | 10 ++++++++++
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7a34af766a..bc49cf244f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -420,7 +420,15 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
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
@@ -699,11 +707,18 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
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
index c3d5015013..995652c27a 100644
--- a/include/hw/arm/fdt.h
+++ b/include/hw/arm/fdt.h
@@ -20,9 +20,19 @@
 #ifndef QEMU_ARM_FDT_H
 #define QEMU_ARM_FDT_H
 
+/*
+ * These are for GICv2/v3/v4 only; GICv5 encodes the interrupt type in
+ * the DTB "interrupts" properties differently, using constants that
+ * match the architectural INTID.Type. In QEMU those are available as
+ * the GICV5_PPI and GICV5_SPI enum values in arm_gicv5_types.h.
+ */
 #define GIC_FDT_IRQ_TYPE_SPI 0
 #define GIC_FDT_IRQ_TYPE_PPI 1
 
+/*
+ * The trigger type/level field in the DTB "interrupts" property has
+ * the same encoding for GICv2/v3/v4 and v5.
+ */
 #define GIC_FDT_IRQ_FLAGS_EDGE_LO_HI 1
 #define GIC_FDT_IRQ_FLAGS_EDGE_HI_LO 2
 #define GIC_FDT_IRQ_FLAGS_LEVEL_HI 4
-- 
2.43.0


