Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp6027975wrq;
        Wed, 27 Jun 2018 03:13:36 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd9ChkxQ7/GVI0O4u7OC9XUcQOlgYzumDdM9QBObkiDKiHE4i1RCM+ssfBB0L7LxVYCj/f/
X-Received: by 2002:ac8:2da5:: with SMTP id p34-v6mr4747898qta.333.1530094416278;
        Wed, 27 Jun 2018 03:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530094416; cv=none;
        d=google.com; s=arc-20160816;
        b=Y0j4p3kFw4/jk+LOzJVu9kANRazYtB7wNYWUNyj5fM+o9m4T5GcytqUxHrfVBK0i/c
         Y10obNMCFwxO4xbUBbLE1u9T4bs6ix99RuJ4Vv54W1o0exAUnVjq9cxC0xqCcSFPOgqN
         +E4lGzkCEh1/TG0WQP9KcCwMb+zXwJpDqwfnTnU/gORTju2rL7rnSq0Neal8f2FSh9kp
         q2ztoXVi02R6gkUM3xRexk50MPhKKeMfSJCxbzPOa/je9y2BMjamDLNuXZwXcFVF1wIt
         pmFETrsPrOlNJmO1qJwbyl7MkKPQHiq/MNay8KK9+VUqTNzlmun1sCtJHQW93QszILq+
         a6UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=lFO/9hlfyaoJTD2lDJciGtwQjUd8AXxeConXm/Mk2Rs=;
        b=VdzJZqr1DXVNP8T8zHfIh7iUXeZPIiyaLUZzVKJ+pxSmPiVOzMXvWKWTyvOG1CQ1pA
         w2gePrPfEVy57KULGHRM2eb5VgCjuHa+uyELYVThal9JHxx0YjebNKrK9d94G8PojLDN
         UXJ981VQvXwop0Cny6CAoOH4HKWf0onlyxxREBnH1Ur9uk2AnM4JeBGMWVYmsYXpcUhR
         k5qC+QSE2yJ36Y21Esn+G+pbC59/9u0q5cYHIzpFEADCVKWDnU6+JdH70YSShdjaqE67
         6EgVKaYeFZLDF5iqyt+NhN8FsRkxk83SxKd5Ecdl1FEs/6gVShk2dt8ToCdawkJc37Ae
         BIMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=egblAUG+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z1-v6si1055027qvj.205.2018.06.27.03.13.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jun 2018 03:13:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=egblAUG+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57828 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY7SB-00024i-Oy
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 06:13:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1fY7S2-00024S-QX
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 06:13:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1fY7Rx-0003kv-MY
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 06:13:26 -0400
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:45402)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hongbo.zhang@linaro.org>)
	id 1fY7Rx-0003jC-BW
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 06:13:21 -0400
Received: by mail-pl0-x242.google.com with SMTP id bi1-v6so810959plb.12
	for <qemu-arm@nongnu.org>; Wed, 27 Jun 2018 03:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=lFO/9hlfyaoJTD2lDJciGtwQjUd8AXxeConXm/Mk2Rs=;
	b=egblAUG+ZUea52cDWWw2RBBQXgs+uNBXbrZJmnZqpRQ0x1t555l0yfKvFbC+oeFeHA
	jf7x1R9BIHw9rC9oCZw9BccvafZvVXXTbCI/it3oUjsiExAqyJ0r9Qh4Q+2czVjETNuf
	m0ti7TmDBh1CJRCKobWzTjgfh9AfH/yrz1UHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lFO/9hlfyaoJTD2lDJciGtwQjUd8AXxeConXm/Mk2Rs=;
	b=Fpw5WjWAtlreaRmRsO6pQiI1ksN+tSHVKs1yj8fwHQqxnvSvY7nbd9mnby6oeEf6Uk
	/fRg/EkG2K+3+76+O8fGhVBUGQoznnFkHm7gVu7/W4k6P0EyU7ljZN+CLQFhJdcI7X9S
	Z5Suvq22hFc2lPzJiXn5mRvqhZ6dGrJoTcykD2V7k+9Jg60oPqw2j7jXn3AMJp4I9YC/
	y7L/DdoeHei2NLMtxO8fiG76JX6klJp0Y91rj7zIA6Nnfosx5KfRDc9HU2uhO/8cAdt8
	7wJ1rnrfo3YgEPKX3rwcBpNbImmVUZBsA5w5cTCHlkmcELHLwbwONTbH28scOuCSyVwG
	btMw==
X-Gm-Message-State: APt69E1yVPz4UFW+u3702y7s6zEtrvN2uv0V4wtnO6zlHyFgu+iHcez8
	LDthb6x/27CWa6i2CriufuXTUA==
X-Received: by 2002:a17:902:5501:: with SMTP id
	f1-v6mr5470633pli.108.1530094399965; 
	Wed, 27 Jun 2018 03:13:19 -0700 (PDT)
Received: from localhost.localdomain ([45.56.155.177])
	by smtp.gmail.com with ESMTPSA id
	n68-v6sm3679979pfg.98.2018.06.27.03.13.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jun 2018 03:13:19 -0700 (PDT)
From: Hongbo Zhang <hongbo.zhang@linaro.org>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed, 27 Jun 2018 18:13:08 +0800
Message-Id: <1530094388-607-1-git-send-email-hongbo.zhang@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: [Qemu-arm] [PATCH] hw/arm: Add SBSA machine type
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
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MmRYW9i1mgXG

This patch introduces a new Arm machine type 'SBSA' with features:
 - Based on legacy 'virt' machine type.
 - Newly designed memory map.
 - EL2 and EL3 are enabled by default.
 - AHCI controller attached to system bus, and then CDROM and hard disc
   can be added to it.
 - EHCI controller attached to system bus, with USB mouse and key board
   installed by default.
 - E1000 ethernet card on PCIE bus.
 - VGA display adaptor on PCIE bus.
 - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
 - No virtio functions enabled, since this is to emulate real hardware.

This is the prototype, more features can be added in futrue.

Purpose of this is to have a standard QEMU platform for Arm firmware
developement etc. where the legacy machines cannot meets requirements.

Arm Trusted Firmware and UEFI porting to this are done seperately.

Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
---
 hw/arm/virt-acpi-build.c |  59 +++++++++++++-
 hw/arm/virt.c            | 196 ++++++++++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/virt.h    |   3 +
 3 files changed, 254 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6ea47e2..60af414 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -84,6 +84,52 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
     aml_append(scope, dev);
 }
 
+static void acpi_dsdt_add_ahci(Aml *scope, const MemMapEntry *ahci_memmap,
+                                           uint32_t ahci_irq)
+{
+    Aml *dev = aml_device("AHC0");
+    aml_append(dev, aml_name_decl("_HID", aml_string("LNRO001E")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
+
+    Aml *crs = aml_resource_template();
+    aml_append(crs, aml_memory32_fixed(ahci_memmap->base,
+                                       ahci_memmap->size, AML_READ_WRITE));
+    aml_append(crs,
+               aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
+                             AML_EXCLUSIVE, &ahci_irq, 1));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+
+    Aml *pkg = aml_package(3);
+    aml_append(pkg, aml_int(0x1));
+    aml_append(pkg, aml_int(0x6));
+    aml_append(pkg, aml_int(0x1));
+
+    /* append the SATA class id */
+    aml_append(dev, aml_name_decl("_CLS", pkg));
+
+    aml_append(scope, dev);
+}
+
+static void acpi_dsdt_add_ehci(Aml *scope, const MemMapEntry *ehci_memmap,
+                                           uint32_t ehci_irq)
+{
+    Aml *dev = aml_device("EHC0");
+    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0D20")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
+
+    Aml *crs = aml_resource_template();
+    aml_append(crs, aml_memory32_fixed(ehci_memmap->base,
+                                       ehci_memmap->size, AML_READ_WRITE));
+    aml_append(crs,
+               aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
+                             AML_EXCLUSIVE, &ehci_irq, 1));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+
+    aml_append(scope, dev);
+}
+
 static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
 {
     Aml *dev = aml_device("FWCF");
@@ -768,14 +814,23 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
     acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
     acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
-    acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
-                    (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
+    if (!vms->sbsa) {
+        acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
+                   (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
+    }
     acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE),
                       vms->highmem, vms->highmem_ecam);
     acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
                        (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
     acpi_dsdt_add_power_button(scope);
 
+    if (vms->sbsa) {
+        acpi_dsdt_add_ahci(scope, &memmap[VIRT_AHCI],
+                           (irqmap[VIRT_AHCI] + ARM_SPI_BASE));
+        acpi_dsdt_add_ehci(scope, &memmap[VIRT_EHCI],
+                           (irqmap[VIRT_EHCI] + ARM_SPI_BASE));
+    }
+
     aml_append(dsdt, scope);
 
     /* copy AML table into ACPI tables blob and patch header there */
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 742f68a..491f23b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -59,6 +59,10 @@
 #include "qapi/visitor.h"
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
+#include "hw/ide/internal.h"
+#include "hw/ide/ahci_internal.h"
+#include "hw/usb.h"
+#include "qemu/cutils.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -94,6 +98,8 @@
 
 #define PLATFORM_BUS_NUM_IRQS 64
 
+#define SATA_NUM_PORTS 6
+
 /* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
  * RAM can go up to the 256GB mark, leaving 256GB of the physical
  * address space unallocated and free for future use between 256G and 512G.
@@ -168,6 +174,47 @@ static const int a15irqmap[] = {
     [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
 };
 
+static const MemMapEntry sbsa_memmap[] = {
+    /* Space up to 0x8000000 is reserved for a boot ROM */
+    [VIRT_FLASH] =              {          0, 0x08000000 },
+    [VIRT_CPUPERIPHS] =         { 0x08000000, 0x00020000 },
+    /* GIC distributor and CPU interfaces sit inside the CPU peripheral space */
+    [VIRT_GIC_DIST] =           { 0x08000000, 0x00010000 },
+    [VIRT_GIC_CPU] =            { 0x08010000, 0x00010000 },
+    [VIRT_GIC_V2M] =            { 0x08020000, 0x00001000 },
+    /* The space in between here is reserved for GICv3 CPU/vCPU/HYP */
+    [VIRT_GIC_ITS] =            { 0x08080000, 0x00020000 },
+    /* This redistributor space allows up to 2*64kB*123 CPUs */
+    [VIRT_GIC_REDIST] =         { 0x080A0000, 0x00F60000 },
+    [VIRT_UART] =               { 0x09000000, 0x00001000 },
+    [VIRT_RTC] =                { 0x09010000, 0x00001000 },
+    [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
+    [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
+    [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
+    [VIRT_AHCI] =               { 0x09050000, 0x00010000 },
+    [VIRT_EHCI] =               { 0x09060000, 0x00010000 },
+    [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
+    [VIRT_SECURE_MEM] =         { 0x0e000000, 0x01000000 },
+    [VIRT_PCIE_MMIO] =          { 0x10000000, 0x7fff0000 },
+    [VIRT_PCIE_PIO] =           { 0x8fff0000, 0x00010000 },
+    [VIRT_PCIE_ECAM] =          { 0x90000000, 0x10000000 },
+    /* Second PCIe window, 508GB wide at the 4GB boundary */
+    [VIRT_PCIE_MMIO_HIGH] =     { 0x100000000ULL, 0x7F00000000ULL },
+    [VIRT_MEM] =                { 0x8000000000ULL, RAMLIMIT_BYTES },
+};
+
+static const int sbsa_irqmap[] = {
+    [VIRT_UART] = 1,
+    [VIRT_RTC] = 2,
+    [VIRT_PCIE] = 3, /* ... to 6 */
+    [VIRT_GPIO] = 7,
+    [VIRT_SECURE_UART] = 8,
+    [VIRT_AHCI] = 9,
+    [VIRT_EHCI] = 10,
+    [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
+    [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
+};
+
 static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a15"),
     ARM_CPU_TYPE_NAME("cortex-a53"),
@@ -696,6 +743,72 @@ static void create_rtc(const VirtMachineState *vms, qemu_irq *pic)
     g_free(nodename);
 }
 
+static void create_ahci(const VirtMachineState *vms, qemu_irq *pic)
+{
+    char *nodename;
+    hwaddr base = vms->memmap[VIRT_AHCI].base;
+    hwaddr size = vms->memmap[VIRT_AHCI].size;
+    int irq = vms->irqmap[VIRT_AHCI];
+    const char compat[] = "qemu,mach-virt-ahci\0generic-ahci";
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
+
+    nodename = g_strdup_printf("/sata@%" PRIx64, base);
+    qemu_fdt_add_subnode(vms->fdt, nodename);
+    qemu_fdt_setprop(vms->fdt, nodename, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+                                 2, base, 2, size);
+    qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupts",
+                           GIC_FDT_IRQ_TYPE_SPI, irq,
+                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+    g_free(nodename);
+}
+
+static void create_ehci(const VirtMachineState *vms, qemu_irq *pic)
+{
+    char *nodename;
+    hwaddr base = vms->memmap[VIRT_EHCI].base;
+    hwaddr size = vms->memmap[VIRT_EHCI].size;
+    int irq = vms->irqmap[VIRT_EHCI];
+    const char compat[] = "qemu,mach-virt-ehci\0generic-ehci";
+    USBBus *usb_bus;
+
+    sysbus_create_simple("exynos4210-ehci-usb", base, pic[irq]);
+
+    usb_bus = usb_bus_find(-1);
+    usb_create_simple(usb_bus, "usb-kbd");
+    usb_create_simple(usb_bus, "usb-mouse");
+
+    nodename = g_strdup_printf("/ehci@%" PRIx64, base);
+    qemu_fdt_add_subnode(vms->fdt, nodename);
+    qemu_fdt_setprop(vms->fdt, nodename, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+                                 2, base, 2, size);
+    qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupts",
+                           GIC_FDT_IRQ_TYPE_SPI, irq,
+                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+    g_free(nodename);
+}
+
 static DeviceState *gpio_key_dev;
 static void virt_powerdown_req(Notifier *n, void *opaque)
 {
@@ -1107,13 +1220,21 @@ static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
             NICInfo *nd = &nd_table[i];
 
             if (!nd->model) {
-                nd->model = g_strdup("virtio");
+                if (vms->sbsa) {
+                    nd->model = g_strdup("e1000");
+                } else {
+                    nd->model = g_strdup("virtio");
+                }
             }
 
             pci_nic_init_nofail(nd, pci->bus, nd->model, NULL);
         }
     }
 
+    if (vms->sbsa) {
+        pci_create_simple(pci->bus, -1, "VGA");
+    }
+
     nodename = g_strdup_printf("/pcie@%" PRIx64, base);
     qemu_fdt_add_subnode(vms->fdt, nodename);
     qemu_fdt_setprop_string(vms->fdt, nodename,
@@ -1502,11 +1623,18 @@ static void machvirt_init(MachineState *machine)
 
     create_gpio(vms, pic);
 
+    if (vms->sbsa) {
+        create_ahci(vms, pic);
+        create_ehci(vms, pic);
+    }
+
     /* Create mmio transports, so the user can create virtio backends
      * (which will be automatically plugged in to the transports). If
      * no backend is created the transport will just sit harmlessly idle.
      */
-    create_virtio_devices(vms, pic);
+    if (!vms->sbsa) {
+        create_virtio_devices(vms, pic);
+    }
 
     vms->fw_cfg = create_fw_cfg(vms, &address_space_memory);
     rom_set_fw(vms->fw_cfg);
@@ -1818,6 +1946,7 @@ static void virt_3_0_instance_init(Object *obj)
 
     vms->memmap = a15memmap;
     vms->irqmap = a15irqmap;
+    vms->sbsa = false;
 }
 
 static void virt_machine_3_0_options(MachineClass *mc)
@@ -1950,3 +2079,66 @@ static void virt_machine_2_6_options(MachineClass *mc)
     vmc->no_pmu = true;
 }
 DEFINE_VIRT_MACHINE(2, 6)
+
+static void sbsa_instance_init(Object *obj)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->secure = true;
+    object_property_add_bool(obj, "secure", virt_get_secure,
+                             virt_set_secure, NULL);
+    object_property_set_description(obj, "secure",
+                                    "Set on/off to enable/disable the ARM "
+                                    "Security Extensions (TrustZone)",
+                                    NULL);
+
+    vms->virt = true;
+    object_property_add_bool(obj, "virtualization", virt_get_virt,
+                             virt_set_virt, NULL);
+    object_property_set_description(obj, "virtualization",
+                                    "Set on/off to enable/disable emulating a "
+                                    "guest CPU which implements the ARM "
+                                    "Virtualization Extensions",
+                                    NULL);
+
+    vms->highmem = true;
+
+    /* This can be changed to GICv3 when firmware is ready*/
+    vms->gic_version = 2;
+    object_property_add_str(obj, "gic-version", virt_get_gic_version,
+                        virt_set_gic_version, NULL);
+    object_property_set_description(obj, "gic-version",
+                                    "Set GIC version. "
+                                    "Valid values are 2, 3, host, max", NULL);
+    vms->its = true;
+
+    vms->memmap = sbsa_memmap;
+    vms->irqmap = sbsa_irqmap;
+    vms->sbsa = true;
+}
+
+static void sbsa_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->max_cpus = 246;
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a57");
+    mc->block_default_type = IF_IDE;
+    mc->default_ram_size = 1 * G_BYTE;
+    mc->default_cpus = 4;
+    mc->desc = "QEMU 'SBSA' ARM Virtual Machine";
+}
+
+static const TypeInfo sbsa_info = {
+    .name          = MACHINE_TYPE_NAME("sbsa"),
+    .parent        = TYPE_VIRT_MACHINE,
+    .instance_init = sbsa_instance_init,
+    .class_init    = sbsa_class_init,
+};
+
+static void sbsa_machine_init(void)
+{
+    type_register_static(&sbsa_info);
+}
+
+type_init(sbsa_machine_init);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 9a870cc..619473e 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -78,6 +78,8 @@ enum {
     VIRT_GPIO,
     VIRT_SECURE_UART,
     VIRT_SECURE_MEM,
+    VIRT_AHCI,
+    VIRT_EHCI,
 };
 
 typedef enum VirtIOMMUType {
@@ -124,6 +126,7 @@ typedef struct {
     uint32_t msi_phandle;
     uint32_t iommu_phandle;
     int psci_conduit;
+    bool sbsa;
 } VirtMachineState;
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_PCIE_ECAM_HIGH : VIRT_PCIE_ECAM)
-- 
2.7.4

