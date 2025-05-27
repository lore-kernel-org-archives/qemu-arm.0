Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4648240njc;
        Tue, 27 May 2025 00:44:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUv2vC2F6oyg3mRSaNy7DZawmXEiQZ4XSntgpJbWfELGPiTywYL16GBDOv8LT/6k5VQPXoRuo7BmsjiPw==@linaro.org
X-Google-Smtp-Source: AGHT+IGhVNHk5sNPlF+5UlN1b1Yfxhw8jHuY4NkUoPh4uAq+lTaXOoSm33J044B413ci0Vc/OVsM
X-Received: by 2002:a05:620a:40d6:b0:7c7:a543:dcfe with SMTP id af79cd13be357-7ceecb96784mr1601124685a.32.1748331875353;
        Tue, 27 May 2025 00:44:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748331875; cv=none;
        d=google.com; s=arc-20240605;
        b=iZqHJARHivyKiGz3qRdtU1qKVTj6VwK8QTDXsBsRU26VfO01tHNGugHTou/nBcu25G
         y4c7mlexmUiY9PLAr4cwZw/A9ZcjDmEgg5YjIMIstLNDsJTDNaWaJoNYdAFOIim+N5ip
         rt92fiwg8Qhr2s/lHtSvMj0llfTzjIdHv/lJAESTWjy7S1eKo/LlG9lgpl6Hrmkz/6/g
         Dkx21GzzHCiqnXU2ubGbhfkaGvKWGMTsHo3n1wWr/WpskheZ91AQEFPswLZHDyen4US+
         Ibso9dkQyhhd+asZfesApYYcoX+S01yjLslixFEzjqZEtkG5gofPRkDvXTTizUUvJb6B
         0DtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zdU5cY/SULLwyXpxxEZqK8ZNb0hepj4gkwMPt3FqJ10=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=cT8M+tf1zmrpQPkVy/nC0QnsAs+6vEA5Iieii7UeifSZbledjvP1MH7sz3YKYZYqaI
         dBxJfL7E4LbXgSAs3aXYQoWHHr/AXBWd/R4vEkqEgPp80jLSM96+LtFS2Nx0jeyjGb9I
         X6ujHhndPh/zQXKSGUjo1Yk+2jikM1w68goyQ3vXX8LAnAm7CF15yC3BbOm4r0iiyrCX
         vYKKDSg/dbhGlLqiVIxRfCClNm2Nin5fwmRtQZFoY5/ZqZNYZHF7SYLMfUPeSe/g8QQ6
         dF+dH8ioPwdFjRDRyz+ylWKS9RrNjij0fe9/dGa/FqcG0N8nqNqDHyIBTciwxQH4HS4O
         PVUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="M4Jd7/+A";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cd468f20a2si2576242885a.647.2025.05.27.00.44.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:44:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="M4Jd7/+A";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748331875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zdU5cY/SULLwyXpxxEZqK8ZNb0hepj4gkwMPt3FqJ10=;
	b=M4Jd7/+AV928nAWxLbFaKy/AmCxUXRZ7+2FKDEpS+G4NN+nFWDIbfvDCp9Cx0GLJyiu/PF
	3h9Uqszp2+56fOdtPAZr8sM4bA4ij/c1PdUGZzvZ28I4jQ3cqlgL6SIMqPLUuNGF6HaqEH
	0UYvU2cjI25l6473sLlcSoteZA+SZrY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-376-otcXCW75Ntqxe4srdlj3OQ-1; Tue,
 27 May 2025 03:44:31 -0400
X-MC-Unique: otcXCW75Ntqxe4srdlj3OQ-1
X-Mimecast-MFC-AGG-ID: otcXCW75Ntqxe4srdlj3OQ_1748331870
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AE2BA1956094;
	Tue, 27 May 2025 07:44:29 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 131CE19560AA;
	Tue, 27 May 2025 07:44:24 +0000 (UTC)
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
Subject: [PATCH v2 23/25] hw/arm/virt: Plug pcihp hotplug/hotunplug callbacks
Date: Tue, 27 May 2025 09:40:25 +0200
Message-ID: <20250527074224.1197793-24-eric.auger@redhat.com>
In-Reply-To: <20250527074224.1197793-1-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: fv691XcDxALa

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index cdcff0a984..adb9422e14 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -87,6 +87,7 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
+#include "hw/acpi/pcihp.h"
 
 static GlobalProperty arm_virt_compat[] = {
     { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "48" },
@@ -2973,6 +2974,11 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
         qlist_append_str(reserved_regions, resv_prop_str);
         qdev_prop_set_array(dev, "reserved-regions", reserved_regions);
         g_free(resv_prop_str);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        if (vms->acpi_pcihp) {
+            acpi_pcihp_device_pre_plug_cb(HOTPLUG_HANDLER(vms->acpi_dev),
+                                          dev, errp);
+        }
     }
 }
 
@@ -3002,6 +3008,14 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
         vms->iommu = VIRT_IOMMU_VIRTIO;
         vms->virtio_iommu_bdf = pci_get_bdf(pdev);
         create_virtio_iommu_dt_bindings(vms);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        AcpiGedState *acpi_ged_state = ACPI_GED(vms->acpi_dev);
+        AcpiPciHpState *acpi_pci_hotplug = &acpi_ged_state->pcihp_state;
+
+        if (vms->acpi_pcihp) {
+            acpi_pcihp_device_plug_cb(HOTPLUG_HANDLER(vms->acpi_dev),
+                                      acpi_pci_hotplug, dev, errp);
+        }
     }
 }
 
@@ -3051,6 +3065,15 @@ static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
         virtio_md_pci_unplug_request(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev),
                                      errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+        AcpiGedState *acpi_ged_state = ACPI_GED(vms->acpi_dev);
+        AcpiPciHpState *acpi_pci_hotplug = &acpi_ged_state->pcihp_state;
+
+        if (vms->acpi_pcihp) {
+            acpi_pcihp_device_unplug_request_cb(HOTPLUG_HANDLER(vms->acpi_dev),
+                                                acpi_pci_hotplug, dev, errp);
+        }
     } else {
         error_setg(errp, "device unplug request for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -3064,6 +3087,15 @@ static void virt_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
         virt_dimm_unplug(hotplug_dev, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
         virtio_md_pci_unplug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+        AcpiGedState *acpi_ged_state = ACPI_GED(vms->acpi_dev);
+        AcpiPciHpState *acpi_pci_hotplug = &acpi_ged_state->pcihp_state;
+
+        if (vms->acpi_pcihp) {
+            acpi_pcihp_device_unplug_cb(HOTPLUG_HANDLER(vms->acpi_dev),
+                                        acpi_pci_hotplug, dev, errp);
+        }
     } else {
         error_setg(errp, "virt: device unplug for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -3074,11 +3106,14 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
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
+                             vms->acpi_pcihp)) {
         return HOTPLUG_HANDLER(machine);
     }
     return NULL;
-- 
2.49.0
