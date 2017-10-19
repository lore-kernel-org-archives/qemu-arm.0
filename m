Received: by 10.223.197.9 with SMTP id q9csp6632995wrf;
        Thu, 19 Oct 2017 03:07:10 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SOPmalOyDtejlrtYD/F7hwBvNbvhWYJQdbOjkitE0Y0WNxFqK00rDEf+xEl6uiAjjKdg3K
X-Received: by 10.237.59.90 with SMTP id q26mr1161391qte.153.1508407630001;
        Thu, 19 Oct 2017 03:07:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508407629; cv=none;
        d=google.com; s=arc-20160816;
        b=hcPBHwKvOq/XDJUpq3QiKS5ncNCDz8PfzFgvarPAuG39dn9spTsPzEha/OTpGwyil4
         sp6rpC7Ndrs+Wa9YbsXJuXaOW3ReUmM3oWpuqvv0KI6Qz4NmmXaKoOsPrWXmoQ6udemi
         Y2KvGuIKmKA8vvQf/zb55YF+pIgGlQgCRwmL3z6/6f3s/G8LpOwc/DQMK40K++JhGeiR
         tmdq7ihuq7QDW7YFo8ZXIeRQ26/EEsiCdOtikp6+Va9tOR6vdZ5LYVhYbGiQpJyWgRhF
         fID42HNXAIXJYdGkOYKYfxrnpETUMozdw8Y0fwN9y15e9pfM0V6qYopPsU10iUMcrBbY
         nmkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=qU2XkKv9yA5bW+VrhvyA/cR1UYzgugIidAtr46/xNJE=;
        b=ucJMb8TYlILa5oCj8/K0XmK6PdppvUZ5WlVMWOizBjZFpzlqBM8r4QEzzQbi89ZuB6
         Pe/Sc/uxPjZRrXcgZvoqxAPR1WKNZcLloJmaKEIERHLUnOKm12HfrfQ+dq5ybWNtOQ24
         cFOxbLeR3o9jFvN2kJ8ugCILP6F55YelXZ2V6iTeGQvQSwnHB20/ipo16sS34FNjydFC
         VUFbyYK5ktBTaonEQCgpHUrO4ETMlWIZT8oFvF6noWBadNTyIa5HNlqXEwKWb/z1peXN
         VEUg4mxPFER0sp/NFU6l2/+WjHcXN+MjtBp1haPTBE3cxJtz0CFyWMpEUHqiPvSrr2ii
         Dm9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m1si9257081qtk.191.2017.10.19.03.07.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 03:07:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48459 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e57jH-0004Mr-OX
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 06:07:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e57hB-00033S-J1
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 06:05:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e57h5-0008Gy-RW
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 06:04:57 -0400
Received: from 18.mo5.mail-out.ovh.net ([178.33.45.10]:59376)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e57h5-0008Ev-Kl
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 06:04:51 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 24DC41406BC
	for <qemu-devel@nongnu.org>; Thu, 19 Oct 2017 12:04:50 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id DC53580089;
	Thu, 19 Oct 2017 12:04:42 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 12:04:06 +0200
Message-Id: <20171019100410.26239-5-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171019100410.26239-1-clg@kaod.org>
References: <20171019100410.26239-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8701517433232853777
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.45.10
Subject: [Qemu-devel] [PATCH v4 4/8] aspeed: add an I2C RTC device to all
 machines
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GFOwKP6zVLZ6

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
index 9e1f8b80d2a5..8683388e632c 100644
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
@@ -321,6 +323,10 @@ static void ast2500_evb_i2c_init(AspeedBoardState *b=
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
@@ -347,6 +353,15 @@ static const TypeInfo ast2500_evb_type =3D {
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
@@ -380,6 +395,10 @@ static void witherspoon_bmc_i2c_init(AspeedBoardStat=
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

