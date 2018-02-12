Received: by 10.28.71.27 with SMTP id u27csp211904wma;
        Mon, 12 Feb 2018 11:06:55 -0800 (PST)
X-Google-Smtp-Source: AH8x224mzq0QAhUN0QttxNQd+gVdA4vbWVevvrAPUPcPkt1AD5LgwEjB53ZkvjUxcwpmitLxtTkX
X-Received: by 10.37.230.205 with SMTP id d196mr8792977ybh.326.1518462415570;
        Mon, 12 Feb 2018 11:06:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518462415; cv=none;
        d=google.com; s=arc-20160816;
        b=r79kTvg0ZYGGfqE2ylr/d1TOaZkInperCTFtL3vQj6+065BMGPnR5xzmmmodpPgm9N
         QTZaF3/UimujoiyXF+qpvC0exD0g90A4FENpVFZo1FoVopnmd/lJwtBF4OsBXEgI0hXZ
         YvBkl2W5+tPZlfnmmrPXJoWUIT8j8IuT6nz3UabY26JRnJMidW+nxTji5me66J2oFw6x
         x57x6oNADtII6IbNf9GetIQhjAqUzaaAryoLIyIzMcp6areQ9Pn9bfx33uGE31fjOawZ
         /2ihuecW1iAJAJ3Yp9iMXNHp9b9tuF+049SS87Xhja8tG142Hgx8BgVL5O2CWnPBwXUk
         j4GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=tcBnDF5n/TqQpHGMXxLgy9MK5OAWGhfITCw92EbMH8o=;
        b=nTiyvEqBujZdWcuuxDj4Kva/RNLtnXxqLmxVsXnjV5ExyIpHRkcMWPpvD7gmeRLpQR
         FxaeVe9HVzM7NFMx8mDAdu+lKl+m/oC99KSOBWB6DrytVb83DNOemz2XNUO1RwKUFjoZ
         TDUGLyfhmx4WmQMJrc8FRdjWk5IDyeY4STUKHJLSaFgT78qReGqRrqAWlsEQB1qr7w63
         AS8C82RUaCk8WYxLdDh9SL7xg85HZDyum2p9KmUjBQeRXvspezJACSVthInMfIz4WF3p
         ew20FlV8MtdNWUXBThOofmCOvCeQIgDK5LEUUt2ICv9+EfwAYMmSAF51wmNW17J/kNsq
         EBmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l123si1609431ywf.40.2018.02.12.11.06.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 11:06:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39945 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elJRH-0006gr-0Y
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 14:06:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47750)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJKD-0000Q2-Bk
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 13:59:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJKB-0003gC-TI
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 13:59:37 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34222 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1elJKB-0003ez-ON; Mon, 12 Feb 2018 13:59:35 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 327E78182D32;
	Mon, 12 Feb 2018 18:59:35 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-182.ams2.redhat.com [10.36.116.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D1A81251C60;
	Mon, 12 Feb 2018 18:59:31 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Mon, 12 Feb 2018 18:58:10 +0000
Message-Id: <1518461904-5305-9-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
References: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 12 Feb 2018 18:59:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 12 Feb 2018 18:59:35 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v6 08/22] virtio-iommu: Add the iommu regions
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
X-TUID: q2djLkzwEePM

This patch initializes the iommu memory regions so that
PCIe end point transactions get translated. The translation
function is not yet implemented though.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v5 -> v6:
- include qapi/error.h
- fix g_hash_table_lookup key in virtio_iommu_find_add_as

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
 hw/virtio/virtio-iommu.c         | 103 +++++++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-iommu.h |   2 +
 3 files changed, 107 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 15e876f..7123ab2 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -42,3 +42,5 @@ virtio_iommu_attach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
 virtio_iommu_detach(uint32_t ep_id) "endpoint=%d"
 virtio_iommu_map(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end, uint64_t phys_start, uint32_t flags) "domain=%d virt_start=0x%"PRIx64" virt_end=0x%"PRIx64 " phys_start=0x%"PRIx64" flags=%d"
 virtio_iommu_unmap(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end) "domain=%d virt_start=0x%"PRIx64" virt_end=0x%"PRIx64
+virtio_iommu_translate(const char *name, uint32_t rid, uint64_t iova, int flag) "mr=%s rid=%d addr=0x%"PRIx64" flag=%d"
+virtio_iommu_init_iommu_mr(char *iommu_mr) "init %s"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 6cbf007..0840854 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -22,7 +22,11 @@
 #include "qemu-common.h"
 #include "hw/virtio/virtio.h"
 #include "sysemu/kvm.h"
+#include "qapi/error.h"
 #include "qapi-event.h"
+#include "qemu/error-report.h"
+#include "hw/i386/pc.h"
+#include "hw/arm/virt.h"
 #include "trace.h"
 
 #include "standard-headers/linux/virtio_ids.h"
@@ -35,6 +39,50 @@
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
+    IOMMUPciBus *sbus = g_hash_table_lookup(s->as_by_busptr, bus);
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
@@ -215,6 +263,26 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
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
@@ -269,6 +337,17 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
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
@@ -279,6 +358,14 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 
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
@@ -336,6 +423,14 @@ static void virtio_iommu_class_init(ObjectClass *klass, void *data)
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
@@ -344,9 +439,17 @@ static const TypeInfo virtio_iommu_info = {
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

