Received: by 10.25.0.23 with SMTP id 23csp1978632lfa;
        Wed, 7 Jun 2017 01:40:58 -0700 (PDT)
X-Received: by 10.200.48.162 with SMTP id v31mr22475881qta.84.1496824858623;
        Wed, 07 Jun 2017 01:40:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496824858; cv=none;
        d=google.com; s=arc-20160816;
        b=niZd/wnEH5kLkjUSnbKC4KLZE69ytyZEpVpMjZWpVEl4vk7hCB635KJ8HYE0zFZwbC
         tkXiepxmQn+f2LJ0G4QE0igJM4ilcdrhhMAer2OCVyoDpeLmJwphdf/SVGxGDWV5AaMx
         STH1Mg17IswroCenNx1CeS2689jVITsKMHpHZtYNZETp3cf0M2fGmuth2zr08KQpsi2v
         ILAuuGIcf4Ezx0DOjxdJ6dFxfPTlkc0ZVAMpuuZyEorrhW9bULZJqx8e7ftBbj2FX3YV
         6jdnDTnr3dXHjTW6EePkLWcA/HSHV8gQzb/VbJ3Vg7AqjR+JDKgHn1fYuM91Wm1VSAMw
         /Eqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=74Mw3PMrf6r4tPNzbRiOecbqYq//TFCXMJeyiSHqqa8=;
        b=FHwhDbdcGqDmQXZMaBByqqboYxGAOG/WF/Bmc/GaGXF3nFta7RkQFoJ+mr1qv3vJHU
         ri1ZWpNOUWCo5QntcHEFOHy8f6Ndd8NtyiH6qMLMFekBrxWaw6SAfEYrDtOwh/HKdwQz
         ckVN7di4op4Bt0jl186b3kn/HCEQHAzdsB0yPrzPdaDhTFwbHEzZL09VoGjNVbK3jIZs
         p0wMUk6wC2LTWwkUrvLJrKchcJXhlSQUPBrhchjvbKcVP5F/gjEagPaJezen8MJud0jh
         fH7pfibIczFUQbPR3vyWF+oOqhSFUPH1t+oaKqTC4sInumC4ANvrSjHQEbsaY8qtYwx8
         5ycA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o22si1269444qtf.113.2017.06.07.01.40.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Jun 2017 01:40:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41994 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dIWWN-0007Dn-VP
	for alex.bennee@linaro.org; Wed, 07 Jun 2017 04:40:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIWSO-0003VB-Hd
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 04:36:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIWSN-00014V-GL
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 04:36:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43310)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dIWSN-00014E-7a; Wed, 07 Jun 2017 04:36:47 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25CAD8553D;
	Wed,  7 Jun 2017 08:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 25CAD8553D
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 25CAD8553D
Received: from localhost.localdomain.com (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 75C5D176B2;
	Wed,  7 Jun 2017 08:36:42 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Wed,  7 Jun 2017 10:35:53 +0200
Message-Id: <1496824556-1883-6-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1496824556-1883-1-git-send-email-eric.auger@redhat.com>
References: <1496824556-1883-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 07 Jun 2017 08:36:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC 5/8] virtio_iommu: Add the iommu regions
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
Cc: kevin.tian@intel.com, bharat.bhushan@nxp.com, marc.zyngier@arm.com,
	tn@semihalf.com, will.deacon@arm.com, drjones@redhat.com,
	robin.murphy@arm.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GrXsIrg/LSsV

This patch initializes the iommu memory regions so that
PCIe end point transactions get translated. The translation function
is not yet implemented at that stage.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/trace-events   |  1 +
 hw/virtio/virtio-iommu.c | 97 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)

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
index ea1caa7..902c779 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -23,6 +23,7 @@
 #include "hw/virtio/virtio.h"
 #include "sysemu/kvm.h"
 #include "qapi-event.h"
+#include "qemu/error-report.h"
 #include "trace.h"
 
 #include "standard-headers/linux/virtio_ids.h"
@@ -35,6 +36,59 @@
 /* Max size */
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
 
+static inline uint16_t smmu_get_sid(IOMMUDevice *dev)
+{
+    return  ((pci_bus_num(dev->bus) & 0xff) << 8) | dev->devfn;
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
+        sdev = sbus->pbdev[devfn] = g_malloc0(sizeof(IOMMUDevice));
+
+        sdev->viommu = s;
+        sdev->bus = bus;
+        sdev->devfn = devfn;
+
+        memory_region_init_iommu(&sdev->iommu_mr, OBJECT(s),
+                                 &s->iommu_ops, TYPE_VIRTIO_IOMMU,
+                                 UINT64_MAX);
+        address_space_init(&sdev->as, &sdev->iommu_mr, TYPE_VIRTIO_IOMMU);
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
@@ -208,6 +262,26 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
     }
 }
 
+static IOMMUTLBEntry virtio_iommu_translate(MemoryRegion *mr, hwaddr addr,
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
+    sid = smmu_get_sid(sdev);
+
+    trace_virtio_iommu_translate(mr->name, sid, addr, flag);
+    return entry;
+}
+
 static void virtio_iommu_get_config(VirtIODevice *vdev, uint8_t *config_data)
 {
     VirtIOIOMMU *dev = VIRTIO_IOMMU(vdev);
@@ -253,6 +327,21 @@ static const VMStateDescription vmstate_virtio_iommu_device = {
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
@@ -266,6 +355,14 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 
     s->config.page_sizes = ~((1ULL << 12) - 1);
     s->config.input_range.end = -1UL;
+
+    s->iommu_ops.translate = virtio_iommu_translate;
+    memset(s->as_by_bus_num, 0, sizeof(s->as_by_bus_num));
+    s->as_by_busptr = g_hash_table_new_full(as_uint64_hash,
+                                            as_uint64_equal,
+                                            g_free, g_free);
+
+    virtio_iommu_init_as(s);
 }
 
 static void virtio_iommu_device_unrealize(DeviceState *dev, Error **errp)
-- 
2.5.5

