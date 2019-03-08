Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8274294wrx;
        Fri, 8 Mar 2019 03:52:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqzsjtPya53XyxQAvkM6mYBQ0eDLJKAztPhm0GJWnlgSpkh3e0LHFRLPC/oWkMJQLhg83kMt
X-Received: by 2002:a81:b8d:: with SMTP id 135mr14126615ywl.152.1552045925306;
        Fri, 08 Mar 2019 03:52:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552045925; cv=none;
        d=google.com; s=arc-20160816;
        b=sUG+rvNAIvY0ffvf0uB8H0Sj1F9QtVXtsvwlwdyukFRYzj8YbMTi4O9ObGA547TPz0
         gMqRmwL9NHCl8YLqP4T96V1aH+tD1pVRu19F9GZzM3GT2jqV/q3ZNC0b2pXjyhuQ3C4Z
         /WsfrKhcfBL3XeBj1cma+2FbodUzEqjgIoVO0L+Zm42L6QGSpjApYUbZ1rZzU1S/BZrA
         +PmBB6aBQXxUbB2cM8y/tcTLtlsVV8UbQcbmSWNSLiq2MNnC923VyM53bt/Y5c6EK7Q4
         rSFre0XnuprL5fHeVmm6W7fh7XX3FY5cWAAYrOejBUUp/TgZmoE0WwAa42iAmVQwvQ23
         uq+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=hv+iqiyS3uoxqJAmcplN19skS6J2mMqMen+o0Dp4TJU=;
        b=l03GF5EQ1uklaPuO6Kn3TNuWcJjIe0k4tRI+454fE8k69Nqci5Fbp22bFFeB+Zvr2D
         Qpmxveok+d7BpqpPXxk5WnuO3iWYMgDJnvffl2jvJErN1TN5/kQYsjkNnnPCF1cEVQwo
         e6ZNVb8qW8hp9vgdfexyVbK9U33FHjb87rO0IjJow2BRWt4FRIHVSpeBO7PvJ9eiKDoQ
         X8XbhGp4ps8mCDaCMBkeaDZaRP9tQmNrdkdtJDSYg+fk9VxajM8ppTFEXCAmcOPaq5Vm
         6ze96me94wxQNK+IiLo/MsL5q/gVLpPjFicrflUIpHayAJtxe/KwMqbuICaO0psMepDW
         mo2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11si4369272ywc.156.2019.03.08.03.52.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 03:52:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:41636 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2E2k-0005gM-Ov
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 06:52:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2Dvo-0008Q5-Ng
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:44:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2Dvl-0006oN-Mr
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:44:52 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:43868 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2Dvk-0006Ly-2E; Fri, 08 Mar 2019 06:44:48 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 59352DBA3A4E39A5D7AB;
	Fri,  8 Mar 2019 19:44:43 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server
	id 14.3.408.0; Fri, 8 Mar 2019 19:44:36 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>, <peter.maydell@linaro.org>,
	<shannon.zhaosl@gmail.com>, <sameo@linux.intel.com>,
	<sebastien.boeuf@intel.com>
Date: Fri, 8 Mar 2019 11:42:17 +0000
Message-ID: <20190308114218.26692-11-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v2 10/11] hw/arm/virt: Add GED device
 configuration and build aml
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
Cc: linuxarm@huawei.com, xuwei5@hisilicon.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tkURpDE+x7Kz

This initializes the GED device with base memory and irq.
It also configures ged memory hotplug event and builds the
corresponding aml code.

But ged irq routing to Guest is not enabled and thus hotplug
is not yet supported.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 default-configs/arm-softmmu.mak |  1 +
 hw/arm/virt-acpi-build.c        | 13 +++++++++++++
 hw/arm/virt-acpi.c              |  4 ++++
 hw/arm/virt.c                   | 22 ++++++++++++++++++++++
 include/hw/arm/virt.h           |  4 ++++
 5 files changed, 44 insertions(+)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index b3bac25..7c442fd 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -168,3 +168,4 @@ CONFIG_MUSICPAL=y
 CONFIG_MEM_DEVICE=y
 CONFIG_DIMM=y
 CONFIG_ACPI_MEMORY_HOTPLUG=y
+CONFIG_ACPI_HW_REDUCED=y
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6cb7263..86f25ad 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -50,6 +50,18 @@
 #define ARM_SPI_BASE 32
 #define ACPI_POWER_BUTTON_DEVICE "PWRB"
 
+static void acpi_dsdt_add_ged(Aml *scope, VirtMachineState *vms)
+{
+    int irq =  vms->irqmap[VIRT_ACPI_GED] + ARM_SPI_BASE;
+
+    if (!vms->ged_events || !vms->ged_events_size) {
+        return;
+    }
+
+    build_ged_aml(scope, "\\_SB."GED_DEVICE, irq, vms->ged_events,
+                  vms->ged_events_size, AML_SYSTEM_MEMORY);
+}
+
 static void acpi_dsdt_add_memory_hotplug(Aml *scope, MachineState *ms)
 {
     uint32_t nr_mem = ms->ram_slots;
@@ -758,6 +770,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
      */
     scope = aml_scope("\\_SB");
     acpi_dsdt_add_memory_hotplug(scope, MACHINE(vms));
+    acpi_dsdt_add_ged(scope, vms);
     acpi_dsdt_add_cpus(scope, vms->smp_cpus);
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
diff --git a/hw/arm/virt-acpi.c b/hw/arm/virt-acpi.c
index 18ebe94..3b55c63 100644
--- a/hw/arm/virt-acpi.c
+++ b/hw/arm/virt-acpi.c
@@ -31,6 +31,7 @@
 typedef struct VirtAcpiState {
     SysBusDevice parent_obj;
     MemHotplugState memhp_state;
+    GEDState ged_state;
 } VirtAcpiState;
 
 #define TYPE_VIRT_ACPI "virt-acpi"
@@ -76,12 +77,15 @@ static void virt_device_realize(DeviceState *dev, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(qdev_get_machine());
     const MemMapEntry *memmap = vms->memmap;
+    const int *irqmap = vms->irqmap;
     VirtAcpiState *s = VIRT_ACPI(dev);
 
     if (s->memhp_state.is_enabled) {
         acpi_memory_hotplug_init(get_system_memory(), OBJECT(dev),
                                  &s->memhp_state,
                                  memmap[VIRT_PCDIMM_ACPI].base);
+        acpi_ged_init(get_system_memory(), OBJECT(dev), &s->ged_state,
+                      memmap[VIRT_ACPI_GED].base, irqmap[VIRT_ACPI_GED]);
     }
 }
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9427f4f..352dbb1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -134,6 +134,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
     [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
     [VIRT_PCDIMM_ACPI] =        { 0x09070000, 0x00010000 },
+    [VIRT_ACPI_GED] =           { 0x09080000, 0x00010000 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -169,6 +170,7 @@ static const int a15irqmap[] = {
     [VIRT_PCIE] = 3, /* ... to 6 */
     [VIRT_GPIO] = 7,
     [VIRT_SECURE_UART] = 8,
+    [VIRT_ACPI_GED] = 9,
     [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
     [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
     [VIRT_SMMU] = 74,    /* ...to 74 + NUM_SMMU_IRQS - 1 */
@@ -184,6 +186,25 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("max"),
 };
 
+static void virt_acpi_ged_conf(VirtMachineState *vms)
+{
+    uint8_t events_size;
+
+    /* GED events */
+    GedEvent events[] = {
+        {
+            .selector = ACPI_GED_IRQ_SEL_MEM,
+            .event    = GED_MEMORY_HOTPLUG,
+        },
+    };
+
+    events_size = ARRAY_SIZE(events);
+
+    vms->ged_events = g_malloc0(events_size * sizeof(GedEvent));
+    memcpy(vms->ged_events, events, events_size * sizeof(GedEvent));
+    vms->ged_events_size = events_size;
+}
+
 static bool cpu_type_valid(const char *cpu)
 {
     int i;
@@ -1650,6 +1671,7 @@ static void machvirt_init(MachineState *machine)
     create_platform_bus(vms, pic);
 
     vms->acpi = virt_acpi_init();
+    virt_acpi_ged_conf(vms);
 
     vms->bootinfo.ram_size = machine->ram_size;
     vms->bootinfo.kernel_filename = machine->kernel_filename;
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index e46a051..49fda81 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -37,6 +37,7 @@
 #include "hw/arm/arm.h"
 #include "sysemu/kvm.h"
 #include "hw/intc/arm_gicv3_common.h"
+#include "hw/acpi/ged.h"
 
 #define NUM_GICV2M_SPIS       64
 #define NUM_VIRTIO_TRANSPORTS 32
@@ -78,6 +79,7 @@ enum {
     VIRT_SECURE_UART,
     VIRT_SECURE_MEM,
     VIRT_PCDIMM_ACPI,
+    VIRT_ACPI_GED,
     VIRT_LOWMEMMAP_LAST,
 };
 
@@ -134,6 +136,8 @@ typedef struct {
     int psci_conduit;
     hwaddr highest_gpa;
     DeviceState *acpi;
+    GedEvent *ged_events;
+    uint32_t ged_events_size;
 } VirtMachineState;
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
-- 
2.7.4


