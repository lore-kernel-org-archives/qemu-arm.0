Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5187023lfb;
        Wed, 9 Dec 2020 10:26:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzm4pSTou300dvahSBVV0P5czdg8KGuK4EBokcBQzenx+w4/f37KFM0m2DIWo2I3mzSzFTI
X-Received: by 2002:a5b:f4e:: with SMTP id y14mr5235477ybr.515.1607538384943;
        Wed, 09 Dec 2020 10:26:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607538384; cv=none;
        d=google.com; s=arc-20160816;
        b=tiyRu7JSrsHrwbLAtrPOdS0ydFZI9uyEsTuvQ3uH2wEFo/Ci4MNSODfIDYnv9KesBQ
         c6UzpAhb/lZZ5vzfLy0aSYkQU/92kCTQvpT0suYI/pT3ZZnIEXTAoeNGszPjQdtyL18E
         Yxc4NUgLbGnHo0mdnrjB4GJ8T/KYh5DySuUxh55UZRzPyR8Tr40G3t126fBNEUjMetup
         /D6rn2B4ctAuGUHf2+sSxgxPO+p3Wo2Z9tqIaaa93slR28RdT+Kstwd3ehIuXXM/LyQh
         zmV7+USBTPbvM9OCDWDOaEEcH+VZPxPMYh1pw8//r1w40nGYQdU5A+MIxIyDHdyReBw6
         lDNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=kU8LLfrD++DTckVdz92f3StgJjIwiPAzY3tPlKdDYNE=;
        b=bx4FNKwf+ULi0FwAsasNuXQ2excil+q3AmAJvpi0V92pVVQXNAGo0EXhtOb3BjLrSd
         tFBc52I1nuDRAkYHP6suu0Uv+SUGKcMpML1E+PIt/6jF6/oBFri88E1mqrr0eXS9+7O1
         ZcAl86jDjSscuQmYROLrtwXPEqsoQ2bnYA/yfSlYcSP/XsdrvsldMr3QR8y2pjN/w5SX
         JjOAzJ+uktdHhLYnLt0ewnnO6L5LXQlpaj6llFMgjVzTY+McMb50ipDO2aCCs718F7zu
         g3lXf/6cEITvVdzvmXbjUttl3yhf6ENRdmn75ZQ178FFgUaozVmAsaZUxDRgWy/dlDqS
         s9pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=W+IdtHoY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si2352294ybo.429.2020.12.09.10.26.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Dec 2020 10:26:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=W+IdtHoY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kn4AS-0000R7-4x
	for alex.bennee@linaro.org; Wed, 09 Dec 2020 13:26:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3rP-0000yY-Md
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:06:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3rK-0007ZB-7s
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:06:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kU8LLfrD++DTckVdz92f3StgJjIwiPAzY3tPlKdDYNE=;
 b=W+IdtHoYw3IVcqA36bKeVYNXgImIwnC6hdlutmUev0LqL/K0wnREaSzpYCeal9GrE5YKIX
 B+g1MSoQeyiQhho5zWxXIXifiEYfTfb9OoqcZBqkQUTlv6K10CC+EMbElbIYDCrawGHtus
 mKWQNuydMUDapfnPIQ8CFlR6fbqr4XE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-XUcdUSSTPIOwF8l9GVd1Eg-1; Wed, 09 Dec 2020 13:06:35 -0500
X-MC-Unique: XUcdUSSTPIOwF8l9GVd1Eg-1
Received: by mail-wr1-f71.google.com with SMTP id v1so945566wri.16
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:06:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kU8LLfrD++DTckVdz92f3StgJjIwiPAzY3tPlKdDYNE=;
 b=H4KKipsR1w43x9/k2Bwfz2G5cCGUHohvLLHanW87YgoEabye9VtRfKDOaZCB+yLKBA
 e0GUqsCXx8PPTODQO51/p82md5y9qtK5J7qR38DMgTME3WQd4SIJlML5Ybm64+bpztgC
 t0plgf+PrnpJIV7ddiVokPDk+dIz36fq1iG/290BF66SmuaArzvdbWHDCQRsF0Ij9VmI
 o3DzgozBbd18zuDD9i+7Ti8pB9cGcRwjV/3ihZwofMY/jgrzEExEOWwIqAnpAGIIyEdO
 zSPVttj1WARQQDwx16Olme6LTO+M16sbW1BfBx+nxccymMqM0pSE3ZZtuupwpmoFia/s
 b6mg==
X-Gm-Message-State: AOAM533e7oTchOx0Bgn5ENuzfKrft9MyHs6WdTac+kOEJoJKtH+XQSaD
 o5pCspgroxTfS0dm3H2v0z3107NQB6mz+WeT3Ll3o6UoDtIx1xnTaglGiMRipsOzuKcWaXydE0u
 JzgOXPouGgdMJJkaOjRxiQVSkpLxcBqmwuu1o9o52r1J2eAlNAGnycUF9b5/L
X-Received: by 2002:a5d:6902:: with SMTP id t2mr4028121wru.214.1607537193841; 
 Wed, 09 Dec 2020 10:06:33 -0800 (PST)
X-Received: by 2002:a5d:6902:: with SMTP id t2mr4028079wru.214.1607537193531; 
 Wed, 09 Dec 2020 10:06:33 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id z140sm4904443wmc.30.2020.12.09.10.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:06:32 -0800 (PST)
Date: Wed, 9 Dec 2020 13:06:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 02/65] memory: Rename memory_region_notify_one to
 memory_region_notify_iommu_one
Message-ID: <20201209180546.721296-3-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WVNG0CI2lIS3

From: Eugenio Pérez <eperezma@redhat.com>

Previous name didn't reflect the iommu operation.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20201116165506.31315-2-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/exec/memory.h | 6 +++---
 hw/arm/smmu-common.c  | 2 +-
 hw/arm/smmuv3.c       | 2 +-
 hw/i386/intel_iommu.c | 4 ++--
 softmmu/memory.c      | 6 +++---
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 0f3e6bcd5e..d8456ccf52 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -236,7 +236,7 @@ enum IOMMUMemoryRegionAttr {
  * The IOMMU implementation must use the IOMMU notifier infrastructure
  * to report whenever mappings are changed, by calling
  * memory_region_notify_iommu() (or, if necessary, by calling
- * memory_region_notify_one() for each registered notifier).
+ * memory_region_notify_iommu_one() for each registered notifier).
  *
  * Conceptually an IOMMU provides a mapping from input address
  * to an output TLB entry. If the IOMMU is aware of memory transaction
@@ -1346,7 +1346,7 @@ void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
                                 IOMMUTLBEntry entry);
 
 /**
- * memory_region_notify_one: notify a change in an IOMMU translation
+ * memory_region_notify_iommu_one: notify a change in an IOMMU translation
  *                           entry to a single notifier
  *
  * This works just like memory_region_notify_iommu(), but it only
@@ -1357,7 +1357,7 @@ void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
  *         replaces all old entries for the same virtual I/O address range.
  *         Deleted entries have .@perm == 0.
  */
-void memory_region_notify_one(IOMMUNotifier *notifier,
+void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
                               IOMMUTLBEntry *entry);
 
 /**
diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 3838db1395..88d2c454f0 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -472,7 +472,7 @@ static void smmu_unmap_notifier_range(IOMMUNotifier *n)
     entry.perm = IOMMU_NONE;
     entry.addr_mask = n->end - n->start;
 
-    memory_region_notify_one(n, &entry);
+    memory_region_notify_iommu_one(n, &entry);
 }
 
 /* Unmap all notifiers attached to @mr */
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 22607c3784..273f5f7dce 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -828,7 +828,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
     entry.addr_mask = num_pages * (1 << granule) - 1;
     entry.perm = IOMMU_NONE;
 
-    memory_region_notify_one(n, &entry);
+    memory_region_notify_iommu_one(n, &entry);
 }
 
 /* invalidate an asid/iova range tuple in all mr's */
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 70ac837733..067593b9e4 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3497,7 +3497,7 @@ static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
         /* This field is meaningless for unmap */
         entry.translated_addr = 0;
 
-        memory_region_notify_one(n, &entry);
+        memory_region_notify_iommu_one(n, &entry);
 
         start += mask;
         remain -= mask;
@@ -3535,7 +3535,7 @@ static void vtd_address_space_refresh_all(IntelIOMMUState *s)
 
 static int vtd_replay_hook(IOMMUTLBEntry *entry, void *private)
 {
-    memory_region_notify_one((IOMMUNotifier *)private, entry);
+    memory_region_notify_iommu_one((IOMMUNotifier *)private, entry);
     return 0;
 }
 
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 11ca94d037..44de610c72 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1942,8 +1942,8 @@ void memory_region_unregister_iommu_notifier(MemoryRegion *mr,
     memory_region_update_iommu_notify_flags(iommu_mr, NULL);
 }
 
-void memory_region_notify_one(IOMMUNotifier *notifier,
-                              IOMMUTLBEntry *entry)
+void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
+                                    IOMMUTLBEntry *entry)
 {
     IOMMUNotifierFlag request_flags;
     hwaddr entry_end = entry->iova + entry->addr_mask;
@@ -1979,7 +1979,7 @@ void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
 
     IOMMU_NOTIFIER_FOREACH(iommu_notifier, iommu_mr) {
         if (iommu_notifier->iommu_idx == iommu_idx) {
-            memory_region_notify_one(iommu_notifier, &entry);
+            memory_region_notify_iommu_one(iommu_notifier, &entry);
         }
     }
 }
-- 
MST

