Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp5755362lfy;
        Mon, 10 Aug 2020 17:49:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBJD3Xfi+BUTiPXA5LY8kd+dyk0est3hLZQTOSR/8tw6KqJ3Q9Tah697PM6zgDDJzx8/L7
X-Received: by 2002:a9f:3dc5:: with SMTP id e5mr21808214uaj.63.1597106954985;
        Mon, 10 Aug 2020 17:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597106954; cv=none;
        d=google.com; s=arc-20160816;
        b=XYbYP5z29kRPHPuyGaQvz4Z5UcHsiU/kU5V3p9MGg0b7O6BmAQqWFeGsq2iYxCqZJr
         1fsvL+HuJbdZRqv4yMQQ/hy0p30Sd0LQlWru5CLU2HPeV8XHOlRlANjtwezQ118gFoSZ
         3AOGWhCVPJonskE++3D0iVq/9xa44lGtjMRDN/ZxTKhyHdF0VHSWmVxYFSIeA/thJbr0
         nxNIsGv5+cTZwq3Xmdz02P/C/+jutl2lf9f9mWN7r+FmkULkwp+ff8ZHhbI/FDV6mfEq
         uDlzOMXqxM7cn5mJUt0km04XZ/4oB2ti0FH1IJu0XQgdBSaGSYe+A1rbe3g44T470dib
         cHOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=gt6q82v2MPo+UIID+Xzfx+FG/Ctf/YibYXAKWSc0XBI=;
        b=nyPv5ICA+hypGOrsUWVcCWsj0IsAIU6ppJh0ZZO3rI4G7Ut5/9p/pBuceaZav2058t
         kLQUvLWIxjOZWHEOfhhwiUJTK8PP+odpHh6sTfPF4lTL3KGzqMgY2Okl/mV4XMqwaqC4
         OTdOBNf4UgTEZy5SKDGYOHi6KkhSNf//Af0zJCqelK8clXeAgTWc15sFq0aYxOGLE57U
         eIMcOPfs5ZYuPJGQffeja0SKMIvTrHJZ2bl58hlcOjifA1ODGI3kEyVgSowTJ/+JX//e
         rQYc64F1oJGVTMjIQayxuFSOAVj0ak4BfFgHkzzgHnYyHqeEfXD2ULTeE11um56QgiMM
         JMRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=BgaS1Deg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q15si3053138uaj.83.2020.08.10.17.49.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Aug 2020 17:49:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=BgaS1Deg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:50296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k5ITa-0003zk-6O
	for alex.bennee@linaro.org; Mon, 10 Aug 2020 20:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3XuoxXwsKCPkitljoofnpfohpphmf.dpnrfnv-bsnopohov.psh@flex--hskinnemoen.bounces.google.com>)
 id 1k5IQs-00077S-9h
 for qemu-arm@nongnu.org; Mon, 10 Aug 2020 20:46:26 -0400
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749]:32789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3XuoxXwsKCPkitljoofnpfohpphmf.dpnrfnv-bsnopohov.psh@flex--hskinnemoen.bounces.google.com>)
 id 1k5IQq-0004hQ-7r
 for qemu-arm@nongnu.org; Mon, 10 Aug 2020 20:46:25 -0400
Received: by mail-qk1-x749.google.com with SMTP id f18so8273553qke.0
 for <qemu-arm@nongnu.org>; Mon, 10 Aug 2020 17:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=gt6q82v2MPo+UIID+Xzfx+FG/Ctf/YibYXAKWSc0XBI=;
 b=BgaS1Deg1UhXJzea1L+8GDfaisQM68PKuhhgoxzhgBLBVU/JUtxnQ/1MKY1mpp/J+2
 yazhNWG22OMcfFJijIz7lZe7atQjWSfZdbYv84Fg9tnU/i6ra+CfulyFaVm2d1dZtGaL
 eLIoBBauxApFvTRM7g6vQN89gFM48qVY9Uq0kI+YI0j47uTwoP/Kzz687a/ssufncoSl
 sx5Pql3o1ahoy9YDUtATVrE8NPm/3oHmnkG1OEaqeTvX/rJAjThrCQ4SO9eyWcuyMfCJ
 SPyJZxdJz7FoII6yCpe7G7WwEfQZnnnyVVypr4emWsjaMOyb79HSHIuQOdGc2nlSsESc
 eYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=gt6q82v2MPo+UIID+Xzfx+FG/Ctf/YibYXAKWSc0XBI=;
 b=MxWI5VbWbpz2ffrC2ESxVeM+8rb5NzIKqSVIShG0IhGdnf2qkj97AqMvRdyfn3Oy2w
 NI+8fnKINN5eGWqU5tuNg8ev+XKDPqiah6I3/DkXoziZ19hvZt30+UZQh2mUV8sxHfLI
 UH+2xoUBVpaWx7vtpCzOpPzkd0h6BD/jsRY/lnxg235DHC2xPNQOjhhvpPmxYJe8UCc7
 uj1B+ud1Sller+09HB1wJEJXgJzxrpvw3ccmZf5dnUuRxUOgt8F/J5wDkz2ygXrrsv7w
 Lpa2TZvSwqrXE01QzHGMgplhrF5Brcv4HLubiP9n/AuoFSjYHZ7WcmAt/ZIMesOYfO9W
 gh0g==
X-Gm-Message-State: AOAM532GaktEtsIhB+KS5lSK4SuAkqnFdvsxgNkMPMBbL+XzPRoBlNP7
 dO232tk/UWfBdW83pt6kskXqjDH9t/W751Lhag==
X-Received: by 2002:a0c:a8c7:: with SMTP id h7mr31667900qvc.181.1597106782137; 
 Mon, 10 Aug 2020 17:46:22 -0700 (PDT)
Date: Tue, 11 Aug 2020 00:45:59 +0000
In-Reply-To: <20200811004607.2133149-1-hskinnemoen@google.com>
Message-Id: <20200811004607.2133149-6-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200811004607.2133149-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
Subject: [PATCH v7 05/13] hw/arm: Add two NPCM7xx-based machines
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org, f4bug@amsat.org, clg@kaod.org, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::749;
 envelope-from=3XuoxXwsKCPkitljoofnpfohpphmf.dpnrfnv-bsnopohov.psh@flex--hskinnemoen.bounces.google.com;
 helo=mail-qk1-x749.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
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
X-TUID: Nx4xxXlEMpxB

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
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   2 +-
 hw/arm/npcm7xx_boards.c         | 144 ++++++++++++++++++++++++++++++++
 include/hw/arm/npcm7xx.h        |  19 +++++
 4 files changed, 165 insertions(+), 1 deletion(-)
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
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
new file mode 100644
index 0000000000..0b9dce2b35
--- /dev/null
+++ b/hw/arm/npcm7xx_boards.c
@@ -0,0 +1,144 @@
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
--=20
2.28.0.236.gb10cc79966-goog

