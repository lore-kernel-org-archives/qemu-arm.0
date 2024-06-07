Received: by 2002:a17:906:acd:b0:a66:557b:2f6e with SMTP id z13csp1237859ejf;
        Fri, 7 Jun 2024 16:25:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrWwoPjD0LCWFK8jfmRFR34usoeOuHSRfxqwuQYS/t2X2SFELwWGjUMiadg+mRGNo3mhEmR/3i+WVLxngJDeQQU7Wg5+VK
X-Google-Smtp-Source: AGHT+IHGkg/PpZl2DSx15JsfYFPNps4mZOeDMwv7OoIP7BkE+DQX4uj9DUwrb61sgbO8xYMrRtwY
X-Received: by 2002:a05:6870:c689:b0:24f:c42e:3124 with SMTP id 586e51a60fabf-254647ffe74mr4445068fac.40.1717802728363;
        Fri, 07 Jun 2024 16:25:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717802728; cv=none;
        d=google.com; s=arc-20160816;
        b=T71fxCA0CM9g3RhplezA8RJp38a+xfXoFrxP/fHqmQLmL3eTFRo4QLwUdlDyotutuS
         hJyWn1CE0rAIDu0p1Hi9EPlV0Vqs35rF5mX6szu/PPIl5GXi9rNH+qbbcUk1Oz054W2g
         zayvu61BW0SkEjO/Jw/xhWaWaJAyhBZrZQno1UowPYUtO4FYly7DMd+KihrtgcDR1Mhh
         BULWLgEcNYY3N1tDdIOfFJ+zkeyA/A8psRt7QsHQE1QTNrrQOlhNX82hs8Juuvuk+0uA
         OpGIBIfUbUWjgXMv6vVrx/pJh5Mc3jlVLN3p8r4O1ulWtkK+WrWUbprGjkeeJmBX8FuU
         du8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xK/OvgNzzcXSWIsdldMqiiYrOffSKwz7no1QQVoOC3M=;
        fh=RVuuaU7Ghp1omAcM/aHHQKcSvJxs+IjfJSTvOY2eDr8=;
        b=tgbp7ARcc541JycbOKX4FLUKXc02/0mMIvGxMYt8mbGDgcO/m70hr0pQ2Ccqm+2hB1
         bY2tm3eGB5OgpkzZo1rMn2xX4yMFjBe32joVdtZvbHAZsuQ1g12tIBs6WQNJvyOZIjq8
         dwsLeoLEOCmtvLT5mMdFnzY/uUKvLV/5/UpGYqt7XVmhmwkcfc8GYLEgCLiDnA6xKCrA
         NXCaYk7eAEAVbIn6uf/oH1rrlD2G9UOzs82e/OWgrs8nomegs6CH5mFIafLBbFcE+Nx8
         JQZuufblO7iH3dAfJnU9wNIcAGnqTRi8I5v3/gimInaZ0p7tu2IU7voLAmrYwU+4K1I1
         o1ZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fIlPZpW6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-795333364b1si548921185a.549.2024.06.07.16.25.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2024 16:25:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fIlPZpW6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sFalD-0007QT-Rs; Fri, 07 Jun 2024 10:40:07 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sFalA-0007EV-6x
 for qemu-devel@nongnu.org; Fri, 07 Jun 2024 10:40:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sFal8-0003Qs-Hz
 for qemu-devel@nongnu.org; Fri, 07 Jun 2024 10:40:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717771201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xK/OvgNzzcXSWIsdldMqiiYrOffSKwz7no1QQVoOC3M=;
 b=fIlPZpW6YG4o+TEa2FAQqDGFRSZ13OCRN+jIHqlMViSOQ8kVTEmsrDom5ZQ+OgjMtcXouO
 UuqX+lxRINZu4ZRPjegeDI5kSc/kFlaGEr9xL6mgJQUwjz/KI0EUFEUoYNl3eKrAFbBE+h
 /f3X4sKAvJunDx7qFIcDvBATrTJ6QUU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-300-pWgggVlZOBGnrh-8JtS-AQ-1; Fri,
 07 Jun 2024 10:39:56 -0400
X-MC-Unique: pWgggVlZOBGnrh-8JtS-AQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8836E19560B9; Fri,  7 Jun 2024 14:39:55 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.191])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B50DA1956048; Fri,  7 Jun 2024 14:39:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [RFC v2 7/7] memory: Remove IOMMU MR iommu_set_iova_range API
Date: Fri,  7 Jun 2024 16:37:27 +0200
Message-ID: <20240607143905.765133-8-eric.auger@redhat.com>
In-Reply-To: <20240607143905.765133-1-eric.auger@redhat.com>
References: <20240607143905.765133-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: heFEKwP+fbs5

Since the host IOVA ranges are now passed through the
PCIIOMMUOps set_host_resv_regions and we have removed
the only implementation of iommu_set_iova_range() in
the virtio-iommu and the only call site in vfio/common,
let's retire the IOMMU MR API and its memory wrapper.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 32 --------------------------------
 system/memory.c       | 13 -------------
 2 files changed, 45 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 9cdd64e9c6..35d772e52b 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -530,26 +530,6 @@ struct IOMMUMemoryRegionClass {
      int (*iommu_set_page_size_mask)(IOMMUMemoryRegion *iommu,
                                      uint64_t page_size_mask,
                                      Error **errp);
-    /**
-     * @iommu_set_iova_ranges:
-     *
-     * Propagate information about the usable IOVA ranges for a given IOMMU
-     * memory region. Used for example to propagate host physical device
-     * reserved memory region constraints to the virtual IOMMU.
-     *
-     * Optional method: if this method is not provided, then the default IOVA
-     * aperture is used.
-     *
-     * @iommu: the IOMMUMemoryRegion
-     *
-     * @iova_ranges: list of ordered IOVA ranges (at least one range)
-     *
-     * Returns 0 on success, or a negative error. In case of failure, the error
-     * object must be created.
-     */
-     int (*iommu_set_iova_ranges)(IOMMUMemoryRegion *iommu,
-                                  GList *iova_ranges,
-                                  Error **errp);
 };
 
 typedef struct RamDiscardListener RamDiscardListener;
@@ -1945,18 +1925,6 @@ int memory_region_iommu_set_page_size_mask(IOMMUMemoryRegion *iommu_mr,
                                            uint64_t page_size_mask,
                                            Error **errp);
 
-/**
- * memory_region_iommu_set_iova_ranges - Set the usable IOVA ranges
- * for a given IOMMU MR region
- *
- * @iommu: IOMMU memory region
- * @iova_ranges: list of ordered IOVA ranges (at least one range)
- * @errp: pointer to Error*, to store an error if it happens.
- */
-int memory_region_iommu_set_iova_ranges(IOMMUMemoryRegion *iommu,
-                                        GList *iova_ranges,
-                                        Error **errp);
-
 /**
  * memory_region_name: get a memory region's name
  *
diff --git a/system/memory.c b/system/memory.c
index 9540caa8a1..248d514f83 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1914,19 +1914,6 @@ int memory_region_iommu_set_page_size_mask(IOMMUMemoryRegion *iommu_mr,
     return ret;
 }
 
-int memory_region_iommu_set_iova_ranges(IOMMUMemoryRegion *iommu_mr,
-                                        GList *iova_ranges,
-                                        Error **errp)
-{
-    IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
-    int ret = 0;
-
-    if (imrc->iommu_set_iova_ranges) {
-        ret = imrc->iommu_set_iova_ranges(iommu_mr, iova_ranges, errp);
-    }
-    return ret;
-}
-
 int memory_region_register_iommu_notifier(MemoryRegion *mr,
                                           IOMMUNotifier *n, Error **errp)
 {
-- 
2.41.0

