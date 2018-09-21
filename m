Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2875926wrd;
        Fri, 21 Sep 2018 01:48:14 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZBDp7YE4ZmXdeqtY+J1tbTc79HeFda5XeMcvvFkLIvn7kHFN7x4U29l2XE3Y43ZXz/fT+P
X-Received: by 2002:a37:84c4:: with SMTP id g187-v6mr30696490qkd.49.1537519694190;
        Fri, 21 Sep 2018 01:48:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537519694; cv=none;
        d=google.com; s=arc-20160816;
        b=h+SE5gjBuzdAHTJB8Nuj9NBL5kQCasyBiSUuWEH+17H7pzDSoFsW8bZZwVNM2tgmN8
         drUzhyH/bCyFymvOJOPIuQARDilawIX284x73Tns5IcoyNj5Sijuvo0rFqc3cyVUY2gw
         soNL1kOpgvKY/qMY/dA47IQ5g7/SZPhwcXS5jJ2qeDsFehINRxzVGN/rTFf1kfHYZ0CC
         GqvJLqWWuyyZI1cmlQ7ZqkSJFUnuJvNUUflLYid1o2GqZYURZ5I06wRwXEOLSXrDGdCI
         mBY7NVaMMhAZHl0KX4Sv6QwNT2WDKo4WzHjWQGufJt2GdlUIJLKvOTedxUBFjKHn+m6q
         T09w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=HwrbmMfn6QeH4/X5lWd0XPKMQQfDfR0niVU7Eq23oq4=;
        b=xvo55iIVR9cHB5Fvkn3R8pJRJDVHewO6urRnbPHrJGYhy2yzUeNhsN8ujaSPGFFdI6
         8/XQlqbjVNxDempXNgdglsB4lS3LshXl1WBBIjmM6A4gz9BLDoVT6gXIEqyyfHIYqPX9
         o/AMKGdrh5AsQF1tgDv2jBclruHYEx0HvUCozN7OE0Y7VrdaYVxzUnG+4amOtLegsVti
         yeb4qgMYfVEjdzAkJXFc6AXDUTGlgmgcZXZNZpXjSUvdr38r3fadmxmi6B0pZb8EyuxJ
         3xaLqR03I2ohv5lvihK5mVoBIvR+rxL4xCLSPoDVSXPQZ999yyujGZgCjacCEST54AoA
         oBRw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d5-v6si15914295qkf.371.2018.09.21.01.48.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:48:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54538 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3H6j-00071N-Li
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:48:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3GgM-0005I2-Vl
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:21:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3GgL-0006J1-KL
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:20:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52996)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3GgL-0006GL-8o; Fri, 21 Sep 2018 04:20:57 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8370F308FBA9;
	Fri, 21 Sep 2018 08:20:56 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 687F07D665;
	Fri, 21 Sep 2018 08:20:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:18:10 +0200
Message-Id: <20180921081819.9203-20-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 21 Sep 2018 08:20:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 19/28] hw/vfio/common: Register specific nested
 mode notifiers and memory_listener
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
X-TUID: c7E2pnCz6uvG

In nested mode, legacy vfio_iommu_map_notify MAP/UNMAP notifier
cannot be used anymore. Indeed there is no caching mode in
place that allows to trap MAP events. Only configuration change
and UNMAP events can be trapped. As such we register
- one configuration notifier, whose role is to propagate the
  configuration update downto the host
- one UNMAP notifier, whose role is to propagate the TLB
  invalidation at physical IOMMU level.

Those notifiers propagate the guest stage 1 mappings at physical
level.

Also as there is no MAP event, the stage 2 mapping is not handled
anymore by the vfio_iommu_map_notify notifier.

We register a prereg_listener whose role is to dma_(un)map the RAM
memory regions. This programs the stage 2.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v1 -> v2:
- adapt to uapi changes
- pass the asid
- pass IOMMU_NOTIFIER_S1_CFG when initializing the config notifier
---
 hw/vfio/common.c | 167 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 137 insertions(+), 30 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 83f5f2263d..77bdb76ade 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -349,6 +349,65 @@ static bool vfio_get_vaddr(IOMMUTLBEntry *iotlb, void **vaddr,
     return true;
 }
 
+/* Program the guest @cfg on physical IOMMU stage 1 (nested mode) */
+static void vfio_iommu_nested_notify(IOMMUNotifier *n,
+                                     IOMMUConfig *cfg)
+{
+    VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
+    VFIOContainer *container = giommu->container;
+    struct vfio_iommu_type1_bind_pasid_table info;
+    int ret;
+
+    info.argsz = sizeof(info);
+    info.flags = 0;
+    memcpy(&info.config, &cfg->pasid_cfg, sizeof(cfg->pasid_cfg));
+
+    ret = ioctl(container->fd, VFIO_IOMMU_BIND_PASID_TABLE, &info);
+    if (ret) {
+        error_report("%s: failed to pass S1 config to the host (%d)",
+                     __func__, ret);
+    }
+}
+
+/* Propagate a guest invalidation downto the physical IOMMU (nested mode) */
+static void vfio_iommu_unmap_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
+{
+    VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
+    hwaddr start = iotlb->iova + giommu->iommu_offset;
+
+    VFIOContainer *container = giommu->container;
+    struct vfio_iommu_type1_cache_invalidate ustruct;
+    int ret;
+
+    assert(iotlb->perm == IOMMU_NONE);
+
+    ustruct.argsz = sizeof(ustruct);
+    ustruct.flags = 0;
+    ustruct.info.hdr.version = TLB_INV_HDR_VERSION_1;
+    ustruct.info.hdr.type = IOMMU_INV_TYPE_TLB;
+    ustruct.info.granularity = IOMMU_INV_NR_GRANU;
+    ustruct.info.flags = IOMMU_INVALIDATE_GLOBAL_PAGE;
+    /* 2^size of 4K pages, 0 for 4k, 9 for 2MB, etc. */
+    ustruct.info.size = ctz64(~iotlb->addr_mask) - 12;
+    /*
+     * TODO: at the moment we invalidate the whole ASID instead
+     * of invalidating the given nb_pages (nb_pages = 0):
+     * mask covering the whole GPA range is observed: in this case we shall
+     * invalidate the whole ASID (NH_ASID) and not induce storm of
+     * NH_VA commands.
+     */
+    ustruct.info.nr_pages = 0;
+    ustruct.info.addr = start;
+    ustruct.info.arch_id = iotlb->arch_id;
+
+    ret = ioctl(container->fd, VFIO_IOMMU_CACHE_INVALIDATE, &ustruct);
+    if (ret) {
+        error_report("%s: failed to invalidate CACHE for 0x%"PRIx64
+                     " mask=0x%"PRIx64" (%d)",
+                     __func__, start, iotlb->addr_mask, ret);
+    }
+}
+
 static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
 {
     VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
@@ -533,6 +592,32 @@ static void vfio_dma_unmap_ram_section(VFIOContainer *container,
     }
 }
 
+static void vfio_prereg_listener_region_add(MemoryListener *listener,
+                                            MemoryRegionSection *section)
+{
+    VFIOContainer *container =
+        container_of(listener, VFIOContainer, prereg_listener);
+
+    if (!memory_region_is_ram(section->mr)) {
+        return;
+    }
+
+    vfio_dma_map_ram_section(container, section);
+
+}
+static void vfio_prereg_listener_region_del(MemoryListener *listener,
+                                     MemoryRegionSection *section)
+{
+    VFIOContainer *container =
+        container_of(listener, VFIOContainer, prereg_listener);
+
+    if (!memory_region_is_ram(section->mr)) {
+        return;
+    }
+
+    vfio_dma_unmap_ram_section(container, section);
+}
+
 static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
@@ -541,7 +626,6 @@ static void vfio_listener_region_add(MemoryListener *listener,
     Int128 llend;
     int ret;
     VFIOHostDMAWindow *hostwin;
-    bool hostwin_found;
 
     if (vfio_listener_skipped_section(section)) {
         trace_vfio_listener_region_add_skip(
@@ -618,26 +702,10 @@ static void vfio_listener_region_add(MemoryListener *listener,
 #endif
     }
 
-    hostwin_found = false;
-    QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
-        if (hostwin->min_iova <= iova && end <= hostwin->max_iova) {
-            hostwin_found = true;
-            break;
-        }
-    }
-
-    if (!hostwin_found) {
-        error_report("vfio: IOMMU container %p can't map guest IOVA region"
-                     " 0x%"HWADDR_PRIx"..0x%"HWADDR_PRIx,
-                     container, iova, end);
-        ret = -EFAULT;
-        goto fail;
-    }
-
     memory_region_ref(section->mr);
 
     if (memory_region_is_iommu(section->mr)) {
-        VFIOGuestIOMMU *giommu;
+        VFIOGuestIOMMU *giommu = NULL;
         IOMMUMemoryRegion *iommu_mr = IOMMU_MEMORY_REGION(section->mr);
         hwaddr offset;
         int iommu_idx;
@@ -652,21 +720,40 @@ static void vfio_listener_region_add(MemoryListener *listener,
 
         offset = section->offset_within_address_space -
                     section->offset_within_region;
-        giommu = vfio_alloc_guest_iommu(container, iommu_mr, offset);
-
         llend = int128_add(int128_make64(section->offset_within_region),
                            section->size);
         llend = int128_sub(llend, int128_one());
         iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
                                                        MEMTXATTRS_UNSPECIFIED);
-        iommu_iotlb_notifier_init(&giommu->n, vfio_iommu_map_notify,
-                                  IOMMU_NOTIFIER_IOTLB_ALL,
-                                  section->offset_within_region,
-                                  int128_get64(llend),
-                                  iommu_idx);
-        QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
 
-        memory_region_register_iommu_notifier(section->mr, &giommu->n);
+        if (container->iommu_type == VFIO_TYPE1_NESTING_IOMMU) {
+            /* Config notifier to propagate guest stage 1 config changes */
+            giommu = vfio_alloc_guest_iommu(container, iommu_mr, offset);
+            iommu_config_notifier_init(&giommu->n, vfio_iommu_nested_notify,
+                                       IOMMU_NOTIFIER_PASID_CFG, iommu_idx);
+            QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
+            memory_region_register_iommu_notifier(section->mr, &giommu->n);
+
+            /* IOTLB unmap notifier to propagate guest IOTLB invalidations */
+            giommu = vfio_alloc_guest_iommu(container, iommu_mr, offset);
+            iommu_iotlb_notifier_init(&giommu->n, vfio_iommu_unmap_notify,
+                                      IOMMU_NOTIFIER_UNMAP,
+                                      section->offset_within_region,
+                                      int128_get64(llend),
+                                      iommu_idx);
+            QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
+            memory_region_register_iommu_notifier(section->mr, &giommu->n);
+        } else {
+            /* MAP/UNMAP IOTLB notifier */
+            giommu = vfio_alloc_guest_iommu(container, iommu_mr, offset);
+            iommu_iotlb_notifier_init(&giommu->n, vfio_iommu_map_notify,
+                                      IOMMU_NOTIFIER_IOTLB_ALL,
+                                      section->offset_within_region,
+                                      int128_get64(llend),
+                                      iommu_idx);
+            QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
+            memory_region_register_iommu_notifier(section->mr, &giommu->n);
+        }
         memory_region_iommu_replay(giommu->iommu, &giommu->n);
 
         return;
@@ -679,7 +766,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
     }
     return;
 
-fail:
+ fail:
     if (memory_region_is_ram_device(section->mr)) {
         error_report("failed to vfio_dma_map. pci p2p may not work");
         return;
@@ -763,15 +850,21 @@ static void vfio_listener_region_del(MemoryListener *listener,
     }
 }
 
-static const MemoryListener vfio_memory_listener = {
+static MemoryListener vfio_memory_listener = {
     .region_add = vfio_listener_region_add,
     .region_del = vfio_listener_region_del,
 };
 
+static MemoryListener vfio_memory_prereg_listener = {
+    .region_add = vfio_prereg_listener_region_add,
+    .region_del = vfio_prereg_listener_region_del,
+};
+
 static void vfio_listener_release(VFIOContainer *container)
 {
     memory_listener_unregister(&container->listener);
-    if (container->iommu_type == VFIO_SPAPR_TCE_v2_IOMMU) {
+    if (container->iommu_type == VFIO_SPAPR_TCE_v2_IOMMU ||
+        container->iommu_type == VFIO_TYPE1_NESTING_IOMMU) {
         memory_listener_unregister(&container->prereg_listener);
     }
 }
@@ -1262,6 +1355,20 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
         }
         vfio_host_win_add(container, 0, (hwaddr)-1, info.iova_pgsizes);
         container->pgsizes = info.iova_pgsizes;
+
+        if (container->iommu_type == VFIO_TYPE1_NESTING_IOMMU) {
+            container->prereg_listener = vfio_memory_prereg_listener;
+
+            memory_listener_register(&container->prereg_listener,
+                                     &address_space_memory);
+            if (container->error) {
+                memory_listener_unregister(&container->prereg_listener);
+                ret = container->error;
+                error_setg(errp,
+                    "RAM memory listener initialization failed for container");
+                goto free_container_exit;
+            }
+        }
         break;
     }
     case VFIO_SPAPR_TCE_v2_IOMMU:
-- 
2.17.1

