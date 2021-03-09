Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2656334lfg;
        Tue, 9 Mar 2021 02:30:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4BVe8KQj8gFubqrjAb1+mMxC9isIWyg3piGj/jgadi/xFytoUaKeQk2Wa4C3ey2/cxz11
X-Received: by 2002:a6b:5c0d:: with SMTP id z13mr21927463ioh.6.1615285837422;
        Tue, 09 Mar 2021 02:30:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615285837; cv=none;
        d=google.com; s=arc-20160816;
        b=bfcZztRnCYhCpEQPRt8Q7xYg/pOOvaxpJ+IcrKcIbOl0/qWp2imDnBcOuSushq9tVy
         UxZPYV/0Kl00a9ZpJXbBF6Mv1VMXPzIS70mY+zZverqi1JbsgiMjGHP214XhNb7Nvfva
         xGKBPi2UeKD9BGe0NKXGNHhYvoIHigH8sJktvXwbhzoxduJD1Lg4O05LHbhpq1rNP7Kj
         K2etMSipaxYwqUKZEn2+89l8j5QPrjOuUHSpzqySluXu1dSlVEm/d+jaGNvTl7G3bwbm
         re+3ZZjcy3PgnwElzr7N2uMRyp8tyEmjBGMNj+n0GCRRWWW7ZUzI4X0s6ed9d1TkkKay
         RPrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YbumvOeiPBfpgSu4BtLOJaXiWkOHdQ5bo2qiU9SpVSk=;
        b=0RIQeK5CsIEvHvc8x4PWfHesLXKbiaIqwxTC3GI/YoWBDrDMEH0zG4gGBD5LDrQ4YE
         3xzLUHWzWByGR660rRc1+S/q0ceFL68oe4Bvkhkj3SaJPlwT8ZyH8Oe5zRNz26EhN4bn
         2YuDWhnbiItyHgFx3IfLEe8Cq1xPd0xnMDBx4FNu0hSbeTqiKDOQZmUZK4I1iecD4A9f
         W7jysjK6iX/73TP9cHydkFlnmCOqnEjkyyI1vdPuNRdr+AXdbi1l1ItDlT6VV6p9YesG
         sgBPgFHDzLKyVmyomnSUN7nvDJklyNrIL9WraJnx3hgJ2jlYyBNvoLKLSyhLnoITF/43
         k6sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IAZVvQln;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q15si12838976iow.39.2021.03.09.02.30.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 02:30:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IAZVvQln;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJZdM-0007Gg-MT
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 05:30:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lJZb4-0005Gy-Is
 for qemu-arm@nongnu.org; Tue, 09 Mar 2021 05:28:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lJZb2-0005Yj-83
 for qemu-arm@nongnu.org; Tue, 09 Mar 2021 05:28:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615285691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YbumvOeiPBfpgSu4BtLOJaXiWkOHdQ5bo2qiU9SpVSk=;
 b=IAZVvQlnDeviwmKnBKcpkVZxqUQ0Ex3iL+VIEL0w9RRKscgf85NzaPxlFD1Xd/gbVL9cLV
 18f0HlMP5DCP1cskCqBlj4JqG3WAre8hhGuoEDRbYPPuvAcAMuT2x2RViC5rsgtzxLCYgu
 6OpqHm/lQeVz/gJ8Ov4USkguV4QNzgc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-rJF_RBmUOrqXgMuP_QndHA-1; Tue, 09 Mar 2021 05:28:09 -0500
X-MC-Unique: rJF_RBmUOrqXgMuP_QndHA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DD32108BD18;
 Tue,  9 Mar 2021 10:28:08 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-254.ams2.redhat.com [10.36.112.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 903A61F4;
 Tue,  9 Mar 2021 10:28:05 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 jean-philippe@linaro.org, peterx@redhat.com, jasowang@redhat.com,
 pbonzini@redhat.com
Subject: [PATCH v3 3/7] virtio-iommu: Handle non power of 2 range invalidations
Date: Tue,  9 Mar 2021 11:27:38 +0100
Message-Id: <20210309102742.30442-4-eric.auger@redhat.com>
In-Reply-To: <20210309102742.30442-1-eric.auger@redhat.com>
References: <20210309102742.30442-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: vivek.gautam@arm.com, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wtOAucePcIZ+

Unmap notifiers work with an address mask assuming an
invalidation range of a power of 2. Nothing mandates this
in the VIRTIO-IOMMU spec.

So in case the range is not a power of 2, split it into
several invalidations.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>

---

v2 -> v3:
- added Peter's R-b
---
 hw/virtio/virtio-iommu.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index c2883a2f6c..1b23e8e18c 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -155,6 +155,7 @@ static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr virt_start,
                                       hwaddr virt_end)
 {
     IOMMUTLBEvent event;
+    uint64_t delta = virt_end - virt_start;
 
     if (!(mr->iommu_notify_flags & IOMMU_NOTIFIER_UNMAP)) {
         return;
@@ -164,12 +165,24 @@ static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr, hwaddr virt_start,
 
     event.type = IOMMU_NOTIFIER_UNMAP;
     event.entry.target_as = &address_space_memory;
-    event.entry.addr_mask = virt_end - virt_start;
-    event.entry.iova = virt_start;
     event.entry.perm = IOMMU_NONE;
     event.entry.translated_addr = 0;
+    event.entry.addr_mask = delta;
+    event.entry.iova = virt_start;
 
-    memory_region_notify_iommu(mr, 0, event);
+    if (delta == UINT64_MAX) {
+        memory_region_notify_iommu(mr, 0, event);
+    }
+
+
+    while (virt_start != virt_end + 1) {
+        uint64_t mask = dma_aligned_pow2_mask(virt_start, virt_end, 64);
+
+        event.entry.addr_mask = mask;
+        event.entry.iova = virt_start;
+        memory_region_notify_iommu(mr, 0, event);
+        virt_start += mask + 1;
+    }
 }
 
 static gboolean virtio_iommu_notify_unmap_cb(gpointer key, gpointer value,
-- 
2.26.2

