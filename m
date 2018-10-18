Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2386128wrt;
        Thu, 18 Oct 2018 07:39:26 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60Br0X5cpkqJUhvNdrSfFEYJZTOo2oZzHmMg6hEJmNDi1t/SFzzgcd0igGSkJieVRI4kmy3
X-Received: by 2002:ac8:1416:: with SMTP id k22-v6mr30479137qtj.390.1539873566260;
        Thu, 18 Oct 2018 07:39:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539873566; cv=none;
        d=google.com; s=arc-20160816;
        b=YON4lhjK/QHMnzoafPjs1E7Fo01v6mg1lEEbLx3cfNU1gL62w1CmMmrFE0flGcZrAB
         zubtrQCZdgeu/qxBu9DhfJp/wOeIgtwekSXal6e7C/8TEvlpSvpTKZqU7MPQSqqM3+e+
         1KuV9Id6vdk5bJJw6oTtFq/pYhphIE6i2WoCL5DkCG3+6dzj9J+JGk3W057N1u43Oup9
         DMqfYiEFgaJ6Lt34tNfkIrA37+8JHa5/0jXm19tqynu9QmEtnbY0RMtDF7uovei5dt75
         jlRSY9SElXLciuOndOsXfZNDTSfYUxNBkdkLCSfFEeW70L+8WcduHaBDAWSsbcZk5mUE
         RTLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=X8sybXPVLaxdhPUYmTMm7YLTPWaAchTugpldp37GWw8=;
        b=OOIU4GD84MugmtyDSmxEOGfZhFaYqJkwWQFiKKBMedCbajSpMgeH4upiDLHkezF5GB
         Oizu+z/Z4J1jqz5FoRzXCmaEQ/0nda1WE/ORt3UmgYeysBiNcBqndoJOCr8AM0w9K5XI
         d2/Pas53vfCLXBnXbjNjYnTgMzE3fGiNOdPnojwNCXVXlr2hV8jLsCnplbMzbzjQuvEO
         Mk1qFrqRsw+QzJPiBh3BOhgmq8ZAegYfjm35RoWAL+Mu2eAjrzPYFw0CWI8n793FFcTa
         mJBniNSoDfFM6LY4DEILsYFTmyOCP4qMv+/wTPqr6Qog2FGpuOU7cSRJqapOQxur0zQg
         XHfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 27si7101711qvi.0.2018.10.18.07.39.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 07:39:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42724 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD9SP-0004KX-NX
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 10:39:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9Kz-0005uo-6b
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:31:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9Kx-0007Ku-Lc
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:31:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53944)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gD9Kx-0007Jo-CJ; Thu, 18 Oct 2018 10:31:43 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5D57288E4F;
	Thu, 18 Oct 2018 14:31:42 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-215.ams2.redhat.com [10.36.116.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CAF44789A7;
	Thu, 18 Oct 2018 14:31:39 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Thu, 18 Oct 2018 16:30:34 +0200
Message-Id: <20181018143042.29588-9-eric.auger@redhat.com>
In-Reply-To: <20181018143042.29588-1-eric.auger@redhat.com>
References: <20181018143042.29588-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 18 Oct 2018 14:31:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 08/16] hw/arm/virt: Allocate device_memory
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
Cc: drjones@redhat.com, dgilbert@redhat.com, Suzuki.Poulose@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h/9m4nZqHlBU

We define a device memory region stating at 2TB and max 4TB.
This requires support of more than 40b IPA on host (CPU,
kernel config and FW). IPA needs are adjusted according to
maxram_size - ram_size value.

This is largely inspired of device memory initialization in
pc machine code.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>

---

v3 -> v4:
- remove bootinfo.device_memory_start/device_memory_size
- rename VIRT_HOTPLUG_MEM into VIRT_DEVICE_MEM
---
 hw/arm/virt.c         | 98 ++++++++++++++++++++++++++++++-------------
 include/hw/arm/virt.h |  1 +
 2 files changed, 71 insertions(+), 28 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 21718c250e..9b06797090 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -59,6 +59,7 @@
 #include "qapi/visitor.h"
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
+#include "hw/acpi/acpi.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -94,38 +95,29 @@
 
 #define PLATFORM_BUS_NUM_IRQS 64
 
-/* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
- * RAM can go up to the 256GB mark, leaving 256GB of the physical
- * address space unallocated and free for future use between 256G and 512G.
- * If we need to provide more RAM to VMs in the future then we need to:
- *  * allocate a second bank of RAM starting at 2TB and working up
- *  * fix the DT and ACPI table generation code in QEMU to correctly
- *    report two split lumps of RAM to the guest
- *  * fix KVM in the host kernel to allow guests with >40 bit address spaces
- * (We don't want to fill all the way up to 512GB with RAM because
- * we might want it for non-RAM purposes later. Conversely it seems
- * reasonable to assume that anybody configuring a VM with a quarter
- * of a terabyte of RAM will be doing it on a host with more than a
- * terabyte of physical address space.)
- */
 #define SZ_1G (1024ULL * 1024 * 1024)
-#define RAMLIMIT_GB 255
-#define RAMLIMIT_BYTES (RAMLIMIT_GB * SZ_1G)
+#define SZ_64K 0x10000
 
 /* device memory starts at 2TB */
 #define DEVICE_MEM_BASE (2048 * SZ_1G)
+#define DEVICE_MEM_SIZE (4096 * SZ_1G)
 
 /* Addresses and sizes of our components.
- * 0..128MB is space for a flash device so we can run bootrom code such as UEFI.
- * 128MB..256MB is used for miscellaneous device I/O.
- * 256MB..1GB is reserved for possible future PCI support (ie where the
- * PCI memory window will go if we add a PCI host controller).
- * 1GB and up is RAM (which may happily spill over into the
- * high memory region beyond 4GB).
- * This represents a compromise between how much RAM can be given to
- * a 32 bit VM and leaving space for expansion and in particular for PCI.
- * Note that devices should generally be placed at multiples of 0x10000,
+ * 0..128MB is space for a flash device so we can run bootrom code such as UEFI,
+ * 128MB..256MB is used for miscellaneous device I/O,
+ * 256MB..1GB is used for PCI host controller,
+ * 1GB..256GB is RAM (not hotpluggable),
+ * 256GB..512GB: is left for device I/O (non RAM purpose),
+ * 512GB..1TB: high mem PCI MMIO region,
+ * 2TB..6TB is used for device memory (assumes dynamic IPA setting on kernel).
+ *
+ * Note that IO devices should generally be placed at multiples of 0x10000,
  * to accommodate guests using 64K pages.
+ *
+ * Conversely it seems reasonable to assume that anybody configuring a VM
+ * with a quarter of a terabyte of RAM will be doing it on a host with more
+ * than a terabyte of physical address space.)
+ *
  */
 static const MemMapEntry a15memmap[] = {
     /* Space up to 0x8000000 is reserved for a boot ROM */
@@ -154,12 +146,14 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_PCIE_MMIO] =          { 0x10000000, 0x2eff0000 },
     [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
     [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
-    [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
+    [VIRT_MEM] =                { SZ_1G , 255 * SZ_1G },
     /* Additional 64 MB redist region (can contain up to 512 redistributors) */
     [VIRT_GIC_REDIST2] =        { 0x4000000000ULL, 0x4000000 },
     [VIRT_PCIE_ECAM_HIGH] =     { 0x4010000000ULL, 0x10000000 },
     /* Second PCIe window, 512GB wide at the 512GB boundary */
-    [VIRT_PCIE_MMIO_HIGH] =   { 0x8000000000ULL, 0x8000000000ULL },
+    [VIRT_PCIE_MMIO_HIGH] =     { 512 * SZ_1G, 512 * SZ_1G },
+    /* device memory beyond 2TB */
+    [VIRT_DEVICE_MEM] =         { DEVICE_MEM_BASE, DEVICE_MEM_SIZE },
 };
 
 static const int a15irqmap[] = {
@@ -1265,6 +1259,51 @@ static void create_secure_ram(VirtMachineState *vms,
     g_free(nodename);
 }
 
+static void create_device_memory(VirtMachineState *vms, MemoryRegion *sysmem)
+{
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
+    MachineClass *mc = MACHINE_GET_CLASS(vms);
+    MachineState *ms = MACHINE(vms);
+    uint64_t device_memory_size = ms->maxram_size - ms->ram_size;
+    uint64_t align = SZ_64K;
+
+    if (!device_memory_size) {
+        return;
+    }
+
+    if (vmc->no_device_memory) {
+        error_report("Machine %s does not support device memory: "
+                     "maxmem option not supported", mc->name);
+        exit(EXIT_FAILURE);
+    }
+
+    if (ms->ram_slots > ACPI_MAX_RAM_SLOTS) {
+        error_report("unsupported number of memory slots: %"PRIu64,
+                     ms->ram_slots);
+        exit(EXIT_FAILURE);
+    }
+
+    if (QEMU_ALIGN_UP(ms->maxram_size, align) != ms->maxram_size) {
+        error_report("maximum memory size must be aligned to multiple of 0x%"
+                     PRIx64, align);
+        exit(EXIT_FAILURE);
+    }
+
+    if (device_memory_size > vms->memmap[VIRT_DEVICE_MEM].size) {
+        error_report("unsupported amount of maximum memory: " RAM_ADDR_FMT,
+                         ms->maxram_size);
+        exit(EXIT_FAILURE);
+    }
+
+    ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
+    ms->device_memory->base = vms->memmap[VIRT_DEVICE_MEM].base;
+
+    memory_region_init(&ms->device_memory->mr, OBJECT(vms),
+                       "device-memory", device_memory_size);
+    memory_region_add_subregion(sysmem, ms->device_memory->base,
+                                &ms->device_memory->mr);
+}
+
 static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
 {
     const VirtMachineState *board = container_of(binfo, VirtMachineState,
@@ -1438,7 +1477,8 @@ static void machvirt_init(MachineState *machine)
     vms->smp_cpus = smp_cpus;
 
     if (machine->ram_size > vms->memmap[VIRT_MEM].size) {
-        error_report("mach-virt: cannot model more than %dGB RAM", RAMLIMIT_GB);
+        error_report("mach-virt: cannot model more than %dGB RAM",
+                     (int)(vms->memmap[VIRT_MEM].size / SZ_1G));
         exit(1);
     }
 
@@ -1533,6 +1573,8 @@ static void machvirt_init(MachineState *machine)
                                          machine->ram_size);
     memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
 
+    create_device_memory(vms, sysmem);
+
     create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
 
     create_gic(vms, pic);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index f57e4c1890..032d88f4c4 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -80,6 +80,7 @@ enum {
     VIRT_GPIO,
     VIRT_SECURE_UART,
     VIRT_SECURE_MEM,
+    VIRT_DEVICE_MEM,
 };
 
 typedef enum VirtIOMMUType {
-- 
2.17.1

