Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2692696lfk;
        Tue, 6 Jul 2021 19:19:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9Fv8yJiauB06B968qVd0d5ONSXEzXhl02F28TLdOL+FjETqjyYFCavugo5vIbwQowgDrI
X-Received: by 2002:a05:622a:1444:: with SMTP id v4mr20482775qtx.143.1625624390584;
        Tue, 06 Jul 2021 19:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625624390; cv=none;
        d=google.com; s=arc-20160816;
        b=nxLNhCsGt+3kIZyxVoxEYxBF0fgn0tPEYk1GWfC2HASf/G+3YCHURs1yFnlTVqvJz0
         ehQIHrMuY2OF02UZXh4OEMXp9uGdnrWa1lL0ygAF2rjHm/BKLjVMxHJQQFhUSK+C+mPj
         hrMzlP2a/bFxb7qq/HWpdupEvUl4vqPFgJqBl8GQxM8NAyxGeSF1DA4aUHsnRCxzs5v/
         8XUq9No2lIt1Mk0HS4ga1qfkjrKk6ZAZDNAKhKFQESnpi5FVfUhM7ESOlL5fURO8aIqS
         0Lkgap9S4VkTb1hJ37bT4wXQFBjSvK4x93e2lwYBXzZK+fMh2uD+IwP2CRnrMruZ8rLC
         9wTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mb3PeE3uSqU3oZfqfC3ZuR9uZC3EacOxzb2l/trB2vc=;
        b=zZTGyzOdIugAw89DT43QsxMggYwyiy6auzhJ9LYGDlkBNo9MsjCbkihrTEEN5T7EQQ
         +TykWRFGtNZBHLKffpEJSja5qrA2lSnQB4tFXFVx3nT0dN/pbRfTZ0in1iHdR0zs9Oty
         p/7J5mcnh7ORo21xogmjkKuVtK2uvgCVtbeqnLDhzV3g1NjdvjZoLa+3vA2sTfYPy2Zm
         aoNMM/FZ8Mh+BrDhJIo/cO0OeYPvFibj0WsYOVp8XD+9iGcZnVTKOTSImQFGsOdSsbsN
         AquUP/OMcXupVmCo9ZHrYbUbm2ThQ2BcC099vowbOkU2xj0xrbGnzQo6j6tRGauK3vxM
         3Nrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qkEJg5A3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10si13206909qvd.119.2021.07.06.19.19.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 19:19:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qkEJg5A3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0xAD-00022a-Sm
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 22:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0x9C-0000MA-4O
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 22:18:46 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:34791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0x8n-0001OF-CD
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 22:18:45 -0400
Received: by mail-qk1-x72b.google.com with SMTP id g4so499876qkl.1
 for <qemu-arm@nongnu.org>; Tue, 06 Jul 2021 19:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mb3PeE3uSqU3oZfqfC3ZuR9uZC3EacOxzb2l/trB2vc=;
 b=qkEJg5A3NAIU7d/PvsnUWLvUUwCg1fXgF7QgX+ZwyWcFElcffT5u4VzFjFb3L608wf
 KLWsIRrCobMBluHw0G4putVy25vGdZ5u/6h09Vas63p4+PWNh20U/TiRoIry3T9caAS4
 tCHTFuSRqHQVfcTgSXy5pU0Rwaw8librBzUh1lc39qni3M6D/lZ7M5dpgdiSaWXonmLE
 JWpqQ8VlUcz15ZfrPSzZRtyG8AySw6fg1F9usykByy/DX1wrVuz8hq0wt75JVE5X2kMt
 uhBXwe7he5vk/hdQ2qMbWJwhSQy4jKj3rU18g1SosD72PZ+I/zmu6s2A1M6ehA2vgzwt
 47Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mb3PeE3uSqU3oZfqfC3ZuR9uZC3EacOxzb2l/trB2vc=;
 b=r36qvgukCX4R2f9BAWe3AB4dG4ptdRG56tuV/gEtkYMVRWg8yzHizc3tqIt1Kms/Y9
 qCzzAyO7QTgn5xHk/eNreM3wdLogJpuoNIFKhppgieB0cA62lRnB6RDUJrLax1bRUKnk
 O/7jNdnCd7VsXBGmRLHAg0qpFtMvX27kZU4zn8uM6xfRM9cpFJXByJjKQ1P2ssEok0Ea
 i2cvsdxhmmBeKKO2EAj25YqZDO7wpF/Pqm25vJLnzt2LuuD1y64zzzyhZ3MV0CsUR9PX
 lNZDJEdQYwdd1qoXwX9qmNk1dvI7dAAeB0Ek+O1oa3+nGWTGVAWm+AiGk6OLYVGoJ3I8
 qmvA==
X-Gm-Message-State: AOAM5308NdgeC2+NMHlppduPvGyUNq/L7Zy5zEbQROjQcKDiOgm2FoPv
 U9oQwaTjhrSAeVCXa/gUMdHvjw==
X-Received: by 2002:a37:7841:: with SMTP id t62mr23286803qkc.412.1625624300537; 
 Tue, 06 Jul 2021 19:18:20 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id z6sm7768613qke.24.2021.07.06.19.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 19:18:20 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v6 05/10] hw/intc: GICv3 ITS Feature enablement
Date: Tue,  6 Jul 2021 22:18:10 -0400
Message-Id: <20210707021815.45938-6-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210707021815.45938-1-shashi.mallela@linaro.org>
References: <20210707021815.45938-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q3LtlIBotLNH

Added properties to enable ITS feature and define qemu system
address space memory in gicv3 common,setup distributor and
redistributor registers to indicate LPI support.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_common.c         | 12 ++++++++++++
 hw/intc/arm_gicv3_dist.c           |  5 ++++-
 hw/intc/arm_gicv3_redist.c         | 12 +++++++++---
 hw/intc/gicv3_internal.h           |  2 ++
 include/hw/intc/arm_gicv3_common.h |  1 +
 5 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 58ef65f589..53dea2a775 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -345,6 +345,11 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (s->lpi_enable && !s->dma) {
+        error_setg(errp, "Redist-ITS: Guest 'sysmem' reference link not set");
+        return;
+    }
+
     s->cpu = g_new0(GICv3CPUState, s->num_cpu);
 
     for (i = 0; i < s->num_cpu; i++) {
@@ -381,6 +386,10 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
             (1 << 24) |
             (i << 8) |
             (last << 4);
+
+        if (s->lpi_enable) {
+            s->cpu[i].gicr_typer |= GICR_TYPER_PLPIS;
+        }
     }
 }
 
@@ -494,9 +503,12 @@ static Property arm_gicv3_common_properties[] = {
     DEFINE_PROP_UINT32("num-cpu", GICv3State, num_cpu, 1),
     DEFINE_PROP_UINT32("num-irq", GICv3State, num_irq, 32),
     DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
+    DEFINE_PROP_BOOL("has-lpi", GICv3State, lpi_enable, 0),
     DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
     DEFINE_PROP_ARRAY("redist-region-count", GICv3State, nb_redist_regions,
                       redist_region_count, qdev_prop_uint32, uint32_t),
+    DEFINE_PROP_LINK("sysmem", GICv3State, dma, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index b65f56f903..43128b376d 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -371,7 +371,9 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
          * A3V == 1 (non-zero values of Affinity level 3 supported)
          * IDbits == 0xf (we support 16-bit interrupt identifiers)
          * DVIS == 0 (Direct virtual LPI injection not supported)
-         * LPIS == 0 (LPIs not supported)
+         * LPIS == 1 (LPIs are supported if affinity routing is enabled)
+         * num_LPIs == 0b00000 (bits [15:11],Number of LPIs as indicated
+         *                      by GICD_TYPER.IDbits)
          * MBIS == 0 (message-based SPIs not supported)
          * SecurityExtn == 1 if security extns supported
          * CPUNumber == 0 since for us ARE is always 1
@@ -386,6 +388,7 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
         bool sec_extn = !(s->gicd_ctlr & GICD_CTLR_DS);
 
         *data = (1 << 25) | (1 << 24) | (sec_extn << 10) |
+            (s->lpi_enable << GICD_TYPER_LPIS_SHIFT) |
             (0xf << 19) | itlinesnumber;
         return MEMTX_OK;
     }
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 8645220d61..fc3d95dcc6 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -248,10 +248,16 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
     case GICR_CTLR:
         /* For our implementation, GICR_TYPER.DPGS is 0 and so all
          * the DPG bits are RAZ/WI. We don't do anything asynchronously,
-         * so UWP and RWP are RAZ/WI. And GICR_TYPER.LPIS is 0 (we don't
-         * implement LPIs) so Enable_LPIs is RES0. So there are no writable
-         * bits for us.
+         * so UWP and RWP are RAZ/WI. GICR_TYPER.LPIS is 1 (we
+         * implement LPIs) so Enable_LPIs is programmable.
          */
+        if (cs->gicr_typer & GICR_TYPER_PLPIS) {
+            if (value & GICR_CTLR_ENABLE_LPIS) {
+                cs->gicr_ctlr |= GICR_CTLR_ENABLE_LPIS;
+            } else {
+                cs->gicr_ctlr &= ~GICR_CTLR_ENABLE_LPIS;
+            }
+        }
         return MEMTX_OK;
     case GICR_STATUSR:
         /* RAZ/WI for our implementation */
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 6e0343b0e2..b27e25dea3 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -68,6 +68,8 @@
 #define GICD_CTLR_E1NWF             (1U << 7)
 #define GICD_CTLR_RWP               (1U << 31)
 
+#define GICD_TYPER_LPIS_SHIFT          17
+
 /* 16 bits EventId */
 #define GICD_TYPER_IDBITS            0xf
 
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 0715b0bc2a..c1348cc60a 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -221,6 +221,7 @@ struct GICv3State {
     uint32_t num_cpu;
     uint32_t num_irq;
     uint32_t revision;
+    bool lpi_enable;
     bool security_extn;
     bool irq_reset_nonsecure;
     bool gicd_no_migration_shift_bug;
-- 
2.27.0

