Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp1141855wrv;
        Tue, 16 Jul 2019 08:43:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyrcOJKjBoqjY6NA9vO8MXuVQIZ9R+sfsRJ2wNefyhO9oqDZ+6T+KcBfMKHqwi7ed9ladnb
X-Received: by 2002:a50:982a:: with SMTP id g39mr29685789edb.88.1563291818830;
        Tue, 16 Jul 2019 08:43:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563291818; cv=none;
        d=google.com; s=arc-20160816;
        b=07qoygBRbvuf16t6d2OcNmEroORdHwLmp9hHzpJ7SOuOS/ZwV1rpyThWCpzm8vJgL8
         nEj3xlQWgPHmgL/uOzA2IH7z8wSH4W1emTkAnn8ybIKcGZNBu3nWe2J+HHbXPl1NikOJ
         sVvvVpD1YHdeIJ1sWFWXWFqZGqcI92Se00QxpbT5Iyr/JOr2mccbi4EUPkQ4jZIsfIuE
         70R4wx8taMb6tDzgaJhcQWoIZJY71IICaiX0xFi/7vT9058XtPjl2oW9WJBTqwnX3COh
         E0mNRCGGQLlBhbaysKK+dfYSeBCB55RE3XEBNOmUH8rbjxg8Qn1sojZ+2ufjVKQFF0dx
         Hazw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=Xm+C/jHfCEkTWMJAQS4eQQAXOPB5XJzu+YUNp3SxA7Y=;
        b=RkjKE4/DOtJrYoytq/GZBznymAz92Z93IKzDtDzcRhr2+EzzmEQ/4Q/yUWCAKfBhDl
         VPrOz/VAonjfh+fnDf2c1oaqcA9Q50OgJzOOkkCubHlGMajoflsCXOfuDSUjlCAC3jvk
         Fl1KSGHrdObTDjmyuWB+BdGG45IBUlAPaISqZbrMZ2hi2cSf3yVdHf3sDZYKyIZ6C33s
         yvZQJHhbIzKPmr043VEveTm9letqU1tqY94iVxxja+4iCF7U8vTJaoWx+W53hbVStTun
         j/xlUFsgm3ALpxILNec+znk3GgyYz2LvIwtCh0WN7WRMYxNW5/TWZz3HnIUJjxIFPN/E
         cxUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d30si13045684ede.441.2019.07.16.08.43.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2019 08:43:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hnPc9-0000VM-VY
	for alex.bennee@linaro.org; Tue, 16 Jul 2019 11:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36754)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hnPZz-00083j-E6
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 11:41:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hnPZx-0004Uc-Qu
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 11:41:22 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:33904 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hnPZv-0004Pv-Mg; Tue, 16 Jul 2019 11:41:21 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3D271F687B0472992747;
 Tue, 16 Jul 2019 23:41:14 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Tue, 16 Jul 2019 23:41:08 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Tue, 16 Jul 2019 16:38:15 +0100
Message-ID: <20190716153816.17676-10-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190716153816.17676-1-shameerali.kolothum.thodi@huawei.com>
References: <20190716153816.17676-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH-for-4.2 v7 09/10] hw/arm: Use GED for
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
X-TUID: jU1W40iiUM7L

Use GED for system_powerdown event instead of GPIO for ACPI.
Guest boot with DT still uses GPIO.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt-acpi-build.c | 37 +------------------------------------
 hw/arm/virt.c            |  6 +++---
 2 files changed, 4 insertions(+), 39 deletions(-)

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
index ffcccc05ad..6e55c25c5f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -528,7 +528,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms, qemu_irq *pic)
 {
     DeviceState *dev;
     int irq = vms->irqmap[VIRT_ACPI_GED];
-    uint32_t event = ACPI_GED_MEM_HOTPLUG_EVT;
+    uint32_t event = ACPI_GED_MEM_HOTPLUG_EVT | ACPI_GED_PWR_DOWN_EVT;
 
     dev = DEVICE(object_new(TYPE_ACPI_GED));
     qdev_prop_set_uint64(dev, "memhp-base",
@@ -1718,10 +1718,10 @@ static void machvirt_init(MachineState *machine)
 
     create_pcie(vms, pic);
 
-    create_gpio(vms, pic);
-
     if (!vmc->no_acpi_dev && aarch64 && firmware_loaded && acpi_enabled) {
         vms->acpi_dev = create_acpi_ged(vms, pic);
+    } else {
+        create_gpio(vms, pic);
     }
 
     /* Create mmio transports, so the user can create virtio backends
-- 
2.17.1


