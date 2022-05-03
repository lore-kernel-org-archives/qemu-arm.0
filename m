Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1244066lfj;
        Tue, 3 May 2022 00:49:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAYIxQo6mSwMc58wDSD487nQMn9l3YHPbgruCpJ+7Wfg6FPzYyMewqBtnJqO2pJ4t5Ce52
X-Received: by 2002:a05:622a:1313:b0:2f3:ac94:37d7 with SMTP id v19-20020a05622a131300b002f3ac9437d7mr3769436qtk.318.1651564159154;
        Tue, 03 May 2022 00:49:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651564159; cv=none;
        d=google.com; s=arc-20160816;
        b=eaqGOT2aP8n+8IgZonPs7FR7qPrsOSeVZyylmE4fo64XLvPt5YI/LDTWVMRjHqf/z6
         rs/pAbOjazTEdttA00vvvgAGThB8CpasO5eN7n19eHEZkoUxId9HcZ83s75lA+YEkfUC
         8pQMcS2+eS4WsMfnZaGV+0TpMnsNaLFniWW4LNFhhP2INwECmTu3A7xLG6UBk7JKh52R
         prhV4NhbFygx0hyKvIS1Qur+BuSnJ5r+lD8fFvy/MaxJj0frJCoVI6+k+39Ukp6r3uYd
         Gt2zrNa2UYx3JnOv+sED5q0iW3IIjMK14Kcsb60pZuKTplk1Y/C1Uk6F6RVfELfdRPkL
         idyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=ZodcGfbZ+66rQglWBdx3cOU4eQICQxHtla4jdEcufkM=;
        b=cMUr9IvaKOCW3aM2FUE3KafEtnDDORZqURM7cOBOjjrYn/1Hbr6KGnRTCjC5xpVZC+
         tni/lUKigXxY+fsQv7H8S0jc7Z1qW8ZGXD7C5tjv7n6L1R1dTVXyOi7/ILN5LIZZB1VI
         fQuSMhNhOJRsxNdTVneGyOQbI77+IRR1fVkJ7fR+Q/Wi6hXwzlZk9QuFXjvLDVSC+SCX
         tNcQn89oNWltdz6KS3vtGp/Tg+YbMtpnHvCWIBb95/CGEBLbcR4G9qT/JKUPUptnGG7U
         0C8kOo5LLfB6Sl8cQ2YS+Ob9flBZ2oAQTlRE9DFCi/PfqHHsfTmDREU6+FoM+oV8tXlA
         wkNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5-20020a0cc445000000b00454647c3323si6609468qvi.476.2022.05.03.00.49.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 00:49:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlnHa-0002Ng-GS
	for alex.bennee@linaro.org; Tue, 03 May 2022 03:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmVK-0003NN-Lv; Tue, 03 May 2022 02:59:29 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:46011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmVF-0007V3-Tx; Tue, 03 May 2022 02:59:26 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KsrRW3vSLz4ySb;
 Tue,  3 May 2022 16:59:19 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsrRT1rRZz4yST;
 Tue,  3 May 2022 16:59:17 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 10/19] aspeed/scu: Add AST1030 support
Date: Tue,  3 May 2022 08:58:39 +0200
Message-Id: <20220503065848.125215-11-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503065848.125215-1-clg@kaod.org>
References: <20220503065848.125215-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=XF6a=VL=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +4y7nKkrdHb+

From: Steven Lee <steven_lee@aspeedtech.com>

Per ast1030_v07.pdf, AST1030 SOC doesn't have SCU300, the pclk divider
selection is defined in SCU310[11:8].
Add a get_apb_freq function and a class init handler for ast1030.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220401083850.15266-7-jamin_lin@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/misc/aspeed_scu.h | 25 ++++++++++++++
 hw/misc/aspeed_scu.c         | 63 ++++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index 6d3f86c1abab..5c7c04eedfa7 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -19,6 +19,7 @@ OBJECT_DECLARE_TYPE(AspeedSCUState, AspeedSCUClass, ASPEED_SCU)
 #define TYPE_ASPEED_2400_SCU TYPE_ASPEED_SCU "-ast2400"
 #define TYPE_ASPEED_2500_SCU TYPE_ASPEED_SCU "-ast2500"
 #define TYPE_ASPEED_2600_SCU TYPE_ASPEED_SCU "-ast2600"
+#define TYPE_ASPEED_1030_SCU TYPE_ASPEED_SCU "-ast1030"
 
 #define ASPEED_SCU_NR_REGS (0x1A8 >> 2)
 #define ASPEED_AST2600_SCU_NR_REGS (0xE20 >> 2)
@@ -45,6 +46,8 @@ struct AspeedSCUState {
 #define AST2600_A1_SILICON_REV   0x05010303U
 #define AST2600_A2_SILICON_REV   0x05020303U
 #define AST2600_A3_SILICON_REV   0x05030303U
+#define AST1030_A0_SILICON_REV   0x80000000U
+#define AST1030_A1_SILICON_REV   0x80010000U
 
 #define ASPEED_IS_AST2500(si_rev)     ((((si_rev) >> 24) & 0xff) == 0x04)
 
@@ -336,4 +339,26 @@ uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s);
 #define SCU_AST2600_H_PLL_BYPASS_EN                        (0x1 << 24)
 #define SCU_AST2600_H_PLL_OFF                              (0x1 << 23)
 
+/*
+ * SCU310   Clock Selection Register Set 4 (for Aspeed AST1030 SOC)
+ *
+ *  31     I3C Clock Source selection
+ *  30:28  I3C clock divider selection
+ *  26:24  MAC AHB clock divider selection
+ *  22:20  RGMII 125MHz clock divider ration
+ *  19:16  RGMII 50MHz clock divider ration
+ *  15     LHCLK clock generation/output enable control
+ *  14:12  LHCLK divider selection
+ *  11:8   APB Bus PCLK divider selection
+ *  7      Select PECI clock source
+ *  6      Select UART debug port clock source
+ *  5      Select UART6 clock source
+ *  4      Select UART5 clock source
+ *  3      Select UART4 clock source
+ *  2      Select UART3 clock source
+ *  1      Select UART2 clock source
+ *  0      Select UART1 clock source
+ */
+#define SCU_AST1030_CLK_GET_PCLK_DIV(x)                    (((x) >> 8) & 0xf)
+
 #endif /* ASPEED_SCU_H */
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 150567f98a74..19b03471fc4e 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -235,6 +235,15 @@ static uint32_t aspeed_2600_scu_get_apb_freq(AspeedSCUState *s)
         / asc->apb_divider;
 }
 
+static uint32_t aspeed_1030_scu_get_apb_freq(AspeedSCUState *s)
+{
+    AspeedSCUClass *asc = ASPEED_SCU_GET_CLASS(s);
+    uint32_t hpll = asc->calc_hpll(s, s->regs[AST2600_HPLL_PARAM]);
+
+    return hpll / (SCU_AST1030_CLK_GET_PCLK_DIV(s->regs[AST2600_CLK_SEL4]) + 1)
+        / asc->apb_divider;
+}
+
 static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned size)
 {
     AspeedSCUState *s = ASPEED_SCU(opaque);
@@ -482,6 +491,8 @@ static uint32_t aspeed_silicon_revs[] = {
     AST2600_A1_SILICON_REV,
     AST2600_A2_SILICON_REV,
     AST2600_A3_SILICON_REV,
+    AST1030_A0_SILICON_REV,
+    AST1030_A1_SILICON_REV,
 };
 
 bool is_supported_silicon_rev(uint32_t silicon_rev)
@@ -770,12 +781,64 @@ static const TypeInfo aspeed_2600_scu_info = {
     .class_init = aspeed_2600_scu_class_init,
 };
 
+static const uint32_t ast1030_a1_resets[ASPEED_AST2600_SCU_NR_REGS] = {
+    [AST2600_SYS_RST_CTRL]      = 0xFFC3FED8,
+    [AST2600_SYS_RST_CTRL2]     = 0x09FFFFFC,
+    [AST2600_CLK_STOP_CTRL]     = 0xFFFF7F8A,
+    [AST2600_CLK_STOP_CTRL2]    = 0xFFF0FFF0,
+    [AST2600_DEBUG_CTRL2]       = 0x00000000,
+    [AST2600_HPLL_PARAM]        = 0x10004077,
+    [AST2600_HPLL_EXT]          = 0x00000031,
+    [AST2600_CLK_SEL4]          = 0x43F90900,
+    [AST2600_CLK_SEL5]          = 0x40000000,
+    [AST2600_CHIP_ID0]          = 0xDEADBEEF,
+    [AST2600_CHIP_ID1]          = 0x0BADCAFE,
+};
+
+static void aspeed_ast1030_scu_reset(DeviceState *dev)
+{
+    AspeedSCUState *s = ASPEED_SCU(dev);
+    AspeedSCUClass *asc = ASPEED_SCU_GET_CLASS(dev);
+
+    memcpy(s->regs, asc->resets, asc->nr_regs * 4);
+
+    s->regs[AST2600_SILICON_REV] = AST1030_A1_SILICON_REV;
+    s->regs[AST2600_SILICON_REV2] = s->silicon_rev;
+    s->regs[AST2600_HW_STRAP1] = s->hw_strap1;
+    s->regs[AST2600_HW_STRAP2] = s->hw_strap2;
+    s->regs[PROT_KEY] = s->hw_prot_key;
+}
+
+static void aspeed_1030_scu_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSCUClass *asc = ASPEED_SCU_CLASS(klass);
+
+    dc->desc = "ASPEED 1030 System Control Unit";
+    dc->reset = aspeed_ast1030_scu_reset;
+    asc->resets = ast1030_a1_resets;
+    asc->calc_hpll = aspeed_2600_scu_calc_hpll;
+    asc->get_apb = aspeed_1030_scu_get_apb_freq;
+    asc->apb_divider = 2;
+    asc->nr_regs = ASPEED_AST2600_SCU_NR_REGS;
+    asc->clkin_25Mhz = true;
+    asc->ops = &aspeed_ast2600_scu_ops;
+}
+
+static const TypeInfo aspeed_1030_scu_info = {
+    .name = TYPE_ASPEED_1030_SCU,
+    .parent = TYPE_ASPEED_SCU,
+    .instance_size = sizeof(AspeedSCUState),
+    .class_init = aspeed_1030_scu_class_init,
+};
+
 static void aspeed_scu_register_types(void)
 {
     type_register_static(&aspeed_scu_info);
     type_register_static(&aspeed_2400_scu_info);
     type_register_static(&aspeed_2500_scu_info);
     type_register_static(&aspeed_2600_scu_info);
+    type_register_static(&aspeed_1030_scu_info);
 }
 
 type_init(aspeed_scu_register_types);
-- 
2.35.1

