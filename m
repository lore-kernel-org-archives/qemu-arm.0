Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp263167ejc;
        Wed, 11 Oct 2023 10:56:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1fNHWkxwkya3/bHOcupik++pK1ZMum4rG7to/HtwIJYhVqKOECX+jsjIXO/tvk60+P/y2
X-Received: by 2002:a05:620a:2911:b0:773:b62b:3474 with SMTP id m17-20020a05620a291100b00773b62b3474mr26043457qkp.63.1697046996644;
        Wed, 11 Oct 2023 10:56:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697046996; cv=none;
        d=google.com; s=arc-20160816;
        b=GNoypwi6cqK5ZVy+gmzO0+UiiFzrk9WyoFlpsSBdYLy/qkWbpJ5JgzvMVQm/SwZacI
         kzjiFzidVhyN1LXt/8iQq/mfk+f+3Rx2aX1HZlLHntg+xbn7t6Ci9DZxqPDHFBcKAhDm
         ImHcUhjaF8AAzqSFiRwIQflLjxPc07PWvcLe7ORjGs0C2hnEKiIUMTbhNVBz3QP2lKxY
         Gdl6ax7ibEMGBqpnexyqWwBUdw+2HlGjAbzKWUbWCV7JEHqzcsEQl5L8pFSM+7OfXuBO
         k1c0+6D3y7CkMKsaVsT/AH0M5+sHOzHIcua9h+wXg+e4lzs+W5Xo+kpjLYkNMnGzFg9z
         LH3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=96X0lGoLwUVX+WOA+XL+u2LxlgXQ0SXPU2hTM0LeabI=;
        fh=9ZVtvpfpBEZx1oWqIMPFEsByQUx/hbHUkY9aIbMmkns=;
        b=x8MxgFxY3hfM13MhuX7CrkpDRGeo8oVmmTwVxB93/Xo9+vJDpmm/63nkESnyrxP1tA
         i3zRe+eEoyuv/d29FZDiAb2LdFz2tjeV285iOkfyrqcScDLzWHCJ45mOSkhOZYGOZ0IU
         xJYjNceIRgOo+MaWcc5Z0ixh1WgMeUBZLRU3sOoxYp1N4dS2pp8ZhZ+LN9tf78c31Pzw
         bdSOMuHfbqqnG30D0lj5Txq31G+0p9JzUeo2O7mo2mlCX3LDD3OXDtZE2IWstV5juYqs
         N+HiNF1kStnhqr4nmJD7Tl4w/unsrvRTfFws3zacrTyvtG6ftvvWAf1f3zYRofdBVFDW
         /0pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ig/04tQ5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15-20020a05620a254f00b007765135d85bsi9433291qko.591.2023.10.11.10.56.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Oct 2023 10:56:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ig/04tQ5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqdRJ-0001Kq-96; Wed, 11 Oct 2023 13:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qqdR7-0001FL-3N
 for qemu-arm@nongnu.org; Wed, 11 Oct 2023 13:55:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qqdR5-0006Xw-48
 for qemu-arm@nongnu.org; Wed, 11 Oct 2023 13:55:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697046951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=96X0lGoLwUVX+WOA+XL+u2LxlgXQ0SXPU2hTM0LeabI=;
 b=ig/04tQ5W7P8pDUOrj+3+xaKCvWUUmKyS0dAufY/bGSEHhbk1TVtFc9CzsbMUUp8Z2y+y/
 d4+AV98Q83xsH0QTKEQ3mLF5CnnKZKoiQS8MO8PvWESofm9IoC3GJ1heFNqiirI/uYu6d2
 wWoHD8gTDpFgmxDZKGqRAQWbQVzva7w=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-akvFqQBiNqeg7fY4dT1PqA-1; Wed, 11 Oct 2023 13:55:44 -0400
X-MC-Unique: akvFqQBiNqeg7fY4dT1PqA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BBAA1C02D2E;
 Wed, 11 Oct 2023 17:55:44 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CA29492C3E;
 Wed, 11 Oct 2023 17:55:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com
Subject: [PATCH v3 03/13] vfio: Collect container iova range info
Date: Wed, 11 Oct 2023 19:52:19 +0200
Message-ID: <20231011175516.541374-4-eric.auger@redhat.com>
In-Reply-To: <20231011175516.541374-1-eric.auger@redhat.com>
References: <20231011175516.541374-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vIAwi/nE82uY

Collect iova range information if VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE
capability is supported.

This allows to propagate the information though the IOMMU MR
set_iova_ranges() callback so that virtual IOMMUs
get aware of those aperture constraints. This is only done if
the info is available and the number of iova ranges is greater than
0.

A new vfio_get_info_iova_range helper is introduced matching
the coding style of existing vfio_get_info_dma_avail. The
boolean returned value isn't used though. Code is aligned
between both.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- Turn nr_iovas into a int initialized to -1
- memory_region_iommu_set_iova_ranges only is called if nr_iovas > 0
- vfio_get_info_iova_range returns a bool to match
  vfio_get_info_dma_avail. Uniformize both code by using !hdr in
  the check
- rebase on top of vfio-next
---
 include/hw/vfio/vfio-common.h |  2 ++
 hw/vfio/common.c              |  9 +++++++
 hw/vfio/container.c           | 44 ++++++++++++++++++++++++++++++++---
 3 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 7780b9073a..848ff47960 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -99,6 +99,8 @@ typedef struct VFIOContainer {
     QLIST_HEAD(, VFIORamDiscardListener) vrdl_list;
     QLIST_ENTRY(VFIOContainer) next;
     QLIST_HEAD(, VFIODevice) device_list;
+    int nr_iovas;
+    GList *iova_ranges;
 } VFIOContainer;
 
 typedef struct VFIOGuestIOMMU {
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 5ff5acf1d8..9d804152ba 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -699,6 +699,15 @@ static void vfio_listener_region_add(MemoryListener *listener,
             goto fail;
         }
 
+        if (container->nr_iovas > 0) {
+            ret = memory_region_iommu_set_iova_ranges(giommu->iommu_mr,
+                    container->iova_ranges, &err);
+            if (ret) {
+                g_free(giommu);
+                goto fail;
+            }
+        }
+
         ret = memory_region_register_iommu_notifier(section->mr, &giommu->n,
                                                     &err);
         if (ret) {
diff --git a/hw/vfio/container.c b/hw/vfio/container.c
index adc467210f..5122ff6d92 100644
--- a/hw/vfio/container.c
+++ b/hw/vfio/container.c
@@ -382,7 +382,7 @@ bool vfio_get_info_dma_avail(struct vfio_iommu_type1_info *info,
     /* If the capability cannot be found, assume no DMA limiting */
     hdr = vfio_get_iommu_type1_info_cap(info,
                                         VFIO_IOMMU_TYPE1_INFO_DMA_AVAIL);
-    if (hdr == NULL) {
+    if (!hdr) {
         return false;
     }
 
@@ -394,6 +394,33 @@ bool vfio_get_info_dma_avail(struct vfio_iommu_type1_info *info,
     return true;
 }
 
+static bool vfio_get_info_iova_range(struct vfio_iommu_type1_info *info,
+                                     VFIOContainer *container)
+{
+    struct vfio_info_cap_header *hdr;
+    struct vfio_iommu_type1_info_cap_iova_range *cap;
+
+    hdr = vfio_get_iommu_type1_info_cap(info,
+                                        VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE);
+    if (!hdr) {
+        return false;
+    }
+
+    cap = (void *)hdr;
+
+    container->nr_iovas = cap->nr_iovas;
+    for (int i = 0; i < cap->nr_iovas; i++) {
+        Range *range = g_new(Range, 1);
+
+        range_set_bounds(range, cap->iova_ranges[i].start,
+                         cap->iova_ranges[i].end);
+        container->iova_ranges =
+            range_list_insert(container->iova_ranges, range);
+    }
+
+    return true;
+}
+
 static void vfio_kvm_device_add_group(VFIOGroup *group)
 {
     Error *err = NULL;
@@ -535,6 +562,12 @@ static void vfio_get_iommu_info_migration(VFIOContainer *container,
     }
 }
 
+static void vfio_free_container(VFIOContainer *container)
+{
+    g_list_free_full(container->iova_ranges, g_free);
+    g_free(container);
+}
+
 static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
                                   Error **errp)
 {
@@ -616,6 +649,8 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     container->error = NULL;
     container->dirty_pages_supported = false;
     container->dma_max_mappings = 0;
+    container->nr_iovas = -1;
+    container->iova_ranges = NULL;
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
     QLIST_INIT(&container->vrdl_list);
@@ -652,6 +687,9 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
         if (!vfio_get_info_dma_avail(info, &container->dma_max_mappings)) {
             container->dma_max_mappings = 65535;
         }
+
+        vfio_get_info_iova_range(info, container);
+
         vfio_get_iommu_info_migration(container, info);
         g_free(info);
 
@@ -765,7 +803,7 @@ enable_discards_exit:
     vfio_ram_block_discard_disable(container, false);
 
 free_container_exit:
-    g_free(container);
+    vfio_free_container(container);
 
 close_fd_exit:
     close(fd);
@@ -819,7 +857,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
 
         trace_vfio_disconnect_container(container->fd);
         close(container->fd);
-        g_free(container);
+        vfio_free_container(container);
 
         vfio_put_address_space(space);
     }
-- 
2.41.0

