Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp8196805lfc;
        Thu, 18 Feb 2021 06:21:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJZPnB3fypHvGU+ODDHiMlqrL54hOv0EuxVgPPVcEY+3C+lvUO5zmyD8+1yq3rubPPScN+
X-Received: by 2002:a25:190b:: with SMTP id 11mr6562597ybz.236.1613658064663;
        Thu, 18 Feb 2021 06:21:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613658064; cv=none;
        d=google.com; s=arc-20160816;
        b=u/mMbB10xKFE2p0zYzmsyF1lcHjhmNa57Gc2UgcV3uc0mGGrIdLu3IvgWdS/F+VKIQ
         BCeMDOimm0oAn95X0m5OAZ9Mu8dmZtIiBOOJ2YQiOMAVa42D/FxQIsHEcGTOAd+NmrDx
         euhnlKyJDYOhJgDUFyPm033cE/WlStg4zP7PjgeDDw51BipXg6zmFvedphC2gDVyEx1D
         iGZS+0WNVJaW/r0hwbevWCLyzilnXy/qst6KphG6ID0Gu1W49YQZ936gzyQIg2jqrwaT
         HF04RZMmGEBgSHr2dUhk/ehjI4GhBn7KbIOSIsGslm3HAlU0KZmAcK+PyvyAe32p+HfE
         ZqNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=I43ZM4cmUAiPsrUU0yp3A0Q8uJQAPleQknNBrew+ckQ=;
        b=VS58/z12SdktGuw3IBM8WO2iSD8CgxUtgmmW+8FIGCi7etMmrx55GmfllEBSEtq/fs
         kc4Tqa1K7pYWGKyyHwhHwYNSW0FT9X7l/T7/AreHcX+4p6Y6ZY0XB/eWYeYjWi36uP66
         KFzA76/NGjPjg4wWphA51kmNxA4v5J0f9K+yyCX7XoTJeStYhZ7fUkuUrmEEnkFukFEm
         +bKG0DkvpAV4wLzHJzVa0DGZaUfvoo28N4ecMBbhwhFSKuMJ30Rxbuad6HZLDrfWmBWo
         akduLzMc6Xtiv2vYEmsqhy5p4sxShIbc12du6KJOEROyMkehfSM5DzqQFihc2QnITv3p
         SDXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PlQCKAqK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w191si4144247ybe.183.2021.02.18.06.21.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Feb 2021 06:21:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PlQCKAqK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lCkAx-0008DG-US
	for alex.bennee@linaro.org; Thu, 18 Feb 2021 09:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lCk7p-0006Ui-9s
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:17:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lCk7i-00009V-R3
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:17:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613657861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=I43ZM4cmUAiPsrUU0yp3A0Q8uJQAPleQknNBrew+ckQ=;
 b=PlQCKAqKkC5sQC9GJ8qLDxI1kix7blyZjdMO53BfWPRBLoOPRfsIZs1avUagUA3+69f6rk
 8CDQlUzwqSKAY4xFmcR7O7LuIBnedQN18lYJpFUKcyZWEFEaJOkc4bXvTairtMZzPDIZo9
 uM+2i3LwU3N8/e++GQ0+zbg8qsPoenk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-qtpQNj5HO4K7EhNF_if_LA-1; Thu, 18 Feb 2021 09:17:38 -0500
X-MC-Unique: qtpQNj5HO4K7EhNF_if_LA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98F301934107;
 Thu, 18 Feb 2021 14:17:36 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-34.ams2.redhat.com [10.36.114.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 590425B6A4;
 Thu, 18 Feb 2021 14:16:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org
Subject: [PATCH] virtio-iommu: Handle non power of 2 range invalidations
Date: Thu, 18 Feb 2021 15:16:50 +0100
Message-Id: <20210218141650.424967-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: vivek.gautam@arm.com, jasowang@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H2DuE4q92ahL

Unmap notifiers work with an address mask assuming an
invalidation range of a power of 2. Nothing mandates this
in the VIRTIO-IOMMU spec.

So in case the range is not a power of 2, split it into
several invalidations.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-iommu.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index c2883a2f6c..a4104c99ad 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -155,6 +155,8 @@ static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr virt_start,
                                       hwaddr virt_end)
 {
     IOMMUTLBEvent event;
+    uint64_t mask = virt_end - virt_start;
+    uint64_t size;
 
     if (!(mr->iommu_notify_flags & IOMMU_NOTIFIER_UNMAP)) {
         return;
@@ -164,12 +166,27 @@ static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr virt_start,
 
     event.type = IOMMU_NOTIFIER_UNMAP;
     event.entry.target_as = &address_space_memory;
-    event.entry.addr_mask = virt_end - virt_start;
-    event.entry.iova = virt_start;
     event.entry.perm = IOMMU_NONE;
     event.entry.translated_addr = 0;
+    event.entry.addr_mask = mask;
+    event.entry.iova = virt_start;
 
-    memory_region_notify_iommu(mr, 0, event);
+    if (mask == UINT64_MAX) {
+        memory_region_notify_iommu(mr, 0, event);
+    }
+
+    size = mask + 1;
+
+    while (size) {
+        uint8_t highest_bit = 64 - clz64(size) - 1;
+        uint64_t pow2size = BIT_ULL(highest_bit);
+
+        event.entry.addr_mask = pow2size - 1;
+        event.entry.iova = virt_start;
+        memory_region_notify_iommu(mr, 0, event);
+        size &= ~pow2size;
+        virt_start += pow2size;
+    }
 }
 
 static gboolean virtio_iommu_notify_unmap_cb(gpointer key, gpointer value,
-- 
2.26.2

