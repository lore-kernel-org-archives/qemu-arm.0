Received: by 10.28.71.27 with SMTP id u27csp835525wma;
        Fri, 19 Jan 2018 06:58:02 -0800 (PST)
X-Google-Smtp-Source: ACJfBoujl6DR9Tax0eaCDC3wlJF0eeKUNcDm6O7SqjlOReO43v04YYNthU5QKQJlcnPZToz0UVN5
X-Received: by 10.13.228.1 with SMTP id n1mr10003712ywe.6.1516373882727;
        Fri, 19 Jan 2018 06:58:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516373882; cv=none;
        d=google.com; s=arc-20160816;
        b=Pb+IiSwXwBDCQDQ+bowgvJVtlizMEFx2uQeCSmJeE7B5pSGcvNNZ00mtiMr6/i6lkO
         vdty1KkRuAJlfFuRvUkQSDRrcfJvLzOLHIgfj8BFPGW4Pm8eWdj60yJ0eCuNbZGmQMEo
         8UFg4nnCddSthzq3LJOatdVPk7KvVgkIJds1G2HknuFNLUOec+GD0SLCQbL6INi8DCFY
         qP6xVCCuXrMOSETqG6Ff8dH+QVuy0N48n0tVnKmKtKIOjR+CLlOCL1GTx/gKOAqUPRon
         x9y19x0FIoGN5ggrVNMf91JVKOrzihixXMo9yPbnJCejyH9RKyRVMbjAho1NlKyirJSf
         JwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=YDiY863jN2BV0Gffeo71idwHJbDh5iqVZiakpC/zV5k=;
        b=h6At2LjuzIwz0Py8vSyw6F22toTHja1Zd32kwkRv5mW9s4YnHoHEtETbIO7a5xvxPz
         A9jS2Qs1YDGn2jmgj+1sv//AExj+mY0xODXbHwUCFjVykqz3Y0iiUow07kr6PhM+a4Jy
         Dw+tHhfV4kLeIqxpfYe5amh+c+VCKI0vWMI6+bWjnzhb/eFzyP28WqjNw93IEaQ8NlDT
         C+kK72X2YxtByU7LuZNi5N1ikTtYVUQWQrejA3e3qfil8XQRC+ZdrBDwW0MLLzwXja/p
         nyYHNhpF/nNPH6+uIURlg7t1GoWJEDtlLDMg47kv+JpZMXjnJhRRjD6S+9pD1CjuGgyi
         WxAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n30si2357946ywh.361.2018.01.19.06.58.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 06:58:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53863 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecY7G-00021z-3l
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 09:58:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecY6h-0001xd-B7
	for qemu-devel@nongnu.org; Fri, 19 Jan 2018 09:57:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecY6g-0003OG-1p
	for qemu-devel@nongnu.org; Fri, 19 Jan 2018 09:57:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54664)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ecY6c-0003MM-ND; Fri, 19 Jan 2018 09:57:22 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B0BB09B3DB;
	Fri, 19 Jan 2018 14:57:21 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-129.ams2.redhat.com [10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9CD925C88D;
	Fri, 19 Jan 2018 14:56:09 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Fri, 19 Jan 2018 14:49:01 +0000
Message-Id: <1516373355-305-9-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
References: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 19 Jan 2018 14:57:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v5 08/22] virtio-iommu: Add the iommu regions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wei@redhat.com, kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wn+aVV+WKJnG

This patch initializes the iommu memory regions so that
PCIe end point transactions get translated. The translation
function is not yet implemented though.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v4 -> v5:
- use PCI bus handle as a key
- use get_primary_pci_bus() callback

v3 -> v4:
- add trace_virtio_iommu_init_iommu_mr

v2 -> v3:
- use IOMMUMemoryRegion
- iommu mr name built with BDF
- rename smmu_get_sid into virtio_iommu_get_sid and use PCI_BUILD_BDF
---
 hw/virtio/trace-events           |   2 +
 hw/virtio/virtio-iommu.c         | 102 +++++++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-iommu.h |   2 +
 3 files changed, 106 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index f570699..1739db5 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -36,3 +36,5 @@ virtio_iommu_attach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
 virtio_iommu_detach(uint32_t ep_id) "endpoint=%d"
 virtio_iommu_map(uint32_t domain_id, uint64_t phys_addr, uint64_t virt_addr, uint64_t size, uint32_t flags) "domain=%d phys_addr=0x%"PRIx64" virt_addr=0x%"PRIx64" size=0x%"PRIx64" flags=%d"
 virtio_iommu_unmap(uint32_t domain_id, uint64_t virt_addr, uint64_t size) "domain=%d virt_addr=0x%"PRIx64" size=0x%"PRIx64
+virtio_iommu_translate(const char *name, uint32_t rid, uint64_t iova, int flag) "mr=%s rid=%d addr=0x%"PRIx64" flag=%d"
+virtio_iommu_init_iommu_mr(char *iommu_mr) "init %s"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 247e6c8..5d335d1 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -23,6 +23,9 @@
 #include "hw/virtio/virtio.h"
 #include "sysemu/kvm.h"
 #include "qapi-event.h"
+#include "qemu/error-report.h"
+#include "hw/i386/pc.h"
+#include "hw/arm/virt.h"
 #include "trace.h"
 
 #include "standard-headers/linux/virtio_ids.h"
@@ -35,6 +38,50 @@
 /* Max size */
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
 
+static inline uint16_t virtio_iommu_get_sid(IOMMUDevice *dev)
+{
+    return PCI_BUILD_BDF(pci_bus_num(dev->bus), dev->devfn);
+}
+
+static AddressSpace *virtio_iommu_find_add_as(PCIBus *bus, void *opaque,
+                                              int devfn)
+{
+    VirtIOIOMMU *s = opaque;
+    IOMMUPciBus *sbus = g_hash_table_lookup(s->as_by_busptr, &bus);
+    IOMMUDevice *sdev;
+
+    if (!sbus) {
+        sbus = g_malloc0(sizeof(IOMMUPciBus) +
+                         sizeof(IOMMUDevice *) * IOMMU_PCI_DEVFN_MAX);
+        sbus->bus = bus;
+        g_hash_table_insert(s->as_by_busptr, bus, sbus);
+    }
+
+    sdev = sbus->pbdev[devfn];
+    if (!sdev) {
+        char *name = g_strdup_printf("%s-%d-%d",
+                                     TYPE_VIRTIO_IOMMU_MEMORY_REGION,
+                                     pci_bus_num(bus), devfn);
+        sdev = sbus->pbdev[devfn] = g_malloc0(sizeof(IOMMUDevice));
+
+        sdev->viommu = s;
+        sdev->bus = bus;
+        sdev->devfn = devfn;
+
+        trace_virtio_iommu_init_iommu_mr(name);
+
+        memory_region_init_iommu(&sdev->iommu_mr, sizeof(sdev->iommu_mr),
+                                 TYPE_VIRTIO_IOMMU_MEMORY_REGION,
+                                 OBJECT(s), name,
+                                 UINT64_MAX);
+        address_space_init(&sdev->as,
+                           MEMORY_REGION(&sdev->iommu_mr), TYPE_VIRTIO_IOMMU);
+    }
+
+    return &sdev->as;
+
+}
+
 static int virtio_iommu_attach(VirtIOIOMMU *s,
                                struct virtio_iommu_req_attach *req)
 {
@@ -215,6 +262,26 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
     }
 }
 
+static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
+                                            IOMMUAccessFlags flag)
+{
+    IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
+    uint32_t sid;
+
+    IOMMUTLBEntry entry = {
+        .target_as = &address_space_memory,
+        .iova = addr,
+        .translated_addr = addr,
+        .addr_mask = ~(hwaddr)0,
+        .perm = IOMMU_NONE,
+    };
+
+    sid = virtio_iommu_get_sid(sdev);
+
+    trace_virtio_iommu_translate(mr->parent_obj.name, sid, addr, flag);
+    return entry;
+}
+
 static void virtio_iommu_get_config(VirtIODevice *vdev, uint8_t *config_data)
 {
     VirtIOIOMMU *dev = VIRTIO_IOMMU(vdev);
@@ -269,6 +336,17 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
+    MachineState *ms = MACHINE(qdev_get_machine());
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    PCIBus *pcibus;
+
+    if (!mc->get_primary_pci_bus) {
+        goto err;
+    }
+    pcibus = mc->get_primary_pci_bus(ms);
+    if (!pcibus) {
+        goto err;
+    }
 
     virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
                 sizeof(struct virtio_iommu_config));
@@ -279,6 +357,14 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 
     s->config.page_size_mask = TARGET_PAGE_MASK;
     s->config.input_range.end = -1UL;
+
+    memset(s->as_by_bus_num, 0, sizeof(s->as_by_bus_num));
+    s->as_by_busptr = g_hash_table_new(NULL, NULL);
+
+    pci_setup_iommu(pcibus, virtio_iommu_find_add_as, s);
+    return;
+err:
+    error_setg(&error_fatal, "virtio-iommu: no pci bus identified");
 }
 
 static void virtio_iommu_device_unrealize(DeviceState *dev, Error **errp)
@@ -336,6 +422,14 @@ static void virtio_iommu_class_init(ObjectClass *klass, void *data)
     vdc->vmsd = &vmstate_virtio_iommu_device;
 }
 
+static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
+                                                  void *data)
+{
+    IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_CLASS(klass);
+
+    imrc->translate = virtio_iommu_translate;
+}
+
 static const TypeInfo virtio_iommu_info = {
     .name = TYPE_VIRTIO_IOMMU,
     .parent = TYPE_VIRTIO_DEVICE,
@@ -344,9 +438,17 @@ static const TypeInfo virtio_iommu_info = {
     .class_init = virtio_iommu_class_init,
 };
 
+static const TypeInfo virtio_iommu_memory_region_info = {
+    .parent = TYPE_IOMMU_MEMORY_REGION,
+    .name = TYPE_VIRTIO_IOMMU_MEMORY_REGION,
+    .class_init = virtio_iommu_memory_region_class_init,
+};
+
+
 static void virtio_register_types(void)
 {
     type_register_static(&virtio_iommu_info);
+    type_register_static(&virtio_iommu_memory_region_info);
 }
 
 type_init(virtio_register_types)
diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index d7cf73b..0b6b3f2 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -28,6 +28,8 @@
 #define VIRTIO_IOMMU(obj) \
         OBJECT_CHECK(VirtIOIOMMU, (obj), TYPE_VIRTIO_IOMMU)
 
+#define TYPE_VIRTIO_IOMMU_MEMORY_REGION "virtio-iommu-memory-region"
+
 #define IOMMU_PCI_BUS_MAX      256
 #define IOMMU_PCI_DEVFN_MAX    256
 
-- 
1.9.1

