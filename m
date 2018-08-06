Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3445452wru;
        Mon, 6 Aug 2018 13:18:45 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdys23xy+PUrntaqNTpbFUvil9SKEdIz4X7uY721WpWPrP5GImDiaCLruGXsznOKV+ANFZM
X-Received: by 2002:ac8:31b7:: with SMTP id h52-v6mr16081290qte.380.1533586725085;
        Mon, 06 Aug 2018 13:18:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533586725; cv=none;
        d=google.com; s=arc-20160816;
        b=yohxN12/cQpOQFPceKgcPR24eaMO94GQeAyBwFND0LjyrkTrFYdGoRU1aa1fCa56ac
         g/Euo9IjxQcAGCr0p89X3NOLNmd71yfyRCD6bhAhyd+Yor6o7U6HIrBoj+is0COe/33C
         /t7mcPy4+siDi24G0wanFN2Vxi8Oquh07cI/XmEQkM7Xvez5YsnGNUExL84cW3Ju0+9j
         TRwDA8j+2zU5+x6EGQFcBVpw7H40Qi+4Y47q0Sp5vljbf3Utz2AYhKJd9/84vqjiCJTH
         QNjB0TIu/Krv2FNNVrA8DJV7mYwn2A97hUU+qHal5EWTAfNpMT6o1f33sVTSkcpMtgSP
         ELrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=gv0FZ2zxZ7kXO6XgapgZJA/TkrvKibeYSGGa4QZQtA8=;
        b=r0Lc7sZTKMjM0VEYElieC9sc66uMDYM6x+LEdtzW8PsEWemc2XKC3hs1LhaofwDDQ4
         fbgzhNWfT34mzNNCHbiexqyoyK5rn8l3JMTxCxtoz2qI4K+7dfc2zdjZxllNiiAPxz4a
         ohp6q0bQr8ARSTIzkNTvjijNCnODva/wX2zMT3YAA0m+V1rdI4ZeKpS5kSLKtwkuxgp1
         LPUtvyeNwyzmuxPi3Mnrw33q3Z1j9Qd43pHH6zGsJqLa8d3K0OEnlsfZnrF7wMdvMY1W
         BOmM1hrqtWEjVXPwOAKXTZcx18Oy7Bi+h+9gIRO2olL2pw/0aXrm0mFxkN7z4zB7542k
         +5hg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m64-v6si4691880qkf.402.2018.08.06.13.18.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 13:18:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36108 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmlxk-0000R0-Ha
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 16:18:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmluD-0005uF-D0
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 16:15:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmluC-0006ai-1E
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 16:15:05 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40462 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fmluB-0006aW-RK; Mon, 06 Aug 2018 16:15:03 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 555EC40241C4;
	Mon,  6 Aug 2018 20:15:03 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F2D9E2166BA0;
	Mon,  6 Aug 2018 20:14:59 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	mst@redhat.com, jean-philippe.brucker@arm.com
Date: Mon,  6 Aug 2018 22:14:32 +0200
Message-Id: <1533586484-5737-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
References: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 06 Aug 2018 20:15:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 06 Aug 2018 20:15:03 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v7 04/16] virtio-iommu: Add the iommu regions
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
Cc: kevin.tian@intel.com, tn@semihalf.com, will.deacon@arm.com,
	drjones@redhat.com, peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +kLy4XsS8b5u

This patch initializes the iommu memory regions so that
PCIe end point transactions get translated. The translation
function is not yet implemented though.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v6 -> v7:
- use primary_bus
- rebase on new translate proto featuring iommu_idx

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
 hw/virtio/trace-events           |  2 +
 hw/virtio/virtio-iommu.c         | 94 ++++++++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-iommu.h |  2 +
 3 files changed, 98 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index f6675cf..bc6e5c4 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -57,3 +57,5 @@ virtio_iommu_attach(uint32_t domain_id, uint32_t ep_id) "domain=%d endpoint=%d"
 virtio_iommu_detach(uint32_t ep_id) "endpoint=%d"
 virtio_iommu_map(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end, uint64_t phys_start, uint32_t flags) "domain=%d virt_start=0x%"PRIx64" virt_end=0x%"PRIx64 " phys_start=0x%"PRIx64" flags=%d"
 virtio_iommu_unmap(uint32_t domain_id, uint64_t virt_start, uint64_t virt_end) "domain=%d virt_start=0x%"PRIx64" virt_end=0x%"PRIx64
+virtio_iommu_translate(const char *name, uint32_t rid, uint64_t iova, int flag) "mr=%s rid=%d addr=0x%"PRIx64" flag=%d"
+virtio_iommu_init_iommu_mr(char *iommu_mr) "init %s"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 492cf22..f2f5310 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -22,6 +22,10 @@
 #include "qemu-common.h"
 #include "hw/virtio/virtio.h"
 #include "sysemu/kvm.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "hw/i386/pc.h"
+#include "hw/arm/virt.h"
 #include "trace.h"
 
 #include "standard-headers/linux/virtio_ids.h"
@@ -34,6 +38,50 @@
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
@@ -214,6 +262,27 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
     }
 }
 
+static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
+                                            IOMMUAccessFlags flag,
+                                            int iommu_idx)
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
@@ -278,6 +347,15 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 
     s->config.page_size_mask = TARGET_PAGE_MASK;
     s->config.input_range.end = -1UL;
+
+    memset(s->as_by_bus_num, 0, sizeof(s->as_by_bus_num));
+    s->as_by_busptr = g_hash_table_new(NULL, NULL);
+
+    if (s->primary_bus) {
+        pci_setup_iommu(s->primary_bus, virtio_iommu_find_add_as, s);
+    } else {
+        error_setg(errp, "VIRTIO-IOMMU is not attached to any PCI bus!");
+    }
 }
 
 static void virtio_iommu_device_unrealize(DeviceState *dev, Error **errp)
@@ -336,6 +414,14 @@ static void virtio_iommu_class_init(ObjectClass *klass, void *data)
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
@@ -344,9 +430,17 @@ static const TypeInfo virtio_iommu_info = {
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
index f54d09b..913e96b 100644
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

