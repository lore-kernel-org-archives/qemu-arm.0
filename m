Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp3062137lfr;
        Sun, 11 Apr 2021 05:27:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxveCb55o1F4xIYvHl1o/jsmXwdzGwvux7SNwOb/W+CrW0Obr2F+JSp86w1eEpoYAeDXHJ+
X-Received: by 2002:aed:2010:: with SMTP id 16mr21282364qta.256.1618144040918;
        Sun, 11 Apr 2021 05:27:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618144040; cv=none;
        d=google.com; s=arc-20160816;
        b=msIcKSPE7DwAXuTBx+3BT69HybqQ3pgOdfOgDM69u6M7fkPZX5AO/JmSgAKN8lDHcu
         RO1gL3qmobjmu4BP5rAoTas6Z/UCbotK4aWFe5wcLiOBb/1gGwqvTTcIu+qHcctFU4Xt
         ESU+1jKebe3Fm5d+u5ZQRzlye3lHx5a9RscB7nn1SLythJcD3YnhQP1UjQqFLedIwu51
         Irxfba4Vj/3e2PI/WKZuPu1sRC7Nq96VCtkaUWc0R6YXzu/266Hu0oowH0scs5c4PNHT
         ZzqUwZubEzZ+nAjVOBKzIa9/iOetYYY9ObvyI0jVAULvPLfIED3g8MlD3LFcAnYJeEXH
         43mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GMsg/GSib+qefqYmCMNMqwP9Hs4srtfrw2wvXWd9pXw=;
        b=z/cy2njLwFzNa98aGx9dkGX0N/wQZQZKDjyD7vnwaQpmjho7U8EHPEkUfWctLhcsgb
         EMabVpFFXhfHylcoZE8s0G7LVDJxgDeYvrLc/28ksTMklT/t2D0tQ4JUXuniQX3+rC8E
         bYkdwyczeH26Gw1FZrOld3aRkzilYdX889WVBX4Y+j6ATvUyrbnbwqhbIf6ZYmj74MK8
         RhNptwekYa5Urjc1x1GqFcvdJVGs5TZW30thq/d4d2E4dmqNGSooAXI0DCqHFwMMOTYI
         QqDwVGkqaCOhsMVhTNlirVqpwm6o/GA6gxgI2Z7nsVVYmCoDxArwArlpJrz1/gz0xMx6
         akJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JxtJFF0+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17si5732903qvw.180.2021.04.11.05.27.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Apr 2021 05:27:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JxtJFF0+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lVZBQ-0005ii-59
	for alex.bennee@linaro.org; Sun, 11 Apr 2021 08:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYwr-0001jC-JW
 for qemu-arm@nongnu.org; Sun, 11 Apr 2021 08:12:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYwp-0003If-6q
 for qemu-arm@nongnu.org; Sun, 11 Apr 2021 08:12:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618143134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GMsg/GSib+qefqYmCMNMqwP9Hs4srtfrw2wvXWd9pXw=;
 b=JxtJFF0+UOrkKw+HGfTrnq4o/ktV//kxfABmD9zNzrDGh5fliB9h+p4OHUHlCU7sZ1SeZm
 3kzSzZ33czTMGktMPIts/cpbTuiN2Zrg8k+Flp0fzfAV3VGjt4e1M9VTzgq4mFYY8tZyyy
 AfX++ixWdCQDpGIxHdbZevgGZ5itrV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-r7Spt1P_NM-kmdzrFkpGBg-1; Sun, 11 Apr 2021 08:12:13 -0400
X-MC-Unique: r7Spt1P_NM-kmdzrFkpGBg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CCE28030A0;
 Sun, 11 Apr 2021 12:12:11 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BFB310023B2;
 Sun, 11 Apr 2021 12:11:56 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v9 14/29] vfio: Introduce helpers to DMA map/unmap a RAM section
Date: Sun, 11 Apr 2021 14:08:57 +0200
Message-Id: <20210411120912.15770-15-eric.auger@redhat.com>
In-Reply-To: <20210411120912.15770-1-eric.auger@redhat.com>
References: <20210411120912.15770-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com, chenxiang66@hisilicon.com,
 jiangkunkun@huawei.com, shameerali.kolothum.thodi@huawei.com,
 nicoleotsuka@gmail.com, vivek.gautam@arm.com, vdumpa@nvidia.com,
 yi.l.liu@intel.com, peterx@redhat.com, zhangfei.gao@gmail.com,
 yuzenghui@huawei.com, zhukeqian1@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VDoJfBWIO0OZ

Let's introduce two helpers that allow to DMA map/unmap a RAM
section. Those helpers will be called for nested stage setup in
another call site. Also the vfio_listener_region_add/del()
structure may be clearer.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v8 -> v9
- rebase on top of
  1eb7f642750c ("vfio: Support host translation granule size")

v5 -> v6:
- add Error **
---
 hw/vfio/common.c     | 199 +++++++++++++++++++++++++------------------
 hw/vfio/trace-events |   4 +-
 2 files changed, 119 insertions(+), 84 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index a8f835328e..0cd7ef2139 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -662,13 +662,126 @@ hostwin_from_range(VFIOContainer *container, hwaddr iova, hwaddr end)
     return NULL;
 }
 
+static int vfio_dma_map_ram_section(VFIOContainer *container,
+                                    MemoryRegionSection *section, Error **err)
+{
+    VFIOHostDMAWindow *hostwin;
+    Int128 llend, llsize;
+    hwaddr iova, end;
+    void *vaddr;
+    int ret;
+
+    assert(memory_region_is_ram(section->mr));
+
+    iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
+    llend = int128_make64(section->offset_within_address_space);
+    llend = int128_add(llend, section->size);
+    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
+    end = int128_get64(int128_sub(llend, int128_one()));
+
+    vaddr = memory_region_get_ram_ptr(section->mr) +
+            section->offset_within_region +
+            (iova - section->offset_within_address_space);
+
+    hostwin = hostwin_from_range(container, iova, end);
+    if (!hostwin) {
+        error_setg(err, "Container %p can't map guest IOVA region"
+                   " 0x%"HWADDR_PRIx"..0x%"HWADDR_PRIx, container, iova, end);
+        return -EFAULT;
+    }
+
+    trace_vfio_dma_map_ram(iova, end, vaddr);
+
+    llsize = int128_sub(llend, int128_make64(iova));
+
+    if (memory_region_is_ram_device(section->mr)) {
+        hwaddr pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
+
+        if ((iova & pgmask) || (int128_get64(llsize) & pgmask)) {
+            trace_vfio_listener_region_add_no_dma_map(
+                memory_region_name(section->mr),
+                section->offset_within_address_space,
+                int128_getlo(section->size),
+                pgmask + 1);
+            return 0;
+        }
+    }
+
+    ret = vfio_dma_map(container, iova, int128_get64(llsize),
+                       vaddr, section->readonly);
+    if (ret) {
+        error_setg(err, "vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
+                   "0x%"HWADDR_PRIx", %p) = %d (%m)",
+                   container, iova, int128_get64(llsize), vaddr, ret);
+        if (memory_region_is_ram_device(section->mr)) {
+            /* Allow unexpected mappings not to be fatal for RAM devices */
+            error_report_err(*err);
+            return 0;
+        }
+        return ret;
+    }
+    return 0;
+}
+
+static void vfio_dma_unmap_ram_section(VFIOContainer *container,
+                                       MemoryRegionSection *section)
+{
+    Int128 llend, llsize;
+    hwaddr iova, end;
+    bool try_unmap = true;
+    int ret;
+
+    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
+    llend = int128_make64(section->offset_within_address_space);
+    llend = int128_add(llend, section->size);
+    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask));
+
+    if (int128_ge(int128_make64(iova), llend)) {
+        return;
+    }
+    end = int128_get64(int128_sub(llend, int128_one()));
+
+    llsize = int128_sub(llend, int128_make64(iova));
+
+    trace_vfio_dma_unmap_ram(iova, end);
+
+    if (memory_region_is_ram_device(section->mr)) {
+        hwaddr pgmask;
+        VFIOHostDMAWindow *hostwin = hostwin_from_range(container, iova, end);
+
+        assert(hostwin); /* or region_add() would have failed */
+
+        pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
+        try_unmap = !((iova & pgmask) || (int128_get64(llsize) & pgmask));
+    }
+
+    if (try_unmap) {
+        if (int128_eq(llsize, int128_2_64())) {
+            /* The unmap ioctl doesn't accept a full 64-bit span. */
+            llsize = int128_rshift(llsize, 1);
+            ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
+            if (ret) {
+                error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
+                             "0x%"HWADDR_PRIx") = %d (%m)",
+                             container, iova, int128_get64(llsize), ret);
+            }
+            iova += int128_get64(llsize);
+        }
+        ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
+        if (ret) {
+            error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
+                         "0x%"HWADDR_PRIx") = %d (%m)",
+                         container, iova, int128_get64(llsize), ret);
+        }
+    }
+}
+
 static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
     hwaddr iova, end;
-    Int128 llend, llsize;
-    void *vaddr;
+    Int128 llend;
     int ret;
     VFIOHostDMAWindow *hostwin;
     Error *err = NULL;
@@ -814,39 +927,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
     }
 
     /* Here we assume that memory_region_is_ram(section->mr)==true */
-
-    vaddr = memory_region_get_ram_ptr(section->mr) +
-            section->offset_within_region +
-            (iova - section->offset_within_address_space);
-
-    trace_vfio_listener_region_add_ram(iova, end, vaddr);
-
-    llsize = int128_sub(llend, int128_make64(iova));
-
-    if (memory_region_is_ram_device(section->mr)) {
-        hwaddr pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
-
-        if ((iova & pgmask) || (int128_get64(llsize) & pgmask)) {
-            trace_vfio_listener_region_add_no_dma_map(
-                memory_region_name(section->mr),
-                section->offset_within_address_space,
-                int128_getlo(section->size),
-                pgmask + 1);
-            return;
-        }
-    }
-
-    ret = vfio_dma_map(container, iova, int128_get64(llsize),
-                       vaddr, section->readonly);
-    if (ret) {
-        error_setg(&err, "vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
-                   "0x%"HWADDR_PRIx", %p) = %d (%m)",
-                   container, iova, int128_get64(llsize), vaddr, ret);
-        if (memory_region_is_ram_device(section->mr)) {
-            /* Allow unexpected mappings not to be fatal for RAM devices */
-            error_report_err(err);
-            return;
-        }
+    if (vfio_dma_map_ram_section(container, section, &err)) {
         goto fail;
     }
 
@@ -880,10 +961,6 @@ static void vfio_listener_region_del(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
-    hwaddr iova, end;
-    Int128 llend, llsize;
-    int ret;
-    bool try_unmap = true;
 
     if (vfio_listener_skipped_section(section)) {
         trace_vfio_listener_region_del_skip(
@@ -923,49 +1000,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
          */
     }
 
-    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
-    llend = int128_make64(section->offset_within_address_space);
-    llend = int128_add(llend, section->size);
-    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask));
-
-    if (int128_ge(int128_make64(iova), llend)) {
-        return;
-    }
-    end = int128_get64(int128_sub(llend, int128_one()));
-
-    llsize = int128_sub(llend, int128_make64(iova));
-
-    trace_vfio_listener_region_del(iova, end);
-
-    if (memory_region_is_ram_device(section->mr)) {
-        hwaddr pgmask;
-        VFIOHostDMAWindow *hostwin = hostwin_from_range(container, iova, end);
-
-        assert(hostwin); /* or region_add() would have failed */
-
-        pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
-        try_unmap = !((iova & pgmask) || (int128_get64(llsize) & pgmask));
-    }
-
-    if (try_unmap) {
-        if (int128_eq(llsize, int128_2_64())) {
-            /* The unmap ioctl doesn't accept a full 64-bit span. */
-            llsize = int128_rshift(llsize, 1);
-            ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
-            if (ret) {
-                error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
-                             "0x%"HWADDR_PRIx") = %d (%m)",
-                             container, iova, int128_get64(llsize), ret);
-            }
-            iova += int128_get64(llsize);
-        }
-        ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
-        if (ret) {
-            error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
-                         "0x%"HWADDR_PRIx") = %d (%m)",
-                         container, iova, int128_get64(llsize), ret);
-        }
-    }
+    vfio_dma_unmap_ram_section(container, section);
 
     memory_region_unref(section->mr);
 
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 2a41326c0f..936d29d150 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -99,10 +99,10 @@ vfio_iommu_map_notify(const char *op, uint64_t iova_start, uint64_t iova_end) "i
 vfio_listener_region_add_skip(uint64_t start, uint64_t end) "SKIPPING region_add 0x%"PRIx64" - 0x%"PRIx64
 vfio_spapr_group_attach(int groupfd, int tablefd) "Attached groupfd %d to liobn fd %d"
 vfio_listener_region_add_iommu(uint64_t start, uint64_t end) "region_add [iommu] 0x%"PRIx64" - 0x%"PRIx64
-vfio_listener_region_add_ram(uint64_t iova_start, uint64_t iova_end, void *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64" [%p]"
+vfio_dma_map_ram(uint64_t iova_start, uint64_t iova_end, void *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64" [%p]"
 vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
 vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
-vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
+vfio_dma_unmap_ram(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
 vfio_disconnect_container(int fd) "close container->fd=%d"
 vfio_connect_existing_container(int groupid, int container_fd) "group=%d existing container fd=%d"
 vfio_connect_new_container(int groupid, int container_fd) "group=%d new container fd=%d"
-- 
2.26.3

