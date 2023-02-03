Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1642878ejb;
        Fri, 3 Feb 2023 10:10:47 -0800 (PST)
X-Google-Smtp-Source: AK7set87AnQkPq1rBjAtZUT5r5nkAczvfTa1sTC6Qe7czCfRYtmEtCDSYsM2FoexrO4rf/keiZVH
X-Received: by 2002:a05:622a:1113:b0:3b8:5dfe:ef3 with SMTP id e19-20020a05622a111300b003b85dfe0ef3mr20411373qty.68.1675447847834;
        Fri, 03 Feb 2023 10:10:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675447847; cv=none;
        d=google.com; s=arc-20160816;
        b=NXHC2yCuZfqStOX7eSdZTU/DDEOzf0OrDYtiVPOoXxWAXsS7+H90p3hlJb7xV9zyA2
         rVcIcwoQZH3mbvvDlq6JQw/eiukB0XluTKKSy/XstL4YbI0hi7yV5mEEz3HB7ma4F7rw
         D8wc9TgMcKm3XP+Nu3tvA1Pfzf3L6g5Qgrexd+r2mXsyiJn03tjMI5qP9b0UrlTbXPiu
         N1PwBl92l1sgCQXfaf2zMod3TsQxtEiQis9S7098onP/qvuddRtUytUlyW5d4ZH/vRrk
         H/9/hD4NxorE4y7XhK7+6ffplglXbCH2a1T+1U+vuqD7BOsV0qwEu82gAukDWtAXnsEc
         Iytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hq0o8xFHFnAca4/TyyUs1kwk1RCOrbTiudwSIBAx5Y8=;
        b=aiq7yrORqQ4h2hmFFGxUWM81XXr4ISDsa+RiPbIcGHIWK/8gvlZaBIDsYjfA4cJnW4
         NyvIMMJSOot3UfDqjzaDgYYY4cvNV1bEUzTfEh+pxd4cEXNeyuWX4WPUc66tWZKEw92A
         8XkpBp7wPh+xjy8TQbVzj3zRd1P5q5xBuTW0wMLPPBgfBZag83ERKL5fd5ryXAvjhixV
         njId0rs6/CAtnE4Q/0yLj8dgT7mvF2QXQdfVPcLu5yjOhEw96JpkL3FTlCN0Yq6fhqb0
         Xbkeox7R0KE9XQ9CtFUVvJAaix75RkOhgYzFNSNW3sgy0RAbfshIbirpwoKRsoEUrUfS
         KcNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NkAe4NeS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d18-20020ac85d92000000b003b86c36dd7csi2623825qtx.452.2023.02.03.10.10.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 10:10:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NkAe4NeS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pO0WB-0001Nq-1S; Fri, 03 Feb 2023 13:10:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0W9-0001Ba-0J
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 13:10:33 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0W6-0008Je-Jr
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 13:10:32 -0500
Received: by mail-wm1-x333.google.com with SMTP id u10so1448568wmj.3
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 10:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hq0o8xFHFnAca4/TyyUs1kwk1RCOrbTiudwSIBAx5Y8=;
 b=NkAe4NeSByaQj/kWcPGd7EtgfdGSl5MNN5FjupRrVOyGbuKjHpzBNN/TOpZnZnItW1
 /qTQdQUvQT0g3Pa9hpKVGqQy7++ySoZm0QAosN2EC9nAWHNCDNl/mFDQmkr3Lfd+9pFm
 jyrOB16kzUi9phWqZn/tswpB8jWmc6Evi5EIUUGylvtsoOIfMz55sdY1umBIkE1mBaQk
 XF6dvPk+omBlXhTwY2UBLOxdKIyWxNoL76oQ5L3SX3Fv/gI75akqXF6PuEY0JcwvtbIW
 ffCf6h8aCOpI3OL6RTr+apSE1WUDu6EkNX4sCzNk+PiCNqtgP3UoR75T3jsM9xI941fb
 H9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hq0o8xFHFnAca4/TyyUs1kwk1RCOrbTiudwSIBAx5Y8=;
 b=oVqMpOAqm/7LS+0OANm9CjDgYWaBdQYXjOs5nUU+WKNOGylmue2RsUFtDAH8XUUF/U
 BopbyT1w0uUT3arwszH3AREl+844Dhqt5cGV7wGFjw8a14pR8xHevhG9TsLHuKb2Q5HJ
 KmpvJAkaq3N122L1v2nem5ALsCFzNEl8owdhprNXaD0focSUMowFeVjyTSr6zX6O0cct
 mrIg10C+vjBe2Lrp/OfU0Na7zUGJiLMRBVcatlodtW7J+A0RN+UfavMMLj4qkvsBhfIu
 5HWprz2fYEk3qoL8xJZKV/T9BRyPLu4DbeBZITrC/XlJwLIsmoDR1UkOLFWIsfq1ghij
 1bKQ==
X-Gm-Message-State: AO0yUKVMVFScrhuCE+tJS7i5Yr82E8PAOWtE+XaonnUzGgXAJKmG+vjH
 GHTyP0wlMxxtafrkOscoz7sC+GEmElTxB6x2
X-Received: by 2002:a05:600c:b8e:b0:3dc:405b:99b4 with SMTP id
 fl14-20020a05600c0b8e00b003dc405b99b4mr13095532wmb.25.1675447829817; 
 Fri, 03 Feb 2023 10:10:29 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 14-20020a05600c228e00b003dd9232f036sm5347442wmf.23.2023.02.03.10.10.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:10:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 14/19] hw/microblaze: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:09:09 +0100
Message-Id: <20230203180914.49112-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: MJZjd48kk/9b

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/microblaze/petalogix_ml605_mmu.c      | 40 +++++++++++-------------
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  2 +-
 hw/microblaze/xlnx-zynqmp-pmu.c          | 40 ++++++++++--------------
 3 files changed, 35 insertions(+), 47 deletions(-)

diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index a24fadddca..c8cc7d2375 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -71,9 +71,9 @@ petalogix_ml605_init(MachineState *machine)
 {
     ram_addr_t ram_size = machine->ram_size;
     MemoryRegion *address_space_mem = get_system_memory();
-    DeviceState *dev, *dma, *eth0;
+    DeviceState *cpu, *dev, *dma, *eth0;
     Object *ds, *cs;
-    MicroBlazeCPU *cpu;
+    MicroBlazeCPU *mbcpu;
     SysBusDevice *busdev;
     DriveInfo *dinfo;
     int i;
@@ -82,16 +82,16 @@ petalogix_ml605_init(MachineState *machine)
     qemu_irq irq[32];
 
     /* init CPUs */
-    cpu = MICROBLAZE_CPU(object_new(TYPE_MICROBLAZE_CPU));
-    object_property_set_str(OBJECT(cpu), "version", "8.10.a", &error_abort);
+    cpu = DEVICE(object_new(TYPE_MICROBLAZE_CPU));
+    mbcpu = MICROBLAZE_CPU(cpu);
+    qdev_prop_set_string(cpu, "version", "8.10.a");
     /* Use FPU but don't use floating point conversion and square
      * root instructions
      */
-    object_property_set_int(OBJECT(cpu), "use-fpu", 1, &error_abort);
-    object_property_set_bool(OBJECT(cpu), "dcache-writeback", true,
-                             &error_abort);
-    object_property_set_bool(OBJECT(cpu), "endianness", true, &error_abort);
-    qdev_realize(DEVICE(cpu), NULL, &error_abort);
+    qdev_prop_set_uint8(cpu, "use-fpu", 1);
+    qdev_prop_set_bit(cpu, "dcache-writeback", true);
+    qdev_prop_set_bit(cpu, "endianness", true);
+    qdev_realize(cpu, NULL, &error_abort);
 
     /* Attach emulated BRAM through the LMB.  */
     memory_region_init_ram(phys_lmb_bram, NULL, "petalogix_ml605.lmb_bram",
@@ -115,7 +115,7 @@ petalogix_ml605_init(MachineState *machine)
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, INTC_BASEADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0,
-                       qdev_get_gpio_in(DEVICE(cpu), MB_CPU_IRQ));
+                       qdev_get_gpio_in(cpu, MB_CPU_IRQ));
     for (i = 0; i < 32; i++) {
         irq[i] = qdev_get_gpio_in(dev, i);
     }
@@ -148,10 +148,8 @@ petalogix_ml605_init(MachineState *machine)
     qdev_set_nic_properties(eth0, &nd_table[0]);
     qdev_prop_set_uint32(eth0, "rxmem", 0x1000);
     qdev_prop_set_uint32(eth0, "txmem", 0x1000);
-    object_property_set_link(OBJECT(eth0), "axistream-connected", ds,
-                             &error_abort);
-    object_property_set_link(OBJECT(eth0), "axistream-control-connected", cs,
-                             &error_abort);
+    qdev_prop_set_link(eth0, "axistream-connected", ds);
+    qdev_prop_set_link(eth0, "axistream-control-connected", cs);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(eth0), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(eth0), 0, AXIENET_BASEADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(eth0), 0, irq[AXIENET_IRQ]);
@@ -161,10 +159,8 @@ petalogix_ml605_init(MachineState *machine)
     cs = object_property_get_link(OBJECT(eth0),
                                   "axistream-control-connected-target", NULL);
     qdev_prop_set_uint32(dma, "freqhz", 100 * 1000000);
-    object_property_set_link(OBJECT(dma), "axistream-connected", ds,
-                             &error_abort);
-    object_property_set_link(OBJECT(dma), "axistream-control-connected", cs,
-                             &error_abort);
+    qdev_prop_set_link(dma, "axistream-connected", ds);
+    qdev_prop_set_link(dma, "axistream-control-connected", cs);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dma), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dma), 0, AXIDMA_BASEADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(dma), 0, irq[AXIDMA_IRQ0]);
@@ -200,11 +196,11 @@ petalogix_ml605_init(MachineState *machine)
     }
 
     /* setup PVR to match kernel settings */
-    cpu->cfg.pvr_regs[4] = 0xc56b8000;
-    cpu->cfg.pvr_regs[5] = 0xc56be000;
-    cpu->cfg.pvr_regs[10] = 0x0e000000; /* virtex 6 */
+    mbcpu->cfg.pvr_regs[4] = 0xc56b8000;
+    mbcpu->cfg.pvr_regs[5] = 0xc56be000;
+    mbcpu->cfg.pvr_regs[10] = 0x0e000000; /* virtex 6 */
 
-    microblaze_load_kernel(cpu, MEMORY_BASEADDR, ram_size,
+    microblaze_load_kernel(mbcpu, MEMORY_BASEADDR, ram_size,
                            machine->initrd_filename,
                            BINARY_DEVICE_TREE_FILE,
                            NULL);
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index 9d959d1ad8..9df1dd72f3 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -70,7 +70,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
     MemoryRegion *sysmem = get_system_memory();
 
     cpu = MICROBLAZE_CPU(object_new(TYPE_MICROBLAZE_CPU));
-    object_property_set_str(OBJECT(cpu), "version", "7.10.d", &error_abort);
+    qdev_prop_set_string(DEVICE(cpu), "version", "7.10.d");
     qdev_realize(DEVICE(cpu), NULL, &error_abort);
 
     /* Attach emulated BRAM through the LMB.  */
diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
index 5a2016672a..e6f221d3eb 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -18,6 +18,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "exec/address-spaces.h"
+#include "hw/qdev-properties.h"
 #include "hw/boards.h"
 #include "cpu.h"
 #include "boot.h"
@@ -76,35 +77,26 @@ static void xlnx_zynqmp_pmu_soc_init(Object *obj)
 static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
 {
     XlnxZynqMPPMUSoCState *s = XLNX_ZYNQMP_PMU_SOC(dev);
+    DeviceState *cpu = DEVICE(&s->cpu);
 
-    object_property_set_uint(OBJECT(&s->cpu), "base-vectors",
-                             XLNX_ZYNQMP_PMU_ROM_ADDR, &error_abort);
-    object_property_set_bool(OBJECT(&s->cpu), "use-stack-protection", true,
-                             &error_abort);
-    object_property_set_uint(OBJECT(&s->cpu), "use-fpu", 0, &error_abort);
-    object_property_set_uint(OBJECT(&s->cpu), "use-hw-mul", 0, &error_abort);
-    object_property_set_bool(OBJECT(&s->cpu), "use-barrel", true,
-                             &error_abort);
-    object_property_set_bool(OBJECT(&s->cpu), "use-msr-instr", true,
-                             &error_abort);
-    object_property_set_bool(OBJECT(&s->cpu), "use-pcmp-instr", true,
-                             &error_abort);
-    object_property_set_bool(OBJECT(&s->cpu), "use-mmu", false, &error_abort);
-    object_property_set_bool(OBJECT(&s->cpu), "endianness", true,
-                             &error_abort);
-    object_property_set_str(OBJECT(&s->cpu), "version", "8.40.b",
-                            &error_abort);
-    object_property_set_uint(OBJECT(&s->cpu), "pvr", 0, &error_abort);
+    qdev_prop_set_uint32(cpu, "base-vectors", XLNX_ZYNQMP_PMU_ROM_ADDR);
+    qdev_prop_set_bit(cpu, "use-stack-protection", true);
+    qdev_prop_set_uint8(cpu, "use-fpu", 0);
+    qdev_prop_set_uint8(cpu, "use-hw-mul", 0);
+    qdev_prop_set_bit(cpu, "use-barrel", true);
+    qdev_prop_set_bit(cpu, "use-msr-instr", true);
+    qdev_prop_set_bit(cpu, "use-pcmp-instr", true);
+    qdev_prop_set_bit(cpu, "use-mmu", false);
+    qdev_prop_set_bit(cpu, "endianness", true);
+    qdev_prop_set_string(cpu, "version", "8.40.b");
+    qdev_prop_set_uint8(cpu, "pvr", 0);
     if (!qdev_realize(DEVICE(&s->cpu), NULL, errp)) {
         return;
     }
 
-    object_property_set_uint(OBJECT(&s->intc), "intc-intr-size", 0x10,
-                             &error_abort);
-    object_property_set_uint(OBJECT(&s->intc), "intc-level-edge", 0x0,
-                             &error_abort);
-    object_property_set_uint(OBJECT(&s->intc), "intc-positive", 0xffff,
-                             &error_abort);
+    qdev_prop_set_uint32(DEVICE(&s->intc), "intc-intr-size", 0x10);
+    qdev_prop_set_uint32(DEVICE(&s->intc), "intc-level-edge", 0x0);
+    qdev_prop_set_uint32(DEVICE(&s->intc), "intc-positive", 0xffff);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->intc), errp)) {
         return;
     }
-- 
2.38.1

