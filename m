Received: by 10.223.197.9 with SMTP id q9csp804984wrf;
        Fri, 13 Oct 2017 07:29:51 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBJbcKT8Gqc4Wwtx9xTsAwtY33dISkttVuI4JILQ7azAQuiNLVDLQ6e2MbB2AxSVtlAEdSv
X-Received: by 10.200.6.6 with SMTP id d6mr2415544qth.230.1507904991453;
        Fri, 13 Oct 2017 07:29:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507904991; cv=none;
        d=google.com; s=arc-20160816;
        b=S6dQ0Fm+Sym7h4u8QExvqDGzNZyPYZlu+pUwbIo49UrBobyIM0qExtQ1GVSeg9f3X8
         8HlnM/ybRFsMSHdDbZMRIegv7wVX+OKIoT5Twz4PoiwYxW1tf1LHbijfHRHagkv3U5Zm
         VuyQ543D7jqsG29XNJlOwKfkjcL77WPcmqlUczTmNAooxP/0/ggKucH8UW5QKbuA5hw5
         ToA3QDFAmL5p74QZgQiIJeTKXrhGC2BCixcOo6v02ID49I1Vl7zUcXBs+exsOyjV+pyN
         B7qmdYzvidzMs4sK/B7q1WC1z56n5s4lD66JWARn8EhMDwv4Bky+EjiouS9KGNAjjmGf
         a7nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=QLl1fhBx+7Rzdu15jFzaTIYXVdfCvMu3y6FuP55w7E8=;
        b=Gtp6zEsy/gaPoNkrvW+dY3UPT4zK8jFbMaweH2vOaGOzvfRDrXmgPnFeW+Hj5uY5sL
         WtYXuEfctP9nK3Y65jc8wEo1Lr0LgFtNfeagbTvKfErIqgBOvaSKfvZB1sURNJ0gFqw1
         ed3U4QG1c3J1V6oB4wZiWzYwL/svvyBvUocDqCdfxTuG4DBPb6vokYABFWt1QwwFTr0b
         k1We5R4ccGpawibsA4wW94oY2zejtFB5b9QueFJPktQ+C6eSnT5HykXxJnngmssYATSb
         uAMoC0iRRHZM+Or3TVOy8osftSnOXC2Vk5bjR3nfviLljgZ7fKTFsbsTag4lcKEFbYkd
         3ewg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r15si915744qtk.70.2017.10.13.07.29.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Oct 2017 07:29:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50560 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e30yC-00058f-Kf
	for alex.bennee@linaro.org; Fri, 13 Oct 2017 10:29:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e30xz-000568-QK
	for qemu-arm@nongnu.org; Fri, 13 Oct 2017 10:29:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e30xv-0000ZY-RH
	for qemu-arm@nongnu.org; Fri, 13 Oct 2017 10:29:35 -0400
Received: from 5.mo4.mail-out.ovh.net ([188.165.44.50]:47621)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e30xv-0000W8-LJ
	for qemu-arm@nongnu.org; Fri, 13 Oct 2017 10:29:31 -0400
Received: from player159.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 4C06EE60B7
	for <qemu-arm@nongnu.org>; Fri, 13 Oct 2017 16:29:22 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player159.ha.ovh.net (Postfix) with ESMTPSA id 74164480095;
	Fri, 13 Oct 2017 16:29:14 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Oct 2017 16:28:47 +0200
Message-Id: <20171013142852.916-2-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171013142852.916-1-clg@kaod.org>
References: <20171013142852.916-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 14826412925235596049
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrtdeigdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.44.50
Subject: [Qemu-arm] [PATCH v3 1/6] aspeed: add support for the
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
X-TUID: D517HnM49rcb

The Witherspoon boards are OpenPOWER system hosting POWER9 Processors.
Let's add support for their BMC including a couple of I2C devices as
found on real HW.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---

 Changes since v2:

 - removed 'ignore_memory_transaction_failures' flag on the machine.
   Will require a couple of fixes in the legacy U-Boot accessing wrongly
   the bss before the DRAM is initialized.

   The HW drops the write access surely because the SMC controller is
   configured in autoread mode by default. I don't know how to model
   this behavior in QEMU. I think we would need suppport to boot from
   a MMIO region.

 - Added a comment on the I2C device used.

 hw/arm/aspeed.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index ab895ad490af..5e0b9a184b9c 100644
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
@@ -337,11 +350,47 @@ static const TypeInfo romulus_bmc_type =3D {
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

