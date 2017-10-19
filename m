Received: by 10.223.197.9 with SMTP id q9csp6631210wrf;
        Thu, 19 Oct 2017 03:05:07 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TMEwpitzJxTw4nsg/56I2a1frKogp8zuj3Gg+BaQPQaXS1Z1iiWzBNw5kIXDnKagifIeO+
X-Received: by 10.55.31.77 with SMTP id f74mr1072349qkf.201.1508407507760;
        Thu, 19 Oct 2017 03:05:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508407507; cv=none;
        d=google.com; s=arc-20160816;
        b=MIKClrERzs/FQEzyIOHEJceOyPh9/HjxAkLYfBC4IRjlpTNSUUUt0ebjBUqSHOvFEX
         Uin0VcLfsE4Qp74H34WYCUWrGFDFOgi2PYyizVywhRkNFShgH6JUdOERs0euwRrr46J+
         8E3HtoVR0k+540PWySHNUQOaNUA23XLo6W4H/Z/NJki2il+pBNpbv+gw/b01LGlLi6Lg
         RD6vG+Qskdsj7r6KUlQ/0YJs6C7KwUsg0Bz6Ops7Dqh9BBcc91NbNQah+IRv/RQzg+zQ
         fm9ISop+kmm75a+8zqcnMYZgimSAMraj3qRn3t/o+jkk5CLI0Ao5jiwteOrOUgALk3Q8
         jj6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=gPpXlFTICgsAbBdA6hLk0t9O6KK2hWGS6DmPp5peTP4=;
        b=mbtUIJMaDwBfiwnF8G6F1WX0HE82s5/qw8snPk2YA+E4eAofgSPYynPntLJD5UgtE3
         D9bnjyLGajDsrrREygLwfEOhc0Kg65fGZ5LOsEmkwL3qzJGe+COXBISVvmfnoWrwopkg
         QUXZdUyS03d82ZrF2b8bgr17CTr+b4Ttuw15pS1bocdvvedXndOqCe3+GJBXBjvOLrGG
         B2DIz6cxamevFsH4s1qFErQtNStQuJmldqyWgakVDqzL6SDFWF+nnoJd+S6SrvMPfCvh
         u/xmm51Yv/D3nyr580qb0GBWmh43MT/1wosep4PnzH1E6kJAVNoj8lmyg0rqaRpWptHI
         nhQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q56si403820qta.21.2017.10.19.03.05.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 03:05:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48449 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e57hJ-00030J-EF
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 06:05:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43589)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e57h1-0002vp-8X
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 06:04:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e57gy-00087i-Kj
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 06:04:47 -0400
Received: from 1.mo5.mail-out.ovh.net ([188.165.57.91]:34989)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e57gy-00086i-Dm
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 06:04:44 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id EB36C13F1D2
	for <qemu-arm@nongnu.org>; Thu, 19 Oct 2017 12:04:42 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id AD27B80089;
	Thu, 19 Oct 2017 12:04:35 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 12:04:05 +0200
Message-Id: <20171019100410.26239-4-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171019100410.26239-1-clg@kaod.org>
References: <20171019100410.26239-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8699265632657902353
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.57.91
Subject: [Qemu-arm] [PATCH v4 3/8] aspeed: add support for the
 witherspoon-bmc board
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
X-TUID: dXWyeI4vtuF4

The Witherspoon boards are OpenPOWER system hosting POWER9 Processors.
Let's add support for their BMC including a couple of I2C devices as
found on real HW.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---

 Changes since v2:

 - removed 'ignore_memory_transaction_failures' flag on the machine.
 - Added a comment on the I2C device used.

 hw/arm/aspeed.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index dbb02f568462..9e1f8b80d2a5 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -46,6 +46,7 @@ enum {
     PALMETTO_BMC,
     AST2500_EVB,
     ROMULUS_BMC,
+    WITHERSPOON_BMC,
 };
=20
 /* Palmetto hardware value: 0x120CE416 */
@@ -83,8 +84,12 @@ enum {
         SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              =
\
         SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
=20
+/* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) *=
/
+#define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
+
 static void palmetto_bmc_i2c_init(AspeedBoardState *bmc);
 static void ast2500_evb_i2c_init(AspeedBoardState *bmc);
+static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc);
=20
 static const AspeedBoardConfig aspeed_boards[] =3D {
     [PALMETTO_BMC] =3D {
@@ -110,6 +115,14 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
         .spi_model =3D "mx66l1g45g",
         .num_cs    =3D 2,
     },
+    [WITHERSPOON_BMC]  =3D {
+        .soc_name  =3D "ast2500-a1",
+        .hw_strap1 =3D WITHERSPOON_BMC_HW_STRAP1,
+        .fmc_model =3D "mx25l25635e",
+        .spi_model =3D "mx66l1g45g",
+        .num_cs    =3D 2,
+        .i2c_init  =3D witherspoon_bmc_i2c_init,
+    },
 };
=20
 #define FIRMWARE_ADDR 0x0
@@ -358,11 +371,47 @@ static const TypeInfo romulus_bmc_type =3D {
     .class_init =3D romulus_bmc_class_init,
 };
=20
+static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
+{
+    AspeedSoCState *soc =3D &bmc->soc;
+
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "tmp423",=
 0x4c);
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 5), "tmp423",=
 0x4c);
+
+    /* The Witherspoon expects a TMP275 but a TMP105 is compatible */
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), "tmp105",=
 0x4a);
+}
+
+static void witherspoon_bmc_init(MachineState *machine)
+{
+    aspeed_board_init(machine, &aspeed_boards[WITHERSPOON_BMC]);
+}
+
+static void witherspoon_bmc_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+
+    mc->desc =3D "OpenPOWER Witherspoon BMC (ARM1176)";
+    mc->init =3D witherspoon_bmc_init;
+    mc->max_cpus =3D 1;
+    mc->no_sdcard =3D 1;
+    mc->no_floppy =3D 1;
+    mc->no_cdrom =3D 1;
+    mc->no_parallel =3D 1;
+}
+
+static const TypeInfo witherspoon_bmc_type =3D {
+    .name =3D MACHINE_TYPE_NAME("witherspoon-bmc"),
+    .parent =3D TYPE_MACHINE,
+    .class_init =3D witherspoon_bmc_class_init,
+};
+
 static void aspeed_machine_init(void)
 {
     type_register_static(&palmetto_bmc_type);
     type_register_static(&ast2500_evb_type);
     type_register_static(&romulus_bmc_type);
+    type_register_static(&witherspoon_bmc_type);
 }
=20
 type_init(aspeed_machine_init)
--=20
2.13.6

