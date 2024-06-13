Received: by 2002:a17:906:641:b0:a6f:1bf6:7fc1 with SMTP id t1csp191954ejb;
        Thu, 13 Jun 2024 02:25:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW5UfYYkZ7JylH9eBYMXWY+NQ+6O3W3Rqg6QVsGNFh1cWPQc7dHUDtmJypki3A5IIZ0mx9y6cAWgInOaFoClwvb9W9xs6D7
X-Google-Smtp-Source: AGHT+IHxU4J9s74uHDhD1vZBMMkerbZKZ/LkP4U8H0iHeuFoaDl4RS4Xci87fZTElj72y490Kng3
X-Received: by 2002:a05:6214:43c4:b0:6b0:76f1:864f with SMTP id 6a1803df08f44-6b1a76fc2b9mr51544706d6.63.1718270746912;
        Thu, 13 Jun 2024 02:25:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718270746; cv=none;
        d=google.com; s=arc-20160816;
        b=CGC2Hj1PryBkHS2uKT9JmIQT7H4swKGrMONGIRKlL1+L+3SIGJBeKbIvRCCKDbfcnQ
         mTHe60etLGFkl/k6bVVttbfUu8Uv9gMccMJZR3CE9OPjPWCEi3byPFJJLmnv0zjwt9BB
         60D6IjlqOaCUqY6HIOMH8PLFj0Wiypyyig7xZNr67x78qaa68A7eUAJHSliago39RbLn
         CxLWzr1UmCfOfmQGTXKqJHgVpnhpn4iGetMm2wJ7IlzT/wBaDAMIpqhLck4wb5s2OMj3
         kQI122/GvP5uL64KQEQrlwL9pEUo+R72Uf1+mef5NymGo1NtrHo1wawCCg6tjjfi5WTr
         xDjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=v4oXJbwUkpDdsYRWNM4Mzh6/AZK1mQcxllmiQmlMU+k=;
        fh=NBkbC8z0yxZVnBu5+T/osSPCS2NzeZu/yHpj5pv7NrY=;
        b=dxhbQcc8GqdNN9b5q1o7K1f1rC4jGdl7NvlijnRX4znbEdH+lQWhSeurABs/YQzMAK
         vbI2Mhr9xSDqJq3C8AiObTlqsGUDYj+wGFVGIAlQJBXVsCl2FnMvsoM9inm9ZmywWexO
         T41wJtJtZILJ+z0z9jcxMTfoKdixd5nDg6nHpMxkX1VMBFed0ERYo9AEPKmNMQuH2Qnp
         RJ2FnKiXvrjqKJfxXVdxmUy8o1S/DWNRxsWnCMXGQgZb/uTzOG/sARXcBKAQJwooy3Gu
         ME3o0icjYgg2Sg8uFVrIb78N9f0TU2HPEmdDnc5FrHn/meLByqTNz9vopAFLCFq1iwYE
         CUxg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jnsc+Jqa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2a5b2d983si10577646d6.393.2024.06.13.02.25.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2024 02:25:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jnsc+Jqa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sHghR-0004UK-KT; Thu, 13 Jun 2024 05:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sHghQ-0004Ta-CO
 for qemu-arm@nongnu.org; Thu, 13 Jun 2024 05:24:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sHghO-0005ax-Nr
 for qemu-arm@nongnu.org; Thu, 13 Jun 2024 05:24:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718270690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v4oXJbwUkpDdsYRWNM4Mzh6/AZK1mQcxllmiQmlMU+k=;
 b=Jnsc+JqaaI6aWiwz4NCva/VdbRD3ONxL+VKVGzjtm+RQcun0pHk7AStnsRu+k41ePynMcS
 vh2h6bPnwk5kOZ6JfvT5QXD5Vo0JC4U5pfvORABZ3lwOvAtUamF0VT0UG4vaODVVPPMTA+
 ZmB9SmKJRDb1fi+meVKxea0LRfPOyO0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-642-Eb0429XSPWuhksdnxJ5z5g-1; Thu,
 13 Jun 2024 05:24:45 -0400
X-MC-Unique: Eb0429XSPWuhksdnxJ5z5g-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CC77319560B6; Thu, 13 Jun 2024 09:24:43 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.191])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id ED83C1956050; Thu, 13 Jun 2024 09:24:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com,
 zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v3 7/7] memory: Remove IOMMU MR iommu_set_iova_range API
Date: Thu, 13 Jun 2024 11:20:09 +0200
Message-ID: <20240613092359.847145-8-eric.auger@redhat.com>
In-Reply-To: <20240613092359.847145-1-eric.auger@redhat.com>
References: <20240613092359.847145-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124;
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
X-TUID: R6PGd4QfB54I

Since the host IOVA ranges are now passed through the
PCIIOMMUOps set_host_resv_regions and we have removed
the only implementation of iommu_set_iova_range() in
the virtio-iommu and the only call site in vfio/common,
let's retire the IOMMU MR API and its memory wrapper.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 include/exec/memory.h | 32 --------------------------------
 system/memory.c       | 13 -------------
 2 files changed, 45 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 1be58f694c..ed40f74460 100644
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
@@ -1951,18 +1931,6 @@ int memory_region_iommu_set_page_size_mask(IOMMUMemoryRegion *iommu_mr,
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
index 74cd73ebc7..336ad5da5f 100644
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

