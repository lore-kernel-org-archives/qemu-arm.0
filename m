Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1741482njc;
        Mon, 16 Jun 2025 02:51:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXDVguZeK4auzGyMlePPFxUzFLZC62eiYTmowg4496gRgRj3KMjCzX+e5aDgbL0WHnE0Gb8Nk+XlU3kjA==@linaro.org
X-Google-Smtp-Source: AGHT+IE/Wz8jXGFrgzG9F8KDSG4ZI2y/K4gT9boAy5z6rNtkoHKmqh3Xko9+k+PPvjh0Qswg0IXs
X-Received: by 2002:ac8:7d82:0:b0:4a6:f0d0:d4af with SMTP id d75a77b69052e-4a75665d9c6mr740991cf.16.1750067489960;
        Mon, 16 Jun 2025 02:51:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067489; cv=none;
        d=google.com; s=arc-20240605;
        b=N/7d6fhq8IOj5RBck/7qBU1PrXnqBA5FwS8PKv3J1IojPmvh7pcqYXpy43l0vhEjEl
         zmqvay+SBNDBBqNpnln4WCQbzsZwoLFl+J9r2oBiqyXlG9j5lEnaU2XeN/MyXhN5zsMO
         fu8+rmUS8trXs9Yx70s00cUxPaNtsBI0GvYcLOS0zMyYnA5X7MmddM+0izln7wbFbtg3
         eGkVaDWEH4AHBRF4j2yOPKUl9TPmy1HJzypfW00WglwrWmlIqgu12PP72KPIYh7s1895
         pjZMegrqn+fl6g+mw5HdjHS8ZADRhxgl53L8JQ47LsRJMyCZizW4S3dpdIF/CZnLH4/I
         Nenw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oVHzuIYRidgYIUD9KZN7nNTxYJvNEw6p07iuCBsNpMs=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=W07eNPbAu42nhJSBBkGSIdcjnkDRvaKc+/nI2TF52FCKHuwQHEMUyY3Mz2oK8xtY+n
         k4ekMPQD7hye8z2a+nnw9Ik6Dx7JLBvkUxS5lPoIOxQTNBtL4jPy6/Wh0XxvEpqBhELL
         1omE/Zc8TRTLgeX4tB+CLg6+dbH072YsbUPRSO3QFRFXj7IQ0jg/CcUQcWMaQfrG3tZX
         X9J9W3CGoCMr4kwxtgc6VrSaO8ZPumuivvjai59SKwx2xdcetxMjAgwF+uAmlNUe9DPr
         tKtaJNYIMaU1EuIpmcpVEg2SD/RZXik5Y53TgOZjiciDVD7x4smE7FxXN0LTpngTJ2BV
         LU0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A3dYfzB3;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a47d283si92321421cf.283.2025.06.16.02.51.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:51:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A3dYfzB3;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oVHzuIYRidgYIUD9KZN7nNTxYJvNEw6p07iuCBsNpMs=;
	b=A3dYfzB3rIDjxn+yT6p34c4C1s7SfTjpWeTRuQY/J7bkU1gw58jVBfv1EZZ8OCft/3qjqz
	p8rWqiUxxxoUZh8DwHfdYerIxnUdkjYhSKJGCXLQDyqSEDIJQQNE93Nzs70HTLli3twwwq
	GjVQUGYvSgySDC3SHFyDcB7bX4S5stM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-552-yLhohCDsOHi-_2ztyxENuw-1; Mon,
 16 Jun 2025 05:51:26 -0400
X-MC-Unique: yLhohCDsOHi-_2ztyxENuw-1
X-Mimecast-MFC-AGG-ID: yLhohCDsOHi-_2ztyxENuw_1750067485
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 32E571800281;
	Mon, 16 Jun 2025 09:51:25 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 418C419560AB;
	Mon, 16 Jun 2025 09:51:19 +0000 (UTC)
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
Subject: [PATCH v3 25/29] hw/arm/virt: Let virt support pci hotplug/unplug GED event
Date: Mon, 16 Jun 2025 11:46:54 +0200
Message-ID: <20250616094903.885753-26-eric.auger@redhat.com>
In-Reply-To: <20250616094903.885753-1-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: NcoG7PXW2RmL

Set up the IO registers used to communicate between QEMU
and ACPI.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v2 -> v3:
- remove acpi_ged_state->pcihp_state.use_acpi_hotplug_bridge = true;
- use sysbus_mmio_map_name for all regs (Igor)
- create_pcie left at its original place

v1 -> v2:
- use ACPI_PCIHP_REGION_NAME
---
 include/hw/acpi/generic_event_device.h |  1 +
 hw/arm/virt.c                          | 19 +++++++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index ec8e1abe0a..8f5d903146 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -111,6 +111,7 @@ typedef struct GEDState {
 } GEDState;
 
 #define ACPI_PCIHP_REGION_NAME "pcihp container"
+#define ACPI_MEMHP_REGION_NAME "memhp container"
 
 struct AcpiGedState {
     SysBusDevice parent_obj;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 41be8f6dbb..8c882e0794 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -684,6 +684,8 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
     DeviceState *dev;
     MachineState *ms = MACHINE(vms);
     SysBusDevice *sbdev;
+    AcpiGedState *acpi_ged_state;
+    AcpiPciHpState *pcihp_state;
     int irq = vms->irqmap[VIRT_ACPI_GED];
     uint32_t event = ACPI_GED_PWR_DOWN_EVT;
 
@@ -696,13 +698,26 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
     }
 
     dev = qdev_new(TYPE_ACPI_GED);
+    acpi_ged_state = ACPI_GED(dev);
+    pcihp_state = &acpi_ged_state->pcihp_state;
+    if (pcihp_state->use_acpi_hotplug_bridge) {
+        event |= ACPI_GED_PCI_HOTPLUG_EVT;
+    }
     qdev_prop_set_uint32(dev, "ged-event", event);
     object_property_set_link(OBJECT(dev), "bus", OBJECT(vms->bus), &error_abort);
     sbdev = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(sbdev, &error_fatal);
 
-    sysbus_mmio_map(sbdev, 0, vms->memmap[VIRT_ACPI_GED].base);
-    sysbus_mmio_map(sbdev, 1, vms->memmap[VIRT_PCDIMM_ACPI].base);
+    sysbus_mmio_map_name(sbdev, TYPE_ACPI_GED, vms->memmap[VIRT_ACPI_GED].base);
+    sysbus_mmio_map_name(sbdev, ACPI_MEMHP_REGION_NAME,
+                         vms->memmap[VIRT_PCDIMM_ACPI].base);
+    if (pcihp_state->use_acpi_hotplug_bridge) {
+        int pcihp_region_index;
+
+        pcihp_region_index = sysbus_mmio_map_name(sbdev, ACPI_PCIHP_REGION_NAME,
+                                                  vms->memmap[VIRT_ACPI_PCIHP].base);
+        assert(pcihp_region_index >= 0);
+    }
     sysbus_connect_irq(sbdev, 0, qdev_get_gpio_in(vms->gic, irq));
 
     return dev;
-- 
2.49.0
