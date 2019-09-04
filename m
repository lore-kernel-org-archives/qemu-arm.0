Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp442789wrp;
        Wed, 4 Sep 2019 02:02:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy4eAsf+iU4vHWSZZvr7NUYMgweurzuYS1Lf1NEo0V97SylGZTfSFTc9f71xya4LwQgaCHn
X-Received: by 2002:a37:4a88:: with SMTP id x130mr38921307qka.501.1567587733087;
        Wed, 04 Sep 2019 02:02:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567587733; cv=none;
        d=google.com; s=arc-20160816;
        b=TK664dXPRj2t0Mw7HmN8Je3oPUyklOmZVKtTChaYi/jfyuWBbRGMFp6wddeYxPardG
         T25xy1zdnNosGPRtK4B2Oj7N8Pttwe+RQCDONrb3W1IcC7SHUrH14ljnFDgkQlmYCJ5j
         TjqlJ2OmBBEGheaQOjQ9kAQFKve1ZFLtlv8/rQSYT/eBX13RIIF829/IyuyT3rLKrHzP
         u+Ml5dBqwQn7VZTUzS0pcjp/dp679zjRVJlTKJKGYcXqGhILrBmXJAA/1JX+ux+kLVWm
         yoWqK/ISz7oj/VIW4XNqGRSgIMKXI9Phy09fvmlmi7wSZGZRy9EjZRkuKGoXnLQEmgPG
         4img==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=PM1/LUgcWXIf/SWOn6r2EggZ/2GWbVEYgiv/xNig5kY=;
        b=k9LGBiu+D2yF7MsW67Ccu8V8QYHmUR5uSO0jCSO+05bzaoles3yaIJ65prxPdxc2vA
         Fv8CeLG1Dy3EZDi9GQEa1cpg8b4sBZiJuH07Q30UMAwK+Hf/9eE+/eEhNQHVivkTP22N
         SbwkSmbwA2Adtmj65P8ZQ26ycyOW5YNervWRsth1dR6q1uLityupYZEEpYBY/UJUX/lo
         mVblyX88YVKNuXHRCwRa8RUZbYNeOdBJ6KreN8IvHXkfvRaKzWG3ZGIlMrfu+Bzxk4bv
         IvrdRNuU8/NKxkxQzdJJTRxLVLeeG3RahvXQIx0efgdLrI7TPPcCGYKuNUcoeaZKip1I
         a3Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f28si8449130qkk.229.2019.09.04.02.02.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 02:02:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5RB5-0002qA-Gz
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 05:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38641)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R79-0007TU-Vr
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 04:58:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R78-0007Ge-C7
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 04:58:07 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2260 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R78-0007Ft-00; Wed, 04 Sep 2019 04:58:06 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1588BE67DB0E507DBD76;
 Wed,  4 Sep 2019 16:58:04 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Wed, 4 Sep 2019 16:57:53 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Wed, 4 Sep 2019 09:56:26 +0100
Message-ID: <20190904085629.13872-9-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
References: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH-for-4.2 v10 08/11] hw/arm: Use GED for
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
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 224BIcgPGPXm

For machines 4.2 or higher with ACPI boot use GED for system_powerdown
event instead of GPIO. Guest boot with DT still uses GPIO.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
v9 --> v10
 -Eric's R-by

v8 --> v9
 -Re-arranged patches 8 & 9 from v8 based on Igor's comments.

v7 --> v8
 -Retained gpio based system_powerdown support for machines < 4.2.
 -Reuse of virt_powerdown_req() for ACPI GED use.
 -Dropped Eric's R-by for now because of above.
---
 hw/acpi/generic_event_device.c         |  8 ++++++++
 hw/arm/virt-acpi-build.c               |  6 +++---
 hw/arm/virt.c                          | 16 +++++++++++-----
 include/hw/acpi/acpi_dev_interface.h   |  1 +
 include/hw/acpi/generic_event_device.h |  3 +++
 5 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index f81d966058..47e178c583 100644
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
@@ -190,6 +196,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 
     if (ev & ACPI_MEMORY_HOTPLUG_STATUS) {
         sel = ACPI_GED_MEM_HOTPLUG_EVT;
+    } else if (ev & ACPI_POWER_DOWN_STATUS) {
+        sel = ACPI_GED_PWR_DOWN_EVT;
     } else {
         /* Unknown event. Return without generating interrupt. */
         warn_report("GED: Unsupported event %d. No irq injected", ev);
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index a4872a0b00..bbf7f6fafa 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -50,7 +50,6 @@
 #include "migration/vmstate.h"
 
 #define ARM_SPI_BASE 32
-#define ACPI_POWER_BUTTON_DEVICE "PWRB"
 
 static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
 {
@@ -740,13 +739,14 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
 
     if (vms->acpi_dev && ms->ram_slots) {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 89ee37d7de..32208e1058 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -532,7 +532,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms, qemu_irq *pic)
 {
     DeviceState *dev;
     int irq = vms->irqmap[VIRT_ACPI_GED];
-    uint32_t event = ACPI_GED_MEM_HOTPLUG_EVT;
+    uint32_t event = ACPI_GED_MEM_HOTPLUG_EVT | ACPI_GED_PWR_DOWN_EVT;
 
     dev = qdev_create(NULL, TYPE_ACPI_GED);
     qdev_prop_set_uint32(dev, "ged-event", event);
@@ -787,8 +787,14 @@ static void create_rtc(const VirtMachineState *vms, qemu_irq *pic)
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
@@ -1716,10 +1722,10 @@ static void machvirt_init(MachineState *machine)
 
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


