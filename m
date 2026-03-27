Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A59110ED659
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:20:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65C2-0006mj-Qm; Fri, 27 Mar 2026 07:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bv-0006ci-Uc
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:27 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bt-0007xN-LU
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:27 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48374014a77so24067025e9.3
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610244; x=1775215044; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UVKXKj+EMraPZwBBktCBK5IhDrOS5hbt+kqBhK1xkvE=;
 b=gJfd9yUpkeBJ398W9L0HlHMk/EjEhxEu/7Kx76ZIKvlHTuZoJkZe2OmY3/tfGmfO+o
 CJm/JMTB/r7KxR7H8j2E5zxAeUgb2Eowvn7by90sVTdJSVOMcXbGT2IvxRCb0DY/pdGD
 rWthOXI4AP71qblYg2/0++SNv2z9zrK45+6h17Snqz00hEFBADDPMH9RcCxQgT5I6g8f
 jgSiIWuVefKeIN+02RGQbinnPXPxygn3/IKC6hRg4onyJzTQV6BoL/u7vEUeRSfB4LEj
 BA5JHP2wNf6wUrBiqi5kGvyUnOmFfNedGN3LeXOQEYZGc96Sp0Apj702ZRfefGXAbazj
 BhNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610244; x=1775215044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UVKXKj+EMraPZwBBktCBK5IhDrOS5hbt+kqBhK1xkvE=;
 b=UsynDqzhv8IcFnTR2mG6BFI3ey1DhmSqwLPZu3IEsalMfqkdxirYkGytD22eDp3/ZK
 XTPcFRknMI6ywjWVeh63yzD97/rPn+i4csTwYVtVu6mYdqzu0Kr2O+CauzyGnIBgjLJG
 JuuZwfc4NLx72Y+O+WUuamTCv2qkZT0hwDsD/VDW2ZXEDCvgjtxUtDF8Xtkldw8XJ0lW
 2DVkClrPbC09HfU5eFZyLrNh02rPG5+0tJwiYujv0Oc/ZBnNFFeUl+92BBQauLXL3VT3
 jk1es0lZrLFPxe3ux0mlTRy+8mOPvewND5hcLL99u7zy3HY9Y59r2KF82qR7YvTUp6Hg
 1EjQ==
X-Gm-Message-State: AOJu0YyfI69wxjEaRApVT1LbfOEuKDrfNBjmTJ2LWOAAoDZC3U8+EM9o
 vxTZSSH2HmBfLCK/InLc9t/fWb6gwX7+JHQul1f1710gjnGHlFpsW+3FKoMt5pDc4VXDuvbbInk
 nj17V4vQ=
X-Gm-Gg: ATEYQzxbnsRmSn6LwMOIwMHQ4E7vSzOmoMCD754l7FtnshyVjYFZGx6sCkpAby5r/NA
 YsTWL41TALTl97umkaZncKDbn80EF4+wgtdMwsSdaUB2dwa7a5Lg8V3H4/eLR4RJP2yGsvY0kue
 ghxwnzil1ApqJpa+R6NzKCD0Fqa1GTUR5Z9CwKfeoHOdjxOrxTFMSTmipRZUEksTmgjCHyYUSdB
 xdzr9g9DTRcAolo9h04O61hqm8Ih9osQUrMJU+6aHakIJFV+mlXeuFmypZg7SzuVng/dlXv+hkS
 ippRQcooFdtvvzepHlwn9Cd39MwPGLo65t7BJbvdWsij1bOrqFNpLHEJU3YcWVQWKf9beQQsc20
 SFTXiQSgh8BW0qF5ABSTvazOxQ22opMbPV/dsq5YMHxCt5PQP4yVD6e2lLEXlIziDgatkIoh9A/
 NSGAf4tqmRwkGJ07UTXRoQDp+Neg39cHBTn9bqozhob7pFbIJLNbWiWQGnqQqLzcdNr4D+a9PJN
 f9Q0Pmo2+HmH9Uxwx4TZSrTYhWmAqA=
X-Received: by 2002:a05:600c:8b2a:b0:485:2c61:9457 with SMTP id
 5b1f17b1804b1-48727d62cedmr34857025e9.10.1774610243959; 
 Fri, 27 Mar 2026 04:17:23 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 23/65] hw/intc/arm_gicv5: Create backing state for SPIs
Date: Fri, 27 Mar 2026 11:16:18 +0000
Message-ID: <20260327111700.795099-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
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

The GICv5 allows an IRS to implement SPIs, which are fixed-wire
interrupts connected directly to the IRS.  For QEMU we want to use
these for all our traditional fixed-wire interrupt devices.  (The
other option the architecture permits is an Interrupt Wire Bridge
(IWB), which converts from a fixed-wire interrupt to an interrupt
event that is then translated through an ITS to send an LPI to the
ITS -- this is much more complexity than we need or want.)

SPI configuration is set via the same CPUIF instructions as LPI
configuration.  Create an array of structs which track the SPI state
information listed in I_JVVTZ and I_BWPPP (ignoring for the moment
the VM assignment state, which we will add when we add virtualization
support).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/intc/arm_gicv5_common.c         | 30 ++++++++++++++++++++++++++++++
 include/hw/intc/arm_gicv5_common.h | 27 +++++++++++++++++++++++++++
 include/hw/intc/arm_gicv5_types.h  | 14 ++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/hw/intc/arm_gicv5_common.c b/hw/intc/arm_gicv5_common.c
index 44909d1b05..79876c4401 100644
--- a/hw/intc/arm_gicv5_common.c
+++ b/hw/intc/arm_gicv5_common.c
@@ -66,6 +66,34 @@ static void gicv5_common_reset_hold(Object *obj, ResetType type)
 
     memset(cs->irs_ist_baser, 0, sizeof(cs->irs_ist_baser));
     memset(cs->irs_ist_cfgr, 0, sizeof(cs->irs_ist_cfgr));
+
+    if (cs->spi) {
+        GICv5Domain mp_domain;
+
+        /*
+         * D_YGLYC, D_TVVRZ: SPIs reset to edge-triggered, inactive,
+         * idle, disabled, targeted routing mode, not assigned to a
+         * VM, and assigned to the most-privileged interrupt domain.
+         * Other state is UNKNOWN: we choose to zero it.
+         */
+        memset(cs->spi, 0, cs->spi_irs_range * sizeof(*cs->spi));
+
+        /*
+         * The most-privileged interrupt domain is effectively the
+         * first in the list (EL3, S, NS) that we implement.
+         */
+        if (gicv5_domain_implemented(cs, GICV5_ID_EL3)) {
+            mp_domain = GICV5_ID_EL3;
+        } else if (gicv5_domain_implemented(cs, GICV5_ID_S)) {
+            mp_domain = GICV5_ID_S;
+        } else {
+            mp_domain = GICV5_ID_NS;
+        }
+
+        for (int i = 0; i < cs->spi_irs_range; i++) {
+            cs->spi[i].domain = mp_domain;
+        }
+    }
 }
 
 static void gicv5_common_init(Object *obj)
@@ -144,6 +172,8 @@ static void gicv5_common_realize(DeviceState *dev, Error **errp)
 
     address_space_init(&cs->dma_as, cs->dma, "gicv5-sysmem");
 
+    cs->spi = g_new0(GICv5SPIState, cs->spi_irs_range);
+
     trace_gicv5_common_realize(cs->irsid, cs->num_cpus,
                                cs->spi_base, cs->spi_irs_range, cs->spi_range);
 }
diff --git a/include/hw/intc/arm_gicv5_common.h b/include/hw/intc/arm_gicv5_common.h
index 9bfafcebfc..d3f4999321 100644
--- a/include/hw/intc/arm_gicv5_common.h
+++ b/include/hw/intc/arm_gicv5_common.h
@@ -53,6 +53,25 @@
 
 OBJECT_DECLARE_TYPE(GICv5Common, GICv5CommonClass, ARM_GICV5_COMMON)
 
+/*
+ * This is where we store the state the IRS handles for an SPI.
+ * Generally this corresponds to the spec's list of state in I_JVVTZ
+ * and J_BWPPP. level is a QEMU implementation detail and is where we
+ * store the actual current state of the incoming qemu_irq line.
+ */
+typedef struct GICv5SPIState {
+    uint32_t iaffid;
+    uint8_t priority;
+    bool level;
+    bool pending;
+    bool active;
+    bool enabled;
+    GICv5HandlingMode hm;
+    GICv5RoutingMode irm;
+    GICv5TriggerMode tm;
+    GICv5Domain domain;
+} GICv5SPIState;
+
 /*
  * This class is for common state that will eventually be shared
  * between TCG and KVM implementations of the GICv5.
@@ -65,6 +84,14 @@ struct GICv5Common {
     uint64_t irs_ist_baser[NUM_GICV5_DOMAINS];
     uint32_t irs_ist_cfgr[NUM_GICV5_DOMAINS];
 
+    /*
+     * Pointer to an array of state information for the SPIs.  Array
+     * element 0 is SPI ID s->spi_base, and there are s->spi_irs_range
+     * elements in total. SPI state is not per-domain: SPI is
+     * configurable to a particular domain via IRS_SPI_DOMAINR.
+     */
+    GICv5SPIState *spi;
+
     /* Bits here are set for each physical interrupt domain implemented */
     uint8_t implemented_domains;
 
diff --git a/include/hw/intc/arm_gicv5_types.h b/include/hw/intc/arm_gicv5_types.h
index 20de5b3f46..f6f8709a6a 100644
--- a/include/hw/intc/arm_gicv5_types.h
+++ b/include/hw/intc/arm_gicv5_types.h
@@ -70,4 +70,18 @@ typedef enum GICv5RoutingMode {
     GICV5_1OFN = 1,
 } GICv5RoutingMode;
 
+/*
+ * Interrupt trigger mode (same encoding as IRS_SPI_CFGR.TM) Note that
+ * this is not the same thing as handling mode, even though the two
+ * possible states have the same names. Trigger mode applies only for
+ * SPIs and tells the IRS what kinds of changes to the input signal
+ * wire should make it generate SET and CLEAR events.  Handling mode
+ * affects whether the pending state of an interrupt is cleared when
+ * the interrupt is acknowledged, and applies to both SPIs and LPIs.
+ */
+typedef enum GICv5TriggerMode {
+    GICV5_TRIGGER_EDGE = 0,
+    GICV5_TRIGGER_LEVEL = 1,
+} GICv5TriggerMode;
+
 #endif
-- 
2.43.0


