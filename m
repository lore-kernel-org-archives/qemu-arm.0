Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp6479783wrp;
        Wed, 18 Sep 2019 06:17:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxjaL6T4g+p5gNxZV4GbAsZar+MefF+CZM4YIsdHLfZIek6qMRHSFn+M8dyIBiFwbcRN2rf
X-Received: by 2002:a37:bb01:: with SMTP id l1mr2198671qkf.384.1568812661572;
        Wed, 18 Sep 2019 06:17:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568812661; cv=none;
        d=google.com; s=arc-20160816;
        b=uq+xrBM3UDDoM8ZqdMUGSlcT9jgw+F3sUEPF6ZV/8HKG4RgNhDmGq6ED0S+Z07VIvs
         MXY2EA6QmG0gFgzkbnKSxXjcJlRh43J/aHXGHsRlcRZ4pn5r+z2v11QvKE15CxoK18Ba
         VBKR7ug65CkSjfiib2YpgmjYpF6qBmO00P8EXvsmSFVh6En2ctzIrNukUTvjbWQaSVCp
         58neQcDEUCQCjPH2JXirxeYudczk6EwJfL56IrH7/iNz6VsCV4Esj6rTEcZfJcbNWice
         mo0KyddA4M4Z6tM87Rp9UFth7QLrKmBE08iaso/ScOoYLX7itj5DhpSAS+FXTcGjnMyv
         DKyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=japtPcaMT36ZhBSx0kZwwZpHwpYRouN8SiLidJH3Bh4=;
        b=xqmyJC4rRpeI4McZ1ymAit9Xdi6Lf+I3h8UF92zS6bBmGfU10GMDopE9zIZGTZWpXK
         ADQ2H8DWaS5sbA9rD+MZNYpixokijrz7qzLG+92LZVgE4jGwV19/AFM9QZv2AJbM/9wW
         nVJN11TGrxl4pTj3MEnAsnhEuIGgrTENiatJuXLoqM7s3hRg5T9HFNO/w6j3MGoqh7G9
         hVYk94BVFe8qLXcn7fJh85G80Ib4OA0ZDhkBoIzyyD38IwESSEO3hsTwziS4bUFLz4ok
         mex2gdO8t/1MrQ6GhXnO5QxMBkTYz63NckEKD8yqNh0R39I8NXYUDry3f5T24eqTJsId
         31AQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12si3574636qkg.362.2019.09.18.06.17.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2019 06:17:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAZq0-0004cZ-0e
	for alex.bennee@linaro.org; Wed, 18 Sep 2019 09:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58747)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iAZhA-0004TF-Ag
 for qemu-arm@nongnu.org; Wed, 18 Sep 2019 09:08:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iAZh8-0003Rv-Da
 for qemu-arm@nongnu.org; Wed, 18 Sep 2019 09:08:31 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2175 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iAZh8-0003Qr-1C; Wed, 18 Sep 2019 09:08:30 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 17D7492726D440B01D4D;
 Wed, 18 Sep 2019 21:08:28 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Wed, 18 Sep 2019 21:08:20 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Wed, 18 Sep 2019 14:06:30 +0100
Message-ID: <20190918130633.4872-9-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190918130633.4872-1-shameerali.kolothum.thodi@huawei.com>
References: <20190918130633.4872-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH-for-4.2 v11 08/11] hw/arm: Use GED for
 system_powerdown event
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 mst@redhat.com, linuxarm@huawei.com, xuwei5@hisilicon.com,
 shannon.zhaosl@gmail.com, sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q/Y/qRhA6E+D

For machines 4.2 or higher with ACPI boot use GED for system_powerdown
event instead of GPIO. Guest boot with DT still uses GPIO.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/generic_event_device.c         |  8 ++++++++
 hw/arm/virt-acpi-build.c               |  6 +++---
 hw/arm/virt.c                          | 18 ++++++++++++------
 include/hw/acpi/acpi_dev_interface.h   |  1 +
 include/hw/acpi/generic_event_device.h |  3 +++
 5 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index b94500b08d..9cee90cc70 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -22,6 +22,7 @@
 
 static const uint32_t ged_supported_events[] = {
     ACPI_GED_MEM_HOTPLUG_EVT,
+    ACPI_GED_PWR_DOWN_EVT,
 };
 
 /*
@@ -104,6 +105,11 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
                 aml_append(if_ctx, aml_call0(MEMORY_DEVICES_CONTAINER "."
                                              MEMORY_SLOT_SCAN_METHOD));
                 break;
+            case ACPI_GED_PWR_DOWN_EVT:
+                aml_append(if_ctx,
+                           aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
+                                      aml_int(0x80)));
+                break;
             default:
                 /*
                  * Please make sure all the events in ged_supported_events[]
@@ -184,6 +190,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 
     if (ev & ACPI_MEMORY_HOTPLUG_STATUS) {
         sel = ACPI_GED_MEM_HOTPLUG_EVT;
+    } else if (ev & ACPI_POWER_DOWN_STATUS) {
+        sel = ACPI_GED_PWR_DOWN_EVT;
     } else {
         /* Unknown event. Return without generating interrupt. */
         warn_report("GED: Unsupported event %d. No irq injected", ev);
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index c97661ad68..4cd50175e0 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -50,7 +50,6 @@
 #include "migration/vmstate.h"
 
 #define ARM_SPI_BASE 32
-#define ACPI_POWER_BUTTON_DEVICE "PWRB"
 
 static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
 {
@@ -741,13 +740,14 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                     (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
     acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE),
                       vms->highmem, vms->highmem_ecam);
-    acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
-                       (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
     if (vms->acpi_dev) {
         build_ged_aml(scope, "\\_SB."GED_DEVICE,
                       HOTPLUG_HANDLER(vms->acpi_dev),
                       irqmap[VIRT_ACPI_GED] + ARM_SPI_BASE, AML_SYSTEM_MEMORY,
                       memmap[VIRT_ACPI_GED].base);
+    } else {
+        acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
+                           (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
     }
 
     if (vms->acpi_dev) {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index dbd8c18f36..d4bedc2607 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -536,10 +536,10 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms, qemu_irq *pic)
     DeviceState *dev;
     MachineState *ms = MACHINE(vms);
     int irq = vms->irqmap[VIRT_ACPI_GED];
-    uint32_t event = 0;
+    uint32_t event = ACPI_GED_PWR_DOWN_EVT;
 
     if (ms->ram_slots) {
-        event = ACPI_GED_MEM_HOTPLUG_EVT;
+        event |= ACPI_GED_MEM_HOTPLUG_EVT;
     }
 
     dev = qdev_create(NULL, TYPE_ACPI_GED);
@@ -793,8 +793,14 @@ static void create_rtc(const VirtMachineState *vms, qemu_irq *pic)
 static DeviceState *gpio_key_dev;
 static void virt_powerdown_req(Notifier *n, void *opaque)
 {
-    /* use gpio Pin 3 for power button event */
-    qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);
+    VirtMachineState *s = container_of(n, VirtMachineState, powerdown_notifier);
+
+    if (s->acpi_dev) {
+        acpi_send_event(s->acpi_dev, ACPI_POWER_DOWN_STATUS);
+    } else {
+        /* use gpio Pin 3 for power button event */
+        qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);
+    }
 }
 
 static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
@@ -1723,10 +1729,10 @@ static void machvirt_init(MachineState *machine)
 
     create_pcie(vms, pic);
 
-    create_gpio(vms, pic);
-
     if (has_ged && aarch64 && firmware_loaded && acpi_enabled) {
         vms->acpi_dev = create_acpi_ged(vms, pic);
+    } else {
+        create_gpio(vms, pic);
     }
 
      /* connect powerdown request */
diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
index 0ba90effd2..a2a12af9b9 100644
--- a/include/hw/acpi/acpi_dev_interface.h
+++ b/include/hw/acpi/acpi_dev_interface.h
@@ -13,6 +13,7 @@ typedef enum {
     ACPI_MEMORY_HOTPLUG_STATUS = 8,
     ACPI_NVDIMM_HOTPLUG_STATUS = 16,
     ACPI_VMGENID_CHANGE_STATUS = 32,
+    ACPI_POWER_DOWN_STATUS = 64,
 } AcpiEventStatusBits;
 
 #define TYPE_ACPI_DEVICE_IF "acpi-device-interface"
diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index 2049e8d873..d157eac088 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -62,6 +62,8 @@
 #include "hw/sysbus.h"
 #include "hw/acpi/memory_hotplug.h"
 
+#define ACPI_POWER_BUTTON_DEVICE "PWRB"
+
 #define TYPE_ACPI_GED "acpi-ged"
 #define ACPI_GED(obj) \
     OBJECT_CHECK(AcpiGedState, (obj), TYPE_ACPI_GED)
@@ -79,6 +81,7 @@
  * through GED.
  */
 #define ACPI_GED_MEM_HOTPLUG_EVT   0x1
+#define ACPI_GED_PWR_DOWN_EVT      0x2
 
 typedef struct GEDState {
     MemoryRegion io;
-- 
2.17.1


