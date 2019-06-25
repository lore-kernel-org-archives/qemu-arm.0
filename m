Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4908578wrg;
        Tue, 25 Jun 2019 05:33:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzyWhlaqmZb3IbAEhDUD5FUkWNAAOe7yDJIldddVGupWyT79o2s+qimx1XBY3VdfXlDJm4d
X-Received: by 2002:a05:6402:712:: with SMTP id w18mr81985466edx.201.1561465988031;
        Tue, 25 Jun 2019 05:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561465988; cv=none;
        d=google.com; s=arc-20160816;
        b=cezL/semiXPILgckcCGjrLaGf4E+VByQvrDiYlUedErVzMqMfgt9g5aTjOCl+4L12s
         VPm3n3hOLNSbHJddC0W1lNL2XR0PekSjOkMTy/brDiY7VP9MKSIA3YCwXEWAXhnr/TMp
         W0CwzsSWdDU6IPJAf8RH999B8fHRvLxg8rSHMfvoJjf/b7nOSDnyYQvrr78UZdS0MHUO
         A+RxWzdO854O+oUhSYsQxeCQ3orQ/Q6yoQO/PSHm8U1An/lIOm/BAEv+cXP3rhtl4dPM
         zZ54lzqyqiD8Suuj6mpETd2qZGtSrfRsEnm/8z/jSLLiyPE9EqcORSa96MBnJg+DQur2
         S1Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=yJh2nFGCz2iJoTItFxl3oPL2kP+Pn4Js3ltYfd0rJNw=;
        b=xnqIrSBZDRdxEz1Aj4Sgo6H02iD/bKVgLQnW3yd+AdwS7zgrSFS1HY+jz5absakRrb
         kK2nFlVqvv5qkU3MbbmIUpL7y0seBPutDSc/1r3cEtiNcA6dacDwWB5N5tj5u3TU3LLa
         Ga/g8dZxXgqAxJw4nWaioDj+/LGoaYuKkgZngMe49lSidkrxutLXGOy9IduYnff+0xp4
         YLeiXvn2/lg03LeC++lVhMzl0lUPx+F3x7NHNew7a+WuPuXvYB115oT+SiiwVMY6Gz0S
         QiErh4tPPZ/5E/8Yx+nkeaGFFXMyblahcv5m7qmy44jibLCgPJ2HLOOkFdq8W73UxObG
         brjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t22si256059eju.370.2019.06.25.05.33.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 05:33:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59712 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hfkdH-0001LQ-34
	for alex.bennee@linaro.org; Tue, 25 Jun 2019 08:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36551)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hfkN9-0007Lz-Ce
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 08:16:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hfkN7-0004Xv-K2
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 08:16:27 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:54892 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hfkMx-0004IO-DC; Tue, 25 Jun 2019 08:16:19 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id B4A38590451BDC308A82;
 Tue, 25 Jun 2019 20:16:04 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Tue, 25 Jun 2019 20:15:53 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Tue, 25 Jun 2019 13:14:21 +0100
Message-ID: <20190625121421.22280-9-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190625121421.22280-1-shameerali.kolothum.thodi@huawei.com>
References: <20190625121421.22280-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-devel] [PATCH v6 8/8] hw/arm: Use GED for system_powerdown
 event
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uw0XQG41pfqT

Use GED for system_powerdown event instead of GPIO for ACPI.
Guest boot with DT still uses GPIO.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt-acpi-build.c | 37 +------------------------------------
 hw/arm/virt.c            |  7 +++----
 2 files changed, 4 insertions(+), 40 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 75657caa36..9178ca8e40 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -49,7 +49,6 @@
 #include "kvm_arm.h"
 
 #define ARM_SPI_BASE 32
-#define ACPI_POWER_BUTTON_DEVICE "PWRB"
 
 static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
 {
@@ -328,37 +327,6 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
     aml_append(scope, dev);
 }
 
-static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
-                                           uint32_t gpio_irq)
-{
-    Aml *dev = aml_device("GPO0");
-    aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0061")));
-    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
-    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
-
-    Aml *crs = aml_resource_template();
-    aml_append(crs, aml_memory32_fixed(gpio_memmap->base, gpio_memmap->size,
-                                       AML_READ_WRITE));
-    aml_append(crs, aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
-                                  AML_EXCLUSIVE, &gpio_irq, 1));
-    aml_append(dev, aml_name_decl("_CRS", crs));
-
-    Aml *aei = aml_resource_template();
-    /* Pin 3 for power button */
-    const uint32_t pin_list[1] = {3};
-    aml_append(aei, aml_gpio_int(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
-                                 AML_EXCLUSIVE, AML_PULL_UP, 0, pin_list, 1,
-                                 "GPO0", NULL, 0));
-    aml_append(dev, aml_name_decl("_AEI", aei));
-
-    /* _E03 is handle for power button */
-    Aml *method = aml_method("_E03", 0, AML_NOTSERIALIZED);
-    aml_append(method, aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
-                                  aml_int(0x80)));
-    aml_append(dev, method);
-    aml_append(scope, dev);
-}
-
 static void acpi_dsdt_add_power_button(Aml *scope)
 {
     Aml *dev = aml_device(ACPI_POWER_BUTTON_DEVICE);
@@ -739,9 +707,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                     (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
     acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE),
                       vms->highmem, vms->highmem_ecam);
-    acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
-                       (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
     if (vms->acpi_dev) {
+        acpi_dsdt_add_power_button(scope);
         build_ged_aml(scope, "\\_SB."GED_DEVICE,
                       HOTPLUG_HANDLER(vms->acpi_dev),
                       irqmap[VIRT_ACPI_GED] + ARM_SPI_BASE, AML_SYSTEM_MEMORY);
@@ -752,8 +719,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                                  AML_SYSTEM_MEMORY);
     }
 
-    acpi_dsdt_add_power_button(scope);
-
     aml_append(dsdt, scope);
 
     /* copy AML table into ACPI tables blob and patch header there */
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 51173f6ce1..e6cef1e536 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -527,7 +527,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms, qemu_irq *pic)
 {
     DeviceState *dev;
     int irq = vms->irqmap[VIRT_ACPI_GED];
-    uint32_t event = ACPI_GED_MEM_HOTPLUG_EVT;
+    uint32_t event = ACPI_GED_MEM_HOTPLUG_EVT | ACPI_GED_PWR_DOWN_EVT;
 
     dev = DEVICE(object_new(TYPE_ACPI_GED));
     qdev_prop_set_uint64(dev, "memhp-base",
@@ -1712,12 +1712,11 @@ static void machvirt_init(MachineState *machine)
 
     create_pcie(vms, pic);
 
-    create_gpio(vms, pic);
-
     if (aarch64 && firmware_loaded && acpi_enabled) {
         vms->acpi_dev = create_acpi_ged(vms, pic);
+    } else {
+        create_gpio(vms, pic);
     }
-
     /* Create mmio transports, so the user can create virtio backends
      * (which will be automatically plugged in to the transports). If
      * no backend is created the transport will just sit harmlessly idle.
-- 
2.17.1


