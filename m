Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp186283lfg;
        Thu, 25 Feb 2021 01:18:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5yjYuUo2vVci2+w+mx2Hd8Z9m/O8CLS1FWNEQdOg0qg1CcAc/jb2IIGo0wJTFSf78Retu
X-Received: by 2002:a92:de0c:: with SMTP id x12mr1714190ilm.62.1614244724922;
        Thu, 25 Feb 2021 01:18:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614244724; cv=none;
        d=google.com; s=arc-20160816;
        b=evcvX/xzmAJu9yDw+Yu4nxZmBH/uDqgd5veUuxHa5qv2ivc9Td23suoqJESRB36rYL
         V0R8dagC32vkOtUvd5PaCG+KquhgIQ6hqMYsxAreVaUCyir9vQ6BFN5SNVpwrq9bJkjr
         FL/yxyHRE5ZH7sJVjjZQmCkvMJVAEQV6b0R9BaO22bWQfG+3RWScFcqESjgypcUme5x1
         XavsFkJo49bWW6Vj+ZLGJU7zFSvkpzrDHW8lpIJsfQ8DeVgPLeunBvGRG16i6HQO0oji
         4p9DtKNzLG1A8TzTyAjKE7wXwtN0S3Q9MzDnv7CQZjHqcpcW59iu4PrpZggsSAoNA5XV
         LFOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QlhJLFza2TC8LpFNbS9wemapCKG9sKwTwXXw925Wq/U=;
        b=urbihspfqBvoxGXJijD5DVglGR+0eO0o/UpNt7dBbhf702DrWoI+LEX24BcaEYbzOX
         zZO3GX2iaLkLM5m0BJ+QtyLNdsm58aBBa9vsfsWH60bxlaDbDwp2MDnmuPp9Dh3u9T9w
         f4sH8qbuRyhbbkeh3rLpdfBlzdiPNu9ccEII6QSVsImNeTfQoat/AdZyzTEN/wMMxGW3
         ciRB0FGMH1temkkAYTQB5z1ChR9KLfxMBCmxVKyLjTuB5woqxnNuv0DWzR2nXRYE9Gp9
         mRF92u2zpmDqKgYCopRLdhdotebid/6ZbvR0ikV0HgmshHVZYj6WCYlXqSBn1ytfoWkC
         vBcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SZS5+XTm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13si3906775ioj.3.2021.02.25.01.18.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 01:18:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SZS5+XTm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFCnC-0006w3-P1
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 04:18:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFCjg-0003Gl-AN
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 04:15:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFCje-00064a-HF
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 04:15:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614244501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QlhJLFza2TC8LpFNbS9wemapCKG9sKwTwXXw925Wq/U=;
 b=SZS5+XTmq4GKZnc+G5XqcwNo9LJ62faPDW2YQBiwnLuU0zsmH4bhiDwHMavTy0tGM2MUjF
 yoqW101fE4A0WLJ8QNv++h9ELBL9nsdkbmv2b4rkkSIV5rliLwxgP8qeMNcWO3i1FG6tV2
 WpzFq0rg6kBsyTLigRZc5Ptlx80ED1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-c9t8RHzxN_SYwN8bJm7BWw-1; Thu, 25 Feb 2021 04:14:58 -0500
X-MC-Unique: c9t8RHzxN_SYwN8bJm7BWw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D181FAFA81;
 Thu, 25 Feb 2021 09:14:56 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-34.ams2.redhat.com [10.36.114.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6877462467;
 Thu, 25 Feb 2021 09:14:54 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 peterx@redhat.com, jasowang@redhat.com, pbonzini@redhat.com
Subject: [PATCH v2 2/7] dma: Introduce dma_aligned_pow2_mask()
Date: Thu, 25 Feb 2021 10:14:30 +0100
Message-Id: <20210225091435.644762-3-eric.auger@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 5z3+uQGDXh9S

Currently get_naturally_aligned_size() is used by the intel iommu
to compute the maximum invalidation range based on @size which is
a power of 2 while being aligned with the @start address and less
than the maximum range defined by @gaw.

This helper is also useful for other iommu devices (virtio-iommu,
SMMUv3) to make sure IOMMU UNMAP notifiers only are called with
power of 2 range sizes.

Let's move this latter into dma-helpers.c and rename it into
dma_aligned_pow2_mask(). Also rewrite the helper so that it
accomodates UINT64_MAX values for the size mask and max mask.
It now returns a mask instead of a size. Change the caller.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/i386/intel_iommu.c | 30 +++++++-----------------------
 include/sysemu/dma.h  |  3 +++
 softmmu/dma-helpers.c | 26 ++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 23 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 3206f379f8..6be8f32918 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -35,6 +35,7 @@
 #include "hw/i386/x86-iommu.h"
 #include "hw/pci-host/q35.h"
 #include "sysemu/kvm.h"
+#include "sysemu/dma.h"
 #include "sysemu/sysemu.h"
 #include "hw/i386/apic_internal.h"
 #include "kvm/kvm_i386.h"
@@ -3455,24 +3456,6 @@ VTDAddressSpace *vtd_find_add_as(IntelIOMMUState *s, PCIBus *bus, int devfn)
     return vtd_dev_as;
 }
 
-static uint64_t get_naturally_aligned_size(uint64_t start,
-                                           uint64_t size, int gaw)
-{
-    uint64_t max_mask = 1ULL << gaw;
-    uint64_t alignment = start ? start & -start : max_mask;
-
-    alignment = MIN(alignment, max_mask);
-    size = MIN(size, max_mask);
-
-    if (alignment <= size) {
-        /* Increase the alignment of start */
-        return alignment;
-    } else {
-        /* Find the largest page mask from size */
-        return 1ULL << (63 - clz64(size));
-    }
-}
-
 /* Unmap the whole range in the notifier's scope. */
 static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
 {
@@ -3501,13 +3484,14 @@ static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
 
     while (remain >= VTD_PAGE_SIZE) {
         IOMMUTLBEvent event;
-        uint64_t mask = get_naturally_aligned_size(start, remain, s->aw_bits);
+        uint64_t mask = dma_aligned_pow2_mask(start, end, s->aw_bits);
+        uint64_t size = mask + 1;
 
-        assert(mask);
+        assert(size);
 
         event.type = IOMMU_NOTIFIER_UNMAP;
         event.entry.iova = start;
-        event.entry.addr_mask = mask - 1;
+        event.entry.addr_mask = mask;
         event.entry.target_as = &address_space_memory;
         event.entry.perm = IOMMU_NONE;
         /* This field is meaningless for unmap */
@@ -3515,8 +3499,8 @@ static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
 
         memory_region_notify_iommu_one(n, &event);
 
-        start += mask;
-        remain -= mask;
+        start += size;
+        remain -= size;
     }
 
     assert(!remain);
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index a052f7bca3..2acb303be2 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -296,4 +296,7 @@ uint64_t dma_buf_write(uint8_t *ptr, int32_t len, QEMUSGList *sg);
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
                     QEMUSGList *sg, enum BlockAcctType type);
 
+uint64_t dma_aligned_pow2_mask(uint64_t start, uint64_t end,
+                               int max_addr_bits);
+
 #endif
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 29001b5459..7d766a5e89 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -330,3 +330,29 @@ void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
 {
     block_acct_start(blk_get_stats(blk), cookie, sg->size, type);
 }
+
+uint64_t dma_aligned_pow2_mask(uint64_t start, uint64_t end, int max_addr_bits)
+{
+    uint64_t max_mask = UINT64_MAX, addr_mask = end - start;
+    uint64_t alignment_mask, size_mask;
+
+    if (max_addr_bits != 64) {
+        max_mask = (1ULL << max_addr_bits) - 1;
+    }
+
+    alignment_mask = start ? (start & -start) - 1 : max_mask;
+    alignment_mask = MIN(alignment_mask, max_mask);
+    size_mask = MIN(addr_mask, max_mask);
+
+    if (alignment_mask <= size_mask) {
+        /* Increase the alignment of start */
+        return alignment_mask;
+    } else {
+        /* Find the largest page mask from size */
+        if (addr_mask == UINT64_MAX) {
+            return UINT64_MAX;
+        }
+        return (1ULL << (63 - clz64(addr_mask + 1))) - 1;
+    }
+}
+
-- 
2.26.2

