Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1068757eje;
        Mon, 10 Jul 2023 03:08:21 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE+nL+oXGfb4CCRqGSO/spDjGbPjrBRyKvuQ8T1H3V3P3X1GXdpsOqA4tbyANy7kQIu2fyU
X-Received: by 2002:a05:620a:2914:b0:765:a8dc:f5c8 with SMTP id m20-20020a05620a291400b00765a8dcf5c8mr18862023qkp.35.1688983700773;
        Mon, 10 Jul 2023 03:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688983700; cv=none;
        d=google.com; s=arc-20160816;
        b=oe24WCbtE4KJqRTh907HeMMr3kbvNApOYNfbk9Gzmp1SkQJw8EoJqb1tlE9uYlfJlL
         b+ootpA8ulKhpl0SQZgKx6qpxgDfeQeqGkAHGHZwszj0bDSygWNkBoZRoNqOVhDFmkMB
         3yrxVJIiS+Zy+3WDHCHDFEmH2oKoTpBxTUjjUB/D4KgSO7IVLMrErJ8i2lvkEDBydZsl
         acPCrmnzUeWUniXe10aVrsHNlkbMP8+m7gYZgksBFY54Noe7FkMEHYHz6fQdmr5JXqmq
         50utNFV8TT5B921re3XNI3I5he/lcQiwLmdq2PVo4+7laaFRauAVmQFBoeQ0AZI0jOwx
         oJMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lX6DZVWASDNYxmelq21samXkOMSp3x9u9kPJWOsKiFE=;
        fh=he34ucSNOi56U9wkr/s+M3ZTDgBY7iRqVjLgddG0i4w=;
        b=k6iVi53GwOOo+XbH03sj2B1fy0jMNMa4T/1mpholT1+UPyReZhLDg+QzdJ8LbEjYgB
         BKnEv2dfWg/LOKCaGfyxKhOT0AxkDX9qRjVNSDmuKpU2Xe48IvBO6+WwN7ebzRCA4yH4
         4p2hBsIiN0i8FMFvE5Ddf1iqqGLlQLlM93iJsb2Bv7yDR3OrxvDa9YZxftG3mJoFeUeI
         XMVUJG1hur84QbyP5/+uynZDIhYIVfmRG0FBYXL7nsrwBD4f2QshhZp/rtZmjrJDNB2j
         QjfSjz+JY3QSl4mqIW2foqFNzp3Q+A+bKWzICwz8MTtuUYmg+0v3FagBSjU8NURYcz4u
         qvvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cxUT4U4N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4-20020a0cf5c4000000b00636277f415csi5455066qvm.423.2023.07.10.03.08.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jul 2023 03:08:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cxUT4U4N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qInns-0003kz-EI; Mon, 10 Jul 2023 06:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qInnq-0003jo-Go
 for qemu-devel@nongnu.org; Mon, 10 Jul 2023 06:07:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qInno-0004lp-FV
 for qemu-devel@nongnu.org; Mon, 10 Jul 2023 06:07:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688983651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lX6DZVWASDNYxmelq21samXkOMSp3x9u9kPJWOsKiFE=;
 b=cxUT4U4NFm+a6oi4FaHNDdEa4uuhBvy29uWd9x7YYY7aRuLrmmXyF2ZhwN6Pcyjwz+MZLY
 ofpdAOGQls+2MspJhz9NYn6UanzbCn7QPNp8Kw/AJJkR/131PsXU2s2a8A9FZB4GDJh4MS
 sF7diorsSzhwso0w0wzhU9n5/GQxg5E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-nuKB8qv0Oj-5RiFvOy7J7Q-1; Mon, 10 Jul 2023 06:07:28 -0400
X-MC-Unique: nuKB8qv0Oj-5RiFvOy7J7Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3054D384CC4E;
 Mon, 10 Jul 2023 10:07:28 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.194.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FC97111CA01;
 Mon, 10 Jul 2023 10:07:26 +0000 (UTC)
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
 Gavin Shan <gshan@redhat.com>, Mario Casquero <mcasquer@redhat.com>
Subject: [PATCH v3 2/7] pc: Factor out (un)plug handling of virtio-md-pci
 devices
Date: Mon, 10 Jul 2023 12:07:09 +0200
Message-ID: <20230710100714.228867-3-david@redhat.com>
In-Reply-To: <20230710100714.228867-1-david@redhat.com>
References: <20230710100714.228867-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 2Sph6UFo81A3

Let's factor out (un)plug handling, to be reused from arm/virt code.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/i386/pc.c                      | 90 ++++---------------------------
 hw/virtio/virtio-md-pci.c         | 63 ++++++++++++++++++++++
 include/hw/virtio/virtio-md-pci.h |  6 +++
 3 files changed, 80 insertions(+), 79 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index f01d7de5ad..c74a4014f0 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -88,13 +88,11 @@
 #include "hw/net/ne2000-isa.h"
 #include "standard-headers/asm-x86/bootparam.h"
 #include "hw/virtio/virtio-iommu.h"
-#include "hw/virtio/virtio-pmem-pci.h"
-#include "hw/virtio/virtio-mem-pci.h"
+#include "hw/virtio/virtio-md-pci.h"
 #include "hw/i386/kvm/xen_overlay.h"
 #include "hw/i386/kvm/xen_evtchn.h"
 #include "hw/i386/kvm/xen_gnttab.h"
 #include "hw/i386/kvm/xen_xenstore.h"
-#include "hw/mem/memory-device.h"
 #include "sysemu/replay.h"
 #include "target/i386/cpu.h"
 #include "e820_memory_layout.h"
@@ -1500,68 +1498,6 @@ static void pc_memory_unplug(HotplugHandler *hotplug_dev,
     error_propagate(errp, local_err);
 }
 
-static void pc_virtio_md_pci_pre_plug(HotplugHandler *hotplug_dev,
-                                      DeviceState *dev, Error **errp)
-{
-    HotplugHandler *hotplug_dev2 = qdev_get_bus_hotplug_handler(dev);
-    Error *local_err = NULL;
-
-    if (!hotplug_dev2 && dev->hotplugged) {
-        /*
-         * Without a bus hotplug handler, we cannot control the plug/unplug
-         * order. We should never reach this point when hotplugging on x86,
-         * however, better add a safety net.
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
-static void pc_virtio_md_pci_plug(HotplugHandler *hotplug_dev,
-                                  DeviceState *dev, Error **errp)
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
-static void pc_virtio_md_pci_unplug_request(HotplugHandler *hotplug_dev,
-                                            DeviceState *dev, Error **errp)
-{
-    /* We don't support hot unplug of virtio based memory devices */
-    error_setg(errp, "virtio based memory devices cannot be unplugged.");
-}
-
-static void pc_virtio_md_pci_unplug(HotplugHandler *hotplug_dev,
-                                    DeviceState *dev, Error **errp)
-{
-    /* We don't support hot unplug of virtio based memory devices */
-}
-
 static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                           DeviceState *dev, Error **errp)
 {
@@ -1569,9 +1505,8 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
         pc_memory_pre_plug(hotplug_dev, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
         x86_cpu_pre_plug(hotplug_dev, dev, errp);
-    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
-               object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
-        pc_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
+        virtio_md_pci_pre_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
         /* Declare the APIC range as the reserved MSI region */
         char *resv_prop_str = g_strdup_printf("0xfee00000:0xfeefffff:%d",
@@ -1603,9 +1538,8 @@ static void pc_machine_device_plug_cb(HotplugHandler *hotplug_dev,
         pc_memory_plug(hotplug_dev, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
         x86_cpu_plug(hotplug_dev, dev, errp);
-    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
-               object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
-        pc_virtio_md_pci_plug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
+        virtio_md_pci_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
     }
 }
 
@@ -1616,9 +1550,9 @@ static void pc_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
         pc_memory_unplug_request(hotplug_dev, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
         x86_cpu_unplug_request_cb(hotplug_dev, dev, errp);
-    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
-               object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
-        pc_virtio_md_pci_unplug_request(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
+        virtio_md_pci_unplug_request(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev),
+                                     errp);
     } else {
         error_setg(errp, "acpi: device unplug request for not supported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -1632,9 +1566,8 @@ static void pc_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
         pc_memory_unplug(hotplug_dev, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
         x86_cpu_unplug_cb(hotplug_dev, dev, errp);
-    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
-               object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
-        pc_virtio_md_pci_unplug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
+        virtio_md_pci_unplug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
     } else {
         error_setg(errp, "acpi: device unplug for not supported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -1646,8 +1579,7 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
 {
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
         object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
-        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
-        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI) ||
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI) ||
         object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
         return HOTPLUG_HANDLER(machine);
diff --git a/hw/virtio/virtio-md-pci.c b/hw/virtio/virtio-md-pci.c
index 6b02ff908e..e849c3131d 100644
--- a/hw/virtio/virtio-md-pci.c
+++ b/hw/virtio/virtio-md-pci.c
@@ -13,6 +13,69 @@
 #include "qemu/osdep.h"
 #include "hw/virtio/virtio-md-pci.h"
 #include "hw/mem/memory-device.h"
+#include "qapi/error.h"
+
+void virtio_md_pci_pre_plug(VirtIOMDPCI *vmd, MachineState *ms, Error **errp)
+{
+    DeviceState *dev = DEVICE(vmd);
+    HotplugHandler *bus_handler = qdev_get_bus_hotplug_handler(dev);
+    MemoryDeviceState *md = MEMORY_DEVICE(vmd);
+    Error *local_err = NULL;
+
+    if (!bus_handler && dev->hotplugged) {
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
+    memory_device_pre_plug(md, ms, NULL, &local_err);
+    if (!local_err && bus_handler) {
+        hotplug_handler_pre_plug(bus_handler, dev, &local_err);
+    }
+    error_propagate(errp, local_err);
+}
+
+void virtio_md_pci_plug(VirtIOMDPCI *vmd, MachineState *ms, Error **errp)
+{
+    DeviceState *dev = DEVICE(vmd);
+    HotplugHandler *bus_handler = qdev_get_bus_hotplug_handler(dev);
+    MemoryDeviceState *md = MEMORY_DEVICE(vmd);
+    Error *local_err = NULL;
+
+    /*
+     * Plug the memory device first and then branch off to the actual
+     * hotplug handler. If that one fails, we can easily undo the memory
+     * device bits.
+     */
+    memory_device_plug(md, ms);
+    if (bus_handler) {
+        hotplug_handler_plug(bus_handler, dev, &local_err);
+        if (local_err) {
+            memory_device_unplug(md, ms);
+        }
+    }
+    error_propagate(errp, local_err);
+}
+
+void virtio_md_pci_unplug_request(VirtIOMDPCI *vmd, MachineState *ms,
+                                  Error **errp)
+{
+    /* We don't support hot unplug of virtio based memory devices */
+    error_setg(errp, "virtio based memory devices cannot be unplugged.");
+}
+
+void virtio_md_pci_unplug(VirtIOMDPCI *vmd, MachineState *ms, Error **errp)
+{
+    /* We don't support hot unplug of virtio based memory devices */
+}
 
 static const TypeInfo virtio_md_pci_info = {
     .name = TYPE_VIRTIO_MD_PCI,
diff --git a/include/hw/virtio/virtio-md-pci.h b/include/hw/virtio/virtio-md-pci.h
index a241b54fcd..f9fa857aec 100644
--- a/include/hw/virtio/virtio-md-pci.h
+++ b/include/hw/virtio/virtio-md-pci.h
@@ -32,4 +32,10 @@ struct VirtIOMDPCI {
     VirtIOPCIProxy parent_obj;
 };
 
+void virtio_md_pci_pre_plug(VirtIOMDPCI *vmd, MachineState *ms, Error **errp);
+void virtio_md_pci_plug(VirtIOMDPCI *vmd, MachineState *ms, Error **errp);
+void virtio_md_pci_unplug_request(VirtIOMDPCI *vmd, MachineState *ms,
+                                  Error **errp);
+void virtio_md_pci_unplug(VirtIOMDPCI *vmd, MachineState *ms, Error **errp);
+
 #endif
-- 
2.41.0

