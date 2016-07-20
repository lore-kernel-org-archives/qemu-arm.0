Received: by 10.25.21.156 with SMTP id 28csp1921580lfv;
        Tue, 19 Jul 2016 19:50:08 -0700 (PDT)
X-Received: by 10.55.42.78 with SMTP id q75mr58848200qkh.158.1468983008029;
        Tue, 19 Jul 2016 19:50:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v94si360192qtd.148.2016.07.19.19.50.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jul 2016 19:50:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60239 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bPhaJ-0008RN-F7
	for alex.bennee@linaro.org; Tue, 19 Jul 2016 22:50:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwangwoo.lee@sk.com>) id 1bPfid-0000Z0-6K
	for qemu-arm@nongnu.org; Tue, 19 Jul 2016 20:50:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwangwoo.lee@sk.com>) id 1bPfia-0006cw-6H
	for qemu-arm@nongnu.org; Tue, 19 Jul 2016 20:50:35 -0400
Received: from exvmail3.skhynix.com ([166.125.252.90]:61936
	helo=invmail3.skhynix.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwangwoo.lee@sk.com>)
	id 1bPfiZ-0006cN-KJ; Tue, 19 Jul 2016 20:50:32 -0400
X-AuditID: a67dfc59-f790b6d000004b07-a0-578ecad0f78b
From: Kwangwoo Lee <kwangwoo.lee@sk.com>
To: Xiao Guangrong <guangrong.xiao@linux.intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Shannon Zhao <shannon.zhao@linaro.org>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 20 Jul 2016 09:49:02 +0900
Message-Id: <1468975744-12587-2-git-send-email-kwangwoo.lee@sk.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1468975744-12587-1-git-send-email-kwangwoo.lee@sk.com>
References: <1468975744-12587-1-git-send-email-kwangwoo.lee@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKLMWRmVeSWpSXmKPExsXCNUdUWffiqb5wg2nrmCwa7oVaLFy1jNni
	9NEOZov/v16xWuzf9o/VYs6ZBywWC7oXslkc793BYjHt1B1Wi6fLfrNazNvwgsmB26PlyFtW
	jzvX9rB5zDsZ6PHk2mYmj/f7rrJ59E3/wBzAFsVlk5Kak1mWWqRvl8CV8eDmA5aCc2YV9y7u
	YWlg/KzRxcjJISFgIvFg8hM2CFtM4sK99UA2B1j84RNVkDCbgIbEqQ33WboYuThEBFYzSzxu
	vcYEkmAWKJbo3v6UFcQWFnCQeP76PVicRUBVYs2mDWBxXgFniZ8Hb7JAzJSTWHAhHSTMKeAi
	0bV+E9haIaCSN7+fsYLMlxDYwiZxc0I/M8Q9khIHV9xgmcDIt4CRYRWjSGZeWW5iZo6xXnF2
	RmVeZoVecn7uJkZgYC6r/RO5g7GnVf8QowAHoxIPL8exvnAh1sSy4srcQ4wSHMxKIrxC+4FC
	vCmJlVWpRfnxRaU5qcWHGKU5WJTEeZcsyAkXEkhPLEnNTk0tSC2CyTJxcEo1MCaKTiiPWZAR
	+e76EsGdEdVyJb/vnPVIy/RudQ508I1mnnszftOW+pRDi3znFV12L519dOH0v6l+y/7y3d/t
	PEEwcZvm0oQJNl/n9S5lvawflCEp+iyhZa+fs+eh9bvOCfOxf388M8wiu+FT3wZd441LWbw5
	q/iKD77Sqry/aObfypKC8pqg70osxRmJhlrMRcWJAGL+6khIAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMLMWRmVeSWpSXmKPExsXCFdOSpnvhVF+4waXvZhYN90ItFq5axmwx
	dVULk8Xpox3MFvM+n2K3+P/rFavF/m3/WC3mnHnAYrGgeyGbxfHeHSwW007dYbV4uuw3q8W8
	5WtZLOZteMHkwOfRcuQtq8eda3vYPOadDPR4cm0zk8f7fVfZPL7d9vDom/6BOYA9issmJTUn
	syy1SN8ugSvjwc0HLAXnzCruXdzD0sD4WaOLkYNDQsBE4uET1S5GTiBTTOLCvfVsIDabgIbE
	qQ33WboYuThEBFYzSzxuvcYEkmAWKJbo3v6UFcQWFnCQeP76PVicRUBVYs2mDWBxXgFniZ8H
	b7JAzJeTWHAhHSTMKeAi0bV+E9h8IaCSN7+fsU5g5F7AyLCKUSQzryw3MTPHTK84O6MyL7NC
	Lzk/dxMjMOiW1f6ZtIPx22X3Q4wCHIxKPLwcx/rChVgTy4orcw8xSnAwK4nwCu0HCvGmJFZW
	pRblxxeV5qQWH2KU5mBREuc9/lEpXEggPbEkNTs1tSC1CCbLxMEp1cBYeqdhscPE3Z8nfZAU
	3bDn+JTU+1OjA2/z5ZTedt70tWm39runHk67nhbKblK/a5py5vHRsj9L6g/rzr8oxJl9m8Xw
	bsv+X2dSiutzp79UPO/97In3RT+z02x/LR4ER2Uw3b/Rl337NK9n1Qz/JKZFM3aX6QSF96xc
	Vmt1KLtY+dHqJZ+npGZ4KbEUZyQaajEXFScCABFFi9s2AgAA
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 166.125.252.90
X-Mailman-Approved-At: Tue, 19 Jul 2016 22:48:43 -0400
Subject: [Qemu-arm] [RFC PATCH 1/3] hw/arm/virt: add hotplug memory support
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
Cc: Hyunchul Kim <hyunchul3.kim@sk.com>, Kwangwoo Lee <kwangwoo.lee@sk.com>,
	Woosuk Chung <woosuk.chung@sk.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0K/BIQvbR3Kb

Add hotplug memory feature on aarch64 virt platfom. This patch is
required to emulate a DIMM type memory like NVDIMM.

Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
---
 default-configs/aarch64-softmmu.mak |   1 +
 hw/arm/virt.c                       | 110 ++++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h               |   3 +
 3 files changed, 114 insertions(+)

diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch64-softmmu.mak
index 2449483..5790cd2 100644
--- a/default-configs/aarch64-softmmu.mak
+++ b/default-configs/aarch64-softmmu.mak
@@ -7,3 +7,4 @@ CONFIG_AUX=y
 CONFIG_DDC=y
 CONFIG_DPCD=y
 CONFIG_XLNX_ZYNQMP=y
+CONFIG_MEM_HOTPLUG=y
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a193b5a..f7ff411 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -58,6 +58,8 @@
 #include "hw/smbios/smbios.h"
 #include "qapi/visitor.h"
 #include "standard-headers/linux/input.h"
+#include "hw/mem/pc-dimm.h"
+#include "hw/acpi/acpi.h"
 
 /* Number of external interrupt lines to configure the GIC with */
 #define NUM_IRQS 256
@@ -91,6 +93,7 @@ typedef struct {
     bool secure;
     bool highmem;
     int32_t gic_version;
+    MemoryHotplugState hotplug_memory;
 } VirtMachineState;
 
 #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
@@ -1376,6 +1379,40 @@ static void machvirt_init(MachineState *machine)
     guest_info_state->machine_done.notify = virt_guest_info_machine_done;
     qemu_add_machine_init_done_notifier(&guest_info_state->machine_done);
 
+    /* initialize hotplug memory address space */
+    if (machine->ram_size < machine->maxram_size) {
+        ram_addr_t hotplug_mem_size = machine->maxram_size - machine->ram_size;
+
+        if (machine->ram_slots > ACPI_MAX_RAM_SLOTS) {
+            error_report("unsupported amount of memory slots: %"PRIu64,
+                     machine->ram_slots);
+            exit(EXIT_FAILURE);
+        }
+
+        if (QEMU_ALIGN_UP(machine->maxram_size,
+                     TARGET_PAGE_SIZE) != machine->maxram_size) {
+            error_report("maximum memory size must by aligned to multiple of "
+                     "%d bytes", TARGET_PAGE_SIZE);
+            exit(EXIT_FAILURE);
+        }
+
+        vms->hotplug_memory.base =
+                     ROUND_UP(vbi->memmap[VIRT_MEM].base + machine->ram_size,
+                                              ARCH_VIRT_HOTPLUG_MEM_ALIGN);
+
+        if ((vms->hotplug_memory.base + hotplug_mem_size) <
+            hotplug_mem_size) {
+            error_report("unsupported amount of maximum memory: " RAM_ADDR_FMT,
+                     machine->maxram_size);
+            exit(EXIT_FAILURE);
+        }
+
+        memory_region_init(&vms->hotplug_memory.mr, OBJECT(vms),
+                           "hotplug-memory", hotplug_mem_size);
+        memory_region_add_subregion(sysmem, vms->hotplug_memory.base,
+                                    &vms->hotplug_memory.mr);
+    }
+
     vbi->bootinfo.ram_size = machine->ram_size;
     vbi->bootinfo.kernel_filename = machine->kernel_filename;
     vbi->bootinfo.kernel_cmdline = machine->kernel_cmdline;
@@ -1448,9 +1485,75 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
     }
 }
 
+static void virt_dimm_plug(HotplugHandler *hotplug_dev,
+                         DeviceState *dev, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    PCDIMMDevice *dimm = PC_DIMM(dev);
+    PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
+    MemoryRegion *mr = ddc->get_memory_region(dimm);
+    Error *local_err = NULL;
+    uint64_t align = memory_region_get_alignment(mr);
+
+    pc_dimm_memory_plug(dev, &vms->hotplug_memory, mr, align, &local_err);
+    if (local_err) {
+        goto out;
+    }
+
+out:
+    error_propagate(errp, local_err);
+}
+
+static void virt_dimm_unplug(HotplugHandler *hotplug_dev,
+                           DeviceState *dev, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    PCDIMMDevice *dimm = PC_DIMM(dev);
+    PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
+    MemoryRegion *mr = ddc->get_memory_region(dimm);
+    Error *local_err = NULL;
+
+    pc_dimm_memory_unplug(dev, &vms->hotplug_memory, mr);
+    object_unparent(OBJECT(dev));
+
+    error_propagate(errp, local_err);
+}
+
+static void virt_machinedevice_plug_cb(HotplugHandler *hotplug_dev,
+                                      DeviceState *dev, Error **errp)
+{
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+        virt_dimm_plug(hotplug_dev, dev, errp);
+    } else {
+        error_setg(errp, "acpi: device plug request for not supported device"
+                   " type: %s", object_get_typename(OBJECT(dev)));
+    }
+}
+
+static void virt_machinedevice_unplug_cb(HotplugHandler *hotplug_dev,
+                                        DeviceState *dev, Error **errp)
+{
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+        virt_dimm_unplug(hotplug_dev, dev, errp);
+    } else {
+        error_setg(errp, "acpi: device unplug for not supported device"
+                   " type: %s", object_get_typename(OBJECT(dev)));
+    }
+}
+
+static HotplugHandler *virt_get_hotplug_handler(MachineState *machine,
+                                             DeviceState *dev)
+{
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+        return HOTPLUG_HANDLER(machine);
+    }
+    return NULL;
+}
+
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
     mc->init = machvirt_init;
     /* Start max_cpus at the maximum QEMU supports. We'll further restrict
@@ -1462,6 +1565,9 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
     mc->pci_allow_0_address = true;
+    mc->get_hotplug_handler = virt_get_hotplug_handler;
+    hc->plug = virt_machinedevice_plug_cb;
+    hc->unplug = virt_machinedevice_unplug_cb;
 }
 
 static const TypeInfo virt_machine_info = {
@@ -1471,6 +1577,10 @@ static const TypeInfo virt_machine_info = {
     .instance_size = sizeof(VirtMachineState),
     .class_size    = sizeof(VirtMachineClass),
     .class_init    = virt_machine_class_init,
+    .interfaces = (InterfaceInfo[]) {
+         { TYPE_HOTPLUG_HANDLER },
+         { }
+    },
 };
 
 static void machvirt_machine_init(void)
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 9650193..35aa3cc 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -45,6 +45,9 @@
 
 #define PPI(irq) ((irq) + 16)
 
+/* 1GB alignment for hotplug memory region */
+#define ARCH_VIRT_HOTPLUG_MEM_ALIGN (1ULL << 30)
+
 enum {
     VIRT_FLASH,
     VIRT_MEM,
-- 
2.5.0

