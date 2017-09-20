Received: by 10.223.172.38 with SMTP id v35csp389306wrc;
        Wed, 20 Sep 2017 00:02:37 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCX4uQhp95bzm/s744b3S2nLV42Eai4jVAz74Z//2wJ4zSGUJIn37MnLqHSLuFLP+9gxwBl
X-Received: by 10.237.60.101 with SMTP id u34mr5872403qte.153.1505890957422;
        Wed, 20 Sep 2017 00:02:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505890957; cv=none;
        d=google.com; s=arc-20160816;
        b=BM3AysdupZ0men1cDO4IwirR/WJin+NzcoM7UWCW56mZZc03X+GPVj4HaytsezAgkD
         DNyvXGKId1Wc8tcLvjMRY+8d+rctA67/XkkICK43AnryDxlnxRTkmv3kjvLiXOuSD6/O
         XMmVWf/NN5/ihyYgiXmz5CDBICmk+PsMc2LIFlQgEOF19Qa4TiMweGZn7uouEyc0kAug
         c+/TDthQ2QLA2vxqtmR0tXvzlZ+LgZ2C6EW4yBvNkKk2dZELb0fKRDknoNr7OdkxbuqC
         bxa8Hihq/cepeMIbwS5+YnYSLgT3+BlGmsQCot12JpbCOC1pf8pO+K5I5ZsozNo5yiyY
         /K6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=1KfppzRLFXf0RJZ7m1E2NZmyKSWGhDFm9TUmWWppANI=;
        b=BgAZMqvnTgQ6jpEIKCDGBRm+/+4BqBUzF43ik2fqbsjNmJKr/iNb2gjbb/tShIArRU
         jM9kkjkFMLTcblx6Ujm4Q/zHwIE0Lq66NkXcOe/CilafgBw4DaBhL5zCGpABpbD4H4tT
         14tPoPvj9YAuxINdiwO8DyLsezIwud2MC2M5LZ5l4JH8hYbY0h4u8VBlt5eF/yS+g7R7
         r4OBkxCe37tor16mEo5V/a/PBqI/EAoPEAFP5b/9q0iQO6IiNZiXkcKkVo11fEdAoOc5
         L3TVPpYPYkak70LQumj6punn8Mt7LxBxRZpIY+z1Px8z0gh7t6vyTc4yWCo3k9ADIld1
         gf+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 29si1294387qkr.529.2017.09.20.00.02.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 00:02:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47108 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duZ1n-00050q-7t
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 03:02:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1duZ1V-0004to-Fl
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 03:02:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1duZ1R-0000Ah-G7
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 03:02:17 -0400
Received: from 1.mo2.mail-out.ovh.net ([46.105.63.121]:47115)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1duZ1R-00009s-9a
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 03:02:13 -0400
Received: from player157.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 0A812AC999
	for <qemu-arm@nongnu.org>; Wed, 20 Sep 2017 09:02:12 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player157.ha.ovh.net (Postfix) with ESMTPSA id C6B0650009A;
	Wed, 20 Sep 2017 09:02:04 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Sep 2017 09:01:31 +0200
Message-Id: <20170920070135.31379-3-clg@kaod.org>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170920070135.31379-1-clg@kaod.org>
References: <20170920070135.31379-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1329406315405478673
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrheekgdduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.63.121
Subject: [Qemu-arm] [PATCH v2 2/6] aspeed: add an I2C RTC device to all
 machines
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PIBvyj3BQmxO

The AST2500 EVB does not have an RTC but we can pretend that one is
plugged on the I2C bus header.

The romulus and witherspoon boards expects an Epson RX8900 I2C RTC but
a ds1338 is good enough for the basic features we need.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 81f522f711ae..362b683e9021 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -89,6 +89,7 @@ enum {
=20
 static void palmetto_bmc_i2c_init(AspeedBoardState *bmc);
 static void ast2500_evb_i2c_init(AspeedBoardState *bmc);
+static void romulus_bmc_i2c_init(AspeedBoardState *bmc);
 static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc);
=20
 static const AspeedBoardConfig aspeed_boards[] =3D {
@@ -114,6 +115,7 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
         .fmc_model =3D "n25q256a",
         .spi_model =3D "mx66l1g45g",
         .num_cs    =3D 2,
+        .i2c_init  =3D romulus_bmc_i2c_init,
     },
     [WITHERSPOON_BMC]  =3D {
         .soc_name  =3D "ast2500-a1",
@@ -298,6 +300,10 @@ static void ast2500_evb_i2c_init(AspeedBoardState *b=
mc)
=20
     /* The AST2500 EVB expects a LM75 but a TMP105 is compatible */
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7), "tmp105",=
 0x4d);
+
+    /* The AST2500 EVB does not have an RTC. Let's pretend that one is
+     * plugged on the I2C bus header */
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "ds1338"=
, 0x32);
 }
=20
 static void ast2500_evb_init(MachineState *machine)
@@ -325,6 +331,15 @@ static const TypeInfo ast2500_evb_type =3D {
     .class_init =3D ast2500_evb_class_init,
 };
=20
+static void romulus_bmc_i2c_init(AspeedBoardState *bmc)
+{
+    AspeedSoCState *soc =3D &bmc->soc;
+
+    /* The romulus board expects Epson RX8900 I2C RTC but a ds1338 is
+     * good enough */
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "ds1338"=
, 0x32);
+}
+
 static void romulus_bmc_init(MachineState *machine)
 {
     aspeed_board_init(machine, &aspeed_boards[ROMULUS_BMC]);
@@ -358,6 +373,10 @@ static void witherspoon_bmc_i2c_init(AspeedBoardStat=
e *bmc)
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 5), "tmp423",=
 0x4c);
=20
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), "tmp105",=
 0x4a);
+
+    /* The witherspoon board expects Epson RX8900 I2C RTC but a ds1338 i=
s
+     * good enough */
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "ds1338"=
, 0x32);
 }
=20
 static void witherspoon_bmc_init(MachineState *machine)
--=20
2.13.5

