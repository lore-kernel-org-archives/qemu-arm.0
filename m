Received: by 10.223.197.9 with SMTP id q9csp6921497wrf;
        Thu, 19 Oct 2017 08:16:05 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Qe1Wzmob14YuLYJl6w5I5QC3dyCRHdMDcEVOLN8FmQtiJhDX6msxVTMd/KdsJIt2/nRdmL
X-Received: by 10.55.19.228 with SMTP id 97mr2286361qkt.271.1508426165238;
        Thu, 19 Oct 2017 08:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508426165; cv=none;
        d=google.com; s=arc-20160816;
        b=zKGAsaRbW4zYdVeWqQonqqaI6yoFrhGs8FoEWPhRyZMCO7qARphXYsortm8WXF5Lii
         FE5SZxNCn5kEpAZiMK6gvFbuXQFUbjISB2LBVKCHcGbnfNwzVO3zEV9EqWkE21E7a0D/
         YNS5Z8mtf7/u7VVgQWROee4QNZ8Il7L9pCqU1dh+jWO5B1gRITLUohlX16x7f64FHouB
         YpROJEzVaHJIuvqLXosyxddeXjXfJMiqKlVfCjnUs0ms2dXqh6Xti9KtX2+0YerzNAg/
         VPB2HzXd3rD7yfRK9jO1BOlaU570RKLqK7+iAo83Ieom6CtBl3y3cM6x7BgIK90fQ9ef
         TrsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=bQIdcbm9ItO1potsrWdosePme6nDG1j1hG6TG9QZ+SE=;
        b=chfu8EY0v105m8UQ1r+oZ1mePFQ3+t2CY5hSZg27LudMTVqQC4P1XQFIUWeadwV8Z0
         MzJUttzwyZwiqHDCRh7/zEHlLdd+d4LDfN29IV0/NDCM0v0YoaBcmbXnkytFS47Bv0Qe
         MnOqftVIcjDBm2s1vNqc11oGWT/JQnlSPaFNTYg5QAPwbyxOj60nPhW2CsljetEqFsxw
         DmM3ttKNVS6PCBnXvkZxXrD9NR1Ny12yHh68PsHELSDCV598ErCY+BA7j6ogKOfESXd0
         AuWTH7jCJg4R1jY+/JyHOwCIYlleCYp/tp+gPw2lhVW24mz3rrkKnWIPHkqC4tgf4AMJ
         3lhA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a36si2577077qtb.367.2017.10.19.08.16.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 08:16:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49647 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5CYF-0003Ch-0c
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 11:16:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5CVn-0001Ik-Mx
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:13:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5CVm-0001RV-NF
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:13:31 -0400
Received: from 10.mo5.mail-out.ovh.net ([46.105.52.148]:55664)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e5CVm-0001Qq-Gc
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:13:30 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 8D370146170
	for <qemu-arm@nongnu.org>; Thu, 19 Oct 2017 17:13:29 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id 58A218007A;
	Thu, 19 Oct 2017 17:13:22 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 17:12:45 +0200
Message-Id: <20171019151249.13663-5-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171019151249.13663-1-clg@kaod.org>
References: <20171019151249.13663-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13914152524924816145
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgdekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.52.148
Subject: [Qemu-arm] [PATCH v5 4/8] aspeed: add an I2C RTC device to all
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
X-TUID: DctVDdUXuVLW

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
index f2fc9884dba6..f0a440f81fd6 100644
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
@@ -315,6 +317,10 @@ static void ast2500_evb_i2c_init(AspeedBoardState *b=
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
@@ -341,6 +347,15 @@ static const TypeInfo ast2500_evb_type =3D {
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
@@ -374,6 +389,10 @@ static void witherspoon_bmc_i2c_init(AspeedBoardStat=
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

