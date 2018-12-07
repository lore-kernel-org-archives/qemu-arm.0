Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp242584wrt;
        Fri, 7 Dec 2018 01:08:13 -0800 (PST)
X-Received: by 2002:a63:2054:: with SMTP id r20mr1224046pgm.328.1544173693629;
        Fri, 07 Dec 2018 01:08:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544173693; cv=none;
        d=google.com; s=arc-20160816;
        b=vF5M45+Z70n1ZGV6VM5JbkSGw6N+Q6d5Df7Qx5q7a+vCIYHtTfVdYUuNpNFmM9H+3L
         iGOiKI8MWIKDVcv6vpXBMRb5SfSrTa+KXlOZj9Trzz8qTsicPyB/qNyEg7STkbWB8itc
         JIERSGPvbNWBPFbORzRLVj6/XO0aU7SBLTz6l5DpVUClczor2HiI2KGHrgH8ZN6oFieI
         BYXyNrJdEFnh5Q+h/XDXyt+KGBsOLz/aqgV6s+5Mr2efXeyEAlVxf+TNqyHHj6AG/B3o
         cfc7LOz9+q2RXSIhCMu9JpHeDbPvYuGKv5OJJuMB6V8zoGFLifkXM2wxKaxVt83Vep2s
         uhWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=W1IBDezLIFMZc3HImXICmFn832Ds9Wo1ep/IWPVds8M=;
        b=o0B9MY+tzch5Hfew6WvwJqXP3q8mpux54CEO9grmWY62I7e+6B4sII3hHDw2o0AAHG
         3Zr5vUmalxEEx9iPjK+k1ZfBvsr11DqNQ/0wezJl/wWMz6wJKkWngDIUgVf+44bh3x56
         wOmL9WKePrQ1Livy5ky1AxMufg9mxJcDFi0HgBfjqlt0SoS+1qT+l+YxiTvPc7+76kyy
         nxDsuRhJ5ggEwPcd1vpD6kRSW7YkxYQt6ClbUcagcYmKU61/419sWkN30/13M4kwsdVo
         jGXKIraSbzDH0JizQ+7jhnUf6NPPndp5lUlq6E713ThltbQXbnmkXzfuvo3o0zBu8Pnu
         eY6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K8ujFlOd;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u67sor4309557pgc.55.2018.12.07.01.08.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 07 Dec 2018 01:08:13 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K8ujFlOd;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=W1IBDezLIFMZc3HImXICmFn832Ds9Wo1ep/IWPVds8M=;
        b=K8ujFlOdkw9RksD2b2m/k4SG2LpQactauRoWX+15dLLgVUdYALCBx/fxHncaLML5hU
         jDQW4BC5kG8TBLEaCvIiMdCOQG3X4i0gOgUcg2fG/9vyPDKu1fb7umQ8SL2sBDTMTjY8
         Rb0F0j1FlojtmKiQLD08ct8/a26E8Xd9GNEWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=W1IBDezLIFMZc3HImXICmFn832Ds9Wo1ep/IWPVds8M=;
        b=ORLU1+4Hp7Vwt4b4xDE1QPvAgronmhabSRHsITFPZLZEPbrIQ5X7Hlw/XVGqlqe+T+
         ZXV2cTY9OwF4OH8O2FVuP8rtmJjOG1cKMC4rI6MJEEGJK0ihCh7pVselumM5SIdHiG/Q
         pAnWpcEpEi135lDkCDlWs2IOBH8EiyLk8s/DHGkm/rVwDyFI+U85Dv7mrOI9U/Ib27U7
         d5+S9tDKP+MTxZFnIdbnG9pBj7JDAzIohtv5Y4WzOBECo7Em/ZKRChNsGtlXwG5PpVxA
         HIapIGrGP5Q9/qwQNNF9GQ6J4Haev1g12UIcfmuI6VNwL4Kq7GVni4sk7GPZIfWd8o2d
         BcEw==
X-Gm-Message-State: AA+aEWaa4jkvGuD8lEegyfTj8DRGHGOyZ5AxIM/TFDOTbq9pZzb0pqXL
	/SXfe1BJ4VXRns3G4YAmQf91g62v
X-Google-Smtp-Source: AFSGD/Wgwm/bjervG3SIAhsff/aRLEMRgo/q8D5TF29jO6EVY0ePtDdxitfXG5Ff6UDL4/p4WMMBLg==
X-Received: by 2002:a63:d047:: with SMTP id s7mr1195215pgi.311.1544173692987;
        Fri, 07 Dec 2018 01:08:12 -0800 (PST)
Return-Path: <hongbo.zhang@linaro.org>
Received: from localhost.localdomain ([45.56.155.222])
        by smtp.gmail.com with ESMTPSA id k38sm3058432pgb.33.2018.12.07.01.08.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 01:08:12 -0800 (PST)
From: Hongbo Zhang <hongbo.zhang@linaro.org>
To: peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: ard.biesheuvel@linaro.org,
	leif.lindholm@linaro.org,
	radoslaw.biernacki@linaro.org,
	Hongbo Zhang <hongbo.zhang@linaro.org>
Subject: [PATCH v5 2/2] hw/arm: add Arm SBSA reference machine, devices part
Date: Fri,  7 Dec 2018 17:07:55 +0800
Message-Id: <1544173675-14217-3-git-send-email-hongbo.zhang@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1544173675-14217-1-git-send-email-hongbo.zhang@linaro.org>
References: <1544173675-14217-1-git-send-email-hongbo.zhang@linaro.org>
X-TUID: BbANeuG8d0vj

Following the previous patch, this patch adds peripheral devices to the
newly introduced SBSA-ref machine.

Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
---
 hw/arm/sbsa-ref.c | 421 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 421 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 1d6252b..b3ef0d1 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -46,6 +46,8 @@
 #define RAMLIMIT_GB 8192
 #define RAMLIMIT_BYTES (RAMLIMIT_GB * GiB)
 
+#define SATA_NUM_PORTS 6
+
 static const MemMapEntry sbsa_ref_memmap[] = {
     /* 512M boot ROM */
     [VIRT_FLASH] =              {          0, 0x20000000 },
@@ -83,6 +85,399 @@ static const int sbsa_ref_irqmap[] = {
     [VIRT_AHCI] = 9,
 };
 
+/* Firmware on this machine only uses ACPI table to load OS, these limited
+ * device tree nodes are just to let firmware know the info which varies from
+ * command line parameters, so it is not necessary to be fully compatible
+ * with the kernel CPU and NUMA binding rules.
+ */
+static void create_fdt(VirtMachineState *vms)
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
+    /* Create and map a single flash device. We use the same
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
+static void create_flash(const VirtMachineState *vms,
+                         MemoryRegion *sysmem,
+                         MemoryRegion *secure_sysmem)
+{
+    /* Create one secure and nonsecure flash devices to fill VIRT_FLASH
+     * space in the memmap, file passed via -bios goes in the first one.
+     */
+    hwaddr flashsize = vms->memmap[VIRT_FLASH].size / 2;
+    hwaddr flashbase = vms->memmap[VIRT_FLASH].base;
+
+    create_one_flash("sbsa-ref.flash0", flashbase, flashsize,
+                     bios_name, secure_sysmem);
+    create_one_flash("sbsa-ref.flash1", flashbase + flashsize, flashsize,
+                     NULL, sysmem);
+}
+
+static void create_secure_ram(VirtMachineState *vms,
+                              MemoryRegion *secure_sysmem)
+{
+    MemoryRegion *secram = g_new(MemoryRegion, 1);
+    hwaddr base = vms->memmap[VIRT_SECURE_MEM].base;
+    hwaddr size = vms->memmap[VIRT_SECURE_MEM].size;
+
+    memory_region_init_ram(secram, NULL, "sbsa-ref.secure-ram", size,
+                           &error_fatal);
+    memory_region_add_subregion(secure_sysmem, base, secram);
+}
+
+static void create_gic(VirtMachineState *vms, qemu_irq *pic)
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
+    /* Note that the num-irq property counts both internal and external
+     * interrupts; there are always 32 of the former (mandated by GIC spec).
+     */
+    qdev_prop_set_uint32(gicdev, "num-irq", NUM_IRQS + 32);
+    qdev_prop_set_bit(gicdev, "has-security-extensions", true);
+
+    redist0_capacity =
+                vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;
+    redist0_count = MIN(smp_cpus, redist0_capacity);
+
+    qdev_prop_set_uint32(gicdev, "len-redist-region-count", 1);
+    qdev_prop_set_uint32(gicdev, "redist-region-count[0]", redist0_count);
+
+    qdev_init_nofail(gicdev);
+    gicbusdev = SYS_BUS_DEVICE(gicdev);
+    sysbus_mmio_map(gicbusdev, 0, vms->memmap[VIRT_GIC_DIST].base);
+    sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_REDIST].base);
+
+    /* Wire the outputs from each CPU's generic timer and the GICv3
+     * maintenance interrupt signal to the appropriate GIC PPI inputs,
+     * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's inputs.
+     */
+    for (i = 0; i < smp_cpus; i++) {
+        DeviceState *cpudev = DEVICE(qemu_get_cpu(i));
+        int ppibase = NUM_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
+        int irq;
+        /* Mapping from the output timer irq lines from the CPU to the
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
+                                                     + ARCH_GICV3_MAINT_IRQ));
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
+static void create_uart(const VirtMachineState *vms, qemu_irq *pic, int uart,
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
+static void create_rtc(const VirtMachineState *vms, qemu_irq *pic)
+{
+    hwaddr base = vms->memmap[VIRT_RTC].base;
+    int irq = vms->irqmap[VIRT_RTC];
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
+static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
+{
+    DeviceState *pl061_dev;
+    hwaddr base = vms->memmap[VIRT_GPIO].base;
+    int irq = vms->irqmap[VIRT_GPIO];
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
+static void create_ahci(const VirtMachineState *vms, qemu_irq *pic)
+{
+    hwaddr base = vms->memmap[VIRT_AHCI].base;
+    int irq = vms->irqmap[VIRT_AHCI];
+    DeviceState *dev;
+    DriveInfo *hd[SATA_NUM_PORTS];
+    SysbusAHCIState *sysahci;
+    AHCIState *ahci;
+    int i;
+
+    dev = qdev_create(NULL, "sysbus-ahci");
+    qdev_prop_set_uint32(dev, "num-ports", SATA_NUM_PORTS);
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
+static void create_smmu(const VirtMachineState *vms, qemu_irq *pic,
+                        PCIBus *bus)
+{
+    hwaddr base = vms->memmap[VIRT_SMMU].base;
+    int irq =  vms->irqmap[VIRT_SMMU];
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
+static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
+{
+    hwaddr base_ecam = vms->memmap[VIRT_PCIE_ECAM].base;
+    hwaddr size_ecam = vms->memmap[VIRT_PCIE_ECAM].size;
+    hwaddr base_mmio = vms->memmap[VIRT_PCIE_MMIO].base;
+    hwaddr size_mmio = vms->memmap[VIRT_PCIE_MMIO].size;
+    hwaddr base_pio = vms->memmap[VIRT_PCIE_PIO].base;
+    int irq = vms->irqmap[VIRT_PCIE];
+    MemoryRegion *mmio_alias, *mmio_reg, *ecam_alias, *ecam_reg;
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
+    const VirtMachineState *board = container_of(binfo, VirtMachineState,
+                                                 bootinfo);
+
+    *fdt_size = board->fdt_size;
+    return board->fdt;
+}
+
+static void sbsa_ref_machine_done(Notifier *notifier, void *data)
+{
+    VirtMachineState *vms = container_of(notifier, VirtMachineState,
+                                         machine_done);
+    ARMCPU *cpu = ARM_CPU(first_cpu);
+    struct arm_boot_info *info = &vms->bootinfo;
+    AddressSpace *as = arm_boot_address_space(cpu, info);
+
+    if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as) < 0) {
+        exit(1);
+    }
+}
+
 static void sbsa_ref_init(MachineState *machine)
 {
     VirtMachineState *vms = VIRT_MACHINE(machine);
@@ -93,6 +488,7 @@ static void sbsa_ref_init(MachineState *machine)
     bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
     const CPUArchIdList *possible_cpus;
     int n, sbsa_max_cpus;
+    qemu_irq pic[NUM_IRQS];
 
     if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a57"))) {
         error_report("sbsa-ref: CPU type other than the built-in "
@@ -176,13 +572,38 @@ static void sbsa_ref_init(MachineState *machine)
                                          machine->ram_size);
     memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
 
+    create_fdt(vms);
+
+    create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
+
+    create_secure_ram(vms, secure_sysmem);
+
+    create_gic(vms, pic);
+
+    create_uart(vms, pic, VIRT_UART, sysmem, serial_hd(0));
+
+    create_uart(vms, pic, VIRT_SECURE_UART, secure_sysmem, serial_hd(1));
+
+    create_rtc(vms, pic);
+
+    create_gpio(vms, pic);
+
+    create_ahci(vms, pic);
+
+    create_pcie(vms, pic);
+
     vms->bootinfo.ram_size = machine->ram_size;
     vms->bootinfo.kernel_filename = machine->kernel_filename;
     vms->bootinfo.nb_cpus = smp_cpus;
     vms->bootinfo.board_id = -1;
     vms->bootinfo.loader_start = vms->memmap[VIRT_MEM].base;
+    vms->bootinfo.get_dtb = sbsa_ref_dtb;
+    vms->bootinfo.skip_dtb_autoload = true;
     vms->bootinfo.firmware_loaded = firmware_loaded;
     arm_load_kernel(ARM_CPU(first_cpu), &vms->bootinfo);
+
+    vms->machine_done.notify = sbsa_ref_machine_done;
+    qemu_add_machine_init_done_notifier(&vms->machine_done);
 }
 
 static uint64_t sbsa_ref_cpu_mp_affinity(VirtMachineState *vms, int idx)
-- 
2.7.4
