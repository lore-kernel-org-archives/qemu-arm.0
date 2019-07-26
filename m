Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11750344wrv;
        Fri, 26 Jul 2019 03:48:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyZ7WwKyc3tSzedBTEioG1uRqAgsj/6SiAYjqnk0gt0Gkutx1XDE33MIibaoSRTf8pikPq9
X-Received: by 2002:a17:906:81cb:: with SMTP id e11mr71189961ejx.37.1564138080408;
        Fri, 26 Jul 2019 03:48:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564138080; cv=none;
        d=google.com; s=arc-20160816;
        b=0754IbS/Zu0EO9fnnSmz8dWJzNmV1gcttGoNiYGLYp02YQWwWsqYkCrnpsLuDFEvbm
         Nq1bGyNXu9yqNkl0vexxcCn33UjTxRyzLp5HVc1Hw7STIjqUiQogf8qL7cLn/eS+yCim
         NnG5WBgUlQC1kAgjc4pktygC7zpvuSMOZtBG7jHafylVYR7r9ukiWWcSTHIN23sgS0TC
         JTXrmVqG+RZdFZYT7RVJ1qtARb/PDuY+j1ePp/Kf+f6BwYfvP0j35pjV1XUssH/QibsW
         YwxJ5AjAYwsj74ES/3LuXDm3J1dgbcjCmmtb2XLv/rftSMXZijJrHQWhXaR30aoui5qc
         IKng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=a3WcM1zWIiZpcOkCenZL1JNKr5ezn59ob7s9u8kx38s=;
        b=QPoRxKOachmYDzsvDD+5M4QnEcXnANJjdddioRSVPX/AiRf+KJGPCezAuq/NAk4xLw
         8jFbow8JUREArFAV+Hv5mnbxsw0xFUMGQ0BITRcVTlbIUOITuacaqiWgTbUihSkamTNP
         B0fXj8TdOyghuRncPRVdZqJcYXP+iTwOEuVlLUqe/7vbdkHpA42g7yo/TDTJCKc/qlBG
         QibtXhtvdcSFeD4NB76zBiaRwzM2Z5OnUgBVR/MXO5pkoyRdbd/KxFDKohCZbRxcLa2y
         EossnD7rJtl+aeoIi2AIPxCcw5rClQiaL9UaQMr59C40HJFSJ8uQfRD61Ppy6BMvGQe9
         vmaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j17si10900290ejt.83.2019.07.26.03.48.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 03:48:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqxlW-0002cW-4K
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 06:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43436)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hqxkl-0008Lg-Oc
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 06:47:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hqxke-00071r-Vs
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 06:47:08 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2243 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hqxkX-0006on-CY; Fri, 26 Jul 2019 06:46:59 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4964D8CBD32DD9E3B5DA;
 Fri, 26 Jul 2019 18:46:46 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Fri, 26 Jul 2019 18:46:36 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Fri, 26 Jul 2019 11:45:19 +0100
Message-ID: <20190726104519.23812-10-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190726104519.23812-1-shameerali.kolothum.thodi@huawei.com>
References: <20190726104519.23812-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH-for-4.2 v8 9/9] hw/arm: Use GED for
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
X-TUID: dh41/iVcRiS3

For machines 4.2 or higher with ACPI boot use GED for system_powerdown
event instead of GPIO. Guest boot with DT still uses GPIO.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
v7 --> v8
 -Retained gpio based system_powerdown support for machines < 4.2.
 -Reuse of virt_powerdown_req() for ACPI GED use.
 -Dropped Eric's R-by for now because of above.

---
 hw/acpi/generic_event_device.c       |  2 ++
 hw/arm/virt-acpi-build.c             |  6 +++---
 hw/arm/virt.c                        | 27 ++++++++++++++++-----------
 include/hw/acpi/acpi_dev_interface.h |  1 +
 include/hw/arm/virt.h                |  1 +
 5 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 0b3214eff4..f00b0ab14b 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -205,6 +205,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 
     if (ev & ACPI_MEMORY_HOTPLUG_STATUS) {
         sel = ACPI_GED_MEM_HOTPLUG_EVT;
+    } else if (ev & ACPI_POWER_DOWN_STATUS) {
+        sel = ACPI_GED_PWR_DOWN_EVT;
     } else {
         /* Unknown event. Return without generating interrupt. */
         warn_report("GED: Unsupported event %d. No irq injected", ev);
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 75657caa36..31bf2bf775 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -49,7 +49,6 @@
 #include "kvm_arm.h"
 
 #define ARM_SPI_BASE 32
-#define ACPI_POWER_BUTTON_DEVICE "PWRB"
 
 static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
 {
@@ -739,12 +738,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                     (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
     acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE),
                       vms->highmem, vms->highmem_ecam);
-    acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
-                       (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
     if (vms->acpi_dev) {
         build_ged_aml(scope, "\\_SB."GED_DEVICE,
                       HOTPLUG_HANDLER(vms->acpi_dev),
                       irqmap[VIRT_ACPI_GED] + ARM_SPI_BASE, AML_SYSTEM_MEMORY);
+    } else {
+        acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
+                           (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
     }
 
     if (vms->acpi_dev && ms->ram_slots) {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 41386a6eb7..73a758d9a9 100644
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
@@ -784,13 +784,15 @@ static void create_rtc(const VirtMachineState *vms, qemu_irq *pic)
 static DeviceState *gpio_key_dev;
 static void virt_powerdown_req(Notifier *n, void *opaque)
 {
-    /* use gpio Pin 3 for power button event */
-    qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);
-}
+    VirtMachineState *s = container_of(n, VirtMachineState, powerdown_notifier);
 
-static Notifier virt_system_powerdown_notifier = {
-    .notify = virt_powerdown_req
-};
+    if (s->acpi_dev) {
+        acpi_send_event(s->acpi_dev, ACPI_POWER_DOWN_STATUS);
+    } else {
+        /* use gpio Pin 3 for power button event */
+        qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);
+    }
+}
 
 static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
 {
@@ -833,9 +835,6 @@ static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
     qemu_fdt_setprop_cells(vms->fdt, "/gpio-keys/poweroff",
                            "gpios", phandle, 3, 0);
 
-    /* connect powerdown request */
-    qemu_register_powerdown_notifier(&virt_system_powerdown_notifier);
-
     g_free(nodename);
 }
 
@@ -1721,12 +1720,18 @@ static void machvirt_init(MachineState *machine)
 
     create_pcie(vms, pic);
 
-    create_gpio(vms, pic);
 
     if (has_ged && aarch64 && firmware_loaded && acpi_enabled) {
         vms->acpi_dev = create_acpi_ged(vms, pic);
+    } else {
+        create_gpio(vms, pic);
     }
 
+    /* connect powerdown request */
+    vms->powerdown_notifier.notify = virt_powerdown_req;
+    qemu_register_powerdown_notifier(&vms->powerdown_notifier);
+
+
     /* Create mmio transports, so the user can create virtio backends
      * (which will be automatically plugged in to the transports). If
      * no backend is created the transport will just sit harmlessly idle.
diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
index 43ff119179..adcb3a816c 100644
--- a/include/hw/acpi/acpi_dev_interface.h
+++ b/include/hw/acpi/acpi_dev_interface.h
@@ -11,6 +11,7 @@ typedef enum {
     ACPI_MEMORY_HOTPLUG_STATUS = 8,
     ACPI_NVDIMM_HOTPLUG_STATUS = 16,
     ACPI_VMGENID_CHANGE_STATUS = 32,
+    ACPI_POWER_DOWN_STATUS = 64,
 } AcpiEventStatusBits;
 
 #define TYPE_ACPI_DEVICE_IF "acpi-device-interface"
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 577ee49b4b..0b41083e9d 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -137,6 +137,7 @@ typedef struct {
     int psci_conduit;
     hwaddr highest_gpa;
     DeviceState *acpi_dev;
+    Notifier powerdown_notifier;
 } VirtMachineState;
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
-- 
2.17.1


