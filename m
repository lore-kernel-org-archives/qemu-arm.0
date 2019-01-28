Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3149975wrt;
        Mon, 28 Jan 2019 03:11:01 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7ou1zN3P+YOlif3p/rWTnmMO6AomP3YhKfB2TzjxFNzm5X7G2VVX9ayj6A0JBXCZ2hHkVW
X-Received: by 2002:adf:93e2:: with SMTP id 89mr22055700wrp.129.1548673861767;
        Mon, 28 Jan 2019 03:11:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548673861; cv=none;
        d=google.com; s=arc-20160816;
        b=ZE7wV0o2yOWkeqHHYLSR2aCyR3e7VQs5Th4Lm0YqR9WrY43et3v8sI4UnqOwOllxaE
         T5aG21Wmdot4HdExa6jIMwL3ntPP1VQMOocdYJ24pU9Hg/EcgYl9/jxjAsJZ4A6MQvZ5
         1fO3chX8fgnkGWMsemBSOCgZdvdtsvNhgaiBlmfXX63Bg/HJ00Ey47vbR5h+b1Mdd2j/
         yXD+lbt6tn6FRPPu6YTjxcZxl0xJSDTzH6/09dfrHsIKEvt8vQATZrTuGuj02Sz3fFaI
         wrRzy8bsMj26r1q+KmecUTUzELsd2vpdmuhEyHtT5LKZ9Zju8s4Zax2IxxQZSyteihgv
         VYtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=aR0r5asjFPEFHAm4Cs3hkg1fvrnfRmZtCtjEpIs4Kcw=;
        b=DKf2B/BS7TY0Kol6uoX+czjmccAnTy99Vf9+U4XwB+BgIEVAKyLMxu3bkxXsl3ytNF
         ERCrnKWadOcJ9+kgVZfL7BnefKe5U8AsXMTf/tCdq1omFYYk/yOTr+SwULVbKg4fB1/1
         8+vfEL9lBdjx8An2oT9us4YWNF7Ojjf+4eq0q1v4S7SjZ1qe29/I3WtV+Hl1AwahCZhy
         UkONorqc+ctm0g4HJymxEYY1azCSX6g1o7XNlBRdnwZKHCg53dwdkU04vOlvksIEZywC
         ngEvITwmvuUJ7LrGIJl+7EH+4sIOTu0WQxrw61cy5rUf8vMhZuD84IpDhnE+twg4ywy5
         r1fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2si86645675wrg.33.2019.01.28.03.11.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 03:11:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:57995 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go4oe-0006wo-Kd
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 06:11:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1go4kt-0003ny-6Q
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:07:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1go4km-00044v-6w
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:07:06 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:33554 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1go4ki-00043p-Is; Mon, 28 Jan 2019 06:06:58 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id BA4BABAE56610C0C2D5;
	Mon, 28 Jan 2019 19:06:53 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server
	id 14.3.408.0; Mon, 28 Jan 2019 19:06:45 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <eric.auger@redhat.com>, <shannon.zhaosl@gmail.com>,
	<peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Mon, 28 Jan 2019 11:05:44 +0000
Message-ID: <20190128110545.20644-3-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
References: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [RFC PATCH 2/4] hw/arm/virt: Add GPIO based pcdimm
 hotplug ACPI event support
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
Cc: linuxarm@huawei.com, xuwei5@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: acLd74femWJ3

This adds support for using PL061 GPIO controller pin to trigger
pcdimm hotplug event to guest.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 default-configs/arm-softmmu.mak |  1 +
 hw/arm/virt-acpi-build.c        | 28 ++++++++++++++++++++++++----
 hw/arm/virt.c                   | 37 +++++++++++++++++++++++++++++++++----
 include/hw/arm/virt.h           | 14 ++++++++++++++
 4 files changed, 72 insertions(+), 8 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 5deabc1..ebbc67b 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -163,3 +163,4 @@ CONFIG_MEM_DEVICE=y
 CONFIG_DIMM=y
 CONFIG_NVDIMM=y
 CONFIG_ACPI_NVDIMM=y
+CONFIG_ACPI_MEMORY_HOTPLUG=y
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index ab30e28..eedd323 100644
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
@@ -327,8 +328,10 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
 }
 
 static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
-                                           uint32_t gpio_irq)
+                               uint32_t gpio_irq, VirtMachineState *vms)
 {
+    uint32_t pin_list[1];
+
     Aml *dev = aml_device("GPO0");
     aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0061")));
     aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
@@ -342,11 +345,21 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
     aml_append(dev, aml_name_decl("_CRS", crs));
 
     Aml *aei = aml_resource_template();
-    /* Pin 3 for power button */
-    const uint32_t pin_list[1] = {3};
+
+    /* GPIO Interrupt connection descriptor for power button */
+    pin_list[0] = GPIO_PWRB;
     aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
                                  AML_EXCLUSIVE, AML_PULL_UP, 0, pin_list, 1,
                                  "GPO0", NULL, 0));
+
+    if (vms->acpi_memhp_state.is_enabled) {
+        /* GPIO Interrupt connection descriptor for pc-dimm hotplug */
+        pin_list[0] = GPIO_PCDIMM;
+        aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
+                                     AML_EXCLUSIVE, AML_PULL_UP, 0, pin_list,
+                                     1, "GPO0", NULL, 0));
+    }
+
     aml_append(dev, aml_name_decl("_AEI", aei));
 
     /* _E03 is handle for power button */
@@ -735,6 +748,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     Aml *scope, *dsdt;
     const MemMapEntry *memmap = vms->memmap;
     const int *irqmap = vms->irqmap;
+    MachineState *ms = MACHINE(vms);
+    uint32_t nr_mem = ms->ram_slots;
 
     dsdt = init_aml_allocator();
     /* Reserve space for header */
@@ -756,11 +771,16 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE),
                       vms->highmem, vms->highmem_ecam);
     acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
-                       (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
+                       (irqmap[VIRT_GPIO] + ARM_SPI_BASE), vms);
     acpi_dsdt_add_power_button(scope);
 
     aml_append(dsdt, scope);
 
+    if (vms->acpi_memhp_state.is_enabled) {
+        build_memory_hotplug_aml(dsdt, nr_mem, "\\_SB.GPO0",
+                                 "\\_SB.GPO0._E02", AML_SYSTEM_MEMORY);
+    }
+
     /* copy AML table into ACPI tables blob and patch header there */
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
     build_header(linker, table_data,
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8c6dd59..884960d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -173,6 +173,9 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("max"),
 };
 
+static QLIST_HEAD(, GPIODevice) gpio_devices =
+    QLIST_HEAD_INITIALIZER(gpio_devices);
+
 static bool cpu_type_valid(const char *cpu)
 {
     int i;
@@ -740,11 +743,34 @@ static void create_rtc(const VirtMachineState *vms, qemu_irq *pic)
     g_free(nodename);
 }
 
-static DeviceState *gpio_key_dev;
+static DeviceState *virt_get_gpio_dev(int pin)
+{
+    GPIODevice *gpio_dev;
+
+    QLIST_FOREACH(gpio_dev, &gpio_devices, next) {
+        if (pin == gpio_dev->pin_num) {
+            return gpio_dev->dev;
+        }
+    }
+    return NULL;
+}
+
+static void virt_create_gpio_dev(DeviceState *pl061_dev, int pin)
+{
+    GPIODevice *gpio_dev;
+
+    gpio_dev = g_malloc0(sizeof(*gpio_dev));
+    gpio_dev->dev = sysbus_create_simple("gpio-key", -1,
+                                          qdev_get_gpio_in(pl061_dev, pin));
+    gpio_dev->pin_num = pin;
+    QLIST_INSERT_HEAD(&gpio_devices, gpio_dev, next);
+}
+
 static void virt_powerdown_req(Notifier *n, void *opaque)
 {
+    DeviceState *dev = virt_get_gpio_dev(GPIO_PWRB);
     /* use gpio Pin 3 for power button event */
-    qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);
+    qemu_set_irq(qdev_get_gpio_in(dev, 0), 1);
 }
 
 static Notifier virt_system_powerdown_notifier = {
@@ -777,8 +803,11 @@ static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
     qemu_fdt_setprop_string(vms->fdt, nodename, "clock-names", "apb_pclk");
     qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle", phandle);
 
-    gpio_key_dev = sysbus_create_simple("gpio-key", -1,
-                                        qdev_get_gpio_in(pl061_dev, 3));
+    virt_create_gpio_dev(pl061_dev, GPIO_PWRB);
+
+    if (vms->acpi_memhp_state.is_enabled) {
+        virt_create_gpio_dev(pl061_dev, GPIO_PCDIMM);
+    }
     qemu_fdt_add_subnode(vms->fdt, "/gpio-keys");
     qemu_fdt_setprop_string(vms->fdt, "/gpio-keys", "compatible", "gpio-keys");
     qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys", "#size-cells", 0);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 6bb7f92..ef39ce6 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -38,6 +38,7 @@
 #include "sysemu/kvm.h"
 #include "hw/intc/arm_gicv3_common.h"
 #include "hw/mem/nvdimm.h"
+#include "hw/acpi/memory_hotplug.h"
 
 #define NUM_GICV2M_SPIS       64
 #define NUM_VIRTIO_TRANSPORTS 32
@@ -136,8 +137,21 @@ typedef struct {
     hwaddr high_io_base;
     bool extended_memmap;
     AcpiNVDIMMState acpi_nvdimm_state;
+    MemHotplugState acpi_memhp_state;
 } VirtMachineState;
 
+/* GPIO pins for ACPI events */
+enum {
+    GPIO_PCDIMM = 2,
+    GPIO_PWRB,
+};
+
+typedef struct GPIODevice {
+    DeviceState *dev;
+    int pin_num;
+    QLIST_ENTRY(GPIODevice) next;
+} GPIODevice;
+
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
 
 #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
-- 
2.7.4


