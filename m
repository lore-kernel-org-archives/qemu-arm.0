Received: by 2002:a0c:dd89:0:0:0:0:0 with SMTP id v9csp4536514qvk;
        Mon, 16 Nov 2020 05:23:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKB/OOI8PM34jC/7mfujNRwwR4PnabGmQq9CBJZWKhEpF9wEQtIKckCTLrNXKwJ4tt5Ctq
X-Received: by 2002:ac8:5196:: with SMTP id c22mr14006412qtn.387.1605532985162;
        Mon, 16 Nov 2020 05:23:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605532985; cv=none;
        d=google.com; s=arc-20160816;
        b=eNNv6nPI6VyXJNhthRqBgFJS3DSKuGf5lij6F3XCaDnDrRTkjU3thMBl69zPSfV8tV
         FPWpxmj/OqQsZpk6gyqIq1Q9ZBmb+EYNz9Xnra+5WYeuQhbm21xifFJfVABIi4OefP4D
         sejvjRyR9La5dGn4U6q2YCE1X4mYIsu0mUEkS9t2eTJ81O4UR11ViL3n4fgmY89NRqvU
         4/6e6layVNxqapHKeXazGECqUgoa8A331ePBfR+DlCDzejzCl3AYYQc58LRx/UQuzn7l
         50AOGV5fYVMXVY5Sb/CiqNqWK1L+zMrAn+zzmRDTHKsQkb/pew6wOxMpWbVWF2RGao0R
         lkXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:message-id:date:subject:to:from;
        bh=h3XLLPvWcGl956mSJa1QBMNWmZmgkoiq4tF4BhFbcpg=;
        b=a989LWShUygNP2UKM2g1AeoiUxQR5xeZk9lG4OjAtwkALEuiUC6L1I0SlqQ/x2EdQW
         LwU/ISWvaqhwJsezsRyL8AKXPuA3tGZwcZbmeokDUr2QkNfAMcPIdDubArnuE/E+VKLJ
         Z9FMap3dUp9ea/PN97PYLnFDC37/c2kdNrf2sS1M02x5HLq/q2+/GhgeSMdGKds3gMAl
         kjLbparZpisY4GEpvhNPz74rlYSWztaJoFOqGuarMxgq/cdXZUoQgMYo32J/9YWv66IJ
         sOXRGnSLoj4aolOTEWoT/ffndZHcy6e5g5BS4L5O0Zfuq8hpuDi39XZPW5gKHkXdNIjB
         BZXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id r7si10630718qvh.119.2020.11.16.05.23.04;
        Mon, 16 Nov 2020 05:23:05 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id ABAF04C1C3;
	Mon, 16 Nov 2020 08:23:04 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.501
X-Spam-Level: 
X-Spam-Status: No, score=-1.501 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N9hiQ1DVRifZ; Mon, 16 Nov 2020 08:23:03 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id A86674C186;
	Mon, 16 Nov 2020 08:23:03 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id A42884C181
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Nov 2020 08:23:02 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nogAoT24kvHG for <kvmarm@lists.cs.columbia.edu>;
 Mon, 16 Nov 2020 08:23:01 -0500 (EST)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 0BAF54C169
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Nov 2020 08:23:01 -0500 (EST)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CZV9q2p8VzkWWG;
 Mon, 16 Nov 2020 21:22:39 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.185.179) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Mon, 16 Nov 2020 21:22:49 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <qemu-devel@nongnu.org>, <pbonzini@redhat.com>
Subject: [PATCH] memory: Skip dirty tracking for un-migratable memory regions
Date: Mon, 16 Nov 2020 21:22:10 +0800
Message-ID: <20201116132210.1730-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Cc: cohuck@redhat.com, kwankhede@nvidia.com, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: IeARCDeYY4r5

It makes no sense to track dirty pages for those un-migratable memory
regions (e.g., Memory BAR region of the VFIO PCI device) and doing so
will potentially lead to some unpleasant issues during migration [1].

Skip dirty tracking for those regions by evaluating if the region is
migratable before setting dirty_log_mask (DIRTY_MEMORY_MIGRATION).

[1] https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg03757.html

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 softmmu/memory.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 71951fe4dc..aa393f1bb0 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1806,7 +1806,10 @@ bool memory_region_is_ram_device(MemoryRegion *mr)
 uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)
 {
     uint8_t mask = mr->dirty_log_mask;
-    if (global_dirty_log && (mr->ram_block || memory_region_is_iommu(mr))) {
+    RAMBlock *rb = mr->ram_block;
+
+    if (global_dirty_log && ((rb && qemu_ram_is_migratable(rb)) ||
+                             memory_region_is_iommu(mr))) {
         mask |= (1 << DIRTY_MEMORY_MIGRATION);
     }
     return mask;
-- 
2.19.1

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
