Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1339247njb;
        Wed, 14 May 2025 10:06:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUGf/dKXNHxawxk46PZJ5pBEqNO/1qk+1PJhX7sbhZbeOWsN0pqq/8AaBKD82OoU/J6oJ+MOGYYfY4Fuw==@linaro.org
X-Google-Smtp-Source: AGHT+IGhtCev1oijE9KfvTy2RR2y7eHqCybotqFL4r5coYZQfcrLWsxpsnrrxIfoBQ+IulWLVJTu
X-Received: by 2002:a05:6214:f2f:b0:6f5:10b5:cd2d with SMTP id 6a1803df08f44-6f896df94b7mr70662676d6.7.1747242414959;
        Wed, 14 May 2025 10:06:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747242414; cv=none;
        d=google.com; s=arc-20240605;
        b=YdzC8QEhUJxrnIMYLu9NDsqzY8MOBl9cz2tWpYIBEV5aXD8Qpl3rL5fDJ9htg5F4XJ
         LS7YJR5OhTi7UHMbeOkyljzY0VvIjTyEJkB9oszqAynJa2etf80gkDwXgQjWLFhcJz9z
         z+i2KvVt4TGShP0y+1i9hxRG1ijb2gN0T4W5+aYUepbA47eUPHsyrE6HNpYWzeiCPNnS
         XOTJpw8BRB6DjOC+/zouqAtN85ADuEcMD59cRKZqpYXRrj8zCRmyR3Frn/219jJkaAjD
         i069KC/vAjR4YswFGhvrLnQFnYeymdF69hNQPYOE5cV/hqkCSalgQuqdkX4wlp/9G39C
         dEtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iiI7fz1NnKL8BkMoIV3ZCmYxfspaptifGYPkmZt6szA=;
        fh=uYJrYLplVlPp9m4JQmP4YNBZY8OxB84kzGSMUd/o4NA=;
        b=SQRZdUq9Qz1rW/t+yTDnLoESa2qdwnXhI7VvRBHoGaDOlX0r1XgieFPsi+y2H0FMfr
         P61CEolzyLkUUm2xtgRbw6j41fCGPDQSdNLW27lgTNza4DOtjK7vlJ8cVPc1j9+xN3Vk
         P0epgiqqmGqfEhjQj4BOK6r/IleSYtxUWAoxt98uXrtmF+vZSclR2Ua0UCauASSETPKE
         Tto3MhkwaaB4ajEe+hWMYRCZn9Jf8LOI5mlf9o0wyE6qzgXeS5H+mGotixLEe58lCK+E
         h2gGNlCBElOAh9We4MYI7NeAnWS9EbAAaImclnZ07Fzd3NdqFy+yKPyKMJG/CIPdUiPL
         egBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h95hbCHK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e3a4bd20si144240096d6.346.2025.05.14.10.06.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 May 2025 10:06:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h95hbCHK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFFZ9-0004PE-Vz; Wed, 14 May 2025 13:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uFFYu-0003PT-PZ
 for qemu-arm@nongnu.org; Wed, 14 May 2025 13:06:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uFFYs-0007u5-Th
 for qemu-arm@nongnu.org; Wed, 14 May 2025 13:06:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747242390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iiI7fz1NnKL8BkMoIV3ZCmYxfspaptifGYPkmZt6szA=;
 b=h95hbCHKXaUFWFe5Yy9GIX8lWDjMVB8ZMOMMPHNHzWsEblHaYHN2rE4wRITxN56Onx43lF
 fq/NN9S1o9l1QNcNjlM41rtSNe1ASEzdYs6kfZzftmONBrkX4VGwusbGxdN/pof7xuu+SS
 968ornnrQEIc0hhgDkRvBXep9RoLUqg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-618-nJk5r8qHM4a2oS8M6g7jXA-1; Wed,
 14 May 2025 13:06:26 -0400
X-MC-Unique: nJk5r8qHM4a2oS8M6g7jXA-1
X-Mimecast-MFC-AGG-ID: nJk5r8qHM4a2oS8M6g7jXA_1747242385
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6B3D01955DCD; Wed, 14 May 2025 17:06:25 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.14])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6639F30001B0; Wed, 14 May 2025 17:06:21 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com,
	philmd@linaro.org
Subject: [PATCH 21/22] hw/arm/virt: Plug pcihp hotplug/hotunplug callbacks
Date: Wed, 14 May 2025 19:01:08 +0200
Message-ID: <20250514170431.2786231-22-eric.auger@redhat.com>
In-Reply-To: <20250514170431.2786231-1-eric.auger@redhat.com>
References: <20250514170431.2786231-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.686,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3SQ+ZpE/asxV

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 526c4c44be..ecbcc2200a 100644
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

