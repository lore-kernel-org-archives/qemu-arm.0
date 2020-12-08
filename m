Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4302587lfb;
        Tue, 8 Dec 2020 11:39:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkbMD7Itz2267biYKwyBTHGIg1IMI68D4iiRvV49kWQem3HiuYQHZyGifmTipNkOKyJgqu
X-Received: by 2002:a25:d2c5:: with SMTP id j188mr32988369ybg.485.1607456349326;
        Tue, 08 Dec 2020 11:39:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607456349; cv=none;
        d=google.com; s=arc-20160816;
        b=fzeh0BC37J/RlKlHKfVciv6BZO2QeuyX5hJXpVDWujSI1BA+G5CBwzKpQyMrs6VBn1
         /NhoEyjtWGqO8SN9Gl2RrQOmm7VOlevDAefLm3yPecZDi8XIh55ykbNPYc0McqzMc1ns
         KxSD4eNK/3YCEXKBxiRjyZ3v6GZOPTcDvKrnHVgiPgSx6PP3xxP2edFwtRr5oFY4i0OG
         sFZvGEbLGSsgsmnYg1Ekjwxutr8UDZjWmAokQo1UmFMrGcK1MmtcnXRe62sZqpPcwkdN
         LVBQWMPUh7leh/7VyjuhBBsPz/y+qkCMORS+eMGHb4tI4Pi+Yecrntk9zZIlw3yAw85r
         101A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=kU8LLfrD++DTckVdz92f3StgJjIwiPAzY3tPlKdDYNE=;
        b=mR/eD8ZA2Cy4oCvbtKK6grhv5dhpBbR07K8Dk/sfgYm20HnGEO2WsUA6jIQVL6adAc
         rshKhCNxf3c81VdIH2vp9g5tlxhA3IFUtRX171mvIl7ClMLDsXCDnUIFCmV3DQARTR/q
         y9SEt/TnqUtFZC3Fkqo0KOBSvSpcIYfNWHsQWubhrc0F+CuCAaNd60iXdyXrNnfHn2P/
         l9i/Zrxgd46oDTj3vgAkhsO//QSEiBXVW375QLbqLMPpgWIdB9lScvwXroBfvJhHgqVj
         oGkSpLn0RDjIyQiJOBPyCS+/eNGNQfilzTSSW2J5UBTELEUUOx1EFB96vBfhyV5uf5SO
         ZWdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UpJnSu93;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a67si14931108ybg.316.2020.12.08.11.39.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 11:39:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UpJnSu93;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmipI-0000Xd-Mb
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 14:39:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmikK-0004l7-Li
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 14:34:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmikF-0004eu-KO
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 14:34:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kU8LLfrD++DTckVdz92f3StgJjIwiPAzY3tPlKdDYNE=;
 b=UpJnSu93PtSJwNpTVX+Hl0eLfxBeVpyaEMtXT8EtlDy31JkD/oZ+jyuw1BKfjjP/nsnvKi
 KHqymr5Nlcpx2FlHotrXEOI49D+7jYyRx4pqfr9vVqWLaNlsEkJRXls06bvcFnHO5IUUr6
 NJ4cZ5jaJ1NjerZBvdsw9D1Q6iUGRco=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-M5LXil7fNKmfY1AYE3Hf5A-1; Tue, 08 Dec 2020 14:33:46 -0500
X-MC-Unique: M5LXil7fNKmfY1AYE3Hf5A-1
Received: by mail-wr1-f71.google.com with SMTP id y5so2615477wrs.15
 for <qemu-arm@nongnu.org>; Tue, 08 Dec 2020 11:33:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kU8LLfrD++DTckVdz92f3StgJjIwiPAzY3tPlKdDYNE=;
 b=Rr6zu6KQrq2Kc5eVBcIT7TFG/RW4CatEzVJ1sbOjOtSH8addPpZlQ2Fee0gPo0rBT0
 HbtTcjgxNDWIF9xsm740uuL5mI5aleSDDg9rhxTQ293n4hMzt0GpovVIhycePSJ9mp9a
 CShDS9/A2PnFx8sOfMHxJIdD/u/f74rrst0SXXhCA8jBniErFHEbXXKsdW60OvO+jgaD
 UgLuHHfbMrGZle/b+3jSsxYwEnTS116mJCDdZgpLIxQl4G505QuCMyUUBZX3tvu7j22/
 n2QKD+ylrL4QAaodHOjenba34+UMRSQx5qeb1q9x6eDtV5dAMAnn8iaZmquSqYQzVxVp
 yaMw==
X-Gm-Message-State: AOAM531eBYub49eU9BEWe9xrVr9oFCyj5z5VpAO43SFfcNWU7eA+63Pu
 9sistAbo3NDpnl+UZZ4yCelpe2sL4J+8ICmTZJrA9CyvkgfhrSJ2sqvDmWb5MVd47hxn20uhIWd
 nN5oOgCQAPM5u
X-Received: by 2002:a1c:e901:: with SMTP id q1mr5280502wmc.148.1607456024663; 
 Tue, 08 Dec 2020 11:33:44 -0800 (PST)
X-Received: by 2002:a1c:e901:: with SMTP id q1mr5280482wmc.148.1607456024465; 
 Tue, 08 Dec 2020 11:33:44 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id z13sm6379449wmz.3.2020.12.08.11.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:33:43 -0800 (PST)
Date: Tue, 8 Dec 2020 14:33:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/66] memory: Rename memory_region_notify_one to
 memory_region_notify_iommu_one
Message-ID: <20201208193307.646726-3-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QTtc2AXENwWo

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

