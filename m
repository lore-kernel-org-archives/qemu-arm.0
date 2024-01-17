Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp1392098ejf;
        Wed, 17 Jan 2024 00:05:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGH1mVKnrAsG9dGa2jsmgDrcprT0/8Fd8NTu51BfJtagBVO8HIfASKSfbvQpbw7Y4lvYWp2
X-Received: by 2002:a5b:10:0:b0:dbd:b0a9:b16b with SMTP id a16-20020a5b0010000000b00dbdb0a9b16bmr4594028ybp.17.1705478717782;
        Wed, 17 Jan 2024 00:05:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705478717; cv=none;
        d=google.com; s=arc-20160816;
        b=EMoH06w0VVx3FQ7qkEJL4vEdNuqqODINdLXTfScCPCG4crG+Rlp+V/CakVMFcjbKZD
         sBBv0eZ3PdkPQaoY/A6delkjetbabTnbeORwQc3eMbQgW4G6yqzziPFzXjX9vysEwBzf
         SrJsf3NUMdbJ3Z3psrA0j77y2+ZoAdAQHHQu1RPbw5HfKpTRpSEtprhxyUtzUVq6B9va
         +5nR7g7ZCByZMViOZYCgfQNVKqDWg6EDiCrvee8kaoKxErHqTV2hk6jAKNhRyacZ8i6U
         /AQayYU7DrZlh/VT8AI8Yatg/ztkO4WjUNf27AcaWvyTZQIzUN7QWr3HF3jEyLFtIE6O
         q+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uU99jB0p1RkrN4YqJZlTMLWPHdwQmT3jWpzsIJLgPa0=;
        fh=E3c4Lx6w2odu/6SlG6b7ImsRAg1mlDohYwN4BQaBgGo=;
        b=CsKRLO75XcnbgoWgbQekWbMyMIdMWimDh/Eiw6GnnGHSCOS90iNP0DDpOCFsco/bdf
         SA3QAi0/8pWDv6pGFw7HjWg/ZsB5Xmvjn4yYNPC1XGOAiEAuOBm0h0s5A67PvUt/1ShN
         0vqU/kYevuL2KLXwoLL9OfY5ObA0np7p1sa+0r1cMKlMowfj67g+50dfWscO0DDbZ0Ma
         CZZwXHItDecuImm0GKpHiKxvU3TmcjXFsh/9e7f44bLiLS+lLs1rRO1ih0TFBJUvvX2r
         98T+3pUncqTVSzsj+V7zvOTlY7bTS4O29cWGyQaMIa6Hd/AoitsXrp7iYXZLoGfvN2St
         Qu0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JYsvGosd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 17-20020ac85751000000b0042a12d97175si20247qtx.427.2024.01.17.00.05.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jan 2024 00:05:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JYsvGosd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQ0um-0002JN-DL; Wed, 17 Jan 2024 03:04:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rQ0uf-0002AQ-V3
 for qemu-arm@nongnu.org; Wed, 17 Jan 2024 03:04:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rQ0uc-000348-7I
 for qemu-arm@nongnu.org; Wed, 17 Jan 2024 03:04:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705478677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uU99jB0p1RkrN4YqJZlTMLWPHdwQmT3jWpzsIJLgPa0=;
 b=JYsvGosdL0Z922VkpzTyflrPnv0OV0dcBAu6F0yAOc9Z2B4UI6/SKg6LlMUswQpwWZH/9a
 M2+frcosZR6x37r1eejU+9RVjqvsTDz3EqgoqEpCfBSugkFzvLI+SGBXjwwIOYD+mY/ZTk
 TFYVPzwwQoT/3jYBKynwSJYxdAB9cdM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-bRc9LiKvNZaU3LEMEaDfWA-1; Wed, 17 Jan 2024 03:04:35 -0500
X-MC-Unique: bRc9LiKvNZaU3LEMEaDfWA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5803A185A781;
 Wed, 17 Jan 2024 08:04:35 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECDBD1BDB0;
 Wed, 17 Jan 2024 08:04:32 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, alex.williamson@redhat.com,
 peter.maydell@linaro.org, zhenzhong.duan@intel.com, peterx@redhat.com,
 yanghliu@redhat.com, pbonzini@redhat.com
Cc: mst@redhat.com,
	clg@redhat.com
Subject: [RFC 4/7] virtio-iommu: Implement PCIIOMMUOps set_host_resv_regions
Date: Wed, 17 Jan 2024 09:02:08 +0100
Message-ID: <20240117080414.316890-5-eric.auger@redhat.com>
In-Reply-To: <20240117080414.316890-1-eric.auger@redhat.com>
References: <20240117080414.316890-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.806,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: yGngJVRSzp4z

Reuse the implementation of virtio_iommu_set_iova_ranges() which
will be removed in subsequent patches.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-iommu.c | 134 +++++++++++++++++++++++++++++----------
 1 file changed, 101 insertions(+), 33 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 8a4bd933c6..716a3fcfbf 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -461,8 +461,109 @@ static AddressSpace *virtio_iommu_find_add_as(PCIBus *bus, void *opaque,
     return &sdev->as;
 }
 
+/**
+ * rebuild_resv_regions: rebuild resv regions with both the
+ * info of host resv ranges and property set resv ranges
+ */
+static int rebuild_resv_regions(IOMMUDevice *sdev)
+{
+    GList *l;
+    int i = 0;
+
+    /* free the existing list and rebuild it from scratch */
+    g_list_free_full(sdev->resv_regions, g_free);
+    sdev->resv_regions = NULL;
+
+    /* First add host reserved regions if any, all tagged as RESERVED */
+    for (l = sdev->host_resv_ranges; l; l = l->next) {
+        ReservedRegion *reg = g_new0(ReservedRegion, 1);
+        Range *r = (Range *)l->data;
+
+        reg->type = VIRTIO_IOMMU_RESV_MEM_T_RESERVED;
+        range_set_bounds(&reg->range, range_lob(r), range_upb(r));
+        sdev->resv_regions = resv_region_list_insert(sdev->resv_regions, reg);
+        trace_virtio_iommu_host_resv_regions(sdev->iommu_mr.parent_obj.name, i,
+                                             range_lob(&reg->range),
+                                             range_upb(&reg->range));
+        i++;
+    }
+    /*
+     * then add higher priority reserved regions set by the machine
+     * through properties
+     */
+    add_prop_resv_regions(sdev);
+    return 0;
+}
+
+static int virtio_iommu_set_host_iova_ranges(PCIBus *bus, void *opaque,
+                                             int devfn, GList *iova_ranges,
+                                             Error **errp)
+{
+    VirtIOIOMMU *s = opaque;
+    IOMMUPciBus *sbus = g_hash_table_lookup(s->as_by_busptr, bus);
+    IOMMUDevice *sdev;
+    GList *current_ranges;
+    GList *l, *tmp, *new_ranges = NULL;
+    int ret = -EINVAL;
+
+    if (!sbus) {
+        error_report("%s no sbus", __func__);
+    }
+
+    sdev = sbus->pbdev[devfn];
+
+    current_ranges = sdev->host_resv_ranges;
+
+    warn_report("%s: host_resv_regions=%d", __func__, !!sdev->host_resv_ranges);
+    /* check that each new resv region is included in an existing one */
+    if (sdev->host_resv_ranges) {
+        range_inverse_array(iova_ranges,
+                            &new_ranges,
+                            0, UINT64_MAX);
+
+        for (tmp = new_ranges; tmp; tmp = tmp->next) {
+            Range *newr = (Range *)tmp->data;
+            bool included = false;
+
+            for (l = current_ranges; l; l = l->next) {
+                Range * r = (Range *)l->data;
+
+                if (range_contains_range(r, newr)) {
+                    included = true;
+                    break;
+                }
+            }
+            if (!included) {
+                goto error;
+            }
+        }
+        /* all new reserved ranges are included in existing ones */
+        ret = 0;
+        goto out;
+    }
+
+    if (sdev->probe_done) {
+        warn_report("%s: Notified about new host reserved regions after probe",
+                    __func__);
+    }
+
+    range_inverse_array(iova_ranges,
+                        &sdev->host_resv_ranges,
+                        0, UINT64_MAX);
+    rebuild_resv_regions(sdev);
+
+    return 0;
+error:
+    error_setg(errp, "%s Conflicting host reserved ranges set!",
+               __func__);
+out:
+    g_list_free_full(new_ranges, g_free);
+    return ret;
+}
+
 static const PCIIOMMUOps virtio_iommu_ops = {
     .get_address_space = virtio_iommu_find_add_as,
+    .set_host_iova_ranges = virtio_iommu_set_host_iova_ranges,
 };
 
 static int virtio_iommu_attach(VirtIOIOMMU *s,
@@ -1158,39 +1259,6 @@ static int virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
     return 0;
 }
 
-/**
- * rebuild_resv_regions: rebuild resv regions with both the
- * info of host resv ranges and property set resv ranges
- */
-static int rebuild_resv_regions(IOMMUDevice *sdev)
-{
-    GList *l;
-    int i = 0;
-
-    /* free the existing list and rebuild it from scratch */
-    g_list_free_full(sdev->resv_regions, g_free);
-    sdev->resv_regions = NULL;
-
-    /* First add host reserved regions if any, all tagged as RESERVED */
-    for (l = sdev->host_resv_ranges; l; l = l->next) {
-        ReservedRegion *reg = g_new0(ReservedRegion, 1);
-        Range *r = (Range *)l->data;
-
-        reg->type = VIRTIO_IOMMU_RESV_MEM_T_RESERVED;
-        range_set_bounds(&reg->range, range_lob(r), range_upb(r));
-        sdev->resv_regions = resv_region_list_insert(sdev->resv_regions, reg);
-        trace_virtio_iommu_host_resv_regions(sdev->iommu_mr.parent_obj.name, i,
-                                             range_lob(&reg->range),
-                                             range_upb(&reg->range));
-        i++;
-    }
-    /*
-     * then add higher priority reserved regions set by the machine
-     * through properties
-     */
-    add_prop_resv_regions(sdev);
-    return 0;
-}
 
 /**
  * virtio_iommu_set_iova_ranges: Conveys the usable IOVA ranges
-- 
2.41.0

