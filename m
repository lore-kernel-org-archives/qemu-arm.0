Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp713367lfb;
        Fri, 1 Apr 2022 01:41:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyog/sDGbbRJRSjII/1j8rb6dp7eDmNf4ghq02msjTN6Vj/TQusP5dc+19XIJGvoaKuAY0W
X-Received: by 2002:a37:63c9:0:b0:67b:1892:4b95 with SMTP id x192-20020a3763c9000000b0067b18924b95mr5959431qkb.5.1648802471603;
        Fri, 01 Apr 2022 01:41:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648802471; cv=none;
        d=google.com; s=arc-20160816;
        b=Q24KVFNEngi/ginwEL5EF+msmyV/6Ns8AVIHoTzHl2oi20hpQot0E18A0KiGcqcRNm
         iIdZ1vDeIiBsWPAfwqHXQDX6VShB0RjgXpe5t+fAGBJHLkiBZQ6ald35qyBQclTdsrcd
         ByP8GPJeS9AnTgxC1RpIluG60+6z0NFlQPrwMdJZW3QJEQaImTm6DLINQz2umtVsCwGu
         CrxX96JFlfSakbCDkrEr6+fHeLX4WyOkwWuEdIBS/0HfZFPCly9VPIEpkAerT++/iWyq
         yJpu1aa6xqnk7523Fb0X/hY+tc5fcAJh06pN0oJUOLoI3BrdeRIHqU9+/odDo8cNTwhd
         Srzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=857fODzb838nYmDByF1tnXApqsjZ6vlBG83y3RDP1OI=;
        b=ITjO1pAL5VLKPfXao7Za23n4kKYELS1Yado/Ehgfo37rEvhZeLzCX3AF2oxaZfGvZn
         vifb2eSCAfORxyFWJHVvVpUkMajQB9yaCgV6TfbHQrBG+Mvv2hfaIkBN2nasLVG/NN2M
         2aLYHQAfFH7BqQce6cMaODKYXb252ERJAGC+GcOTbNRLpMe6ztLvC6Jy3QQsiSn3ZJdM
         8cUJ8mjcNj2Xtey7/E8NGypUEEgqbJNIH7qnK21JKDTrhIHZlOBHXTHswpE/Ij8z1k/Z
         eyTHibAxKIIoiBtfjfve7++b2nV8Q0ysTCcSrhCyXc03Vjc+WIrlQcVh2ZOhlUhcYtuS
         JBlg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8-20020ad45748000000b00440f5eafb54si632769qvx.556.2022.04.01.01.41.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Apr 2022 01:41:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1naCqF-0000PM-0K
	for alex.bennee@linaro.org; Fri, 01 Apr 2022 04:41:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1naCpK-0000Dm-Mw; Fri, 01 Apr 2022 04:40:22 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:24706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1naCpI-0001SA-Fy; Fri, 01 Apr 2022 04:40:14 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 2318Rrwv030513;
 Fri, 1 Apr 2022 16:27:53 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 1 Apr
 2022 16:38:55 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Beraldo Leal" <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [PATCH v5 6/9] aspeed/scu: Add AST1030 support
Date: Fri, 1 Apr 2022 16:38:47 +0800
Message-ID: <20220401083850.15266-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220401083850.15266-1-jamin_lin@aspeedtech.com>
References: <20220401083850.15266-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2318Rrwv030513
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
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
X-TUID: RjN6PXu1OLyN

From: Steven Lee <steven_lee@aspeedtech.com>

Per ast1030_v07.pdf, AST1030 SOC doesn't have SCU300, the pclk divider
selection is defined in SCU310[11:8].
Add a get_apb_freq function and a class init handler for ast1030.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_scu.c         | 63 ++++++++++++++++++++++++++++++++++++
 include/hw/misc/aspeed_scu.h | 25 ++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 150567f98a..19b03471fc 100644
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
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index fdc721846c..d71aa66e40 100644
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
 
@@ -335,4 +338,26 @@ uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s);
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
-- 
2.17.1

