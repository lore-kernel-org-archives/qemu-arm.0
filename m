Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp539879njc;
        Thu, 13 Feb 2025 04:24:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW4xDChYCNAT3Q2v+o3avXE7dpmktg8uPDiZF6tEGXlkqdfafEFVg+sjRWAQzOqnw9fxicjcOxVxCcKDQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGvtyR/DsueVpWyzuc9jAC37xi/YxF7bQYQsq57/S0JzNRIQBSC8XXR1g7K6w9Gh3ns29d7
X-Received: by 2002:a05:622a:1f15:b0:471:9f8e:9fb0 with SMTP id d75a77b69052e-471afe4eb34mr110038111cf.27.1739449455486;
        Thu, 13 Feb 2025 04:24:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739449455; cv=none;
        d=google.com; s=arc-20240605;
        b=G05XHVLQTdO/fAPkgrr9RzniBfr9TFD89ynqJU+9hmFHloTZWubM4MTbFvPWKp0f2Z
         4BipNLoZhUfefoRu6/iMxU2WwitjVbfWGl7C0+Zt4cR15xXtTgh/W9g7OUXbTQB6sATZ
         IozTafSkZwhT/b6bVr/ArkSURFOiKSFPTglqKQsfaX+/uEt7Rol8G24AQfGJpQ6QlFRX
         zumGNc2CzhFXLVFw8DRjvu2bZE8MOdKtiDwQhv/Ie1ErV7+hjStLeN3XbXoMlyMYooPH
         4+2h3ZgpIknW8ESwTHJOiqoBuI+5HYWroAFiRG/2AYqc9aP9OZQf2ZCbR+slLXUB1Roz
         ES1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kzVstd/WanADpU0G4jEJI1w8lBuZvtH+Hm5ddGyKGck=;
        fh=1AazB7QjmL995myFqHtUdeNQVTA6mqBXZRKGdKBOf6M=;
        b=lsjxWR2IENV2cs1h9Fr53SdsIbw50RkmBYu87roP7kf2QrzXQSLGApW+uUHK86qUC2
         MAnETnFtQZn15pAAvninvr2WPMhiBMJoCK3Y8Q2L7zmWOC1R+MDFpmnbo5ThgTGO2Fy9
         g0L9F1oo1LsibaaxHZJ6gK0pW2SsRqWbAcXqKl8hNkCHepoNFlAF7PSzImHtb1s6L6yn
         PGnHL1cXJkKuuS4uG1e4mhTgN3l7LCY0mWpfzXYd6nGob1q3flX+eUXIMKEKTT8he+g1
         tLFwSpk3VcNo+yea7EQhkdJz896PKoNg2OkUhH8z65eEJwKhAXpNBfJVsWHENB1+lSuF
         67fQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m0Es762X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471c2b7867dsi11978061cf.610.2025.02.13.04.24.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2025 04:24:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m0Es762X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiYEt-00025Y-NZ; Thu, 13 Feb 2025 07:22:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiYEq-00022c-Lv
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 07:22:40 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiYEm-0002V7-9Y
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 07:22:39 -0500
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ab7c14b880dso181326066b.1
 for <qemu-arm@nongnu.org>; Thu, 13 Feb 2025 04:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739449354; x=1740054154; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kzVstd/WanADpU0G4jEJI1w8lBuZvtH+Hm5ddGyKGck=;
 b=m0Es762XKKw7U0KAdLkDhMCVSi1qitphoAdmadDcp3YdkOZbAuxOjpVFqGcmb77Aav
 7fqrilR3NeTGpTATw7hJzuefi2/HnT2m/LAHHweE1he5dcYAqyqgEIiL4kaAF28USpvb
 bJohADTb+ntbNdChm5F1no9NzN+/jfCbqC+DIyqaK1N73ksIH9Ee0Q7U5Yhua2idQTZo
 JidppUK3sMuN1TiI9/X4/S8MHkixNwd9/E0HQh5QDgBN16qIyK14C0GN3+MLpz/ZG833
 faVigDgkjrligrXZe/IC8svNdUHl1nNLHyKa6z84ZTZplCmxQRHPef7G7gNlT/7CH7su
 MB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739449354; x=1740054154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kzVstd/WanADpU0G4jEJI1w8lBuZvtH+Hm5ddGyKGck=;
 b=wGZ86qMNg207ymBXeUHwkBJeBPrrRIDYXX/qJeESt0pHieWV4g8aYkUglGNQFxnh9V
 lLR2I40MFtF/sWVStyQqwvabhLv0jHN0VK9WkID0vQnZbmJ7uHXy4G1+FKc4DBu+yu2n
 jVWr0u5O/eRoGstJVbIInB7k4u4oZI3dv6s9j/StJLhNH//Se5pQhunXgjHPu/K8M/G9
 j4JFE36lo29cvQXcSbcU+CA+C5mVAHNf8EGG8o2JrHt+aeKUc/1/B85FCNX3WJ9+8clg
 iRvA9f463hsyB0cJ3wpM+asw/EZl58LGPEKiSMdzJjUjAK/Mwin4d0ab9rOAQwNNowwT
 MY7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdWsFbi8SZzWn/gCGDsY+hrArl2L3lLeZSDy5r3h0DpXXTQjxVUSA8SlRuhSsG9j7LtckBV3qAnA==@nongnu.org
X-Gm-Message-State: AOJu0YwJm1btFnMTX3FPlvPTUSAi477AnCUPeXfJ7VFFZNDhsbApl5ky
 NOjUxf/cWvC44mHNMT/CU3WYCqUxWHVKITmLXb6LdTsRdO/0sgC7GxEIMr1ut00=
X-Gm-Gg: ASbGncugcD3t43NM8FJHYrt0YWVY5Pm8BP+LNLvTq8fLjlceZ8OI7hXd6/6Gsiklknl
 yCicKKNgQ4BbKLpAjD5ISGGjtAEBDzgYtcXLkJm0zXhthfuY5u0qpncRNEsF2WvqoXLdVHEFmcb
 X+IvJeHxz4M2/sf140PZ4p3HLVhW7YJBN0s/2ZERvNjDCA0egcksLbqD93ny9aJp0fCz+3+rrDC
 Q6i0nfcgiYOpZnQbmD8rxjEWL5oCZjWv0Yew4oWN/ARrALLZfEWZzYDi0zJlDCjirtaGD51nZuP
 7Va21cZ4kdtV7fmkH1rPSavY1Xi6gVpHhIma06HVGMYVOd6F8d81zMLVVBBu
X-Received: by 2002:a17:907:28d1:b0:ab9:63bd:91be with SMTP id
 a640c23a62f3a-ab963bd9feamr245210466b.3.1739449354114; 
 Thu, 13 Feb 2025 04:22:34 -0800 (PST)
Received: from localhost.localdomain (6.170.88.92.rev.sfr.net. [92.88.170.6])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba532552a2sm122968766b.52.2025.02.13.04.22.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Feb 2025 04:22:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v8 2/6] hw/intc/xilinx_intc: Make device endianness
 configurable
Date: Thu, 13 Feb 2025 13:22:13 +0100
Message-ID: <20250213122217.62654-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250213122217.62654-1-philmd@linaro.org>
References: <20250213122217.62654-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: he84fzs6SgQM

Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair of
DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.

Add the "endianness" property to select the device endianness.
This property is unspecified by default, and machines need to
make it explicit.

Set the proper endianness for each machine using the device.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/xilinx_intc.c                    | 59 ++++++++++++++++++------
 hw/microblaze/petalogix_ml605_mmu.c      |  3 ++
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  3 ++
 hw/ppc/virtex_ml507.c                    |  1 +
 hw/riscv/microblaze-v-generic.c          |  1 +
 5 files changed, 53 insertions(+), 14 deletions(-)

diff --git a/hw/intc/xilinx_intc.c b/hw/intc/xilinx_intc.c
index 6930f83907a..ab1c4a32221 100644
--- a/hw/intc/xilinx_intc.c
+++ b/hw/intc/xilinx_intc.c
@@ -3,6 +3,9 @@
  *
  * Copyright (c) 2009 Edgar E. Iglesias.
  *
+ * https://docs.amd.com/v/u/en-US/xps_intc
+ * DS572: LogiCORE IP XPS Interrupt Controller (v2.01a)
+ *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
  * in the Software without restriction, including without limitation the rights
@@ -23,10 +26,12 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "qemu/module.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
 #include "qom/object.h"
 
 #define D(x)
@@ -49,6 +54,7 @@ struct XpsIntc
 {
     SysBusDevice parent_obj;
 
+    EndianMode model_endianness;
     MemoryRegion mmio;
     qemu_irq parent_irq;
 
@@ -140,18 +146,28 @@ static void pic_write(void *opaque, hwaddr addr,
     update_irq(p);
 }
 
-static const MemoryRegionOps pic_ops = {
-    .read = pic_read,
-    .write = pic_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-    .impl = {
-        .min_access_size = 4,
-        .max_access_size = 4,
+static const MemoryRegionOps pic_ops[2] = {
+    [0 ... 1] = {
+        .read = pic_read,
+        .write = pic_write,
+        .impl = {
+            .min_access_size = 4,
+            .max_access_size = 4,
+        },
+        .valid = {
+            /*
+             * All XPS INTC registers are accessed through the PLB interface.
+             * The base address for these registers is provided by the
+             * configuration parameter, C_BASEADDR. Each register is 32 bits
+             * although some bits may be unused and is accessed on a 4-byte
+             * boundary offset from the base address.
+             */
+            .min_access_size = 4,
+            .max_access_size = 4,
+        },
     },
-    .valid = {
-        .min_access_size = 4,
-        .max_access_size = 4
-    }
+    [0].endianness = DEVICE_LITTLE_ENDIAN,
+    [1].endianness = DEVICE_BIG_ENDIAN,
 };
 
 static void irq_handler(void *opaque, int irq, int level)
@@ -174,13 +190,27 @@ static void xilinx_intc_init(Object *obj)
 
     qdev_init_gpio_in(DEVICE(obj), irq_handler, 32);
     sysbus_init_irq(SYS_BUS_DEVICE(obj), &p->parent_irq);
-
-    memory_region_init_io(&p->mmio, obj, &pic_ops, p, "xlnx.xps-intc",
-                          R_MAX * 4);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &p->mmio);
 }
 
+static void xilinx_intc_realize(DeviceState *dev, Error **errp)
+{
+    XpsIntc *p = XILINX_INTC(dev);
+
+    if (p->model_endianness == ENDIAN_MODE_UNSPECIFIED) {
+        error_setg(errp, TYPE_XILINX_INTC " property 'endianness'"
+                         " must be set to 'big' or 'little'");
+        return;
+    }
+
+    memory_region_init_io(&p->mmio, OBJECT(dev),
+                          &pic_ops[p->model_endianness == ENDIAN_MODE_BIG],
+                          p, "xlnx.xps-intc",
+                          R_MAX * 4);
+}
+
 static const Property xilinx_intc_properties[] = {
+    DEFINE_PROP_ENDIAN_NODEFAULT("endianness", XpsIntc, model_endianness),
     DEFINE_PROP_UINT32("kind-of-intr", XpsIntc, c_kind_of_intr, 0),
 };
 
@@ -188,6 +218,7 @@ static void xilinx_intc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->realize = xilinx_intc_realize;
     device_class_set_props(dc, xilinx_intc_properties);
 }
 
diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index 8b44be75a22..a876aeb0bba 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -80,6 +80,8 @@ petalogix_ml605_init(MachineState *machine)
     MemoryRegion *phys_lmb_bram = g_new(MemoryRegion, 1);
     MemoryRegion *phys_ram = g_new(MemoryRegion, 1);
     qemu_irq irq[32];
+    EndianMode endianness = TARGET_BIG_ENDIAN ? ENDIAN_MODE_BIG
+                                              : ENDIAN_MODE_LITTLE;
 
     /* init CPUs */
     cpu = MICROBLAZE_CPU(object_new(TYPE_MICROBLAZE_CPU));
@@ -111,6 +113,7 @@ petalogix_ml605_init(MachineState *machine)
 
 
     dev = qdev_new("xlnx.xps-intc");
+    qdev_prop_set_enum(dev, "endianness", endianness);
     qdev_prop_set_uint32(dev, "kind-of-intr", 1 << TIMER_IRQ);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, INTC_BASEADDR);
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index 2c0d8c34cd2..15cabe11777 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -71,6 +71,8 @@ petalogix_s3adsp1800_init(MachineState *machine)
     MemoryRegion *phys_ram = g_new(MemoryRegion, 1);
     qemu_irq irq[32];
     MemoryRegion *sysmem = get_system_memory();
+    EndianMode endianness = TARGET_BIG_ENDIAN ? ENDIAN_MODE_BIG
+                                              : ENDIAN_MODE_LITTLE;
 
     cpu = MICROBLAZE_CPU(object_new(TYPE_MICROBLAZE_CPU));
     object_property_set_str(OBJECT(cpu), "version", "7.10.d", &error_abort);
@@ -95,6 +97,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
                           64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1);
 
     dev = qdev_new("xlnx.xps-intc");
+    qdev_prop_set_enum(dev, "endianness", endianness);
     qdev_prop_set_uint32(dev, "kind-of-intr",
                          1 << ETHLITE_IRQ | 1 << UARTLITE_IRQ);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 23238119273..df8f9644829 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -217,6 +217,7 @@ static void virtex_init(MachineState *machine)
 
     cpu_irq = qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT);
     dev = qdev_new("xlnx.xps-intc");
+    qdev_prop_set_enum(dev, "endianness", ENDIAN_MODE_BIG);
     qdev_prop_set_uint32(dev, "kind-of-intr", 0);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, INTC_BASEADDR);
diff --git a/hw/riscv/microblaze-v-generic.c b/hw/riscv/microblaze-v-generic.c
index 26788a1824a..ebdd461ae98 100644
--- a/hw/riscv/microblaze-v-generic.c
+++ b/hw/riscv/microblaze-v-generic.c
@@ -79,6 +79,7 @@ static void mb_v_generic_init(MachineState *machine)
     memory_region_add_subregion(sysmem, ddr_base, phys_ram);
 
     dev = qdev_new("xlnx.xps-intc");
+    qdev_prop_set_enum(dev, "endianness", ENDIAN_MODE_LITTLE);
     qdev_prop_set_uint32(dev, "kind-of-intr",
                          1 << UARTLITE_IRQ);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-- 
2.47.1

