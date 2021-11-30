Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4284853lfk;
        Mon, 29 Nov 2021 16:34:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxsI9nx9OxSSs9jbr61xSVMu9eeBuJKODQlqnRwAabgJamZfKhySk4/ZWIe7rjFO4GOEbj
X-Received: by 2002:a67:61c3:: with SMTP id v186mr36153146vsb.78.1638232478418;
        Mon, 29 Nov 2021 16:34:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638232478; cv=none;
        d=google.com; s=arc-20160816;
        b=rRqS2dAvP8HxniPkhUsqUGdH/BlRg1qsnyBAXRGwHg8s4aJCujhXCYqcmcYHX1jtkE
         mqypNVpkL6+dH1BC8eY6CTE/8z1VNTVcjOgUGdULxYmkvtCcnXYN3MYBBQDWzC9kmdc3
         TD8jtOsBA8XcN+sINEpFYj6mcbOG8SyRBzGmgtdRBHW5b0yCMVtVKlU+x01mlZP5SIEQ
         vsdpD47ZGB59xfOqNtv3lJsNK4afTWb4/MUbeWOV0g9aRiFCNzfii50YMKWLEVuO4Al4
         LWu843xiLvbLMWQgdSI9R1eQYfrSBVCpKHBEPYOAfzUWPnQxCY3hWLqJzfvXgDO7ONFm
         pk0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nC3mfJ5oVUj9JEJZH+tZKTCaQeELDm28rmT6POUfRRo=;
        b=I6xYq0awjMkgElC4NGBfQ1nM9955XGT6uwpM0xr75jtikmoyrY3ol80uUFD+HkG+6i
         qEzHKOxXxuuzS7PLq8t4Yat8MxUy4Z/8OoPH1jwIaPzL/kOnZf8aKHE0jC3/D9xOH84M
         cOFrK7y4mDwIYV9gjpxWZtETXcXWRXit8YAZS6OV69/XckIZ1/un/dnmDsXbOlHa/sAU
         nb1fU6kBCDcSkAXEw6O/wcnh/Nul4oYPn5gnaD2xb67GsSlwtikrdqWiy+jm82mXPmEb
         bLvL/Nu7U2lSrvJmlKZe75qT+VQsuH9AP+ubpWDeC6dgZ/AJPt3jTTv6uypoBDylRETK
         fiTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FNW4uqOt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w15si3736593uap.177.2021.11.29.16.34.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Nov 2021 16:34:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FNW4uqOt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mrr6T-0003Sr-O3
	for alex.bennee@linaro.org; Mon, 29 Nov 2021 19:34:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mrr67-0003Qa-Bq
 for qemu-arm@nongnu.org; Mon, 29 Nov 2021 19:34:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mrr61-0003ei-Fc
 for qemu-arm@nongnu.org; Mon, 29 Nov 2021 19:34:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638232449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nC3mfJ5oVUj9JEJZH+tZKTCaQeELDm28rmT6POUfRRo=;
 b=FNW4uqOtHhKQ6ysKl6S+zKDWNnnEq5QIUzxfVtlpS0JF7oVBHA1HhR93NxS251k4u3a8oi
 mUmopa1OcjbCKhzLJiTWXPNcVx1qwHhRZl0QVB6E4DRTHGTQdWYhWpCpD4Lkd3xYTzkDnt
 VLmXDba2i8NTdl3N78G5F2O1qUT6Lhs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-cXxSxErDOJ-l_f0KmOP6OQ-1; Mon, 29 Nov 2021 19:34:07 -0500
X-MC-Unique: cXxSxErDOJ-l_f0KmOP6OQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47D2F80F041;
 Tue, 30 Nov 2021 00:34:06 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-223.bne.redhat.com [10.64.54.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01A595C232;
 Tue, 30 Nov 2021 00:34:01 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 1/1] hw/arm/virt: Support for virtio-mem-pci
Date: Tue, 30 Nov 2021 08:33:28 +0800
Message-Id: <20211130003328.201270-2-gshan@redhat.com>
In-Reply-To: <20211130003328.201270-1-gshan@redhat.com>
References: <20211130003328.201270-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 shan.gavin@gmail.com, Jonathan.Cameron@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LWCoL+YOCWe3

This supports virtio-mem-pci device on "virt" platform, by simply
following the implementation on x86.

   * The patch was written by David Hildenbrand <david@redhat.com>
     modified by Jonathan Cameron <Jonathan.Cameron@huawei.com>

   * This implements the hotplug handlers to support virtio-mem-pci
     device hot-add, while the hot-remove isn't supported as we have
     on x86.

   * The block size is 1GB on ARM64 instead of 128MB on x86.

   * It has been passing the tests with various combinations like 64KB
     and 4KB page sizes on host and guest, different memory device
     backends like normal, transparent huge page and HugeTLB, plus
     migration.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/Kconfig         |  1 +
 hw/arm/virt.c          | 68 +++++++++++++++++++++++++++++++++++++++++-
 hw/virtio/virtio-mem.c |  2 ++
 3 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2d37d29f02..15aff8efb8 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -27,6 +27,7 @@ config ARM_VIRT
     select DIMM
     select ACPI_HW_REDUCED
     select ACPI_APEI
+    select VIRTIO_MEM_SUPPORTED
 
 config CHEETAH
     bool
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 369552ad45..f4599a5ef0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -71,9 +71,11 @@
 #include "hw/arm/smmuv3.h"
 #include "hw/acpi/acpi.h"
 #include "target/arm/internals.h"
+#include "hw/mem/memory-device.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
 #include "hw/acpi/generic_event_device.h"
+#include "hw/virtio/virtio-mem-pci.h"
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
@@ -2480,6 +2482,63 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
                          dev, &error_abort);
 }
 
+static void virt_virtio_md_pci_pre_plug(HotplugHandler *hotplug_dev,
+                                        DeviceState *dev, Error **errp)
+{
+    HotplugHandler *hotplug_dev2 = qdev_get_bus_hotplug_handler(dev);
+    Error *local_err = NULL;
+
+    if (!hotplug_dev2 && dev->hotplugged) {
+        /*
+         * Without a bus hotplug handler, we cannot control the plug/unplug
+         * order. We should never reach this point when hotplugging on x86,
+         * however, better add a safety net.
+         */
+        error_setg(errp, "hotplug of virtio based memory devices not supported"
+                   " on this bus.");
+        return;
+    }
+    /*
+     * First, see if we can plug this memory device at all. If that
+     * succeeds, branch of to the actual hotplug handler.
+     */
+    memory_device_pre_plug(MEMORY_DEVICE(dev), MACHINE(hotplug_dev), NULL,
+                           &local_err);
+    if (!local_err && hotplug_dev2) {
+        hotplug_handler_pre_plug(hotplug_dev2, dev, &local_err);
+    }
+    error_propagate(errp, local_err);
+}
+
+static void virt_virtio_md_pci_plug(HotplugHandler *hotplug_dev,
+                                    DeviceState *dev, Error **errp)
+{
+    HotplugHandler *hotplug_dev2 = qdev_get_bus_hotplug_handler(dev);
+    Error *local_err = NULL;
+
+    /*
+     * Plug the memory device first and then branch off to the actual
+     * hotplug handler. If that one fails, we can easily undo the memory
+     * device bits.
+     */
+    memory_device_plug(MEMORY_DEVICE(dev), MACHINE(hotplug_dev));
+    if (hotplug_dev2) {
+        hotplug_handler_plug(hotplug_dev2, dev, &local_err);
+        if (local_err) {
+            memory_device_unplug(MEMORY_DEVICE(dev), MACHINE(hotplug_dev));
+        }
+    }
+    error_propagate(errp, local_err);
+}
+
+static void virt_virtio_md_pci_unplug_request(HotplugHandler *hotplug_dev,
+                                              DeviceState *dev, Error **errp)
+{
+    /* We don't support hot unplug of virtio based memory devices */
+    error_setg(errp, "virtio based memory devices cannot be unplugged.");
+}
+
+
 static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                             DeviceState *dev, Error **errp)
 {
@@ -2513,6 +2572,8 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
         qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
         qdev_prop_set_string(dev, "reserved-regions[0]", resv_prop_str);
         g_free(resv_prop_str);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
+        virt_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
     }
 }
 
@@ -2538,6 +2599,8 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
         vms->iommu = VIRT_IOMMU_VIRTIO;
         vms->virtio_iommu_bdf = pci_get_bdf(pdev);
         create_virtio_iommu_dt_bindings(vms);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
+        virt_virtio_md_pci_plug(hotplug_dev, dev, errp);
     }
 }
 
@@ -2588,6 +2651,8 @@ static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
 {
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
         virt_dimm_unplug_request(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
+        virt_virtio_md_pci_unplug_request(hotplug_dev, dev, errp);
     } else {
         error_setg(errp, "device unplug request for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -2611,7 +2676,8 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
     MachineClass *mc = MACHINE_GET_CLASS(machine);
 
     if (device_is_dynamic_sysbus(mc, dev) ||
-       (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM))) {
+        object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
         return HOTPLUG_HANDLER(machine);
     }
     if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index d5a578142b..3033692a83 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -126,6 +126,8 @@ static uint64_t virtio_mem_default_block_size(RAMBlock *rb)
  */
 #if defined(TARGET_X86_64) || defined(TARGET_I386)
 #define VIRTIO_MEM_USABLE_EXTENT (2 * (128 * MiB))
+#elif defined(TARGET_ARM)
+#define VIRTIO_MEM_USABLE_EXTENT (2 * (1024 * MiB))
 #else
 #error VIRTIO_MEM_USABLE_EXTENT not defined
 #endif
-- 
2.23.0

