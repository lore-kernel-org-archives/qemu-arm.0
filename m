Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp559949ejb;
        Wed, 26 Jul 2023 06:48:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHKBJ4JdgKraMEgH1K/9BHTQ2s4CzEEbi+9n3c4KrbogzaxT2Po12zf8bjKfyw/eyZP9AsC
X-Received: by 2002:ac8:5c88:0:b0:401:e1e7:a2a4 with SMTP id r8-20020ac85c88000000b00401e1e7a2a4mr2187122qta.35.1690379331132;
        Wed, 26 Jul 2023 06:48:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690379331; cv=none;
        d=google.com; s=arc-20160816;
        b=OliacOkPX+9vbDV3ftDIDj7i0O8bBLr0vf5bOesgJe/7Z6tgGdSEGShduQEi0VPzua
         yTofYvr+UrDgtRvVake/CmtSw1g8nLM1FVoh1sVcQOQOTMFPiUNGBT/L9+3w6m2Wd6Bk
         4SNWptsLRPldP/Wlr5nCI7k5oZodek04JNwueKC1+HycaGL5q7D98XwURdgES3PeAZIc
         mlL9Fq09eOBN1+fNlGNx1+KxeX355V+tbMSv803+XEQiyKruxieXWkORavy2pauOdE6q
         1eo82iFdfMZTe1uBlDQeZVIZyk+a7miGJtHWiceij6urbPEsbYaEpx1uwz25cEEive0+
         UxIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NDu3hZ5VhvcgJjxwy9GaF+BFAhXUSVQ+jLdp4gFMCsA=;
        fh=f5jt6gD4kTKAQV2ukO6ZfXPs+EJm4Q1+uDtHV6gcJRE=;
        b=mFLn/bTHetYrk7KtnNSKSiMSmFAX9dZcvoOTObHXk8TJ1zwa35c6/wg7+UrI7T90fD
         0tc9UOIPx5C+MrIFJevUH7QQXYRDHErxNHQw2gpGoqtkhpzBYGatElBKkU5bqbZcEZRq
         9U5E+aayVqsTfm0SbeMgkM/kzVrNWT8l+R18LPjVHMajqzOVTSx/3EtqetNroBFT5Ng9
         f1cwTMjCU6jUc6MZ/MUVyTBwmM7w/C0lbsMNiYkoyNnhuC9qRa4S6PBTyobDL4BkjR4X
         YTfNwHs8R/U1XSte+XG+3LOIWXM8dBRxDEooXiGROpqAn3pmqwnRJAffUWxY43ODDGN5
         DmBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=suPhoPkd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s17-20020ac85cd1000000b00403e10322cfsi7827264qta.323.2023.07.26.06.48.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jul 2023 06:48:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=suPhoPkd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOeWm-0002wo-4c; Wed, 26 Jul 2023 09:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1qOeWR-0002lC-MW; Wed, 26 Jul 2023 09:25:48 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1qOeWO-0003I6-VZ; Wed, 26 Jul 2023 09:25:47 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fb73ba3b5dso10769104e87.1; 
 Wed, 26 Jul 2023 06:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690377942; x=1690982742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NDu3hZ5VhvcgJjxwy9GaF+BFAhXUSVQ+jLdp4gFMCsA=;
 b=suPhoPkda/zTXQJnAFFqaIKybZ43GD06ng+nWPxlnuiW6jAt3uid1tw5WPgOfAiULJ
 vnlQLVoIo8UYZbUYW6jf8zLqls+wlhuQUzXMX+frvFRMAMHr8yi3458AuF50rRAapC9r
 YyVFqbOfqttO9hp4qxshPWTtT31BTdNz9ESgyI6PIVwRB+hH2pfzrfnuFu4fu/bdHiFr
 Nehd0ArozZudWXOsniawkhCUqhyRj2gy1cJVZdMnsiJipAidbZDMZWMYdgSQqgaJmM4i
 9AAaB6N8d2opq85L5I3R8PdhtlWcy7HiRC3KbBQspasKrUS9s7fuZ2T12eXWFOr7356F
 Y/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690377942; x=1690982742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NDu3hZ5VhvcgJjxwy9GaF+BFAhXUSVQ+jLdp4gFMCsA=;
 b=L2fCRvnlbhxmEB13fjXEGL9+6czSdPxaD5sSKeu1gXRFgFU7t2ppQx4BBbOL81JNAm
 WgrT/PcQ0oRg49auqTJ7BlSE0bwKt6YKeT3Pok4FGUsDXDh7Oz8Smf/rxe8/n18iie/Z
 M4TcMIFSh6ojBRmLAtGSsrbsWvCWyvnVcJuo2w25+/X8tPcvCVX8yO9wth4r9464lY8M
 +ZxkKeh2n6jw2HDNBQYBqGE7lgMjOsJB3Y86rYo2sfrYE/OqpHSRdFXOYGVise1LGvNr
 KBYrjt5P2zJ1t/H45YN0tI0hdsnxyCSaxYhZTs3vtKfJ4fXSsmgyX6Ftm8CiR7fg97mZ
 j1+g==
X-Gm-Message-State: ABy/qLaFarFyF2OmJrEsfcUQfXFulgBR5+GkLypYqdQ6swpV01rr5WMC
 8D+em65Gk+PLn6FJLSWvlUIb1Mp5Vc4=
X-Received: by 2002:a05:6512:3705:b0:4fb:7666:3bbf with SMTP id
 z5-20020a056512370500b004fb76663bbfmr1345124lfr.26.1690377942520; 
 Wed, 26 Jul 2023 06:25:42 -0700 (PDT)
Received: from sergevik-thinkpad.localdomain ([213.197.136.186])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a19f516000000b004fe0c3d8bb4sm565079lfb.84.2023.07.26.06.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 06:25:42 -0700 (PDT)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH 20/44] Implement BCM2838 thermal sensor
Date: Wed, 26 Jul 2023 16:24:48 +0300
Message-Id: <20230726132512.149618-21-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726132512.149618-1-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=serg.oker@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 19Yzhesn01jC

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 hw/arm/bcm2838_peripherals.c         | 12 ++++
 hw/arm/raspi4b.c                     |  1 -
 hw/misc/bcm2838_thermal.c            | 96 ++++++++++++++++++++++++++++
 hw/misc/meson.build                  |  3 +-
 include/hw/arm/bcm2838_peripherals.h |  2 +
 include/hw/misc/bcm2838_thermal.h    | 24 +++++++
 6 files changed, 136 insertions(+), 2 deletions(-)
 create mode 100644 hw/misc/bcm2838_thermal.c
 create mode 100644 include/hw/misc/bcm2838_thermal.h

diff --git a/hw/arm/bcm2838_peripherals.c b/hw/arm/bcm2838_peripherals.c
index df97953bbe..e7a9db97ab 100644
--- a/hw/arm/bcm2838_peripherals.c
+++ b/hw/arm/bcm2838_peripherals.c
@@ -37,6 +37,9 @@ static void bcm2838_peripherals_init(Object *obj)
     /* Random Number Generator */
     object_initialize_child(obj, "rng200", &s->rng200, TYPE_BCM2838_RNG200);
 
+    /* Thermal */
+    object_initialize_child(obj, "thermal", &s->thermal, TYPE_BCM2838_THERMAL);
+
     /* PCIe Host Bridge */
     object_initialize_child(obj, "pcie-host", &s->pcie_host,
                             TYPE_BCM2838_PCIE_HOST);
@@ -98,6 +101,14 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
         qdev_get_gpio_in_named(DEVICE(&s_base->ic), BCM2835_IC_GPU_IRQ,
                                INTERRUPT_RNG));
 
+    /* THERMAL */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->thermal), errp)) {
+        return;
+    }
+    memory_region_add_subregion(
+        &s->peri_low_mr, 0x15D2000,
+        sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->thermal), 0));
+
     /* Extended Mass Media Controller 2 */
     object_property_set_uint(OBJECT(&s->emmc2), "sd-spec-version", 3,
                              &error_abort);
@@ -197,6 +208,7 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
                              BCM2838_MPHI_SIZE);
     memory_region_add_subregion(&s_base->peri_mr, BCM2838_MPHI_OFFSET,
                                 &s->mphi_mr_alias);
+
     /* PCIe Root Complex */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->pcie_host), errp)) {
         return;
diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
index 82b6b48d3c..c7fdf791d5 100644
--- a/hw/arm/raspi4b.c
+++ b/hw/arm/raspi4b.c
@@ -66,7 +66,6 @@ static void raspi4_modify_dtb(const struct arm_boot_info *info, void *fdt)
 
     /* Temporary disable following devices until they are implemented*/
     const char *to_be_removed_from_dt_as_wa[] = {
-        "brcm,bcm2711-thermal",
         "brcm,bcm2711-genet-v5",
     };
 
diff --git a/hw/misc/bcm2838_thermal.c b/hw/misc/bcm2838_thermal.c
new file mode 100644
index 0000000000..a488dc3da1
--- /dev/null
+++ b/hw/misc/bcm2838_thermal.c
@@ -0,0 +1,96 @@
+/*
+ * BCM2838 dummy thermal sensor
+ *
+ * Copyright (C) 2022 Maksim Kopusov <maksim.kopusov@auriga.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "hw/misc/bcm2838_thermal.h"
+#include "hw/registerfields.h"
+#include "migration/vmstate.h"
+#include "qemu/error-report.h"
+
+REG32(STAT, 0x200)
+FIELD(STAT, DATA, 0, 10)
+FIELD(STAT, VALID_1, 10, 1)
+FIELD(STAT, VALID_2, 16, 1)
+
+#define BCM2838_THERMAL_SIZE 0xf00
+
+#define THERMAL_OFFSET_C 410040
+#define THERMAL_COEFF  (-487.0f)
+#define MILLIDEGREE_COEFF 1000
+
+static uint16_t bcm2838_thermal_temp2adc(int temp_C)
+{
+    return (temp_C * MILLIDEGREE_COEFF - THERMAL_OFFSET_C) / THERMAL_COEFF;
+}
+
+static uint64_t bcm2838_thermal_read(void *opaque, hwaddr addr, unsigned size)
+{
+    uint32_t val = 0;
+
+    switch (addr) {
+    case A_STAT:
+        /* Temperature is always 25°C */
+         val = FIELD_DP32(val, STAT, DATA, bcm2838_thermal_temp2adc(25));
+         val = FIELD_DP32(val, STAT, VALID_1, 1);
+         val = FIELD_DP32(val, STAT, VALID_2, 1);
+
+         break;
+    default:
+         /* MemoryRegionOps are aligned, so this can not happen. */
+         warn_report("%s can't access addr: 0x%"PRIx64,
+                     TYPE_BCM2838_THERMAL, addr);
+         g_assert_not_reached();
+    }
+    return val;
+}
+
+static const MemoryRegionOps bcm2838_thermal_ops = {
+    .read = bcm2838_thermal_read,
+    .impl.max_access_size = 4,
+    .valid.min_access_size = 4,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void bcm2838_thermal_realize(DeviceState *dev, Error **errp)
+{
+    Bcm2838ThermalState *s = BCM2838_THERMAL(dev);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &bcm2838_thermal_ops,
+                          s, TYPE_BCM2838_THERMAL, BCM2838_THERMAL_SIZE);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+}
+
+static const VMStateDescription bcm2838_thermal_vmstate = {
+    .name = TYPE_BCM2838_THERMAL,
+    .version_id = 1,
+    .minimum_version_id = 1,
+};
+
+static void bcm2838_thermal_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = bcm2838_thermal_realize;
+    dc->vmsd = &bcm2838_thermal_vmstate;
+}
+
+static const TypeInfo bcm2838_thermal_info = {
+    .name = TYPE_BCM2838_THERMAL,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(Bcm2838ThermalState),
+    .class_init = bcm2838_thermal_class_init,
+};
+
+static void bcm2838_thermal_register_types(void)
+{
+    type_register_static(&bcm2838_thermal_info);
+}
+
+type_init(bcm2838_thermal_register_types)
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index a6230ced43..dc67e6be3c 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -88,7 +88,8 @@ system_ss.add(when: 'CONFIG_RASPI', if_true: files(
   'bcm2835_thermal.c',
   'bcm2835_cprman.c',
   'bcm2835_powermgt.c',
-  'bcm2838_rng200.c'
+  'bcm2838_rng200.c',
+  'bcm2838_thermal.c'
 ))
 system_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_misc.c'))
 system_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c'))
diff --git a/include/hw/arm/bcm2838_peripherals.h b/include/hw/arm/bcm2838_peripherals.h
index d52617f3bd..bb26aceb13 100644
--- a/include/hw/arm/bcm2838_peripherals.h
+++ b/include/hw/arm/bcm2838_peripherals.h
@@ -11,6 +11,7 @@
 
 #include "hw/arm/bcm2835_peripherals.h"
 #include "hw/misc/bcm2838_rng200.h"
+#include "hw/misc/bcm2838_thermal.h"
 #include "hw/arm/bcm2838_pcie.h"
 #include "hw/sd/sdhci.h"
 #include "hw/gpio/bcm2838_gpio.h"
@@ -69,6 +70,7 @@ struct BCM2838PeripheralState {
     MemoryRegion pcie_mmio_alias;
 
     BCM2838Rng200State rng200;
+    Bcm2838ThermalState thermal;
     SDHCIState emmc2;
     BCM2838PcieHostState pcie_host;
     BCM2838GpioState gpio;
diff --git a/include/hw/misc/bcm2838_thermal.h b/include/hw/misc/bcm2838_thermal.h
new file mode 100644
index 0000000000..bb6302a037
--- /dev/null
+++ b/include/hw/misc/bcm2838_thermal.h
@@ -0,0 +1,24 @@
+/*
+ * BCM2838 dummy thermal sensor
+ *
+ * Copyright (C) 2022 Maksim Kopusov <maksim.kopusov@auriga.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef BCM2838_THERMAL_H
+#define BCM2838_THERMAL_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_BCM2838_THERMAL "bcm2838-thermal"
+OBJECT_DECLARE_SIMPLE_TYPE(Bcm2838ThermalState, BCM2838_THERMAL)
+
+struct Bcm2838ThermalState {
+    SysBusDevice busdev;
+    MemoryRegion iomem;
+};
+
+#endif /* BCM2838_THERMAL_H */
-- 
2.34.1

