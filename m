Received: by 10.223.172.38 with SMTP id v35csp4643224wrc;
        Tue, 19 Sep 2017 00:51:02 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QA7Ytf15Li0nUSPhkDwT/yO26bBmWRI0ml9N5W8ItKFN6SegODWHiRgrxhZSsDpv+xXHkqb
X-Received: by 10.55.118.7 with SMTP id r7mr742528qkc.276.1505807461954;
        Tue, 19 Sep 2017 00:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505807461; cv=none;
        d=google.com; s=arc-20160816;
        b=uaqXssMkk4HHuNRfLOqIqLHYr7zv2zP4o7W6QYlq98tK6Iz5HrMfE7Jlsn010f2sj6
         asQhudGWWy21vtcvRT1/TL7l4WFokGFlDCGFYbh4ugNAM2cNxH2c51I//a93vh3SqZJj
         sdyTFT+UZHo5FdyLmqtS5zBcFXqbuzrRqpOxBmqHsYvaS3UYX03yTX9Trru53nsHM8Rr
         eFjDakxAbKAGa+sd7OrScR1lefes13LfPZxx5ASJ1T21uZ8CRTpZoesXEu3BjTttOcNV
         t5TTS41w1WAcmRE/IDAyWDWfBTI6umrFyUxLcVdDPNvVwsZb9a9IkI8+8QU7zGcIO2YA
         Q50w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=lkagLuRxOANq8m+yRxod1lpKFJOaSsENfm4bDx5rrpo=;
        b=YdrqYN0so/n9wajDKZLS8oUx1t7ybOMEobfd52h/1sxsN2nskNOquO6Oa75HZ//OYg
         PsM83AZGf8dN+jVxaiYylgaBL4ZV83Ru3st5hX/EIJOZ9fQ6+7949GoCZbkdaF3noOZT
         7aQazSTFsLZV/RxeApJAoIjpQyVbtdsdM7S+HXpVapsgCPfcfvIs5xpwrEM2nqzNLQnN
         5d5x28Vesh7/3flHRen8eNDx6h6MztN72AmnwOlL9zfMEAXqh1Bgj34A40MXS1Tjh7/S
         YEIfezl+U6cX2WMK0DC6SpOYGRUxxgXz5RX/p85Ks9fMfrkBJiu+QkEqGCLqDbbrMtxm
         ASVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c2si8676118qkf.148.2017.09.19.00.51.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 00:51:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40607 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duDJ5-00020L-MI
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 03:50:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDGJ-0008CP-1Y
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 03:48:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDGD-0000mk-4I
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 03:48:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51638)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1duDGC-0000lp-S7; Tue, 19 Sep 2017 03:48:01 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34F42267DB;
	Tue, 19 Sep 2017 07:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 34F42267DB
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-197.ams2.redhat.com
	[10.36.116.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E2D8B61342;
	Tue, 19 Sep 2017 07:47:52 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Tue, 19 Sep 2017 09:46:37 +0200
Message-Id: <1505807208-9063-6-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 19 Sep 2017 07:47:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 05/16] virtio-iommu: Add the iommu regions
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XmE+s08h2foM

This patch initializes the iommu memory regions so that
PCIe end point transactions get translated. The translation function
is not yet implemented at that stage.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v3 -> v4:
- add trace_virtio_iommu_init_iommu_mr

v2 -> v3:
- use IOMMUMemoryRegion
- iommu mr name built with BDF
- rename smmu_get_sid into virtio_iommu_get_sid and use PCI_BUILD_BDF
---
 hw/virtio/trace-events           |   2 +
 hw/virtio/virtio-iommu.c         | 119 +++++++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-iommu.h |   2 +
 3 files changed, 123 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index a35dc62..bc65356 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -36,3 +36,5 @@ virtio_iommu_attach(uint32_t as, uint32_t dev) "as=%d dev=%d"
 virtio_iommu_detach(uint32_t dev) "dev=%d"
 virtio_iommu_map(uint32_t as, uint64_t phys_addr, uint64_t virt_addr, uint64_t size, uint32_t flags) "as= %d phys_addr=0x%"PRIx64" virt_addr=0x%"PRIx64" size=0x%"PRIx64" flags=%d"
 virtio_iommu_unmap(uint32_t as, uint64_t virt_addr, uint64_t size) "as= %d virt_addr=0x%"PRIx64" size=0x%"PRIx64
+virtio_iommu_translate(const char *name, uint32_t rid, uint64_t iova, int flag) "mr=%s rid=%d addr=0x%"PRIx64" flag=%d"
+virtio_iommu_init_iommu_mr(char *iommu_mr) "init %s"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 51f9003..f4cb76f 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -23,6 +23,7 @@
 #include "hw/virtio/virtio.h"
 #include "sysemu/kvm.h"
 #include "qapi-event.h"
+#include "qemu/error-report.h"
 #include "trace.h"
 
 #include "standard-headers/linux/virtio_ids.h"
@@ -35,6 +36,66 @@
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
+    uintptr_t key = (uintptr_t)bus;
+    IOMMUPciBus *sbus = g_hash_table_lookup(s->as_by_busptr, &key);
+    IOMMUDevice *sdev;
+
+    if (!sbus) {
+        uintptr_t *new_key = g_malloc(sizeof(*new_key));
+
+        *new_key = (uintptr_t)bus;
+        sbus = g_malloc0(sizeof(IOMMUPciBus) +
+                         sizeof(IOMMUDevice *) * IOMMU_PCI_DEVFN_MAX);
+        sbus->bus = bus;
+        g_hash_table_insert(s->as_by_busptr, new_key, sbus);
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
+static void virtio_iommu_init_as(VirtIOIOMMU *s)
+{
+    PCIBus *pcibus = pci_find_primary_bus();
+
+    if (pcibus) {
+        pci_setup_iommu(pcibus, virtio_iommu_find_add_as, s);
+    } else {
+        error_report("No PCI bus, virtio-iommu is not registered");
+    }
+}
+
+
 static int virtio_iommu_attach(VirtIOIOMMU *s,
                                struct virtio_iommu_req_attach *req)
 {
@@ -215,6 +276,26 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
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
@@ -265,6 +346,21 @@ static const VMStateDescription vmstate_virtio_iommu_device = {
     },
 };
 
+/*****************************
+ * Hash Table
+ *****************************/
+
+static inline gboolean as_uint64_equal(gconstpointer v1, gconstpointer v2)
+{
+    return *((const uint64_t *)v1) == *((const uint64_t *)v2);
+}
+
+static inline guint as_uint64_hash(gconstpointer v)
+{
+    return (guint)*(const uint64_t *)v;
+}
+
+
 static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
@@ -278,6 +374,13 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 
     s->config.page_size_mask = TARGET_PAGE_MASK;
     s->config.input_range.end = -1UL;
+
+    memset(s->as_by_bus_num, 0, sizeof(s->as_by_bus_num));
+    s->as_by_busptr = g_hash_table_new_full(as_uint64_hash,
+                                            as_uint64_equal,
+                                            g_free, g_free);
+
+    virtio_iommu_init_as(s);
 }
 
 static void virtio_iommu_device_unrealize(DeviceState *dev, Error **errp)
@@ -335,6 +438,14 @@ static void virtio_iommu_class_init(ObjectClass *klass, void *data)
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
@@ -343,9 +454,17 @@ static const TypeInfo virtio_iommu_info = {
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
index 6716cdb..f9c988f 100644
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
2.5.5

