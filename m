Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp538472lff;
        Thu, 12 Aug 2021 09:57:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylLuZKGbMUZ852u7RvFLTCaOQZPkfgRkkO1Uw15L4HF5zbbJabCCTblJYN7Pd3K/H8bnkT
X-Received: by 2002:a05:6602:2e0e:: with SMTP id o14mr3775734iow.161.1628787468707;
        Thu, 12 Aug 2021 09:57:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628787468; cv=none;
        d=google.com; s=arc-20160816;
        b=u8zYtnz0gtW7zaOG9m8KP66wzVYttegUqHkcjm6HMOlx1pAMgJqHox7EvidEygEi9f
         hB2HlM2owSkCJ5OINZsw7OA+46njEe9DOrIW45cXvOzoqIQYaRQdY76SjVTapH6s1shR
         VV0JMp2UdgN3rLRE4Px4lPu1P2wVATqoevFV+UuMcWsRHfVDvLAPv1EFXREhry5HYVAD
         sZvlaCsVYpswrWC8Q6VlmJBGqrQj55xncn87DSdhGplXf62EDJWbrnYhkNVZI8J6SIRl
         5Ckg69vaYMDYTP1wnuN0t5A5cNC0R7+HLbwBKWPzoSuv6ZMPG6a2lJQUgTRPiwgUMmx/
         LFog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8+435bw22s57J4dB7dZnjVtq/PQBXSBTmGSwBfTw/2k=;
        b=Qa4aHzRffVR7znCMtPg2wUO20ZbqTEXAq/ZUxlO+asUvg31KNnqt6YIUrTjxRQ5I3k
         n65zszS1kPqRHTTX0dWlmGHJmU575TRw3VeqJikmNyy7NQPTxzC3oW4VJjkxDmhLQM/V
         QAhaDfSZDzYPnWGfDGnpIJ53VtrhxqIRX0KvmKyP3Ys1wwCRzHRiejq3u/QqKIINY/sw
         MXFskGbZZsb4YlIf1bQYxB9ywpy533/uGSq+PExWDPfK89QQ1Til0p2UBFbdJv/PrA5h
         HarMGXwC+iZiCaPb9++v9o2wQmy9R6QcPmjFY9d8qpvWTqrvBwEgYYIIOOUFNsjSmBZ9
         ZDsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wIaiMU5x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1si3064410ile.140.2021.08.12.09.57.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 09:57:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wIaiMU5x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mEE1c-0005yE-0T
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 12:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDxs-0007lQ-26
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 12:53:56 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:35772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDxm-00062p-Gz
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 12:53:55 -0400
Received: by mail-qk1-x72f.google.com with SMTP id a19so7375784qkg.2
 for <qemu-arm@nongnu.org>; Thu, 12 Aug 2021 09:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8+435bw22s57J4dB7dZnjVtq/PQBXSBTmGSwBfTw/2k=;
 b=wIaiMU5xhvrMbEEdCOGReohEZcUQ6e7bq04ZANSP8Tcwdj/sQ7Clq9oO9RLsnoKTjH
 DbLC41nlOFodS3byJ+cmfp5igIdDMLYincTmSWm5YeGwmoxfrWFrT8PIhx8zVLALtWkQ
 TnZhePRdQ6tgJe1w+cbJwsgXyeYQaopOBPfHrjU27wSTeYmYes/J6mdFrgEpQAlRbQM6
 sBBYQsynPjnrOf3RKbiDmXAmMjfWODqHHiylJkp3YeOtLpN/jjPAh0wdRjgr4Zm/ZpOu
 7XvpqQLXFDafP6y0MTpc4BdbyYzXNc9D6zeRroUKjSDWwsXwd7G/ehT3YuBC5gdX8vw/
 1Jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8+435bw22s57J4dB7dZnjVtq/PQBXSBTmGSwBfTw/2k=;
 b=LVA8ssfgdKAmIAK6WzmJJoiiUJ/6GZ57c7Cy0GXsjYYdZ04XhsPWDSM8SfVt6n2xpM
 QZyMSrUbzHpOEisMAK9Ue2bmV2uhmXXJKP6BjZR1fBcKXRKSN7Egop8ffSZ+np52q0EF
 3MENcnBhj7QwP2i1SzADsuQ2SXe5LfhVJs3WNFm19ksI1VOI3vs3X2yF+TMAJjpIXifr
 0IZtwS4SBDqrB4cY78noFta8w2s9IGyDtqXuJE62ouYs6o/qXbc40h8+gMiPyMjvnSFh
 wk6oAVV9eyII3d8WwK+F6lImDpx2HWUz86qFAPJErieHSV+rqe59KJ5CE7fiatYIcRLB
 8S2A==
X-Gm-Message-State: AOAM530DwUNlE1mKFfeJXwLNUDIebX2fY1wE/7LOCRttKqQMOzYNFkfn
 /mqsoadHgfl+a3cy41g9ADy3sg==
X-Received: by 2002:a37:6514:: with SMTP id z20mr3837538qkb.23.1628787229560; 
 Thu, 12 Aug 2021 09:53:49 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id c69sm1714864qkg.1.2021.08.12.09.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 09:53:48 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v8 05/10] hw/intc: GICv3 ITS Feature enablement
Date: Thu, 12 Aug 2021 12:53:36 -0400
Message-Id: <20210812165341.40784-6-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210812165341.40784-1-shashi.mallela@linaro.org>
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72f.google.com
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 narmstrong@baylibre.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ajTe8YjlDSTC

Added properties to enable ITS feature and define qemu system
address space memory in gicv3 common,setup distributor and
redistributor registers to indicate LPI support.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Neil Armstrong <narmstrong@baylibre.com>
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
index 53da703ed8..2108abfe9c 100644
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
index 1966444790..530d1c1789 100644
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

