Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1941667lfq;
        Thu, 10 Sep 2020 22:25:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/tdIBmYz01IHOloUiRlsoMwpcvogtFTbg9a/cgzphLYPc64DK/F094cOxnKurj+gttpNf
X-Received: by 2002:ad4:430d:: with SMTP id c13mr430596qvs.49.1599801910052;
        Thu, 10 Sep 2020 22:25:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599801910; cv=none;
        d=google.com; s=arc-20160816;
        b=EjaDEK1hS0NmDmPkvLRngghM46OzGTisvu1fe6QmThVfX0Wj2i9pc/H43L5z267shc
         l3Jgx7+ftjDqxPdacwtEkZr6j8QYQUUmrj+HZC8FVRlMt5ctdS4MLs38cX1GhjQ5cHjJ
         7Yk0tkX9tDb4bw/p6YL309kiwKR0X/ADPYK2vcL4BPTS2BNtkfciyWpjb3Ql3eoEZerI
         1n85Y+dozOaLM9phMkKi85oaqaDc6xxvqsErQsaRrQIIigdWVVW40Up0qQdZAW5pSSbB
         qb9+2XCxiL4EY2GXL9QNVJCShWsWSVEbmRFrKmfSiXhkuzmFm1j3hx1UpAZRsrvzFGxj
         wXCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:subject:references:mime-version
         :message-id:in-reply-to:date:dkim-signature;
        bh=YOrl7QRjHT0JAJTy57fDIpmabWtCrZiSBV/eTlMUOFc=;
        b=ZqlzURZw7WZWrD2+9Wkrm1X2U7z8xrCnylCMMefRcGMzxt57ne2dvrfOZ3omJ1mZtk
         fXQOkqZttQ33+Muef6UGASDIMQ/TWGJ50AnDQ3VcahuCWI6yxasV/61hsUpSWgvbMGBk
         kOjMhcD+DLyhhn31glSLUSJaGgLo5F/f3qIddtBHOfaSPoGfndBx4WLMgP9acDASsE+b
         f5/o5hdUt7o5vFW2Oga2nSaT2xIrxyI0/OmLxczrOdDVP5WxTZYUWO0EcByIIIZyLpzM
         r2at/GJAQfVwU797H2SXt3XUZyqOiwm60CWeJBsMBxRYT9GDGkQ83EajYCKJyobTbmIb
         SQ1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=lgtlDW3p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r11si667324qtm.85.2020.09.10.22.25.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 22:25:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=lgtlDW3p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGbYb-0005M1-Cy
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 01:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3UAlbXwsKCM82D5388z79z819916z.x97Bz7F-vC789818F.9C1@flex--hskinnemoen.bounces.google.com>)
 id 1kGbUz-0006Pj-2g
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 01:21:25 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a]:41187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3UAlbXwsKCM82D5388z79z819916z.x97Bz7F-vC789818F.9C1@flex--hskinnemoen.bounces.google.com>)
 id 1kGbUv-0002NF-Q5
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 01:21:24 -0400
Received: by mail-pf1-x44a.google.com with SMTP id x2so6123966pfd.8
 for <qemu-arm@nongnu.org>; Thu, 10 Sep 2020 22:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc:content-transfer-encoding;
 bh=YOrl7QRjHT0JAJTy57fDIpmabWtCrZiSBV/eTlMUOFc=;
 b=lgtlDW3pu1ZDvp4lDZeaWKPRDU1lrbQaV1D+7FBb90jbCZvE4PUcr0MmCJPJzZipJB
 1PatkN0IGApC4XiXDLWzCwgejMKflEUvMvBISbzHCZFQvYWAoioeOcqEbdQwVjiZ/gHR
 Tg5P4L5hED75P+sORpeM2UPJabDV2UjQCsI09fuIe4idWXXxqWAeNI1+ozASOqjGWyLp
 Cx82s6YFwWF52kMMis2x8jyL+6b8f7qFqpDxs2jz04OsnN0UCEJgEDJeMMewJaRWD7Qt
 IHaQwg/CF5UResKH6tC7MiYC8ldP10GnkSZekYI8NKspMzl6VVFrG2scDXMgedz9c0IO
 3vhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=YOrl7QRjHT0JAJTy57fDIpmabWtCrZiSBV/eTlMUOFc=;
 b=sQJFL1MeNyzQfR6MlDL9hZMdk9d93gwdjMgkZgvuWsNH7hTNqsBVVbRBQRyPZdNPyP
 0LfFnAdZMoJVeqNbvG+WZAgdk1Me8SSsihAjsPVGjxtZx+is+nBIfwm/QaEhPeHLVgiN
 8zNi9H1k0aplkGSWIkXPJnzMZl89DiibMZ4xv+3Gw/ky1GDGqlEzEy+m+1CHnbIxcIRD
 Y4AD8/9xO4R4iAHn+3ag+3lZ1T1lS6UebNQsC5XAESyooymcUkfjfI4rMkrSPiAJYaNQ
 FDFAMvs9R9oHP0j1RCmqBc47V0LVA8ayHFdFHjJxJrkEc+qKdjLJqaICCV9OWHukhRPW
 tPPA==
X-Gm-Message-State: AOAM532Kil6BbAKCn1YIfgsZawpYikMDrTzkz7HkWj2XQi3g0GWn7yXO
 yNTQXgevIN0qiRMK7i2W2r1ymH9CgBfzBKTEuA==
X-Received: from skybert.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3107])
 (user=hskinnemoen job=sendgmr) by
 2002:a05:6a00:792:b029:13c:1611:652d with
 SMTP id g18-20020a056a000792b029013c1611652dmr634778pfu.13.1599801680246;
 Thu, 10 Sep 2020 22:21:20 -0700 (PDT)
Date: Thu, 10 Sep 2020 22:20:52 -0700
In-Reply-To: <20200911052101.2602693-1-hskinnemoen@google.com>
Message-Id: <20200911052101.2602693-6-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200911052101.2602693-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
Subject: [PATCH v9 05/14] hw/arm: Add two NPCM7xx-based machines
To: peter.maydell@linaro.org, f4bug@amsat.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>,
 Joel Stanley <joel@jms.id.au>, 
 "=?UTF-8?q?C=C3=A9dric=20Le=20Goater?=" <clg@kaod.org>,
 Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3UAlbXwsKCM82D5388z79z819916z.x97Bz7F-vC789818F.9C1@flex--hskinnemoen.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to: Havard Skinnemoen <hskinnemoen@google.com>
From: Havard Skinnemoen via <qemu-arm@nongnu.org>
X-TUID: jDNltOgTwori

This adds two new machines, both supported by OpenBMC:

  - npcm750-evb: Nuvoton NPCM750 Evaluation Board.
  - quanta-gsj: A board with a NPCM730 chip.

They rely on the NPCM7xx SoC device to do the heavy lifting. They are
almost completely identical at the moment, apart from the SoC type,
which currently only changes the reset contents of one register
(GCR.MDLR), but they might grow apart a bit more as more functionality
is added.

Both machines can boot the Linux kernel into /bin/sh.

Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 default-configs/arm-softmmu.mak |   1 +
 include/hw/arm/npcm7xx.h        |  19 +++++
 hw/arm/npcm7xx_boards.c         | 145 ++++++++++++++++++++++++++++++++
 hw/arm/meson.build              |   2 +-
 4 files changed, 166 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/npcm7xx_boards.c

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.=
mak
index 8fc09a4a51..9a94ebd0be 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -27,6 +27,7 @@ CONFIG_GUMSTIX=3Dy
 CONFIG_SPITZ=3Dy
 CONFIG_TOSA=3Dy
 CONFIG_Z2=3Dy
+CONFIG_NPCM7XX=3Dy
 CONFIG_COLLIE=3Dy
 CONFIG_ASPEED_SOC=3Dy
 CONFIG_NETDUINO2=3Dy
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index e68d9c79e6..ba7495869d 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -35,6 +35,25 @@
 #define NPCM7XX_SMP_BOOTREG_ADDR        (0xf080013c)  /* GCR.SCRPAD */
 #define NPCM7XX_GIC_CPU_IF_ADDR         (0xf03fe100)  /* GIC within A9 */
=20
+typedef struct NPCM7xxMachine {
+    MachineState        parent;
+} NPCM7xxMachine;
+
+#define TYPE_NPCM7XX_MACHINE MACHINE_TYPE_NAME("npcm7xx")
+#define NPCM7XX_MACHINE(obj)                                            \
+    OBJECT_CHECK(NPCM7xxMachine, (obj), TYPE_NPCM7XX_MACHINE)
+
+typedef struct NPCM7xxMachineClass {
+    MachineClass        parent;
+
+    const char          *soc_type;
+} NPCM7xxMachineClass;
+
+#define NPCM7XX_MACHINE_CLASS(klass)                                    \
+    OBJECT_CLASS_CHECK(NPCM7xxMachineClass, (klass), TYPE_NPCM7XX_MACHINE)
+#define NPCM7XX_MACHINE_GET_CLASS(obj)                                  \
+    OBJECT_GET_CLASS(NPCM7xxMachineClass, (obj), TYPE_NPCM7XX_MACHINE)
+
 typedef struct NPCM7xxState {
     DeviceState         parent;
=20
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
new file mode 100644
index 0000000000..939391c3a3
--- /dev/null
+++ b/hw/arm/npcm7xx_boards.c
@@ -0,0 +1,145 @@
+/*
+ * Machine definitions for boards featuring an NPCM7xx SoC.
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+
+#include "exec/address-spaces.h"
+#include "hw/arm/npcm7xx.h"
+#include "hw/core/cpu.h"
+#include "qapi/error.h"
+#include "qemu/units.h"
+
+#define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
+#define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
+
+static void npcm7xx_connect_dram(NPCM7xxState *soc, MemoryRegion *dram)
+{
+    memory_region_add_subregion(get_system_memory(), NPCM7XX_DRAM_BA, dram=
);
+
+    object_property_set_link(OBJECT(soc), "dram-mr", OBJECT(dram),
+                             &error_abort);
+}
+
+static NPCM7xxState *npcm7xx_create_soc(MachineState *machine,
+                                        uint32_t hw_straps)
+{
+    NPCM7xxMachineClass *nmc =3D NPCM7XX_MACHINE_GET_CLASS(machine);
+    MachineClass *mc =3D &nmc->parent;
+    Object *obj;
+
+    if (strcmp(machine->cpu_type, mc->default_cpu_type) !=3D 0) {
+        error_report("This board can only be used with %s",
+                     mc->default_cpu_type);
+        exit(1);
+    }
+
+    obj =3D object_new_with_props(nmc->soc_type, OBJECT(machine), "soc",
+                                &error_abort, NULL);
+    object_property_set_uint(obj, "power-on-straps", hw_straps, &error_abo=
rt);
+
+    return NPCM7XX(obj);
+}
+
+static void npcm750_evb_init(MachineState *machine)
+{
+    NPCM7xxState *soc;
+
+    soc =3D npcm7xx_create_soc(machine, NPCM750_EVB_POWER_ON_STRAPS);
+    npcm7xx_connect_dram(soc, machine->ram);
+    qdev_realize(DEVICE(soc), NULL, &error_fatal);
+
+    npcm7xx_load_kernel(machine, soc);
+}
+
+static void quanta_gsj_init(MachineState *machine)
+{
+    NPCM7xxState *soc;
+
+    soc =3D npcm7xx_create_soc(machine, QUANTA_GSJ_POWER_ON_STRAPS);
+    npcm7xx_connect_dram(soc, machine->ram);
+    qdev_realize(DEVICE(soc), NULL, &error_fatal);
+
+    npcm7xx_load_kernel(machine, soc);
+}
+
+static void npcm7xx_set_soc_type(NPCM7xxMachineClass *nmc, const char *typ=
e)
+{
+    NPCM7xxClass *sc =3D NPCM7XX_CLASS(object_class_by_name(type));
+    MachineClass *mc =3D MACHINE_CLASS(nmc);
+
+    nmc->soc_type =3D type;
+    mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D sc->num_cpus;
+}
+
+static void npcm7xx_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+
+    mc->no_floppy =3D 1;
+    mc->no_cdrom =3D 1;
+    mc->no_parallel =3D 1;
+    mc->default_ram_id =3D "ram";
+    mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a9");
+}
+
+/*
+ * Schematics:
+ * https://github.com/Nuvoton-Israel/nuvoton-info/blob/master/npcm7xx-pole=
g/evaluation-board/board_deliverables/NPCM750x_EB_ver.A1.1_COMPLETE.pdf
+ */
+static void npcm750_evb_machine_class_init(ObjectClass *oc, void *data)
+{
+    NPCM7xxMachineClass *nmc =3D NPCM7XX_MACHINE_CLASS(oc);
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+
+    npcm7xx_set_soc_type(nmc, TYPE_NPCM750);
+
+    mc->desc =3D "Nuvoton NPCM750 Evaluation Board (Cortex A9)";
+    mc->init =3D npcm750_evb_init;
+    mc->default_ram_size =3D 512 * MiB;
+};
+
+static void gsj_machine_class_init(ObjectClass *oc, void *data)
+{
+    NPCM7xxMachineClass *nmc =3D NPCM7XX_MACHINE_CLASS(oc);
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+
+    npcm7xx_set_soc_type(nmc, TYPE_NPCM730);
+
+    mc->desc =3D "Quanta GSJ (Cortex A9)";
+    mc->init =3D quanta_gsj_init;
+    mc->default_ram_size =3D 512 * MiB;
+};
+
+static const TypeInfo npcm7xx_machine_types[] =3D {
+    {
+        .name           =3D TYPE_NPCM7XX_MACHINE,
+        .parent         =3D TYPE_MACHINE,
+        .instance_size  =3D sizeof(NPCM7xxMachine),
+        .class_size     =3D sizeof(NPCM7xxMachineClass),
+        .class_init     =3D npcm7xx_machine_class_init,
+        .abstract       =3D true,
+    }, {
+        .name           =3D MACHINE_TYPE_NAME("npcm750-evb"),
+        .parent         =3D TYPE_NPCM7XX_MACHINE,
+        .class_init     =3D npcm750_evb_machine_class_init,
+    }, {
+        .name           =3D MACHINE_TYPE_NAME("quanta-gsj"),
+        .parent         =3D TYPE_NPCM7XX_MACHINE,
+        .class_init     =3D gsj_machine_class_init,
+    },
+};
+
+DEFINE_TYPES(npcm7xx_machine_types)
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index b0967c44c9..be39117b9b 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -13,7 +13,7 @@ arm_ss.add(when: 'CONFIG_MICROBIT', if_true: files('micro=
bit.c'))
 arm_ss.add(when: 'CONFIG_MUSICPAL', if_true: files('musicpal.c'))
 arm_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
 arm_ss.add(when: 'CONFIG_NETDUINOPLUS2', if_true: files('netduinoplus2.c')=
)
-arm_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx.c'))
+arm_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx.c', 'npcm7xx_bo=
ards.c'))
 arm_ss.add(when: 'CONFIG_NSERIES', if_true: files('nseries.c'))
 arm_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
 arm_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
--=20
2.28.0.526.ge36021eeef-goog

