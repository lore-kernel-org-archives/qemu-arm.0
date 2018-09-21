Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2859267wrd;
        Fri, 21 Sep 2018 01:28:00 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYCpdGza5KIDIXPFuCUAdbJCE/ZOIRtqklD3u4hXxfQFL4Y3kUrZjc0zfyBPTGT4JSNSUtG
X-Received: by 2002:ae9:ed4b:: with SMTP id c72-v6mr28851754qkg.54.1537518480565;
        Fri, 21 Sep 2018 01:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537518480; cv=none;
        d=google.com; s=arc-20160816;
        b=lagSca4YG4KdxMBkcLfxtwAtdzWYPwokmMmcQraijH2GtSXEOcCQ5uu/zCD8+afKTz
         yPVL5LxWf8JLvOVqRjcDACQmFbk7a5aAxAzAoQL8oJOml6Z01UMaH4Y3hyHRDpjQqdN4
         tnoR68NCgPd0ESF/Wrhv9+X2PZnpA5u4hGMGaYKPCQIAKlqD9NQaPBAlIpU65bYqxMwj
         vCf3WTvicaoENHZF5aXOVOksW3ajSLDrPyWQ5fUgnnAwBpSJwvfEvUdL2NZIytG+pEjz
         TuUdXcT6HwKCSKbxT12opQhzxBPUMGbpVu0/tj5Zcr706k/yFSL/NwRwhsNHKMHLYxvI
         jotg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=MkBEMdbui3RBVdq1uPuef57UQt4HeZzu7l23MAkYhtQ=;
        b=uiJKaBZT09gcYXLpq9vozk4ki7Zm/8H/Zr7I2RcKb7FnNncrbUkyt42/ymJsAqoCKE
         VvCI93PNsy1T9u2buHYUXnuHD46HHDZm+0lpJfWY6TCb3Yk7iKQkOlL8tAvg+6dCJ6x3
         pxE2vf8/aD+UDLI0BYFopQwA0zAws7g0VlZOiK//OmeqemJwsX3qVPenC+8T4p0tSEJQ
         HUdCnCLNuujsTRbQKi75haonaIeilPRtNBxkLNaN6NQRPP5l+vgZUqdQTzY5PFv44ffB
         BZs/5NiovtGcHq7nopMWmkvZ15IlEMyovgxCDQs5DwCApBva8kqEjESFZCRLJw603C/g
         1xug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w36-v6si8213730qvc.209.2018.09.21.01.28.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:28:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54400 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3GnA-0004Ic-0s
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:28:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47718)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3GfH-0004KN-Kv
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:19:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3GfG-0003xm-Cn
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:19:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50094)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3GfG-0003wO-2b; Fri, 21 Sep 2018 04:19:50 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2958A356F6;
	Fri, 21 Sep 2018 08:19:49 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 974AC7D665;
	Fri, 21 Sep 2018 08:19:35 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:18:00 +0200
Message-Id: <20180921081819.9203-10-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 21 Sep 2018 08:19:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 09/28] memory: Introduce IOMMUIOLTBNotifier
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
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nraT/TSj9wzI

Current IOMMUNotifiers dedicate to IOTLB related notifications.
We want to introduce notifiers for virtual IOMMU config changes.
Let's create a new IOMMUIOLTBNotifier datatype. This paves the way
to the introduction of an IOMMUConfigNotifier. IOMMUNotifier
now has an iotlb_notifier field. We change all calling sites.

We also rename IOMMU_NOTIFIER_ALL into IOMMU_NOTIFIER_IOTLB_ALL

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 exec.c                | 12 ++++++------
 hw/arm/smmu-common.c  |  4 ++--
 hw/i386/intel_iommu.c |  6 +++---
 hw/vfio/common.c      | 12 ++++++------
 hw/virtio/vhost.c     | 12 ++++++------
 include/exec/memory.h | 25 +++++++++++++++----------
 memory.c              | 10 +++++-----
 7 files changed, 43 insertions(+), 38 deletions(-)

diff --git a/exec.c b/exec.c
index 6826c8337d..1411660289 100644
--- a/exec.c
+++ b/exec.c
@@ -683,12 +683,12 @@ static void tcg_register_iommu_notifier(CPUState *cpu,
          * just register interest in the whole thing, on the assumption
          * that iommu reconfiguration will be rare.
          */
-        iommu_notifier_init(&notifier->n,
-                            tcg_iommu_unmap_notify,
-                            IOMMU_NOTIFIER_UNMAP,
-                            0,
-                            HWADDR_MAX,
-                            iommu_idx);
+        iommu_iotlb_notifier_init(&notifier->n,
+                                  tcg_iommu_unmap_notify,
+                                  IOMMU_NOTIFIER_UNMAP,
+                                  0,
+                                  HWADDR_MAX,
+                                  iommu_idx);
         memory_region_register_iommu_notifier(notifier->mr, &notifier->n);
     }
 
diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 3f55cfd193..ad6ef2135b 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -391,9 +391,9 @@ static void smmu_unmap_notifier_range(IOMMUNotifier *n)
     IOMMUTLBEntry entry;
 
     entry.target_as = &address_space_memory;
-    entry.iova = n->start;
+    entry.iova = n->iotlb_notifier.start;
     entry.perm = IOMMU_NONE;
-    entry.addr_mask = n->end - n->start;
+    entry.addr_mask = n->iotlb_notifier.end - n->iotlb_notifier.start;
 
     memory_region_notify_one(n, &entry);
 }
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 3dfada19a6..0dbd9512f2 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -2984,8 +2984,8 @@ static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
 {
     IOMMUTLBEntry entry;
     hwaddr size;
-    hwaddr start = n->start;
-    hwaddr end = n->end;
+    hwaddr start = n->iotlb_notifier.start;
+    hwaddr end = n->iotlb_notifier.end;
     IntelIOMMUState *s = as->iommu_state;
     DMAMap map;
 
@@ -3021,7 +3021,7 @@ static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
 
     entry.target_as = &address_space_memory;
     /* Adjust iova for the size */
-    entry.iova = n->start & ~(size - 1);
+    entry.iova = n->iotlb_notifier.start & ~(size - 1);
     /* This field is meaningless for unmap */
     entry.translated_addr = 0;
     entry.perm = IOMMU_NONE;
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 1416892f1c..19dfc279d6 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -527,11 +527,11 @@ static void vfio_listener_region_add(MemoryListener *listener,
         llend = int128_sub(llend, int128_one());
         iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
                                                        MEMTXATTRS_UNSPECIFIED);
-        iommu_notifier_init(&giommu->n, vfio_iommu_map_notify,
-                            IOMMU_NOTIFIER_ALL,
-                            section->offset_within_region,
-                            int128_get64(llend),
-                            iommu_idx);
+        iommu_iotlb_notifier_init(&giommu->n, vfio_iommu_map_notify,
+                                  IOMMU_NOTIFIER_IOTLB_ALL,
+                                  section->offset_within_region,
+                                  int128_get64(llend),
+                                  iommu_idx);
         QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
 
         memory_region_register_iommu_notifier(section->mr, &giommu->n);
@@ -625,7 +625,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
 
         QLIST_FOREACH(giommu, &container->giommu_list, giommu_next) {
             if (MEMORY_REGION(giommu->iommu) == section->mr &&
-                giommu->n.start == section->offset_within_region) {
+                giommu->n.iotlb_notifier.start == section->offset_within_region) {
                 memory_region_unregister_iommu_notifier(section->mr,
                                                         &giommu->n);
                 QLIST_REMOVE(giommu, giommu_next);
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index d4cb5894a8..c21b9b8be9 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -677,11 +677,11 @@ static void vhost_iommu_region_add(MemoryListener *listener,
     end = int128_sub(end, int128_one());
     iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
                                                    MEMTXATTRS_UNSPECIFIED);
-    iommu_notifier_init(&iommu->n, vhost_iommu_unmap_notify,
-                        IOMMU_NOTIFIER_UNMAP,
-                        section->offset_within_region,
-                        int128_get64(end),
-                        iommu_idx);
+    iommu_iotlb_notifier_init(&iommu->n, vhost_iommu_unmap_notify,
+                              IOMMU_NOTIFIER_UNMAP,
+                              section->offset_within_region,
+                              int128_get64(end),
+                              iommu_idx);
     iommu->mr = section->mr;
     iommu->iommu_offset = section->offset_within_address_space -
                           section->offset_within_region;
@@ -704,7 +704,7 @@ static void vhost_iommu_region_del(MemoryListener *listener,
 
     QLIST_FOREACH(iommu, &dev->iommu_list, iommu_next) {
         if (iommu->mr == section->mr &&
-            iommu->n.start == section->offset_within_region) {
+            iommu->n.iotlb_notifier.start == section->offset_within_region) {
             memory_region_unregister_iommu_notifier(iommu->mr,
                                                     &iommu->n);
             QLIST_REMOVE(iommu, iommu_next);
diff --git a/include/exec/memory.h b/include/exec/memory.h
index b6e59c139c..31fc859c6b 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -86,18 +86,22 @@ typedef enum {
     IOMMU_NOTIFIER_MAP = 0x2,
 } IOMMUNotifierFlag;
 
-#define IOMMU_NOTIFIER_ALL (IOMMU_NOTIFIER_MAP | IOMMU_NOTIFIER_UNMAP)
+#define IOMMU_NOTIFIER_IOTLB_ALL (IOMMU_NOTIFIER_MAP | IOMMU_NOTIFIER_UNMAP)
 
 struct IOMMUNotifier;
 typedef void (*IOMMUNotify)(struct IOMMUNotifier *notifier,
                             IOMMUTLBEntry *data);
 
-struct IOMMUNotifier {
+typedef struct IOMMUIOLTBNotifier {
     IOMMUNotify notify;
-    IOMMUNotifierFlag notifier_flags;
     /* Notify for address space range start <= addr <= end */
     hwaddr start;
     hwaddr end;
+} IOMMUIOLTBNotifier;
+
+struct IOMMUNotifier {
+    IOMMUNotifierFlag notifier_flags;
+    IOMMUIOLTBNotifier iotlb_notifier;
     int iommu_idx;
     QLIST_ENTRY(IOMMUNotifier) node;
 };
@@ -126,15 +130,16 @@ typedef struct IOMMUNotifier IOMMUNotifier;
 /* RAM is a persistent kind memory */
 #define RAM_PMEM (1 << 5)
 
-static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
-                                       IOMMUNotifierFlag flags,
-                                       hwaddr start, hwaddr end,
-                                       int iommu_idx)
+static inline void iommu_iotlb_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
+                                             IOMMUNotifierFlag flags,
+                                             hwaddr start, hwaddr end,
+                                             int iommu_idx)
 {
-    n->notify = fn;
+    assert(flags & IOMMU_NOTIFIER_MAP || flags & IOMMU_NOTIFIER_UNMAP);
     n->notifier_flags = flags;
-    n->start = start;
-    n->end = end;
+    n->iotlb_notifier.notify = fn;
+    n->iotlb_notifier.start = start;
+    n->iotlb_notifier.end = end;
     n->iommu_idx = iommu_idx;
 }
 
diff --git a/memory.c b/memory.c
index 9b73892768..b7e2e43b68 100644
--- a/memory.c
+++ b/memory.c
@@ -1800,7 +1800,7 @@ void memory_region_register_iommu_notifier(MemoryRegion *mr,
     /* We need to register for at least one bitfield */
     iommu_mr = IOMMU_MEMORY_REGION(mr);
     assert(n->notifier_flags != IOMMU_NOTIFIER_NONE);
-    assert(n->start <= n->end);
+    assert(n->iotlb_notifier.start <= n->iotlb_notifier.end);
     assert(n->iommu_idx >= 0 &&
            n->iommu_idx < memory_region_iommu_num_indexes(iommu_mr));
 
@@ -1836,7 +1836,7 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
     for (addr = 0; addr < memory_region_size(mr); addr += granularity) {
         iotlb = imrc->translate(iommu_mr, addr, IOMMU_NONE, n->iommu_idx);
         if (iotlb.perm != IOMMU_NONE) {
-            n->notify(n, &iotlb);
+            n->iotlb_notifier.notify(n, &iotlb);
         }
 
         /* if (2^64 - MR size) < granularity, it's possible to get an
@@ -1879,8 +1879,8 @@ void memory_region_notify_one(IOMMUNotifier *notifier,
      * Skip the notification if the notification does not overlap
      * with registered range.
      */
-    if (notifier->start > entry->iova + entry->addr_mask ||
-        notifier->end < entry->iova) {
+    if (notifier->iotlb_notifier.start > entry->iova + entry->addr_mask ||
+        notifier->iotlb_notifier.end < entry->iova) {
         return;
     }
 
@@ -1891,7 +1891,7 @@ void memory_region_notify_one(IOMMUNotifier *notifier,
     }
 
     if (notifier->notifier_flags & request_flags) {
-        notifier->notify(notifier, entry);
+        notifier->iotlb_notifier.notify(notifier, entry);
     }
 }
 
-- 
2.17.1

