Received: by 10.223.172.38 with SMTP id v35csp4814070wrc;
        Tue, 19 Sep 2017 04:27:28 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QB+RR36lFE5Merli390JJoNAk24bFIgzyEZH9iCJV+HdIexr09oZkyY6d9oHMWKbNGN7rPk
X-Received: by 10.200.55.83 with SMTP id p19mr1322616qtb.21.1505820448655;
        Tue, 19 Sep 2017 04:27:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505820448; cv=none;
        d=google.com; s=arc-20160816;
        b=TB9ZE6In8CE2OOIqrtddi7eVm5H8/pGjKyfKzj4lo1+gAlN/H5mQjPsWqUa32qkOHC
         wgeqWbKQUP4dmayt8TFdBORHWjmVpUZf/LrkzO9zX42KxZoO27wJS8tKgdVSTvce9/8y
         lw0VSalLxoCGbm6HmzNfg4ADGeAc4FDgLMMniDo9AoNAJBmVvLLZP08NeQxZqXDzdwZk
         dahQR0oCIM90Bte0LSaMZbaYMym/gbksuxoUFs4Lbf/7fO3W+OGip0fPpA/ZJKY7/lTL
         d8CfGJZI9+t5hqVxh0b6K9CgLJPlRoZmVLWx5yIvqH9w6KHgqyrKr57C39IiVBo7hRv2
         sCwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=1KfppzRLFXf0RJZ7m1E2NZmyKSWGhDFm9TUmWWppANI=;
        b=QYrPMtvLKkNn6qBRkyLc2burppUMIA9Ij6zpeK51QlC6iMqoLeCMplZkKep6siOcZB
         r9983P9nEwO1BxwIBps/FNqDnIwtxba3A9kww68MDQTpcJFtsu53O2r2882SP6uj79zN
         pdnYqUlsqqM0hlpyYZQx0c/ywDU0g9IcI6bUO10tJWK4CO51i2Mmz5fQvRvkf4pXugNK
         4ofnQx1e5LJrQrBp31h2YUc6dhazZ1j/9I5wk0/AOPcxV6NSdd2ExRvW9YrWU/yjYdpS
         rUQ0DnvUMYpaUAc6firKp9QQYyHrq9tzP7KXDPAEBNVpXO3F35j7hVmpXKRwCbXxw+i3
         55NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m101si9375725qkh.312.2017.09.19.04.27.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 04:27:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41679 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duGgY-00027T-7E
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 07:27:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1duGgM-00025q-Hx
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 07:27:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1duGgJ-0006IJ-DP
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 07:27:14 -0400
Received: from 8.mo179.mail-out.ovh.net ([46.105.75.26]:40855)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1duGgJ-0006Hf-8L
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 07:27:11 -0400
Received: from player716.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id EE655628B8
	for <qemu-arm@nongnu.org>; Tue, 19 Sep 2017 13:27:09 +0200 (CEST)
Received: from zorba.kaod.org.com (deibp9eh1--blueice1n2.emea.ibm.com
	[195.212.29.164]) (Authenticated sender: clg@kaod.org)
	by player716.ha.ovh.net (Postfix) with ESMTPSA id 8115A56007E;
	Tue, 19 Sep 2017 13:27:03 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Sep 2017 13:26:42 +0200
Message-Id: <20170919112645.8574-3-clg@kaod.org>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170919112645.8574-1-clg@kaod.org>
References: <20170919112645.8574-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 18378345655579020049
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrheejgdegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.75.26
Subject: [Qemu-arm] [PATCH 2/5] aspeed: add an I2C RTC device to all machines
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
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bovogq3E6Bp8

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

