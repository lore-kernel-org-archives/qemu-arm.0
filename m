Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2691707lfo;
        Tue, 15 Mar 2022 00:59:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYWjJ0vnfFyWkhdaHotdZIVfdkBBmXIiuch3iCDY++oJ9pJMW7rYsI68oI1GYOjHtOrFi2
X-Received: by 2002:a05:622a:1b8b:b0:2dc:4f1:faf7 with SMTP id bp11-20020a05622a1b8b00b002dc04f1faf7mr21651755qtb.325.1647331158001;
        Tue, 15 Mar 2022 00:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647331157; cv=none;
        d=google.com; s=arc-20160816;
        b=fWhnAcy8FAGsT7OGIAtvr1s1vHI4aZZtgq+f6hC91FOeLAfWU3Laz1hICz89qTJE53
         piBA+NaMmVJnncFnoyBtjJRRB4/VAjvvgNat8eCVvKmHsUhdnMKrI8Jz1mlCCsFaS/oC
         PwqT0Xo2gPyUMAwJuK36RDIKp7S6f7V/ez2UcqDbR64MGOEXqBKg7wddIoZU57/INiMv
         4H1U3plzST2yd+JOYUXJP0pH4hqCEg54u5dcR2GNjzWIbukNhmVs09Wy5RsNt1RskSmQ
         6VlPwFV1yZtmCH4AfnA+1Pcapw7bmqEAKs60Gy6S2kTnO3EzGBpwv003YRckJC7PyCdX
         zhEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=QTw+Hb7ZyMwP1/ek8HiZnFAh2yeTtJTkdTiWns7ctTc=;
        b=k+zllmOmoH/gqnr78qwKMno+bE+ljIRCX8GX93o7uxc79j4M3VaBQIEe0OiUg0OEXc
         ihh0Qu0tFt761a9F9xzdkObiaVt8mRIy3D1Xe0eXhMqL+c9EYdjAlPETW4AWE6qBJRwP
         gcOTNn9Lf2tGZyU3mWb+rzwDSDgVdk0qY2ugFTW4kxg5xhQHo/+cQHnGiZKevPll3l2v
         Pn756tB/scxOeu2DpD+VICLf+ualBsEDHHnYT7x1t2fOafM0Gxz3v0yLoMqfPGclEJzJ
         D1k+xwrIdG/0/J8+8MB31kRqhXZIVYUlQCa6rlBnuYdQK1ZRfAdKZEkfTOFWwYPFVENY
         di8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3-20020a0cfba3000000b0042c37c01389si7505006qvp.9.2022.03.15.00.59.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Mar 2022 00:59:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nU25N-0000gO-Ff
	for alex.bennee@linaro.org; Tue, 15 Mar 2022 03:59:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nU24p-0000dJ-Q7; Tue, 15 Mar 2022 03:58:43 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:41108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nU24m-0003kK-DC; Tue, 15 Mar 2022 03:58:43 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22F7loYr061296;
 Tue, 15 Mar 2022 15:47:51 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.100) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 15 Mar
 2022 15:57:56 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v2 1/2] hw: aspeed_scu: Add AST2600 apb_freq and hpll
 calculation function
Date: Tue, 15 Mar 2022 15:57:52 +0800
Message-ID: <20220315075753.8591-2-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220315075753.8591-1-steven_lee@aspeedtech.com>
References: <20220315075753.8591-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.100]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22F7loYr061296
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=steven_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RdM7oK4+BEe9

AST2600's HPLL register offset and bit definition are different from
AST2500. Add a hpll calculation function and an apb frequency calculation
function based on SCU200 register description in ast2600v11.pdf.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 hw/misc/aspeed_scu.c         | 39 +++++++++++++++++++++++++++++++++++-
 include/hw/misc/aspeed_scu.h | 18 +++++++++++++++++
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index d06e179a6e..d65f86df3d 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -213,6 +213,11 @@ static uint32_t aspeed_scu_get_random(void)
 }
 
 uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s)
+{
+    return ASPEED_SCU_GET_CLASS(s)->get_apb(s);
+}
+
+static uint32_t aspeed_2400_scu_get_apb_freq(AspeedSCUState *s)
 {
     AspeedSCUClass *asc = ASPEED_SCU_GET_CLASS(s);
     uint32_t hpll = asc->calc_hpll(s, s->regs[HPLL_PARAM]);
@@ -221,6 +226,15 @@ uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s)
         / asc->apb_divider;
 }
 
+static uint32_t aspeed_2600_scu_get_apb_freq(AspeedSCUState *s)
+{
+    AspeedSCUClass *asc = ASPEED_SCU_GET_CLASS(s);
+    uint32_t hpll = asc->calc_hpll(s, s->regs[AST2600_HPLL_PARAM]);
+
+    return hpll / (SCU_CLK_GET_PCLK_DIV(s->regs[AST2600_CLK_SEL]) + 1)
+        / asc->apb_divider;
+}
+
 static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned size)
 {
     AspeedSCUState *s = ASPEED_SCU(opaque);
@@ -426,6 +440,26 @@ static uint32_t aspeed_2500_scu_calc_hpll(AspeedSCUState *s, uint32_t hpll_reg)
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
+    if (!(hpll_reg & SCU_AST2600_H_PLL_BYPASS_EN)) {
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
@@ -525,6 +559,7 @@ static void aspeed_2400_scu_class_init(ObjectClass *klass, void *data)
     dc->desc = "ASPEED 2400 System Control Unit";
     asc->resets = ast2400_a0_resets;
     asc->calc_hpll = aspeed_2400_scu_calc_hpll;
+    asc->get_apb = aspeed_2400_scu_get_apb_freq;
     asc->apb_divider = 2;
     asc->nr_regs = ASPEED_SCU_NR_REGS;
     asc->ops = &aspeed_ast2400_scu_ops;
@@ -545,6 +580,7 @@ static void aspeed_2500_scu_class_init(ObjectClass *klass, void *data)
     dc->desc = "ASPEED 2500 System Control Unit";
     asc->resets = ast2500_a1_resets;
     asc->calc_hpll = aspeed_2500_scu_calc_hpll;
+    asc->get_apb = aspeed_2400_scu_get_apb_freq;
     asc->apb_divider = 4;
     asc->nr_regs = ASPEED_SCU_NR_REGS;
     asc->ops = &aspeed_ast2500_scu_ops;
@@ -716,7 +752,8 @@ static void aspeed_2600_scu_class_init(ObjectClass *klass, void *data)
     dc->desc = "ASPEED 2600 System Control Unit";
     dc->reset = aspeed_ast2600_scu_reset;
     asc->resets = ast2600_a3_resets;
-    asc->calc_hpll = aspeed_2500_scu_calc_hpll; /* No change since AST2500 */
+    asc->calc_hpll = aspeed_2600_scu_calc_hpll;
+    asc->get_apb = aspeed_2600_scu_get_apb_freq;
     asc->apb_divider = 4;
     asc->nr_regs = ASPEED_AST2600_SCU_NR_REGS;
     asc->ops = &aspeed_ast2600_scu_ops;
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index c14aff2bcb..6bf67589e8 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -56,6 +56,7 @@ struct AspeedSCUClass {
 
     const uint32_t *resets;
     uint32_t (*calc_hpll)(AspeedSCUState *s, uint32_t hpll_reg);
+    uint32_t (*get_apb)(AspeedSCUState *s);
     uint32_t apb_divider;
     uint32_t nr_regs;
     const MemoryRegionOps *ops;
@@ -316,4 +317,21 @@ uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s);
         SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       \
         SCU_AST2500_HW_STRAP_RESERVED1)
 
+/* SCU200   H-PLL Parameter Register (for Aspeed AST2600 SOC)
+ *
+ *  28:26  H-PLL Parameters
+ *  25     Enable H-PLL reset
+ *  24     Enable H-PLL bypass mode
+ *  23     Turn off H-PLL
+ *  22:19  H-PLL Post Divider (P)
+ *  18:13  H-PLL Numerator (M)
+ *  12:0   H-PLL Denumerator (N)
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

