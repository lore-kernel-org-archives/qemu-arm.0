Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp2089971wrm;
        Sat, 5 Oct 2019 15:08:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyB4AWiU/vFlAC489vWhRNeyKwb0ykYmh0W6fI+/UO5ij5idVDenomPmQl71Y1XjuXOUMmw
X-Received: by 2002:a50:dac2:: with SMTP id s2mr22302030edj.26.1570313323138;
        Sat, 05 Oct 2019 15:08:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570313323; cv=none;
        d=google.com; s=arc-20160816;
        b=i+rIQX1V4FmEdaRO9GIJ3FMRWxvnFKRb8zRCI+SYfNhU6GCgT4+zpZnFZq/Fb9MqEM
         ZYOyEheo8YeczIItn+dtVJuNUQYI4xKrPA9cm+AHHif6K8xQGc8nP0UgutYx/KFbUlgq
         yw1Cl84bAyMDmS04vQPS//95SXZ7ZRE3zVnpogiSTzkI5cANnNUlARxzie49rPqKDosO
         +Wr2mg0Yz7RNIX/xNs7973KBNmkYM/pQ+2eertsti0PyRa7wH0oAgA5gyWgXq6q1gBCt
         3nktksfkuVaiRvFdY/4A595LxvxG80cJ34GmNXy7in/EQC+8BnMIlVgzyLld3STD1ZgD
         ZCDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date;
        bh=M4UqI1578TDNKUmGQVC+AVWWLAZH6B24Ei5TJLsuvR4=;
        b=F7pXFuUZvZf/b8WaFo5H4KNHNuv9dYOpGXyQl5lmKRnr8gr5gcgFN3yurNt1MO+0SG
         OtK3H6K6VQ5BXTfoKn//GDN+tUC0+Rh48sx8Q106v3q0Cs949CUGSX9tm1DyCQchPjic
         Un4qxsHBCmzU5gW2lhH+5HjPneoXLFDO13bTrA70uLx2gGuQ4YsjEmSZsoBL1F7EEPe6
         FA0AR4KMQ6fk48o/Ma+/0tVfo587mEY7cvxP+Zg1q5oOpnTLOuisJCN6k89XOQ8RhSzj
         52GYhQUj2NIwCSS1U0UAYfkINh1hTX2asLfsshfJ/wvJIpGCDQYNBX6yyf/JqM4SSYD7
         TeyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jo19si5234165ejb.271.2019.10.05.15.08.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Oct 2019 15:08:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGsED-0004lo-DU
	for alex.bennee@linaro.org; Sat, 05 Oct 2019 18:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47929)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iGs5O-0005Cb-3z
 for qemu-arm@nongnu.org; Sat, 05 Oct 2019 17:59:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iGs5J-0004Pd-Ux
 for qemu-arm@nongnu.org; Sat, 05 Oct 2019 17:59:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41234)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iGs5I-0004P8-PS
 for qemu-arm@nongnu.org; Sat, 05 Oct 2019 17:59:29 -0400
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C29DD8D0F8
 for <qemu-arm@nongnu.org>; Sat,  5 Oct 2019 21:59:27 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id k67so10705160qkc.3
 for <qemu-arm@nongnu.org>; Sat, 05 Oct 2019 14:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M4UqI1578TDNKUmGQVC+AVWWLAZH6B24Ei5TJLsuvR4=;
 b=hkb7q1zz3778cEXfr3WACdbuVy8ZICvr3LJ2GfwN2l5jzHDKsOrKh7b3AgJHC1J9Mu
 bS/Ug8z1aBmfkibJRD3Pi1VOb0BY2qcBn4beDcn/ErsFMAaZVhr6zz+Rym1L4l1y0X5S
 gBup0s3kGRJEd534PfYgcBwcIow8r8dSPntIUvEiyxw9pZsrV8VJtK7L76cinbsVGkX3
 Mavmw112/lqSfsXUVsvoIKKMyECwMrgipd7p3FloHgxRtfgqKBBhgb1bCQG8bZvMXIYq
 LMGFZgxd6hiTU2X67fZYvFz6TYR3lFC1EBEz59McYLfEPHuW5GF0d5abTMlUyDc+oX/k
 Ak6Q==
X-Gm-Message-State: APjAAAW+XiQyJRypZq4yDr0NlP65UFIkaPlIMZMs55sZbqaxWELqvBTj
 nCkAGVKtfnBJ0J/LtYwa0LxUyaEooezSvu40QkA36V6/2EBLusAniYvg3Y6yYT1HdI6Qo4xqNlp
 mHe9YnaMIYcf+
X-Received: by 2002:a0c:b0cb:: with SMTP id p11mr20911246qvc.216.1570312767011; 
 Sat, 05 Oct 2019 14:59:27 -0700 (PDT)
X-Received: by 2002:a0c:b0cb:: with SMTP id p11mr20911230qvc.216.1570312766702; 
 Sat, 05 Oct 2019 14:59:26 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
 by smtp.gmail.com with ESMTPSA id
 f21sm4741562qkl.51.2019.10.05.14.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Oct 2019 14:59:26 -0700 (PDT)
Date: Sat, 5 Oct 2019 17:59:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/19] hw/arm: Use GED for system_powerdown event
Message-ID: <20190918130633.4872-9-shameerali.kolothum.thodi@huawei.com>
References: <20191005215508.28754-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191005215508.28754-1-mst@redhat.com>
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kcsm3udd6NAj
Message-ID: <20191005215921.M8b4dlLusgi2gFe4nEohH813DeaFIKWg95bnsbs-t-8@z>

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

For machines 4.2 or higher with ACPI boot use GED for system_powerdown
event instead of GPIO. Guest boot with DT still uses GPIO.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20190918130633.4872-9-shameerali.kolothum.thodi@huawei.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST

