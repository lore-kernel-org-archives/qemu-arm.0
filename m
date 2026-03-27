Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB99910ED659
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:27:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65Bt-0006Z6-WD; Fri, 27 Mar 2026 07:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bj-0006Pk-UV
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:16 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bh-0007oP-Fe
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:15 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-439d8df7620so1408912f8f.0
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610232; x=1775215032; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bXiijkgjBmWXs5fWCEwDdMcGLXqq1ZdmOeeZ74VWNOI=;
 b=wZI2/gjVtjPPmzMbGx5pppjSbNh4ocqvcbeGD1s6tfnSZ2ZPURakiSORoErorDZCZJ
 4yVwANy7hJ/wWblRKyy/XHmm0YEIGUfzTvlDfD89fsDPWIDkhlXVn4L8jSXqusZr3MQG
 44xv8GQBS2mvysVtuNUI14lfSPdoYGm8EwL0bczjiaBGKCmd4KAw/kmKBmz4jBNZ6uFS
 5Z1YhUfxR/4OCun1rWfNOQZqaN9+n5CJ3I75HjdxrPqxH34TkFpKqFpvjSR8hlcKKsxv
 hLPkxvcGUZANhmVvVVz0isT4jDOfdsx1xUyUqOXbfE70whw8IUilWSvJhfRX+3kNF/cY
 euJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610232; x=1775215032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bXiijkgjBmWXs5fWCEwDdMcGLXqq1ZdmOeeZ74VWNOI=;
 b=sNerC0wQAQ1RwgVOnxHK7vMfgKHu1Lr21J8+EpPVcZW9XcKsnocw1ms7E4B+7Vwh2K
 wqszpg2iq7t9kKz5c3Ge2wYHNe7VP//gbRkuElYDepPq1+MCZ8MQRXzLIlmBWK7IpQtO
 cRCRTOVzp6x0VrR8MPuqIWWfVVbshH3WE2lsfsjLmbdH/0szJkU9RFsJrxyFGpNRDFqL
 /wyL1X47w04sHgns5Uot43gCad3h5jBQwZ1DevBRZJtLT7dvyGuDVXDGDw42Gn19icQT
 j1WvJHYZT4Te7kX+KOItgHtppqDdfV9yxSSxJPRvVpoBqO53iQpx6sa8ra4kGwcEcdfs
 7afw==
X-Gm-Message-State: AOJu0YzgZy0mIz7iNDBCravW7MQjuiDRu9UGVixXeTQaiWzdwgPu58vd
 0Tr5ChCO9f3mZ749Tkbdq6oJ1hN/o/3dpjyP9VXo5xIWMLpdEhfv72cOdRkREuVgcyu1ciPqliO
 9vos0q90=
X-Gm-Gg: ATEYQzyRpPDAuPAPnUqhcI4uj+i22iE4e1kCWkg1HRbbCmzExzYySO8T/0vyZYNxo1D
 rdIKNqFxwAd40VWEbemI5yeKximcbuW/HwdmA2v0r/1PYVu6unR1GKV2LG0zEl6pHtojKMwX6PM
 ODBNLpGxCSa/Aax4wX2ETr8klPc+ONBbZCzRSj6FcP+X6+FEWo3FzppqHDIYj5O5xbzjSuF3va9
 fOwFvLhBkFeBkNF+fJVwML7+tQfsNqHV/RgGBKrpMDJm6rVaOXtT5vMzqdGwFYgTmGTAzjLJubq
 QMYoWLta6tVHJdkvfdgauS8k54pKBrmk62jdXClpDWKzHIZecPTDT7uXdRqUo7O+G4pf5NoputO
 y+sPJVNnrBSvAwdgE8eM9HgiOK1aOelnQeTOS9R3oX6LLvijri2S3zmQFCMzuQY9IHesSs7vbm6
 7ZGTRHSNSvBmsHjo2O4tOv2wyHjAMJzdLadZqInXYz+nChhhNT6vG50I/k/V1OxYhXfBqOqhU0i
 8Qt8PJ9XlE0lFnOMaNtiKUF6ckIYb0=
X-Received: by 2002:a05:6000:2313:b0:43b:905d:f89f with SMTP id
 ffacd0b85a97d-43b9ea66dccmr3277541f8f.39.1774610231739; 
 Fri, 27 Mar 2026 04:17:11 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 10/65] hw/intc/arm_gicv5: Implement IRS ID regs
Date: Fri, 27 Mar 2026 11:16:05 +0000
Message-ID: <20260327111700.795099-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
 hw/intc/arm_gicv5.c                | 115 +++++++++++++++++++++++++++++
 include/hw/intc/arm_gicv5_common.h |  38 ++++++++++
 2 files changed, 153 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 4c1ec8f30a..250925f004 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -268,6 +268,65 @@ REG64(IRS_SWERR_SYNDROMER1, 0x3d0)
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
+            /* ...which means VIRT_ONE_N is also RES0 */
+            v &= ~R_IRS_IDR0_VIRT_ONE_N_MASK;
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
+
     return false;
 }
 
@@ -422,6 +481,60 @@ static void gicv5_reset_hold(Object *obj, ResetType type)
     }
 }
 
+static void gicv5_set_idregs(GICv5Common *cs)
+{
+    /* Set the ID register value fields */
+    uint32_t v;
+
+    /*
+     * Fields in IDR0 for optional parts of the spec that we don't
+     * implement are 0.
+     */
+    v = 0;
+    /*
+     * We can handle physical addresses of any size, so report support
+     * for 56 bits of physical address space.
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
@@ -448,6 +561,8 @@ static void gicv5_realize(DeviceState *dev, Error **errp)
      * NS domain.
      */
     cs->implemented_domains = (1 << GICV5_ID_NS);
+
+    gicv5_set_idregs(cs);
     gicv5_common_init_irqs_and_mmio(cs, gicv5_set_spi, config_frame_ops);
 }
 
diff --git a/include/hw/intc/arm_gicv5_common.h b/include/hw/intc/arm_gicv5_common.h
index 10276d652f..906870e49f 100644
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
@@ -84,6 +96,32 @@ struct GICv5CommonClass {
 
 #define IRS_CONFIG_FRAME_SIZE 0x10000
 
+/*
+ * The architecture allows a GICv5 to implement less than the full
+ * width for various ID fields. QEMU's implementation always supports
+ * the full width of these fields. These constants define our
+ * implementation's limits.
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
+ * There are no TRMs currently published for hardware implementations
+ * of GICv5 that we might identify ourselves as. Instead, we borrow
+ * the Arm Implementer code and pick an arbitrary product ID (ASCII "Q")
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


