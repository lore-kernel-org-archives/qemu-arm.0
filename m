Received: by 10.223.197.9 with SMTP id q9csp7007606wrf;
        Thu, 19 Oct 2017 09:43:16 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+R0ARrwJqURphpxL1JbTZulS5MNoTUHk8IqRYN9acojb8g88IV8gP6TwePJmhFSCQSp+1EJ
X-Received: by 10.200.43.167 with SMTP id m36mr2798826qtm.174.1508431396818;
        Thu, 19 Oct 2017 09:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508431396; cv=none;
        d=google.com; s=arc-20160816;
        b=JaEr1EyWwy5tEEnKmi+4CEyUbgSqcmk/dIlrNnxKpK2feTA/iGcuH6DAm+jcXRa0aa
         31CB7bdF6EyAzoqGeajUEfnMt5cROJoEitWR84qdflSkbFQ4Yezx6SzKGdd4p1Zv99/E
         v1zNMEz8uFDve/C3Zn+o24u9p8bQRutDmo4+9CNxECWea1uAp3LXY94FzsZ9QdHOM/gX
         Nu8Pm/LBovsO9GkhnmzZ5kIM1n6u3H8NpC7phXq6GHYcD6OS7zJfPmcPdbEGnoBmqM5l
         it0gFAzy7HYcSc4ff1b9Pa2qhit0MCaH2LvDtTKA8eIU/kJxuif2+hJaKmrj+M4jwvxY
         0RzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=de5Vltp3De5qc+++iREWzVLGeANFErEvj3DOXJ3wm1A=;
        b=lMZVAd9yT4fzMRHiUUdJwJXXSr4OjnKcCTd7ACbm9rOf/GcPzch62kJdHtv+oE8gpY
         j2maEHuBLOdYlhgKaUh7lf0f8ammgcc5eS9zv8uDBHhmv6EFCDJwNEzDxSx0gSs5ITrz
         78mCrkL5h6BiSLQ+wEGd4RK0zjLnzuAd/rm7TkrLO+Jo2gTsuSuITjhNoDzqUcxMwCNd
         t/Z8+XJC2i6exB+bm1M00/1AFCId+GjDD9RDgBcZV/5UFeRE3j5njAGX0VUTcjwulYUE
         Bx1uds1aMOg3OBTIlX45BMhoOggLndBaWR+ZE8YUuHxdXnHjC9ya6OVo/+05ZItjPXZM
         bhTg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id m2si2976493qkb.274.2017.10.19.09.43.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 09:43:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50174 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5Duc-0006my-KH
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 12:43:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5Dnz-0001Hs-D8
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 12:36:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5Dnv-0003Z1-6L
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 12:36:23 -0400
Received: from 5.mo5.mail-out.ovh.net ([87.98.173.103]:47446)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e5Dnu-0003Yd-VL
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 12:36:19 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id A029E1461BF
	for <qemu-arm@nongnu.org>; Thu, 19 Oct 2017 18:36:17 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id 7265F80086;
	Thu, 19 Oct 2017 18:36:10 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 18:35:41 +0200
Message-Id: <20171019163546.2039-4-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171019163546.2039-1-clg@kaod.org>
References: <20171019163546.2039-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 15312520208142011153
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgddutdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.173.103
Subject: [Qemu-arm] [PATCH v6 3/8] aspeed: add support for the
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
X-TUID: 5u3wzdx0vEsr

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
index ff486b172104..93eda2082e7d 100644
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
@@ -355,11 +368,47 @@ static const TypeInfo romulus_bmc_type =3D {
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

