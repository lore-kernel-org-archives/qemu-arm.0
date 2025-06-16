Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1741504njc;
        Mon, 16 Jun 2025 02:51:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJrkLxtTYe6Ed70mhJMg8CCKdszJ5SEIoC0/OJNVEEtjKVIvC5SX2GqfzMuF08yEfeZ2G6ZhZCJdn33Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFJYGs/oifdqhwc3OxsAjrHiOCIAZZaxYirUWkHQIBFtcezTtxnuAjY9lYShqSj3vvvj6o2
X-Received: by 2002:a05:620a:2a03:b0:7d3:8df8:cc04 with SMTP id af79cd13be357-7d3c6cc98efmr1351732185a.35.1750067492957;
        Mon, 16 Jun 2025 02:51:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067492; cv=none;
        d=google.com; s=arc-20240605;
        b=hVSoDbIzVDJFBU5GdTxFfaJsSUIZVDoP41he5UyB2m7JBZtMieCQu3aplP/iDu0xff
         kxLJ3o4fgQOH98hz62YsSn+jmNIq4wk7PrcoFk71wPOAsEnw+W6jsAtbEUkjdqgxFPXy
         M2r/SmtuAWwlvzEPI/bvrS6iSJTdioVu36ij+C9K9uMfoFmqV5Uc8YM3YHN9seQxJJ2+
         /s7CDmhbIW15uT/cEnB6rmGHlHGCYgYTavuxbtsRmUsVqfX07YdKE89d3uOBnPP3Lti7
         vVmFtl66D4Uq2GdzE4ofBJAiNzj6yrUnfY0NfR2r0hetS0TFDctuXZxQYQAhdEA4qJW4
         6gZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EgusPM07kBAeHWD5Y+8x0seUuXzRUdXP54zjL+CPYiQ=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=BLU4hKIDs38B8rdEW65GO2fGRy/uWYp3m+qOvGBzMQIvYpQJPKWOapj7wRZbfGOiDN
         R5tcAgpV+543YtTLsIGhUtbJFLMTlKc7rVUbqXXPq62N+tdhLzxjq+LBmTZfkMaFX8r3
         k4BphxFgpRMLO9W9czHV8JRoX7ZfyTJZcV1HoqPJPdlwNjPME621zqnNbdJNb/k7yBAK
         GiajKYPeXAsAExr+rTNUgXASDzk9rBkJVbl3aZe9FWDpt1GZCyjzVK191cKBSVuO0iOz
         qzvNnRxLAUxkdXBTqrkfOcQj4g4kHC8rhnZdQw7UpIx5goj+SkDAnnBU5awxWcam6s1n
         33WA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NuNCwo8l;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8ef5349si947698285a.395.2025.06.16.02.51.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:51:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NuNCwo8l;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EgusPM07kBAeHWD5Y+8x0seUuXzRUdXP54zjL+CPYiQ=;
	b=NuNCwo8l8SMS6uBdUZAbiBANSJGPIBWbWGHyGwwCXVtrqSy6hvEOwQb76H8B2qem0Zpfab
	AgyI6oA62c3e0cN5ViTVAnf6qkm2w4HZ7WnvYhZluyvCCUGR1ToBK6dx2/4ibJgNhUDTnQ
	sS60gWLKq6dCxJACrEyZsQtepMmafDI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-49-FPMA6zpvO2q2B5DDV8wauA-1; Mon,
 16 Jun 2025 05:51:31 -0400
X-MC-Unique: FPMA6zpvO2q2B5DDV8wauA-1
X-Mimecast-MFC-AGG-ID: FPMA6zpvO2q2B5DDV8wauA_1750067490
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EEACD1809C81;
	Mon, 16 Jun 2025 09:51:29 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9852B19560A7;
	Mon, 16 Jun 2025 09:51:25 +0000 (UTC)
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
Subject: [PATCH v3 26/29] hw/arm/virt: Plug pcihp hotplug/hotunplug callbacks
Date: Mon, 16 Jun 2025 11:46:55 +0200
Message-ID: <20250616094903.885753-27-eric.auger@redhat.com>
In-Reply-To: <20250616094903.885753-1-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: SgtmAgIyShBe

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v2 -> v3:
- fix cohabitation with virtio-mem-pci device and tested
  hotplug/unplug of this latter (Igor)
---
 hw/arm/virt.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 69 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8c882e0794..06b87e1050 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1747,6 +1747,22 @@ static void virt_build_smbios(VirtMachineState *vms)
     }
 }
 
+static AcpiPciHpState *get_acpi_pcihp_state(VirtMachineState *vms)
+{
+    AcpiGedState *acpi_ged_state;
+    AcpiPciHpState *pcihp_state;
+
+    if (!vms->acpi_dev) {
+        return NULL;
+    }
+    acpi_ged_state = ACPI_GED(vms->acpi_dev);
+    pcihp_state = &acpi_ged_state->pcihp_state;
+    if (pcihp_state->use_acpi_hotplug_bridge) {
+        return pcihp_state;
+    }
+    return NULL;
+}
+
 static
 void virt_machine_done(Notifier *notifier, void *data)
 {
@@ -2907,6 +2923,13 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
 {
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
 
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        if (get_acpi_pcihp_state(vms)) {
+            acpi_pcihp_device_pre_plug_cb(HOTPLUG_HANDLER(vms->acpi_dev),
+                                          dev, errp);
+        }
+    }
+
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
         virt_memory_pre_plug(hotplug_dev, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
@@ -2961,6 +2984,15 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
         }
     }
 
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        AcpiPciHpState *pcihp_state = get_acpi_pcihp_state(vms);
+
+        if (pcihp_state) {
+            acpi_pcihp_device_plug_cb(HOTPLUG_HANDLER(vms->acpi_dev),
+                                      pcihp_state, dev, errp);
+        }
+    }
+
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
         virt_memory_plug(hotplug_dev, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
@@ -3017,12 +3049,27 @@ out:
 static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
                                           DeviceState *dev, Error **errp)
 {
+    bool supported = false;
+
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
         virt_dimm_unplug_request(hotplug_dev, dev, errp);
+        supported = true;
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
         virtio_md_pci_unplug_request(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev),
                                      errp);
-    } else {
+        supported = true;
+    }
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+        AcpiPciHpState *pcihp_state = get_acpi_pcihp_state(vms);
+
+        if (pcihp_state) {
+            acpi_pcihp_device_unplug_request_cb(HOTPLUG_HANDLER(vms->acpi_dev),
+                                                pcihp_state, dev, errp);
+            supported = true;
+        }
+    }
+    if (!supported) {
         error_setg(errp, "device unplug request for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
     }
@@ -3031,11 +3078,27 @@ static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
 static void virt_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
                                           DeviceState *dev, Error **errp)
 {
+    bool supported = false;
+
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
         virt_dimm_unplug(hotplug_dev, dev, errp);
+        supported = true;
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
         virtio_md_pci_unplug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
-    } else {
+        supported = true;
+    }
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+
+        AcpiPciHpState *pcihp_state = get_acpi_pcihp_state(vms);
+
+        if (pcihp_state) {
+            acpi_pcihp_device_unplug_cb(HOTPLUG_HANDLER(vms->acpi_dev),
+                                        pcihp_state, dev, errp);
+            supported = true;
+        }
+    }
+    if (!supported) {
         error_setg(errp, "virt: device unplug for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
     }
@@ -3045,11 +3108,14 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
                                                         DeviceState *dev)
 {
     MachineClass *mc = MACHINE_GET_CLASS(machine);
+    VirtMachineState *vms = VIRT_MACHINE(machine);
 
     if (device_is_dynamic_sysbus(mc, dev) ||
         object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI) ||
-        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI) ||
+        (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE) &&
+                             get_acpi_pcihp_state(vms))) {
         return HOTPLUG_HANDLER(machine);
     }
     return NULL;
-- 
2.49.0
