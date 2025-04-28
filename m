Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5871311njd;
        Mon, 28 Apr 2025 03:30:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+sUAGJClRjFYzYgRH5rgcjQXAyzUXpG0Cr1y1L/gtCBCiezxk89Zxga6SZ5Q/YZG7iKkrhaKRiKz/Rw==@linaro.org
X-Google-Smtp-Source: AGHT+IGpSjSNa1bOfe+90X8vTw8LvBAjo/dcktfTWHzG8VvHz7yVuXdhfwSOUZgOlV+Va35W+uJQ
X-Received: by 2002:a05:6214:2468:b0:6e8:f470:2b0d with SMTP id 6a1803df08f44-6f4d1f0d2b1mr155968036d6.19.1745836235372;
        Mon, 28 Apr 2025 03:30:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745836235; cv=none;
        d=google.com; s=arc-20240605;
        b=FjfITr6gQi2JMdpSifYg69F+IYunOMtOehPyvZ2vh930zkec0QNXX+O9nv8NK32Xib
         JJg+SSkz+o7a48Z8n+0rBXGKAcVZu7VPO4PWMadRe78bkWWvyCeCQpCCgBv0cHPYv7Xj
         mmOuY+aukXDKiZARyuOHf+NN6qnRVXAwFruAtMn5FRug8kVbF0ThM7Aho4tHpWmUxz1I
         SOqznvIULPVC4LJM6ej6xzkxhoFffV2AVw8GMkZ1GdkZRaTE36rs8iGQfAHjPyqP4NRM
         rZFW+oYrPOXP6CSSjtjQ3jFDidzgpqtqMpBV8Skh6HHTJflNB07Jopuw4NyvOScWPOB9
         vHQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gtNQ7F0kiq82fvtmnUNyrQYfPm+kMMu0y/wJ7IQvZQQ=;
        fh=+sxB8NkS+xL+1QwPgIVnaMhN8Q9GX11v/uLdEosqQQA=;
        b=TAVTvQ4ZR+K5aF+GNwUdf8Zd0Zz9K9XKieVMFKZlYzuzQweLecMNLtuat23eJLKVnN
         /6UfHto8fJGrXZrvcU9hQiksd+xTEcfieC30DpRStkIyrbml6ghm536xNVmdfqe/pE/T
         iAq3yRJ5/BndeBuocyWfbNohoQL9wuF26szUqPx/dDf+59TVO6AlQuRsQTTeerTCbjtf
         A5fE6i7D3LbQbxRrRVpMdlmDuBXEpYprjYAc6gcb/O9sUy5Dt0+saHwTXUA2fnGrcLsF
         AwnhGQEAhGIo2k+hgZ5Ox0sMqU5CDW6p8PUk9YuRIAao/NVURCxtiWIQaY2kmJcYegd1
         3XWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CumRBUAw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f4c0ace3ddsi94829226d6.173.2025.04.28.03.30.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Apr 2025 03:30:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CumRBUAw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u9Lk1-0004dW-LD; Mon, 28 Apr 2025 06:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u9Lj5-0000sp-96
 for qemu-arm@nongnu.org; Mon, 28 Apr 2025 06:28:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u9Lj1-0003WY-87
 for qemu-arm@nongnu.org; Mon, 28 Apr 2025 06:28:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745836109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gtNQ7F0kiq82fvtmnUNyrQYfPm+kMMu0y/wJ7IQvZQQ=;
 b=CumRBUAwOk82qytJqTmohXG+2xbyVR1/wUbCu+xhbMueqTIYKymeamfrkGdO4h/Y7SOoJa
 IZHwWRqqyOgTUUQ43dOkfxTHUaYyCSHVJDqG5X8RbRs3BMiuLoAU9c6YdadBvBSz9ceQFX
 /RNyfiL7QzYFz/PYCSs8Z6w9qGP74Zs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-260-HfbCicAyMveNLhHleg_a1A-1; Mon,
 28 Apr 2025 06:28:26 -0400
X-MC-Unique: HfbCicAyMveNLhHleg_a1A-1
X-Mimecast-MFC-AGG-ID: HfbCicAyMveNLhHleg_a1A_1745836105
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 27E1E1956094; Mon, 28 Apr 2025 10:28:25 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.14])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C0B8F180045C; Mon, 28 Apr 2025 10:28:20 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com
Subject: [RFC 23/24] hw/arm/virt: Plug pcihp hotplug/hotunplug callbacks
Date: Mon, 28 Apr 2025 12:25:49 +0200
Message-ID: <20250428102628.378046-24-eric.auger@redhat.com>
In-Reply-To: <20250428102628.378046-1-eric.auger@redhat.com>
References: <20250428102628.378046-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.492,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: SrDPO2PIeROt

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index aaee5443bb..5e6562e754 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -87,6 +87,7 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
+#include "hw/acpi/pcihp.h"
 
 static GlobalProperty arm_virt_compat[] = {
     { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "48" },
@@ -2983,6 +2984,11 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
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
 
@@ -3012,6 +3018,14 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
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
 
@@ -3061,6 +3075,15 @@ static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
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
@@ -3074,6 +3097,15 @@ static void virt_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
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
@@ -3084,11 +3116,14 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
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

