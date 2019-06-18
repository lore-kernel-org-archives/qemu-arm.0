Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3977603wrg;
        Tue, 18 Jun 2019 10:27:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwQKdkQiLo/2W3myPLxrcz9c0cf0ftNI5KBjvqgKq5dG9VvA1tXZfZmNOS5rKMg3D4P9AYu
X-Received: by 2002:a37:4c4e:: with SMTP id z75mr21423759qka.230.1560878823379;
        Tue, 18 Jun 2019 10:27:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560878823; cv=none;
        d=google.com; s=arc-20160816;
        b=UTZTM0tZiPM49izpXHDzya75kXnSQcDw0YPxsR1vZPtatYx3I/hZ9SiaNz5IeX/kiD
         +7DGn2LpBTsN2WRWzvcG/87adLMGaf5sf5x4UqaKQjPamiSBUqgo9Nd2d3qEKZdBJkWh
         YAsg2RQ8B1vvNvgMI44he46ZlPS+DUjWvtzuS2QX0EpmGy2b2PB8QqrjfnuSVXm03JHJ
         pd8JMrZM5jZFFV/wCoQRZ527nsSpKcGNdtvj7/RT1FvCfWWBNRo7GxXwbYeocZUPw4bG
         XvL/kuWvqcd5Ybctyt9Tj/NK/0H9VQorA+CH6IUCg3tnKNHGri2+3snCosLSvz3xQbgf
         4Y+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=XL1TpjJUf1U7QUmGUGs7r/pC4DyhIjJ3Zk3I+oET68M=;
        b=rbWNvX0PiEqRB/EsAcZbmyc8JsEnz+pNKDscuhv2r5TyiAL4hVazoVTW20RSiItsr1
         k1MnUvh5HEIRnOmlDRVT3QBJuvQ56ebLHJ0zqOeJP/OrAxWMWvDlz9RmvhZrJeTEwTzY
         er9/uS4LLINeQbHg34fKpB4PsHSpl4kIPKdl7DDFr7k+jqIOtClbYwsvAEcDCe48XikG
         m9e54EUy3K2dw8ya1pEVEIpbx1HDRaxUs63vzN0TctXOPtzggp4II7LKd1ELh4h07jJE
         gM8gADx0h35hdaZn+WHScLd4ZrbC3RR2GTbh5JK3m2tlsmFOowCNX2xzinQIsdL5fXW6
         3ykg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y42si3392896qve.78.2019.06.18.10.27.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 10:27:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdHss-0001b0-Uy
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 13:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32959)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hdHOc-0001YM-Sp
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:55:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hdHOY-0006Dr-7q
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:55:43 -0400
Received: from 8.mo69.mail-out.ovh.net ([46.105.56.233]:53839)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hdHOY-00066R-0p
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:55:42 -0400
Received: from player157.ha.ovh.net (unknown [10.109.143.18])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id A95365E10B
 for <qemu-arm@nongnu.org>; Tue, 18 Jun 2019 18:55:37 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id 1D53A6EB554A;
 Tue, 18 Jun 2019 16:55:30 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jun 2019 18:53:09 +0200
Message-Id: <20190618165311.27066-20-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190618165311.27066-1-clg@kaod.org>
References: <20190618165311.27066-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1695886736135129873
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrtddtgdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.56.233
Subject: [Qemu-arm] [PATCH v2 19/21] aspeed: Add support for the swift-bmc
 board
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Adriana Kobylak <anoo@us.ibm.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UAdXZAxnlszc

From: Adriana Kobylak <anoo@us.ibm.com>

The Swift board is an OpenPOWER system hosting POWER processors.
Add support for their BMC including the I2C devices as found on HW.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 50 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index e404f8b244a9..51d6b5dd9627 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -73,6 +73,17 @@ struct AspeedBoardState {
         SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              =
\
         SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
=20
+/* Swift hardware value: 0xF11AD206 */
+#define SWIFT_BMC_HW_STRAP1 (                                           =
\
+        AST2500_HW_STRAP1_DEFAULTS |                                    =
\
+        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     =
\
+        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        =
\
+        SCU_AST2500_HW_STRAP_UART_DEBUG |                               =
\
+        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                              =
\
+        SCU_H_PLL_BYPASS_EN |                                           =
\
+        SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              =
\
+        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
+
 /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) *=
/
 #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
=20
@@ -294,6 +305,35 @@ static void romulus_bmc_i2c_init(AspeedBoardState *b=
mc)
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "ds1338"=
, 0x32);
 }
=20
+static void swift_bmc_i2c_init(AspeedBoardState *bmc)
+{
+    AspeedSoCState *soc =3D &bmc->soc;
+
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), "pca9552"=
, 0x60);
+
+    /* The swift board expects a TMP275 but a TMP105 is compatible */
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7), "tmp105",=
 0x48);
+    /* The swift board expects a pca9551 but a pca9552 is compatible */
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7), "pca9552"=
, 0x60);
+
+    /* The swift board expects an Epson RX8900 RTC but a ds1338 is compa=
tible */
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 8), "ds1338",=
 0x32);
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 8), "pca9552"=
, 0x60);
+
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), "tmp423",=
 0x4c);
+    /* The swift board expects a pca9539 but a pca9552 is compatible */
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), "pca9552"=
, 0x74);
+
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 10), "tmp423"=
, 0x4c);
+    /* The swift board expects a pca9539 but a pca9552 is compatible */
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 10), "pca9552=
",
+                     0x74);
+
+    /* The swift board expects a TMP275 but a TMP105 is compatible */
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 12), "tmp105"=
, 0x48);
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 12), "tmp105"=
, 0x4a);
+}
+
 static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
 {
     AspeedSoCState *soc =3D &bmc->soc;
@@ -384,6 +424,16 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
         .num_cs    =3D 2,
         .i2c_init  =3D romulus_bmc_i2c_init,
         .ram       =3D 512 * MiB,
+    }, {
+        .name      =3D MACHINE_TYPE_NAME("swift-bmc"),
+        .desc      =3D "OpenPOWER Swift BMC (ARM1176)",
+        .soc_name  =3D "ast2500-a1",
+        .hw_strap1 =3D SWIFT_BMC_HW_STRAP1,
+        .fmc_model =3D "mx66l1g45g",
+        .spi_model =3D "mx66l1g45g",
+        .num_cs    =3D 2,
+        .i2c_init  =3D swift_bmc_i2c_init,
+        .ram       =3D 512 * MiB,
     }, {
         .name      =3D MACHINE_TYPE_NAME("witherspoon-bmc"),
         .desc      =3D "OpenPOWER Witherspoon BMC (ARM1176)",
--=20
2.21.0

