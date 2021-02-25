Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp186523lfg;
        Thu, 25 Feb 2021 01:19:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytBoBDmeUOlVhtieIXb0am6977ClRHTgJZli2T5vmssCjS51ZgkE2xXBMw+Xhj4yceHQEj
X-Received: by 2002:a25:2183:: with SMTP id h125mr2761302ybh.378.1614244753771;
        Thu, 25 Feb 2021 01:19:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614244753; cv=none;
        d=google.com; s=arc-20160816;
        b=ZtXIq1EoSWTT/8x0f4dIu7zzAVvLqkdYMu8L8a1+fVRcihqA4zDUxGXsGlaXSt0w0M
         2ZpGLTjzidtwxZRdLoL5/5YxtL+Ve4xTSgvp3FOb2Jk/x6PY6WiXjGWJ0X/NXmrviq/5
         hBWRgLRELO/VD1cg6gRTTU6JTGjgFKb37/FCHLswyGOvYxv+6KwQdxiAaDKhV0wYoL69
         fE5RrK4glSMIh5hYwjb8jxEWKWjm7rXz9/e9PLHPphROFUIy5wAML/dfUi5nbM7ZR7b7
         efP/ZLlL5mVg1X8bSUXaQ26JWFscpa26Hf6QfYOiPeV426+Cy2N2pnmPLFOEAIg79rDT
         QgIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8CBiTjBBrSUvl7XaxpyhYLNyR7QNYng/yBdBtviVWFo=;
        b=FJduigu4W+ErqrYqN7gzZF5eHJJ/7jeM7XvyuBd/oWUVGYp+cH1xtiBy73MHHMgKPT
         gyzvdqmdAEP+yhllkO2n+O/otsPplsCP6+wQtU7FfeqRtGEJlr7tlAnolgLh9yyQG1kH
         IfFztGCvi4vzo6zDlZ+EOwRmxZP4LzG/m7xVUQswhOUQeulN4LB+J4cJOWgzj+0Z+Fed
         GgO4Ah5/Y90iJDiKgHqCd8/aEfwu/MNXVbe+tCyt8eX//rN33XhGis//gkalR9A+27Km
         XtOzO7FADBK7nilNDnyFJB3oEigS5Np8zfdQD4cCHU+kR4ZATSB6matzDUkYvyu0u0iU
         GYxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z6FMpttr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 128si4817159ybl.412.2021.02.25.01.19.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 01:19:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z6FMpttr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFCnh-0007Pb-1s
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 04:19:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFCjh-0003Hv-7s
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:15:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFCjf-00066k-Go
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:15:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614244502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8CBiTjBBrSUvl7XaxpyhYLNyR7QNYng/yBdBtviVWFo=;
 b=Z6FMpttrDpOSXpchllwOqeob80+/FCJg2MlP+7fvL9EYOQ76WIW95M8HGY9m975YNDvJfq
 4tWe1IllSgCQ+IR3PtRQXsddM05kzOKRvluIi1NBgRGHPvnMsIbM+dayh/aLAWxoQJjMld
 M6mcGv7YO53lWNCoFT55WZOo3VR3AuI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-WXpuI9esPQqQjbXlh6PTUw-1; Thu, 25 Feb 2021 04:15:01 -0500
X-MC-Unique: WXpuI9esPQqQjbXlh6PTUw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D1C080196C;
 Thu, 25 Feb 2021 09:14:59 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-34.ams2.redhat.com [10.36.114.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32B9562467;
 Thu, 25 Feb 2021 09:14:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 peterx@redhat.com, jasowang@redhat.com, pbonzini@redhat.com
Subject: [PATCH v2 3/7] virtio-iommu: Handle non power of 2 range invalidations
Date: Thu, 25 Feb 2021 10:14:31 +0100
Message-Id: <20210225091435.644762-4-eric.auger@redhat.com>
In-Reply-To: <20210225091435.644762-1-eric.auger@redhat.com>
References: <20210225091435.644762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: vivek.gautam@arm.com, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qm2GBW5XvnQw

Unmap notifiers work with an address mask assuming an
invalidation range of a power of 2. Nothing mandates this
in the VIRTIO-IOMMU spec.

So in case the range is not a power of 2, split it into
several invalidations.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
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

