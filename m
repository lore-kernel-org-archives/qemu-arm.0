Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp5245627wrr;
        Thu, 14 Nov 2019 01:51:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqz4z5nKTy3QJ95CF/95zdFrJh61EnnotWp6Plld8kaWsF8PSb3hjLNcDHm0FiObvVLSSIYa
X-Received: by 2002:a17:906:b5b:: with SMTP id v27mr7418897ejg.327.1573725073794;
        Thu, 14 Nov 2019 01:51:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573725073; cv=none;
        d=google.com; s=arc-20160816;
        b=yZ3hNI9Tdjn4rwao8UI7EspVyMEVrUvPBs06YmbEsvTX4H5dJB/gwqk6d2mkOHdV6k
         mNLekOH5Xf+bI5k9dzRcnjAkZG6s3T7HjbLaLRZj+nXKpr0yVlDsLsV57foKMu0e3vxG
         fV/PZgMtCfFluw5h0E0apzSd5393XJYYl3vHTn6SgwcyvCBD+YHyGGNp7xLSmvr6YVfR
         nwaYUMRqb2cotAnSq9rGIo98gMlfwBzdlSiM1GdswqBanRu9KdZJcr01rdynDBc0zhna
         bMjQSnogHj1wlLZwkeRAGnR7KwegqBlGYOMoi+pXQfpvYu8dh2bhR6k54of3B3ymS0Bh
         ZYog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=vBbDtvVTz5i7m5qN0JMKePrBb4hGDwLwh1Kdy2HCpms=;
        b=VfnYBKxBa9daoX5YR6svLWzpQAmlDOlCShTA2iEtOcwtK6hMK7uiKobvn5PAkkZTIs
         +Whwhy+5Xkhwk8ulAG0KXZGCzghihKt7oASphNfgMU36nZ3uVFeJZBvQPBV3pWsL5zv3
         S/cK61MUc3A1gMVHahUpVpC0UlODYWCm9wHvgfO3PQK/n68D3bjOimQHwn0SWwqutLvm
         zFZaShtbMAYdYIJh0R+qD+f7SMRsu/LeLMaTbzcYpvmY8eXWJteRlBACdhbq7SFD8Ydu
         oyr8kYb6IJyqGeerYPysfdg25hIkA3ZtErxiuhC0Gk+hM3uf36ceeam10TPYM9FmrJ+C
         MMoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c29si4098970edb.223.2019.11.14.01.51.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2019 01:51:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iVBmS-0003Yp-39
	for alex.bennee@linaro.org; Thu, 14 Nov 2019 04:51:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37375)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iVBhu-0007o0-Vx
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 04:46:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iVBhs-0004Xy-Ux
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 04:46:30 -0500
Received: from 13.mo3.mail-out.ovh.net ([188.165.33.202]:48099)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iVBhr-0004Ub-Jl
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 04:46:28 -0500
Received: from player737.ha.ovh.net (unknown [10.109.159.178])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id E6BB02315E6
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2019 10:46:25 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player737.ha.ovh.net (Postfix) with ESMTPSA id 08BA02A78619;
 Thu, 14 Nov 2019 09:46:19 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 4/5] aspeed: Remove AspeedBoardConfig array and use
 AspeedMachineClass
Date: Thu, 14 Nov 2019 10:45:43 +0100
Message-Id: <20191114094544.30114-5-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114094544.30114-1-clg@kaod.org>
References: <20191114094544.30114-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2481764873567701777
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeffedgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfeejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedu
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.33.202
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fJbZ95Dg1K1c

AspeedBoardConfig is a redundant way to define class attributes and it
complexifies the machine definition and initialization.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed.h |  24 ++---
 hw/arm/aspeed.c         | 231 ++++++++++++++++++++++------------------
 2 files changed, 137 insertions(+), 118 deletions(-)

diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index f49bc7081e4d..4423cd0cda71 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -13,19 +13,6 @@
=20
 typedef struct AspeedBoardState AspeedBoardState;
=20
-typedef struct AspeedBoardConfig {
-    const char *name;
-    const char *desc;
-    const char *soc_name;
-    uint32_t hw_strap1;
-    uint32_t hw_strap2;
-    const char *fmc_model;
-    const char *spi_model;
-    uint32_t num_cs;
-    void (*i2c_init)(AspeedBoardState *bmc);
-    uint32_t ram;
-} AspeedBoardConfig;
-
 #define TYPE_ASPEED_MACHINE       MACHINE_TYPE_NAME("aspeed")
 #define ASPEED_MACHINE(obj) \
     OBJECT_CHECK(AspeedMachine, (obj), TYPE_ASPEED_MACHINE)
@@ -41,7 +28,16 @@ typedef struct AspeedMachine {
=20
 typedef struct AspeedMachineClass {
     MachineClass parent_obj;
-    const AspeedBoardConfig *board;
+
+    const char *name;
+    const char *desc;
+    const char *soc_name;
+    uint32_t hw_strap1;
+    uint32_t hw_strap2;
+    const char *fmc_model;
+    const char *spi_model;
+    uint32_t num_cs;
+    void (*i2c_init)(AspeedBoardState *bmc);
 } AspeedMachineClass;
=20
=20
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 028191ff36fc..e34e6787430b 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -167,10 +167,10 @@ static void aspeed_board_init_flashes(AspeedSMCStat=
e *s, const char *flashtype,
     }
 }
=20
-static void aspeed_board_init(MachineState *machine,
-                              const AspeedBoardConfig *cfg)
+static void aspeed_machine_init(MachineState *machine)
 {
     AspeedBoardState *bmc;
+    AspeedMachineClass *amc =3D ASPEED_MACHINE_GET_CLASS(machine);
     AspeedSoCClass *sc;
     DriveInfo *drive0 =3D drive_get(IF_MTD, 0, 0);
     ram_addr_t max_ram_size;
@@ -182,18 +182,18 @@ static void aspeed_board_init(MachineState *machine=
,
                        UINT32_MAX);
=20
     object_initialize_child(OBJECT(machine), "soc", &bmc->soc,
-                            (sizeof(bmc->soc)), cfg->soc_name, &error_ab=
ort,
+                            (sizeof(bmc->soc)), amc->soc_name, &error_ab=
ort,
                             NULL);
=20
     sc =3D ASPEED_SOC_GET_CLASS(&bmc->soc);
=20
     object_property_set_uint(OBJECT(&bmc->soc), ram_size, "ram-size",
                              &error_abort);
-    object_property_set_int(OBJECT(&bmc->soc), cfg->hw_strap1, "hw-strap=
1",
+    object_property_set_int(OBJECT(&bmc->soc), amc->hw_strap1, "hw-strap=
1",
                             &error_abort);
-    object_property_set_int(OBJECT(&bmc->soc), cfg->hw_strap2, "hw-strap=
2",
+    object_property_set_int(OBJECT(&bmc->soc), amc->hw_strap2, "hw-strap=
2",
                             &error_abort);
-    object_property_set_int(OBJECT(&bmc->soc), cfg->num_cs, "num-cs",
+    object_property_set_int(OBJECT(&bmc->soc), amc->num_cs, "num-cs",
                             &error_abort);
     object_property_set_int(OBJECT(&bmc->soc), machine->smp.cpus, "num-c=
pus",
                             &error_abort);
@@ -230,8 +230,8 @@ static void aspeed_board_init(MachineState *machine,
                           "max_ram", max_ram_size  - ram_size);
     memory_region_add_subregion(&bmc->ram_container, ram_size, &bmc->max=
_ram);
=20
-    aspeed_board_init_flashes(&bmc->soc.fmc, cfg->fmc_model, &error_abor=
t);
-    aspeed_board_init_flashes(&bmc->soc.spi[0], cfg->spi_model, &error_a=
bort);
+    aspeed_board_init_flashes(&bmc->soc.fmc, amc->fmc_model, &error_abor=
t);
+    aspeed_board_init_flashes(&bmc->soc.spi[0], amc->spi_model, &error_a=
bort);
=20
     /* Install first FMC flash content as a boot rom. */
     if (drive0) {
@@ -255,8 +255,8 @@ static void aspeed_board_init(MachineState *machine,
     aspeed_board_binfo.loader_start =3D sc->memmap[ASPEED_SDRAM];
     aspeed_board_binfo.nb_cpus =3D bmc->soc.num_cpus;
=20
-    if (cfg->i2c_init) {
-        cfg->i2c_init(bmc);
+    if (amc->i2c_init) {
+        amc->i2c_init(bmc);
     }
=20
     for (i =3D 0; i < ARRAY_SIZE(bmc->soc.sdhci.slots); i++) {
@@ -383,118 +383,141 @@ static void witherspoon_bmc_i2c_init(AspeedBoardS=
tate *bmc)
                      0x60);
 }
=20
-static void aspeed_machine_init(MachineState *machine)
-{
-    AspeedMachineClass *amc =3D ASPEED_MACHINE_GET_CLASS(machine);
-
-    aspeed_board_init(machine, amc->board);
-}
-
 static void aspeed_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc =3D MACHINE_CLASS(oc);
-    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
-    const AspeedBoardConfig *board =3D data;
=20
-    mc->desc =3D board->desc;
     mc->init =3D aspeed_machine_init;
     mc->max_cpus =3D ASPEED_CPUS_NUM;
     mc->no_floppy =3D 1;
     mc->no_cdrom =3D 1;
     mc->no_parallel =3D 1;
-    if (board->ram) {
-        mc->default_ram_size =3D board->ram;
-    }
-    amc->board =3D board;
 }
=20
-static const TypeInfo aspeed_machine_type =3D {
-    .name =3D TYPE_ASPEED_MACHINE,
-    .parent =3D TYPE_MACHINE,
-    .instance_size =3D sizeof(AspeedMachine),
-    .class_size =3D sizeof(AspeedMachineClass),
-    .abstract =3D true,
+static void aspeed_machine_palmetto_class_init(ObjectClass *oc, void *da=
ta)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       =3D "OpenPOWER Palmetto BMC (ARM926EJ-S)";
+    amc->soc_name  =3D "ast2400-a1";
+    amc->hw_strap1 =3D PALMETTO_BMC_HW_STRAP1;
+    amc->fmc_model =3D "n25q256a";
+    amc->spi_model =3D "mx25l25635e";
+    amc->num_cs    =3D 1;
+    amc->i2c_init  =3D palmetto_bmc_i2c_init;
+    mc->default_ram_size       =3D 256 * MiB;
+};
+
+static void aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void =
*data)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       =3D "Aspeed AST2500 EVB (ARM1176)";
+    amc->soc_name  =3D "ast2500-a1";
+    amc->hw_strap1 =3D AST2500_EVB_HW_STRAP1;
+    amc->fmc_model =3D "w25q256";
+    amc->spi_model =3D "mx25l25635e";
+    amc->num_cs    =3D 1;
+    amc->i2c_init  =3D ast2500_evb_i2c_init;
+    mc->default_ram_size       =3D 512 * MiB;
+};
+
+static void aspeed_machine_romulus_class_init(ObjectClass *oc, void *dat=
a)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       =3D "OpenPOWER Romulus BMC (ARM1176)";
+    amc->soc_name  =3D "ast2500-a1";
+    amc->hw_strap1 =3D ROMULUS_BMC_HW_STRAP1;
+    amc->fmc_model =3D "n25q256a";
+    amc->spi_model =3D "mx66l1g45g";
+    amc->num_cs    =3D 2;
+    amc->i2c_init  =3D romulus_bmc_i2c_init;
+    mc->default_ram_size       =3D 512 * MiB;
 };
=20
-static const AspeedBoardConfig aspeed_boards[] =3D {
+static void aspeed_machine_swift_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       =3D "OpenPOWER Swift BMC (ARM1176)";
+    amc->soc_name  =3D "ast2500-a1";
+    amc->hw_strap1 =3D SWIFT_BMC_HW_STRAP1;
+    amc->fmc_model =3D "mx66l1g45g";
+    amc->spi_model =3D "mx66l1g45g";
+    amc->num_cs    =3D 2;
+    amc->i2c_init  =3D swift_bmc_i2c_init;
+    mc->default_ram_size       =3D 512 * MiB;
+};
+
+static void aspeed_machine_witherspoon_class_init(ObjectClass *oc, void =
*data)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       =3D "OpenPOWER Witherspoon BMC (ARM1176)";
+    amc->soc_name  =3D "ast2500-a1";
+    amc->hw_strap1 =3D WITHERSPOON_BMC_HW_STRAP1;
+    amc->fmc_model =3D "mx25l25635e";
+    amc->spi_model =3D "mx66l1g45g";
+    amc->num_cs    =3D 2;
+    amc->i2c_init  =3D witherspoon_bmc_i2c_init;
+    mc->default_ram_size =3D 512 * MiB;
+};
+
+static void aspeed_machine_ast2600_evb_class_init(ObjectClass *oc, void =
*data)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       =3D "Aspeed AST2600 EVB (Cortex A7)";
+    amc->soc_name  =3D "ast2600-a0";
+    amc->hw_strap1 =3D AST2600_EVB_HW_STRAP1;
+    amc->hw_strap2 =3D AST2600_EVB_HW_STRAP2;
+    amc->fmc_model =3D "w25q512jv";
+    amc->spi_model =3D "mx66u51235f";
+    amc->num_cs    =3D 1;
+    amc->i2c_init  =3D ast2600_evb_i2c_init;
+    mc->default_ram_size =3D 1 * GiB;
+};
+
+static const TypeInfo aspeed_machine_types[] =3D {
     {
-        .name      =3D MACHINE_TYPE_NAME("palmetto-bmc"),
-        .desc      =3D "OpenPOWER Palmetto BMC (ARM926EJ-S)",
-        .soc_name  =3D "ast2400-a1",
-        .hw_strap1 =3D PALMETTO_BMC_HW_STRAP1,
-        .fmc_model =3D "n25q256a",
-        .spi_model =3D "mx25l25635e",
-        .num_cs    =3D 1,
-        .i2c_init  =3D palmetto_bmc_i2c_init,
-        .ram       =3D 256 * MiB,
+        .name          =3D MACHINE_TYPE_NAME("palmetto-bmc"),
+        .parent        =3D TYPE_ASPEED_MACHINE,
+        .class_init    =3D aspeed_machine_palmetto_class_init,
     }, {
-        .name      =3D MACHINE_TYPE_NAME("ast2500-evb"),
-        .desc      =3D "Aspeed AST2500 EVB (ARM1176)",
-        .soc_name  =3D "ast2500-a1",
-        .hw_strap1 =3D AST2500_EVB_HW_STRAP1,
-        .fmc_model =3D "w25q256",
-        .spi_model =3D "mx25l25635e",
-        .num_cs    =3D 1,
-        .i2c_init  =3D ast2500_evb_i2c_init,
-        .ram       =3D 512 * MiB,
+        .name          =3D MACHINE_TYPE_NAME("ast2500-evb"),
+        .parent        =3D TYPE_ASPEED_MACHINE,
+        .class_init    =3D aspeed_machine_ast2500_evb_class_init,
     }, {
-        .name      =3D MACHINE_TYPE_NAME("romulus-bmc"),
-        .desc      =3D "OpenPOWER Romulus BMC (ARM1176)",
-        .soc_name  =3D "ast2500-a1",
-        .hw_strap1 =3D ROMULUS_BMC_HW_STRAP1,
-        .fmc_model =3D "n25q256a",
-        .spi_model =3D "mx66l1g45g",
-        .num_cs    =3D 2,
-        .i2c_init  =3D romulus_bmc_i2c_init,
-        .ram       =3D 512 * MiB,
+        .name          =3D MACHINE_TYPE_NAME("romulus-bmc"),
+        .parent        =3D TYPE_ASPEED_MACHINE,
+        .class_init    =3D aspeed_machine_romulus_class_init,
     }, {
-        .name      =3D MACHINE_TYPE_NAME("swift-bmc"),
-        .desc      =3D "OpenPOWER Swift BMC (ARM1176)",
-        .soc_name  =3D "ast2500-a1",
-        .hw_strap1 =3D SWIFT_BMC_HW_STRAP1,
-        .fmc_model =3D "mx66l1g45g",
-        .spi_model =3D "mx66l1g45g",
-        .num_cs    =3D 2,
-        .i2c_init  =3D swift_bmc_i2c_init,
-        .ram       =3D 512 * MiB,
+        .name          =3D MACHINE_TYPE_NAME("swift-bmc"),
+        .parent        =3D TYPE_ASPEED_MACHINE,
+        .class_init    =3D aspeed_machine_swift_class_init,
     }, {
-        .name      =3D MACHINE_TYPE_NAME("witherspoon-bmc"),
-        .desc      =3D "OpenPOWER Witherspoon BMC (ARM1176)",
-        .soc_name  =3D "ast2500-a1",
-        .hw_strap1 =3D WITHERSPOON_BMC_HW_STRAP1,
-        .fmc_model =3D "mx25l25635e",
-        .spi_model =3D "mx66l1g45g",
-        .num_cs    =3D 2,
-        .i2c_init  =3D witherspoon_bmc_i2c_init,
-        .ram       =3D 512 * MiB,
+        .name          =3D MACHINE_TYPE_NAME("witherspoon-bmc"),
+        .parent        =3D TYPE_ASPEED_MACHINE,
+        .class_init    =3D aspeed_machine_witherspoon_class_init,
     }, {
-        .name      =3D MACHINE_TYPE_NAME("ast2600-evb"),
-        .desc      =3D "Aspeed AST2600 EVB (Cortex A7)",
-        .soc_name  =3D "ast2600-a0",
-        .hw_strap1 =3D AST2600_EVB_HW_STRAP1,
-        .hw_strap2 =3D AST2600_EVB_HW_STRAP2,
-        .fmc_model =3D "w25q512jv",
-        .spi_model =3D "mx66u51235f",
-        .num_cs    =3D 1,
-        .i2c_init  =3D ast2600_evb_i2c_init,
-        .ram       =3D 1 * GiB,
-    },
-};
-
-static void aspeed_machine_types(void)
-{
-    int i;
-
-    type_register_static(&aspeed_machine_type);
-    for (i =3D 0; i < ARRAY_SIZE(aspeed_boards); ++i) {
-        TypeInfo ti =3D {
-            .name       =3D aspeed_boards[i].name,
-            .parent     =3D TYPE_ASPEED_MACHINE,
-            .class_init =3D aspeed_machine_class_init,
-            .class_data =3D (void *)&aspeed_boards[i],
-        };
-        type_register(&ti);
+        .name          =3D MACHINE_TYPE_NAME("ast2600-evb"),
+        .parent        =3D TYPE_ASPEED_MACHINE,
+        .class_init    =3D aspeed_machine_ast2600_evb_class_init,
+    }, {
+        .name          =3D TYPE_ASPEED_MACHINE,
+        .parent        =3D TYPE_MACHINE,
+        .instance_size =3D sizeof(AspeedMachine),
+        .class_size    =3D sizeof(AspeedMachineClass),
+        .class_init    =3D aspeed_machine_class_init,
+        .abstract      =3D true,
     }
-}
+};
=20
-type_init(aspeed_machine_types)
+DEFINE_TYPES(aspeed_machine_types)
--=20
2.21.0

