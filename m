Received: by 10.25.44.15 with SMTP id s15csp761577lfs;
        Fri, 14 Jul 2017 03:53:28 -0700 (PDT)
X-Received: by 10.55.106.66 with SMTP id f63mr9888328qkc.167.1500029608069;
        Fri, 14 Jul 2017 03:53:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500029608; cv=none;
        d=google.com; s=arc-20160816;
        b=Q0OJbV9d4sSBTUMoQqTntg93HgR3SQpcOzF7SMz1X96UuRwuzgoZ7vjeVPkiDN2cdd
         4RBteUAJeUPM29YJU68/0naRJi2OtPjH8U+wO42mcCi9Zr+UsaRRJLx4qBOulUmGUKpP
         P/x2YLdWfjhoDQ6xDugWSLNEM2NYm/tq5/ns/Zm7QBhJPKZfdFC3FTVcpLslJN+B/YUV
         9vXDNXkGXAzDNoS0D/i/XQOfWD7Nvn2xYMZ/lL5lmANQ/PokDBF3IqLbL14Bzj6gbR/m
         XoPeq5oULg6txD3Cj3IORhP74Y15CkeOD4S1XTzfh394265Sti0MJYTXmM5gC49rf30R
         RJkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=TAKTGte9taKbmuvCEoaxbt4yqz1lkfYcZxxHYg+MH+o=;
        b=wWP3F3lFXyAUJliv4v235DOcUCnJq9epHh04WtKQgX74tJZd/o8KMxw77zVc8JDGTs
         IiOYh2mvsW8JZ84WVxw3WidqE4D3i1JXPP2E5KzpdoW6A89PXh9A1+r4WldywnGtVYMg
         JaihR3Gjf3QxNeQk5kvO7FUt82A6xlfGA4C8zBxmNMtpq1eNzytZnd0B4rtpWyorpUVh
         9lkkaXV08ycQLEWs83ihzueIpzYBjXkFOBTiOgqdIjmyh7+V0lWvdGrYpF07zPPET7cB
         j4gP+N+xwH9DyoEIpEjaCMBn2piX1itkaPMyIixV85XX80noNxt4aJN8p8ePysPtP7T8
         6YAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j65si7376954qkf.286.2017.07.14.03.53.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Jul 2017 03:53:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVyDt-0006DD-3Z
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 06:53:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dVyCT-0004yt-IS
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 06:52:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dVyCP-0007Jm-GH
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 06:51:57 -0400
Received: from [2001:8b0:1d0::2] (port=37583 helo=orth.archaic.org.uk)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dVyCP-00072e-6z; Fri, 14 Jul 2017 06:51:53 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dVyBz-0007jc-UQ; Fri, 14 Jul 2017 11:51:27 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 14 Jul 2017 11:51:19 +0100
Message-Id: <1500029487-14822-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500029487-14822-1-git-send-email-peter.maydell@linaro.org>
References: <1500029487-14822-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 1/9] hw/arm/mps2: Implement skeleton
 mps2-an385 and mps2-an511 board models
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
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X9LRDOeZ6twA

Model the ARM MPS2/MPS2+ FPGA based development board.

The MPS2 and MPS2+ dev boards are FPGA based (the 2+ has a bigger
FPGA but is otherwise the same as the 2). Since the CPU itself
and most of the devices are in the FPGA, the details of the board
as seen by the guest depend significantly on the FPGA image.

We model the following FPGA images:
 "mps2_an385" -- Cortex-M3 as documented in ARM Application Note AN385
 "mps2_an511" -- Cortex-M3 'DesignStart' as documented in AN511

They are fairly similar but differ in the details for some
peripherals.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Makefile.objs            |   1 +
 hw/arm/mps2.c                   | 271 ++++++++++++++++++++++++++++++++++++++++
 default-configs/arm-softmmu.mak |   1 +
 3 files changed, 273 insertions(+)
 create mode 100644 hw/arm/mps2.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 4c5c4ee..a2e56ec 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -18,3 +18,4 @@ obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
+obj-$(CONFIG_MPS2) += mps2.o
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
new file mode 100644
index 0000000..3dad02d
--- /dev/null
+++ b/hw/arm/mps2.c
@@ -0,0 +1,271 @@
+/*
+ * ARM V2M MPS2 board emulation.
+ *
+ * Copyright (c) 2017 Linaro Limited
+ * Written by Peter Maydell
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 or
+ *  (at your option) any later version.
+ */
+
+/* The MPS2 and MPS2+ dev boards are FPGA based (the 2+ has a bigger
+ * FPGA but is otherwise the same as the 2). Since the CPU itself
+ * and most of the devices are in the FPGA, the details of the board
+ * as seen by the guest depend significantly on the FPGA image.
+ * We model the following FPGA images:
+ *  "mps2-an385" -- Cortex-M3 as documented in ARM Application Note AN385
+ *  "mps2-an511" -- Cortex-M3 'DesignStart' as documented in AN511
+ *
+ * Links to the TRM for the board itself and to the various Application
+ * Notes which document the FPGA images can be found here:
+ *   https://developer.arm.com/products/system-design/development-boards/cortex-m-prototyping-system
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "hw/arm/arm.h"
+#include "hw/arm/armv7m.h"
+#include "hw/boards.h"
+#include "exec/address-spaces.h"
+#include "hw/misc/unimp.h"
+
+typedef enum MPS2FPGAType {
+    FPGA_AN385,
+    FPGA_AN511,
+} MPS2FPGAType;
+
+typedef struct {
+    MachineClass parent;
+    MPS2FPGAType fpga_type;
+    const char *cpu_model;
+} MPS2MachineClass;
+
+typedef struct {
+    MachineState parent;
+
+    ARMv7MState armv7m;
+    MemoryRegion psram;
+    MemoryRegion ssram1;
+    MemoryRegion ssram1_m;
+    MemoryRegion ssram23;
+    MemoryRegion ssram23_m;
+    MemoryRegion blockram;
+    MemoryRegion blockram_m1;
+    MemoryRegion blockram_m2;
+    MemoryRegion blockram_m3;
+    MemoryRegion sram;
+} MPS2MachineState;
+
+#define TYPE_MPS2_MACHINE "mps2"
+#define TYPE_MPS2_AN385_MACHINE MACHINE_TYPE_NAME("mps2-an385")
+#define TYPE_MPS2_AN511_MACHINE MACHINE_TYPE_NAME("mps2-an511")
+
+#define MPS2_MACHINE(obj)                                       \
+    OBJECT_CHECK(MPS2MachineState, obj, TYPE_MPS2_MACHINE)
+#define MPS2_MACHINE_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(MPS2MachineClass, obj, TYPE_MPS2_MACHINE)
+#define MPS2_MACHINE_CLASS(klass) \
+    OBJECT_CLASS_CHECK(MPS2MachineClass, klass, TYPE_MPS2_MACHINE)
+
+/* Main SYSCLK frequency in Hz */
+#define SYSCLK_FRQ 25000000
+
+/* Initialize the auxiliary RAM region @mr and map it into
+ * the memory map at @base.
+ */
+static void make_ram(MemoryRegion *mr, const char *name,
+                     hwaddr base, hwaddr size)
+{
+    memory_region_init_ram(mr, NULL, name, size, &error_fatal);
+    vmstate_register_ram_global(mr);
+    memory_region_add_subregion(get_system_memory(), base, mr);
+}
+
+/* Create an alias of an entire original MemoryRegion @orig
+ * located at @base in the memory map.
+ */
+static void make_ram_alias(MemoryRegion *mr, const char *name,
+                           MemoryRegion *orig, hwaddr base)
+{
+    memory_region_init_alias(mr, NULL, name, orig, 0,
+                             memory_region_size(orig));
+    memory_region_add_subregion(get_system_memory(), base, mr);
+}
+
+static void mps2_common_init(MachineState *machine)
+{
+    MPS2MachineState *mms = MPS2_MACHINE(machine);
+    MPS2MachineClass *mmc = MPS2_MACHINE_GET_CLASS(machine);
+    MemoryRegion *system_memory = get_system_memory();
+    DeviceState *armv7m;
+
+    if (!machine->cpu_model) {
+        machine->cpu_model = mmc->cpu_model;
+    }
+
+    if (strcmp(machine->cpu_model, mmc->cpu_model) != 0) {
+        error_report("This board can only be used with CPU %s", mmc->cpu_model);
+        exit(1);
+    }
+
+    /* The FPGA images have an odd combination of different RAMs,
+     * because in hardware they are different implementations and
+     * connected to different buses, giving varying performance/size
+     * tradeoffs. For QEMU they're all just RAM, though. We arbitrarily
+     * call the 16MB our "system memory", as it's the largest lump.
+     *
+     * Common to both boards:
+     *  0x21000000..0x21ffffff : PSRAM (16MB)
+     * AN385 only:
+     *  0x00000000 .. 0x003fffff : ZBT SSRAM1
+     *  0x00400000 .. 0x007fffff : mirror of ZBT SSRAM1
+     *  0x20000000 .. 0x203fffff : ZBT SSRAM 2&3
+     *  0x20400000 .. 0x207fffff : mirror of ZBT SSRAM 2&3
+     *  0x01000000 .. 0x01003fff : block RAM (16K)
+     *  0x01004000 .. 0x01007fff : mirror of above
+     *  0x01008000 .. 0x0100bfff : mirror of above
+     *  0x0100c000 .. 0x0100ffff : mirror of above
+     * AN511 only:
+     *  0x00000000 .. 0x0003ffff : FPGA block RAM
+     *  0x00400000 .. 0x007fffff : ZBT SSRAM1
+     *  0x20000000 .. 0x2001ffff : SRAM
+     *  0x20400000 .. 0x207fffff : ZBT SSRAM 2&3
+     *
+     * The AN385 has a feature where the lowest 16K can be mapped
+     * either to the bottom of the ZBT SSRAM1 or to the block RAM.
+     * This is of no use for QEMU so we don't implement it (as if
+     * zbt_boot_ctrl is always zero).
+     */
+    memory_region_allocate_system_memory(&mms->psram,
+                                         NULL, "mps.ram", 0x1000000);
+    memory_region_add_subregion(system_memory, 0x21000000, &mms->psram);
+
+    switch (mmc->fpga_type) {
+    case FPGA_AN385:
+        make_ram(&mms->ssram1, "mps.ssram1", 0x0, 0x400000);
+        make_ram_alias(&mms->ssram1_m, "mps.ssram1_m", &mms->ssram1, 0x400000);
+        make_ram(&mms->ssram23, "mps.ssram23", 0x20000000, 0x400000);
+        make_ram_alias(&mms->ssram23_m, "mps.ssram23_m",
+                       &mms->ssram23, 0x20400000);
+        make_ram(&mms->blockram, "mps.blockram", 0x01000000, 0x4000);
+        make_ram_alias(&mms->blockram_m1, "mps.blockram_m1",
+                       &mms->blockram, 0x01004000);
+        make_ram_alias(&mms->blockram_m2, "mps.blockram_m2",
+                       &mms->blockram, 0x01008000);
+        make_ram_alias(&mms->blockram_m3, "mps.blockram_m3",
+                       &mms->blockram, 0x0100c000);
+        break;
+    case FPGA_AN511:
+        make_ram(&mms->blockram, "mps.blockram", 0x0, 0x40000);
+        make_ram(&mms->ssram1, "mps.ssram1", 0x00400000, 0x00800000);
+        make_ram(&mms->sram, "mps.sram", 0x20000000, 0x20000);
+        make_ram(&mms->ssram23, "mps.ssram23", 0x20400000, 0x400000);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    object_initialize(&mms->armv7m, sizeof(mms->armv7m), TYPE_ARMV7M);
+    armv7m = DEVICE(&mms->armv7m);
+    qdev_set_parent_bus(armv7m, sysbus_get_default());
+    switch (mmc->fpga_type) {
+    case FPGA_AN385:
+        qdev_prop_set_uint32(armv7m, "num-irq", 32);
+        break;
+    case FPGA_AN511:
+        qdev_prop_set_uint32(armv7m, "num-irq", 64);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    qdev_prop_set_string(armv7m, "cpu-model", machine->cpu_model);
+    object_property_set_link(OBJECT(&mms->armv7m), OBJECT(system_memory),
+                             "memory", &error_abort);
+    object_property_set_bool(OBJECT(&mms->armv7m), true, "realized",
+                             &error_fatal);
+
+    create_unimplemented_device("zbtsmram mirror", 0x00400000, 0x00400000);
+    create_unimplemented_device("RESERVED 1", 0x00800000, 0x00800000);
+    create_unimplemented_device("Block RAM", 0x01000000, 0x00010000);
+    create_unimplemented_device("RESERVED 2", 0x01010000, 0x1EFF0000);
+    create_unimplemented_device("RESERVED 3", 0x20800000, 0x00800000);
+    create_unimplemented_device("PSRAM", 0x21000000, 0x01000000);
+    /* These three ranges all cover multiple devices; we may implement
+     * some of them below (in which case the real device takes precedence
+     * over the unimplemented-region mapping).
+     */
+    create_unimplemented_device("CMSDK APB peripheral region @0x40000000",
+                                0x40000000, 0x00010000);
+    create_unimplemented_device("CMSDK peripheral region @0x40010000",
+                                0x40010000, 0x00010000);
+    create_unimplemented_device("Extra peripheral region @0x40020000",
+                                0x40020000, 0x00010000);
+    create_unimplemented_device("RESERVED 4", 0x40030000, 0x001D0000);
+    create_unimplemented_device("Ethernet", 0x40200000, 0x00100000);
+    create_unimplemented_device("VGA", 0x41000000, 0x0200000);
+
+    system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
+
+    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
+                       0x400000);
+}
+
+static void mps2_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->init = mps2_common_init;
+    mc->max_cpus = 1;
+}
+
+static void mps2_an385_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    MPS2MachineClass *mmc = MPS2_MACHINE_CLASS(oc);
+
+    mc->desc = "ARM MPS2 with AN385 FPGA image for Cortex-M3";
+    mmc->fpga_type = FPGA_AN385;
+    mmc->cpu_model = "cortex-m3";
+}
+
+static void mps2_an511_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    MPS2MachineClass *mmc = MPS2_MACHINE_CLASS(oc);
+
+    mc->desc = "ARM MPS2 with AN511 DesignStart FPGA image for Cortex-M3";
+    mmc->fpga_type = FPGA_AN511;
+    mmc->cpu_model = "cortex-m3";
+}
+
+static const TypeInfo mps2_info = {
+    .name = TYPE_MPS2_MACHINE,
+    .parent = TYPE_MACHINE,
+    .abstract = true,
+    .instance_size = sizeof(MPS2MachineState),
+    .class_size = sizeof(MPS2MachineClass),
+    .class_init = mps2_class_init,
+};
+
+static const TypeInfo mps2_an385_info = {
+    .name = TYPE_MPS2_AN385_MACHINE,
+    .parent = TYPE_MPS2_MACHINE,
+    .class_init = mps2_an385_class_init,
+};
+
+static const TypeInfo mps2_an511_info = {
+    .name = TYPE_MPS2_AN511_MACHINE,
+    .parent = TYPE_MPS2_MACHINE,
+    .class_init = mps2_an511_class_init,
+};
+
+static void mps2_machine_init(void)
+{
+    type_register_static(&mps2_info);
+    type_register_static(&mps2_an385_info);
+    type_register_static(&mps2_an511_info);
+}
+
+type_init(mps2_machine_init);
diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 93e995d..bfd2a88 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -83,6 +83,7 @@ CONFIG_ONENAND=y
 CONFIG_TUSB6010=y
 CONFIG_IMX=y
 CONFIG_MAINSTONE=y
+CONFIG_MPS2=y
 CONFIG_NSERIES=y
 CONFIG_RASPI=y
 CONFIG_REALVIEW=y
-- 
2.7.4

