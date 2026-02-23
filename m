Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A67EC1113
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:10:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZMw-0006QX-Ai; Mon, 23 Feb 2026 12:05:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZLH-0002wv-5r
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:32 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZLD-0000TL-3p
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:30 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48329eb96a7so26664935e9.3
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866203; x=1772471003; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ki1+Cj7hzmWIdImuSXSQEFK5DhzyzVZGm0uIPL+3K2k=;
 b=oBQ1oAk7piCgStWUwtZLdLor84a6JCispFPajxKruT0+jTMTb5ueHdiJ3QT7Lvb5Vc
 PzhYl2T2lJtersU5SS3D6iDGaDxAmiFToJ5qscMad0kUNH366F0LC18bNuWmmeF/bW9C
 Fcy6TNiqrDpqD5JrAIwb/sEqY0qFItbJs2h4TUm8cd7BZiaywYtRSevJQgA09AzvM8FJ
 yY2wUV12k1QurZl1t0VjclETJOLEs7wwoUxfKW+2DPz91YAj7aT4k2nsqtikl+T6axkD
 qxDYwc/uSHjCdomZMj2HphQrtRv5y/tiYrerDWsBNDi9hGqLDWmKeOk95U23nIg4oIv1
 wCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866203; x=1772471003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ki1+Cj7hzmWIdImuSXSQEFK5DhzyzVZGm0uIPL+3K2k=;
 b=cNPLpF9cNZmipDUSnrlLc2rzPDP89gOSKMv1qhQBJwXcsCEUjY1uzH1fWWqJMsbt/9
 1mGaIlW9lXlrvBCgvelhB+4VuVvg9+3Hsl8cpFZm0mpZMBuOCHqlNDkTI9HzGYHZYiLh
 gU98Fjxe1BL8e0Tcbta1AmFsZm4p8GNUpgfCyMPZbVHhJlQvCA5MML1YJjYkKaz0kcvF
 aIyfqDjSwSBSlTwZmPl22B3TaAkMdAvFw48EJgY37ef5EKZZtK2qK/h+x0UYfMcIBUhE
 ikBztHqAzi4182RoBQqxsha7YOb7Ub1ELP30dXJi+NzwGl25wOX6VUVWRgizlZsMutFu
 OYFw==
X-Gm-Message-State: AOJu0Yxk0UH5bu81hlUkGk/5QdIJK0qOZO1R1N6UIX1uDDjhbXTdA7hJ
 gzPBWyUqkfo2pH0IdfYlB+O7PcYfkFgljPi8p+ydKAMDkGhyl9fk0x+4Ll0srra2ls7WYkrzqo3
 +Dd9Q
X-Gm-Gg: AZuq6aL5PCxNsD/QjxFdvgmX2k9axn6V0Z7jgMofBARhyNkOi1lIMC2Xow1xzE+9de9
 dcbmtRvFq67Ca8pVpulHNmF7eDcEJbPi+MnOWwJTOV59jGJ4DGmfl+GYgmScXMiQWzeCtPtsN2a
 tMBzDvs8/bqgVi6cJ5ZIHLto907Z9HlHYZsTr1P3Sbg5Blgmm2z7MUfciAYU8TMav97uvAtbJP5
 ZC3KoAxxsCZVRYiInhmtUGfj5rVdCKDuvvkq565edCC7UUfuyM9RFOvMFE19H8AtoPEJD5aCsiU
 RXwUDlvz4QpA+IKA1WhR5fK5MCrs+kqsyzLC7NHiqG8FTm2YiQWEAxVYqfwUhSL93N7qS2+EZrX
 Bh0Z4k4DyG9ivUFEG+h12BDOiwEfBMDhBaAr5Zdhl+H8Rq+dF3BQKbMtW8yVZYH/jLGiCAexMpX
 ow9dVB1JqoBTKy35OSClD5k3s7nHNGvC0jQ2IiTUOUzOqCWyQ3FG2hCROKVN9mKhODHtUKMVhsb
 ATlQz42kCmZTRTXRx8k2UVkR+zxJ7I=
X-Received: by 2002:a05:600d:644d:20b0:47e:e7e5:ff32 with SMTP id
 5b1f17b1804b1-483a9605b19mr105039875e9.34.1771866203286; 
 Mon, 23 Feb 2026 09:03:23 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:03:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 63/65] hw/arm/virt: Use correct interrupt type for GICv5 SPIs
 in the DTB
Date: Mon, 23 Feb 2026 17:02:10 +0000
Message-ID: <20260223170212.441276-64-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The GICv5 devicetree binding specifies that the "interrupts" property
for devices connected to it should use the architectural INTID.TYPE
values to specify whether the interrupt is an SPI, LPI or PPI.  This
is different to the GICv2 and GICv3, so instead of hardcoding the
GIC_FDT_IRQ_TYPE_SPI constant when we create "interrupts" bindings,
create a new function gic_fdt_irq_type_spi() that returns the right
value for the interrupt controller in use.

For SPIs, the INTID.ID and the trigger-mode fields of the
"interrupts" property remain the same for GICv5 and the older GIC
versions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 05c92e8482..1b63338196 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -296,6 +296,16 @@ static bool ns_el2_virt_timer_present(void)
         arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu);
 }
 
+/*
+ * The correct value to use in a DTB "interrupts" property for an SPI
+ * depends on the GIC version.
+ */
+static int gic_fdt_irq_type_spi(const VirtMachineState *vms)
+{
+    return vms->gic_version == VIRT_GIC_VERSION_5 ?
+        GICV5_SPI : GIC_FDT_IRQ_TYPE_SPI;
+}
+
 static void create_fdt(VirtMachineState *vms)
 {
     MachineState *ms = MACHINE(vms);
@@ -1185,7 +1195,7 @@ static void create_uart(const VirtMachineState *vms, int uart,
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                      2, base, 2, size);
     qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
-                               GIC_FDT_IRQ_TYPE_SPI, irq,
+                               gic_fdt_irq_type_spi(vms), irq,
                                GIC_FDT_IRQ_FLAGS_LEVEL_HI);
     qemu_fdt_setprop_cells(ms->fdt, nodename, "clocks",
                                vms->clock_phandle, vms->clock_phandle);
@@ -1227,7 +1237,7 @@ static void create_rtc(const VirtMachineState *vms)
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                  2, base, 2, size);
     qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
-                           GIC_FDT_IRQ_TYPE_SPI, irq,
+                           gic_fdt_irq_type_spi(vms), irq,
                            GIC_FDT_IRQ_FLAGS_LEVEL_HI);
     qemu_fdt_setprop_cell(ms->fdt, nodename, "clocks", vms->clock_phandle);
     qemu_fdt_setprop_string(ms->fdt, nodename, "clock-names", "apb_pclk");
@@ -1346,7 +1356,7 @@ static void create_gpio_devices(const VirtMachineState *vms, int gpio,
     qemu_fdt_setprop_cell(ms->fdt, nodename, "#gpio-cells", 2);
     qemu_fdt_setprop(ms->fdt, nodename, "gpio-controller", NULL, 0);
     qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
-                           GIC_FDT_IRQ_TYPE_SPI, irq,
+                           gic_fdt_irq_type_spi(vms), irq,
                            GIC_FDT_IRQ_FLAGS_LEVEL_HI);
     qemu_fdt_setprop_cell(ms->fdt, nodename, "clocks", vms->clock_phandle);
     qemu_fdt_setprop_string(ms->fdt, nodename, "clock-names", "apb_pclk");
@@ -1427,7 +1437,7 @@ static void create_virtio_devices(const VirtMachineState *vms)
         qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                      2, base, 2, size);
         qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
-                               GIC_FDT_IRQ_TYPE_SPI, irq,
+                               gic_fdt_irq_type_spi(vms), irq,
                                GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
         qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL, 0);
         g_free(nodename);
@@ -1627,10 +1637,11 @@ static void create_pcie_irq_map(const MachineState *ms,
     int devfn, pin;
     uint32_t full_irq_map[4 * 4 * 10] = { 0 };
     uint32_t *irq_map = full_irq_map;
+    const VirtMachineState *vms = VIRT_MACHINE(ms);
 
     for (devfn = 0; devfn <= 0x18; devfn += 0x8) {
         for (pin = 0; pin < 4; pin++) {
-            int irq_type = GIC_FDT_IRQ_TYPE_SPI;
+            int irq_type = gic_fdt_irq_type_spi(vms);
             int irq_nr = first_irq + ((pin + PCI_SLOT(devfn)) % PCI_NUM_PINS);
             int irq_level = GIC_FDT_IRQ_FLAGS_LEVEL_HI;
             int i;
@@ -1671,10 +1682,10 @@ static void create_smmuv3_dt_bindings(const VirtMachineState *vms, hwaddr base,
     qemu_fdt_setprop_sized_cells(ms->fdt, node, "reg", 2, base, 2, size);
 
     qemu_fdt_setprop_cells(ms->fdt, node, "interrupts",
-            GIC_FDT_IRQ_TYPE_SPI, irq    , GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
-            GIC_FDT_IRQ_TYPE_SPI, irq + 1, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
-            GIC_FDT_IRQ_TYPE_SPI, irq + 2, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
-            GIC_FDT_IRQ_TYPE_SPI, irq + 3, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
+            gic_fdt_irq_type_spi(vms), irq    , GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
+            gic_fdt_irq_type_spi(vms), irq + 1, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
+            gic_fdt_irq_type_spi(vms), irq + 2, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
+            gic_fdt_irq_type_spi(vms), irq + 3, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
 
     qemu_fdt_setprop(ms->fdt, node, "interrupt-names", irq_names,
                      sizeof(irq_names));
-- 
2.43.0


