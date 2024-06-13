Received: by 2002:a17:906:641:b0:a6f:1bf6:7fc1 with SMTP id t1csp191701ejb;
        Thu, 13 Jun 2024 02:25:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWDVKFhtvS2tNG0wNC8Pj37qfS7oy8xXzPBiuRYzflNtmbDCn8hciwLyofrNXivW0YknWpD2sa7fmQhyUiTolyAEt/pE9rc
X-Google-Smtp-Source: AGHT+IFazlaVzvNG7VsV0Y7LpwsdJcJbUh4+Sxu/xoyTsN6aSJyuVaAmXm4x9fJfTyVkFxdCkjv2
X-Received: by 2002:a05:6102:2ad0:b0:48d:87f9:e529 with SMTP id ada2fe7eead31-48d91e707bfmr5749095137.29.1718270703918;
        Thu, 13 Jun 2024 02:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718270703; cv=none;
        d=google.com; s=arc-20160816;
        b=pNhEA3838JiSTabDXRCflaHh0aVw68/2VYWkyqNfkYeQHwVpNbuX3T2Z8aJN8sm5Td
         p4IHmlBEbHv1Fwl38RzCUXibjoVZehB8Rij4O4vvFm50kwYjgiyO035m+KLKYQ+HIftw
         IGWJXxTjVH8HTjv6dy9eToV2s58vdaRCIaQPvffiHjMq9qtysYg9EfLN7F39BjH4Kp59
         U8Mq5J3nnXyknSP/hNmNeiyWrbLHitDZZ/QLX/kM01IEgA4RgcNMP3jMVYke7UI8D2ju
         XAuhId3toY8uvHGGXHXBkqd6NEZdeNGefk0qDAO8/TdGbHOIaJPCCu11FmAPnd0xVwU9
         gfLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Gty/qhcqM8rKctZ2Q3JKdiXCyNc7WkVbI04fYcS5z1M=;
        fh=NBkbC8z0yxZVnBu5+T/osSPCS2NzeZu/yHpj5pv7NrY=;
        b=G3JFD7oFlRIloRStHKoX5CrFUZ2EHNIPmJ1EuDCwyilCOJuy+lAyTM74sBUn1K1hZt
         1oZjrki4s1RTrJP1c95lDAWfKz7fvW7Gi0gvLhoJv/JHiDobtaZil0tU6r8EEDArFmnr
         uzoAZKiQtFhODj8tuvlwJ3MnYaFZSQPVU0pgfwYl5lmoX5oKf8bIS/Yjsg1M40Of/qtm
         05pOcf3WxWgy6s9Yzdc+CODQ5ArCJGzCI/VN4GxGsYqULBZZkklyoUXB2efZRSUjeOqd
         ydJEXDZgUcKf+szbmUFZZVbqEeNQK51IuN5X18m0mFBUOk1Ca4OHhq/vgPzNvzzNmAMz
         Gbig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D3p5QPgt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-441f2eaa7c8si10768451cf.276.2024.06.13.02.25.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2024 02:25:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D3p5QPgt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sHghF-0004G8-D1; Thu, 13 Jun 2024 05:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sHghD-0004FG-O2
 for qemu-arm@nongnu.org; Thu, 13 Jun 2024 05:24:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sHghC-0005Wq-4c
 for qemu-arm@nongnu.org; Thu, 13 Jun 2024 05:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718270677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gty/qhcqM8rKctZ2Q3JKdiXCyNc7WkVbI04fYcS5z1M=;
 b=D3p5QPgt4eHMEmXf7gsvaceZWmxeltxDsV56fS6sAPvMbwS7hjMG16FExGfi8ZNi2Xk9Vd
 q2owXkG7mFNRniELz5CxN+IFJjKAh0DTRL7BKwPCFJi3QcWUtQ9APsQJFvbKyjxFYqvlBy
 vUa3BIGFAO5pKd5KBvWORcIduL6hJVE=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-553-DzpBEYxkNDmNTh96v-PnFQ-1; Thu,
 13 Jun 2024 05:24:35 -0400
X-MC-Unique: DzpBEYxkNDmNTh96v-PnFQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 38A3819560B7; Thu, 13 Jun 2024 09:24:34 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.191])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 023401956050; Thu, 13 Jun 2024 09:24:29 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com,
 zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v3 5/7] virtio-iommu: Remove the implementation of
 iommu_set_iova_range
Date: Thu, 13 Jun 2024 11:20:07 +0200
Message-ID: <20240613092359.847145-6-eric.auger@redhat.com>
In-Reply-To: <20240613092359.847145-1-eric.auger@redhat.com>
References: <20240613092359.847145-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: jZf3A1qHz6jb

Now that we use PCIIOMMUOps to convey information about usable IOVA
ranges we do not to implement the iommu_set_iova_ranges IOMMU MR
callback.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 hw/virtio/virtio-iommu.c | 67 ----------------------------------------
 1 file changed, 67 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 04474ebd74..22288885f1 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1358,72 +1358,6 @@ static int virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
     return 0;
 }
 
-/**
- * virtio_iommu_set_iova_ranges: Conveys the usable IOVA ranges
- *
- * The function turns those into reserved ranges. Once some
- * reserved ranges have been set, new reserved regions cannot be
- * added outside of the original ones.
- *
- * @mr: IOMMU MR
- * @iova_ranges: list of usable IOVA ranges
- * @errp: error handle
- */
-static int virtio_iommu_set_iova_ranges(IOMMUMemoryRegion *mr,
-                                        GList *iova_ranges,
-                                        Error **errp)
-{
-    IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
-    GList *current_ranges = sdev->host_resv_ranges;
-    GList *l, *tmp, *new_ranges = NULL;
-    int ret = -EINVAL;
-
-    /* check that each new resv region is included in an existing one */
-    if (sdev->host_resv_ranges) {
-        range_inverse_array(iova_ranges,
-                            &new_ranges,
-                            0, UINT64_MAX);
-
-        for (tmp = new_ranges; tmp; tmp = tmp->next) {
-            Range *newr = (Range *)tmp->data;
-            bool included = false;
-
-            for (l = current_ranges; l; l = l->next) {
-                Range * r = (Range *)l->data;
-
-                if (range_contains_range(r, newr)) {
-                    included = true;
-                    break;
-                }
-            }
-            if (!included) {
-                goto error;
-            }
-        }
-        /* all new reserved ranges are included in existing ones */
-        ret = 0;
-        goto out;
-    }
-
-    if (sdev->probe_done) {
-        warn_report("%s: Notified about new host reserved regions after probe",
-                    mr->parent_obj.name);
-    }
-
-    range_inverse_array(iova_ranges,
-                        &sdev->host_resv_ranges,
-                        0, UINT64_MAX);
-    rebuild_resv_regions(sdev);
-
-    return 0;
-error:
-    error_setg(errp, "IOMMU mr=%s Conflicting host reserved ranges set!",
-               mr->parent_obj.name);
-out:
-    g_list_free_full(new_ranges, g_free);
-    return ret;
-}
-
 static void virtio_iommu_system_reset(void *opaque)
 {
     VirtIOIOMMU *s = opaque;
@@ -1749,7 +1683,6 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
     imrc->replay = virtio_iommu_replay;
     imrc->notify_flag_changed = virtio_iommu_notify_flag_changed;
     imrc->iommu_set_page_size_mask = virtio_iommu_set_page_size_mask;
-    imrc->iommu_set_iova_ranges = virtio_iommu_set_iova_ranges;
 }
 
 static const TypeInfo virtio_iommu_info = {
-- 
2.41.0

