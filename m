Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp59023njk;
        Tue, 16 Jul 2024 02:48:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLlzqWKm1xWe7Rki17kpROPpayNS+dkJScbjUwHY3lTtMJrFuLrlB2dsu36v6v60p8dPJD6AxOuplzQtnCl11P6wg1PTNZ
X-Google-Smtp-Source: AGHT+IGwr1IJC99diUH/CgK436KQlcC7XbXGVQOb4n67HIDhaN1w9d+Em8HKM3WibTCLOB4nvdlo
X-Received: by 2002:a05:6122:1692:b0:4ef:6d02:f4a with SMTP id 71dfb90a1353d-4f4d724dd3emr123837e0c.13.1721123290205;
        Tue, 16 Jul 2024 02:48:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721123290; cv=none;
        d=google.com; s=arc-20160816;
        b=fJoG3YlHwPYUSpJrD3q+oYUcK7/iPv/FsB2ER/m6TV/k2kbSCFYiJ8EUhjf2Rurgvr
         1PkqDbEats01PNGphnIf2dgEWrgLlAqfKVXXhcUBeIv8MyfL5J8ZgqA5YUDZZOi81Qa9
         csZz514sOe7SViu3i3XSRUz1F1wn7IB1yYOeloLl4wAMBYL1jWLbAH8hYYjUa2q0iwYe
         pscMlutC+hQcidNIUi+srbKHNfTBCqzeLS+tYMVaWAO4Pzx2RxKAeXCgmO4atwVXC/6W
         puE871vAdjvYrBCYVgkMPowz63lajuuJOBFENzUQ0N46OW9kC1LPGdOkpbdwDoOwyp7C
         h4zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SU1kJ0X8nNI5cBpcnHA6rq85FBjXuBZPC89l80NxH+E=;
        fh=D1TEnXH2DbXUr6sVqyo/ig9zTKSO675I5EGRzxL3ieY=;
        b=WXj8PMNnkioWoZRycg+vJnyAXp0H86U5PeFyATOTBYpbnWbni0ilTJrdORmndO7iJr
         thsnx4cBwlHPikgWaQZ2ekVEjL49MPUrrbxi7CGrXun0fS4rlmwmk22vNkzVSY6giT/e
         bZg9AmAexiH6TJ950jKKoqBCnEnR5IZSEBoUVvFChtDkD7oqJrPSbQnDKT7pI6a6oMIG
         XdCHeZJsY5ILEEZSqDQqMpoQO3utwDzAkc8aEZNpTiYcU1e2nQ4hmUR0n8T6T1QUXGef
         1oyb3VSgSke8zFcqoYpqB4gqKlfBCD+hNsUoS+BY/FdEAvyiKRDgG5tT2QA4Lb7FjVKW
         8Vxg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TIj9zAJ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b761a3c9a8si71178126d6.463.2024.07.16.02.48.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 02:48:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TIj9zAJ3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTelv-0006fj-SB; Tue, 16 Jul 2024 05:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sTelu-0006bL-Ps
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 05:46:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sTelt-0000PJ-9B
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 05:46:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721123216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SU1kJ0X8nNI5cBpcnHA6rq85FBjXuBZPC89l80NxH+E=;
 b=TIj9zAJ3cgstx/BPMCG25YenTPMiK8GQLSztidMjLKtBVrl8RFhdJQobYEyPbhj/sJ1/WQ
 QeMNzhkuHBdksiFb4BswPnjmgrun1pFWhGU7oTEuwmQFE2dgXtf9lnzr6sF3FxIzz79KX8
 aVg9/lyNy7cWU5Bj2+gzBKOunbg+1p0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-520-3Jfvq2nQPN6zwA6fiN-6sA-1; Tue,
 16 Jul 2024 05:46:53 -0400
X-MC-Unique: 3Jfvq2nQPN6zwA6fiN-6sA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2711A1955D50; Tue, 16 Jul 2024 09:46:52 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.185])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 62035300018E; Tue, 16 Jul 2024 09:46:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, zhenzhong.duan@intel.com,
 alex.williamson@redhat.com, jasowang@redhat.com
Cc: yanghliu@redhat.com
Subject: [PATCH 5/6] hw/vfio/common: Add vfio_listener_region_del_iommu trace
 event
Date: Tue, 16 Jul 2024 11:45:07 +0200
Message-ID: <20240716094619.1713905-6-eric.auger@redhat.com>
In-Reply-To: <20240716094619.1713905-1-eric.auger@redhat.com>
References: <20240716094619.1713905-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-TUID: h3xk4/0KFq3L

Trace when VFIO gets notified about the deletion of an IOMMU MR.
Also trace the name of the region in the add_iommu trace message.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c     | 3 ++-
 hw/vfio/trace-events | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 6d15b36e0b..cfc44a4569 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -599,7 +599,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
         IOMMUMemoryRegion *iommu_mr = IOMMU_MEMORY_REGION(section->mr);
         int iommu_idx;
 
-        trace_vfio_listener_region_add_iommu(iova, end);
+        trace_vfio_listener_region_add_iommu(section->mr->name, iova, end);
         /*
          * FIXME: For VFIO iommu types which have KVM acceleration to
          * avoid bouncing all map/unmaps through qemu this way, this
@@ -725,6 +725,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
     if (memory_region_is_iommu(section->mr)) {
         VFIOGuestIOMMU *giommu;
 
+        trace_vfio_listener_region_del_iommu(section->mr->name);
         QLIST_FOREACH(giommu, &bcontainer->giommu_list, giommu_next) {
             if (MEMORY_REGION(giommu->iommu_mr) == section->mr &&
                 giommu->n.start == section->offset_within_region) {
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index e16179b507..98bd4dccea 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -95,7 +95,8 @@ vfio_region_read(char *name, int index, uint64_t addr, unsigned size, uint64_t d
 vfio_iommu_map_notify(const char *op, uint64_t iova_start, uint64_t iova_end) "iommu %s @ 0x%"PRIx64" - 0x%"PRIx64
 vfio_listener_region_skip(const char *name, uint64_t start, uint64_t end) "SKIPPING %s 0x%"PRIx64" - 0x%"PRIx64
 vfio_spapr_group_attach(int groupfd, int tablefd) "Attached groupfd %d to liobn fd %d"
-vfio_listener_region_add_iommu(uint64_t start, uint64_t end) "region_add [iommu] 0x%"PRIx64" - 0x%"PRIx64
+vfio_listener_region_add_iommu(const char* name, uint64_t start, uint64_t end) "region_add [iommu] %s 0x%"PRIx64" - 0x%"PRIx64
+vfio_listener_region_del_iommu(const char *name) "region_del [iommu] %s"
 vfio_listener_region_add_ram(uint64_t iova_start, uint64_t iova_end, void *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64" [%p]"
 vfio_known_safe_misalignment(const char *name, uint64_t iova, uint64_t offset_within_region, uintptr_t page_size) "Region \"%s\" iova=0x%"PRIx64" offset_within_region=0x%"PRIx64" qemu_real_host_page_size=0x%"PRIxPTR
 vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
-- 
2.41.0

