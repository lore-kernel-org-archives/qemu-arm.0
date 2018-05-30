Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4399959wre;
        Tue, 29 May 2018 23:41:50 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKITOWsyg8VSasaZNOMrIOzb+ig9Y8Dey//yHC5QP0sH1TkTaYYDSr5gTjkM1ORedjpo5cGo
X-Received: by 2002:a0c:c592:: with SMTP id a18-v6mr1297112qvj.227.1527662510046;
        Tue, 29 May 2018 23:41:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527662510; cv=none;
        d=google.com; s=arc-20160816;
        b=B++oDTT+DS8UmcbD7DofQsNd4kwHZ4eBCjScDbPoByap6DWH4unSTuOjAoCVIa1Hgj
         xQG/bEfB9Ofou4AcBwGJIYqEP1faxE974iUsd6n7rLd39KH/GDPrXxIoX1O5k7i7fzaC
         IsA2LXump7Le4QIY4pK9Lz0jl7L+W3yJBIzDQ04LkFekx5xXCbU5NwRNfWStTE1LEQ5j
         7to3wNHuuimCXIfmdKU+cMdCe8pnDp+O1E9cGTOXpPkVdGddjzieR8tpIYDgqgPJ5s/8
         NMNzLNG6qt93DzF8A/G+qVgm6DTH6vlG0Yb8STJB1mTx74Ep8PVIdZKuLpE4yfO/AdsX
         9/rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=d/5pM4Y1B6fhTJMWAcHeiKoiHPxmlRdrOqvCF1//w5w=;
        b=LwiEyFwEYfZzZb29gW4kBkxqNgLkf3xQcG+W6EUrbKUBmqMNUUuGxVl0FcHIbSfOjt
         tLJMpz5Y0315A84wT74f9xhDtd1veckeubdV/dsApCCBjAeYbqBzAbL1bBPMC68BAkOV
         dQ7H5cGWMlxSQsZyaC17hdLKKr6DO3AS6DFBqhddt/hOPKRY81jrXutLLVYHpmoWJn/r
         1CCAW47PkwtI0fxgSgSVJDgFYeWpNHDXocjyDLG7R42FrUB1Sr13AvRo3b5q7IAUgk3i
         57vLwKFaf3sFQdHzGDVGtETKTCMXIbrmSre14iQTH6BOzBZ4jL1e8wDSo+P76idIvU13
         M82Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h18-v6si2250778qtb.333.2018.05.29.23.41.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 23:41:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36508 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNunt-0002O3-EG
	for alex.bennee@linaro.org; Wed, 30 May 2018 02:41:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNunY-0002HX-8k
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:41:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNunU-00017i-Ad
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:41:28 -0400
Received: from 1.mo1.mail-out.ovh.net ([178.32.127.22]:34682)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNunU-00015j-4q
	for qemu-arm@nongnu.org; Wed, 30 May 2018 02:41:24 -0400
Received: from player159.ha.ovh.net (unknown [10.109.105.80])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id A2E3510005D
	for <qemu-arm@nongnu.org>; Wed, 30 May 2018 08:41:22 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player159.ha.ovh.net (Postfix) with ESMTPSA id 53EBC4800B2;
	Wed, 30 May 2018 08:41:15 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 May 2018 08:40:44 +0200
Message-Id: <20180530064049.27976-3-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180530064049.27976-1-clg@kaod.org>
References: <20180530064049.27976-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 5157184523394779921
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheelgdduuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.127.22
Subject: [Qemu-arm] [PATCH v7 2/7] aspeed: add support for the
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
X-TUID: wcMGSGHdPGQL

The Witherspoon boards are OpenPOWER system hosting POWER9 Processors.
Add support for their BMC including a couple of I2C devices as found
on real HW.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 133614a4384d..96790af0cf50 100644
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
@@ -343,11 +356,47 @@ static const TypeInfo romulus_bmc_type =3D {
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

