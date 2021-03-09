Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2656952lfg;
        Tue, 9 Mar 2021 02:31:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/ortgtnJM/H8HWHSOLWpN4tmokvKqk9OW9pBTcXqwNP1kvT+7zAsenUxqzRYTe8IXs6kH
X-Received: by 2002:a6b:3bc7:: with SMTP id i190mr22786962ioa.163.1615285891099;
        Tue, 09 Mar 2021 02:31:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615285891; cv=none;
        d=google.com; s=arc-20160816;
        b=PZfOYT5J7QLX5mE0EqZRfraOHuDm1VF3/ZxTftwu8w8avWGVsbToHPaGzufkcoeWqE
         qSwAjUmFn9U6wLeaYzB6KcPgPsAZlkBAkeFKXNYEpARfxZ7ZNtF/XkGlYP/4rqDjPxn2
         NMlIaZpeAhimXbKB+4ASyfEGgiVK1agCYFOZ4h8XLl7YoS1aPuDFswXLOYpZhIaBtmCx
         FUlMbeeysVPHJKbFaUDn5JgLaj6o3HoR3xQTwKwvP1ghDSpnXGtLHoZUWgFnsUbnP6Xh
         vdwHfU9ChsnwNIeVdGDCg7lGJRAzC6bLi8ENdtr5QU/3BRQzxzbhaJgwnjJhzXV+lMCa
         Twiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9EPu02L16Gdl3kagIIT4dIQOQhWVoWWkE9ULTAL5uT8=;
        b=GKSoUMwoVBG7aq8O3gtSXvkoJgjVoiDHNitSoyz2YBCce6k35suc4EsxYTQyb7xBXK
         oSID8xQGIZovK70/yJGzlubPPw6l5YrJy5JBCuD99BMAHHlGeNfhK9zUQlRUHo8vdYc1
         2AQz0wje9gQvYwP+koixswVF8n4l1DxeX/j4fWqUhLvdh0iGT7+UiRM+ijGQ6bWqEXCJ
         qGvGQFXyqLvessBbWoATKnZTNTK+8sJJvrirx8PKfqcThaVGZ3UP3TP3rUjnD0YdwUG+
         Wq78lT9XnTBUjPJUblEJthhNpot4PzDkLODbupIOWIhtaCmeUBjTxAICEoEA1NCIsMat
         k0Aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TCzPzN5I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p4si12730530iog.4.2021.03.09.02.31.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 02:31:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TCzPzN5I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJZeE-0000TO-Dx
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 05:31:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lJZb5-0005H3-Vl
 for qemu-arm@nongnu.org; Tue, 09 Mar 2021 05:28:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lJZb0-0005X9-CQ
 for qemu-arm@nongnu.org; Tue, 09 Mar 2021 05:28:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615285688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9EPu02L16Gdl3kagIIT4dIQOQhWVoWWkE9ULTAL5uT8=;
 b=TCzPzN5INP2r2bg+4F81L2SdSI6uVcpaNhBtISN+wvNu52J4Ad8VtDT4q5GaOVL34l9Cvv
 koX3Tbxz78yzRH2dFJeswhxkgZlVI2uH3QdwaD6xR+wZOAmfF3rZ8BWqBBDUx/+4WZ8W61
 Rf0X9aeXNU/Q9PK+gv90bez+aABtZKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-ozddP6hMPhiwHCHh72BAoQ-1; Tue, 09 Mar 2021 05:28:06 -0500
X-MC-Unique: ozddP6hMPhiwHCHh72BAoQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BA45E74F;
 Tue,  9 Mar 2021 10:28:05 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-254.ams2.redhat.com [10.36.112.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 886AC1A262;
 Tue,  9 Mar 2021 10:28:02 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 jean-philippe@linaro.org, peterx@redhat.com, jasowang@redhat.com,
 pbonzini@redhat.com
Subject: [PATCH v3 2/7] dma: Introduce dma_aligned_pow2_mask()
Date: Tue,  9 Mar 2021 11:27:37 +0100
Message-Id: <20210309102742.30442-3-eric.auger@redhat.com>
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
X-TUID: k/KvvRNYYsNv

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

v2 -> v3:
- Added doc-comment as suggested by Peter Xu and Peter Maydell
---
 hw/i386/intel_iommu.c | 30 +++++++-----------------------
 include/sysemu/dma.h  | 12 ++++++++++++
 softmmu/dma-helpers.c | 26 ++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 23 deletions(-)

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
index a052f7bca3..3201e7901d 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -296,4 +296,16 @@ uint64_t dma_buf_write(uint8_t *ptr, int32_t len, QEMUSGList *sg);
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
                     QEMUSGList *sg, enum BlockAcctType type);
 
+/**
+ * dma_aligned_pow2_mask: Return the address bit mask of the largest
+ * power of 2 size less or equal than @end - @start + 1, aligned with @start,
+ * and bounded by 1 << @max_addr_bits bits.
+ *
+ * @start: range start address
+ * @end: range end address (greater than @start)
+ * @max_addr_bits: max address bits (<= 64)
+ */
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

