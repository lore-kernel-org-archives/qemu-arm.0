Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4648272njc;
        Tue, 27 May 2025 00:44:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUg0amkPlKxb7HPv1PkUWO79oZwVRs7fAIe2UqTiEINEYBFF/0gqz9c12J1AqS4a816CZL1eaHYmN+46A==@linaro.org
X-Google-Smtp-Source: AGHT+IHf+fk/xp+c+Wasro+RBFM8PtIHorIQqcJzPVCdq+BECz+r0IApbpEaOhzBelZfxU8mlb8m
X-Received: by 2002:a05:620a:4888:b0:7ce:d95d:d4d with SMTP id af79cd13be357-7ceec4b9390mr1862818285a.28.1748331869707;
        Tue, 27 May 2025 00:44:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748331869; cv=none;
        d=google.com; s=arc-20240605;
        b=e7xPxTSrDjNL5YmV0KKjyCwb/GFqXo13j9Yq3QUyvQzl6/Iv5k2rYO787/OZm+rK1l
         rCTJ4aRX82McseHJ6Vu6znrVL5axcm0gasANUuwsFV/GNPr9huysvoQAXynb4YRZQTQN
         xMlUCujAicgQ4TfdaiXnxBHCzlbM8iob0rVGzMfTfeLEUFYFixrNYhiKR8zrDisjzxZc
         jOAwbxyyMLvTVZdodQHU6Rerf6e9neMQyWRY+WPx2GOUZw/tFKjVl9CMgALRzNTQU5RL
         sPR096tQGH5dLfr5UE8SE8tsdvvHSH5fb54NL4aEIWgMe40iXzgcPQqzhH+rV2gal92c
         EptQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=j6/uzGWbGDZwyQh1Lvxs0t6hnyuw9d53fAt8PHG455o=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=RIPR2g7rWLDpuWlD6zMq/pYpLHwyL3oMT5otH9uRNVg9skxlDym6cN2dB3gZGNUnkC
         AcU/P7H5imCrHn0VGW1aFeAl3Q9SYuGTQ1J2YkGcYekhbB+TFP5GFmxhK1FGkoI0W49O
         T9JsJHLJj+uZoqAJ+JPjmVeJ4GotL1xLJZlZ3eUI+VjGYzeqs9AHH4h8/exbtmdQrFoP
         AeyI5MpPqkDdcXwX3I2iCdMnZTGD9m9Zu4X8IWKyTbSJ8wF0JZFAgN3D+RVGx0oYfM7+
         uNnuU0foK+0auEZhHDs0oTwNtc16wuWyufVGkmCaCVrhJkD9Kl8JhdBsxcMI64xuMqly
         WE1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EcJP3FTg;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cd468f310csi2165587885a.644.2025.05.27.00.44.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:44:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EcJP3FTg;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748331869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j6/uzGWbGDZwyQh1Lvxs0t6hnyuw9d53fAt8PHG455o=;
	b=EcJP3FTgj2wXwiBLQemCR/iGUOXqLSq9yNSRPHS2JFKLdP+bVVk/MhjJEHltf1lQKe+gwl
	2TNYiw/BZXpT9cnLbiIlyqWr9AYGuwxKPVbNCGecXc2YszItlrw732J5OBPTUc0yHLXv3m
	pdiyKo8gEEHnL1NvHpJTQlmGoY4eTg4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-487-LqixfHRnPZKiDLYII8aNcQ-1; Tue,
 27 May 2025 03:44:25 -0400
X-MC-Unique: LqixfHRnPZKiDLYII8aNcQ-1
X-Mimecast-MFC-AGG-ID: LqixfHRnPZKiDLYII8aNcQ_1748331864
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 833CF18004A7;
	Tue, 27 May 2025 07:44:24 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BD78119560AA;
	Tue, 27 May 2025 07:44:19 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	gustavo.romero@linaro.org,
	anisinha@redhat.com,
	mst@redhat.com,
	shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 22/25] hw/arm/virt: Let virt support pci hotplug/unplug GED event
Date: Tue, 27 May 2025 09:40:24 +0200
Message-ID: <20250527074224.1197793-23-eric.auger@redhat.com>
In-Reply-To: <20250527074224.1197793-1-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: b3aEzBXMOy5D

Set up the IO registers used to communicate between QEMU
and ACPI.

Move the create_pcie() call after the creation of the acpi
ged device since hotplug callbacks will soon be called on gpex
realize and will require the acpi pcihp state to be initialized.

The hacky thing is the root bus has not yet been created on
acpi_pcihp_init() call so it is set later after the gpex realize.

How to fix this chicken & egg issue?

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v1 -> v2:
- use ACPI_PCIHP_REGION_NAME
---
 include/hw/arm/virt.h    |  1 +
 hw/arm/virt-acpi-build.c |  1 +
 hw/arm/virt.c            | 42 +++++++++++++++++++++++++++++++++++-----
 3 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 1b2e2e1284..a4c4e3a67a 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -35,6 +35,7 @@
 #include "hw/boards.h"
 #include "hw/arm/boot.h"
 #include "hw/arm/bsa.h"
+#include "hw/acpi/pcihp.h"
 #include "hw/block/flash.h"
 #include "system/kvm.h"
 #include "hw/intc/arm_gicv3_common.h"
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 9d88ffc318..cd49f67d60 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -44,6 +44,7 @@
 #include "hw/acpi/generic_event_device.h"
 #include "hw/acpi/tpm.h"
 #include "hw/acpi/hmat.h"
+#include "hw/acpi/pcihp.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4aa40c8e8b..cdcff0a984 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -682,6 +682,8 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
 {
     DeviceState *dev;
     MachineState *ms = MACHINE(vms);
+    SysBusDevice *sbdev;
+
     int irq = vms->irqmap[VIRT_ACPI_GED];
     uint32_t event = ACPI_GED_PWR_DOWN_EVT;
 
@@ -693,12 +695,28 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
         event |= ACPI_GED_NVDIMM_HOTPLUG_EVT;
     }
 
+    if (vms->acpi_pcihp) {
+        event |= ACPI_GED_PCI_HOTPLUG_EVT;
+    }
+
     dev = qdev_new(TYPE_ACPI_GED);
     qdev_prop_set_uint32(dev, "ged-event", event);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sbdev = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(sbdev, &error_fatal);
 
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_ACPI_GED].base);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, vms->memmap[VIRT_PCDIMM_ACPI].base);
+    sysbus_mmio_map(sbdev, 0, vms->memmap[VIRT_ACPI_GED].base);
+    sysbus_mmio_map(sbdev, 1, vms->memmap[VIRT_PCDIMM_ACPI].base);
+    if (vms->acpi_pcihp) {
+        AcpiGedState *acpi_ged_state = ACPI_GED(dev);
+        int i;
+
+        i = sysbus_mmio_map_name(sbdev, ACPI_PCIHP_REGION_NAME,
+                                 vms->memmap[VIRT_ACPI_PCIHP].base);
+        assert(i >= 0);
+        acpi_pcihp_init(OBJECT(dev), &acpi_ged_state->pcihp_state,
+                        vms->bus, sysbus_mmio_get_region(sbdev, i), 0);
+        acpi_ged_state->pcihp_state.use_acpi_hotplug_bridge = true;
+    }
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, qdev_get_gpio_in(vms->gic, irq));
 
     return dev;
@@ -1758,6 +1776,13 @@ void virt_machine_done(Notifier *notifier, void *data)
     pci_bus_add_fw_cfg_extra_pci_roots(vms->fw_cfg, vms->bus,
                                        &error_abort);
 
+
+    if (vms->acpi_pcihp) {
+        AcpiGedState *acpi_ged_state = ACPI_GED(vms->acpi_dev);
+
+        acpi_pcihp_reset(&acpi_ged_state->pcihp_state);
+    }
+
     virt_acpi_setup(vms);
     virt_build_smbios(vms);
 }
@@ -2395,8 +2420,6 @@ static void machvirt_init(MachineState *machine)
 
     create_rtc(vms);
 
-    create_pcie(vms);
-
     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
         vms->acpi_pcihp &= !vmc->no_acpi_pcihp;
         vms->acpi_dev = create_acpi_ged(vms);
@@ -2405,6 +2428,15 @@ static void machvirt_init(MachineState *machine)
         create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
 
+    create_pcie(vms);
+
+    if (vms->acpi_dev) {
+        AcpiGedState *acpi_ged_state = ACPI_GED(vms->acpi_dev);
+
+        acpi_ged_state = ACPI_GED(vms->acpi_dev);
+        acpi_ged_state->pcihp_state.root = vms->bus;
+    }
+
     if (vms->secure && !vmc->no_secure_gpio) {
         create_gpio_devices(vms, VIRT_SECURE_GPIO, secure_sysmem);
     }
-- 
2.49.0
