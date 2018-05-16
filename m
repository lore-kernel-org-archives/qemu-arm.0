Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1243244wme;
        Wed, 16 May 2018 08:22:48 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrt5/8cI74fRy5JvztBpRVqDO3UabxkjwE1NxzNpzS33UOYm+6gOaIvNiLB/JwBBb24lsQ1
X-Received: by 2002:ac8:4106:: with SMTP id q6-v6mr1408268qtl.267.1526484167863;
        Wed, 16 May 2018 08:22:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526484167; cv=none;
        d=google.com; s=arc-20160816;
        b=e5MvVq2Bbby5x3ao/vcxmxHLNyofWWd8R0OH5q1wQJ95shvjz8ZszFPWLdvCbr4OEb
         zQsPHcU7Vo30cCR8kUgq3eTfwLj18oqmbX5HYS497iQAgpbDgn2Kij3dd+O/8BQ5Mfbg
         mzp9FNWbt6QjgYPsQF14s5DXKYN3K5zytDdAj+SBUJb7J56jhnjpBR1qhtwzQgUFO3Fu
         anLLV+EA/S/2iaXa8XUH2tjRugQ6uO/n2wzxanToDjmNQgYE9R199IbBxvoH1JWkZ5GZ
         AUugDNi2lJQoxJf0i/IwMeqDpHJocYXL8/DUfcO354eWeS23FosVvo3mwqSTqbPu78FS
         7pvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=4a3qgemOLQb6j4jk0vDKXTkh2RUh9l8PicCTqW4vKNU=;
        b=oHIS6KcgbWVFZH3h7XnR9teoIpBiMbny+Dr+/cjrzkoS58pwcZ7NqsTcKr6Yc+20QY
         0N0Jt7e7DJ95kNEUMqop/0QK3h46uEF0b1H4uTzTPlAfxe/2CsUTtM2/TpnBAzo8WP3Q
         3IbWYpZALu1ZS0CdRlBIcl2rMKbMds2nUEn44EkjPQjKr8xLKWnRigsbgfOsQ8vacup2
         es6yAxwmCnlxPDGtNtgyfl9P7keNK2Q1B5gczMycnJ6NS4LHPS3JgT8/HgBZkCcZxsdj
         Ii32EMA/76at+NFJxVvZZ1/hh5up7FLXPxOUt9aXbz0dhgjsg6nMH1EDaB77PBEnKI0l
         VoRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v22-v6si2885539qkl.392.2018.05.16.08.22.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 08:22:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51220 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fIyGN-00088z-9l
	for alex.bennee@linaro.org; Wed, 16 May 2018 11:22:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fIyG7-00086h-9s
	for qemu-arm@nongnu.org; Wed, 16 May 2018 11:22:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fIyG0-0005vR-LO
	for qemu-arm@nongnu.org; Wed, 16 May 2018 11:22:31 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2098 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fIyFz-0005sv-0U; Wed, 16 May 2018 11:22:24 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 36BEBE5CA1DC9;
	Wed, 16 May 2018 23:22:06 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.361.1; Wed, 16 May 2018 23:22:01 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Wed, 16 May 2018 16:20:26 +0100
Message-ID: <20180516152026.2920-7-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [RFC v2 6/6] hw/arm: Populate non-contiguous memory
 regions
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, jonathan.cameron@huawei.com,
	linuxarm@huawei.com,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	eric.auger@redhat.com, alex.williamson@redhat.com,
	zhaoshenglong@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tYXT9qS3/QiP

In case valid iova regions are non-contiguous, split the
RAM mem into a 1GB non-pluggable dimm and remaining as a
single pc-dimm mem.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/virt.c | 261 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 256 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index be3ad14..562e389 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -58,6 +58,12 @@
 #include "hw/smbios/smbios.h"
 #include "qapi/visitor.h"
 #include "standard-headers/linux/input.h"
+#include "hw/vfio/vfio-common.h"
+#include "qemu/config-file.h"
+#include "monitor/qdev.h"
+#include "qom/object_interfaces.h"
+#include "qapi/qmp/qdict.h"
+#include "qemu/option.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -110,7 +116,10 @@ static ARMPlatformBusSystemParams platform_bus_params;
  * terabyte of physical address space.)
  */
 #define RAMLIMIT_GB 255
-#define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)
+#define SZ_1G (1024ULL * 1024 * 1024)
+#define RAMLIMIT_BYTES (RAMLIMIT_GB * SZ_1G)
+
+#define ALIGN_1G (1ULL << 30)
 
 /* Addresses and sizes of our components.
  * 0..128MB is space for a flash device so we can run bootrom code such as UEFI.
@@ -1171,6 +1180,236 @@ void virt_machine_done(Notifier *notifier, void *data)
     virt_build_smbios(vms);
 }
 
+static void free_iova_copy(struct vfio_iova_head *iova_copy)
+{
+    VFIOIovaRange *iova, *tmp;
+
+    QLIST_FOREACH_SAFE(iova, iova_copy, next, tmp) {
+        QLIST_REMOVE(iova, next);
+        g_free(iova);
+    }
+}
+
+static void get_iova_copy(struct vfio_iova_head *iova_copy)
+{
+    VFIOIovaRange *iova, *new, *prev_iova = NULL;
+
+    QLIST_FOREACH(iova, &vfio_iova_regions, next) {
+        new = g_malloc0(sizeof(*iova));
+        new->start = iova->start;
+        new->end = iova->end;
+
+        if (prev_iova) {
+            QLIST_INSERT_AFTER(prev_iova, new, next);
+        } else {
+            QLIST_INSERT_HEAD(iova_copy, new, next);
+        }
+        prev_iova = new;
+    }
+}
+
+static hwaddr find_memory_chunk(VirtMachineState *vms,
+                   struct vfio_iova_head *iova_copy,
+                   hwaddr req_size, bool pcdimm)
+{
+    VFIOIovaRange *iova, *tmp;
+    hwaddr new_start, new_size, sz_align;
+    hwaddr virt_start = vms->memmap[VIRT_MEM].base;
+    hwaddr addr_align = ALIGN_1G; /* Set to max ARM64 hugepage size */
+
+    /* Size alignment */
+    sz_align = (pcdimm) ? MAX(TARGET_PAGE_SIZE, QEMU_VMALLOC_ALIGN) :
+                                                      TARGET_PAGE_SIZE;
+
+    QLIST_FOREACH_SAFE(iova, iova_copy, next, tmp) {
+        if (virt_start >= iova->end) {
+            continue;
+        }
+
+        /* Align addr */
+        new_start = ROUND_UP(MAX(virt_start, iova->start), addr_align);
+        if (new_start >= iova->end) {
+            continue;
+        }
+
+        if (req_size > iova->end - new_start + 1) {
+            continue;
+        }
+
+        /*
+         * Check the region can hold any size alignment requirement.
+         */
+        new_size = QEMU_ALIGN_UP(req_size, sz_align);
+
+        if ((new_start + new_size - 1 > iova->end) ||
+                 (new_start + new_size >= virt_start + RAMLIMIT_BYTES)) {
+            continue;
+        }
+
+        /*
+         * Modify the iova list entry for non pc-dimm case so that it
+         * is not used again for pc-dimm allocation.
+         */
+        if (!pcdimm) {
+            if (new_size - req_size) {
+                iova->start = new_start + new_size;
+            } else {
+                QLIST_REMOVE(iova, next);
+            }
+        }
+        return new_start;
+    }
+
+    return -1;
+}
+
+static void update_memory_regions(VirtMachineState *vms)
+{
+    hwaddr addr;
+    VFIOIovaRange *iova;
+    MachineState *machine = MACHINE(vms);
+    hwaddr virt_start = vms->memmap[VIRT_MEM].base;
+    hwaddr req_size, ram_size = machine->ram_size;
+    struct vfio_iova_head iova_copy = QLIST_HEAD_INITIALIZER(iova_copy);
+
+    /* No valid iova regions, use default */
+    if (QLIST_EMPTY(&vfio_iova_regions)) {
+        vms->bootinfo.loader_start = vms->memmap[VIRT_MEM].base;
+        vms->bootinfo.ram_size = ram_size;
+        return;
+    }
+
+    /*
+     * If valid iovas has only one entry, check the req size fits in
+     * and can have the loader start < 4GB. This will make sure platforms
+     * with no holes in mem will have the same mem model as before.
+     */
+    req_size = ram_size;
+    iova = QLIST_NEXT(QLIST_FIRST(&vfio_iova_regions), next);
+    if (!iova) {
+        iova = QLIST_FIRST(&vfio_iova_regions);
+        addr = ROUND_UP(MAX(virt_start, iova->start), ALIGN_1G);
+        if ((addr < 4 * SZ_1G) && (ram_size <= iova->end - addr + 1) &&
+                  (addr + ram_size < virt_start + RAMLIMIT_BYTES)) {
+            vms->bootinfo.loader_start = addr;
+            vms->bootinfo.ram_size = ram_size;
+            return;
+        }
+    }
+
+    /* Get a copy of valid iovas and work on it */
+    get_iova_copy(&iova_copy);
+
+    /* Split the mem as first 1GB non-pluggable and rest as pc-dimm */
+    req_size = MIN(ram_size, SZ_1G);
+    addr = find_memory_chunk(vms, &iova_copy, req_size, false);
+    if (addr == -1 || addr >= 4 * SZ_1G) {
+        goto out;
+    }
+
+    /*Update non-pluggable mem details */
+    machine->ram_size = req_size;
+    vms->bootinfo.loader_start = addr;
+    vms->bootinfo.ram_size = machine->ram_size;
+
+    req_size = ram_size - req_size;
+    if (!req_size) {
+        goto done;
+    }
+
+    /* Remaining memory is modeled as a pc-dimm. */
+    addr = find_memory_chunk(vms, &iova_copy, req_size, true);
+    if (addr == -1) {
+        goto out;
+    }
+
+    /*Update pc-dimm mem details */
+    vms->bootinfo.dimm_mem = g_new(struct dimm_mem_info, 1);
+    vms->bootinfo.dimm_mem->base = addr;
+    vms->bootinfo.dimm_mem->size = req_size;
+    machine->maxram_size = machine->ram_size + req_size;
+    machine->ram_slots += 1;
+
+done:
+    free_iova_copy(&iova_copy);
+    return;
+
+out:
+    free_iova_copy(&iova_copy);
+    error_report("mach-virt: Not enough contiguous memory to model ram");
+    exit(1);
+}
+
+static void create_pcdimms(VirtMachineState *vms,
+                             MemoryRegion *sysmem,
+                             MemoryRegion *ram)
+{
+    hwaddr addr, size;
+    Error *local_err = NULL;
+    QDict *qdict;
+    QemuOpts *opts;
+    char *tmp;
+
+    if (!vms->bootinfo.dimm_mem) {
+        return;
+    }
+
+    addr = vms->bootinfo.dimm_mem->base;
+    size = vms->bootinfo.dimm_mem->size;
+
+    /*Create hotplug address space */
+    vms->hotplug_memory.base = ROUND_UP(addr, ALIGN_1G);
+    size = ROUND_UP(size, MAX(TARGET_PAGE_SIZE, QEMU_VMALLOC_ALIGN));
+
+    memory_region_init(&vms->hotplug_memory.mr, OBJECT(vms),
+                                      "hotplug-memory", size);
+    memory_region_add_subregion(sysmem, vms->hotplug_memory.base,
+                                        &vms->hotplug_memory.mr);
+    /* Create backend mem object */
+    qdict = qdict_new();
+    qdict_put_str(qdict, "qom-type", "memory-backend-ram");
+    qdict_put_str(qdict, "id", "mem1");
+    tmp = g_strdup_printf("%"PRIu64 "M", size / (1024 * 1024));
+    qdict_put_str(qdict, "size", tmp);
+    g_free(tmp);
+
+    opts = qemu_opts_from_qdict(qemu_find_opts("object"), qdict, &local_err);
+    if (local_err) {
+        goto err;
+    }
+
+    user_creatable_add_opts(opts, &local_err);
+    qemu_opts_del(opts);
+    QDECREF(qdict);
+    if (local_err) {
+        goto err;
+    }
+
+    /* Create pc-dimm dev*/
+    qdict = qdict_new();
+    qdict_put_str(qdict, "driver", "pc-dimm");
+    qdict_put_str(qdict, "id", "dimm1");
+    qdict_put_str(qdict, "memdev", "mem1");
+
+    opts = qemu_opts_from_qdict(qemu_find_opts("device"), qdict, &local_err);
+    if (local_err) {
+        goto err;
+    }
+
+    qdev_device_add(opts, &local_err);
+    qemu_opts_del(opts);
+    QDECREF(qdict);
+    if (local_err) {
+        goto err;
+    }
+
+    return;
+
+err:
+    error_report_err(local_err);
+    exit(1);
+}
+
 static void virt_ram_memory_region_init(Notifier *notifier, void *data)
 {
     MemoryRegion *sysmem = get_system_memory();
@@ -1179,9 +1418,14 @@ static void virt_ram_memory_region_init(Notifier *notifier, void *data)
                                          ram_memory_region_init);
     MachineState *machine = MACHINE(vms);
 
+    update_memory_regions(vms);
     memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
                                          machine->ram_size);
-    memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
+    memory_region_add_subregion(sysmem, vms->bootinfo.loader_start, ram);
+
+    if (vms->bootinfo.dimm_mem) {
+        create_pcdimms(vms, sysmem, ram);
+    }
 }
 
 static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
@@ -1404,13 +1648,11 @@ static void machvirt_init(MachineState *machine)
     vms->machine_done.notify = virt_machine_done;
     qemu_add_machine_init_done_notifier(&vms->machine_done);
 
-    vms->bootinfo.ram_size = machine->ram_size;
     vms->bootinfo.kernel_filename = machine->kernel_filename;
     vms->bootinfo.kernel_cmdline = machine->kernel_cmdline;
     vms->bootinfo.initrd_filename = machine->initrd_filename;
     vms->bootinfo.nb_cpus = smp_cpus;
     vms->bootinfo.board_id = -1;
-    vms->bootinfo.loader_start = vms->memmap[VIRT_MEM].base;
     vms->bootinfo.get_dtb = machvirt_dtb;
     vms->bootinfo.firmware_loaded = firmware_loaded;
 
@@ -1559,7 +1801,7 @@ static void virt_dimm_plug(HotplugHandler *hotplug_dev,
     PCDIMMDevice *dimm = PC_DIMM(dev);
     PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
     MemoryRegion *mr;
-    uint64_t align;
+    uint64_t align, addr;
     Error *local_err = NULL;
 
     mr = ddc->get_memory_region(dimm, &local_err);
@@ -1573,6 +1815,15 @@ static void virt_dimm_plug(HotplugHandler *hotplug_dev,
         goto out;
     }
 
+    addr = object_property_get_uint(OBJECT(dimm), PC_DIMM_ADDR_PROP,
+                                                       &error_fatal);
+    /* Assign the node for pc-dimm initial ram */
+    if (vms->bootinfo.dimm_mem && (addr == vms->bootinfo.dimm_mem->base)
+                                                 && (nb_numa_nodes > 0)) {
+        vms->bootinfo.dimm_mem->node = object_property_get_uint(OBJECT(dev),
+                                           PC_DIMM_NODE_PROP, &error_fatal);
+    }
+
 out:
     error_propagate(errp, local_err);
 }
-- 
2.7.4


