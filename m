Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp398881lfq;
        Fri, 8 Apr 2022 07:37:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6yEOnuTGkVPXSq5SH1fnVvOlFSmLMwDDOHv2DEdUoE3yh0Lw8GdHHjjRQwF/MQeiCr4cC
X-Received: by 2002:a81:4f02:0:b0:2e6:d9a5:442d with SMTP id d2-20020a814f02000000b002e6d9a5442dmr16800114ywb.457.1649428666561;
        Fri, 08 Apr 2022 07:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649428666; cv=none;
        d=google.com; s=arc-20160816;
        b=wVUL2UqbbEcFxsgCQ6Cg+PvNLNLw8ybwg7S+C8aE6UKuxzZXJl7KNDVu3z4xMh2sbF
         hzHbBwK90C6AgrTpAuKnPywZ1PtlqHuDLDZIQoU7h6aywwxu0izj72rWyB5qd4cxmmf1
         J2388N7EO9LPYMuxgpl2BRPBICJbRIhYtnjqhePOC9qeZdtd5HxGHyf8O++dEPCZcLW6
         6EOH799suT5uGpFTW1ASJd/UCZ/dS5ntoh0UvcO0j8eRN5aovRiNS0D6M5rIuCObPd80
         arXfAIrH2Ubjqx9jqq9xrHJq/a7gD68QqrthWO/IDkb3bw9ItO4kj5AaVb/HBg5hOZJ+
         JgmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4X5gt1qh1B1TGFcyO7ZbfSY/eEx5BCkyPS7Ts12JMq0=;
        b=mQkzJmy3HOL6lRb1MgtXlehhWhVxkWFxOVWANDWBUzDKWHo/6iBA766TJqpwtVkNSm
         QGjV6a7P0SruT0RLoPamrQhe27X2V7O1X8F4DQwcPgAcPjunx+hvm3GfzSHNZmcCpdqL
         +vAPpaoOQXIZ/EWiG7IHYbAUTgeagEs9dPBmaQDEUqmsZNNYKE72PDxla90tJEoO7guc
         4Ku0RPUbpCiIA1wQghbgm2cSF5oYLnidLN8g6x4oVhNwd+AR1Nxyz0g/75p6CSGL5gZ6
         Hqb1Xbpy9vwgvCBF5kBzK5cwzGDn2+L2q3sDghzVnwwv09YwybTl9comKbkVEv3rzU60
         aeZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jOXXMYgP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5-20020a816005000000b002e611cc8d22si489066ywb.439.2022.04.08.07.37.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 07:37:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jOXXMYgP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncpk9-0007PH-Uc
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 10:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPN-0006ys-Jc
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:18 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:56207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPL-0002LT-Jy
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:17 -0400
Received: by mail-wm1-x333.google.com with SMTP id n35so5570481wms.5
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 07:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4X5gt1qh1B1TGFcyO7ZbfSY/eEx5BCkyPS7Ts12JMq0=;
 b=jOXXMYgPL3yhnk1Vp7xvzHHBDDF34JuRGXI4WS2VmoIoyK+qeJqKxfp1oeNSDyOiev
 oJSn9Wq6jW3etOPvTK/K5x5K3KyLryPaUmjF0UbFzyaJcDEbWeeoItCAvrNJbJJv6797
 xeU7eh7Eoek6zESCgxBaa4gV5oNVQDR+VZd6D096YcMnngrOU3le3y1xBOXIZDpmuzRc
 nS4+LKIaYcp6K5yZJ6DZMFHG+ZH18IjTru+cX5wZA0oRkzQCODFrDT9SelUszlOeVGpT
 knq71e2GN3wl/xykeY34/6DYOpSeKSmo6GqDIlkzYtgXNWJxGPZTBV3UG16bBro+s0/e
 59hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4X5gt1qh1B1TGFcyO7ZbfSY/eEx5BCkyPS7Ts12JMq0=;
 b=dtov/Wk5gHndh+idDKYaR/h5iLENX3b194M4YVT3Uw6c5W1jXIDqFZruSRWQmicP67
 16tqm/KqTD7l9RdXe0DC6W8yn+tQDevwHdoDlffkeGfDLRW7BDqz3DWAzy0EAwE8kbfZ
 oK1DZO6TzUR9YArXNOCkYLbslP5OrBBdnZS0WwCBoMD3zctu39NfhVUfv14EpssVQogy
 WNAbQkMLzZ7aU1pC4PNRtLzIthrweSgXmvBbz0xGE0ZJpYvrEtHn16wJmLeBED8lbRvB
 r+l8w7E7xuNv9BxiKzfGgbi7A9EUXKPsImMqaei4lWlIK4ufvjSkITrniepKDm+5Sn59
 wChw==
X-Gm-Message-State: AOAM531pu4t42dP7JlomhTaXxjMvzM1NBpVa2w0FO259QpC0idZKC1J9
 Eb2w6iKvb6ux5/pltYR3bZe59x35wHvytg==
X-Received: by 2002:a1c:f413:0:b0:37b:d1de:5762 with SMTP id
 z19-20020a1cf413000000b0037bd1de5762mr17267965wma.108.1649427374155; 
 Fri, 08 Apr 2022 07:16:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 22/41] hw/intc/arm_gicv3: Implement GICv4's new redistributor
 frame
Date: Fri,  8 Apr 2022 15:15:31 +0100
Message-Id: <20220408141550.1271295-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1JpnAUezGQ1a

The GICv4 extends the redistributor register map -- where GICv3
had two 64KB frames per CPU, GICv4 has four frames. Add support
for the extra frame by using a new gicv3_redist_size() function
in the places in the GIC implementation which currently use
a fixed constant size for the redistributor register block.
(Until we implement the extra registers they will RAZ/WI.)

Any board that wants to use a GICv4 will need to also adjust
to handle the different sized redistributor register block;
that will be done separately.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h           | 21 +++++++++++++++++++++
 include/hw/intc/arm_gicv3_common.h |  5 +++++
 hw/intc/arm_gicv3_common.c         |  2 +-
 hw/intc/arm_gicv3_redist.c         |  8 ++++----
 4 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 8d58d38836f..9720ccf7507 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -489,6 +489,27 @@ FIELD(VTE, RDBASE, 42, RDBASE_PROCNUM_LENGTH)
 
 /* Functions internal to the emulated GICv3 */
 
+/**
+ * gicv3_redist_size:
+ * @s: GICv3State
+ *
+ * Return the size of the redistributor register frame in bytes
+ * (which depends on what GIC version this is)
+ */
+static inline int gicv3_redist_size(GICv3State *s)
+{
+    /*
+     * Redistributor size is controlled by the redistributor GICR_TYPER.VLPIS.
+     * It's the same for every redistributor in the GIC, so arbitrarily
+     * use the register field in the first one.
+     */
+    if (s->cpu[0].gicr_typer & GICR_TYPER_VLPIS) {
+        return GICV4_REDIST_SIZE;
+    } else {
+        return GICV3_REDIST_SIZE;
+    }
+}
+
 /**
  * gicv3_intid_is_special:
  * @intid: interrupt ID
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 08b27789385..40bc404a652 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -38,7 +38,12 @@
 
 #define GICV3_LPI_INTID_START 8192
 
+/*
+ * The redistributor in GICv3 has two 64KB frames per CPU; in
+ * GICv4 it has four 64KB frames per CPU.
+ */
 #define GICV3_REDIST_SIZE 0x20000
+#define GICV4_REDIST_SIZE 0x40000
 
 /* Number of SGI target-list bits */
 #define GICV3_TARGETLIST_BITS 16
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index dcc5ce28c6a..18999e3c8bb 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -295,7 +295,7 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
 
         memory_region_init_io(&region->iomem, OBJECT(s),
                               ops ? &ops[1] : NULL, region, name,
-                              s->redist_region_count[i] * GICV3_REDIST_SIZE);
+                              s->redist_region_count[i] * gicv3_redist_size(s));
         sysbus_init_mmio(sbd, &region->iomem);
         g_free(name);
     }
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 7c75dd6f072..9f1fe09a78e 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -442,8 +442,8 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
      * in the memory map); if so then the GIC has multiple MemoryRegions
      * for the redistributors.
      */
-    cpuidx = region->cpuidx + offset / GICV3_REDIST_SIZE;
-    offset %= GICV3_REDIST_SIZE;
+    cpuidx = region->cpuidx + offset / gicv3_redist_size(s);
+    offset %= gicv3_redist_size(s);
 
     cs = &s->cpu[cpuidx];
 
@@ -501,8 +501,8 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
      * in the memory map); if so then the GIC has multiple MemoryRegions
      * for the redistributors.
      */
-    cpuidx = region->cpuidx + offset / GICV3_REDIST_SIZE;
-    offset %= GICV3_REDIST_SIZE;
+    cpuidx = region->cpuidx + offset / gicv3_redist_size(s);
+    offset %= gicv3_redist_size(s);
 
     cs = &s->cpu[cpuidx];
 
-- 
2.25.1

