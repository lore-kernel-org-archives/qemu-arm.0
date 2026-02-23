Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E326EC110C
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:05:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZKG-0001N6-Vl; Mon, 23 Feb 2026 12:02:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKF-0001LT-Hx
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:27 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKD-00005n-LE
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:27 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4836f4cbe0bso34582315e9.3
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866144; x=1772470944; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3CiLooo2/Er7yqErGfmdNwNkycKNCQ+U0Fgk+KNKPMo=;
 b=Gk8EFRWF4KqC+rxYuYYbKh9Us7KizUiTT31OIThBrFDBcNtVrMfjZh6hHkf2/C/NBy
 VF21+Fkylo8NcRn2hSx2QG9Q0Vooods5pJwHLz31OpfHhQvWXrIP0sR09S8Jp3LP8gZF
 WbHxyBbDqIkvu15Sl5PMtj4xBI7gLSEEzzWmP0iIAGaso8jrdfGYDFHxdFu8IweRmMNP
 DsIS/P+YncxLdok85L/2UdNVMwxWqF8q2Mh9f6eHRgwETK+MIV6RlrRMDhPVOBkPB3G8
 /VURs+MUC4we6ecd5Zg9Ph1D+6QCVtc5C4TUpuxYjMpLHuZ7Kix4EAXwfHNAhh6wsyWG
 WGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866144; x=1772470944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3CiLooo2/Er7yqErGfmdNwNkycKNCQ+U0Fgk+KNKPMo=;
 b=E28EagK9NCeETMO3OdZW1xKOvV9JC+xFfCJ2AS+eyPKYfxlRyPgOKtg5hwN5eGPKtH
 C2YeBYS2jcXESLDjSOu3tKHu6MEVgks3VyuhOdEashYU4AgcTZ28xDEVqOAaWmChYbVy
 zCWx30h6SWAhsOrDC2eyCqu7MYlrY2Zgv86KwoOVIIxCfVrd5b2ulHSRgbei01ZCYfKr
 J0BcUNhPP/QaO8BoDhezLguQm7Lze4MOVpxUZrCCLbcuythjMcTBB7gMsMn/cKxImvJ/
 ZFlS95u2HM4OZ421DyRxbfrM/doXAKywMEi523BAxvCJnUAidZaTIwnjfpnKxpWBle40
 JbVg==
X-Gm-Message-State: AOJu0YxSlIBd15e7Q1I4ZrNGf5Lvz56qS6qyJURSaIJX5pJuBvZ76qIT
 r56Y+M7/+Bg/ExOCYFV7yLmw61mivVLhot8WpmrVAgBWzMdVEboEPIGAx+nVT7sdCDrM7X1vmQe
 5UKOK
X-Gm-Gg: AZuq6aLXW06Y6KtUkFhgAQAs06b3dB8icpsjLNzOvM8xFoubfis9ZvVjSC/Bu2z8PP9
 6szvoPCWB0QE9bV5uT4chQ61+Flbn9C+kJMKFq+ULFdEKVuzjeC8F6Y2vs15cBFkecEoOckigzH
 U+Ijnskrr3k+rwyNTD04LibKxswhxWqLwZu0tE98rYenXp0xIGqoP4f5tduws2QUe7vVzfRa9sa
 51U7Rl71C7js9hdjdh5KAEogsyGoVB5xhaggYkJr+jhybVLnlsqxVW5uJs1uc59/Cecy5/8g+g9
 usHBNNbp1tWRDxrSDB546qsLpbylfldGZIjiA61BRzQs6LKTvYKSPGf7uBdqTGlIDTA4fQjQjtM
 BCio4JRXsxszcZ+jVNg5BnnuhV3xuusVoiDhMpOSAQ70vS2BXRfI6mGpKxp36YBg9/grw0rOY0j
 YAxJOOBcAC3G4IJ7HiparDN4ZXf0jw+zeBusoL+qkENXbpb8ghPrEUxXGR9C5L6AvIvDkDUnNqO
 mt3zvelKFq/r/RBjzTpDdIWabHm+GE=
X-Received: by 2002:a05:600c:4589:b0:480:1e9e:f9b with SMTP id
 5b1f17b1804b1-483a95dea3emr195439745e9.16.1771866144121; 
 Mon, 23 Feb 2026 09:02:24 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:02:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/65] hw/intc/arm_gicv5: Implement IRS ID regs
Date: Mon, 23 Feb 2026 17:01:16 +0000
Message-ID: <20260223170212.441276-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

Implement the IRS frame ID registers IRS_IDR[0-7], IRS_IIDR and
IRS_AIDR.  These are all 32-bit registers.

We make these fields in the GIC state struct rather than just
hardcoding them in the register read function so that we can later
code "do this only if X is implemented" as a test on the ID register
value.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c                | 112 +++++++++++++++++++++++++++++
 include/hw/intc/arm_gicv5_common.h |  39 ++++++++++
 2 files changed, 151 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index db754e7681..f34bb81966 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -268,6 +268,62 @@ REG64(IRS_SWERR_SYNDROMER1, 0x3d0)
 static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
                          uint64_t *data, MemTxAttrs attrs)
 {
+    GICv5Common *cs = ARM_GICV5_COMMON(s);
+    uint32_t v = 0;
+
+    switch (offset) {
+    case A_IRS_IDR0:
+        v = cs->irs_idr0;
+        /* INT_DOM reports the domain this register is for */
+        v = FIELD_DP32(v, IRS_IDR0, INT_DOM, domain);
+        if (domain != GICV5_ID_REALM) {
+            /* MEC field RES0 except for the Realm domain */
+            v &= ~R_IRS_IDR0_MEC_MASK;
+        }
+        if (domain == GICV5_ID_EL3) {
+            /* VIRT is RES0 for EL3 domain */
+            v &= ~R_IRS_IDR0_VIRT_MASK;
+        }
+        return true;
+
+    case A_IRS_IDR1:
+        *data = cs->irs_idr1;
+        return true;
+
+    case A_IRS_IDR2:
+        *data = cs->irs_idr2;
+        return true;
+
+    case A_IRS_IDR3:
+        /* In EL3 IDR0.VIRT is 0 so this is RES0 */
+        *data = domain == GICV5_ID_EL3 ? 0 : cs->irs_idr3;
+        return true;
+
+    case A_IRS_IDR4:
+        /* In EL3 IDR0.VIRT is 0 so this is RES0 */
+        *data = domain == GICV5_ID_EL3 ? 0 : cs->irs_idr4;
+        return true;
+
+    case A_IRS_IDR5:
+        *data = cs->irs_idr5;
+        return true;
+
+    case A_IRS_IDR6:
+        *data = cs->irs_idr6;
+        return true;
+
+    case A_IRS_IDR7:
+        *data = cs->irs_idr7;
+        return true;
+
+    case A_IRS_IIDR:
+        *data = cs->irs_iidr;
+        return true;
+
+    case A_IRS_AIDR:
+        *data = cs->irs_aidr;
+        return true;
+    }
     return false;
 }
 
@@ -443,6 +499,60 @@ static void gicv5_reset_hold(Object *obj, ResetType type)
     }
 }
 
+static void gicv5_set_idregs(GICv5Common *cs)
+{
+    /* Set the ID register value fields */
+    uint32_t v;
+
+    /*
+     * We don't support any of the optional parts of the spec currently,
+     * so most of the fields in IRS_IDR0 are zero.
+     */
+    v = 0;
+    /*
+     * We can handle physical addresses of any size, so report
+     * support for 56 bits of physical address space.
+     */
+    v = FIELD_DP32(v, IRS_IDR0, PA_RANGE, 7);
+    v = FIELD_DP32(v, IRS_IDR0, IRSID, cs->irsid);
+    cs->irs_idr0 = v;
+
+    v = 0;
+    v = FIELD_DP32(v, IRS_IDR1, PE_CNT, cs->num_cpus);
+    v = FIELD_DP32(v, IRS_IDR1, IAFFID_BITS, QEMU_GICV5_IAFFID_BITS - 1);
+    v = FIELD_DP32(v, IRS_IDR1, PRI_BITS, QEMU_GICV5_PRI_BITS - 1);
+    cs->irs_idr1 = v;
+
+    v = 0;
+    /* We always support physical LPIs with 2-level ISTs of all sizes */
+    v = FIELD_DP32(v, IRS_IDR2, ID_BITS, QEMU_GICV5_ID_BITS);
+    v = FIELD_DP32(v, IRS_IDR2, LPI, 1);
+    v = FIELD_DP32(v, IRS_IDR2, MIN_LPI_ID_BITS, QEMU_GICV5_MIN_LPI_ID_BITS);
+    v = FIELD_DP32(v, IRS_IDR2, IST_LEVELS, 1);
+    v = FIELD_DP32(v, IRS_IDR2, IST_L2SZ, 7);
+    /* Our impl does not need IST metadata, so ISTMD and ISTMD_SZ are 0 */
+    cs->irs_idr2 = v;
+
+    /* We don't implement virtualization yet, so these are zero */
+    cs->irs_idr3 = 0;
+    cs->irs_idr4 = 0;
+
+    /* These three have just one field each */
+    cs->irs_idr5 = FIELD_DP32(0, IRS_IDR5, SPI_RANGE, cs->spi_range);
+    cs->irs_idr6 = FIELD_DP32(0, IRS_IDR6, SPI_IRS_RANGE, cs->spi_irs_range);
+    cs->irs_idr7 = FIELD_DP32(0, IRS_IDR7, SPI_BASE, cs->spi_base);
+
+    v = 0;
+    v = FIELD_DP32(v, IRS_IIDR, IMPLEMENTER, QEMU_GICV5_IMPLEMENTER);
+    v = FIELD_DP32(v, IRS_IIDR, REVISION, QEMU_GICV5_REVISION);
+    v = FIELD_DP32(v, IRS_IIDR, VARIANT, QEMU_GICV5_VARIANT);
+    v = FIELD_DP32(v, IRS_IIDR, PRODUCTID, QEMU_GICV5_PRODUCTID);
+    cs->irs_iidr = v;
+
+    /* This is a GICv5.0 IRS, so all fields are zero */
+    cs->irs_aidr = 0;
+}
+
 static void gicv5_realize(DeviceState *dev, Error **errp)
 {
     GICv5Common *cs = ARM_GICV5_COMMON(dev);
@@ -469,6 +579,8 @@ static void gicv5_realize(DeviceState *dev, Error **errp)
      * NS domain.
      */
     cs->implemented_domains = (1 << GICV5_ID_NS);
+
+    gicv5_set_idregs(cs);
     gicv5_common_init_irqs_and_mmio(cs, gicv5_set_spi, config_frame_ops);
 }
 
diff --git a/include/hw/intc/arm_gicv5_common.h b/include/hw/intc/arm_gicv5_common.h
index be898abcd5..bcf7cd4239 100644
--- a/include/hw/intc/arm_gicv5_common.h
+++ b/include/hw/intc/arm_gicv5_common.h
@@ -65,6 +65,18 @@ struct GICv5Common {
     /* Bits here are set for each physical interrupt domain implemented */
     uint8_t implemented_domains;
 
+    /* ID register values: set at realize, constant thereafter */
+    uint32_t irs_idr0;
+    uint32_t irs_idr1;
+    uint32_t irs_idr2;
+    uint32_t irs_idr3;
+    uint32_t irs_idr4;
+    uint32_t irs_idr5;
+    uint32_t irs_idr6;
+    uint32_t irs_idr7;
+    uint32_t irs_iidr;
+    uint32_t irs_aidr;
+
     /* Properties */
     uint32_t num_cpus;
     ARMCPU **cpus;
@@ -84,6 +96,33 @@ struct GICv5CommonClass {
 
 #define IRS_CONFIG_FRAME_SIZE 0x10000
 
+/*
+ * The architecture allows a GICv5 to implement less than the
+ * full width for various ID fields. QEMU's implementation
+ * always supports the full width of these fields. These constants
+ * define our implementation's limits.
+ */
+
+/* Number of INTID.ID bits we support */
+#define QEMU_GICV5_ID_BITS 24
+/* Min LPI_ID_BITS supported */
+#define QEMU_GICV5_MIN_LPI_ID_BITS 14
+/* IAFFID bits supported */
+#define QEMU_GICV5_IAFFID_BITS 16
+/* Number of priority bits supported in the IRS */
+#define QEMU_GICV5_PRI_BITS 5
+
+/*
+ * There are no TRMs currently published for hardware
+ * implementations of GICv5 that we might identify ourselves
+ * as. Instead, we borrow the Arm Implementer code and
+ * pick an arbitrary product ID (ASCII "Q")
+ */
+#define QEMU_GICV5_IMPLEMENTER 0x43b
+#define QEMU_GICV5_PRODUCTID 0x51
+#define QEMU_GICV5_REVISION 0
+#define QEMU_GICV5_VARIANT 0
+
 /**
  * gicv5_common_init_irqs_and_mmio: Create IRQs and MMIO regions for the GICv5
  * @s: GIC object
-- 
2.43.0


