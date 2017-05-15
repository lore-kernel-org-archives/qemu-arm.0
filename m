Received: by 10.25.0.6 with SMTP id 6csp1263476lfa;
        Sun, 14 May 2017 22:54:00 -0700 (PDT)
X-Received: by 10.55.21.224 with SMTP id 93mr3950098qkv.144.1494827639941;
        Sun, 14 May 2017 22:53:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494827639; cv=none;
        d=google.com; s=arc-20160816;
        b=i7SUVGlwe456fcSkHQUVdT1NeG3vzYH8zAsUyDxj03MJdHsuSqWbv4Tap/sSVsBCn7
         fXxloOR79HOs+A2NZbfyFA8RT449vOSfQejbTtA5KNqlh8GPssYA2I1palfbAUdQ/Lo4
         wXD5CvxHvXc369MUQEEMG23TD+yMJtz9BLwBRtDLMTivviUK/IqjhkA6AILzSW1Ln4dh
         HB2WylIJ+4EcjZIsefRNHwrB1x8520z8Xnb0/O8IQhokIMSLc4x+Gvm4w0Q8GPeVFCx2
         DIu/TU9KIxurhmO/23GkY9MLIBMHtOMw1W8RkSJOsYU+5pPU6yO6ILKZnWIM9MBBbeSN
         OCTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=DZKWezNBvc9OSxuxEQwF91OwkjQjmfQHPIPluikd0Bo=;
        b=osUE9H0zuSv0w1FFqsq4ZpvKcU+Z1ull7S1PkGGwVhD94csq+miYvPwRPm5LG8CrV0
         NCUMQdUK9FtefVoI3bsMS4W1n26HzA9mku1WO5AVTiNmNC3jL29Lbn/3bUMhjxRu/qpA
         9PY4Cg/P5lIN/BBV+xGHWeKe8QucXEnyMiA1JYpu5uFdkHN0pv1ZCXDrEsO3jiEumnxB
         8fl47bYujQbR99zYKEGyGhUJlCIP0o2wSnPm9XWKXyRUh/RHQQ3Ug7SLas8LeXsNVUSb
         6/35UoiV4AIwYn0ihGy1baB/yPXSv95Csx8tPcxzMDKWMXBQR6+CXNhNIFTI/JuAOj0E
         Kt5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p68si3252694qkb.237.2017.05.14.22.53.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 14 May 2017 22:53:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34908 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dA8xD-0001rO-E2
	for alex.bennee@linaro.org; Mon, 15 May 2017 01:53:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dA8uz-00080m-Cb
	for qemu-arm@nongnu.org; Mon, 15 May 2017 01:51:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dA8uy-0001Fe-EU
	for qemu-arm@nongnu.org; Mon, 15 May 2017 01:51:41 -0400
Received: from 1.mo4.mail-out.ovh.net ([178.33.248.196]:46159)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1dA8uy-0001EP-8N
	for qemu-arm@nongnu.org; Mon, 15 May 2017 01:51:40 -0400
Received: from player772.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 2D94961E45
	for <qemu-arm@nongnu.org>; Mon, 15 May 2017 07:51:39 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
	[90.89.233.27]) (Authenticated sender: clg@kaod.org)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id 0DD98740074;
	Mon, 15 May 2017 07:51:35 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 May 2017 07:51:14 +0200
Message-Id: <1494827476-1487-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494827476-1487-1-git-send-email-clg@kaod.org>
References: <1494827476-1487-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 4749890234862439185
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedruddvgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.248.196
Subject: [Qemu-arm] [PATCH 4/6] aspeed: add some I2C devices to the Aspeed
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JN9bfJAfSzdt

Let's add an RTC to the palmetto BMC and a LM75 temperature sensor to
the AST2500 EVB to start with.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 283c03881493..e824ea87a9af 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -39,6 +39,7 @@ typedef struct AspeedBoardConfig {
     const char *fmc_model;
     const char *spi_model;
     uint32_t num_cs;
+    void (*i2c_init)(AspeedBoardState *bmc);
 } AspeedBoardConfig;
=20
 enum {
@@ -82,6 +83,9 @@ enum {
         SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              =
\
         SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
=20
+static void palmetto_bmc_i2c_init(AspeedBoardState *bmc);
+static void ast2500_evb_i2c_init(AspeedBoardState *bmc);
+
 static const AspeedBoardConfig aspeed_boards[] =3D {
     [PALMETTO_BMC] =3D {
         .soc_name  =3D "ast2400-a1",
@@ -89,6 +93,7 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
         .fmc_model =3D "n25q256a",
         .spi_model =3D "mx25l25635e",
         .num_cs    =3D 1,
+        .i2c_init  =3D palmetto_bmc_i2c_init,
     },
     [AST2500_EVB]  =3D {
         .soc_name  =3D "ast2500-a1",
@@ -96,6 +101,7 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
         .fmc_model =3D "n25q256a",
         .spi_model =3D "mx25l25635e",
         .num_cs    =3D 1,
+        .i2c_init  =3D ast2500_evb_i2c_init,
     },
     [ROMULUS_BMC]  =3D {
         .soc_name  =3D "ast2500-a1",
@@ -223,9 +229,22 @@ static void aspeed_board_init(MachineState *machine,
     aspeed_board_binfo.ram_size =3D ram_size;
     aspeed_board_binfo.loader_start =3D sc->info->sdram_base;
=20
+    if (cfg->i2c_init) {
+        cfg->i2c_init(bmc);
+    }
+
     arm_load_kernel(ARM_CPU(first_cpu), &aspeed_board_binfo);
 }
=20
+static void palmetto_bmc_i2c_init(AspeedBoardState *bmc)
+{
+    AspeedSoCState *soc =3D &bmc->soc;
+
+    /* The palmetto platform expects a ds3231 RTC but a ds1338 is
+     * enough to provide basic RTC features. Alarms will be missing */
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 0), "ds1338",=
 0x68);
+}
+
 static void palmetto_bmc_init(MachineState *machine)
 {
     aspeed_board_init(machine, &aspeed_boards[PALMETTO_BMC]);
@@ -250,6 +269,14 @@ static const TypeInfo palmetto_bmc_type =3D {
     .class_init =3D palmetto_bmc_class_init,
 };
=20
+static void ast2500_evb_i2c_init(AspeedBoardState *bmc)
+{
+    AspeedSoCState *soc =3D &bmc->soc;
+
+    /* The AST2500 EVB expects a LM75 but a TMP105 is compatible */
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7), "tmp105",=
 0x4d);
+}
+
 static void ast2500_evb_init(MachineState *machine)
 {
     aspeed_board_init(machine, &aspeed_boards[AST2500_EVB]);
--=20
2.7.4

