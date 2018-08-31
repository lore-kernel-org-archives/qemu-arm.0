Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp441786wrd;
        Fri, 31 Aug 2018 03:39:33 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vda+9c3/+I8SLGIbCOpcx/U+U/7u+QHleE5oKOVALzkMqmeXii8RCREArIjm4goI3WDo3IrI
X-Received: by 2002:a0c:c503:: with SMTP id x3-v6mr14711091qvi.82.1535711972950;
        Fri, 31 Aug 2018 03:39:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535711972; cv=none;
        d=google.com; s=arc-20160816;
        b=0CVlyrRF5dVZXz7nKxTbXpPk1JyT3bWTe1PPNN0gU6mb/Bd4vel6dTLyMOaNrV5lcr
         aCQW8ppJY2IOU6y7Eelgdjz5sFuIoPAKZO89R6R9CZ9pa0Gm1FPRZ6FMXLq/ixMe8PB2
         wBivobB7p2NR1B2PbJvfCnjQn5n4BxqRXhtUTJ7hdzidZm6ulWO1X0/KM0JhsU31C5hr
         TD1htXqjZQAgkKt1dR4ACDsCzy88tvG3y1Zwyb6XtPFP3RsM5cbzn4OSIybqM3ro9PEG
         yDrzN0pelp4gTkNXMMZnAfR2ZrS6c17uv9M5KMS0you3mjVK7mVJEC35UgoHwCcv0SYo
         l7Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=4JyoMWrjLnNF0yYAFiP3PX+ZIa1f2+yfCaNTsEzJqcY=;
        b=EqTd4hnS6kDkTxXX7QRj7kTfiZ/+IQ7PisDvDnm1SWUZT+DsIR59xjhqhyBQ38q8/d
         MRQs5b8PT24CRJwqi4VTHm1IBTTCUqJ2anr/u0AKv7K1f0O6xNyCyspm8r6MLZedovvC
         TNwuvGubdqOnMcSTD/XBrNAF6/akEHDZZqHTdCY4auOtdNzCofkkZ4Af5hh5DziniEik
         rT1yrJh/xext64EX6ad636A9o9h41YgpDnujL8VtPT1x02j/rJ4aUisMKhXlq1VqTwaQ
         iYY0Uoofcp5EhqkXyI9lnDt72HPNvFUilIZb+rUhsCvVt1QC2D1ZWFiNxtQZ+I8qZhQ1
         cyUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 63-v6si2310238qky.257.2018.08.31.03.39.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 Aug 2018 03:39:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52942 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fvgpw-000340-Ee
	for alex.bennee@linaro.org; Fri, 31 Aug 2018 06:39:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fvgpX-0002wx-2W
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 06:39:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fvgpT-0001uw-OQ
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 06:39:06 -0400
Received: from 20.mo4.mail-out.ovh.net ([46.105.33.73]:33395)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fvgpT-0001uB-FN
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 06:39:03 -0400
Received: from player168.ha.ovh.net (unknown [10.109.160.39])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 39A561A3BBF
	for <qemu-arm@nongnu.org>; Fri, 31 Aug 2018 12:39:02 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player168.ha.ovh.net (Postfix) with ESMTPSA id E4B4A4200C5;
	Fri, 31 Aug 2018 12:38:53 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 31 Aug 2018 12:38:11 +0200
Message-Id: <20180831103816.13479-5-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180831103816.13479-1-clg@kaod.org>
References: <20180831103816.13479-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1929229492456098624
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrhedtgdeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.33.73
Subject: [Qemu-arm] [PATCH 04/11] hw/arm/aspeed: add a 'mmio-exec' property
 to boot from the FMC flash module
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
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v1FSMC8KrII8

Now that MMIO execution is supported, introduce a 'mmio-exec' property
to boot directly from CE0 of the FMC controller using a memory region
alias.

The overhead for the current firmware images using a custom U-Boot is
around 2 seconds, which is fine, but with a U-Boot from mainline, it
takes an extra 50 seconds or so to reach Linux. This might be related
to the fact that a device tree is used.

MMIO execution is not activated by default because until boot time is
improved.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed.h |  2 ++
 hw/arm/aspeed.c         | 43 ++++++++++++++++++++++++++++++++++++-----
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index 2b77f8d2b3c8..d079f4d6e5db 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -30,6 +30,8 @@ typedef struct AspeedBoardConfig {
=20
 typedef struct AspeedMachine {
     MachineState parent_obj;
+
+    bool mmio_exec;
 } AspeedMachine;
=20
 #define ASPEED_MACHINE_CLASS(klass) \
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 6b33ecd5aa43..3a66c2dedc3e 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -216,11 +216,18 @@ static void aspeed_board_init(MachineState *machine=
,
          * SoC and 128MB for the AST2500 SoC, which is twice as big as
          * needed by the flash modules of the Aspeed machines.
          */
-        memory_region_init_rom(boot_rom, OBJECT(bmc), "aspeed.boot_rom",
-                               fl->size, &error_abort);
-        memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
-                                    boot_rom);
-        write_boot_rom(drive0, FIRMWARE_ADDR, fl->size, &error_abort);
+        if (ASPEED_MACHINE(machine)->mmio_exec) {
+            memory_region_init_alias(boot_rom, OBJECT(bmc), "aspeed.boot=
_rom",
+                                     &fl->mmio, 0, fl->size);
+            memory_region_add_subregion(get_system_memory(), FIRMWARE_AD=
DR,
+                                        boot_rom);
+        } else {
+            memory_region_init_rom(boot_rom, OBJECT(bmc), "aspeed.boot_r=
om",
+                                   fl->size, &error_abort);
+            memory_region_add_subregion(get_system_memory(), FIRMWARE_AD=
DR,
+                                        boot_rom);
+            write_boot_rom(drive0, FIRMWARE_ADDR, fl->size, &error_abort=
);
+        }
     }
=20
     aspeed_board_binfo.kernel_filename =3D machine->kernel_filename;
@@ -313,6 +320,29 @@ static void aspeed_machine_init(MachineState *machin=
e)
     aspeed_board_init(machine, amc->board);
 }
=20
+static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
+{
+    return ASPEED_MACHINE(obj)->mmio_exec;
+}
+
+static void aspeed_set_mmio_exec(Object *obj, bool value, Error **errp)
+{
+    ASPEED_MACHINE(obj)->mmio_exec =3D value;
+}
+
+static void aspeed_machine_instance_init(Object *obj)
+{
+    ASPEED_MACHINE(obj)->mmio_exec =3D false;
+}
+
+static void aspeed_machine_class_props_init(ObjectClass *oc)
+{
+    object_class_property_add_bool(oc, "mmio-exec", aspeed_get_mmio_exec=
,
+                                   aspeed_set_mmio_exec, &error_abort);
+    object_class_property_set_description(oc, "mmio-exec",
+                              "boot using MMIO execution", &error_abort)=
;
+}
+
 static void aspeed_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc =3D MACHINE_CLASS(oc);
@@ -327,6 +357,8 @@ static void aspeed_machine_class_init(ObjectClass *oc=
, void *data)
     mc->no_cdrom =3D 1;
     mc->no_parallel =3D 1;
     amc->board =3D board;
+
+    aspeed_machine_class_props_init(oc);
 }
=20
 static const TypeInfo aspeed_machine_type =3D {
@@ -334,6 +366,7 @@ static const TypeInfo aspeed_machine_type =3D {
     .parent =3D TYPE_MACHINE,
     .instance_size =3D sizeof(AspeedMachine),
     .class_size =3D sizeof(AspeedMachineClass),
+    .instance_init =3D aspeed_machine_instance_init,
     .abstract =3D true,
 };
=20
--=20
2.17.1

