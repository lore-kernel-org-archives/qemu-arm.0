Received: by 10.223.172.38 with SMTP id v35csp4642988wrc;
        Tue, 19 Sep 2017 00:50:42 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDsBl80TEmKOiZhENKLlznbqzQYWephF0p2z+Lu4LcPd0umXx4ZBMrlkgOcFVkw+3PrbOiU
X-Received: by 10.200.49.232 with SMTP id i37mr733537qte.281.1505807442688;
        Tue, 19 Sep 2017 00:50:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505807442; cv=none;
        d=google.com; s=arc-20160816;
        b=iIuoSQKI4qZFz7zY1ZhWiDvO0of1BxJX4aU1tf0ygVaSPGUyQDaK5RwIegviXxZaBP
         D5iv4E7K6zbToi+tteBQCOEmyqbtB4gkUyLWzYQDQYngOococ3miZDSRNHKSxwLOGHsf
         p6J/uCVOdMrU3IjDOK+PD0IIM/jxKK/fA8OmBJquWrTqSkfIoJb7MT/avFDZp2LfIUm2
         Oq7NyOUph2A7RIi39BnQ5iWk4Lj7nLj2gIQ2ahLlhrO3swBo4SdBF03b5pHcJ+41gPyM
         XqAoITvIua39xPd1z1NR0+l0cwv2jQ/GToxbeQu8xeT6a8e9N2/jVxan1nDgZWOSbXbm
         b+/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=aGzprMkaPysXgIsqPNgUnX8scygYHLxAjaycreq384c=;
        b=bq2BcZClqA1mB3qKNPV8kFF+OggIvzsekylptyxGrp/WSq+SKFI6ooavOu7aMaRMuV
         N5QL8Ca0TlE6KtbzKEEnLyxcqh+/N5LdiPWw38OdJkbl0vsw3rfVvNUIt1QDpe4PDef6
         rXfJzWxlp5YRXznuPUXmkIVzFREjpNs7pKxkIYkbUIy087cFXuuGab9o8NXkkO3tYkBs
         jZKCHQMtFYIhP32ePnBlVxUYrqKQL1dBiht2hKID13c5RZ4psq1QrGO1l7BejbnAvjkp
         r16si+UCbnXNm+Um7GCbuswdaMxuW3J1V+Yl4gIIIPSOv6uwRTmrZ8t+eXtUx9JHjrRY
         /HAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o8si8976565qtk.232.2017.09.19.00.50.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 00:50:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40604 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duDIm-0001ly-Cf
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 03:50:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDGS-0008Jq-UA
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 03:48:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDGO-0000rL-EX
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 03:48:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40892)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1duDGO-0000qh-5U; Tue, 19 Sep 2017 03:48:12 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1784D7E445;
	Tue, 19 Sep 2017 07:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1784D7E445
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-197.ams2.redhat.com
	[10.36.116.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8BE5260466;
	Tue, 19 Sep 2017 07:47:59 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Tue, 19 Sep 2017 09:46:38 +0200
Message-Id: <1505807208-9063-7-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 19 Sep 2017 07:48:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 06/16] virtio-iommu: Register attached devices
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
X-TUID: xlAb9eYkRPlP

This patch introduce address space and device internal
datatypes. Both are stored in RB trees. The address space
owns a list of devices attached to it.

It is assumed the devid corresponds to the PCI BDF.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v3 -> v4:
- new separate patch
---
 hw/virtio/trace-events   |   4 ++
 hw/virtio/virtio-iommu.c | 120 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index bc65356..74b92d3 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -38,3 +38,7 @@ virtio_iommu_map(uint32_t as, uint64_t phys_addr, uint64_t virt_addr, uint64_t s
 virtio_iommu_unmap(uint32_t as, uint64_t virt_addr, uint64_t size) "as= %d virt_addr=0x%"PRIx64" size=0x%"PRIx64
 virtio_iommu_translate(const char *name, uint32_t rid, uint64_t iova, int flag) "mr=%s rid=%d addr=0x%"PRIx64" flag=%d"
 virtio_iommu_init_iommu_mr(char *iommu_mr) "init %s"
+virtio_iommu_get_dev(uint32_t devid) "Alloc devid=%d"
+virtio_iommu_put_dev(uint32_t devid) "Free devid=%d"
+virtio_iommu_get_as(uint32_t asid) "Alloc asid=%d"
+virtio_iommu_put_as(uint32_t asid) "Free asid=%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index f4cb76f..41a4bbc 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -32,15 +32,116 @@
 #include "hw/virtio/virtio-bus.h"
 #include "hw/virtio/virtio-access.h"
 #include "hw/virtio/virtio-iommu.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci.h"
 
 /* Max size */
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
 
+typedef struct viommu_as {
+    uint32_t id;
+    GTree *mappings;
+    QLIST_HEAD(, viommu_dev) device_list;
+} viommu_as;
+
+typedef struct viommu_dev {
+    uint32_t id;
+    viommu_as *as;
+    QLIST_ENTRY(viommu_dev) next;
+    VirtIOIOMMU *viommu;
+} viommu_dev;
+
+typedef struct viommu_interval {
+    uint64_t low;
+    uint64_t high;
+} viommu_interval;
+
 static inline uint16_t virtio_iommu_get_sid(IOMMUDevice *dev)
 {
     return PCI_BUILD_BDF(pci_bus_num(dev->bus), dev->devfn);
 }
 
+static gint interval_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
+{
+    viommu_interval *inta = (viommu_interval *)a;
+    viommu_interval *intb = (viommu_interval *)b;
+
+    if (inta->high <= intb->low) {
+        return -1;
+    } else if (intb->high <= inta->low) {
+        return 1;
+    } else {
+        return 0;
+    }
+}
+
+static void virtio_iommu_detach_dev_from_as(viommu_dev *dev)
+{
+    QLIST_REMOVE(dev, next);
+    dev->as = NULL;
+}
+
+static viommu_dev *virtio_iommu_get_dev(VirtIOIOMMU *s, uint32_t devid)
+{
+    viommu_dev *dev;
+
+    dev = g_tree_lookup(s->devices, GUINT_TO_POINTER(devid));
+    if (dev) {
+        return dev;
+    }
+    dev = g_malloc0(sizeof(*dev));
+    dev->id = devid;
+    dev->viommu = s;
+    trace_virtio_iommu_get_dev(devid);
+    g_tree_insert(s->devices, GUINT_TO_POINTER(devid), dev);
+    return dev;
+}
+
+static void virtio_iommu_put_dev(gpointer data)
+{
+    viommu_dev *dev = (viommu_dev *)data;
+
+    if (dev->as) {
+        virtio_iommu_detach_dev_from_as(dev);
+        g_tree_unref(dev->as->mappings);
+    }
+
+    trace_virtio_iommu_put_dev(dev->id);
+    g_free(dev);
+}
+
+viommu_as *virtio_iommu_get_as(VirtIOIOMMU *s, uint32_t asid);
+viommu_as *virtio_iommu_get_as(VirtIOIOMMU *s, uint32_t asid)
+{
+    viommu_as *as;
+
+    as = g_tree_lookup(s->address_spaces, GUINT_TO_POINTER(asid));
+    if (as) {
+        return as;
+    }
+    as = g_malloc0(sizeof(*as));
+    as->id = asid;
+    as->mappings = g_tree_new_full((GCompareDataFunc)interval_cmp,
+                                   NULL, (GDestroyNotify)g_free,
+                                   (GDestroyNotify)g_free);
+    g_tree_insert(s->address_spaces, GUINT_TO_POINTER(asid), as);
+    trace_virtio_iommu_get_as(asid);
+    return as;
+}
+
+static void virtio_iommu_put_as(gpointer data)
+{
+    viommu_as *as = (viommu_as *)data;
+    viommu_dev *iter, *tmp;
+
+    QLIST_FOREACH_SAFE(iter, &as->device_list, next, tmp) {
+        virtio_iommu_detach_dev_from_as(iter);
+    }
+    g_tree_destroy(as->mappings);
+    trace_virtio_iommu_put_as(as->id);
+    g_free(as);
+}
+
 static AddressSpace *virtio_iommu_find_add_as(PCIBus *bus, void *opaque,
                                               int devfn)
 {
@@ -70,6 +171,8 @@ static AddressSpace *virtio_iommu_find_add_as(PCIBus *bus, void *opaque,
         sdev->bus = bus;
         sdev->devfn = devfn;
 
+        virtio_iommu_get_dev(s, PCI_BUILD_BDF(pci_bus_num(bus), devfn));
+
         trace_virtio_iommu_init_iommu_mr(name);
 
         memory_region_init_iommu(&sdev->iommu_mr, sizeof(sdev->iommu_mr),
@@ -360,6 +463,12 @@ static inline guint as_uint64_hash(gconstpointer v)
     return (guint)*(const uint64_t *)v;
 }
 
+static gint int_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
+{
+    uint ua = GPOINTER_TO_UINT(a);
+    uint ub = GPOINTER_TO_UINT(b);
+    return (ua > ub) - (ua < ub);
+}
 
 static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 {
@@ -375,17 +484,28 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     s->config.page_size_mask = TARGET_PAGE_MASK;
     s->config.input_range.end = -1UL;
 
+    qemu_mutex_init(&s->mutex);
+
     memset(s->as_by_bus_num, 0, sizeof(s->as_by_bus_num));
     s->as_by_busptr = g_hash_table_new_full(as_uint64_hash,
                                             as_uint64_equal,
                                             g_free, g_free);
 
+    s->address_spaces = g_tree_new_full((GCompareDataFunc)int_cmp,
+                                         NULL, NULL, virtio_iommu_put_as);
+    s->devices = g_tree_new_full((GCompareDataFunc)int_cmp,
+                                 NULL, NULL, virtio_iommu_put_dev);
+
     virtio_iommu_init_as(s);
 }
 
 static void virtio_iommu_device_unrealize(DeviceState *dev, Error **errp)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
+
+    g_tree_destroy(s->address_spaces);
+    g_tree_destroy(s->devices);
 
     virtio_cleanup(vdev);
 }
-- 
2.5.5

