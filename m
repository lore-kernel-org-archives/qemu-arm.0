Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp96480wrx;
        Thu, 21 Mar 2019 03:54:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxwkyCSRcDua7LttlyZBbBgNHs2Zb1VbfdyxHj3diV1sFg/ZnuE2Gz2n3Ab7/cM2zSbXf5z
X-Received: by 2002:a5d:6207:: with SMTP id y7mr2023550wru.60.1553165695768;
        Thu, 21 Mar 2019 03:54:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553165695; cv=none;
        d=google.com; s=arc-20160816;
        b=ck6aBh9jc43MPgrgmjVB63spA20Ctx1X4Jt1lmYPPOQy9PFZ9tbj6SKVtn1SMr/vhM
         vsYUZd512B51YHoWX+6xNRauz677fop4xbMQRc80+uipEXmYeogHKaHtukCPmFUHFKnK
         3BxawsIPgob10sT2mF0EqXMlmjd0mlmlBpYdy2GK3rCgyYinIAhVswO/RIzl59tTYGeb
         cKQYaXVMvNFPw8ZebKHjzIwHS4npYYAuf5jpSuBwokqqmz5cVZ8SPblJwrHMMKvWSb19
         zGGR087V6T1KVoFHJTImcoF9Dy6XFku52fygBNqx2es1B8aPHfA5332Dw2cptlZepWRx
         mEPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=rNaKglMkcF4skH1kUzQ5t1KWZGao2MePD68QU3jXw6A=;
        b=i37ypTL87SR+/HONuj8PE++rTRVbZKcMf8FdVwVd1gUT0iAT0rKAM8KxcGS8nzP+Qq
         INr0LAEDKIpn+iIBokERA8oIuBXbod5Xge6ZEbvdsoaI1JogDpMilzoTtmopFLyZy2FL
         NyArrVeKM/YyKqVi9nn0ebbXTEKvxLtvbP8GttgaSH6HQ5klqWwoE8S7uuRKdI3BArbr
         ocNOhtYUuQ+fw943vo0XYzFFJ0rN0ou3fqckH4EukYSDPNJ76kf2rx4Ua1UFomjxs5+t
         LFAcDEdM5+RaOaVqEKYoi8xcxL1oiBmn5lTv/P2mj5yu66N5SndrDR2gq9gVwjhuZKnY
         VQvw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12si3033699wrr.91.2019.03.21.03.54.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Mar 2019 03:54:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:34739 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h6vLa-0007Qv-Oi
	for alex.bennee@linaro.org; Thu, 21 Mar 2019 06:54:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vHd-0004Td-KL
	for qemu-devel@nongnu.org; Thu, 21 Mar 2019 06:50:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vG0-0002Ro-8D
	for qemu-devel@nongnu.org; Thu, 21 Mar 2019 06:49:09 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:51940 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vFx-0001um-QZ; Thu, 21 Mar 2019 06:49:06 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id A9C4A21494CB64D25712;
	Thu, 21 Mar 2019 18:49:02 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.408.0; Thu, 21 Mar 2019 18:48:53 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>, <peter.maydell@linaro.org>,
	<shannon.zhaosl@gmail.com>, <sameo@linux.intel.com>,
	<sebastien.boeuf@intel.com>
Date: Thu, 21 Mar 2019 10:47:40 +0000
Message-ID: <20190321104745.28068-6-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: [Qemu-devel] [PATCH v3 05/10] hw/arm/virt: Add ACPI support for
 device memory cold-plug
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
X-TUID: siFvzr5hQZvF

This adds support to build the aml code so that Guest(ACPI boot)
can see the cold-plugged device memory. Memory cold plug support
with DT boot is not yet enabled.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 default-configs/arm-softmmu.mak        |  2 ++
 hw/acpi/generic_event_device.c         | 23 +++++++++++++++++++++++
 hw/arm/virt-acpi-build.c               |  9 +++++++++
 hw/arm/virt.c                          | 23 +++++++++++++++++++++++
 include/hw/acpi/generic_event_device.h |  5 +++++
 include/hw/arm/virt.h                  |  2 ++
 6 files changed, 64 insertions(+)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 795cb89..6db444e 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -162,3 +162,5 @@ CONFIG_LSI_SCSI_PCI=y
 
 CONFIG_MEM_DEVICE=y
 CONFIG_DIMM=y
+CONFIG_ACPI_MEMORY_HOTPLUG=y
+CONFIG_ACPI_HW_REDUCED=y
diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index b21a551..0b32fc9 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -16,13 +16,26 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "exec/address-spaces.h"
 #include "hw/sysbus.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/generic_event_device.h"
+#include "hw/mem/pc-dimm.h"
 
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
 
 static void virt_send_ged(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
@@ -31,9 +44,19 @@ static void virt_send_ged(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 
 static void virt_device_realize(DeviceState *dev, Error **errp)
 {
+    VirtAcpiState *s = VIRT_ACPI(dev);
+
+    if (s->memhp_state.is_enabled) {
+        acpi_memory_hotplug_init(get_system_memory(), OBJECT(dev),
+                                 &s->memhp_state,
+                                 s->memhp_base);
+    }
 }
 
 static Property virt_acpi_properties[] = {
+    DEFINE_PROP_UINT64("memhp_base", VirtAcpiState, memhp_base, 0),
+    DEFINE_PROP_BOOL("memory-hotplug-support", VirtAcpiState,
+                     memhp_state.is_enabled, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index bf9c0bc..20d3c83 100644
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
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d0ff20d..13db0e9 100644
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
@@ -516,6 +517,18 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
     }
 }
 
+static DeviceState *create_virt_acpi(VirtMachineState *vms)
+{
+    DeviceState *dev;
+
+    dev = qdev_create(NULL, "virt-acpi");
+    qdev_prop_set_uint64(dev, "memhp_base",
+                         vms->memmap[VIRT_PCDIMM_ACPI].base);
+    qdev_init_nofail(dev);
+
+    return dev;
+}
+
 static void create_its(VirtMachineState *vms, DeviceState *gicdev)
 {
     const char *itsclass = its_class_name();
@@ -1644,6 +1657,8 @@ static void machvirt_init(MachineState *machine)
 
     create_platform_bus(vms, pic);
 
+    vms->acpi = create_virt_acpi(vms);
+
     vms->bootinfo.ram_size = machine->ram_size;
     vms->bootinfo.kernel_filename = machine->kernel_filename;
     vms->bootinfo.kernel_cmdline = machine->kernel_cmdline;
@@ -1828,11 +1843,19 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
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
 
diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index f314515..262ca7d 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -18,12 +18,17 @@
 #ifndef HW_ACPI_GED_H
 #define HW_ACPI_GED_H
 
+#include "hw/acpi/memory_hotplug.h"
+
 #define TYPE_VIRT_ACPI "virt-acpi"
 #define VIRT_ACPI(obj) \
     OBJECT_CHECK(VirtAcpiState, (obj), TYPE_VIRT_ACPI)
 
 typedef struct VirtAcpiState {
     SysBusDevice parent_obj;
+    MemHotplugState memhp_state;
+    hwaddr memhp_base;
 } VirtAcpiState;
 
+
 #endif
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 507517c..c5e4c96 100644
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


