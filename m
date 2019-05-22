Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp656661wrg;
        Wed, 22 May 2019 09:28:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzzwex93ElYsoHoEyuAjR3skKo2rTWDyoEaom0jWHoXNyZeWUBs9VQho229sUUl/D4qfs3Y
X-Received: by 2002:a17:906:a2d4:: with SMTP id by20mr41860500ejb.72.1558542481328;
        Wed, 22 May 2019 09:28:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558542481; cv=none;
        d=google.com; s=arc-20160816;
        b=soOjc6mPro+kRNtxxsPZrl6QeCgW9b8Huhvz3MJv9uI+sQwjsw69Lxg0mn8V2Hd3KA
         52835YvISQ8MXOHYwZdoMojMWr9OXEU4eBVsBy/HANoxmvDZstBKbN5Ml8jhWZXMoHMG
         o2ks0mpY9PERvVKaFwuhQmmbLz20Vjbl9N8mu/fVP/+nJPxONqZeNxsPsitxakqSdSUg
         Rjcfp+ohSFzFpYEYB42XAXcXIgyzzpb3RhJ+LLoAW+WV99a9GNiwCe492BE4Nj6BwmkQ
         yBiRsHI/4MEsRJkND86DjPk7XT9fvPpqbwbxh1mWRLlZKDVeBiVd1/aVhXPSl4cPuXVK
         rkwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=rYWUu1LkdEmOD+uNli1EMWjjMW1a35NXTYx9MXlUKe4=;
        b=gOtRBT5HpOqyb47j44Hy3VBCN2xHeP/uja3a/ouTNgMi77RMOWrJrqlRO+nTdWqysa
         JeSPAa+j8QM2yoa7qqf6nh2GB80woCfyxOg8pl4EurWejsH51Zp/QWmcSVCWYeroCNMq
         zAQiJ6shQideYDWvS9pAc8jyRHRyxByHM/NSS9Ftgvp3hRiaMQvDmKEKeISJlOgCB2UL
         nK9g+zLf17+78eQcQ4EN0JQHoJSydTRzjd7ttufieHWPIxPBO/Sxfcrc/MczkRdH/AU9
         8vwr5zXQYeYiuHsSLtzQDiUY+nJTM3Y/yL9GSYkR2xlsRqz54KMpQhh2719l12Pwybqx
         OTqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17si11342727eji.168.2019.05.22.09.28.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 May 2019 09:28:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:47554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hTU5w-0000ni-An
	for alex.bennee@linaro.org; Wed, 22 May 2019 12:28:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hTU3B-0006fi-Qq
	for qemu-arm@nongnu.org; Wed, 22 May 2019 12:25:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hTU3A-0002Cs-MT
	for qemu-arm@nongnu.org; Wed, 22 May 2019 12:25:09 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2222 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hTU3A-000270-2S; Wed, 22 May 2019 12:25:08 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 0CEED676E2640AC55D0D;
	Thu, 23 May 2019 00:25:03 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.439.0; Thu, 23 May 2019 00:24:24 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>
Date: Wed, 22 May 2019 17:22:52 +0100
Message-ID: <20190522162252.28568-9-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190522162252.28568-1-shameerali.kolothum.thodi@huawei.com>
References: <20190522162252.28568-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH v5 8/8] hw/arm: Use GED for system_powerdown event
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
	linuxarm@huawei.com, xuwei5@hisilicon.com,
	shannon.zhaosl@gmail.com, sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JvrC6654H72f

Use GED for system_powerdown event instead of GPIO for ACPI.
Guest boot with DT still uses GPIO.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/virt-acpi-build.c | 37 +------------------------------------
 hw/arm/virt.c            |  7 +++----
 2 files changed, 4 insertions(+), 40 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index ed8e0cee3a..f23b276d77 100644
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
@@ -761,9 +729,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
@@ -774,8 +741,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                                  AML_SYSTEM_MEMORY);
     }
 
-    acpi_dsdt_add_power_button(scope);
-
     aml_append(dsdt, scope);
 
     /* copy AML table into ACPI tables blob and patch header there */
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8dfd7537b9..bb83160888 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -525,7 +525,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms, qemu_irq *pic)
 {
     DeviceState *dev;
     int irq = vms->irqmap[VIRT_ACPI_GED];
-    uint32_t event = ACPI_GED_MEM_HOTPLUG_EVT;
+    uint32_t event = ACPI_GED_MEM_HOTPLUG_EVT | ACPI_GED_PWR_DOWN_EVT;
 
     dev = DEVICE(object_new(TYPE_ACPI_GED));
     qdev_prop_set_uint64(dev, "memhp-base",
@@ -1710,12 +1710,11 @@ static void machvirt_init(MachineState *machine)
 
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


