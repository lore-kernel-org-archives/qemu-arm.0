Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1612121lfb;
        Fri, 3 Sep 2021 12:53:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwPpOik6Gnz/c+gib02FJErxmejshWj6bcuG8P/FOdeUhdLljIn4nkTyorxxEw3OBjvYWf
X-Received: by 2002:a25:ba0f:: with SMTP id t15mr952535ybg.15.1630698780547;
        Fri, 03 Sep 2021 12:53:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630698780; cv=none;
        d=google.com; s=arc-20160816;
        b=zQ0whd7ihdAP+MCLlcOzzkbl9cjEuq/GYSLQNeK9sain2jF2wnYYZj8A0wSS7n+j1b
         BVbuj325ZmLF6SE0DdQkeovsEFiBVbUHnkzpR1JKsAvjhlkrCuslOyXq0QiIa0PYaw0g
         6oV8BF94AA868Xg8yUSjdoNU/VpBJ1Czj5URG98qoL9/Zijyj6qe8SUnNKVLdKYeXnYZ
         G3F2o0klgip2vPZMRT3xQTSYTjWUusWnq97Oqw0SNXP53XRO3iOZ2IdXniIobYGZNk1V
         zUTDcTheqADcPdvSQ6jKPv7+M2EiOmW4zYR/f5ZME0arje2K1xrgMIi8iZI8JdpdW24N
         ipnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=3d4gR1wBln2H8pcXFN1TcAuGpIkQ95GXrC8Q+NYnopI=;
        b=nMt9vRpcdyx5Cnwx49bzsSX9j7NwU7TMLTqeHfbYmF8i12Gz5XIKkx0gLMEFJrDC6H
         8KUGyGknKa6af38wSJyJE9uFqej1WuBWQKvbWw7Mw3y8tQroIy2fFR/UhVVx/64VZC5+
         EVPuxRbVs5OBzhViWXyQppnrp0ihDUXa73EJKQ5f9VACQrGVj218n1ca12OqbSJTr6Al
         t2pO3c8s2Tfnbu3HcYSFmzO4ll9rPKBqaIJxDlBm5LZ15XwBapmj+OIzKlEW5XEkVheB
         zlzwUppD1Mc6OnrSj342vR6k8soiwtUkTN/Yz85obOSytQ8b5ShDhD10kQ1paHqRGqWs
         NfFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m16si191480ybp.436.2021.09.03.12.53.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 12:53:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMFFD-00022s-Pe
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 15:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mMF46-0004HS-RX; Fri, 03 Sep 2021 15:41:33 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:35349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mMF40-0002Hd-3v; Fri, 03 Sep 2021 15:41:30 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.7])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id BE615BC4DEF3;
 Fri,  3 Sep 2021 21:41:13 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 3 Sep
 2021 21:41:12 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00504116475-065d-4e33-91eb-723412cfc0a0,
 15E2C03324B5D6AD2543493448FEC157D625CB40) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 06/14] hw: aspeed_gpio: Clarify GPIO controller name
Date: Fri, 3 Sep 2021 21:41:00 +0200
Message-ID: <20210903194108.131403-7-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903194108.131403-1-clg@kaod.org>
References: <20210903194108.131403-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f9e9d424-7c97-4f81-997a-2b20531365b3
X-Ovh-Tracer-Id: 8816077746738662249
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvjedgudefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Rashmica Gupta <rashmica.g@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: idRNaedESA+r

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

