Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp966966dyb;
        Wed, 25 Jun 2025 09:21:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW63YzFzXUk3Lqxd9ps5w+k+9tjiPSF2vOWdn1ORIHeYZJOWscLPjK+kw9h0ZnOuufCJqr7qj2xpZpqCw==@linaro.org
X-Google-Smtp-Source: AGHT+IHeWnOH3UrkO4lm+Zlk/T2bU0mJeZiElNbx9FIJ/Jn8AIJTbzwmM5jwb8CidnyTRuJae9ys
X-Received: by 2002:a05:600c:529b:b0:450:cd25:e68f with SMTP id 5b1f17b1804b1-45381ae9ac3mr31533445e9.27.1750868462413;
        Wed, 25 Jun 2025 09:21:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750868462; cv=none;
        d=google.com; s=arc-20240605;
        b=G5U+oJJnSao/l09ektTn1QeXpMT5nOZUu4tYp/uQkh03iBAtr8Z+vzkfaqHbEQpQH1
         8VtXWsSbGRoy9fDEEQGvi3eDxzUZJuh5FOIC2c4WK0I62b15zjb3xFUrWa8aZHWWV9sd
         doApIULgvv6b6wR9wKnDq5q/yZrJ6FuoeGA5asJS5Ts4GUArwNj5sIFq8bTmB1dNN8dx
         bSHbdGYhCQTab4d/FfvJBfUZbtCKu7zRrxYT1nZDsGU8BNbLkZpZ6uK/tlACncRPtNb+
         r/1092kvLN4ligMyr+Wkccl8NibsagWtVNOazGOm+hnyetj6gU8x15JraR0uQZrd6cyI
         Q2lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=iOnF0phO3ZdA8zBIFYkhuhVJ1RZ8arx9V5bhs3CODsY=;
        fh=XUvLIQQ+XauERGTJwKbaGPxk6m9WHQ9TdRLiHbw47Bs=;
        b=GyrMm6+QLK3Wr5DjFEHNE0jcTcMZYZE6s7eG66OlCcqTVkw0Yk/OEBaUTKUeJBvXMO
         WY3MJPO/Qw4dwG9UU2dnFTg8tHFmTsyiQ1/rvOFkdKjT9qz4tT7wqzrBe0hnf5dAQt6u
         VR8mNx4m+gd/Jh5ZntbqyoSIEY5PiLy5WAzwqq+6HnAkhUBYhV+hxhM5ZUVHyubXBRaP
         qElsZfAMM5Hv0lJVa3VIi8FiVZc/HBDLPEiGBRBvQ/X9HRO3BEJxqmywDtI5YoeiwV4a
         b5fs4X5Ujq2+3kO75qooXFHyrbVnfSiNY3UrChZgYiASBLapYLpyIan6M17AxlTE4dOv
         5Esg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4538234a1e6si16110085e9.3.2025.06.25.09.21.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Jun 2025 09:21:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bS6VR5WXzz6M4YS;
	Thu, 26 Jun 2025 00:20:15 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id A524414044F;
	Thu, 26 Jun 2025 00:21:01 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.19.247) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Jun 2025 18:21:01 +0200
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <qemu-devel@nongnu.org>, Fan Ni <fan.ni@samsung.com>, Peter Maydell
	<peter.maydell@linaro.org>, <mst@redhat.com>, Zhijian Li
	<lizhijian@fujitsu.com>, Itaru Kitayama <itaru.kitayama@linux.dev>
CC: <linuxarm@huawei.com>, <linux-cxl@vger.kernel.org>, <qemu-arm@nongnu.org>,
	Yuquan Wang <wangyuquan1236@phytium.com.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH qemu v16 3/5] hw/arm/virt: Basic CXL enablement on pci_expander_bridge instances pxb-cxl
Date: Wed, 25 Jun 2025 17:19:24 +0100
Message-ID: <20250625161926.549812-4-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250625161926.549812-1-Jonathan.Cameron@huawei.com>
References: <20250625161926.549812-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: zwpVhfndfFIQ

Code based on i386/pc enablement.
The memory layout places space for 16 host bridge register regions after
the GIC_REDIST2 in the extended memmap. This is a hole in the current
map so adding them here has no impact on placement of other memory regions
(tested with enough CPUs for GIC_REDIST2 to be in use.)

The CFMWs are placed above the extended memmap.  Note the confusing
existing variable highest_gpa is the highest_gpa that has been allocated
at a particular point in setting up the memory map.

The cxl_devices_state.host_mr is provides a small space in which to place
the individual host bridge register regions for whatever host bridges are
allocated via -device pxb-cxl on the command line. The existing dynamic
sysbus infrastructure is not reused because pxb-cxl is a PCI device not
a sysbus one but these registers are directly in the main memory map,
not the PCI address space.

Only create the CEDT table if cxl=on set for the machine. Default to off.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
v16: Some additional comments on the memory map in the patch description.
     Added an 'off by default' statement to he patch description.
     Update highest_gpa to include CXL Fixed Memory Windows. It is not
     used after this point but cleaner to set it anyway.

Perhaps unresolved feedback.  Peter raised a concern about the direct
initialization of vms->cxl_devices_state.host_mr. I've added more
commentary about that to the patch description. Whilst it seems
unnecessary I could wrap the relevant 3 lines of code up in a utility
function rather than open coding them here and in i386/pc.
---
 docs/system/arm/virt.rst |  9 +++++++++
 include/hw/arm/virt.h    |  4 ++++
 hw/arm/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++++++++
 hw/arm/virt.c            | 29 +++++++++++++++++++++++++++++
 4 files changed, 76 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 6a719b9586..10cbffc8a7 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -31,6 +31,7 @@ Supported devices
 The virt board supports:
 
 - PCI/PCIe devices
+- CXL Fixed memory windows, root bridges and devices.
 - Flash memory
 - Either one or two PL011 UARTs for the NonSecure World
 - An RTC
@@ -189,6 +190,14 @@ ras
 acpi
   Set ``on``/``off``/``auto`` to enable/disable ACPI.
 
+cxl
+  Set  ``on``/``off`` to enable/disable CXL. More details in
+  :doc:`../devices/cxl`. The default is off.
+
+cxl-fmw
+  Array of CXL fixed memory windows describing fixed address routing to
+  target CXL host bridges. See :doc:`../devices/cxl`.
+
 dtb-randomness
   Set ``on``/``off`` to pass random seeds via the guest DTB
   rng-seed and kaslr-seed nodes (in both "/chosen" and
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 9a1b0f53d2..4375819ea0 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -36,6 +36,7 @@
 #include "hw/arm/boot.h"
 #include "hw/arm/bsa.h"
 #include "hw/block/flash.h"
+#include "hw/cxl/cxl.h"
 #include "system/kvm.h"
 #include "hw/intc/arm_gicv3_common.h"
 #include "qom/object.h"
@@ -85,6 +86,7 @@ enum {
 /* indices of IO regions located after the RAM */
 enum {
     VIRT_HIGH_GIC_REDIST2 =  VIRT_LOWMEMMAP_LAST,
+    VIRT_CXL_HOST,
     VIRT_HIGH_PCIE_ECAM,
     VIRT_HIGH_PCIE_MMIO,
 };
@@ -140,6 +142,7 @@ struct VirtMachineState {
     bool secure;
     bool highmem;
     bool highmem_compact;
+    bool highmem_cxl;
     bool highmem_ecam;
     bool highmem_mmio;
     bool highmem_redists;
@@ -174,6 +177,7 @@ struct VirtMachineState {
     char *oem_id;
     char *oem_table_id;
     bool ns_el2_virt_timer_irq;
+    CXLState cxl_devices_state;
 };
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 7e8e0f0298..589e221b89 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -39,10 +39,12 @@
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/utils.h"
 #include "hw/acpi/pci.h"
+#include "hw/acpi/cxl.h"
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/generic_event_device.h"
 #include "hw/acpi/tpm.h"
 #include "hw/acpi/hmat.h"
+#include "hw/cxl/cxl.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
@@ -119,10 +121,29 @@ static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap)
     aml_append(scope, dev);
 }
 
+static void build_acpi0017(Aml *table)
+{
+    Aml *dev, *scope, *method;
+
+    scope =  aml_scope("_SB");
+    dev = aml_device("CXLM");
+    aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0017")));
+
+    method = aml_method("_STA", 0, AML_NOTSERIALIZED);
+    aml_append(method, aml_return(aml_int(0x0B)));
+    aml_append(dev, method);
+    build_cxl_dsm_method(dev);
+
+    aml_append(scope, dev);
+    aml_append(table, scope);
+}
+
 static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
                               uint32_t irq, VirtMachineState *vms)
 {
     int ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
+    bool cxl_present = false;
+    PCIBus *bus = vms->bus;
     struct GPEXConfig cfg = {
         .mmio32 = memmap[VIRT_PCIE_MMIO],
         .pio    = memmap[VIRT_PCIE_PIO],
@@ -136,6 +157,14 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
     }
 
     acpi_dsdt_add_gpex(scope, &cfg);
+    QLIST_FOREACH(bus, &vms->bus->child, sibling) {
+        if (pci_bus_is_cxl(bus)) {
+            cxl_present = true;
+        }
+    }
+    if (cxl_present) {
+        build_acpi0017(scope);
+    }
 }
 
 static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
@@ -963,6 +992,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
         }
     }
 
+    if (vms->cxl_devices_state.is_enabled) {
+        cxl_build_cedt(table_offsets, tables_blob, tables->linker,
+                       vms->oem_id, vms->oem_table_id, &vms->cxl_devices_state);
+    }
+
     if (ms->nvdimms_state->is_enabled) {
         nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
                           ms->nvdimms_state, ms->ram_slots, vms->oem_id,
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 99fde5836c..025b4cdc54 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -57,6 +57,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "hw/pci-host/gpex.h"
+#include "hw/pci-bridge/pci_expander_bridge.h"
 #include "hw/virtio/virtio-pci.h"
 #include "hw/core/sysbus-fdt.h"
 #include "hw/platform-bus.h"
@@ -86,6 +87,8 @@
 #include "hw/virtio/virtio-md-pci.h"
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
+#include "hw/cxl/cxl.h"
+#include "hw/cxl/cxl_host.h"
 #include "qemu/guest-random.h"
 
 static GlobalProperty arm_virt_compat[] = {
@@ -220,6 +223,7 @@ static const MemMapEntry base_memmap[] = {
 static MemMapEntry extended_memmap[] = {
     /* Additional 64 MB redist region (can contain up to 512 redistributors) */
     [VIRT_HIGH_GIC_REDIST2] =   { 0x0, 64 * MiB },
+    [VIRT_CXL_HOST] =           { 0x0, 64 * KiB * 16 }, /* 16 UID */
     [VIRT_HIGH_PCIE_ECAM] =     { 0x0, 256 * MiB },
     /* Second PCIe window */
     [VIRT_HIGH_PCIE_MMIO] =     { 0x0, DEFAULT_HIGH_PCIE_MMIO_SIZE },
@@ -1626,6 +1630,17 @@ static void create_pcie(VirtMachineState *vms)
     }
 }
 
+static void create_cxl_host_reg_region(VirtMachineState *vms)
+{
+    MemoryRegion *sysmem = get_system_memory();
+    MemoryRegion *mr = &vms->cxl_devices_state.host_mr;
+
+    memory_region_init(mr, OBJECT(vms), "cxl_host_reg",
+                       vms->memmap[VIRT_CXL_HOST].size);
+    memory_region_add_subregion(sysmem, vms->memmap[VIRT_CXL_HOST].base, mr);
+    vms->highmem_cxl = true;
+}
+
 static void create_platform_bus(VirtMachineState *vms)
 {
     DeviceState *dev;
@@ -1742,6 +1757,12 @@ void virt_machine_done(Notifier *notifier, void *data)
     struct arm_boot_info *info = &vms->bootinfo;
     AddressSpace *as = arm_boot_address_space(cpu, info);
 
+    cxl_hook_up_pxb_registers(vms->bus, &vms->cxl_devices_state,
+                              &error_fatal);
+
+    if (vms->cxl_devices_state.is_enabled) {
+        cxl_fmws_link_targets(&error_fatal);
+    }
     /*
      * If the user provided a dtb, we assume the dynamic sysbus nodes
      * already are integrated there. This corresponds to a use case where
@@ -1788,6 +1809,7 @@ static inline bool *virt_get_high_memmap_enabled(VirtMachineState *vms,
 {
     bool *enabled_array[] = {
         &vms->highmem_redists,
+        &vms->highmem_cxl,
         &vms->highmem_ecam,
         &vms->highmem_mmio,
     };
@@ -1895,6 +1917,9 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
     if (device_memory_size > 0) {
         machine_memory_devices_init(ms, device_memory_base, device_memory_size);
     }
+    vms->highest_gpa = cxl_fmws_set_memmap(ROUND_UP(vms->highest_gpa + 1,
+                                                    256 * MiB),
+                                           BIT_ULL(pa_bits)) - 1;
 }
 
 static VirtGICType finalize_gic_version_do(const char *accel_name,
@@ -2345,6 +2370,8 @@ static void machvirt_init(MachineState *machine)
     memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base,
                                 machine->ram);
 
+    cxl_fmws_update_mmio();
+
     virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
 
     create_gic(vms, sysmem);
@@ -2400,6 +2427,7 @@ static void machvirt_init(MachineState *machine)
     create_rtc(vms);
 
     create_pcie(vms);
+    create_cxl_host_reg_region(vms);
 
     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
         vms->acpi_dev = create_acpi_ged(vms);
@@ -3370,6 +3398,7 @@ static void virt_instance_init(Object *obj)
 
     vms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     vms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
+    cxl_machine_init(obj, &vms->cxl_devices_state);
 }
 
 static const TypeInfo virt_machine_info = {
-- 
2.48.1
