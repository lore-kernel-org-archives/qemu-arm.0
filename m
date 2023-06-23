Received: by 2002:a17:906:6453:b0:98d:a79e:b696 with SMTP id l19csp114607ejn;
        Fri, 23 Jun 2023 05:23:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7hI0otfXaLOTYCKu5C9+2e/DbIlYP4+yT4ujRNd/3D0ysDxB+pVS2nKdTXK4eOXENzvNJy
X-Received: by 2002:a05:622a:134c:b0:3fd:e517:43c8 with SMTP id w12-20020a05622a134c00b003fde51743c8mr16896677qtk.37.1687523018324;
        Fri, 23 Jun 2023 05:23:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687523018; cv=none;
        d=google.com; s=arc-20160816;
        b=tlwt8PGZYukdaC9Wt3tEKPmNbE0PmWHLMtqArWNdvofhY2MH+srhRUZfOem4h3R4v8
         ZrPhwn1eTyNttX5zJv9tUvP7SC9x/kr9ghDmkt0E21bLbfQMxw3Z2NayEgO5L17Rlvry
         vPcj9sZFRLsFf4lT4KpQCUYzJGhctPKkQXUh2qFr+hFDfFGTbA/BhkBFmSgQlLSLRRUc
         k+O3bmncs6KJlWO/4dR8r1zz/jvZwXJs5FP8X2qnsU56bQ5Me3MCYgNX/nIrMLnYY8ji
         NYdbwgpRwJ7QhtIv+fUfq5JWKWXO0SD+40yjxAx5fkveo5WfM1vntlLkg1Cu/fTpKBiJ
         QlYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ivf4UnFqtE88jzxzZ+D326WLpcGC+zkvB17stK3POMc=;
        b=J7cO5IqQknokzNRT8pF/aWrafsmtl6HHgg3d46XtMfEFR9rzAFP9vYIunxvTz0QNUf
         ftoT0tFwj6bbpJtdcDwlqCylC+app4HX7TaGwqMN27eMmi6mbFtEmQKTe/efCKrXfExU
         QttHnp6yxql5bcRP6V9a27+UlpIQp36pBivhY52whQS9e1OD1SsNVdtrvghVeG2TRNTy
         VLN2TWWHxQ9DYwiSjzl9vvfPnW6qOrXTRdGymvWfGJCGSeSXKQkuQL7Eh4empYaCuxfA
         znnZxkCUjwBkUPjBzeGi8rreKkFuk8DGXa3CkYtC3thF60AQCW8Ol0DC29pMBU84kZDI
         +MQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GZDBschD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i15-20020ac85c0f000000b003f8a00e78ecsi3523597qti.5.2023.06.23.05.23.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Jun 2023 05:23:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GZDBschD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qCfoA-0005Ly-Ll; Fri, 23 Jun 2023 08:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qCfn4-0003pd-8j
 for qemu-devel@nongnu.org; Fri, 23 Jun 2023 08:21:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qCfmw-0003mv-KS
 for qemu-devel@nongnu.org; Fri, 23 Jun 2023 08:21:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687522874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ivf4UnFqtE88jzxzZ+D326WLpcGC+zkvB17stK3POMc=;
 b=GZDBschD6GF8bF98mIV0S7QllLEv9P4ldikDAWT2QL5pe/rIQH/a9WG1Q/NavJFq6aBfzn
 N+am9IGNnUP7z7y5jgT3jnvlP11hLd6HY59jEEFfJeVY/uKZrN83ypJ9Q7qqkLzYUeAkVw
 LfJ3ceo1NGsqBq/V5i0+EV4MiEIEojg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-cntRAJzbODCn9cUvlWH5uQ-1; Fri, 23 Jun 2023 08:21:07 -0400
X-MC-Unique: cntRAJzbODCn9cUvlWH5uQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FCB73C23109;
 Fri, 23 Jun 2023 12:21:07 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.22.32.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53DB940C2071;
 Fri, 23 Jun 2023 12:21:05 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Gavin Shan <gshan@redhat.com>
Subject: [PATCH v2 3/7] arm/virt: Use virtio-md-pci (un)plug functions
Date: Fri, 23 Jun 2023 14:20:52 +0200
Message-Id: <20230623122056.374312-4-david@redhat.com>
In-Reply-To: <20230623122056.374312-1-david@redhat.com>
References: <20230623122056.374312-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: o0IUovB9mlNz

Let's use our new helper functions. Note that virtio-pmem-pci is not
enabled for arm and, therefore, not compiled in.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/arm/virt.c | 81 ++++++++-------------------------------------------
 1 file changed, 12 insertions(+), 69 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9b9f7d9c68..4ab8468e0b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -72,11 +72,10 @@
 #include "hw/arm/smmuv3.h"
 #include "hw/acpi/acpi.h"
 #include "target/arm/internals.h"
-#include "hw/mem/memory-device.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
 #include "hw/acpi/generic_event_device.h"
-#include "hw/virtio/virtio-mem-pci.h"
+#include "hw/virtio/virtio-md-pci.h"
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
@@ -2744,64 +2743,6 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
                          dev, &error_abort);
 }
 
-static void virt_virtio_md_pci_pre_plug(HotplugHandler *hotplug_dev,
-                                        DeviceState *dev, Error **errp)
-{
-    HotplugHandler *hotplug_dev2 = qdev_get_bus_hotplug_handler(dev);
-    Error *local_err = NULL;
-
-    if (!hotplug_dev2 && dev->hotplugged) {
-        /*
-         * Without a bus hotplug handler, we cannot control the plug/unplug
-         * order. We should never reach this point when hotplugging on ARM.
-         * However, it's nice to add a safety net, similar to what we have
-         * on x86.
-         */
-        error_setg(errp, "hotplug of virtio based memory devices not supported"
-                   " on this bus.");
-        return;
-    }
-    /*
-     * First, see if we can plug this memory device at all. If that
-     * succeeds, branch of to the actual hotplug handler.
-     */
-    memory_device_pre_plug(MEMORY_DEVICE(dev), MACHINE(hotplug_dev), NULL,
-                           &local_err);
-    if (!local_err && hotplug_dev2) {
-        hotplug_handler_pre_plug(hotplug_dev2, dev, &local_err);
-    }
-    error_propagate(errp, local_err);
-}
-
-static void virt_virtio_md_pci_plug(HotplugHandler *hotplug_dev,
-                                    DeviceState *dev, Error **errp)
-{
-    HotplugHandler *hotplug_dev2 = qdev_get_bus_hotplug_handler(dev);
-    Error *local_err = NULL;
-
-    /*
-     * Plug the memory device first and then branch off to the actual
-     * hotplug handler. If that one fails, we can easily undo the memory
-     * device bits.
-     */
-    memory_device_plug(MEMORY_DEVICE(dev), MACHINE(hotplug_dev));
-    if (hotplug_dev2) {
-        hotplug_handler_plug(hotplug_dev2, dev, &local_err);
-        if (local_err) {
-            memory_device_unplug(MEMORY_DEVICE(dev), MACHINE(hotplug_dev));
-        }
-    }
-    error_propagate(errp, local_err);
-}
-
-static void virt_virtio_md_pci_unplug_request(HotplugHandler *hotplug_dev,
-                                              DeviceState *dev, Error **errp)
-{
-    /* We don't support hot unplug of virtio based memory devices */
-    error_setg(errp, "virtio based memory devices cannot be unplugged.");
-}
-
-
 static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                             DeviceState *dev, Error **errp)
 {
@@ -2809,8 +2750,8 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
 
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
         virt_memory_pre_plug(hotplug_dev, dev, errp);
-    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
-        virt_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
+        virtio_md_pci_pre_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
         hwaddr db_start = 0, db_end = 0;
         char *resv_prop_str;
@@ -2859,12 +2800,11 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
                                      SYS_BUS_DEVICE(dev));
         }
     }
+
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
         virt_memory_plug(hotplug_dev, dev, errp);
-    }
-
-    if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
-        virt_virtio_md_pci_plug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
+        virtio_md_pci_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
     }
 
     if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
@@ -2919,8 +2859,9 @@ static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
 {
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
         virt_dimm_unplug_request(hotplug_dev, dev, errp);
-    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
-        virt_virtio_md_pci_unplug_request(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
+        virtio_md_pci_unplug_request(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev),
+                                     errp);
     } else {
         error_setg(errp, "device unplug request for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -2932,6 +2873,8 @@ static void virt_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
 {
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
         virt_dimm_unplug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
+        virtio_md_pci_unplug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
     } else {
         error_setg(errp, "virt: device unplug for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -2945,7 +2888,7 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
 
     if (device_is_dynamic_sysbus(mc, dev) ||
         object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
-        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI) ||
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
         return HOTPLUG_HANDLER(machine);
     }
-- 
2.40.1

