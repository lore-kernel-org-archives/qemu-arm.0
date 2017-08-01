Received: by 10.25.44.15 with SMTP id s15csp4669941lfs;
        Tue, 1 Aug 2017 02:37:52 -0700 (PDT)
X-Received: by 10.55.164.7 with SMTP id n7mr23521216qke.343.1501580272440;
        Tue, 01 Aug 2017 02:37:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501580272; cv=none;
        d=google.com; s=arc-20160816;
        b=t+mYNatiFQ/PP50znAzlYugB1EJMCLBiGfHjGxKhPAoUnmoWwHOh5K6xEwaXU/Lr1w
         mYAVlDulORiZplX3TNzODC+rwz6Siip4i/R4pTZeawa0yQH1xtdoNv9/00+GpYXNJibx
         oiPxaXDScZsRGIduwyNN2yVR+5lc+biGphnVI9aMPBbq7rkjCo/Mm2K3AIxFctOZTTmT
         NSXafpTbHqUmOSwg38nQubHE+S2DaDtsZCZXO52FqQnWRe9Ut0bKTX8lj8k26yp/zjtn
         IkP1EvuHJdVEp71Qja5ZTkIaX1kpC/+Bm7DmgX4fHLpf7wYJdiWrykKVjqq8ue/J1H3m
         y2uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=g21vBmNufimt0D5muxUkOoKXBbcTvdaPeoR5HTJnLMg=;
        b=mbYqFvBACR8T3dxAde3U8AonQIexw/Ez7VG9Dtg14Dm1AZ9qWDaZtAP2IKEzjNwS5D
         TrDi4PRv5RSqArSq52ZOFLI6lZRf3TABJtzpC36P3eq/d4JrlHYUyZm30OUgd6cndG5c
         y2KgsT6vxJLKqFVht5zDuYcqr06jnqWe6D86H4qCiUyypl4yHeTFNMfcIz+1p/2HPF8O
         O2ne45yPcH0prnIYH702T409uJr5LpS16ff/ZnQPM/gWYnB64xaon6kwF3xtaKUKNhnm
         S99e3f2NmanG5a86uoLx5ueOZpNxMy4sWkPUSiJdx2C+6ad0mEQkHBZ8ibpefrvoFVqT
         Wp0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o23si25768993qtb.244.2017.08.01.02.37.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Aug 2017 02:37:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41399 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcTcb-0001bN-LN
	for alex.bennee@linaro.org; Tue, 01 Aug 2017 05:37:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dcTZr-0007j2-T4
	for qemu-arm@nongnu.org; Tue, 01 Aug 2017 05:35:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dcTZq-0001uR-Hp
	for qemu-arm@nongnu.org; Tue, 01 Aug 2017 05:34:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44734)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dcTZq-0001tV-8a; Tue, 01 Aug 2017 05:34:58 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1B13C12E52C;
	Tue,  1 Aug 2017 09:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1B13C12E52C
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-181.ams2.redhat.com
	[10.36.116.181])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6AB556047A;
	Tue,  1 Aug 2017 09:34:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Tue,  1 Aug 2017 11:33:11 +0200
Message-Id: <1501579994-3320-6-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1501579994-3320-1-git-send-email-eric.auger@redhat.com>
References: <1501579994-3320-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 01 Aug 2017 09:34:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 5/8] virtio_iommu: Add the iommu regions
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
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8PJATss1AXTi

This patch initializes the iommu memory regions so that
PCIe end point transactions get translated. The translation function
is not yet implemented at that stage.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- use IOMMUMemoryRegion
- iommu mr name built with BDF
- rename smmu_get_sid into virtio_iommu_get_sid and use PCI_BUILD_BDF
---
 hw/virtio/trace-events           |   1 +
 hw/virtio/virtio-iommu.c         | 117 +++++++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-iommu.h |   2 +
 3 files changed, 120 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index fba1da6..341dbdf 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -32,3 +32,4 @@ virtio_iommu_attach(uint32_t as, uint32_t dev, uint32_t flags) "as=%d dev=%d fla
 virtio_iommu_detach(uint32_t dev, uint32_t flags) "dev=%d flags=%d"
 virtio_iommu_map(uint32_t as, uint64_t phys_addr, uint64_t virt_addr, uint64_t size, uint32_t flags) "as= %d phys_addr=0x%"PRIx64" virt_addr=0x%"PRIx64" size=0x%"PRIx64" flags=%d"
 virtio_iommu_unmap(uint32_t as, uint64_t virt_addr, uint64_t size, uint32_t reserved) "as= %d virt_addr=0x%"PRIx64" size=0x%"PRIx64" reserved=%d"
+virtio_iommu_translate(const char *name, uint32_t rid, uint64_t iova, int flag) "mr=%s rid=%d addr=0x%"PRIx64" flag=%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 6f5b71c..e663d9e 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -23,6 +23,7 @@
 #include "hw/virtio/virtio.h"
 #include "sysemu/kvm.h"
 #include "qapi-event.h"
+#include "qemu/error-report.h"
 #include "trace.h"
 
 #include "standard-headers/linux/virtio_ids.h"
@@ -35,6 +36,64 @@
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
@@ -208,6 +267,26 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
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
@@ -254,6 +333,21 @@ static const VMStateDescription vmstate_virtio_iommu_device = {
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
@@ -267,6 +361,13 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 
     s->config.page_sizes = TARGET_PAGE_MASK;
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
@@ -321,6 +422,14 @@ static void virtio_iommu_class_init(ObjectClass *klass, void *data)
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
@@ -329,9 +438,17 @@ static const TypeInfo virtio_iommu_info = {
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

