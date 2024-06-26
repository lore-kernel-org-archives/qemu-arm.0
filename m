Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp879975njc;
        Wed, 26 Jun 2024 01:28:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVof84hrycS9UnRQmmFlG6wh1TvEqHn+VAS7/W4aYM6niiKyGWEZAypXdZcT4trtwwpy3rMBQnUyuaG8xoT5tK0wOTJ4/a5
X-Google-Smtp-Source: AGHT+IFCto+MiefwEJ7TkyjPhurWp6q0vpMkK/Vn13w7V3EKx88dKhdqYKTBlkAgyXp2ZWOLmHCr
X-Received: by 2002:a05:620a:2486:b0:79c:4029:9f42 with SMTP id af79cd13be357-79c4029a320mr143191885a.36.1719390538470;
        Wed, 26 Jun 2024 01:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719390538; cv=none;
        d=google.com; s=arc-20160816;
        b=NVrYha5Mz+erAKXVlP3gQbZoC8gTXz0sCLFMzBwaFKgQOOfE8IDuhsulWcrSwvK2bl
         aewOahnIDZt8ES75sHy9Kv6Z7x8cubW8p3CY0Y/87oZOhO/G5Irz/iraSD1VdHhKgXLd
         xkxFrq/z5y990APZmkp0sK2gttyz8g+kEGkB08QwXWjvLHhHxOQZingCvPR6YMpgw4Fu
         HTWh0roVeiaGGFgQthGhdcuu3e00mWquzOx1glvHhygYXy23hTngT9WUbIQoUgWimwc5
         ieBLJArXy7Z0rTCcYAh8w/NeXrJhnwYCmY/y/FyHLzsQqaigfHItfWJVLCOAO+X2wNWX
         O8XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=V8+yh9BO2co7/n68WttUqz+fb/n9Db2ubdRGfHNjNH8=;
        fh=7BmF12x8JIX7i2ysPViD3oS3tFYG9mZ+u60lEXguOKc=;
        b=LFJbM1mKEPJXU7Ca5asjiKkDXhraCkMVJyoykcAoNaGUXftbpBBFZ6tOaU8C+PaSn2
         8baRWYMsLtW0ogl8zD8OwNG3fsOaiZ1vLoTNM25/vImQGfXROKKULlxo2cPqSBwhpCVx
         nQBVthG8g34HmdonTexm8RU+JO6c8fR/AEH0/f8ZIq4up9YGw1tAR87lekzEGzPOgAR5
         tFDTizSfo9iwZLYNJFA/6ClC2j4221UrtdFONk3auJ4KoucYBKIZwlGdHNkNlEQhc0Ls
         aABpoZbTImpSj+Je6wghIzIcwSpaQdYPI35XhPyVykePniUjN8AL1x8W2q0H2e5KTmiI
         jj4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Mh0XwCOt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce94284fsi1272651985a.659.2024.06.26.01.28.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2024 01:28:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Mh0XwCOt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMO0q-0007UD-Dp; Wed, 26 Jun 2024 04:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sMO0k-0007Ol-Fn
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 04:28:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sMO0i-0007D4-Jn
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 04:28:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719390491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V8+yh9BO2co7/n68WttUqz+fb/n9Db2ubdRGfHNjNH8=;
 b=Mh0XwCOtgmf/S7zyMdFg4gxuzbsIB5f3NCHPL5bTSAIeEzmdt9SbTdM4a0KkOzdB8F7RG3
 10XQ1PGckbBUZcOW8mi6rSYpvArq6tEQr6YWp6DPJ6BCGBh7huvriDtXSqby+gLWZ4Uzc6
 Y/ZtKbspDjLW1YRix6+PA5OSioWM2bk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-279-HcmZaVBSNwysIrtAk5dOvw-1; Wed,
 26 Jun 2024 04:28:08 -0400
X-MC-Unique: HcmZaVBSNwysIrtAk5dOvw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1E83F195608B; Wed, 26 Jun 2024 08:28:07 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.191])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 909281956087; Wed, 26 Jun 2024 08:28:03 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com,
 zhenzhong.duan@intel.com, alex.williamson@redhat.com
Subject: [PATCH 6/7] memory: remove IOMMU MR iommu_set_page_size_mask()
 callback
Date: Wed, 26 Jun 2024 10:26:51 +0200
Message-ID: <20240626082727.1278530-7-eric.auger@redhat.com>
In-Reply-To: <20240626082727.1278530-1-eric.auger@redhat.com>
References: <20240626082727.1278530-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.151,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: RPTla5qNNj1+

Everything is now in place to use the Host IOMMU Device callbacks
to retrieve the page size mask usable with a given assigned device.
This new method brings the advantage to pass the info much earlier
to the virtual IOMMU and before the IOMMU MR gets enabled. So let's
remove the call to memory_region_iommu_set_page_size_mask in
vfio common.c and remove the single implementation of the IOMMU MR
callback in the virtio-iommu.c

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h    | 38 ---------------------------------
 hw/vfio/common.c         |  8 -------
 hw/virtio/virtio-iommu.c | 45 ----------------------------------------
 system/memory.c          | 13 ------------
 hw/virtio/trace-events   |  1 -
 5 files changed, 105 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 0903513d13..6f9c78cc14 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -504,32 +504,6 @@ struct IOMMUMemoryRegionClass {
      * @iommu: the IOMMUMemoryRegion
      */
     int (*num_indexes)(IOMMUMemoryRegion *iommu);
-
-    /**
-     * @iommu_set_page_size_mask:
-     *
-     * Restrict the page size mask that can be supported with a given IOMMU
-     * memory region. Used for example to propagate host physical IOMMU page
-     * size mask limitations to the virtual IOMMU.
-     *
-     * Optional method: if this method is not provided, then the default global
-     * page mask is used.
-     *
-     * @iommu: the IOMMUMemoryRegion
-     *
-     * @page_size_mask: a bitmask of supported page sizes. At least one bit,
-     * representing the smallest page size, must be set. Additional set bits
-     * represent supported block sizes. For example a host physical IOMMU that
-     * uses page tables with a page size of 4kB, and supports 2MB and 4GB
-     * blocks, will set mask 0x40201000. A granule of 4kB with indiscriminate
-     * block sizes is specified with mask 0xfffffffffffff000.
-     *
-     * Returns 0 on success, or a negative error. In case of failure, the error
-     * object must be created.
-     */
-     int (*iommu_set_page_size_mask)(IOMMUMemoryRegion *iommu,
-                                     uint64_t page_size_mask,
-                                     Error **errp);
 };
 
 typedef struct RamDiscardListener RamDiscardListener;
@@ -1919,18 +1893,6 @@ int memory_region_iommu_attrs_to_index(IOMMUMemoryRegion *iommu_mr,
  */
 int memory_region_iommu_num_indexes(IOMMUMemoryRegion *iommu_mr);
 
-/**
- * memory_region_iommu_set_page_size_mask: set the supported page
- * sizes for a given IOMMU memory region
- *
- * @iommu_mr: IOMMU memory region
- * @page_size_mask: supported page size mask
- * @errp: pointer to Error*, to store an error if it happens.
- */
-int memory_region_iommu_set_page_size_mask(IOMMUMemoryRegion *iommu_mr,
-                                           uint64_t page_size_mask,
-                                           Error **errp);
-
 /**
  * memory_region_name: get a memory region's name
  *
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 7cdb969fd3..6d15b36e0b 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -622,14 +622,6 @@ static void vfio_listener_region_add(MemoryListener *listener,
                             int128_get64(llend),
                             iommu_idx);
 
-        ret = memory_region_iommu_set_page_size_mask(giommu->iommu_mr,
-                                                     bcontainer->pgsizes,
-                                                     &err);
-        if (ret) {
-            g_free(giommu);
-            goto fail;
-        }
-
         ret = memory_region_register_iommu_notifier(section->mr, &giommu->n,
                                                     &err);
         if (ret) {
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 631589735a..b24e10de81 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1363,50 +1363,6 @@ static int virtio_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu_mr,
     return 0;
 }
 
-/*
- * The default mask depends on the "granule" property. For example, with
- * 4k granule, it is -(4 * KiB). When an assigned device has page size
- * restrictions due to the hardware IOMMU configuration, apply this restriction
- * to the mask.
- */
-static int virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
-                                           uint64_t new_mask,
-                                           Error **errp)
-{
-    IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
-    VirtIOIOMMU *s = sdev->viommu;
-    uint64_t cur_mask = s->config.page_size_mask;
-
-    trace_virtio_iommu_set_page_size_mask(mr->parent_obj.name, cur_mask,
-                                          new_mask);
-
-    if ((cur_mask & new_mask) == 0) {
-        error_setg(errp, "virtio-iommu %s reports a page size mask 0x%"PRIx64
-                   " incompatible with currently supported mask 0x%"PRIx64,
-                   mr->parent_obj.name, new_mask, cur_mask);
-        return -1;
-    }
-
-    /*
-     * Once the granule is frozen we can't change the mask anymore. If by
-     * chance the hotplugged device supports the same granule, we can still
-     * accept it.
-     */
-    if (s->granule_frozen) {
-        int cur_granule = ctz64(cur_mask);
-
-        if (!(BIT_ULL(cur_granule) & new_mask)) {
-            error_setg(errp, "virtio-iommu %s does not support frozen granule 0x%llx",
-                       mr->parent_obj.name, BIT_ULL(cur_granule));
-            return -1;
-        }
-        return 0;
-    }
-
-    s->config.page_size_mask &= new_mask;
-    return 0;
-}
-
 static void virtio_iommu_system_reset(void *opaque)
 {
     VirtIOIOMMU *s = opaque;
@@ -1731,7 +1687,6 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
     imrc->translate = virtio_iommu_translate;
     imrc->replay = virtio_iommu_replay;
     imrc->notify_flag_changed = virtio_iommu_notify_flag_changed;
-    imrc->iommu_set_page_size_mask = virtio_iommu_set_page_size_mask;
 }
 
 static const TypeInfo virtio_iommu_info = {
diff --git a/system/memory.c b/system/memory.c
index 2d69521360..5e6eb459d5 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1901,19 +1901,6 @@ static int memory_region_update_iommu_notify_flags(IOMMUMemoryRegion *iommu_mr,
     return ret;
 }
 
-int memory_region_iommu_set_page_size_mask(IOMMUMemoryRegion *iommu_mr,
-                                           uint64_t page_size_mask,
-                                           Error **errp)
-{
-    IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
-    int ret = 0;
-
-    if (imrc->iommu_set_page_size_mask) {
-        ret = imrc->iommu_set_page_size_mask(iommu_mr, page_size_mask, errp);
-    }
-    return ret;
-}
-
 int memory_region_register_iommu_notifier(MemoryRegion *mr,
                                           IOMMUNotifier *n, Error **errp)
 {
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 599d855ff6..b7c04f0856 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -131,7 +131,6 @@ virtio_iommu_fill_resv_property(uint32_t devid, uint8_t subtype, uint64_t start,
 virtio_iommu_notify_map(const char *name, uint64_t virt_start, uint64_t virt_end, uint64_t phys_start, uint32_t flags) "mr=%s virt_start=0x%"PRIx64" virt_end=0x%"PRIx64" phys_start=0x%"PRIx64" flags=%d"
 virtio_iommu_notify_unmap(const char *name, uint64_t virt_start, uint64_t virt_end) "mr=%s virt_start=0x%"PRIx64" virt_end=0x%"PRIx64
 virtio_iommu_remap(const char *name, uint64_t virt_start, uint64_t virt_end, uint64_t phys_start) "mr=%s virt_start=0x%"PRIx64" virt_end=0x%"PRIx64" phys_start=0x%"PRIx64
-virtio_iommu_set_page_size_mask(const char *name, uint64_t old, uint64_t new) "mr=%s old_mask=0x%"PRIx64" new_mask=0x%"PRIx64
 virtio_iommu_update_page_size_mask(const char *name, uint64_t old, uint64_t new) "host iommu device=%s old_mask=0x%"PRIx64" new_mask=0x%"PRIx64
 virtio_iommu_notify_flag_add(const char *name) "add notifier to mr %s"
 virtio_iommu_notify_flag_del(const char *name) "del notifier from mr %s"
-- 
2.41.0

