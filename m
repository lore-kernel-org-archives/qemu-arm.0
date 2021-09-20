Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1864598lfp;
        Mon, 20 Sep 2021 01:24:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2K42b7w6vrL7Ix04hNuNxhZ3EHPBMrOwwgR3IZrpngI3MSowS+/bo+7v3EEgBH+2mlR+V
X-Received: by 2002:a25:8881:: with SMTP id d1mr1302105ybl.289.1632126243461;
        Mon, 20 Sep 2021 01:24:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632126243; cv=none;
        d=google.com; s=arc-20160816;
        b=eGX1vA/z016CarOkCTSj+V6qx3GadhhaF0JCpg8AjkYMOSOTe+4DBjvLRJljgMVszQ
         dCOuhO2b6DvcdMyoqraU8GBt511r2SCP8n7+q+Xz7tuijr7E9l28WnL3jIZfh64m0VFT
         UhjGv8fkZHgzXWwJmaL0mc0DgoYjdxLHv/mrzM3mz+BmyzuQfOpErzTzlrFEqg/X+z/q
         m3MwcocioSOPtTApB0xW+xnbZf5of4YX7AoPunBrkZQEMxrDoeexEimxH+8XNJDo/DvT
         lvTvePeEx+vzNAOXtK5cJFHeALF9/Hs42eCEnS7oRnx+W35ZoLLDlkNoK7l22cBLVBhr
         wqPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=3d4gR1wBln2H8pcXFN1TcAuGpIkQ95GXrC8Q+NYnopI=;
        b=zPPVJ1QA3KPxRVP91suj0eNovgVJVB7CVSu3vm3X1XXXnjcw/3u6eJyBCzpFJ0dpfP
         FHdo3kJbYU/YnMJuLor9D9nfBf4wLTphb9rOgHZ2Hs177Mxxu8Xlcwu30qNVIADEwnF/
         ynccqTLW5KVCmYgIedOhlQfiwei9Yi3Szf+oAAj/f/hAaNZbRAYrUBGmyEFmcPVmWVnA
         SL4EVzAz1C+nrNVdX1WRgWpfsEEGmMueQHoxV3Y3VCo/oIW0LyKlKaZZJWMShcYX/DQn
         HpQpGcZbwwYFnET+re8VJPPzsCiraEyTeujZ8oDM8/yO1d+NW8U0wiDegxVVpzuTUE6I
         8vyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si16906684ybp.365.2021.09.20.01.24.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Sep 2021 01:24:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSEao-0003uo-Pd
	for alex.bennee@linaro.org; Mon, 20 Sep 2021 04:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSEN4-0004VO-CW
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:09:50 -0400
Received: from smtpout3.3005.mail-out.ovh.net ([217.182.185.173]:49765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSEMu-0003kT-R0
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:09:50 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.250])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 279DD13ED31;
 Mon, 20 Sep 2021 08:09:37 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 20 Sep
 2021 10:09:36 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00547bdde27-116f-4ebd-a55d-41fed39391ba,
 C584E5EC745A9DFF7B561FC81DF43D5934FDEC9F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 06/14] hw: aspeed_gpio: Clarify GPIO controller name
Date: Mon, 20 Sep 2021 10:09:20 +0200
Message-ID: <20210920080928.1055567-7-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920080928.1055567-1-clg@kaod.org>
References: <20210920080928.1055567-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ef4cb61f-2a4e-4d7d-b643-db99e2404752
X-Ovh-Tracer-Id: 4737786810021874537
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout3.3005.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Rashmica Gupta <rashmica.g@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TlDm6SIxJuyk

From: Joel Stanley <joel@jms.id.au>

There are two GPIO controllers in the ast2600; one is 3.3V and the other
is 1.8V.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Rashmica Gupta <rashmica.g@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210713065854.134634-4-joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/gpio/aspeed_gpio.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index dc721aec5da7..dfa6d6cb40a9 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -164,12 +164,12 @@
 #define GPIO_YZAAAB_DIRECTION      (0x1E4 >> 2)
 #define GPIO_AC_DATA_VALUE         (0x1E8 >> 2)
 #define GPIO_AC_DIRECTION          (0x1EC >> 2)
-#define GPIO_3_6V_MEM_SIZE         0x1F0
-#define GPIO_3_6V_REG_ARRAY_SIZE   (GPIO_3_6V_MEM_SIZE >> 2)
+#define GPIO_3_3V_MEM_SIZE         0x1F0
+#define GPIO_3_3V_REG_ARRAY_SIZE   (GPIO_3_3V_MEM_SIZE >> 2)
 
 /* AST2600 only - 1.8V gpios */
 /*
- * The AST2600 two copies of the GPIO controller: the same 3.6V gpios as the
+ * The AST2600 two copies of the GPIO controller: the same 3.3V gpios as the
  * AST2400 (memory offsets 0x0-0x198) and a second controller with 1.8V gpios
  * (memory offsets 0x800-0x9D4).
  */
@@ -380,7 +380,7 @@ static uint32_t update_value_control_source(GPIOSets *regs, uint32_t old_value,
     return new_value;
 }
 
-static const AspeedGPIOReg aspeed_3_6v_gpios[GPIO_3_6V_REG_ARRAY_SIZE] = {
+static const AspeedGPIOReg aspeed_3_3v_gpios[GPIO_3_3V_REG_ARRAY_SIZE] = {
     /* Set ABCD */
     [GPIO_ABCD_DATA_VALUE] =     { 0, gpio_reg_data_value },
     [GPIO_ABCD_DIRECTION] =      { 0, gpio_reg_direction },
@@ -800,7 +800,7 @@ static const GPIOSetProperties ast2500_set_props[] = {
     [7] = {0x000000ff,  0x000000ff,  {"AC"} },
 };
 
-static GPIOSetProperties ast2600_3_6v_set_props[] = {
+static GPIOSetProperties ast2600_3_3v_set_props[] = {
     [0] = {0xffffffff,  0xffffffff,  {"A", "B", "C", "D"} },
     [1] = {0xffffffff,  0xffffffff,  {"E", "F", "G", "H"} },
     [2] = {0xffffffff,  0xffffffff,  {"I", "J", "K", "L"} },
@@ -927,7 +927,7 @@ static void aspeed_gpio_ast2400_class_init(ObjectClass *klass, void *data)
     agc->nr_gpio_pins = 216;
     agc->nr_gpio_sets = 7;
     agc->gap = 196;
-    agc->reg_table = aspeed_3_6v_gpios;
+    agc->reg_table = aspeed_3_3v_gpios;
 }
 
 static void aspeed_gpio_2500_class_init(ObjectClass *klass, void *data)
@@ -938,17 +938,17 @@ static void aspeed_gpio_2500_class_init(ObjectClass *klass, void *data)
     agc->nr_gpio_pins = 228;
     agc->nr_gpio_sets = 8;
     agc->gap = 220;
-    agc->reg_table = aspeed_3_6v_gpios;
+    agc->reg_table = aspeed_3_3v_gpios;
 }
 
-static void aspeed_gpio_ast2600_3_6v_class_init(ObjectClass *klass, void *data)
+static void aspeed_gpio_ast2600_3_3v_class_init(ObjectClass *klass, void *data)
 {
     AspeedGPIOClass *agc = ASPEED_GPIO_CLASS(klass);
 
-    agc->props = ast2600_3_6v_set_props;
+    agc->props = ast2600_3_3v_set_props;
     agc->nr_gpio_pins = 208;
     agc->nr_gpio_sets = 7;
-    agc->reg_table = aspeed_3_6v_gpios;
+    agc->reg_table = aspeed_3_3v_gpios;
 }
 
 static void aspeed_gpio_ast2600_1_8v_class_init(ObjectClass *klass, void *data)
@@ -984,10 +984,10 @@ static const TypeInfo aspeed_gpio_ast2500_info = {
     .instance_init  = aspeed_gpio_init,
 };
 
-static const TypeInfo aspeed_gpio_ast2600_3_6v_info = {
+static const TypeInfo aspeed_gpio_ast2600_3_3v_info = {
     .name           = TYPE_ASPEED_GPIO "-ast2600",
     .parent         = TYPE_ASPEED_GPIO,
-    .class_init     = aspeed_gpio_ast2600_3_6v_class_init,
+    .class_init     = aspeed_gpio_ast2600_3_3v_class_init,
     .instance_init  = aspeed_gpio_init,
 };
 
@@ -1003,7 +1003,7 @@ static void aspeed_gpio_register_types(void)
     type_register_static(&aspeed_gpio_info);
     type_register_static(&aspeed_gpio_ast2400_info);
     type_register_static(&aspeed_gpio_ast2500_info);
-    type_register_static(&aspeed_gpio_ast2600_3_6v_info);
+    type_register_static(&aspeed_gpio_ast2600_3_3v_info);
     type_register_static(&aspeed_gpio_ast2600_1_8v_info);
 }
 
-- 
2.31.1

