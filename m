Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp94107wrx;
        Thu, 21 Mar 2019 03:51:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw5qNzT76W+M7enPRyKqwv3Ln/SFOp3vz4A0tNUPZpl/PqJ7EBDR9nJ3Td/PL6C5dUZD0fV
X-Received: by 2002:a1c:6588:: with SMTP id z130mr2104059wmb.39.1553165507577;
        Thu, 21 Mar 2019 03:51:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553165507; cv=none;
        d=google.com; s=arc-20160816;
        b=ZuKgFkj/mLqktZNulwTt7Qh9EcxJy83hkJCeu9wOuR/Y1CafzyDUGw3/Sc9sB7IKu1
         4zLtuE2twHq7iOZlRoNqsAOtZtSCggT/46yLV4FU5Ee+NeqbjqXfAiKzt2hDprJxTkdM
         fytp87IZ1hXmpOS1CW/U0xJpu21n6bsK2OxgEAUXuHyIO7/HQQscIGDwBxyLsROHGOVc
         fXihtD3HkRf8KSmnG6g3vznBd/999/6E8paTQu8uFpN3/hTpmXIRTAK4GfwAmAvc9KcU
         cTRJiO1xUmLkUFX1CW63m1XqL0sA7myPjGWM6f7HJMIxEbjMNJx2XqXHNg2FNAWM1xMg
         kMUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=T/Q6MmbhocyMMOA5IHbrtSV35RsnEDOVPA5pXAO8Kxg=;
        b=NTj3BYGVupKT2QvnejgtRcQwsON28qFaSZFezEVlWGDQ9mcQgc/HBrn4dRmzAe7zPA
         obfHLb4qG8vqS0xeY4WLCHIza7vPPNydeNY8WGn+lOVLWNLvg6SwLqOAH6HgkF8mZaoh
         Srbe2o0osapaTtFElbJQC8+xEYaDCpWoLlVNTsF72HlwvWGTh7IN+Hf6UaQCkQGIKX47
         RT3MxfYitxLQCtU9xADXsGr8KSb6mb61OupMpuET2FnGwVyVTx7SeMz7fEK0AFfByvKI
         7oJ0PW3+sXsGNaUlzrh2nPkymMNI24pSzxEjkUsPZjmQH0MiPYqK0rbBadkbMT1DLA7c
         /noA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14si3323046wmj.156.2019.03.21.03.51.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Mar 2019 03:51:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:34691 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h6vIY-0004Pz-EN
	for alex.bennee@linaro.org; Thu, 21 Mar 2019 06:51:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vHR-0004Og-Dr
	for qemu-devel@nongnu.org; Thu, 21 Mar 2019 06:50:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vGE-0003cV-Q9
	for qemu-devel@nongnu.org; Thu, 21 Mar 2019 06:49:24 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2198 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vGC-0003RE-9s; Thu, 21 Mar 2019 06:49:21 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id DF16CF2C21D2748F327F;
	Thu, 21 Mar 2019 18:49:17 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.408.0; Thu, 21 Mar 2019 18:49:10 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>, <peter.maydell@linaro.org>,
	<shannon.zhaosl@gmail.com>, <sameo@linux.intel.com>,
	<sebastien.boeuf@intel.com>
Date: Thu, 21 Mar 2019 10:47:45 +0000
Message-ID: <20190321104745.28068-11-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-devel] [PATCH v3 10/10] hw/arm/virt: Init GED device and
 enable memory hotplug
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
Cc: linuxarm@huawei.com, xuwei5@hisilicon.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5ZccpvHR8Gy7

This initializes the GED device with base memory and irq,
configures ged memory hotplug event and builds the
corresponding aml code.

GED irq routing to Guest is also enabled. Memory hotplug
should now work.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/acpi/generic_event_device.c | 18 ++++++++++++++++++
 hw/arm/virt-acpi-build.c       |  9 +++++++++
 hw/arm/virt.c                  | 30 +++++++++++++++++++++++++-----
 include/hw/arm/virt.h          |  2 ++
 4 files changed, 54 insertions(+), 5 deletions(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 9deaa33..02d5e66 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -200,6 +200,23 @@ static void acpi_ged_event(GEDState *ged_st, uint32_t ged_irq_sel)
     qemu_irq_pulse(ged_st->gsi[ged_st->irq]);
 }
 
+static void acpi_ged_init(MemoryRegion *as, DeviceState *dev, GEDState *ged_st)
+{
+    VirtAcpiState *s = VIRT_ACPI(dev);
+
+    assert(!ged_io_base && !ged_events && !ged_events_size);
+
+    ged_io_base = s->ged_base;
+    ged_events = s->ged_events;
+    ged_events_size = s->ged_events_size;
+    ged_st->irq = s->ged_irq;
+    ged_st->gsi = s->gsi;
+    qemu_mutex_init(&ged_st->lock);
+    memory_region_init_io(&ged_st->io, OBJECT(dev), &ged_ops, ged_st,
+                          "acpi-ged-event", ACPI_GED_REG_LEN);
+    memory_region_add_subregion(as, ged_io_base, &ged_st->io);
+}
+
 static void virt_device_plug_cb(HotplugHandler *hotplug_dev,
                                 DeviceState *dev, Error **errp)
 {
@@ -242,6 +259,7 @@ static void virt_device_realize(DeviceState *dev, Error **errp)
         acpi_memory_hotplug_init(get_system_memory(), OBJECT(dev),
                                  &s->memhp_state,
                                  s->memhp_base);
+        acpi_ged_init(get_system_memory(), dev, &s->ged_state);
     }
 }
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 1887531..116e9c9 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -41,6 +41,7 @@
 #include "hw/hw.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/memory_hotplug.h"
+#include "hw/acpi/generic_event_device.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/arm/virt.h"
@@ -50,6 +51,13 @@
 #define ARM_SPI_BASE 32
 #define ACPI_POWER_BUTTON_DEVICE "PWRB"
 
+static void acpi_dsdt_add_ged(Aml *scope, VirtMachineState *vms)
+{
+    int irq =  vms->irqmap[VIRT_ACPI_GED] + ARM_SPI_BASE;
+
+    build_ged_aml(scope, "\\_SB."GED_DEVICE, irq, AML_SYSTEM_MEMORY);
+}
+
 static void acpi_dsdt_add_memory_hotplug(Aml *scope, MachineState *ms)
 {
     uint32_t nr_mem = ms->ram_slots;
@@ -758,6 +766,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
      */
     scope = aml_scope("\\_SB");
     acpi_dsdt_add_memory_hotplug(scope, MACHINE(vms));
+    acpi_dsdt_add_ged(scope, vms);
     acpi_dsdt_add_cpus(scope, vms->smp_cpus);
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b602151..e3f8aa7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -63,6 +63,7 @@
 #include "target/arm/internals.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
+#include "hw/acpi/generic_event_device.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -134,6 +135,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
     [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
     [VIRT_PCDIMM_ACPI] =        { 0x09070000, 0x00010000 },
+    [VIRT_ACPI_GED] =           { 0x09080000, 0x00010000 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -169,6 +171,7 @@ static const int a15irqmap[] = {
     [VIRT_PCIE] = 3, /* ... to 6 */
     [VIRT_GPIO] = 7,
     [VIRT_SECURE_UART] = 8,
+    [VIRT_ACPI_GED] = 9,
     [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
     [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
     [VIRT_SMMU] = 74,    /* ...to 74 + NUM_SMMU_IRQS - 1 */
@@ -184,6 +187,13 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("max"),
 };
 
+static GedEvent ged_events[] = {
+    {
+        .selector = ACPI_GED_IRQ_SEL_MEM,
+        .event    = GED_MEMORY_HOTPLUG,
+    },
+};
+
 static bool cpu_type_valid(const char *cpu)
 {
     int i;
@@ -524,6 +534,11 @@ static DeviceState *create_virt_acpi(VirtMachineState *vms)
     dev = qdev_create(NULL, "virt-acpi");
     qdev_prop_set_uint64(dev, "memhp_base",
                          vms->memmap[VIRT_PCDIMM_ACPI].base);
+    qdev_prop_set_ptr(dev, "gsi", vms->gsi);
+    qdev_prop_set_uint64(dev, "ged_base", vms->memmap[VIRT_ACPI_GED].base);
+    qdev_prop_set_uint32(dev, "ged_irq", vms->irqmap[VIRT_ACPI_GED]);
+    qdev_prop_set_ptr(dev, "ged_events", ged_events);
+    qdev_prop_set_uint32(dev, "ged_events_size", ARRAY_SIZE(ged_events));
     qdev_init_nofail(dev);
 
     return dev;
@@ -568,6 +583,12 @@ static void create_v2m(VirtMachineState *vms, qemu_irq *pic)
     fdt_add_v2m_gic_node(vms);
 }
 
+static void virt_gsi_handler(void *opaque, int n, int level)
+{
+    qemu_irq *gic_irq = opaque;
+    qemu_set_irq(gic_irq[n], level);
+}
+
 static void create_gic(VirtMachineState *vms, qemu_irq *pic)
 {
     /* We create a standalone GIC */
@@ -683,6 +704,8 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
         pic[i] = qdev_get_gpio_in(gicdev, i);
     }
 
+    vms->gsi = qemu_allocate_irqs(virt_gsi_handler, pic, NUM_IRQS);
+
     fdt_add_gic_node(vms);
 
     if (type == 3 && vms->its) {
@@ -1431,7 +1454,7 @@ static void machvirt_init(MachineState *machine)
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(machine);
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     const CPUArchIdList *possible_cpus;
-    qemu_irq pic[NUM_IRQS];
+    qemu_irq *pic;
     MemoryRegion *sysmem = get_system_memory();
     MemoryRegion *secure_sysmem = NULL;
     int n, virt_max_cpus;
@@ -1627,6 +1650,7 @@ static void machvirt_init(MachineState *machine)
 
     create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
 
+    pic = g_new0(qemu_irq, NUM_IRQS);
     create_gic(vms, pic);
 
     fdt_add_pmu_nodes(vms);
@@ -1842,10 +1866,6 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
 {
     const bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
 
-    if (dev->hotplugged) {
-        error_setg(errp, "memory hotplug is not supported");
-    }
-
     if (is_nvdimm) {
         error_setg(errp, "nvdimm is not yet supported");
         return;
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 14b2e0a..850296a 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -78,6 +78,7 @@ enum {
     VIRT_SECURE_UART,
     VIRT_SECURE_MEM,
     VIRT_PCDIMM_ACPI,
+    VIRT_ACPI_GED,
     VIRT_LOWMEMMAP_LAST,
 };
 
@@ -135,6 +136,7 @@ typedef struct {
     int psci_conduit;
     hwaddr highest_gpa;
     DeviceState *acpi;
+    qemu_irq *gsi;
 } VirtMachineState;
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
-- 
2.7.4


