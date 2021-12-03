Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1077052lfk;
        Thu, 2 Dec 2021 19:36:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2KWF7o1moMvFfF60P8/MMhL94ivZ5NYDxGMdCKnhO1cI/Z7T2uXVzc37riqJisJeElvzF
X-Received: by 2002:a05:6902:1024:: with SMTP id x4mr20991101ybt.383.1638502609100;
        Thu, 02 Dec 2021 19:36:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638502609; cv=none;
        d=google.com; s=arc-20160816;
        b=AyL+huqiGSGcddIsQYg0SmVTv73S2m7mSa8QceHwIO9xzeEs8xWO+WRzK3BlkFMNgV
         jsFfMXoNTEitV1+Fh9UWzCF5vJA4CDrR51AwyDB3kD7YTzb62zsl4YOBkyBVP71xphtD
         lTtBerkLVifU8l/deL+i50K2RNTh9oqtfw4nfjqcSukTd/nodcnUABn8vDYX5eDrOhrO
         t6zXcjhiem+e48qbLY5asOhxxB5HRfkAU/8atNvWSPMWH9CuT1UCLCDpkN/HgTpxlMCc
         Uo4vio/DUT5iWaA8Wxw6bKo8UV8rlSXDn/xDFjJ+OIBQaVL25bkj+ClITG32Ftc45fCO
         VMyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KrtG7EFdXu3WYzQrnqhNq8mlBC6GR2iZE3J/xMT9eXc=;
        b=vZlxQTHqMyUGxSbQ5rNEOhWHGBO5xW4DAr7NzZhSJR09LpiuJINuvphz0FiYXDv4qV
         mBD1X6TgVcKJUJPMzoXxubkaj4YvAuy8M/siOvMOKWvnW76kCghxMXgnprrPdVqpqVdL
         EIVSxQWvwJWCAMfclZ9yZ6dG6JAFIFBlCjLlpBAl9ZoBU7g5iqMuIoaBfCjXszNQbLQ2
         Lrbj5MuE5e+J9VD8Wfbdrkoxn+ENJu8rey5xoqnfd/J/PSjP0DML65DFwPozNvr6VlT0
         BLAikPApWXnrqGZXEsA3cPI6w8e+kkoYm2mj52ZQ3M+pKxo27O+MmKsMg8XqYziDMuF6
         aNaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MWJjP1er;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i15si1935791ybt.502.2021.12.02.19.36.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Dec 2021 19:36:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MWJjP1er;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mszNQ-0002fT-ED
	for alex.bennee@linaro.org; Thu, 02 Dec 2021 22:36:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mszN9-0002c3-PN
 for qemu-arm@nongnu.org; Thu, 02 Dec 2021 22:36:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mszN8-0002UN-27
 for qemu-arm@nongnu.org; Thu, 02 Dec 2021 22:36:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638502589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KrtG7EFdXu3WYzQrnqhNq8mlBC6GR2iZE3J/xMT9eXc=;
 b=MWJjP1erz30BCXQNO/s3NSs4AstvHdZoeRIP4BwHoPjtHBghu2VPmkyfFWI24rjdfHDTEX
 2S+sUYhhrT+l93MfRryQuVHTb7bt3WEJJ+zf3K18OiNTsl975Lln9aKoNExN8qHqyaj5PB
 RsJh/i8RPX2U4eqUmNGjR5P0ZccJgjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-mNUilIr4MpiAPVzbzLiasQ-1; Thu, 02 Dec 2021 22:36:26 -0500
X-MC-Unique: mNUilIr4MpiAPVzbzLiasQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3139801B17;
 Fri,  3 Dec 2021 03:36:24 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-43.bne.redhat.com [10.64.54.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4ACB119724;
 Fri,  3 Dec 2021 03:36:11 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 1/2] hw/arm/virt: Support for virtio-mem-pci
Date: Fri,  3 Dec 2021 11:35:21 +0800
Message-Id: <20211203033522.27580-2-gshan@redhat.com>
In-Reply-To: <20211203033522.27580-1-gshan@redhat.com>
References: <20211203033522.27580-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Kv5bx1QMVHPc

This supports virtio-mem-pci device on "virt" platform, by simply
following the implementation on x86.

   * This implements the hotplug handlers to support virtio-mem-pci
     device hot-add, while the hot-remove isn't supported as we have
     on x86.

   * The block size is 512MB on ARM64 instead of 128MB on x86.

   * It has been passing the tests with various combinations like 64KB
     and 4KB page sizes on host and guest, different memory device
     backends like normal, transparent huge page and HugeTLB, plus
     migration.

Co-developed-by: David Hildenbrand <david@redhat.com>
Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/Kconfig         |  1 +
 hw/arm/virt.c          | 68 +++++++++++++++++++++++++++++++++++++++++-
 hw/virtio/virtio-mem.c |  4 ++-
 3 files changed, 71 insertions(+), 2 deletions(-)

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
index d5a578142b..ac7a40f514 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -117,7 +117,7 @@ static uint64_t virtio_mem_default_block_size(RAMBlock *rb)
  * The memory block size corresponds mostly to the section size.
  *
  * This allows e.g., to add 20MB with a section size of 128MB on x86_64, and
- * a section size of 1GB on arm64 (as long as the start address is properly
+ * a section size of 512MB on arm64 (as long as the start address is properly
  * aligned, similar to ordinary DIMMs).
  *
  * We can change this at any time and maybe even make it configurable if
@@ -126,6 +126,8 @@ static uint64_t virtio_mem_default_block_size(RAMBlock *rb)
  */
 #if defined(TARGET_X86_64) || defined(TARGET_I386)
 #define VIRTIO_MEM_USABLE_EXTENT (2 * (128 * MiB))
+#elif defined(TARGET_ARM)
+#define VIRTIO_MEM_USABLE_EXTENT (2 * (512 * MiB))
 #else
 #error VIRTIO_MEM_USABLE_EXTENT not defined
 #endif
-- 
2.23.0

