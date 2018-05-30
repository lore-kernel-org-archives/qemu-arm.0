Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4400147wre;
        Tue, 29 May 2018 23:42:10 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLHXRlu/v5k5vaEvsO27TyeHVcNJekCKtIBuxXBWO+TrLWMovpQQZxAskwGtf4NbKXacYxV
X-Received: by 2002:a37:4f10:: with SMTP id d16-v6mr1232006qkb.323.1527662530477;
        Tue, 29 May 2018 23:42:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527662530; cv=none;
        d=google.com; s=arc-20160816;
        b=Yv+l9Mx/w/aywfvlqlhkfQaow2SXerCKiwET/aYBzy3qA1et3+wPS8UGa4+pfqZW8r
         J4I721oTvspYWcZiBR9D9W2vSNwDJiGNwbLYuiEnt1rJiA0Iq8RnTCcvnCNN6u5+mm1q
         mlBRU1686j3/vvZoHfkdVxJXJRPA/tXep2Fu9t0yE+JoUC9bBq+/rBlMeKR273WKPgdf
         Lqd7Wlu3Qjv5gTv2dM7mXm173c3X9rMcoxnsxHkj4pYmOYLzQtFKm2N0cjBSWgJhZTrl
         jWe5hTBHeJ8zoXevZHBuMxluPMA7VIWoYbuD6TFR/+5kdQ5AWbw77hoc33yOPDgJCLfj
         KM7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=gInzful5bn9oNh6UuRmNfSDqcJ1goWw7BRIlwmNSji8=;
        b=Y67pi07bpSltA497TaPU8Av6WSX+yeYjOXj064Sbt/xl7eEu2B7QZMUqSzjUNTnp7p
         99iYxFEEjv2U+3DcJg/PVSnBOvDutOGb6VrEqkhWCj1GoT5ItGvC6WM+kqIJn1MKRZ1t
         4MV0QlYYu7iu3ReMlMHSiYbMv6uqN5tTrglCmSeDjAAtBGVhCv+qKm+oDcSY2vFi+kbT
         o68OmNk0U5JI5YKIJvEmIVwOEjR747esA5bvqZBLfySHRYoYrhJILmgk1rSOlMSRumb7
         +Bs+tdQoKlgEmddWcgmcamy3t6KwnrgPlzMtwOUuI5D0FKgI2Md6Cz1AUnPmSx4UlQMx
         t6rA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v7-v6si249708qvi.32.2018.05.29.23.42.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 23:42:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36511 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNuoD-0002gl-Sp
	for alex.bennee@linaro.org; Wed, 30 May 2018 02:42:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNunf-0002OB-HK
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:41:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNunb-0001A1-JL
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:41:35 -0400
Received: from 2.mo1.mail-out.ovh.net ([178.32.119.250]:60955)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNunb-00019V-CT
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:41:31 -0400
Received: from player159.ha.ovh.net (unknown [10.109.122.50])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id D998B10006A
	for <qemu-arm@nongnu.org>; Wed, 30 May 2018 08:41:29 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player159.ha.ovh.net (Postfix) with ESMTPSA id 9323A4800AE;
	Wed, 30 May 2018 08:41:22 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 May 2018 08:40:45 +0200
Message-Id: <20180530064049.27976-4-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180530064049.27976-1-clg@kaod.org>
References: <20180530064049.27976-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 5159154849630489361
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheelgdduuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.119.250
Subject: [Qemu-arm] [PATCH v7 3/7] aspeed: add an I2C RTC device to all
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
X-TUID: Y7Hi4xTNgTcB

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
index 96790af0cf50..8efa783722c5 100644
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
@@ -306,6 +308,10 @@ static void ast2500_evb_i2c_init(AspeedBoardState *b=
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
@@ -332,6 +338,15 @@ static const TypeInfo ast2500_evb_type =3D {
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
@@ -365,6 +380,10 @@ static void witherspoon_bmc_i2c_init(AspeedBoardStat=
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

