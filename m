Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp111468wrq;
        Mon, 2 Jul 2018 10:23:57 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeqBuG8BZ8ZIOJh+5L6EO4nM5EIkTDFlRt3rWZes/yP53TfZYZawG/YXOmEZy1tGOyNjEKv
X-Received: by 2002:a37:cb86:: with SMTP id u6-v6mr22641914qkl.383.1530552237707;
        Mon, 02 Jul 2018 10:23:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530552237; cv=none;
        d=google.com; s=arc-20160816;
        b=qTS5ZVO6KLNjZAimMC04T99K6z+mydhzDcIFYxK3YrYVSTwO7GUMXfBat2gE3YDeel
         2dvlfz4Y9zG0QiZTQ2GFkgxlX6FMdSn/uCLfnHOh3XYTbZVtRLunDhRGzLNxxD9Rk7rR
         UuZQpByHAfydEVM9to2rHlM+oMvRvPsg0eLN1T0fJHlH3J7jXtRLKWYwL01gP1kRWR12
         BLl4eZSfhex8sZw5tH4z5BkVPsgJZObdgLdorTA0eDZ1xwkThHQnvcEnuub9c56vpDhr
         EgxM+mNLHHxfsqnonqm3Z+WyGSIOJ4NfVY+CD/qnT7aL1BRNjzwtYqckiyVkqSyCi3+h
         AUUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=9NnlKODokXStYZdqJ9R48Iys6ih9TIuwJeJgJTX/Dk4=;
        b=yaDTXBQwLaR4DFdrWzFzaCfP7jjZGa7fN2Zu7jcAfmTnpXt6OK7HjVcr2ofr5SW2dl
         /B0TmlzNIlE2jDcKboc5u+/uDQzQ6rMMbhGjGdF9Lr0pU2f2G8bcXcY9RqXf8HOMcpN+
         sJhl+dF3IGA/MHlbyVYXAqLzugTS0jyY7GRu3sIJAN8IQlg5olRIF5kAKgmKPApBjFd+
         lu0W8fPWwjp4qBDel/X5pqnyfeD2jfZjI2uAiWGO0FMdI29ZWZPbEO7cFguhIy8EJ0tJ
         QcrK9NDT9Rib+aQJkJKml4XDO+AEf/Iv94GDF1auONEqqpLeNKnNCnVkTCsMEheVgH6M
         fLNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 20-v6si3267253qtn.376.2018.07.02.10.23.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jul 2018 10:23:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34495 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fa2YO-0000P8-UX
	for alex.bennee@linaro.org; Mon, 02 Jul 2018 13:23:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fa2Xs-00007F-V8
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 13:23:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fa2Xo-0006YP-UH
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 13:23:24 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49740 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fa2Xo-0006Y4-P4; Mon, 02 Jul 2018 13:23:20 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3BC797C6A9;
	Mon,  2 Jul 2018 17:23:20 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-57.ams2.redhat.com
	[10.36.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24D1A111AF38;
	Mon,  2 Jul 2018 17:23:18 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Mon,  2 Jul 2018 19:22:33 +0200
Message-Id: <1530552162-15533-7-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1530552162-15533-1-git-send-email-eric.auger@redhat.com>
References: <1530552162-15533-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 02 Jul 2018 17:23:20 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 02 Jul 2018 17:23:20 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v2 06/15] hw/arm/virt: Allocate device_memory
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
Cc: drjones@redhat.com, david@gibson.dropbear.id.au, dgilbert@redhat.com,
	agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vmg/CvuDzFcw

We define a new hotpluggable RAM region (aka. device memory).
Its base is 2TB GPA. This obviously requires 42b IPA support
in KVM/ARM, FW and guest kernel. At the moment the device
memory region is max 2TB.

This is largely inspired of device memory initialization in
pc machine code.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
---
 hw/arm/virt.c         | 104 ++++++++++++++++++++++++++++++++++++--------------
 include/hw/arm/arm.h  |   2 +
 include/hw/arm/virt.h |   1 +
 3 files changed, 79 insertions(+), 28 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5a4d0bf..6fefb78 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -59,6 +59,7 @@
 #include "qapi/visitor.h"
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
+#include "hw/acpi/acpi.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -94,34 +95,25 @@
 
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
-#define RAMLIMIT_GB 255
-#define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)
+#define SZ_64K 0x10000
+#define SZ_1G (1024ULL * 1024 * 1024)
 
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
+ * 2TB..4TB is used for hot-pluggable DIMM (assumes 42b GPA is supported).
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
@@ -148,12 +140,13 @@ static const MemMapEntry a15memmap[] = {
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
+    [VIRT_HOTPLUG_MEM] =        { 2048 * SZ_1G, 2048 * SZ_1G },
 };
 
 static const int a15irqmap[] = {
@@ -1223,6 +1216,58 @@ static void create_secure_ram(VirtMachineState *vms,
     g_free(nodename);
 }
 
+static void create_device_memory(VirtMachineState *vms, MemoryRegion *sysmem)
+{
+    MachineState *ms = MACHINE(vms);
+    uint64_t device_memory_size;
+    uint64_t align = SZ_64K;
+
+    /* always allocate the device memory information */
+    ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
+
+    if (vms->max_vm_phys_shift < 42) {
+        /* device memory starts at 2TB whereas this VM supports less than
+         * 2TB GPA */
+        if (ms->maxram_size > ms->ram_size || ms->ram_slots) {
+            MachineClass *mc = MACHINE_GET_CLASS(ms);
+
+            error_report("\"-memory 'slots|maxmem'\" is not supported by %s "
+                         "since KVM does not support more than 41b IPA",
+                         mc->name);
+            exit(EXIT_FAILURE);
+        }
+        return;
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
+            exit(EXIT_FAILURE);
+    }
+
+    ms->device_memory->base = vms->memmap[VIRT_HOTPLUG_MEM].base;
+    device_memory_size = ms->maxram_size - ms->ram_size;
+
+    if (device_memory_size > vms->memmap[VIRT_HOTPLUG_MEM].size) {
+        error_report("unsupported amount of maximum memory: " RAM_ADDR_FMT,
+                         ms->maxram_size);
+        exit(EXIT_FAILURE);
+    }
+
+    memory_region_init(&ms->device_memory->mr, OBJECT(vms),
+                       "device-memory", device_memory_size);
+    memory_region_add_subregion(sysmem, ms->device_memory->base,
+                                &ms->device_memory->mr);
+    vms->bootinfo.device_memory_start = ms->device_memory->base;
+    vms->bootinfo.device_memory_size = device_memory_size;
+}
+
 static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
 {
     const VirtMachineState *board = container_of(binfo, VirtMachineState,
@@ -1430,7 +1475,8 @@ static void machvirt_init(MachineState *machine)
     vms->smp_cpus = smp_cpus;
 
     if (machine->ram_size > vms->memmap[VIRT_MEM].size) {
-        error_report("mach-virt: cannot model more than %dGB RAM", RAMLIMIT_GB);
+        error_report("mach-virt: cannot model more than %dGB RAM",
+                     (int)(vms->memmap[VIRT_MEM].size / SZ_1G));
         exit(1);
     }
 
@@ -1525,6 +1571,8 @@ static void machvirt_init(MachineState *machine)
                                          machine->ram_size);
     memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
 
+    create_device_memory(vms, sysmem);
+
     create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
 
     create_gic(vms, pic);
diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
index ffed392..76269e6 100644
--- a/include/hw/arm/arm.h
+++ b/include/hw/arm/arm.h
@@ -116,6 +116,8 @@ struct arm_boot_info {
     bool secure_board_setup;
 
     arm_endianness endianness;
+    hwaddr device_memory_start;
+    hwaddr device_memory_size;
 };
 
 /**
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 91f6de2..173938d 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -78,6 +78,7 @@ enum {
     VIRT_GPIO,
     VIRT_SECURE_UART,
     VIRT_SECURE_MEM,
+    VIRT_HOTPLUG_MEM,
 };
 
 typedef enum VirtIOMMUType {
-- 
2.5.5

