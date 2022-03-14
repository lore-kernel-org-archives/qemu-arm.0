Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2169160lfo;
        Mon, 14 Mar 2022 07:14:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRxC1/avgd4YAdUIs9TStDII5DilmD7xWEW1WIV27vVJhU4vG3NpW3HrVgdv3b2wIvo9hI
X-Received: by 2002:a05:6902:51:b0:61e:1a26:3243 with SMTP id m17-20020a056902005100b0061e1a263243mr17688813ybh.57.1647267265032;
        Mon, 14 Mar 2022 07:14:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647267265; cv=none;
        d=google.com; s=arc-20160816;
        b=T6R0HKWNgLR9fzXDWtq4ulxNgFNuzrUulJdHCKLvQuHjS68MNpsvWw0d4vZSkfR/QL
         GIn2HsAoyCH/PLRoEr76F7LLbpDjGW8fzEeFMPZXDdJuY9MP2Veoh78BosiJjK6lNk58
         VgCXjZFKdVU/znMn98+dO/OdhDGs5bVi+AHgCrEoWOIxcM4cCxpyzi9L5XnvN5LsTyiw
         d9KUssSuN4thCiSi29RDoCN67GegwdldeGGFXV46F1ArzIAMFrXN6i/yPT57AxBqrQPz
         h3g24E1k3mNwzOBWCBL4nqWLBOpFbE6zZtoZZr1TkTO4b/wVbxuI4JcijNOpnZZ3Tq/t
         Komw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=4WrrmMUq8xmo2rxzHHzESYuB1YlDG0ekjf/PWSPZDSw=;
        b=Vcd0KsHudriwS/ikmuOCmgQy1l5rIbfHal24XGGdtqdSXHZZzT5JAJ8MR7ckiXyShN
         OioSGmdISC4BqT/QXDrIuFm/tGHuKaztyfODPOdIL5WGfJcg6u1rUaTc8BvJGCgN59LJ
         gEkXZzzfXshxlvb4xbx7d1cu5LYJYbfiCSV5+zj++vOvV2MHuR6dQMJbIAeQDQxiX/ny
         naKBPSq6B2tQqVZZd174iuTmdMTs8URcq01ynfavBW26Gm33PZtfgcUweUwwjFSpoaMR
         uMFoU6aBA2vlu1fKHzM6Mfg1xMLaeT0QOx9vuMp61RNfnAXmZZ5eKlqbHd5CeLJtfYL6
         kv6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v65-20020a254844000000b0061da917cd23si8201148yba.35.2022.03.14.07.14.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Mar 2022 07:14:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nTlSq-0004QA-Cr
	for alex.bennee@linaro.org; Mon, 14 Mar 2022 10:14:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nThQY-0002Cz-5Q; Mon, 14 Mar 2022 05:55:46 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:48745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nThQU-0003d4-Uu; Mon, 14 Mar 2022 05:55:45 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22E9iodD039520;
 Mon, 14 Mar 2022 17:44:50 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.100) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 14 Mar
 2022 17:54:52 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v1 1/1] hw: aspeed_scu: Add AST2600 hpll calculation function
Date: Mon, 14 Mar 2022 17:54:49 +0800
Message-ID: <20220314095449.22089-2-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220314095449.22089-1-steven_lee@aspeedtech.com>
References: <20220314095449.22089-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.100]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22E9iodD039520
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=steven_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 14 Mar 2022 10:11:08 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BKN7ETMZICnz

AST2600's HPLL register offset and bit definition are different from
AST2500. Add a hpll calculation function for ast2600 and modify apb frequency
calculation function based on SCU200 register description in ast2600v11.pdf.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 hw/misc/aspeed_scu.c         | 43 ++++++++++++++++++++++++++++++++----
 include/hw/misc/aspeed_scu.h | 17 ++++++++++++++
 2 files changed, 56 insertions(+), 4 deletions(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index d06e179a6e..3b11e98d66 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -205,6 +205,8 @@ static const uint32_t ast2500_a1_resets[ASPEED_SCU_NR_REGS] = {
      [BMC_DEV_ID]      = 0x00002402U
 };
 
+static uint32_t aspeed_2600_scu_calc_hpll(AspeedSCUState *s, uint32_t hpll_reg);
+
 static uint32_t aspeed_scu_get_random(void)
 {
     uint32_t num;
@@ -215,9 +217,19 @@ static uint32_t aspeed_scu_get_random(void)
 uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s)
 {
     AspeedSCUClass *asc = ASPEED_SCU_GET_CLASS(s);
-    uint32_t hpll = asc->calc_hpll(s, s->regs[HPLL_PARAM]);
+    uint32_t hpll, hpll_reg, clk_sel_reg;
+
+    if (asc->calc_hpll == aspeed_2600_scu_calc_hpll) {
+        hpll_reg = s->regs[AST2600_HPLL_PARAM];
+        clk_sel_reg = s->regs[AST2600_CLK_SEL];
+    } else {
+        hpll_reg = s->regs[HPLL_PARAM];
+        clk_sel_reg = s->regs[CLK_SEL];
+    }
+
+    hpll = asc->calc_hpll(s, hpll_reg);
 
-    return hpll / (SCU_CLK_GET_PCLK_DIV(s->regs[CLK_SEL]) + 1)
+    return hpll / (SCU_CLK_GET_PCLK_DIV(clk_sel_reg) + 1)
         / asc->apb_divider;
 }
 
@@ -357,7 +369,10 @@ static const MemoryRegionOps aspeed_ast2500_scu_ops = {
 
 static uint32_t aspeed_scu_get_clkin(AspeedSCUState *s)
 {
-    if (s->hw_strap1 & SCU_HW_STRAP_CLK_25M_IN) {
+    AspeedSCUClass *asc = ASPEED_SCU_GET_CLASS(s);
+
+    if (s->hw_strap1 & SCU_HW_STRAP_CLK_25M_IN ||
+        asc->calc_hpll == aspeed_2600_scu_calc_hpll) {
         return 25000000;
     } else if (s->hw_strap1 & SCU_HW_STRAP_CLK_48M_IN) {
         return 48000000;
@@ -426,6 +441,26 @@ static uint32_t aspeed_2500_scu_calc_hpll(AspeedSCUState *s, uint32_t hpll_reg)
     return clkin * multiplier;
 }
 
+static uint32_t aspeed_2600_scu_calc_hpll(AspeedSCUState *s, uint32_t hpll_reg)
+{
+    uint32_t multiplier = 1;
+    uint32_t clkin = aspeed_scu_get_clkin(s);
+
+    if (hpll_reg & SCU_AST2600_H_PLL_OFF) {
+        return 0;
+    }
+
+    if (!(hpll_reg & SCU_H_PLL_BYPASS_EN)) {
+        uint32_t p = (hpll_reg >> 19) & 0xf;
+        uint32_t n = (hpll_reg >> 13) & 0x3f;
+        uint32_t m = hpll_reg & 0x1fff;
+
+        multiplier = ((m + 1) / (n + 1)) / (p + 1);
+    }
+
+    return clkin * multiplier;
+}
+
 static void aspeed_scu_reset(DeviceState *dev)
 {
     AspeedSCUState *s = ASPEED_SCU(dev);
@@ -716,7 +751,7 @@ static void aspeed_2600_scu_class_init(ObjectClass *klass, void *data)
     dc->desc = "ASPEED 2600 System Control Unit";
     dc->reset = aspeed_ast2600_scu_reset;
     asc->resets = ast2600_a3_resets;
-    asc->calc_hpll = aspeed_2500_scu_calc_hpll; /* No change since AST2500 */
+    asc->calc_hpll = aspeed_2600_scu_calc_hpll;
     asc->apb_divider = 4;
     asc->nr_regs = ASPEED_AST2600_SCU_NR_REGS;
     asc->ops = &aspeed_ast2600_scu_ops;
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index c14aff2bcb..91c500c5bc 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -316,4 +316,21 @@ uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s);
         SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       \
         SCU_AST2500_HW_STRAP_RESERVED1)
 
+/* SCU200   H-PLL Parameter Register (for Aspeed AST2600 SOC)
+ *
+ *  28:26  H-PLL Parameters
+ *  25     Enable H-PLL reset
+ *  24     Enable H-PLL bypass mode
+ *  23     Turn off H-PLL
+ *  22:19  H-PLL Post Divider (P)
+ *  18:13   H-PLL Numerator (M)
+ *  12:0    H-PLL Denumerator (N)
+ *
+ *  (Output frequency) = CLKIN(25MHz) * [(M+1) / (N+1)] / (P+1)
+ *
+ * The default frequency is 1200Mhz when CLKIN = 25MHz
+ */
+#define SCU_AST2600_H_PLL_BYPASS_EN                        (0x1 << 24)
+#define SCU_AST2600_H_PLL_OFF                              (0x1 << 23)
+
 #endif /* ASPEED_SCU_H */
-- 
2.17.1

