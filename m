Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3139910ED65E
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:23:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65Bq-0006Va-W4; Fri, 27 Mar 2026 07:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bp-0006Tf-8v
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:21 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Bm-0007u0-TN
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:17:20 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-43b9f43a1feso353018f8f.1
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610237; x=1775215037; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bo1tMGJjf8413y4VWnCIE2KG4+bnE/ZHqBVrYM1R3f8=;
 b=MDXy222SaSW1Cb3UqWQ5rcghnYh5QMkTGQn79/3WxAtmUt01K6HILkXsY4ht6pw7GC
 f04m6ulQisNGczXB7/EulGqGCjUtuzu3YKJMmac/nYBfsNA6KfrH4o4KTnh2pG9Xpen2
 LwecPOVzQOFM16W9Vy6U1uMd0ILFAD/SngoKVPhsGNFViiORU8Ny+PGlQD5X1Ep/QwAf
 YQlX4Zt2L93emM6+MkxbdTZMAWhwDe4S8thFX9NnuIqLieeujkD8vGOIPTdD+atXo+5f
 Qmhs0hTMDOxwTnV4n9ETKyMF+7a/9I2L2iHU/qL/WzdrqNdsLOxrJgogCr5IQF3lOO6O
 s2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610237; x=1775215037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Bo1tMGJjf8413y4VWnCIE2KG4+bnE/ZHqBVrYM1R3f8=;
 b=PpsodEa59G/nlzDL8H99ESrGdTO28AHn8IQmLqZ76afguQS9OiZ4lTm3cu3VTvqDqq
 UhIdVlKx4airho7OPLWCuz4BuGTwhodOG6VuRsIozr63EetQkhpxdZeMgvXNguABsUeC
 vAdOGGmHenwkz5MruAAdTxaBUVYC/espwjgQfxvbUtgz2c21pxyzCDO1MdDi0cOiwqJV
 gKMYBz3B0NwCmIC2vdJ6ri8xOB4nraVcfCbwcnRGlS17Zv0QiZaMw2LkiHKFkswRxm5G
 aAMFLbSj3EpJnMAokZXn8WuxfuzlZCNfnkQ1I7xSlECtWZGYrmOM7MMgp3Cd50k+/R08
 fGKA==
X-Gm-Message-State: AOJu0Yx8cNhz5fem0Rs7E9xDoZLlowQFZ65D4Yk3We3Cazto8P0M8Inq
 J+bGIuYyHV5Cd35a00JQAmMKGDpzSXlVPAncdBaXNmQ5AcWclhzrqlehT5d0IJfdHBrZnlAnKne
 M5UYQ4oU=
X-Gm-Gg: ATEYQzzLfh63j05OQhpk0PH0IOeSf2o0E324XEhIeKjcY6DBwZRUcb86+fdtJ4DUukp
 TyXamwKrU6wwZYX8K2YPJ11/5FjsfEAKgOq8GN5AjaDJ3MFNqS1XZ+rA8iwZm7tTcEc0gQjg5CY
 E7cweG+yaoa28KUxZML9YsF1bY8V7Qa5fjRkkDipdFbgYI/8Vd0jecMhaUWdXGUegVSkoHeLq2T
 OV9KZ6ARjmlZCC5pdvXlGeWYnb05YdNAk+gJtuNI5J1b0YyLd1uOHm+4S03F85QV0oQ60T0w92q
 5mKSu+qMOJHXJVV6BgiP5pgcQKxR93WJfu5thY26bWRinOPQtq/+INFc5MZ/Y7V+5MeYbgKZeap
 7SlKyWQhUaK+uQKA1aY8kI/8thJ4alcZBsmYPj5bbGteDrU+4kbLV+c9b1Buhqd8uLCO42BB8SX
 nM9G4hZuF1PZtCYXzRiGmytUR8Ykj39XswdQJfbStieNVxKeKk37BkDquGiRJlAebir8a0m0Jg0
 EeGrtPWU2XzZgfwfxK3kDu/kTwrEs8=
X-Received: by 2002:a05:6000:2207:b0:439:b7c9:2ef1 with SMTP id
 ffacd0b85a97d-43b9e9ea728mr3197231f8f.20.1774610237142; 
 Fri, 27 Mar 2026 04:17:17 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 16/65] hw/intc/arm_gicv5: Implement IRS_IST_{BASER, STATUSR,
 CFGR}
Date: Fri, 27 Mar 2026 11:16:11 +0000
Message-ID: <20260327111700.795099-17-peter.maydell@linaro.org>
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

Implement the three registers that handle configuration of the
interrupt status table for physical LPIs:

 * IRS_IST_BASER holds the base address of the table, and
   has the VALID bit that tells the IRS to start using the config
 * IRS_IST_CFGR has all the other config data for the table
 * IRS_IST_STATUSR has the IDLE bit that tells software when
   updates to IRS_IST_BASER have taken effect

Implement these registers.  Note that neither BASER nor CFGR can be
written when VALID == 1, except to clear the VALID bit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/intc/arm_gicv5.c                | 74 ++++++++++++++++++++++++++++++
 hw/intc/arm_gicv5_common.c         |  4 ++
 include/hw/intc/arm_gicv5_common.h |  3 ++
 3 files changed, 81 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 250925f004..cbb35c0270 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -265,6 +265,24 @@ REG64(IRS_SWERR_SYNDROMER0, 0x3c8)
 REG64(IRS_SWERR_SYNDROMER1, 0x3d0)
     FIELD(IRS_SWERR_SYNDROMER2, ADDR, 3, 53)
 
+static void irs_ist_baser_write(GICv5 *s, GICv5Domain domain, uint64_t value)
+{
+    GICv5Common *cs = ARM_GICV5_COMMON(s);
+
+    if (FIELD_EX64(cs->irs_ist_baser[domain], IRS_IST_BASER, VALID)) {
+        /* If VALID is set, ADDR is RO and we can only update VALID */
+        bool valid = FIELD_EX64(value, IRS_IST_BASER, VALID);
+        if (valid) {
+            /* Ignore 1->1 transition */
+            return;
+        }
+        cs->irs_ist_baser[domain] = FIELD_DP64(cs->irs_ist_baser[domain],
+                                               IRS_IST_BASER, VALID, valid);
+        return;
+    }
+    cs->irs_ist_baser[domain] = value;
+}
+
 static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
                          uint64_t *data, MemTxAttrs attrs)
 {
@@ -325,6 +343,26 @@ static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
     case A_IRS_AIDR:
         *data = cs->irs_aidr;
         return true;
+
+    case A_IRS_IST_BASER:
+        *data = extract64(cs->irs_ist_baser[domain], 0, 32);
+        return true;
+
+    case A_IRS_IST_BASER + 4:
+        *data = extract64(cs->irs_ist_baser[domain], 32, 32);
+        return true;
+
+    case A_IRS_IST_STATUSR:
+        /*
+         * For QEMU writes to IRS_IST_BASER and IRS_MAP_L2_ISTR take effect
+         * instantaneously, and the guest can never see the IDLE bit as 0.
+         */
+        *data = R_IRS_IST_STATUSR_IDLE_MASK;
+        return true;
+
+    case A_IRS_IST_CFGR:
+        *data = cs->irs_ist_cfgr[domain];
+        return true;
     }
 
     return false;
@@ -333,18 +371,54 @@ static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
 static bool config_writel(GICv5 *s, GICv5Domain domain, hwaddr offset,
                           uint64_t data, MemTxAttrs attrs)
 {
+    GICv5Common *cs = ARM_GICV5_COMMON(s);
+
+    switch (offset) {
+    case A_IRS_IST_BASER:
+        irs_ist_baser_write(s, domain,
+                            deposit64(cs->irs_ist_baser[domain], 0, 32, data));
+        return true;
+    case A_IRS_IST_BASER + 4:
+        irs_ist_baser_write(s, domain,
+                            deposit64(cs->irs_ist_baser[domain], 32, 32, data));
+        return true;
+    case A_IRS_IST_CFGR:
+        if (FIELD_EX64(cs->irs_ist_baser[domain], IRS_IST_BASER, VALID)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "guest tried to write IRS_IST_CFGR for %s config frame "
+                          "while IST_BASER.VALID set\n", domain_name[domain]);
+        } else {
+            cs->irs_ist_cfgr[domain] = data;
+        }
+        return true;
+    }
+
     return false;
 }
 
 static bool config_readll(GICv5 *s, GICv5Domain domain, hwaddr offset,
                           uint64_t *data, MemTxAttrs attrs)
 {
+    GICv5Common *cs = ARM_GICV5_COMMON(s);
+
+    switch (offset) {
+    case A_IRS_IST_BASER:
+        *data = cs->irs_ist_baser[domain];
+        return true;
+    }
+
     return false;
 }
 
 static bool config_writell(GICv5 *s, GICv5Domain domain, hwaddr offset,
                            uint64_t data, MemTxAttrs attrs)
 {
+    switch (offset) {
+    case A_IRS_IST_BASER:
+        irs_ist_baser_write(s, domain, data);
+        return true;
+    }
+
     return false;
 }
 
diff --git a/hw/intc/arm_gicv5_common.c b/hw/intc/arm_gicv5_common.c
index 54d75db014..44909d1b05 100644
--- a/hw/intc/arm_gicv5_common.c
+++ b/hw/intc/arm_gicv5_common.c
@@ -62,6 +62,10 @@ void gicv5_common_init_irqs_and_mmio(GICv5Common *cs,
 
 static void gicv5_common_reset_hold(Object *obj, ResetType type)
 {
+    GICv5Common *cs = ARM_GICV5_COMMON(obj);
+
+    memset(cs->irs_ist_baser, 0, sizeof(cs->irs_ist_baser));
+    memset(cs->irs_ist_cfgr, 0, sizeof(cs->irs_ist_cfgr));
 }
 
 static void gicv5_common_init(Object *obj)
diff --git a/include/hw/intc/arm_gicv5_common.h b/include/hw/intc/arm_gicv5_common.h
index 88e1b4d73d..9bfafcebfc 100644
--- a/include/hw/intc/arm_gicv5_common.h
+++ b/include/hw/intc/arm_gicv5_common.h
@@ -62,6 +62,9 @@ struct GICv5Common {
 
     MemoryRegion iomem[NUM_GICV5_DOMAINS];
 
+    uint64_t irs_ist_baser[NUM_GICV5_DOMAINS];
+    uint32_t irs_ist_cfgr[NUM_GICV5_DOMAINS];
+
     /* Bits here are set for each physical interrupt domain implemented */
     uint8_t implemented_domains;
 
-- 
2.43.0


