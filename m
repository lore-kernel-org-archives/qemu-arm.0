Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp85004lfg;
        Wed, 31 Mar 2021 19:44:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8MNZPGuG36hwgCMwkJAOIvfGfH3efKThuQZo7g+hnrgbiYzLjGz87t/rflIcWKQB+H7Qb
X-Received: by 2002:a05:6808:30d:: with SMTP id i13mr4480876oie.160.1617245083702;
        Wed, 31 Mar 2021 19:44:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617245083; cv=none;
        d=google.com; s=arc-20160816;
        b=XDDLFaFRgdK6z38RiVSnUpwpvKW0IjTFqz+60veWvmBribo4BZ5EcZkqkyjtmZZbkY
         jmxfhwWbeCxuBVvdUeDaG/r2kyxKhiobsY3eSBg0k22MWph3mKuBzAjAS3ubjllld5Ca
         0ULIrsEqKNhJJyqUhb6D6kBeTkPI1rwCc9IZWaDf4lYsPjuGkaikZRUdjoNguvcxNggv
         OORs6FOogp4oN+xLGfPZJ8GWwq7Gs/WnGVGWbQ5qkwWAzc0keZY+PDZTDMnCh2VVWYua
         hhilIk/EKjwiKVM4Nk31H7oj2r9Go5JEcMFalz25cFi3lD78DW4ZnSPimLbi6KruYvFJ
         hjbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kpspPHcJfg6Gs/nyqw3eZ3/iN7HLzESlLVAgrEAXZC0=;
        b=infM6W3Q50hO9VjTQwOxyrL77n+svbarYAdaDyxkAmzhuXaLyXJ6y0dEpmhNUxbxSx
         Hs9IzT/KmVOQljwhmKIj+5L+XyYLckGLQMizizr5liNxbpqoTCcVlKu/favjaIFE2pPv
         em9bW7HxGGFFNIZRLfhoc7tFMRRsn5HSl+brsJMbGM9QC0s/S9aSOGY5u+8kkCjL0dWi
         sMfiOKwixvOPLwSVyr/TPlcx/o+LxvjIbCBB0JD7kUkrRokkFtwRGpu3s6b/sdrR60/w
         xHyed6cPJ975An72+2KJTeS7BuuHijU41xBenPnHLKqWR5cjzJsdV2LePyn0f9MpMjKK
         d/gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pSlqlLyr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3si3801729oiw.81.2021.03.31.19.44.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Mar 2021 19:44:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pSlqlLyr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lRnK6-0005xV-Tn
	for alex.bennee@linaro.org; Wed, 31 Mar 2021 22:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lRnHZ-0002oz-B6
 for qemu-arm@nongnu.org; Wed, 31 Mar 2021 22:42:05 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:35366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lRnHS-0003AM-Rm
 for qemu-arm@nongnu.org; Wed, 31 Mar 2021 22:42:05 -0400
Received: by mail-qk1-x72f.google.com with SMTP id i9so924183qka.2
 for <qemu-arm@nongnu.org>; Wed, 31 Mar 2021 19:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kpspPHcJfg6Gs/nyqw3eZ3/iN7HLzESlLVAgrEAXZC0=;
 b=pSlqlLyrw7BbRzBQBbDAlHy1NNraaTTJah96AyNOajiF4GgtFeYqHS8fSMZULbxSJJ
 dhQJXNUu6IcWXRt2gGQpW3K1Xms3qvc+J7/NDLIwZZDp8djBNcMpfeuWn5OAtVUZzJmB
 ZUASqAQ19EsZG+yQkKgUBUjm0Upj/UVZusu7zL8gsSQs2d5msnGtkaB5/sKPoGlchtVN
 mH9pCgYxaHBbi2ZsOTAZlkvBhb2Av4PjkHeQh0l+6sx/Hj+dB6yz3rAGhn79rQoakj1B
 RO+tPiHpIceXN4l1P2bE9PatSImsrAH8lsFVSiHUcIwO7NAPziplb1XfkZfvcmFtffvJ
 2IMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kpspPHcJfg6Gs/nyqw3eZ3/iN7HLzESlLVAgrEAXZC0=;
 b=JVSq0mORPhJM3h9RaTeEuV5tEPz/BNhDxsbIatUWXRGNZdAGLR9tNU8vxzWM8P3ayM
 BD1qMRSk/e0pi00z6gxfGmk2GN8PtR8T5ZQEOMrXLceTz2NcOGETzX2uZHTeDb25Ug8l
 3Q67KEcwBWSLvCtuwXRJFmgSCU9kflSy5cTu4YytRZVlP9VqwMkQN1TzvCBMJ81Nie9w
 LmvEHrDhtdKONJDaqQR3KkaZ9O+V4Y+r6fsGN5cDVUvzmp1NqpEFZusY7lT49qmrAvoL
 elywOpSpfs+sfso3m2oypHObFMGpP2cswunkHjt4cMQWIgoEAo0m0EhOjo2VujwvCfb1
 NBmg==
X-Gm-Message-State: AOAM530XpxsTQlBOHG3M+6AwUfR1BVcUoIuAphIcVT8fnCGh1QFAfhe3
 d2iEXPm+Sh2XgsRXmKHSsWnp4C6VGFBbTQ==
X-Received: by 2002:a37:a008:: with SMTP id j8mr6176955qke.343.1617244917890; 
 Wed, 31 Mar 2021 19:41:57 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id a8sm2525707qtx.9.2021.03.31.19.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 19:41:57 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v2 5/8] hw/intc: GICv3 ITS Feature enablement
Date: Wed, 31 Mar 2021 22:41:49 -0400
Message-Id: <20210401024152.203896-6-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210401024152.203896-1-shashi.mallela@linaro.org>
References: <20210401024152.203896-1-shashi.mallela@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +ziCePCRnHBh

Added properties to enable ITS feature and define qemu system
address space memory in gicv3 common,setup distributor and
redistributor registers to indicate LPI support.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/intc/arm_gicv3_common.c         | 16 ++++++++++++++++
 hw/intc/arm_gicv3_dist.c           | 22 ++++++++++++++++++++--
 hw/intc/arm_gicv3_redist.c         | 28 +++++++++++++++++++++++++---
 hw/intc/gicv3_internal.h           | 17 +++++++++++++++++
 include/hw/intc/arm_gicv3_common.h |  8 ++++++++
 5 files changed, 86 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 58ef65f589..3bfc52f7fa 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -156,6 +156,7 @@ static const VMStateDescription vmstate_gicv3_cpu = {
         VMSTATE_UINT32(gicr_waker, GICv3CPUState),
         VMSTATE_UINT64(gicr_propbaser, GICv3CPUState),
         VMSTATE_UINT64(gicr_pendbaser, GICv3CPUState),
+        VMSTATE_BOOL(lpi_outofrange, GICv3CPUState),
         VMSTATE_UINT32(gicr_igroupr0, GICv3CPUState),
         VMSTATE_UINT32(gicr_ienabler0, GICv3CPUState),
         VMSTATE_UINT32(gicr_ipendr0, GICv3CPUState),
@@ -227,6 +228,7 @@ static const VMStateDescription vmstate_gicv3 = {
     .priority = MIG_PRI_GICV3,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(gicd_ctlr, GICv3State),
+        VMSTATE_UINT32(gicd_typer, GICv3State),
         VMSTATE_UINT32_ARRAY(gicd_statusr, GICv3State, 2),
         VMSTATE_UINT32_ARRAY(group, GICv3State, GICV3_BMP_SIZE),
         VMSTATE_UINT32_ARRAY(grpmod, GICv3State, GICV3_BMP_SIZE),
@@ -381,6 +383,16 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
             (1 << 24) |
             (i << 8) |
             (last << 4);
+
+        if (s->lpi_enable) {
+            s->cpu[i].gicr_typer |= GICR_TYPER_PLPIS;
+
+            if (!s->sysmem) {
+                error_setg(errp,
+                    "Redist-ITS: Guest 'sysmem' reference link not set");
+                return;
+            }
+        }
     }
 }
 
@@ -406,6 +418,7 @@ static void arm_gicv3_common_reset(DeviceState *dev)
         cs->gicr_waker = GICR_WAKER_ProcessorSleep | GICR_WAKER_ChildrenAsleep;
         cs->gicr_propbaser = 0;
         cs->gicr_pendbaser = 0;
+        cs->lpi_outofrange = false;
         /* If we're resetting a TZ-aware GIC as if secure firmware
          * had set it up ready to start a kernel in non-secure, we
          * need to set interrupts to group 1 so the kernel can use them.
@@ -494,9 +507,12 @@ static Property arm_gicv3_common_properties[] = {
     DEFINE_PROP_UINT32("num-cpu", GICv3State, num_cpu, 1),
     DEFINE_PROP_UINT32("num-irq", GICv3State, num_irq, 32),
     DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
+    DEFINE_PROP_BOOL("has-lpi", GICv3State, lpi_enable, 0),
     DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
     DEFINE_PROP_ARRAY("redist-region-count", GICv3State, nb_redist_regions,
                       redist_region_count, qdev_prop_uint32, uint32_t),
+    DEFINE_PROP_LINK("sysmem", GICv3State, sysmem, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index b65f56f903..96a317a8ef 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -366,12 +366,15 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
         return MEMTX_OK;
     case GICD_TYPER:
     {
+        bool lpi_supported = false;
         /* For this implementation:
          * No1N == 1 (1-of-N SPI interrupts not supported)
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
@@ -385,8 +388,23 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
          */
         bool sec_extn = !(s->gicd_ctlr & GICD_CTLR_DS);
 
+        /*
+         * With securityextn on,LPIs are supported when affinity routing
+         * is enabled for non-secure state and if off LPIs are supported
+         * when affinity routing is enabled.
+         */
+        if (s->lpi_enable) {
+            if (sec_extn) {
+                lpi_supported = (s->gicd_ctlr & GICD_CTLR_ARE_NS);
+            } else {
+                lpi_supported = (s->gicd_ctlr & GICD_CTLR_ARE);
+            }
+        }
+
         *data = (1 << 25) | (1 << 24) | (sec_extn << 10) |
-            (0xf << 19) | itlinesnumber;
+            (lpi_supported << GICD_TYPER_LPIS_OFFSET) | (GICD_TYPER_IDBITS <<
+            GICD_TYPER_IDBITS_OFFSET) | itlinesnumber;
+        s->gicd_typer = *data;
         return MEMTX_OK;
     }
     case GICD_IIDR:
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 8645220d61..325b974e70 100644
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
@@ -275,6 +281,14 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
         cs->gicr_waker = value;
         return MEMTX_OK;
     case GICR_PROPBASER:
+        if (FIELD_EX64(value, GICR_PROPBASER, IDBITS) <
+            GICR_PROPBASER_IDBITS_THRESHOLD) {
+            cs->lpi_outofrange = true;
+        }
+        if (FIELD_EX64(value, GICR_PROPBASER, IDBITS) > GICD_TYPER_IDBITS) {
+            value &= ~R_GICR_PROPBASER_IDBITS_MASK;
+            value |= GICD_TYPER_IDBITS;
+        }
         cs->gicr_propbaser = deposit64(cs->gicr_propbaser, 0, 32, value);
         return MEMTX_OK;
     case GICR_PROPBASER + 4:
@@ -397,6 +411,14 @@ static MemTxResult gicr_writell(GICv3CPUState *cs, hwaddr offset,
 {
     switch (offset) {
     case GICR_PROPBASER:
+        if (FIELD_EX64(value, GICR_PROPBASER, IDBITS) <
+            GICR_PROPBASER_IDBITS_THRESHOLD) {
+            cs->lpi_outofrange = true;
+        }
+        if (FIELD_EX64(value, GICR_PROPBASER, IDBITS) > GICD_TYPER_IDBITS) {
+            value &= ~R_GICR_PROPBASER_IDBITS_MASK;
+            value |= GICD_TYPER_IDBITS;
+        }
         cs->gicr_propbaser = value;
         return MEMTX_OK;
     case GICR_PENDBASER:
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index e9f9aa6722..a2718704d4 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -68,6 +68,9 @@
 #define GICD_CTLR_E1NWF             (1U << 7)
 #define GICD_CTLR_RWP               (1U << 31)
 
+#define GICD_TYPER_LPIS_OFFSET         17
+#define GICD_TYPER_IDBITS_OFFSET       19
+#define GICD_TYPER_IDBITS_MASK       0x1f
 /* 16 bits EventId */
 #define GICD_TYPER_IDBITS            0xf
 
@@ -126,6 +129,20 @@
 #define GICR_WAKER_ProcessorSleep    (1U << 1)
 #define GICR_WAKER_ChildrenAsleep    (1U << 2)
 
+FIELD(GICR_PROPBASER, IDBITS, 0, 5)
+FIELD(GICR_PROPBASER, INNERCACHE, 7, 3)
+FIELD(GICR_PROPBASER, SHAREABILITY, 10, 2)
+FIELD(GICR_PROPBASER, PHYADDR, 12, 40)
+FIELD(GICR_PROPBASER, OUTERCACHE, 56, 3)
+
+#define GICR_PROPBASER_IDBITS_THRESHOLD          0xd
+
+FIELD(GICR_PENDBASER, INNERCACHE, 7, 3)
+FIELD(GICR_PENDBASER, SHAREABILITY, 10, 2)
+FIELD(GICR_PENDBASER, PHYADDR, 16, 36)
+FIELD(GICR_PENDBASER, OUTERCACHE, 56, 3)
+FIELD(GICR_PENDBASER, PTZ, 62, 1)
+
 #define ICC_CTLR_EL1_CBPR           (1U << 0)
 #define ICC_CTLR_EL1_EOIMODE        (1U << 1)
 #define ICC_CTLR_EL1_PMHE           (1U << 6)
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 3a710592a9..db3989484d 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -175,6 +175,13 @@ struct GICv3CPUState {
     uint32_t gicr_nsacr;
     uint8_t gicr_ipriorityr[GIC_INTERNAL];
 
+    /*
+     * flag to indicate LPIs are out of range
+     * since IDbits from GICR_PROPBASER is less
+     * than 0b1101
+     */
+    bool lpi_outofrange;
+
     /* CPU interface */
     uint64_t icc_sre_el1;
     uint64_t icc_ctlr_el1[2];
@@ -221,6 +228,7 @@ struct GICv3State {
     uint32_t num_cpu;
     uint32_t num_irq;
     uint32_t revision;
+    bool lpi_enable;
     bool security_extn;
     bool irq_reset_nonsecure;
     bool gicd_no_migration_shift_bug;
-- 
2.27.0

