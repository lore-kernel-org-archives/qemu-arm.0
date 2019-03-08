Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8273651wrx;
        Fri, 8 Mar 2019 03:51:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqxhfPMD6v84r844/m5qjweanrTfpekCzzWhtPMxMYUxS90w9xurKtpRVM3hAMkFGsfw2qBj
X-Received: by 2002:a25:df4f:: with SMTP id w76mr15504800ybg.207.1552045875642;
        Fri, 08 Mar 2019 03:51:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552045875; cv=none;
        d=google.com; s=arc-20160816;
        b=zD/aFIXefnUlelv1uf1dR0iVDJ0YMFpSFsfdNbZIpq2Kt+8mNmTekdCdP+k4DohNX1
         UPzQcRJ5rgqdHgxfb3+h5GCxsXVqiR8J6My4yqgDnJTK8/CGKq6EhepcjqG+JBosLTYe
         PNDk6uti9bL5VsfAOkSwXYRoLh7s75B7U+kgngAPEXpLAw1/7CFlghyHlWMCnYWR8n9G
         ebyqtnaaqs94IZwDrvwA/Z9qdvkDaE7xMvsNQG6EQrvmcAb5swYECORdvJ+WHkX9XTPg
         XVsvF0bDB7XsmaWXM3gBgLSG9d5ZPPazO7Xg1cgCQCN6q+qsOeSITKUQfNqj3z5yUJmd
         IyxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=DXrWh5PMUqSTXTZKraLbC3wLy1APb2RLXFBR2sOIuW4=;
        b=KA/ySA0Y5nM/BB3jB3gN+yIPJUDyKpAdFMz484LbEQmzce71vte++ZX9ty5orKMx7K
         dUDa0W14Qxc2TQO0GkwMRI4GNy698i3d/lKn1WIg/QkurD1yTo/xG+x685K3ENzgGCzA
         gCTCliJ3xeI1Ic6Rc7hyRP8RWFpI48a5jW14AqiFJiLcPsnSaVmWYve+XmmzITKX/SQI
         9LAgXhEkO9KYc+iaK3QZgD3SqHUiTgHXkvIF8fXSotFI/c9XHhyAweGGeG4r5ZFDvzj+
         mgiH6Lyt6vDpKHFOzLgYVzF1QzsRgxws9Uqv6Iz4yxDPKNY1d8+kUMq6JuTKHdBACayr
         scFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l137si4304316ywc.61.2019.03.08.03.51.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 03:51:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:41620 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2E1w-0004uq-34
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 06:51:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2Dvb-0008Ch-4l
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:44:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2DvX-0005b8-WE
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:44:38 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:43510 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2DvX-0005Qp-Ib; Fri, 08 Mar 2019 06:44:35 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 3C91F3B6384287646624;
	Fri,  8 Mar 2019 19:44:33 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server
	id 14.3.408.0; Fri, 8 Mar 2019 19:44:23 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>, <peter.maydell@linaro.org>,
	<shannon.zhaosl@gmail.com>, <sameo@linux.intel.com>,
	<sebastien.boeuf@intel.com>
Date: Fri, 8 Mar 2019 11:42:13 +0000
Message-ID: <20190308114218.26692-7-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v2 06/11] hw/arm/virt: Add ACPI support for
 device memory cold-plug
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
X-TUID: cKEFjsZwJ7q7

This adds support to build the aml code so that Guest can see the
cold-plugged device memory.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 default-configs/arm-softmmu.mak |  1 +
 hw/arm/virt-acpi-build.c        |  9 +++++++++
 hw/arm/virt-acpi.c              | 23 +++++++++++++++++++++++
 hw/arm/virt.c                   | 11 +++++++++++
 include/hw/arm/virt.h           |  2 ++
 5 files changed, 46 insertions(+)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index fbc4564..b3bac25 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -167,3 +167,4 @@ CONFIG_HIGHBANK=y
 CONFIG_MUSICPAL=y
 CONFIG_MEM_DEVICE=y
 CONFIG_DIMM=y
+CONFIG_ACPI_MEMORY_HOTPLUG=y
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index d7e2e48..87d66da 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -40,6 +40,7 @@
 #include "hw/loader.h"
 #include "hw/hw.h"
 #include "hw/acpi/aml-build.h"
+#include "hw/acpi/memory_hotplug.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/arm/virt.h"
@@ -49,6 +50,13 @@
 #define ARM_SPI_BASE 32
 #define ACPI_POWER_BUTTON_DEVICE "PWRB"
 
+static void acpi_dsdt_add_memory_hotplug(Aml *scope, MachineState *ms)
+{
+    uint32_t nr_mem = ms->ram_slots;
+
+    build_memory_hotplug_aml(scope, nr_mem, "\\_SB", NULL, AML_SYSTEM_MEMORY);
+}
+
 static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
 {
     uint16_t i;
@@ -740,6 +748,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
      * the RTC ACPI device at all when using UEFI.
      */
     scope = aml_scope("\\_SB");
+    acpi_dsdt_add_memory_hotplug(scope, MACHINE(vms));
     acpi_dsdt_add_cpus(scope, vms->smp_cpus);
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
diff --git a/hw/arm/virt-acpi.c b/hw/arm/virt-acpi.c
index df8a02b..18ebe94 100644
--- a/hw/arm/virt-acpi.c
+++ b/hw/arm/virt-acpi.c
@@ -26,9 +26,11 @@
 #include "hw/arm/virt.h"
 
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/memory_hotplug.h"
 
 typedef struct VirtAcpiState {
     SysBusDevice parent_obj;
+    MemHotplugState memhp_state;
 } VirtAcpiState;
 
 #define TYPE_VIRT_ACPI "virt-acpi"
@@ -44,6 +46,16 @@ static const VMStateDescription vmstate_acpi = {
 static void virt_device_plug_cb(HotplugHandler *hotplug_dev,
                                 DeviceState *dev, Error **errp)
 {
+    VirtAcpiState *s = VIRT_ACPI(hotplug_dev);
+
+    if (s->memhp_state.is_enabled &&
+        object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+            acpi_memory_plug_cb(hotplug_dev, &s->memhp_state,
+                                dev, errp);
+    } else {
+        error_setg(errp, "virt: device plug request for unsupported device"
+                   " type: %s", object_get_typename(OBJECT(dev)));
+    }
 }
 
 static void virt_device_unplug_request_cb(HotplugHandler *hotplug_dev,
@@ -62,6 +74,15 @@ static void virt_send_ged(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 
 static void virt_device_realize(DeviceState *dev, Error **errp)
 {
+    VirtMachineState *vms = VIRT_MACHINE(qdev_get_machine());
+    const MemMapEntry *memmap = vms->memmap;
+    VirtAcpiState *s = VIRT_ACPI(dev);
+
+    if (s->memhp_state.is_enabled) {
+        acpi_memory_hotplug_init(get_system_memory(), OBJECT(dev),
+                                 &s->memhp_state,
+                                 memmap[VIRT_PCDIMM_ACPI].base);
+    }
 }
 
 DeviceState *virt_acpi_init(void)
@@ -70,6 +91,8 @@ DeviceState *virt_acpi_init(void)
 }
 
 static Property virt_acpi_properties[] = {
+    DEFINE_PROP_BOOL("memory-hotplug-support", VirtAcpiState,
+                     memhp_state.is_enabled, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 40a1273..9427f4f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -133,6 +133,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
     [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
+    [VIRT_PCDIMM_ACPI] =        { 0x09070000, 0x00010000 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -1648,6 +1649,8 @@ static void machvirt_init(MachineState *machine)
 
     create_platform_bus(vms, pic);
 
+    vms->acpi = virt_acpi_init();
+
     vms->bootinfo.ram_size = machine->ram_size;
     vms->bootinfo.kernel_filename = machine->kernel_filename;
     vms->bootinfo.kernel_cmdline = machine->kernel_cmdline;
@@ -1832,11 +1835,19 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
 static void virt_memory_plug(HotplugHandler *hotplug_dev,
                              DeviceState *dev, Error **errp)
 {
+    HotplugHandlerClass *hhc;
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
     Error *local_err = NULL;
 
     pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), &local_err);
+    if (local_err) {
+        goto out;
+    }
+
+    hhc = HOTPLUG_HANDLER_GET_CLASS(vms->acpi);
+    hhc->plug(HOTPLUG_HANDLER(vms->acpi), dev, &error_abort);
 
+out:
     error_propagate(errp, local_err);
 }
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 6076167..e46a051 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -77,6 +77,7 @@ enum {
     VIRT_GPIO,
     VIRT_SECURE_UART,
     VIRT_SECURE_MEM,
+    VIRT_PCDIMM_ACPI,
     VIRT_LOWMEMMAP_LAST,
 };
 
@@ -132,6 +133,7 @@ typedef struct {
     uint32_t iommu_phandle;
     int psci_conduit;
     hwaddr highest_gpa;
+    DeviceState *acpi;
 } VirtMachineState;
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
-- 
2.7.4


