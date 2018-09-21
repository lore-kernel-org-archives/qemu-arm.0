Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3327205wrd;
        Fri, 21 Sep 2018 09:21:01 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60Qfb+INdEASsVJO+FwIPfduzMcip4P6NP/aGmd1Q2AJ8tlgIRzfXIMsl7nlyWaM4yRQsYT
X-Received: by 2002:a37:29e4:: with SMTP id p97-v6mr1501789qkp.331.1537546861607;
        Fri, 21 Sep 2018 09:21:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537546861; cv=none;
        d=google.com; s=arc-20160816;
        b=EwJdxGr5iV/kSQEcUcywu4uOYhygZap9DvgFTDbUCmfaUsPOzcD+WDhrFevWC01ISe
         DnsgC/A2iR3GoZIOm2OZEC7nUDuUtXWg/7L7RJ82diHpGHDd3b2cRe4BY+uXCCu2bXQH
         OePRxaNPKRmq9Seydcims/IVk/eWod4XK7w2dMaLXH6WyAakeAS34sgoZ77iORgKNRf6
         6UNtazxH6ZlBLDF6Y8hLu9wxMKmA9TS7kIrYNB3lZB4zRzPuN/hpcoSGPgHjjHtal0gp
         l4XhuBl3Q7I8wEG7aPyYRCgRI6mUDQ2bFUguIakCHKjJ4MhFlfN35t+2qr0K09+H2PFZ
         wPzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=JzZ3vmM0WBayBDXNAOUTyWXWqOfXVM1mZXxMNYNDE/8=;
        b=J4MEDukUX2Zmrc9r/AGO5o9vk0PFXOWY8r9ccp9FUZmz7i5bdUCIN0ECUSyVdH9ETR
         ghTxoROQxnsWR65FakveH47mUpccfPkd3esUEt1WD0GG+4QDpNfmKx8Ph38cG/kZ6VBc
         AxFAaOnVG7oSOn1AZJvuCIz6F+pnaEyzuN3JMWGN8zx9fiivXSebW2+PpdW0wk88SGf8
         x50mmCw73PZb/33Mu68A5s35wE+JaLcefmp+IZdqp/c+fBNDrVZDgXjZGxdAogo2/Tz6
         uwfQLLo2/M6v5wNF0CNEk1Js+3oV0QcODV4rTQOX3cqkakrOSZcVFzIqRMP5uqxI9o6T
         u9uw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p17-v6si293573qtq.136.2018.09.21.09.21.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 09:21:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56422 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3OAv-0004GP-3o
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 12:21:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g3OAQ-0004AV-T3
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 12:20:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g3OAN-0003xF-EH
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 12:20:30 -0400
Received: from 10.mo68.mail-out.ovh.net ([46.105.79.203]:44338)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g3OAN-0003vl-83
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 12:20:27 -0400
Received: from player799.ha.ovh.net (unknown [10.109.146.19])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id ACACCFCE33
	for <qemu-arm@nongnu.org>; Fri, 21 Sep 2018 18:20:25 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player799.ha.ovh.net (Postfix) with ESMTPSA id 2EC6352008F;
	Fri, 21 Sep 2018 18:20:16 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 21 Sep 2018 18:19:31 +0200
Message-Id: <20180921161939.822-4-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180921161939.822-1-clg@kaod.org>
References: <20180921161939.822-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1894045122383350592
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrledvgddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.79.203
Subject: [Qemu-arm] [PATCH v2 03/11] hw/arm/aspeed: Add an Aspeed machine
 class
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dxl+sJK70R8K

The code looks better, it removes duplicated lines and it will ease
the introduction of common properties for the Aspeed machines.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 include/hw/arm/aspeed.h |  46 +++++++++
 hw/arm/aspeed.c         | 212 +++++++++++++---------------------------
 2 files changed, 116 insertions(+), 142 deletions(-)
 create mode 100644 include/hw/arm/aspeed.h

diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
new file mode 100644
index 000000000000..325c091d09e4
--- /dev/null
+++ b/include/hw/arm/aspeed.h
@@ -0,0 +1,46 @@
+/*
+ * Aspeed Machines
+ *
+ * Copyright 2018 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+#ifndef ARM_ASPEED_H
+#define ARM_ASPEED_H
+
+#include "hw/boards.h"
+
+typedef struct AspeedBoardState AspeedBoardState;
+
+typedef struct AspeedBoardConfig {
+    const char *name;
+    const char *desc;
+    const char *soc_name;
+    uint32_t hw_strap1;
+    const char *fmc_model;
+    const char *spi_model;
+    uint32_t num_cs;
+    void (*i2c_init)(AspeedBoardState *bmc);
+} AspeedBoardConfig;
+
+#define TYPE_ASPEED_MACHINE       MACHINE_TYPE_NAME("aspeed")
+#define ASPEED_MACHINE(obj) \
+    OBJECT_CHECK(AspeedMachine, (obj), TYPE_ASPEED_MACHINE)
+
+typedef struct AspeedMachine {
+    MachineState parent_obj;
+} AspeedMachine;
+
+#define ASPEED_MACHINE_CLASS(klass) \
+     OBJECT_CLASS_CHECK(AspeedMachineClass, (klass), TYPE_ASPEED_MACHINE=
)
+#define ASPEED_MACHINE_GET_CLASS(obj) \
+     OBJECT_GET_CLASS(AspeedMachineClass, (obj), TYPE_ASPEED_MACHINE)
+
+typedef struct AspeedMachineClass {
+    MachineClass parent_obj;
+    const AspeedBoardConfig *board;
+} AspeedMachineClass;
+
+
+#endif
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index f2d64e45511a..6b33ecd5aa43 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -15,6 +15,7 @@
 #include "cpu.h"
 #include "exec/address-spaces.h"
 #include "hw/arm/arm.h"
+#include "hw/arm/aspeed.h"
 #include "hw/arm/aspeed_soc.h"
 #include "hw/boards.h"
 #include "hw/i2c/smbus.h"
@@ -34,22 +35,6 @@ typedef struct AspeedBoardState {
     MemoryRegion max_ram;
 } AspeedBoardState;
=20
-typedef struct AspeedBoardConfig {
-    const char *soc_name;
-    uint32_t hw_strap1;
-    const char *fmc_model;
-    const char *spi_model;
-    uint32_t num_cs;
-    void (*i2c_init)(AspeedBoardState *bmc);
-} AspeedBoardConfig;
-
-enum {
-    PALMETTO_BMC,
-    AST2500_EVB,
-    ROMULUS_BMC,
-    WITHERSPOON_BMC,
-};
-
 /* Palmetto hardware value: 0x120CE416 */
 #define PALMETTO_BMC_HW_STRAP1 (                                        =
\
         SCU_AST2400_HW_STRAP_DRAM_SIZE(DRAM_SIZE_256MB) |               =
\
@@ -88,46 +73,6 @@ enum {
 /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) *=
/
 #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
=20
-static void palmetto_bmc_i2c_init(AspeedBoardState *bmc);
-static void ast2500_evb_i2c_init(AspeedBoardState *bmc);
-static void romulus_bmc_i2c_init(AspeedBoardState *bmc);
-static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc);
-
-static const AspeedBoardConfig aspeed_boards[] =3D {
-    [PALMETTO_BMC] =3D {
-        .soc_name  =3D "ast2400-a1",
-        .hw_strap1 =3D PALMETTO_BMC_HW_STRAP1,
-        .fmc_model =3D "n25q256a",
-        .spi_model =3D "mx25l25635e",
-        .num_cs    =3D 1,
-        .i2c_init  =3D palmetto_bmc_i2c_init,
-    },
-    [AST2500_EVB]  =3D {
-        .soc_name  =3D "ast2500-a1",
-        .hw_strap1 =3D AST2500_EVB_HW_STRAP1,
-        .fmc_model =3D "w25q256",
-        .spi_model =3D "mx25l25635e",
-        .num_cs    =3D 1,
-        .i2c_init  =3D ast2500_evb_i2c_init,
-    },
-    [ROMULUS_BMC]  =3D {
-        .soc_name  =3D "ast2500-a1",
-        .hw_strap1 =3D ROMULUS_BMC_HW_STRAP1,
-        .fmc_model =3D "n25q256a",
-        .spi_model =3D "mx66l1g45g",
-        .num_cs    =3D 2,
-        .i2c_init  =3D romulus_bmc_i2c_init,
-    },
-    [WITHERSPOON_BMC]  =3D {
-        .soc_name  =3D "ast2500-a1",
-        .hw_strap1 =3D WITHERSPOON_BMC_HW_STRAP1,
-        .fmc_model =3D "mx25l25635e",
-        .spi_model =3D "mx66l1g45g",
-        .num_cs    =3D 2,
-        .i2c_init  =3D witherspoon_bmc_i2c_init,
-    },
-};
-
 /*
  * The max ram region is for firmwares that scan the address space
  * with load/store to guess how much RAM the SoC has.
@@ -313,30 +258,6 @@ static void palmetto_bmc_i2c_init(AspeedBoardState *=
bmc)
     object_property_set_int(OBJECT(dev), 110000, "temperature3", &error_=
abort);
 }
=20
-static void palmetto_bmc_init(MachineState *machine)
-{
-    aspeed_board_init(machine, &aspeed_boards[PALMETTO_BMC]);
-}
-
-static void palmetto_bmc_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc =3D MACHINE_CLASS(oc);
-
-    mc->desc =3D "OpenPOWER Palmetto BMC (ARM926EJ-S)";
-    mc->init =3D palmetto_bmc_init;
-    mc->max_cpus =3D 1;
-    mc->no_sdcard =3D 1;
-    mc->no_floppy =3D 1;
-    mc->no_cdrom =3D 1;
-    mc->no_parallel =3D 1;
-}
-
-static const TypeInfo palmetto_bmc_type =3D {
-    .name =3D MACHINE_TYPE_NAME("palmetto-bmc"),
-    .parent =3D TYPE_MACHINE,
-    .class_init =3D palmetto_bmc_class_init,
-};
-
 static void ast2500_evb_i2c_init(AspeedBoardState *bmc)
 {
     AspeedSoCState *soc =3D &bmc->soc;
@@ -353,30 +274,6 @@ static void ast2500_evb_i2c_init(AspeedBoardState *b=
mc)
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "ds1338"=
, 0x32);
 }
=20
-static void ast2500_evb_init(MachineState *machine)
-{
-    aspeed_board_init(machine, &aspeed_boards[AST2500_EVB]);
-}
-
-static void ast2500_evb_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc =3D MACHINE_CLASS(oc);
-
-    mc->desc =3D "Aspeed AST2500 EVB (ARM1176)";
-    mc->init =3D ast2500_evb_init;
-    mc->max_cpus =3D 1;
-    mc->no_sdcard =3D 1;
-    mc->no_floppy =3D 1;
-    mc->no_cdrom =3D 1;
-    mc->no_parallel =3D 1;
-}
-
-static const TypeInfo ast2500_evb_type =3D {
-    .name =3D MACHINE_TYPE_NAME("ast2500-evb"),
-    .parent =3D TYPE_MACHINE,
-    .class_init =3D ast2500_evb_class_init,
-};
-
 static void romulus_bmc_i2c_init(AspeedBoardState *bmc)
 {
     AspeedSoCState *soc =3D &bmc->soc;
@@ -386,30 +283,6 @@ static void romulus_bmc_i2c_init(AspeedBoardState *b=
mc)
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "ds1338"=
, 0x32);
 }
=20
-static void romulus_bmc_init(MachineState *machine)
-{
-    aspeed_board_init(machine, &aspeed_boards[ROMULUS_BMC]);
-}
-
-static void romulus_bmc_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc =3D MACHINE_CLASS(oc);
-
-    mc->desc =3D "OpenPOWER Romulus BMC (ARM1176)";
-    mc->init =3D romulus_bmc_init;
-    mc->max_cpus =3D 1;
-    mc->no_sdcard =3D 1;
-    mc->no_floppy =3D 1;
-    mc->no_cdrom =3D 1;
-    mc->no_parallel =3D 1;
-}
-
-static const TypeInfo romulus_bmc_type =3D {
-    .name =3D MACHINE_TYPE_NAME("romulus-bmc"),
-    .parent =3D TYPE_MACHINE,
-    .class_init =3D romulus_bmc_class_init,
-};
-
 static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
 {
     AspeedSoCState *soc =3D &bmc->soc;
@@ -433,36 +306,91 @@ static void witherspoon_bmc_i2c_init(AspeedBoardSta=
te *bmc)
                      0x60);
 }
=20
-static void witherspoon_bmc_init(MachineState *machine)
+static void aspeed_machine_init(MachineState *machine)
 {
-    aspeed_board_init(machine, &aspeed_boards[WITHERSPOON_BMC]);
+    AspeedMachineClass *amc =3D ASPEED_MACHINE_GET_CLASS(machine);
+
+    aspeed_board_init(machine, amc->board);
 }
=20
-static void witherspoon_bmc_class_init(ObjectClass *oc, void *data)
+static void aspeed_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc =3D MACHINE_CLASS(oc);
+    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
+    const AspeedBoardConfig *board =3D data;
=20
-    mc->desc =3D "OpenPOWER Witherspoon BMC (ARM1176)";
-    mc->init =3D witherspoon_bmc_init;
+    mc->desc =3D board->desc;
+    mc->init =3D aspeed_machine_init;
     mc->max_cpus =3D 1;
     mc->no_sdcard =3D 1;
     mc->no_floppy =3D 1;
     mc->no_cdrom =3D 1;
     mc->no_parallel =3D 1;
+    amc->board =3D board;
 }
=20
-static const TypeInfo witherspoon_bmc_type =3D {
-    .name =3D MACHINE_TYPE_NAME("witherspoon-bmc"),
+static const TypeInfo aspeed_machine_type =3D {
+    .name =3D TYPE_ASPEED_MACHINE,
     .parent =3D TYPE_MACHINE,
-    .class_init =3D witherspoon_bmc_class_init,
+    .instance_size =3D sizeof(AspeedMachine),
+    .class_size =3D sizeof(AspeedMachineClass),
+    .abstract =3D true,
+};
+
+static const AspeedBoardConfig aspeed_boards[] =3D {
+    {
+        .name      =3D MACHINE_TYPE_NAME("palmetto-bmc"),
+        .desc      =3D "OpenPOWER Palmetto BMC (ARM926EJ-S)",
+        .soc_name  =3D "ast2400-a1",
+        .hw_strap1 =3D PALMETTO_BMC_HW_STRAP1,
+        .fmc_model =3D "n25q256a",
+        .spi_model =3D "mx25l25635e",
+        .num_cs    =3D 1,
+        .i2c_init  =3D palmetto_bmc_i2c_init,
+    }, {
+        .name      =3D MACHINE_TYPE_NAME("ast2500-evb"),
+        .desc      =3D "Aspeed AST2500 EVB (ARM1176)",
+        .soc_name  =3D "ast2500-a1",
+        .hw_strap1 =3D AST2500_EVB_HW_STRAP1,
+        .fmc_model =3D "w25q256",
+        .spi_model =3D "mx25l25635e",
+        .num_cs    =3D 1,
+        .i2c_init  =3D ast2500_evb_i2c_init,
+    }, {
+        .name      =3D MACHINE_TYPE_NAME("romulus-bmc"),
+        .desc      =3D "OpenPOWER Romulus BMC (ARM1176)",
+        .soc_name  =3D "ast2500-a1",
+        .hw_strap1 =3D ROMULUS_BMC_HW_STRAP1,
+        .fmc_model =3D "n25q256a",
+        .spi_model =3D "mx66l1g45g",
+        .num_cs    =3D 2,
+        .i2c_init  =3D romulus_bmc_i2c_init,
+    }, {
+        .name      =3D MACHINE_TYPE_NAME("witherspoon-bmc"),
+        .desc      =3D "OpenPOWER Witherspoon BMC (ARM1176)",
+        .soc_name  =3D "ast2500-a1",
+        .hw_strap1 =3D WITHERSPOON_BMC_HW_STRAP1,
+        .fmc_model =3D "mx25l25635e",
+        .spi_model =3D "mx66l1g45g",
+        .num_cs    =3D 2,
+        .i2c_init  =3D witherspoon_bmc_i2c_init,
+    },
 };
=20
-static void aspeed_machine_init(void)
+static void aspeed_machine_types(void)
 {
-    type_register_static(&palmetto_bmc_type);
-    type_register_static(&ast2500_evb_type);
-    type_register_static(&romulus_bmc_type);
-    type_register_static(&witherspoon_bmc_type);
+    int i;
+
+    type_register_static(&aspeed_machine_type);
+    for (i =3D 0; i < ARRAY_SIZE(aspeed_boards); ++i) {
+        TypeInfo ti =3D {
+            .name       =3D aspeed_boards[i].name,
+            .parent     =3D TYPE_ASPEED_MACHINE,
+            .class_init =3D aspeed_machine_class_init,
+            .class_data =3D (void *)&aspeed_boards[i],
+        };
+        type_register(&ti);
+    }
 }
=20
-type_init(aspeed_machine_init)
+type_init(aspeed_machine_types)
--=20
2.17.1

