Received: by 10.25.21.156 with SMTP id 28csp315801lfv;
        Tue, 2 Aug 2016 10:18:36 -0700 (PDT)
X-Received: by 10.37.42.132 with SMTP id q126mr45581569ybq.184.1470158314296;
        Tue, 02 Aug 2016 10:18:34 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o33si2069933qkh.183.2016.08.02.10.18.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Aug 2016 10:18:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57877 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUdKr-0007LS-Ix
	for alex.bennee@linaro.org; Tue, 02 Aug 2016 13:18:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bUdIj-0006BQ-7X
	for qemu-devel@nongnu.org; Tue, 02 Aug 2016 13:16:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bUdIf-0007AM-26
	for qemu-devel@nongnu.org; Tue, 02 Aug 2016 13:16:21 -0400
Received: from 3.mo179.mail-out.ovh.net ([178.33.251.175]:42271)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bUdIe-0007AF-Of
	for qemu-devel@nongnu.org; Tue, 02 Aug 2016 13:16:16 -0400
Received: from player732.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 4688C1000C7B
	for <qemu-devel@nongnu.org>; Tue,  2 Aug 2016 19:16:16 +0200 (CEST)
Received: from localhost.localdomain.com (bad36-1-78-202-132-1.fbx.proxad.net
	[78.202.132.1]) (Authenticated sender: clg@kaod.org)
	by player732.ha.ovh.net (Postfix) with ESMTPSA id 7E18F10009F;
	Tue,  2 Aug 2016 19:16:10 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue,  2 Aug 2016 19:15:40 +0200
Message-Id: <1470158147-16378-4-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1470158147-16378-1-git-send-email-clg@kaod.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 15375007657093794577
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrjeekgdejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.33.251.175
Subject: [Qemu-devel] [PATCH v3 03/10] aspeed-soc: provide a framework to
 add new SoCs
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5Hoh4b5bA03y

Let's define an object class for each Aspeed SoC we support. A
AspeedSoCInfo struct gathers the SoC specifications which can later be
used by an instance of the class or by a board using the SoC.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_soc.c         | 27 ++++++++++++++++++++++++---
 hw/arm/palmetto-bmc.c       | 12 ++++++++----
 include/hw/arm/aspeed_soc.h | 17 ++++++++++++++++-
 3 files changed, 48 insertions(+), 8 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 1bec478fef68..ec6ec3546908 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -37,6 +37,13 @@
 static const int uart_irqs[] =3D { 9, 32, 33, 34, 10 };
 static const int timer_irqs[] =3D { 16, 17, 18, 35, 36, 37, 38, 39, };
=20
+#define AST2400_SDRAM_BASE       0x40000000
+
+static const AspeedSoCInfo aspeed_socs[] =3D {
+    { "ast2400-a0", "arm926", AST2400_A0_SILICON_REV, AST2400_SDRAM_BASE=
 },
+    { "ast2400",    "arm926", AST2400_A0_SILICON_REV, AST2400_SDRAM_BASE=
 },
+};
+
 /*
  * IO handlers: simply catch any reads/writes to IO addresses that aren'=
t
  * handled by a device mapping.
@@ -65,8 +72,9 @@ static const MemoryRegionOps aspeed_soc_io_ops =3D {
 static void aspeed_soc_init(Object *obj)
 {
     AspeedSoCState *s =3D ASPEED_SOC(obj);
+    AspeedSoCClass *sc =3D ASPEED_SOC_GET_CLASS(s);
=20
-    s->cpu =3D cpu_arm_init("arm926");
+    s->cpu =3D cpu_arm_init(sc->info->cpu_model);
=20
     object_initialize(&s->vic, sizeof(s->vic), TYPE_ASPEED_VIC);
     object_property_add_child(obj, "vic", OBJECT(&s->vic), NULL);
@@ -84,7 +92,7 @@ static void aspeed_soc_init(Object *obj)
     object_property_add_child(obj, "scu", OBJECT(&s->scu), NULL);
     qdev_set_parent_bus(DEVICE(&s->scu), sysbus_get_default());
     qdev_prop_set_uint32(DEVICE(&s->scu), "silicon-rev",
-                         AST2400_A0_SILICON_REV);
+                         sc->info->silicon_rev);
     object_property_add_alias(obj, "hw-strap1", OBJECT(&s->scu),
                               "hw-strap1", &error_abort);
     object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu),
@@ -102,7 +110,7 @@ static void aspeed_soc_init(Object *obj)
     object_property_add_child(obj, "sdmc", OBJECT(&s->sdmc), NULL);
     qdev_set_parent_bus(DEVICE(&s->sdmc), sysbus_get_default());
     qdev_prop_set_uint32(DEVICE(&s->sdmc), "silicon-rev",
-                         AST2400_A0_SILICON_REV);
+                         sc->info->silicon_rev);
 }
=20
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
@@ -202,7 +210,9 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
 static void aspeed_soc_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(oc);
+    AspeedSoCClass *sc =3D ASPEED_SOC_CLASS(oc);
=20
+    sc->info =3D (AspeedSoCInfo *) data;
     dc->realize =3D aspeed_soc_realize;
=20
     /*
@@ -222,7 +232,18 @@ static const TypeInfo aspeed_soc_type_info =3D {
=20
 static void aspeed_soc_register_types(void)
 {
+    int i;
+
     type_register_static(&aspeed_soc_type_info);
+    for (i =3D 0; i < ARRAY_SIZE(aspeed_socs); ++i) {
+        TypeInfo ti =3D {
+            .name       =3D aspeed_socs[i].name,
+            .parent     =3D TYPE_ASPEED_SOC,
+            .class_init =3D aspeed_soc_class_init,
+            .class_data =3D (void *) &aspeed_socs[i],
+        };
+        type_register(&ti);
+    }
 }
=20
 type_init(aspeed_soc_register_types)
diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
index 4d11905cfb18..531c266d9449 100644
--- a/hw/arm/palmetto-bmc.c
+++ b/hw/arm/palmetto-bmc.c
@@ -22,8 +22,6 @@
 #include "sysemu/blockdev.h"
=20
 static struct arm_boot_info palmetto_bmc_binfo =3D {
-    .loader_start =3D AST2400_SDRAM_BASE,
-    .board_id =3D 0,
     .nb_cpus =3D 1,
 };
=20
@@ -61,14 +59,17 @@ static void palmetto_bmc_init_flashes(AspeedSMCState =
*s, const char *flashtype,
 static void palmetto_bmc_init(MachineState *machine)
 {
     PalmettoBMCState *bmc;
+    AspeedSoCClass *sc;
=20
     bmc =3D g_new0(PalmettoBMCState, 1);
-    object_initialize(&bmc->soc, (sizeof(bmc->soc)), TYPE_ASPEED_SOC);
+    object_initialize(&bmc->soc, (sizeof(bmc->soc)), "ast2400-a0");
     object_property_add_child(OBJECT(machine), "soc", OBJECT(&bmc->soc),
                               &error_abort);
=20
+    sc =3D ASPEED_SOC_GET_CLASS(&bmc->soc);
+
     memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_siz=
e);
-    memory_region_add_subregion(get_system_memory(), AST2400_SDRAM_BASE,
+    memory_region_add_subregion(get_system_memory(), sc->info->sdram_bas=
e,
                                 &bmc->ram);
     object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc=
->ram),
                                    &error_abort);
@@ -84,6 +85,9 @@ static void palmetto_bmc_init(MachineState *machine)
     palmetto_bmc_binfo.initrd_filename =3D machine->initrd_filename;
     palmetto_bmc_binfo.kernel_cmdline =3D machine->kernel_cmdline;
     palmetto_bmc_binfo.ram_size =3D ram_size;
+    palmetto_bmc_binfo.board_id =3D sc->info->silicon_rev;
+    palmetto_bmc_binfo.loader_start =3D sc->info->sdram_base;
+
     arm_load_kernel(ARM_CPU(first_cpu), &palmetto_bmc_binfo);
 }
=20
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index bf63ae90cabe..0146a2a54a0e 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -39,6 +39,21 @@ typedef struct AspeedSoCState {
 #define TYPE_ASPEED_SOC "aspeed-soc"
 #define ASPEED_SOC(obj) OBJECT_CHECK(AspeedSoCState, (obj), TYPE_ASPEED_=
SOC)
=20
-#define AST2400_SDRAM_BASE       0x40000000
+typedef struct AspeedSoCInfo {
+    const char *name;
+    const char *cpu_model;
+    uint32_t silicon_rev;
+    hwaddr sdram_base;
+} AspeedSoCInfo;
+
+typedef struct AspeedSoCClass {
+    DeviceState parent_class;
+    AspeedSoCInfo *info;
+} AspeedSoCClass;
+
+#define ASPEED_SOC_CLASS(klass)                                         =
\
+    OBJECT_CLASS_CHECK(AspeedSoCClass, (klass), TYPE_ASPEED_SOC)
+#define ASPEED_SOC_GET_CLASS(obj)                               \
+    OBJECT_GET_CLASS(AspeedSoCClass, (obj), TYPE_ASPEED_SOC)
=20
 #endif /* ASPEED_SOC_H */
--=20
2.7.4

