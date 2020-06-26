Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp920370lfm;
        Fri, 26 Jun 2020 16:57:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdySocVH3wpP9zh7dkKnJq2XpBVpBxkzA1ey5gdIBbR5LyBiK2nB/UXoQm/gl7THPv7bKd
X-Received: by 2002:a5b:307:: with SMTP id j7mr8660712ybp.292.1593215872401;
        Fri, 26 Jun 2020 16:57:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593215872; cv=none;
        d=google.com; s=arc-20160816;
        b=VAfN2AjYYjxjocqlY8HVOwp9ldQCPrQ2U//zilYGgVX9HotyVIH0kXFdE8GR0Zapoh
         7D9YCCOfINsvjBUenUie+Qx9gUcJohFAWnMbE+fREIDmvd6xhpYcAnnkuz7u6se80gt5
         zGkn2u7uABN39JHILhrAKMA0XoiE46fok/2fseCukW1prM7eF39U5YYLo7ESYJ7Jv0U2
         IKWT2IS9SUQ6hkE4wlGp9XKU2eFEGZWwF4hsxsa1qzCglbscMXKU3ywc0Cfmec1X7D/n
         NjSCBULzrBQWnyxQIi4QEPeNyx2IZ/8v55vo/vwnDXyz9rhD4HKOdW75Skge40XMsjxY
         gPPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=VY3rbt0GvJaQReeiX7aDk07oAXrwlgq2RUExTgOvm3A=;
        b=U5XKCcCpwpgSlPdJiWTHoBCk1Q4cekrwNV+9N1Pnq9sTioIHRcQr0hRi8CidCclpQD
         vXb21qmTtGjqOhuGqEl1bxJeU/JAL5iC+94Ad7BdE3cW7/d8oRSMGX64Dd7mfOoi71R0
         NsTbRNqYAMhBPW8H9lkZdBbOVh/R8KMoLdEnyIqq9sXb46dGGYYhebcWqiGspyotwBlj
         cf/BA+sImQwmyQYe541oHxgI9ZrUevJOxIch+aZylv7zFr9vymr2tQdRZdxtGSh5NC7O
         h2cyxMWP/K8eGfnxmyFEsA1WkwarWtp8p1qd1SHGA10xcMvUVauK27jgPFL/dS+7x1sa
         vSUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=GLMttdIZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7si27312962ybk.128.2020.06.26.16.57.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 16:57:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=GLMttdIZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:45350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joyEB-0003M6-Mw
	for alex.bennee@linaro.org; Fri, 26 Jun 2020 19:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3B4v2XgsKCPQdogejjaikajckkcha.Ykimaiq-Wnijkjcjq.knc@flex--hskinnemoen.bounces.google.com>)
 id 1joyCJ-0007nH-89
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 19:55:55 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:39890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3B4v2XgsKCPQdogejjaikajckkcha.Ykimaiq-Wnijkjcjq.knc@flex--hskinnemoen.bounces.google.com>)
 id 1joyCH-00027n-3h
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 19:55:54 -0400
Received: by mail-pg1-x549.google.com with SMTP id e22so7742954pgl.6
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2020 16:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=VY3rbt0GvJaQReeiX7aDk07oAXrwlgq2RUExTgOvm3A=;
 b=GLMttdIZy+26BuSfCND6TPUln39J3DVt3X4W7Sgrd5dpJuKk/3RzIsv2XbIcwIJ7Cf
 Wgfp5xQH7AgYQkDq4DVrfi6LeEyu0wqMsjAYmtqpKG7e3YiddRABGeYEZp0CzOlstcac
 Hy/lqbfCNtoEut0wyDB1UuYxAz6ZBDKCP1uovX34FHLJJAz1Tu04vYB4/0d30HQ1vh35
 6jNiM02UBuOOSKDj9nBIeHOtlOm4YeQmA88asKCZBHRnv4CsSBiH3CjJYwf7AoJoxGv7
 Zuo9TW7wFPGiI0Aoap8dBGRld11ecA3YUJTsIP0KN/bFxvxumV7sN57/oy0IHC9zEVwK
 OTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=VY3rbt0GvJaQReeiX7aDk07oAXrwlgq2RUExTgOvm3A=;
 b=KKNuL3dZF7rnaL2rfABFDXBkvsHaF59XXoXCVlm6HdtkgY3UanFYdTLGEjnFcRLtPI
 nCUGvzndd/Wls9T8JWFao/lB5QkmNEU/2rlNszIP43scDDyl28NKZ5iifEs1oNuRRiGJ
 2YRTtqgv5l3pCUOUvj/no2+xU2ZGxiRo7JvhpqMD5oI44eFwJLUN/Akw9AqiSQg3YRbx
 0ee8dTOZbDcZK+qv2DfdB+76NHuuUkleBX+2I18xq1DLaqIljliUdxP4xqWt0EThsbX6
 jdDguNXmXCfVVrhcf6NcBiLRZDUbVMRQf1tJotLUJb+UzYvFSkMyrq30UW10yM36Am99
 42pw==
X-Gm-Message-State: AOAM530H8OnUDhS0CyZGc/tUeQ4S+woZSxpfO8A3OFHl1R+GzXCRodxL
 pzaYzntSBaunmfdH50ZFKoeBSltL3HL02i/JOA==
X-Received: by 2002:a17:90a:cc18:: with SMTP id
 b24mr6025997pju.118.1593215751409; 
 Fri, 26 Jun 2020 16:55:51 -0700 (PDT)
Date: Fri, 26 Jun 2020 16:55:13 -0700
In-Reply-To: <20200626235519.591734-1-hskinnemoen@google.com>
Message-Id: <20200626235519.591734-7-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200626235519.591734-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v3 06/12] hw/arm: Add two NPCM7xx-based machines
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org, clg@kaod.org, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3B4v2XgsKCPQdogejjaikajckkcha.Ykimaiq-Wnijkjcjq.knc@flex--hskinnemoen.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=_AUTOLEARN
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
X-TUID: 1v7HsT1YiZW7

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
 hw/arm/Makefile.objs     |   2 +-
 hw/arm/npcm7xx_boards.c  | 147 +++++++++++++++++++++++++++++++++++++++
 include/hw/arm/npcm7xx.h |  19 +++++
 3 files changed, 167 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/npcm7xx_boards.c

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
index 0000000000..c82d9e018b
--- /dev/null
+++ b/hw/arm/npcm7xx_boards.c
@@ -0,0 +1,147 @@
+/*
+ * Machine definitions for boards featuring an NPCM7xx SoC.
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
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
+static NPCM7xxState *npcm7xx_create_soc(MachineState *machine,
+                                        uint32_t hw_straps)
+{
+    NPCM7xxMachineClass *nmc =3D NPCM7XX_MACHINE_GET_CLASS(machine);
+    NPCM7xxState *soc;
+
+    soc =3D NPCM7XX(object_new_with_props(nmc->soc_type, OBJECT(machine), =
"soc",
+                                        &error_abort, NULL));
+    object_property_set_link(OBJECT(soc), OBJECT(machine->ram), "dram",
+                             &error_abort);
+    object_property_set_uint(OBJECT(soc), hw_straps, "power-on-straps",
+                             &error_abort);
+    qdev_realize(DEVICE(soc), NULL, &error_abort);
+
+    return soc;
+}
+
+static void npcm750_evb_init(MachineState *machine)
+{
+    NPCM7xxState *soc;
+
+    soc =3D npcm7xx_create_soc(machine, NPCM750_EVB_POWER_ON_STRAPS);
+
+    npcm7xx_load_kernel(machine, soc);
+}
+
+static void quanta_gsj_init(MachineState *machine)
+{
+    NPCM7xxState *soc;
+
+    soc =3D npcm7xx_create_soc(machine, QUANTA_GSJ_POWER_ON_STRAPS);
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
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 38b8c33729..a241af0b8c 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -30,6 +30,25 @@
 #define NPCM7XX_SMP_BOOTREG_ADDR        (0xF080013C)  /* GCR.SCRPAD */
 #define NPCM7XX_GIC_CPU_IF_ADDR         (0xF03FE100)  /* GIC within A9 */
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
2.27.0.212.ge8ba1cc988-goog

