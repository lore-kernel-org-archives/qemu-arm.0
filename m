Received: by 10.25.0.23 with SMTP id 23csp2161742lfa;
        Wed, 7 Jun 2017 09:07:12 -0700 (PDT)
X-Received: by 10.237.43.227 with SMTP id e90mr22130763qtd.103.1496851632848;
        Wed, 07 Jun 2017 09:07:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496851632; cv=none;
        d=google.com; s=arc-20160816;
        b=sMazV0NWpGFtSfWUA6pkUOMeubwKmt6pNwDhw6gWBu5D5aBggqZ72F0RoEg3dOQ4OQ
         JEi4dxwFIrNeuoryHdXowy010H/Bken5k5wqOuUGqXfEKbAXKu3IA9clR112MRnX6Bnx
         c2z9G8zX8I2R6j3bK3yGqV3O6Wl5mBGIHIdE9l6PsPO4KmBqRcg9qCHHsATO61757W5W
         7COKkxu6vKmk7NiVFn8n2alqJV90JAXsS3AIcJWBzgKY7IwyphYLxSHIABURM52twuR0
         5mQERXfhr6MOCUgcotSYteHuCmHO8rcZRIf0JoqXYBGOEFB7rDByMdxSrai1/kE80LFb
         2rog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=f/GN7W7f9SovjFzFVECNofdDukZEbZaO+TKQJDzGNNA=;
        b=oSHM3byrNbn246p5yWWzRQID+IkpHKAm83ho8Qc3TJaiXQ9LiIXlsXuMf2wHiIUNKr
         2pv+2q0hVwUKK0F+leKhx2ZVt/8XqAeAbYnXktn1cZJ+3OW6DkTSzSuGgQfHesa8UApC
         ARJ1MgwfRan9/ODk69icwbK3NUmhE9skOg7E7aLiKyWOiw19ARL7PeSfwwz6f2fWMWVn
         EvWsexS7PIWC4zgoDL4nonHv+90PiNzELQjsiTa7UL+biYCZ3hf0T4hshaP0IO0kc5F2
         3UiIEC1IOOcmSzeFes7K7wW3Tb5iFMlqaoO/yaZJpxxSAFtM64Z/AZZWdE2FIfvGqxcd
         5mjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c3si2383366qkb.54.2017.06.07.09.07.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Jun 2017 09:07:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44949 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dIdUE-000354-2U
	for alex.bennee@linaro.org; Wed, 07 Jun 2017 12:07:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIdPb-0006VE-N2
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 12:02:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIdPZ-000882-OG
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 12:02:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52026)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dIdPZ-00087o-Fq; Wed, 07 Jun 2017 12:02:21 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3CE7A33458E;
	Wed,  7 Jun 2017 16:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3CE7A33458E
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 3CE7A33458E
Received: from localhost.localdomain.com (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 98EC55C46E;
	Wed,  7 Jun 2017 16:02:08 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Wed,  7 Jun 2017 18:01:25 +0200
Message-Id: <1496851287-9428-7-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 07 Jun 2017 16:02:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 6/8] virtio-iommu: Implement the translation and
 commands
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
X-TUID: z5b9tUPVPfbr

This patch adds the actual implementation for the translation routine
and the virtio-iommu commands.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v1 -> v2:
- fix compilation issue reported by autobuild system
---
 hw/virtio/trace-events   |   6 ++
 hw/virtio/virtio-iommu.c | 202 +++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 202 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 341dbdf..9196b63 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -33,3 +33,9 @@ virtio_iommu_detach(uint32_t dev, uint32_t flags) "dev=%d flags=%d"
 virtio_iommu_map(uint32_t as, uint64_t phys_addr, uint64_t virt_addr, uint64_t size, uint32_t flags) "as= %d phys_addr=0x%"PRIx64" virt_addr=0x%"PRIx64" size=0x%"PRIx64" flags=%d"
 virtio_iommu_unmap(uint32_t as, uint64_t virt_addr, uint64_t size, uint32_t reserved) "as= %d virt_addr=0x%"PRIx64" size=0x%"PRIx64" reserved=%d"
 virtio_iommu_translate(const char *name, uint32_t rid, uint64_t iova, int flag) "mr=%s rid=%d addr=0x%"PRIx64" flag=%d"
+virtio_iommu_new_asid(uint32_t asid) "Allocate a new asid=%d"
+virtio_iommu_new_devid(uint32_t devid) "Allocate a new devid=%d"
+virtio_iommu_unmap_left_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap left [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
+virtio_iommu_unmap_right_interval(uint64_t low, uint64_t high, uint64_t next_low, uint64_t next_high) "Unmap right [0x%"PRIx64",0x%"PRIx64"], new interval=[0x%"PRIx64",0x%"PRIx64"]"
+virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc [0x%"PRIx64",0x%"PRIx64"]"
+virtio_iommu_translate_result(uint64_t virt_addr, uint64_t phys_addr, uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=%d"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 902c779..cd188fc 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -32,10 +32,37 @@
 #include "hw/virtio/virtio-bus.h"
 #include "hw/virtio/virtio-access.h"
 #include "hw/virtio/virtio-iommu.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci.h"
 
 /* Max size */
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
 
+typedef struct viommu_as viommu_as;
+
+typedef struct viommu_mapping {
+    uint64_t virt_addr;
+    uint64_t phys_addr;
+    uint64_t size;
+    uint32_t flags;
+} viommu_mapping;
+
+typedef struct viommu_interval {
+    uint64_t low;
+    uint64_t high;
+} viommu_interval;
+
+typedef struct viommu_dev {
+    uint32_t id;
+    viommu_as *as;
+} viommu_dev;
+
+struct viommu_as {
+    uint32_t id;
+    uint32_t nr_devices;
+    GTree *mappings;
+};
+
 static inline uint16_t smmu_get_sid(IOMMUDevice *dev)
 {
     return  ((pci_bus_num(dev->bus) & 0xff) << 8) | dev->devfn;
@@ -88,6 +115,19 @@ static void virtio_iommu_init_as(VirtIOIOMMU *s)
     }
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
 
 static int virtio_iommu_attach(VirtIOIOMMU *s,
                                struct virtio_iommu_req_attach *req)
@@ -95,10 +135,34 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
     uint32_t asid = le32_to_cpu(req->address_space);
     uint32_t devid = le32_to_cpu(req->device);
     uint32_t reserved = le32_to_cpu(req->reserved);
+    viommu_as *as;
+    viommu_dev *dev;
 
     trace_virtio_iommu_attach(asid, devid, reserved);
 
-    return VIRTIO_IOMMU_S_UNSUPP;
+    dev = g_tree_lookup(s->devices, GUINT_TO_POINTER(devid));
+    if (dev) {
+        return -1;
+    }
+
+    as = g_tree_lookup(s->address_spaces, GUINT_TO_POINTER(asid));
+    if (!as) {
+        as = g_malloc0(sizeof(*as));
+        as->id = asid;
+        as->mappings = g_tree_new_full((GCompareDataFunc)interval_cmp,
+                                         NULL, NULL, (GDestroyNotify)g_free);
+        g_tree_insert(s->address_spaces, GUINT_TO_POINTER(asid), as);
+        trace_virtio_iommu_new_asid(asid);
+    }
+
+    dev = g_malloc0(sizeof(*dev));
+    dev->as = as;
+    dev->id = devid;
+    as->nr_devices++;
+    trace_virtio_iommu_new_devid(devid);
+    g_tree_insert(s->devices, GUINT_TO_POINTER(devid), dev);
+
+    return VIRTIO_IOMMU_S_OK;
 }
 
 static int virtio_iommu_detach(VirtIOIOMMU *s,
@@ -106,10 +170,13 @@ static int virtio_iommu_detach(VirtIOIOMMU *s,
 {
     uint32_t devid = le32_to_cpu(req->device);
     uint32_t reserved = le32_to_cpu(req->reserved);
+    int ret;
 
     trace_virtio_iommu_detach(devid, reserved);
 
-    return VIRTIO_IOMMU_S_UNSUPP;
+    ret = g_tree_remove(s->devices, GUINT_TO_POINTER(devid));
+
+    return ret ? VIRTIO_IOMMU_S_OK : VIRTIO_IOMMU_S_INVAL;
 }
 
 static int virtio_iommu_map(VirtIOIOMMU *s,
@@ -120,10 +187,37 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
     uint64_t virt_addr = le64_to_cpu(req->virt_addr);
     uint64_t size = le64_to_cpu(req->size);
     uint32_t flags = le32_to_cpu(req->flags);
+    viommu_as *as;
+    viommu_interval *interval;
+    viommu_mapping *mapping;
+
+    interval = g_malloc0(sizeof(*interval));
+
+    interval->low = virt_addr;
+    interval->high = virt_addr + size - 1;
+
+    as = g_tree_lookup(s->address_spaces, GUINT_TO_POINTER(asid));
+    if (!as) {
+        return VIRTIO_IOMMU_S_INVAL;
+    }
+
+    mapping = g_tree_lookup(as->mappings, (gpointer)interval);
+    if (mapping) {
+        g_free(interval);
+        return VIRTIO_IOMMU_S_INVAL;
+    }
 
     trace_virtio_iommu_map(asid, phys_addr, virt_addr, size, flags);
 
-    return VIRTIO_IOMMU_S_UNSUPP;
+    mapping = g_malloc0(sizeof(*mapping));
+    mapping->virt_addr = virt_addr;
+    mapping->phys_addr = phys_addr;
+    mapping->size = size;
+    mapping->flags = flags;
+
+    g_tree_insert(as->mappings, interval, mapping);
+
+    return VIRTIO_IOMMU_S_OK;
 }
 
 static int virtio_iommu_unmap(VirtIOIOMMU *s,
@@ -133,10 +227,64 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
     uint64_t virt_addr = le64_to_cpu(req->virt_addr);
     uint64_t size = le64_to_cpu(req->size);
     uint32_t flags = le32_to_cpu(req->flags);
+    viommu_mapping *mapping;
+    viommu_interval interval;
+    viommu_as *as;
 
     trace_virtio_iommu_unmap(asid, virt_addr, size, flags);
 
-    return VIRTIO_IOMMU_S_UNSUPP;
+    as = g_tree_lookup(s->address_spaces, GUINT_TO_POINTER(asid));
+    if (!as) {
+        error_report("%s: no as", __func__);
+        return VIRTIO_IOMMU_S_INVAL;
+    }
+    interval.low = virt_addr;
+    interval.high = virt_addr + size - 1;
+
+    mapping = g_tree_lookup(as->mappings, (gpointer)&interval);
+
+    while (mapping) {
+        viommu_interval current;
+        uint64_t low  = mapping->virt_addr;
+        uint64_t high = mapping->virt_addr + mapping->size - 1;
+
+        current.low = low;
+        current.high = high;
+
+        if (low == interval.low && size >= mapping->size) {
+            g_tree_remove(as->mappings, (gpointer)&current);
+            interval.low = high + 1;
+            trace_virtio_iommu_unmap_left_interval(current.low, current.high,
+                interval.low, interval.high);
+        } else if (high == interval.high && size >= mapping->size) {
+            trace_virtio_iommu_unmap_right_interval(current.low, current.high,
+                interval.low, interval.high);
+            g_tree_remove(as->mappings, (gpointer)&current);
+            interval.high = low - 1;
+        } else if (low > interval.low && high < interval.high) {
+            trace_virtio_iommu_unmap_inc_interval(current.low, current.high);
+            g_tree_remove(as->mappings, (gpointer)&current);
+        } else {
+            break;
+        }
+        if (interval.low >= interval.high) {
+            return VIRTIO_IOMMU_S_OK;
+        } else {
+            mapping = g_tree_lookup(as->mappings, (gpointer)&interval);
+        }
+    }
+
+    if (mapping) {
+        error_report("****** %s: Unmap 0x%"PRIx64" size=0x%"PRIx64
+                     " from 0x%"PRIx64" size=0x%"PRIx64" is not supported",
+                     __func__, interval.low, size,
+                     mapping->virt_addr, mapping->size);
+    } else {
+        error_report("****** %s: no mapping for [0x%"PRIx64",0x%"PRIx64"]",
+                     __func__, interval.low, interval.high);
+    }
+
+    return VIRTIO_IOMMU_S_INVAL;
 }
 
 #define get_payload_size(req) (\
@@ -266,19 +414,46 @@ static IOMMUTLBEntry virtio_iommu_translate(MemoryRegion *mr, hwaddr addr,
                                             IOMMUAccessFlags flag)
 {
     IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
+    VirtIOIOMMU *s = sdev->viommu;
     uint32_t sid;
+    viommu_dev *dev;
+    viommu_mapping *mapping;
+    viommu_interval interval;
+
+    interval.low = addr;
+    interval.high = addr + 1;
 
     IOMMUTLBEntry entry = {
         .target_as = &address_space_memory,
         .iova = addr,
         .translated_addr = addr,
-        .addr_mask = ~(hwaddr)0,
-        .perm = IOMMU_NONE,
+        .addr_mask = (1 << 12) - 1, /* TODO */
+        .perm = 3,
     };
 
     sid = smmu_get_sid(sdev);
 
     trace_virtio_iommu_translate(mr->name, sid, addr, flag);
+    qemu_mutex_lock(&s->mutex);
+
+    dev = g_tree_lookup(s->devices, GUINT_TO_POINTER(sid));
+    if (!dev) {
+        /* device cannot be attached to another as */
+        printf("%s sid=%d is not known!!\n", __func__, sid);
+        goto unlock;
+    }
+
+    mapping = g_tree_lookup(dev->as->mappings, (gpointer)&interval);
+    if (!mapping) {
+        printf("%s no mapping for 0x%"PRIx64" for sid=%d\n", __func__,
+               addr, sid);
+        goto unlock;
+    }
+    entry.translated_addr = addr - mapping->virt_addr + mapping->phys_addr,
+    trace_virtio_iommu_translate_result(addr, entry.translated_addr, sid);
+
+unlock:
+    qemu_mutex_unlock(&s->mutex);
     return entry;
 }
 
@@ -341,6 +516,12 @@ static inline guint as_uint64_hash(gconstpointer v)
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
@@ -362,12 +543,21 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
                                             as_uint64_equal,
                                             g_free, g_free);
 
+    s->address_spaces = g_tree_new_full((GCompareDataFunc)int_cmp,
+                                         NULL, NULL, (GDestroyNotify)g_free);
+    s->devices = g_tree_new_full((GCompareDataFunc)int_cmp,
+                                         NULL, NULL, (GDestroyNotify)g_free);
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

