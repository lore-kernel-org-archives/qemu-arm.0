Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp262935ejc;
        Wed, 11 Oct 2023 10:56:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2ExRvhElM89ufX5BDKk9X2oa7y3T3ptObDpcnSqD3B5CEBle4id4GSO9RsSPGGXLD1RMq
X-Received: by 2002:a05:620a:29c1:b0:777:5fa:501f with SMTP id s1-20020a05620a29c100b0077705fa501fmr13566618qkp.21.1697046967661;
        Wed, 11 Oct 2023 10:56:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697046967; cv=none;
        d=google.com; s=arc-20160816;
        b=ai38T+9VXGssAtsn7d1kG4peomWbaLY2f5C1ucGn9sjRf0Na5J5F8JYmDV+5X4EY+s
         ifEPACfjPhQif6XeV7Nl85AV3A1HoHp9Yw/8NBj3i0E/KOfXov/49YO2RHdL9M6jTPe6
         kWMn5xPzHQK5vs7nTX7CCkOAXJpeTvetXVhtyNVipIDviYj88SzwCbG2M1rggeOpUsBx
         fllp0Y3a5bjCPqMOYJizaRLvPjkFA5QCc7u0yoCWwnwWT6pte8I7LaCYroG3Qh7PfpUl
         2GR/jjerEFZ6vCcYTQR3k+2VgVHbL7dZUSZBmrlI3q7kaL1dDMWgDfpRj2O4AJgNUzHz
         Twiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BwgYEmvmaC+2vRFXUUOhOnfssWOFXICorZotnfev0rU=;
        fh=9ZVtvpfpBEZx1oWqIMPFEsByQUx/hbHUkY9aIbMmkns=;
        b=P8qiisACWr+LZBwmuRQiTmGBxW63rh8/wsbMisvSBTkLpH/GoXTlmZHATEZiNqWRof
         sBCSta6tUX+FNRBqc/x9ewl1fCtCl5/LsAypUCQOrOnH5F/Ct8L1nHaLFSi/Zg+7YdDC
         YSDbHmK3O4W87WRAEPbFi2im/gP0UwmcEFrFei7HuFALyfRU2SMqIwtFLtYiwCyTADCQ
         twtGSb3VjpfH1AW0R5610jOx+dkwh1Vb8A4D81CQnSR+5fB7SeZ29C8yBBq04zpBaohP
         OSIIS1dwNESxeijpnRLukTGKhD58uI7EvWM0jY7MvItQwhbtyvoeE/4si6fsaMXblOPR
         wShQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JBwlHg1+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q22-20020a05620a0d9600b007770bfd4044si6437228qkl.459.2023.10.11.10.56.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Oct 2023 10:56:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JBwlHg1+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqdR8-0001GO-Sp; Wed, 11 Oct 2023 13:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qqdR6-0001FG-45
 for qemu-arm@nongnu.org; Wed, 11 Oct 2023 13:55:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qqdR2-0006Xt-Qs
 for qemu-arm@nongnu.org; Wed, 11 Oct 2023 13:55:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697046951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BwgYEmvmaC+2vRFXUUOhOnfssWOFXICorZotnfev0rU=;
 b=JBwlHg1+3PCOivzSw8miJQCzhQYhrdTKSBbHYcNohla/Hogoo/10y7oMmKjmI4sYDrxdn+
 /RoiIVMh3YgadMG/YK4oZQzILQ8p8QfgqcAsoEuMgKDp1V+214Fi43NI8z/X5fgi/WKl0v
 QVa30PSfWdbgMAF3kcPyKc4cOXyeq+Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-4bEQ_MRjM82IAmZdeH8F9Q-1; Wed, 11 Oct 2023 13:55:41 -0400
X-MC-Unique: 4bEQ_MRjM82IAmZdeH8F9Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55B2D811E86;
 Wed, 11 Oct 2023 17:55:41 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4BA2492C3E;
 Wed, 11 Oct 2023 17:55:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com
Subject: [PATCH v3 02/13] memory: Introduce memory_region_iommu_set_iova_ranges
Date: Wed, 11 Oct 2023 19:52:18 +0200
Message-ID: <20231011175516.541374-3-eric.auger@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: dWkftYM1CYOD

This helper will allow to convey information about valid
IOVA ranges to virtual IOMMUS.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- Pass a Glist instead
- Added a comment on memory_region_iommu_set_iova_ranges
- Removed R-b due to that change
---
 include/exec/memory.h | 30 ++++++++++++++++++++++++++++++
 system/memory.c       | 13 +++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 0d83f83d6d..eb52c75192 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -525,6 +525,24 @@ struct IOMMUMemoryRegionClass {
      int (*iommu_set_page_size_mask)(IOMMUMemoryRegion *iommu,
                                      uint64_t page_size_mask,
                                      Error **errp);
+    /**
+     * @iommu_set_iova_ranges:
+     *
+     * Propagate information about the usable IOVA ranges for a given IOMMU
+     * memory region. Used for example to propagate host physical device
+     * reserved memory region constraints to the virtual IOMMU.
+     *
+     * Optional method: if this method is not provided, then the default IOVA
+     * aperture is used.
+     *
+     * @iova_ranges: list of ordered IOVA ranges (at least one range)
+     *
+     * Returns 0 on success, or a negative error. In case of failure, the error
+     * object must be created.
+     */
+     int (*iommu_set_iova_ranges)(IOMMUMemoryRegion *iommu,
+                                  GList *iova_ranges,
+                                  Error **errp);
 };
 
 typedef struct RamDiscardListener RamDiscardListener;
@@ -1852,6 +1870,18 @@ int memory_region_iommu_set_page_size_mask(IOMMUMemoryRegion *iommu_mr,
                                            uint64_t page_size_mask,
                                            Error **errp);
 
+/**
+ * memory_region_iommu_set_iova_ranges - Set the usable IOVA ranges
+ * for a given IOMMU MR region
+ *
+ * @iommu_mr: IOMMU memory region
+ * @iova_ranges: list of ordered IOVA ranges (at least one range)
+ * @errp: pointer to Error*, to store an error if it happens.
+ */
+int memory_region_iommu_set_iova_ranges(IOMMUMemoryRegion *iommu,
+                                        GList *iova_ranges,
+                                        Error **errp);
+
 /**
  * memory_region_name: get a memory region's name
  *
diff --git a/system/memory.c b/system/memory.c
index fa1c99f9ba..26427780bd 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1909,6 +1909,19 @@ int memory_region_iommu_set_page_size_mask(IOMMUMemoryRegion *iommu_mr,
     return ret;
 }
 
+int memory_region_iommu_set_iova_ranges(IOMMUMemoryRegion *iommu_mr,
+                                        GList *iova_ranges,
+                                        Error **errp)
+{
+    IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
+    int ret = 0;
+
+    if (imrc->iommu_set_iova_ranges) {
+        ret = imrc->iommu_set_iova_ranges(iommu_mr, iova_ranges, errp);
+    }
+    return ret;
+}
+
 int memory_region_register_iommu_notifier(MemoryRegion *mr,
                                           IOMMUNotifier *n, Error **errp)
 {
-- 
2.41.0

