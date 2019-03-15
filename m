Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1844821wro;
        Fri, 15 Mar 2019 03:10:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxlU+9N80qb7wbLsQNRp7rDGhXXDXDO9Fk4C3Z30Q6QS0HfbRCpjnLB7eEPNsMWNNY4mKuK
X-Received: by 2002:adf:dc4d:: with SMTP id m13mr1889815wrj.330.1552644631686;
        Fri, 15 Mar 2019 03:10:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552644631; cv=none;
        d=google.com; s=arc-20160816;
        b=YVPklm+yAusuhuys6h8lvccqccXwIsR395oxv05OZDflZiPlftY9nXT/Sl6evd7C+e
         CnR6DOWNhHHgfSwyewvkzUT378PImYqX05nyZLQszoIuH+/qRUr9dyooJxlTXQZLJQQe
         ghCl3mwH+u9vubbGZpafJuEV4qFkklEXZmr0I2GhNgWUwww1XrliJYCPPQiZuok3QVUz
         g5PXRVtdFi4RDJBMNQl4B6CNxKGlKAWqXfYiC8xDhi7hipZt36IMg5pyKoVh0O0sPfIG
         h4pQ1iCniyM61Pk2jatbkh+6WSxSuNdfMmFI5bnJSiY9zq9CNzwp2pfWCIyOuBD6g0v4
         Zh0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=lyI8FSWT0nxnAfub97OSeN2LGNcG+tlKwzZTdk59txI=;
        b=q+9+XRBSUXT4AiKgUgAwIRTF+TBJmtJtAb4owL7FkVKZMBV7IhaMhdjkTdNUrhoYf+
         /wxzJv5/69gGSp8VisKpvXHKrp5kVIpLegqb5Wg7lT/O8TyikFePR/DglfTPJflWdwmL
         qmicV0wTe9MA1knsVKRXWw7leLukkFgd2RVHX/CLk89gGLKnnM3x6ok8kKrtIjW+xur3
         1aWlL2+ExkQOfzr/ZZYrMPhHQktprTc41xgNmpzWAzip/HRDNwOEmgLteJM7ckCLLxqg
         M9rHUgMvddKNp+5ZXExsmFWN5PD7N+hXLLh3Ws68bp3SgERUPi9JjIH1jOTVZb+im3AS
         rCRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wiyd6p1K;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a12si972359wrr.389.2019.03.15.03.10.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Mar 2019 03:10:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wiyd6p1K;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52915 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4jnK-0002qI-IW
	for alex.bennee@linaro.org; Fri, 15 Mar 2019 06:10:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1h4jl9-0001YZ-Bn
	for qemu-devel@nongnu.org; Fri, 15 Mar 2019 06:08:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1h4jl5-0000qu-JX
	for qemu-devel@nongnu.org; Fri, 15 Mar 2019 06:08:15 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41498)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hongbo.zhang@linaro.org>)
	id 1h4jl1-0000pG-Rs
	for qemu-devel@nongnu.org; Fri, 15 Mar 2019 06:08:09 -0400
Received: by mail-pf1-x444.google.com with SMTP id d25so5990993pfn.8
	for <qemu-devel@nongnu.org>; Fri, 15 Mar 2019 03:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lyI8FSWT0nxnAfub97OSeN2LGNcG+tlKwzZTdk59txI=;
	b=Wiyd6p1K/9FXcAKNchE7sdFNhyeAmOofLa4geygKt3obTwsRyefCDfWcum2yANNiD1
	q03dhSazlrT+rCrvaLywlTtNA0cYx1ck7SA/ltJPJsWhsJNBg6YV7w3kvALwD09jsh3c
	8I8fmKP1SK3SgA1RrV4P8YzsBGl3JuvjuvaFQEbK8EAdvEV0fJ6CWhmZCDMtgKThIvcZ
	X4JQS3BoTN/dJsl87l0IZs/QcaoH0p//IsVOdq+yF+WuTL4dBM7u15MqNWsIeoKqTiPk
	r3+ojVRXCOLWSfy8dkHM8jgBACaH6/bhztelNeC29u2Jz+CRPdsqoE5RoYneH+PTiRMj
	Gu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lyI8FSWT0nxnAfub97OSeN2LGNcG+tlKwzZTdk59txI=;
	b=JXJ/ouTPLVZ0geLkHHOD+/CGrh/+aZw/ojC5+ZGEfgW4IvLefsSmMNayYIW8izAb7+
	FOut5ZDtqjKGjUIJVW0uZ6cDQgogJ95Om6+fi0EscV2b8FrydPCkT4+G0BQG7Gwvq/cg
	RwcEnsn/NX/gPwFRuV+LBPnzPqgj2Z0wzswNYFFbG7dYd3Xxght6ZaYjUkDSB8f0LRwO
	OYAZMFqiuMHoRPmhDJNAgdwMBIPKjgjvIqdvtMS91GvIVdRv9UhGvafBbE9xwjiQ2boy
	BqOnOsBrG2t5flwm1DsvZe4xWJJFHZ7iWWSDvX87U5BplhTgfYRo1aCrdbcF+UzJARbt
	3tfg==
X-Gm-Message-State: APjAAAVZgqyVKFlRIipw+PA6bD6MO2MSTUhUAuwcngO92OFivyCozT4O
	iEzcXxSvFngXouOmEBANzq4fIA==
X-Received: by 2002:a63:f80c:: with SMTP id n12mr2590314pgh.297.1552644486240; 
	Fri, 15 Mar 2019 03:08:06 -0700 (PDT)
Received: from localhost.localdomain ([104.237.86.214])
	by smtp.gmail.com with ESMTPSA id b7sm4882128pfi.36.2019.03.15.03.08.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Mar 2019 03:08:05 -0700 (PDT)
From: Hongbo Zhang <hongbo.zhang@linaro.org>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 15 Mar 2019 18:07:46 +0800
Message-Id: <1552644466-24625-3-git-send-email-hongbo.zhang@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552644466-24625-1-git-send-email-hongbo.zhang@linaro.org>
References: <1552644466-24625-1-git-send-email-hongbo.zhang@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-devel] [PATCH v6 2/2] hw/arm: Add arm SBSA reference machine,
 devices part
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, radoslaw.biernacki@linaro.org,
	leif.lindholm@linaro.org, ard.biesheuvel@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LFkD/4LSgL7i

Following the previous patch, this patch adds peripheral devices to the
newly introduced SBSA-ref machine.

Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
---
 hw/arm/sbsa-ref.c | 451 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 451 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index b6d31f2..6b26111 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -21,6 +21,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/units.h"
+#include "sysemu/device_tree.h"
 #include "sysemu/numa.h"
 #include "sysemu/sysemu.h"
 #include "exec/address-spaces.h"
@@ -28,11 +29,28 @@
 #include "kvm_arm.h"
 #include "hw/arm/arm.h"
 #include "hw/boards.h"
+#include "hw/ide/internal.h"
+#include "hw/ide/ahci_internal.h"
 #include "hw/intc/arm_gicv3_common.h"
+#include "hw/loader.h"
+#include "hw/pci-host/gpex.h"
+#include "hw/usb.h"
+#include "net/net.h"
 
 #define RAMLIMIT_GB 8192
 #define RAMLIMIT_BYTES (RAMLIMIT_GB * GiB)
 
+#define NUM_IRQS        256
+#define NUM_SMMU_IRQS   4
+#define NUM_SATA_PORTS  6
+
+#define VIRTUAL_PMU_IRQ        7
+#define ARCH_GIC_MAINT_IRQ     9
+#define ARCH_TIMER_VIRT_IRQ    11
+#define ARCH_TIMER_S_EL1_IRQ   13
+#define ARCH_TIMER_NS_EL1_IRQ  14
+#define ARCH_TIMER_NS_EL2_IRQ  10
+
 enum {
     SBSA_FLASH,
     SBSA_MEM,
@@ -112,6 +130,415 @@ static const int sbsa_ref_irqmap[] = {
     [SBSA_EHCI] = 10,
 };
 
+/*
+ * Firmware on this machine only uses ACPI table to load OS, these limited
+ * device tree nodes are just to let firmware know the info which varies from
+ * command line parameters, so it is not necessary to be fully compatible
+ * with the kernel CPU and NUMA binding rules.
+ */
+static void create_fdt(SBSAMachineState *vms)
+{
+    void *fdt = create_device_tree(&vms->fdt_size);
+    const MachineState *ms = MACHINE(vms);
+    int cpu;
+
+    if (!fdt) {
+        error_report("create_device_tree() failed");
+        exit(1);
+    }
+
+    vms->fdt = fdt;
+
+    qemu_fdt_setprop_string(fdt, "/", "compatible", "linux,sbsa-ref");
+    qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
+    qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
+
+    if (have_numa_distance) {
+        int size = nb_numa_nodes * nb_numa_nodes * 3 * sizeof(uint32_t);
+        uint32_t *matrix = g_malloc0(size);
+        int idx, i, j;
+
+        for (i = 0; i < nb_numa_nodes; i++) {
+            for (j = 0; j < nb_numa_nodes; j++) {
+                idx = (i * nb_numa_nodes + j) * 3;
+                matrix[idx + 0] = cpu_to_be32(i);
+                matrix[idx + 1] = cpu_to_be32(j);
+                matrix[idx + 2] = cpu_to_be32(numa_info[i].distance[j]);
+            }
+        }
+
+        qemu_fdt_add_subnode(fdt, "/distance-map");
+        qemu_fdt_setprop(fdt, "/distance-map", "distance-matrix",
+                         matrix, size);
+        g_free(matrix);
+    }
+
+    qemu_fdt_add_subnode(vms->fdt, "/cpus");
+
+    for (cpu = vms->smp_cpus - 1; cpu >= 0; cpu--) {
+        char *nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
+        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
+        CPUState *cs = CPU(armcpu);
+
+        qemu_fdt_add_subnode(vms->fdt, nodename);
+
+        if (ms->possible_cpus->cpus[cs->cpu_index].props.has_node_id) {
+            qemu_fdt_setprop_cell(vms->fdt, nodename, "numa-node-id",
+                ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
+        }
+
+        g_free(nodename);
+    }
+}
+
+static void create_one_flash(const char *name, hwaddr flashbase,
+                             hwaddr flashsize, const char *file,
+                             MemoryRegion *sysmem)
+{
+    /*
+     * Create and map a single flash device. We use the same
+     * parameters as the flash devices on the Versatile Express board.
+     */
+    DriveInfo *dinfo = drive_get_next(IF_PFLASH);
+    DeviceState *dev = qdev_create(NULL, "cfi.pflash01");
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    const uint64_t sectorlength = 256 * 1024;
+
+    if (dinfo) {
+        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo),
+                            &error_abort);
+    }
+
+    qdev_prop_set_uint32(dev, "num-blocks", flashsize / sectorlength);
+    qdev_prop_set_uint64(dev, "sector-length", sectorlength);
+    qdev_prop_set_uint8(dev, "width", 4);
+    qdev_prop_set_uint8(dev, "device-width", 2);
+    qdev_prop_set_bit(dev, "big-endian", false);
+    qdev_prop_set_uint16(dev, "id0", 0x89);
+    qdev_prop_set_uint16(dev, "id1", 0x18);
+    qdev_prop_set_uint16(dev, "id2", 0x00);
+    qdev_prop_set_uint16(dev, "id3", 0x00);
+    qdev_prop_set_string(dev, "name", name);
+    qdev_init_nofail(dev);
+
+    memory_region_add_subregion(sysmem, flashbase,
+                                sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
+
+    if (file) {
+        char *fn;
+        int image_size;
+
+        if (drive_get(IF_PFLASH, 0, 0)) {
+            error_report("The contents of the first flash device may be "
+                         "specified with -bios or with -drive if=pflash... "
+                         "but you cannot use both options at once");
+            exit(1);
+        }
+        fn = qemu_find_file(QEMU_FILE_TYPE_BIOS, file);
+        if (!fn) {
+            error_report("Could not find ROM image '%s'", file);
+            exit(1);
+        }
+        image_size = load_image_mr(fn, sysbus_mmio_get_region(sbd, 0));
+        g_free(fn);
+        if (image_size < 0) {
+            error_report("Could not load ROM image '%s'", file);
+            exit(1);
+        }
+    }
+}
+
+static void create_flash(const SBSAMachineState *vms,
+                         MemoryRegion *sysmem,
+                         MemoryRegion *secure_sysmem)
+{
+    /*
+     * Create one secure and nonsecure flash devices to fill SBSA_FLASH
+     * space in the memmap, file passed via -bios goes in the first one.
+     */
+    hwaddr flashsize = vms->memmap[SBSA_FLASH].size / 2;
+    hwaddr flashbase = vms->memmap[SBSA_FLASH].base;
+
+    create_one_flash("sbsa-ref.flash0", flashbase, flashsize,
+                     bios_name, secure_sysmem);
+    create_one_flash("sbsa-ref.flash1", flashbase + flashsize, flashsize,
+                     NULL, sysmem);
+}
+
+static void create_secure_ram(SBSAMachineState *vms,
+                              MemoryRegion *secure_sysmem)
+{
+    MemoryRegion *secram = g_new(MemoryRegion, 1);
+    hwaddr base = vms->memmap[SBSA_SECURE_MEM].base;
+    hwaddr size = vms->memmap[SBSA_SECURE_MEM].size;
+
+    memory_region_init_ram(secram, NULL, "sbsa-ref.secure-ram", size,
+                           &error_fatal);
+    memory_region_add_subregion(secure_sysmem, base, secram);
+}
+
+static void create_gic(SBSAMachineState *vms, qemu_irq *pic)
+{
+    DeviceState *gicdev;
+    SysBusDevice *gicbusdev;
+    const char *gictype;
+    uint32_t redist0_capacity, redist0_count;
+    int i;
+
+    gictype = gicv3_class_name();
+
+    gicdev = qdev_create(NULL, gictype);
+    qdev_prop_set_uint32(gicdev, "revision", 3);
+    qdev_prop_set_uint32(gicdev, "num-cpu", smp_cpus);
+    /*
+     * Note that the num-irq property counts both internal and external
+     * interrupts; there are always 32 of the former (mandated by GIC spec).
+     */
+    qdev_prop_set_uint32(gicdev, "num-irq", NUM_IRQS + 32);
+    qdev_prop_set_bit(gicdev, "has-security-extensions", true);
+
+    redist0_capacity =
+                vms->memmap[SBSA_GIC_REDIST].size / GICV3_REDIST_SIZE;
+    redist0_count = MIN(smp_cpus, redist0_capacity);
+
+    qdev_prop_set_uint32(gicdev, "len-redist-region-count", 1);
+    qdev_prop_set_uint32(gicdev, "redist-region-count[0]", redist0_count);
+
+    qdev_init_nofail(gicdev);
+    gicbusdev = SYS_BUS_DEVICE(gicdev);
+    sysbus_mmio_map(gicbusdev, 0, vms->memmap[SBSA_GIC_DIST].base);
+    sysbus_mmio_map(gicbusdev, 1, vms->memmap[SBSA_GIC_REDIST].base);
+
+    /*
+     * Wire the outputs from each CPU's generic timer and the GICv3
+     * maintenance interrupt signal to the appropriate GIC PPI inputs,
+     * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's inputs.
+     */
+    for (i = 0; i < smp_cpus; i++) {
+        DeviceState *cpudev = DEVICE(qemu_get_cpu(i));
+        int ppibase = NUM_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
+        int irq;
+        /*
+         * Mapping from the output timer irq lines from the CPU to the
+         * GIC PPI inputs used for this board.
+         */
+        const int timer_irq[] = {
+            [GTIMER_PHYS] = ARCH_TIMER_NS_EL1_IRQ,
+            [GTIMER_VIRT] = ARCH_TIMER_VIRT_IRQ,
+            [GTIMER_HYP]  = ARCH_TIMER_NS_EL2_IRQ,
+            [GTIMER_SEC]  = ARCH_TIMER_S_EL1_IRQ,
+        };
+
+        for (irq = 0; irq < ARRAY_SIZE(timer_irq); irq++) {
+            qdev_connect_gpio_out(cpudev, irq,
+                                  qdev_get_gpio_in(gicdev,
+                                                   ppibase + timer_irq[irq]));
+        }
+
+        qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt", 0,
+                                    qdev_get_gpio_in(gicdev, ppibase
+                                                     + ARCH_GIC_MAINT_IRQ));
+        qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
+                                    qdev_get_gpio_in(gicdev, ppibase
+                                                     + VIRTUAL_PMU_IRQ));
+
+        sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
+        sysbus_connect_irq(gicbusdev, i + smp_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
+        sysbus_connect_irq(gicbusdev, i + 2 * smp_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
+        sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
+    }
+
+    for (i = 0; i < NUM_IRQS; i++) {
+        pic[i] = qdev_get_gpio_in(gicdev, i);
+    }
+}
+
+static void create_uart(const SBSAMachineState *vms, qemu_irq *pic, int uart,
+                        MemoryRegion *mem, Chardev *chr)
+{
+    hwaddr base = vms->memmap[uart].base;
+    int irq = vms->irqmap[uart];
+    DeviceState *dev = qdev_create(NULL, "pl011");
+    SysBusDevice *s = SYS_BUS_DEVICE(dev);
+
+    qdev_prop_set_chr(dev, "chardev", chr);
+    qdev_init_nofail(dev);
+    memory_region_add_subregion(mem, base,
+                                sysbus_mmio_get_region(s, 0));
+    sysbus_connect_irq(s, 0, pic[irq]);
+}
+
+static void create_rtc(const SBSAMachineState *vms, qemu_irq *pic)
+{
+    hwaddr base = vms->memmap[SBSA_RTC].base;
+    int irq = vms->irqmap[SBSA_RTC];
+
+    sysbus_create_simple("pl031", base, pic[irq]);
+}
+
+static DeviceState *gpio_key_dev;
+static void sbsa_ref_powerdown_req(Notifier *n, void *opaque)
+{
+    /* use gpio Pin 3 for power button event */
+    qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);
+}
+
+static Notifier sbsa_ref_powerdown_notifier = {
+    .notify = sbsa_ref_powerdown_req
+};
+
+static void create_gpio(const SBSAMachineState *vms, qemu_irq *pic)
+{
+    DeviceState *pl061_dev;
+    hwaddr base = vms->memmap[SBSA_GPIO].base;
+    int irq = vms->irqmap[SBSA_GPIO];
+
+    pl061_dev = sysbus_create_simple("pl061", base, pic[irq]);
+
+    gpio_key_dev = sysbus_create_simple("gpio-key", -1,
+                                        qdev_get_gpio_in(pl061_dev, 3));
+
+    /* connect powerdown request */
+    qemu_register_powerdown_notifier(&sbsa_ref_powerdown_notifier);
+}
+
+static void create_ahci(const SBSAMachineState *vms, qemu_irq *pic)
+{
+    hwaddr base = vms->memmap[SBSA_AHCI].base;
+    int irq = vms->irqmap[SBSA_AHCI];
+    DeviceState *dev;
+    DriveInfo *hd[NUM_SATA_PORTS];
+    SysbusAHCIState *sysahci;
+    AHCIState *ahci;
+    int i;
+
+    dev = qdev_create(NULL, "sysbus-ahci");
+    qdev_prop_set_uint32(dev, "num-ports", NUM_SATA_PORTS);
+    qdev_init_nofail(dev);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[irq]);
+
+    sysahci = SYSBUS_AHCI(dev);
+    ahci = &sysahci->ahci;
+    ide_drive_get(hd, ARRAY_SIZE(hd));
+    for (i = 0; i < ahci->ports; i++) {
+        if (hd[i] == NULL) {
+            continue;
+        }
+        ide_create_drive(&ahci->dev[i].port, 0, hd[i]);
+    }
+}
+
+static void create_ehci(const SBSAMachineState *vms, qemu_irq *pic)
+{
+    hwaddr base = vms->memmap[SBSA_EHCI].base;
+    int irq = vms->irqmap[SBSA_EHCI];
+    USBBus *usb_bus;
+
+    sysbus_create_simple("platform-ehci-usb", base, pic[irq]);
+
+    usb_bus = usb_bus_find(-1);
+    usb_create_simple(usb_bus, "usb-kbd");
+    usb_create_simple(usb_bus, "usb-mouse");
+}
+
+static void create_smmu(const SBSAMachineState *vms, qemu_irq *pic,
+                        PCIBus *bus)
+{
+    hwaddr base = vms->memmap[SBSA_SMMU].base;
+    int irq =  vms->irqmap[SBSA_SMMU];
+    DeviceState *dev;
+    int i;
+
+    dev = qdev_create(NULL, "arm-smmuv3");
+
+    object_property_set_link(OBJECT(dev), OBJECT(bus), "primary-bus",
+                             &error_abort);
+    qdev_init_nofail(dev);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
+    for (i = 0; i < NUM_SMMU_IRQS; i++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, pic[irq + i]);
+    }
+}
+
+static void create_pcie(SBSAMachineState *vms, qemu_irq *pic)
+{
+    hwaddr base_ecam = vms->memmap[SBSA_PCIE_ECAM].base;
+    hwaddr size_ecam = vms->memmap[SBSA_PCIE_ECAM].size;
+    hwaddr base_mmio = vms->memmap[SBSA_PCIE_MMIO].base;
+    hwaddr size_mmio = vms->memmap[SBSA_PCIE_MMIO].size;
+    hwaddr base_mmio_high = vms->memmap[SBSA_PCIE_MMIO_HIGH].base;
+    hwaddr size_mmio_high = vms->memmap[SBSA_PCIE_MMIO_HIGH].size;
+    hwaddr base_pio = vms->memmap[SBSA_PCIE_PIO].base;
+    int irq = vms->irqmap[SBSA_PCIE];
+    MemoryRegion *mmio_alias, *mmio_alias_high, *mmio_reg;
+    MemoryRegion *ecam_alias, *ecam_reg;
+    DeviceState *dev;
+    PCIHostState *pci;
+    int i;
+
+    dev = qdev_create(NULL, TYPE_GPEX_HOST);
+    qdev_init_nofail(dev);
+
+    /* Map ECAM space */
+    ecam_alias = g_new0(MemoryRegion, 1);
+    ecam_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
+    memory_region_init_alias(ecam_alias, OBJECT(dev), "pcie-ecam",
+                             ecam_reg, 0, size_ecam);
+    memory_region_add_subregion(get_system_memory(), base_ecam, ecam_alias);
+
+    /* Map the MMIO space */
+    mmio_alias = g_new0(MemoryRegion, 1);
+    mmio_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
+    memory_region_init_alias(mmio_alias, OBJECT(dev), "pcie-mmio",
+                             mmio_reg, base_mmio, size_mmio);
+    memory_region_add_subregion(get_system_memory(), base_mmio, mmio_alias);
+
+    /* Map the MMIO_HIGH space */
+    mmio_alias_high = g_new0(MemoryRegion, 1);
+    memory_region_init_alias(mmio_alias_high, OBJECT(dev), "pcie-mmio-high",
+                             mmio_reg, base_mmio_high, size_mmio_high);
+    memory_region_add_subregion(get_system_memory(), base_mmio_high,
+                                mmio_alias_high);
+
+    /* Map IO port space */
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, base_pio);
+
+    for (i = 0; i < GPEX_NUM_IRQS; i++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, pic[irq + i]);
+        gpex_set_irq_num(GPEX_HOST(dev), i, irq + i);
+    }
+
+    pci = PCI_HOST_BRIDGE(dev);
+    if (pci->bus) {
+        for (i = 0; i < nb_nics; i++) {
+            NICInfo *nd = &nd_table[i];
+
+            if (!nd->model) {
+                nd->model = g_strdup("e1000e");
+            }
+
+            pci_nic_init_nofail(nd, pci->bus, nd->model, NULL);
+        }
+    }
+
+    pci_create_simple(pci->bus, -1, "VGA");
+
+    create_smmu(vms, pic, pci->bus);
+}
+
+static void *sbsa_ref_dtb(const struct arm_boot_info *binfo, int *fdt_size)
+{
+    const SBSAMachineState *board = container_of(binfo, SBSAMachineState,
+                                                 bootinfo);
+
+    *fdt_size = board->fdt_size;
+    return board->fdt;
+}
+
 static void sbsa_ref_init(MachineState *machine)
 {
     SBSAMachineState *vms = SBSA_MACHINE(machine);
@@ -122,6 +549,7 @@ static void sbsa_ref_init(MachineState *machine)
     bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
     const CPUArchIdList *possible_cpus;
     int n, sbsa_max_cpus;
+    qemu_irq pic[NUM_IRQS];
 
     if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a57"))) {
         error_report("sbsa-ref: CPU type other than the built-in "
@@ -206,11 +634,34 @@ static void sbsa_ref_init(MachineState *machine)
                                          machine->ram_size);
     memory_region_add_subregion(sysmem, vms->memmap[SBSA_MEM].base, ram);
 
+    create_fdt(vms);
+
+    create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
+
+    create_secure_ram(vms, secure_sysmem);
+
+    create_gic(vms, pic);
+
+    create_uart(vms, pic, SBSA_UART, sysmem, serial_hd(0));
+
+    create_uart(vms, pic, SBSA_SECURE_UART, secure_sysmem, serial_hd(1));
+
+    create_rtc(vms, pic);
+
+    create_gpio(vms, pic);
+
+    create_ahci(vms, pic);
+
+    create_ehci(vms, pic);
+
+    create_pcie(vms, pic);
+
     vms->bootinfo.ram_size = machine->ram_size;
     vms->bootinfo.kernel_filename = machine->kernel_filename;
     vms->bootinfo.nb_cpus = smp_cpus;
     vms->bootinfo.board_id = -1;
     vms->bootinfo.loader_start = vms->memmap[SBSA_MEM].base;
+    vms->bootinfo.get_dtb = sbsa_ref_dtb;
     vms->bootinfo.firmware_loaded = firmware_loaded;
     arm_load_kernel(ARM_CPU(first_cpu), &vms->bootinfo);
 }
-- 
2.7.4

