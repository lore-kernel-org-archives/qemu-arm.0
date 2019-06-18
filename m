Received: by 2002:a17:90a:ad8a:0:0:0:0 with SMTP id s10csp4218447pjq;
        Tue, 18 Jun 2019 10:13:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxEZQe/tDzNwxHTRHjASX/okBtrnqutTb1a1iP/Le7pUQvyMy1yE4gBDrYfoSyedfS7ANH2
X-Received: by 2002:a0c:d4f4:: with SMTP id y49mr28487433qvh.238.1560877987443;
        Tue, 18 Jun 2019 10:13:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560877987; cv=none;
        d=google.com; s=arc-20160816;
        b=saD5xg0CjYw1bRHB8wofbWChNfCbMtmxPA5Jg7/se7DO9fOw5qjNgJ7BgvWWpHM75T
         /tqZ1NdH9PBi/3wblfv0dWQtLP3C3RA1w0TH71C0fSE/Nk9Y9GmiZ5ZmzPSVpmabIrSB
         URwcdLHyvNAvwYeGscR6jFofJE70cDHt7XfXceyfnBunN8YF5tdpbrJ56L2v6bxV4u5Q
         +1cmpsL6Dkwndy4tt2XahRSdi52s4nSn+4Fa4e5oP4PryZo645WlEFWjwGh9caqRUax/
         AzMmFsZOZp2SOw4Q8+UuvCzt9p4a0AXgzQ5rUU2Zxp6ej/L9JH+JT09AldhxZVew/MWC
         A2AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=w1yFXXWhKFClm+NroBG2v3SzCtQO/FgMGkrc4q/pn7s=;
        b=pq9Rf4NESsMbX1PfKYTOaUZGz7eQNT655+qyedSoCC4T/TLKcpIoNlLJEMBlE+h2/n
         Q8Vp8B5FCI3tiQmfrdglgHXoSou/2aWNu+lsHFCg9jCapwih4I00Ci4fRmEXGNFbrjeg
         qwMpuzBNCbmkfxsgUWiF+CDKbyL2zuO8JmFFR3BNdbFXviCfFpxXYYSajxOE5VfmatwO
         w4C0nGwZfvaxwtLAJ4rIJDhswco0+VmO7d80eTuos6VjUuC+CDpWvofce9Mxfp0BHCod
         T/We3wREbLSpIMYTMGUmIeU+utgX8Sv0bgoCb9k0JsEeKz4S/qhL0JVJ/nLImzqp8a81
         IoCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12si718686qts.46.2019.06.18.10.13.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 10:13:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60342 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdHfP-0002rD-0b
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 13:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60406)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hdHMx-0008AD-4B
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:54:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hdHMv-0003zC-Cp
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:54:02 -0400
Received: from 2.mo69.mail-out.ovh.net ([178.33.251.80]:40629)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hdHMv-0003xa-5n
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:54:01 -0400
Received: from player157.ha.ovh.net (unknown [10.108.57.14])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id E7A215DFF3
 for <qemu-arm@nongnu.org>; Tue, 18 Jun 2019 18:53:59 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id 679836EB51A4;
 Tue, 18 Jun 2019 16:53:53 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jun 2019 18:52:55 +0200
Message-Id: <20190618165311.27066-6-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190618165311.27066-1-clg@kaod.org>
References: <20190618165311.27066-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1668302190663994129
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrtddtgdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.251.80
Subject: [Qemu-arm] [PATCH v2 05/21] aspeed: introduce a configurable number
 of CPU per machine
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
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4NO0A5+PqSIP

The current models of the Aspeed SoCs only have one CPU but future
ones will support SMP. Introduce a new num_cpus field at the SoC class
level to define the number of available CPUs per SoC and also
introduce a 'num-cpus' property to activate the CPUs configured for
the machine.

The max_cpus limit of the machine should depend on the SoC definition
but, unfortunately, these values are not available when the machine
class is initialized. This is the reason why we add a check on
num_cpus in the AspeedSoC realize handler.

SMP support will be activated when models for such SoCs are implemented.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 Changes sinve v1:

  - reworked the logic to put the number of CPUs under the SoC

 include/hw/arm/aspeed_soc.h |  5 ++++-
 hw/arm/aspeed.c             |  7 +++++--
 hw/arm/aspeed_soc.c         | 33 +++++++++++++++++++++++++++------
 3 files changed, 36 insertions(+), 9 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index fa0ba957a611..b613b00600fc 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -24,13 +24,15 @@
=20
 #define ASPEED_SPIS_NUM  2
 #define ASPEED_WDTS_NUM  3
+#define ASPEED_CPUS_NUM  2
=20
 typedef struct AspeedSoCState {
     /*< private >*/
     DeviceState parent;
=20
     /*< public >*/
-    ARMCPU cpu;
+    ARMCPU cpu[ASPEED_CPUS_NUM];
+    uint32_t num_cpus;
     MemoryRegion sram;
     AspeedVICState vic;
     AspeedRtcState rtc;
@@ -58,6 +60,7 @@ typedef struct AspeedSoCInfo {
     int wdts_num;
     const int *irqmap;
     const hwaddr *memmap;
+    uint32_t num_cpus;
 } AspeedSoCInfo;
=20
 typedef struct AspeedSoCClass {
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index c692ca1dba90..96de4f5c2a87 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -22,13 +22,13 @@
 #include "hw/misc/tmp105.h"
 #include "qemu/log.h"
 #include "sysemu/block-backend.h"
+#include "sysemu/sysemu.h"
 #include "hw/loader.h"
 #include "qemu/error-report.h"
 #include "qemu/units.h"
=20
 static struct arm_boot_info aspeed_board_binfo =3D {
     .board_id =3D -1, /* device-tree-only board */
-    .nb_cpus =3D 1,
 };
=20
 struct AspeedBoardState {
@@ -171,6 +171,8 @@ static void aspeed_board_init(MachineState *machine,
                             &error_abort);
     object_property_set_int(OBJECT(&bmc->soc), cfg->num_cs, "num-cs",
                             &error_abort);
+    object_property_set_int(OBJECT(&bmc->soc), smp_cpus, "num-cpus",
+                            &error_abort);
     if (machine->kernel_filename) {
         /*
          * When booting with a -kernel command line there is no u-boot
@@ -230,6 +232,7 @@ static void aspeed_board_init(MachineState *machine,
     aspeed_board_binfo.kernel_cmdline =3D machine->kernel_cmdline;
     aspeed_board_binfo.ram_size =3D ram_size;
     aspeed_board_binfo.loader_start =3D sc->info->memmap[ASPEED_SDRAM];
+    aspeed_board_binfo.nb_cpus =3D bmc->soc.num_cpus;
=20
     if (cfg->i2c_init) {
         cfg->i2c_init(bmc);
@@ -326,7 +329,7 @@ static void aspeed_machine_class_init(ObjectClass *oc=
, void *data)
=20
     mc->desc =3D board->desc;
     mc->init =3D aspeed_machine_init;
-    mc->max_cpus =3D 1;
+    mc->max_cpus =3D ASPEED_CPUS_NUM;
     mc->no_sdcard =3D 1;
     mc->no_floppy =3D 1;
     mc->no_cdrom =3D 1;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 5faa78d81fd6..d38fb0aaa0f5 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -19,6 +19,7 @@
 #include "hw/char/serial.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qemu/error-report.h"
 #include "hw/i2c/aspeed_i2c.h"
 #include "net/net.h"
=20
@@ -123,6 +124,7 @@ static const AspeedSoCInfo aspeed_socs[] =3D {
         .wdts_num     =3D 2,
         .irqmap       =3D aspeed_soc_ast2400_irqmap,
         .memmap       =3D aspeed_soc_ast2400_memmap,
+        .num_cpus     =3D 1,
     }, {
         .name         =3D "ast2400-a1",
         .cpu_type     =3D ARM_CPU_TYPE_NAME("arm926"),
@@ -134,6 +136,7 @@ static const AspeedSoCInfo aspeed_socs[] =3D {
         .wdts_num     =3D 2,
         .irqmap       =3D aspeed_soc_ast2400_irqmap,
         .memmap       =3D aspeed_soc_ast2400_memmap,
+        .num_cpus     =3D 1,
     }, {
         .name         =3D "ast2400",
         .cpu_type     =3D ARM_CPU_TYPE_NAME("arm926"),
@@ -145,6 +148,7 @@ static const AspeedSoCInfo aspeed_socs[] =3D {
         .wdts_num     =3D 2,
         .irqmap       =3D aspeed_soc_ast2400_irqmap,
         .memmap       =3D aspeed_soc_ast2400_memmap,
+        .num_cpus     =3D 1,
     }, {
         .name         =3D "ast2500-a1",
         .cpu_type     =3D ARM_CPU_TYPE_NAME("arm1176"),
@@ -156,6 +160,7 @@ static const AspeedSoCInfo aspeed_socs[] =3D {
         .wdts_num     =3D 3,
         .irqmap       =3D aspeed_soc_ast2500_irqmap,
         .memmap       =3D aspeed_soc_ast2500_memmap,
+        .num_cpus     =3D 1,
     },
 };
=20
@@ -172,8 +177,11 @@ static void aspeed_soc_init(Object *obj)
     AspeedSoCClass *sc =3D ASPEED_SOC_GET_CLASS(s);
     int i;
=20
-    object_initialize_child(obj, "cpu", OBJECT(&s->cpu), sizeof(s->cpu),
-                            sc->info->cpu_type, &error_abort, NULL);
+    for (i =3D 0; i < sc->info->num_cpus; i++) {
+        object_initialize_child(obj, "cpu[*]", OBJECT(&s->cpu[i]),
+                                sizeof(s->cpu[i]), sc->info->cpu_type,
+                                &error_abort, NULL);
+    }
=20
     sysbus_init_child_obj(obj, "scu", OBJECT(&s->scu), sizeof(s->scu),
                           TYPE_ASPEED_SCU);
@@ -241,11 +249,19 @@ static void aspeed_soc_realize(DeviceState *dev, Er=
ror **errp)
     create_unimplemented_device("aspeed_soc.io", sc->info->memmap[ASPEED=
_IOMEM],
                                 ASPEED_SOC_IOMEM_SIZE);
=20
+    if (s->num_cpus > sc->info->num_cpus) {
+        warn_report("%s: invalid number of CPUs %d, using default %d",
+                    sc->info->name, s->num_cpus, sc->info->num_cpus);
+        s->num_cpus =3D sc->info->num_cpus;
+    }
+
     /* CPU */
-    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
+    for (i =3D 0; i < s->num_cpus; i++) {
+        object_property_set_bool(OBJECT(&s->cpu[i]), true, "realized", &=
err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
     }
=20
     /* SRAM */
@@ -380,6 +396,10 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->ftgmac100), 0,
                        aspeed_soc_get_irq(s, ASPEED_ETH1));
 }
+static Property aspeed_soc_properties[] =3D {
+    DEFINE_PROP_UINT32("num-cpus", AspeedSoCState, num_cpus, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
=20
 static void aspeed_soc_class_init(ObjectClass *oc, void *data)
 {
@@ -390,6 +410,7 @@ static void aspeed_soc_class_init(ObjectClass *oc, vo=
id *data)
     dc->realize =3D aspeed_soc_realize;
     /* Reason: Uses serial_hds and nd_table in realize() directly */
     dc->user_creatable =3D false;
+    dc->props =3D aspeed_soc_properties;
 }
=20
 static const TypeInfo aspeed_soc_type_info =3D {
--=20
2.21.0

