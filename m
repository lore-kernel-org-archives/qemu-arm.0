Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp908910lfm;
        Wed, 8 Jul 2020 17:41:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQETT7dVdHmcstUH3KPXmLkK3eeDYQKD9ubcrkeNEQanTFScUCp+ehimcRadbjaDm0DuXI
X-Received: by 2002:a25:d653:: with SMTP id n80mr6297753ybg.133.1594255297815;
        Wed, 08 Jul 2020 17:41:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594255297; cv=none;
        d=google.com; s=arc-20160816;
        b=RQIy1MwRvMRIeSvCUO2vW0ZfBb0ifBC0biDH4QZF0OrBwvCIlVlqTwDuGZlowRwvr/
         ArvUEB6EH1QQOrwNqbIESoU6fGcSn459MMpycUh1NfehuFwfD+nAsA9BNCRcTU+M8WmW
         2hPvjWyVktsrMk6W9PHFfOPb3SLRrV5soRFjVTGwzFwosb2KdUMo6G810x7Xulp39pt1
         c0Sh3MM6LuRV8WHaUCZOU15Q45qnFmqbRNYal83a1SqH8Q9U6uYrCEDJ+mTkurAJ4S0r
         AgmQqIjkCdlxcaPV3UMa2x2Uo39G/a4BrqvXei8kxaaocJNhJC6zR8irnQZMoU5ptXef
         Bggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=bulMZdUMkkNdHSfTmTXx1wlxG6mAfX02SXjNqiyM2wg=;
        b=sj72un8PmNYj4+NS1B993p4NppUD+arucRC6diA5rBNo1JAEfrkfUQLx0wqiXpgkto
         9yJagw64wdWsWaPDQn/Qa33uCYyMc2GbEkbtKCfy4YYWqpSODdFeDq0+JB0PKXzJIY9y
         3KeCxmWKruBSe/FYheZ4VoDI2iEw8sWrR3dutKGCGxFwlMr4LVjpPFFai/gHlsCjFCgZ
         RGjmtC0opPU/eb6U0zQ9pBqS3wEiWClGLzI6QjwhukdgpnoYOEv/oGN4q/A3XEHu82TB
         Nv9g9FBb/GGQNKUOOdHHg4kDE4YIXNtRKTcfaP0TfeLdbhqZSCGSip8ncqMmv1rkj3zZ
         40Aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=JmtCGNu0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s35si998504ybe.402.2020.07.08.17.41.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jul 2020 17:41:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=JmtCGNu0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:36366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtKd7-0004pJ-6g
	for alex.bennee@linaro.org; Wed, 08 Jul 2020 20:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3k2YGXwsKCngdogejjaikajckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--hskinnemoen.bounces.google.com>)
 id 1jtKYI-0006T9-Vy
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 20:36:39 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:46184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3k2YGXwsKCngdogejjaikajckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--hskinnemoen.bounces.google.com>)
 id 1jtKYG-000122-OT
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 20:36:38 -0400
Received: by mail-yb1-xb49.google.com with SMTP id u64so763764ybf.13
 for <qemu-devel@nongnu.org>; Wed, 08 Jul 2020 17:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=bulMZdUMkkNdHSfTmTXx1wlxG6mAfX02SXjNqiyM2wg=;
 b=JmtCGNu0m7FbDL6PoiKZwr0uvGQOSPcHeul1dWmeNQchY3+35BZyhI2GE9oCGYIVX5
 9ASiTv3SVXzEznqzMsozmR/atUuUMkbYLceUlBNecrrZTKNCK3HtyYtO0datDpE/ZYlX
 SA20dmelIM6tX9Jj66eqNqIxcgz1UOs6GqgWYnEfB7J00AN3FjFV50jE4FLf0ulfk0Aa
 k3jkamfwtSANRn7gWAWulim0wWiu/8i9xTB4ZbS6MypzLkyUkLtigz/dMOzIvpqCxDUv
 NzgNDiRGs8Du4uCEmnl6JPqTD8xNajeFNNOZIYmGvz4/Y8uAncYrxr3QfhzY3xoI+9Tl
 evXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=bulMZdUMkkNdHSfTmTXx1wlxG6mAfX02SXjNqiyM2wg=;
 b=gL9Pxto28YgqiRaPyXGAzd9LMmzgszf4OQQN5aWthEs7OvUZSuQuNoja1bra03HGlv
 zarMHCC/1v5Bmu5ifk2KkrmKNST2q5RGexLFygcyDdzDo9RfdSZDVWAXm/6k4jT16bfx
 jLvRGb9qEFSIjzZSez8VThrnNCz28gsAOszDNOBccD/tgbun3aVg+kUrw8TJEi93CN2A
 T91cggdERijjsI4C+wbHB0awNZPXZKBgyhUUDjascHrmIEzx0wV8QGaRblA+I0ZIjG1K
 9pVQbg9/zJBiybTCuKJKpQLx4jpVN+z02bvYl7PDXGsldyolE/8cxz/f9ppqTvXZ1Pxy
 46UQ==
X-Gm-Message-State: AOAM530sZtvy/sNbmkcZXlDL59ojk9bZnpuY2s6dudKDiZH9GS9zucBZ
 VjxJH2XZd3FNZpDloO8WywH1u6qqMCLT2/bwog==
X-Received: by 2002:a5b:48f:: with SMTP id n15mr87834291ybp.115.1594254995291; 
 Wed, 08 Jul 2020 17:36:35 -0700 (PDT)
Date: Wed,  8 Jul 2020 17:36:02 -0700
In-Reply-To: <20200709003608.3834629-1-hskinnemoen@google.com>
Message-Id: <20200709003608.3834629-6-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200709003608.3834629-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH v5 05/11] hw/arm: Add two NPCM7xx-based machines
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org, f4bug@amsat.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>,
 Joel Stanley <joel@jms.id.au>, 
 "=?UTF-8?q?C=C3=A9dric=20Le=20Goater?=" <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3k2YGXwsKCngdogejjaikajckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--hskinnemoen.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I2BR0x+xej9U

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
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 default-configs/arm-softmmu.mak |   1 +
 include/hw/arm/npcm7xx.h        |  19 ++++
 hw/arm/npcm7xx_boards.c         | 156 ++++++++++++++++++++++++++++++++
 hw/arm/Makefile.objs            |   2 +-
 4 files changed, 177 insertions(+), 1 deletion(-)
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
index 95d9224f59..b8b76bc07b 100644
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
index 0000000000..d78d9f991b
--- /dev/null
+++ b/hw/arm/npcm7xx_boards.c
@@ -0,0 +1,156 @@
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
+#include "hw/arm/boot.h"
+#include "hw/arm/npcm7xx.h"
+#include "hw/core/cpu.h"
+#include "qapi/error.h"
+#include "qemu/units.h"
+
+#define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
+#define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
+
+static struct arm_boot_info npcm7xx_binfo =3D {
+    .loader_start       =3D NPCM7XX_LOADER_START,
+    .smp_loader_start   =3D NPCM7XX_SMP_LOADER_START,
+    .smp_bootreg_addr   =3D NPCM7XX_SMP_BOOTREG_ADDR,
+    .gic_cpu_if_addr    =3D NPCM7XX_GIC_CPU_IF_ADDR,
+    .write_secondary_boot =3D npcm7xx_write_secondary_boot,
+    .board_id           =3D -1,
+};
+
+static void npcm7xx_load_kernel(MachineState *machine, NPCM7xxState *soc)
+{
+    NPCM7xxClass *sc =3D NPCM7XX_GET_CLASS(soc);
+
+    npcm7xx_binfo.ram_size =3D machine->ram_size;
+    npcm7xx_binfo.nb_cpus =3D sc->num_cpus;
+
+    arm_load_kernel(&soc->cpu[0], machine, &npcm7xx_binfo);
+}
+
+static void npcm7xx_connect_dram(NPCM7xxState *soc, MemoryRegion *dram)
+{
+    memory_region_add_subregion(get_system_memory(), NPCM7XX_DRAM_BA, dram=
);
+
+    object_property_set_link(OBJECT(soc), OBJECT(dram), "dram-mr",
+                             &error_abort);
+}
+
+static NPCM7xxState *npcm7xx_create_soc(MachineState *machine,
+                                        uint32_t hw_straps)
+{
+    NPCM7xxMachineClass *nmc =3D NPCM7XX_MACHINE_GET_CLASS(machine);
+    Object *obj;
+
+    obj =3D object_new_with_props(nmc->soc_type, OBJECT(machine), "soc",
+                                &error_abort, NULL);
+    object_property_set_uint(obj, hw_straps, "power-on-straps", &error_abo=
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
+    qdev_realize(DEVICE(soc), NULL, &error_abort);
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
+    qdev_realize(DEVICE(soc), NULL, &error_abort);
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
+    mc->no_floppy       =3D 1;
+    mc->no_cdrom        =3D 1;
+    mc->no_parallel     =3D 1;
+    mc->default_ram_id  =3D "ram";
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
+    mc->desc            =3D "Nuvoton NPCM750 Evaluation Board (Cortex A9)"=
;
+    mc->init            =3D npcm750_evb_init;
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
+    mc->desc            =3D "Quanta GSJ (Cortex A9)";
+    mc->init            =3D quanta_gsj_init;
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
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 13d163a599..c333548ce1 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -41,7 +41,7 @@ obj-$(CONFIG_STM32F205_SOC) +=3D stm32f205_soc.o
 obj-$(CONFIG_STM32F405_SOC) +=3D stm32f405_soc.o
 obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx-zynqmp.o xlnx-zcu102.o
 obj-$(CONFIG_XLNX_VERSAL) +=3D xlnx-versal.o xlnx-versal-virt.o
-obj-$(CONFIG_NPCM7XX) +=3D npcm7xx.o
+obj-$(CONFIG_NPCM7XX) +=3D npcm7xx.o npcm7xx_boards.o
 obj-$(CONFIG_FSL_IMX25) +=3D fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) +=3D fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) +=3D fsl-imx6.o
--=20
2.27.0.383.g050319c2ae-goog

