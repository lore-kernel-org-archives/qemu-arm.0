Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp1392256ejf;
        Wed, 17 Jan 2024 00:05:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3O8Q+yzm0cy0m4mzkqmy6zHAat86rvFanqr92lwi9SUWyqhSEIFzvG7SZDUdPnRB8bDZS
X-Received: by 2002:a05:6214:2b0e:b0:680:f9bd:778e with SMTP id jx14-20020a0562142b0e00b00680f9bd778emr11350483qvb.31.1705478739293;
        Wed, 17 Jan 2024 00:05:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705478739; cv=none;
        d=google.com; s=arc-20160816;
        b=Gu8dklm2oRG0+DOWqfQ8GZf2uTa1X3DZvnZkssehN1fU5y5ZayW6QqCOCGdw2LWMyS
         DSfckk5eCWyOoJvcmGzH99iBj742tsiS0SEcIpr9PMYC1dbJ+90mvuKAmvyybx2cDaIB
         uUdYnsi3GmUw4BpuAn1MXR+8sCbOUKrNpyYAgHVKzej2EQniG6W51WPCED/X/JVp+Pep
         NzIqn38TgY9mPYEt9E9ywMmjYqom5ZskRL1fjzud/iqxwT76FoUFAmUs/g5NjxScig72
         dESYKlsxQ7hHAHTrWgiJIrZ+x86GqTTSpOkzZLR28NZHNbQ5BFsFpITBOkdn9id039B+
         /rbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xqIsR4i4BO9OGZmzS8WyxkJHNJeLczlReQB/Vcukk1A=;
        fh=E3c4Lx6w2odu/6SlG6b7ImsRAg1mlDohYwN4BQaBgGo=;
        b=u+k7YhskR4GYYvtXJTOClnhQmecBiGfFOIv6Ze70Rzodt9lyjhbRRm9DzbHQfztv6i
         TL2lsxN/rkOaEDdCfJjgUfGl7giZV3JpQ8CY6iKMwxeoeLx/2gmoKm/xteEd59ZtP7ld
         LLvuQ+q2C8/SMKUvEyKdCMzVNzJOnamllAP58DyDVM58r7T93E2X4F74OoXfd0iU7sj7
         WWGcK9i2f4S+3cG8hMD/Im8nrYJNg936YDRgI5SXZbIg7mB2fn3HskA9f/LufOKlsvXz
         +OajsWjNl791XpJNg0T8kDl7h7t8WwWfuZLAkhID+KXc+Vsav2PZcLUH4Lk5INbvcFU7
         y4ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HUZq93EJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k14-20020a0cb24e000000b0067f906859f3si11446062qve.427.2024.01.17.00.05.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jan 2024 00:05:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HUZq93EJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQ0uo-0002MS-Pj; Wed, 17 Jan 2024 03:04:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rQ0um-0002JP-FZ
 for qemu-arm@nongnu.org; Wed, 17 Jan 2024 03:04:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rQ0uk-000391-AG
 for qemu-arm@nongnu.org; Wed, 17 Jan 2024 03:04:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705478685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xqIsR4i4BO9OGZmzS8WyxkJHNJeLczlReQB/Vcukk1A=;
 b=HUZq93EJqI9QIYxDiOUUmLB/EXkK8SmY2omIeRt5uoOHiOC/OyTXCRYNSwM0lalT3/ikz6
 1fuKKNaRrHyiGQhjZhXyveP24zo+IO2s9DkWytuNfPqWLT/M7y+ozCKHTb+Sa9fB9xh4TP
 lkqQHSGmd3jJ05ZM/cNzVqruPrrKUlo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-8kzxvro_NzG6YgVOEPRBzw-1; Wed, 17 Jan 2024 03:04:44 -0500
X-MC-Unique: 8kzxvro_NzG6YgVOEPRBzw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C104E85A58B;
 Wed, 17 Jan 2024 08:04:43 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D1A810721;
 Wed, 17 Jan 2024 08:04:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, alex.williamson@redhat.com,
 peter.maydell@linaro.org, zhenzhong.duan@intel.com, peterx@redhat.com,
 yanghliu@redhat.com, pbonzini@redhat.com
Cc: mst@redhat.com,
	clg@redhat.com
Subject: [RFC 7/7] memory: Remove IOMMU MR iommu_set_iova_range API
Date: Wed, 17 Jan 2024 09:02:11 +0100
Message-ID: <20240117080414.316890-8-eric.auger@redhat.com>
In-Reply-To: <20240117080414.316890-1-eric.auger@redhat.com>
References: <20240117080414.316890-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.806,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: HBHhHweJoiQC

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
index 177be23db7..7677b572c5 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -527,26 +527,6 @@ struct IOMMUMemoryRegionClass {
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
@@ -1896,18 +1876,6 @@ int memory_region_iommu_set_page_size_mask(IOMMUMemoryRegion *iommu_mr,
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
index a229a79988..b2fb12f87f 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1909,19 +1909,6 @@ int memory_region_iommu_set_page_size_mask(IOMMUMemoryRegion *iommu_mr,
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

