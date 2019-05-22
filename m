Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp656414wrg;
        Wed, 22 May 2019 09:27:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz58W3WkmsNOP9+6/SQ/d5r8CpNG/DaXJDRLqBmXP95Hb0Vfn0kxO7jvrzkARFj5dyACiSP
X-Received: by 2002:a50:9958:: with SMTP id l24mr91526908edb.92.1558542465297;
        Wed, 22 May 2019 09:27:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558542465; cv=none;
        d=google.com; s=arc-20160816;
        b=Ns88axxBXpQZZdEDNns8NlZgE+MnfK2QT/m6H5/bAGwwEZdcrdJ9VkYQpQSlE0QVgr
         hAj8raH28dL5Tou354gDVhBOMZdIMxjmsYILAHG+sb9DnBcC523SGvmMywPlMGKm5asi
         +192MKD3qEm2mRtIABU7r0iGExiHpcfBix6UVMZ80sPKCdDGjdJWgzvFCyQqfOsCjkws
         QEEnRAh96cqPoiyNpjvlqt5Z73YOQSYstFerhYm3KUHSVpF4jACKHbA2HjkWHl1Vu09z
         bjN3bbV9ugvmdzPCwKFU0esKthK5RIqbBsqPjC+sVUErmMUaK3G8Mmtnjf4aIhR2muuH
         HstA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=K+pYikhwfKxwgEZBT62k6t8KcS7/ujPAtrFa0VEVEoo=;
        b=Kk0W5p1mqZFApVhWHc/Q+gaaEshWikeHnPrOdRhbpPX0qPb+njh1Td5r5UeZwXLyMl
         fG+vI0r/KvoptrFeLoZDs4Cx1+KaBGT/u+v2hDuo64wNjKiOyCIAyF1D7vQSEtqjrmld
         CIir/qWOht5HTfmD365qVF+4yBSe5LxowdgZOdApvBJISewuQUBmch2p4pPPnhzUmbuF
         eI8m+2i+MpSDb59n1U0oWpDG6umBp6Xys4b7f8cWVjnCpc7O0l6h4yxG06z48b+v0cYv
         SkgWkT7BRbLjiptDyCMM8YLIaCLEpgMEYQDMobIxpbuiDmoGQeW6MntaKKz4UuEai+ED
         QF4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si3477300edz.371.2019.05.22.09.27.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 May 2019 09:27:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:47548 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hTU5g-0000Rj-7g
	for alex.bennee@linaro.org; Wed, 22 May 2019 12:27:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hTU39-0006cU-Ny
	for qemu-arm@nongnu.org; Wed, 22 May 2019 12:25:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hTU38-00026J-8E
	for qemu-arm@nongnu.org; Wed, 22 May 2019 12:25:07 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2221 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hTU37-00021K-M7; Wed, 22 May 2019 12:25:06 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id ED8BB931B80DBFD8117F;
	Thu, 23 May 2019 00:25:02 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.439.0; Thu, 23 May 2019 00:24:14 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>
Date: Wed, 22 May 2019 17:22:49 +0100
Message-ID: <20190522162252.28568-6-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190522162252.28568-1-shameerali.kolothum.thodi@huawei.com>
References: <20190522162252.28568-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH v5 5/8] hw/arm/virt: Enable device memory
 cold/hot plug with ACPI boot
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
	linuxarm@huawei.com, xuwei5@hisilicon.com,
	shannon.zhaosl@gmail.com, sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I7PYO56B7AWu

This initializes the GED device with base memory and irq, configures
ged memory hotplug event and builds the corresponding aml code. With
this, both hot and cold plug of device memory is enabled now for Guest
with ACPI boot.

Memory cold plug support with Guest DT boot is not yet supported.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
v4-->v5

 -Removed gsi/ged-irq routing instead set irq directly.
 -Create GED only for ACPI case.

---
 hw/arm/Kconfig           |  2 ++
 hw/arm/virt-acpi-build.c | 14 ++++++++++++
 hw/arm/virt.c            | 48 ++++++++++++++++++++++++++++++++++------
 include/hw/arm/virt.h    |  3 +++
 4 files changed, 60 insertions(+), 7 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 6ef22439b5..4bb498d093 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -21,6 +21,8 @@ config ARM_VIRT
     select VIRTIO_MMIO
     select MEM_DEVICE
     select DIMM
+    select ACPI_MEMORY_HOTPLUG
+    select ACPI_HW_REDUCED
 
 config CHEETAH
     bool
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index bf9c0bc2f4..5abab6dfcd 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -40,6 +40,8 @@
 #include "hw/loader.h"
 #include "hw/hw.h"
 #include "hw/acpi/aml-build.h"
+#include "hw/acpi/memory_hotplug.h"
+#include "hw/acpi/generic_event_device.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/arm/virt.h"
@@ -727,6 +729,7 @@ static void
 build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
     Aml *scope, *dsdt;
+    MachineState *ms = MACHINE(vms);
     const MemMapEntry *memmap = vms->memmap;
     const int *irqmap = vms->irqmap;
 
@@ -751,6 +754,17 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                       vms->highmem, vms->highmem_ecam);
     acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
                        (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
+    if (vms->acpi_dev) {
+        build_ged_aml(scope, "\\_SB."GED_DEVICE,
+                      HOTPLUG_HANDLER(vms->acpi_dev),
+                      irqmap[VIRT_ACPI_GED] + ARM_SPI_BASE, AML_SYSTEM_MEMORY);
+    }
+
+    if (vms->acpi_dev && ms->ram_slots) {
+        build_memory_hotplug_aml(scope, ms->ram_slots, "\\_SB", NULL,
+                                 AML_SYSTEM_MEMORY);
+    }
+
     acpi_dsdt_add_power_button(scope);
 
     aml_append(dsdt, scope);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3df8c389ff..8dfd7537b9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -64,6 +64,7 @@
 #include "target/arm/internals.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
+#include "hw/acpi/generic_event_device.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -134,6 +135,8 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
     [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
+    [VIRT_PCDIMM_ACPI] =        { 0x09070000, MEMORY_HOTPLUG_IO_LEN },
+    [VIRT_ACPI_GED] =           { 0x09080000, ACPI_GED_REG_LEN },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -169,6 +172,7 @@ static const int a15irqmap[] = {
     [VIRT_PCIE] = 3, /* ... to 6 */
     [VIRT_GPIO] = 7,
     [VIRT_SECURE_UART] = 8,
+    [VIRT_ACPI_GED] = 9,
     [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
     [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
     [VIRT_SMMU] = 74,    /* ...to 74 + NUM_SMMU_IRQS - 1 */
@@ -517,6 +521,25 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
     }
 }
 
+static inline DeviceState *create_acpi_ged(VirtMachineState *vms, qemu_irq *pic)
+{
+    DeviceState *dev;
+    int irq = vms->irqmap[VIRT_ACPI_GED];
+    uint32_t event = ACPI_GED_MEM_HOTPLUG_EVT;
+
+    dev = DEVICE(object_new(TYPE_ACPI_GED));
+    qdev_prop_set_uint64(dev, "memhp-base",
+                         vms->memmap[VIRT_PCDIMM_ACPI].base);
+    qdev_prop_set_uint64(dev, "ged-base", vms->memmap[VIRT_ACPI_GED].base);
+    qdev_prop_set_uint32(dev, "ged-event", event);
+    object_property_add_child(qdev_get_machine(), "acpi-ged",
+                              OBJECT(dev), NULL);
+    qdev_init_nofail(dev);
+    qdev_connect_gpio_out_named(dev, "ged-irq", 0, pic[irq]);
+
+    return dev;
+}
+
 static void create_its(VirtMachineState *vms, DeviceState *gicdev)
 {
     const char *itsclass = its_class_name();
@@ -1689,6 +1712,10 @@ static void machvirt_init(MachineState *machine)
 
     create_gpio(vms, pic);
 
+    if (aarch64 && firmware_loaded && acpi_enabled) {
+        vms->acpi_dev = create_acpi_ged(vms, pic);
+    }
+
     /* Create mmio transports, so the user can create virtio backends
      * (which will be automatically plugged in to the transports). If
      * no backend is created the transport will just sit harmlessly idle.
@@ -1867,27 +1894,34 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
 static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
                                  Error **errp)
 {
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    const bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
 
-    /*
-     * The device memory is not yet exposed to the Guest either through
-     * DT or ACPI and hence both cold/hot plug of memory is explicitly
-     * disabled for now.
-     */
-    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
-        error_setg(errp, "memory cold/hot plug is not yet supported");
+    if (is_nvdimm) {
+        error_setg(errp, "nvdimm is not yet supported");
         return;
     }
 
+    if (!vms->acpi_dev) {
+        error_setg(errp, "memory hotplug is not enabled: missing acpi device");
+        return;
+    }
+
+    hotplug_handler_pre_plug(HOTPLUG_HANDLER(vms->acpi_dev), dev, errp);
+
     pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), NULL, errp);
 }
 
 static void virt_memory_plug(HotplugHandler *hotplug_dev,
                              DeviceState *dev, Error **errp)
 {
+    HotplugHandlerClass *hhc;
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
 
     pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), NULL);
 
+    hhc = HOTPLUG_HANDLER_GET_CLASS(vms->acpi_dev);
+    hhc->plug(HOTPLUG_HANDLER(vms->acpi_dev), dev, NULL);
 }
 
 static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 424070924e..f004c5cf72 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -78,6 +78,8 @@ enum {
     VIRT_GPIO,
     VIRT_SECURE_UART,
     VIRT_SECURE_MEM,
+    VIRT_PCDIMM_ACPI,
+    VIRT_ACPI_GED,
     VIRT_LOWMEMMAP_LAST,
 };
 
@@ -134,6 +136,7 @@ typedef struct {
     uint32_t iommu_phandle;
     int psci_conduit;
     hwaddr highest_gpa;
+    DeviceState *acpi_dev;
 } VirtMachineState;
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
-- 
2.17.1


