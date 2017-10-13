Received: by 10.223.197.9 with SMTP id q9csp805197wrf;
        Fri, 13 Oct 2017 07:30:07 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDKUjAjQBz51W9OSSZemMyIBm3fyubmanzX7qkgwMhvUlih1tvPbA4Ob6PPrCsKd4WlLj1e
X-Received: by 10.237.62.153 with SMTP id n25mr2182836qtf.124.1507905007285;
        Fri, 13 Oct 2017 07:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507905007; cv=none;
        d=google.com; s=arc-20160816;
        b=AkXTgAOuYnYkR+tjSlJQ9rUb3d2JvMCOszeUgbwdbRnoI/XMcL5/nNPTEZ9oHY98D3
         rMBcdY15LgGtIIBA+M7JYbHuuMJ6S2qb6t9nfyGRTNE0thjxkG52BxyAMPr3CV2cZ2fm
         gGQ41iKCfTPdzrDm7X48nzWajlbDgkWRkIPzQji8wuJeKV2UnOY+dw6LJLglSfsw5Nur
         8h54QiL2h+2ivFLWNpp+2OnP9b/0pgMOqCZItS67LA8n3Pxl2dDIFtbBOd2d30mRW9SG
         fprSkQuVpi2bn7ynlQFDHJ1mLjJZ/U7ppooE7wBhJNIFsMO19pdDDEtt9QRTIP9ZVnWq
         XWxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=11pISwL19uBPFycNwfA1UmMgnK4Bm4vc/8hMWMx0AsY=;
        b=XxWexZMZ/l8cM/v94XnaVETm3MmlG7n/QH2BxjrYF/uo4ui+CVxj1+nqfNF6nKe+zM
         jzJaah0frHelwIdyXNnIrjBwSjdyJMVWZo+LD6sOkVZgsEglxb24be8qTogNbznpCneL
         ML+Y7Y505jCZ8CJ8XNKWAXCurtAMJqt4mf8De0KcaOSwVJASHPXzu9LOz9FxmSsLCi3q
         WpGdfFCzjqm76JZ7mUpO0KQVMgqM+dupleaPtHrt8xHn+cxoDUEifWmPMAqKLdbjltc2
         UTBk02fWmlPp+p/dVdHAgVaBTp8yyzTheVSFP5UDRfT4YBP1WKvBHXK0wpY9dU4cjE+Y
         ZDRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t79si880274qka.93.2017.10.13.07.30.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Oct 2017 07:30:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50562 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e30yS-0005Ig-Rd
	for alex.bennee@linaro.org; Fri, 13 Oct 2017 10:30:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e30y1-00057E-ME
	for qemu-arm@nongnu.org; Fri, 13 Oct 2017 10:29:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e30xx-0000ao-Oo
	for qemu-arm@nongnu.org; Fri, 13 Oct 2017 10:29:37 -0400
Received: from 4.mo4.mail-out.ovh.net ([178.32.98.131]:40122)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e30xx-0000ZD-JQ
	for qemu-arm@nongnu.org; Fri, 13 Oct 2017 10:29:33 -0400
Received: from player159.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 737B6E75BC
	for <qemu-arm@nongnu.org>; Fri, 13 Oct 2017 16:29:30 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player159.ha.ovh.net (Postfix) with ESMTPSA id 4522A48007D;
	Fri, 13 Oct 2017 16:29:22 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Oct 2017 16:28:48 +0200
Message-Id: <20171013142852.916-3-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171013142852.916-1-clg@kaod.org>
References: <20171013142852.916-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 14828664725426637585
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrtdeigdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.98.131
Subject: [Qemu-arm] [PATCH v3 2/6] aspeed: add an I2C RTC device to all
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
X-TUID: US4cfshPaFc8

The AST2500 EVB does not have an RTC but we can pretend that one is
plugged on the I2C bus header.

The romulus and witherspoon boards expects an Epson RX8900 I2C RTC but
a ds1338 is good enough for the basic features we need.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 5e0b9a184b9c..032fd61d452f 100644
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
@@ -359,6 +374,10 @@ static void witherspoon_bmc_i2c_init(AspeedBoardStat=
e *bmc)
=20
     /* The Witherspoon expects a TMP275 but a TMP105 is compatible */
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
2.13.6

