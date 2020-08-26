Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp813800lfc;
        Wed, 26 Aug 2020 07:37:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4twfhPDX1LNylf6ila/P4ky0a81YNh7zJEzseoOD/BzPJKzArRV3cDpRrCMqi+CeXlOb2
X-Received: by 2002:a25:2b89:: with SMTP id r131mr21628018ybr.131.1598452676042;
        Wed, 26 Aug 2020 07:37:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598452676; cv=none;
        d=google.com; s=arc-20160816;
        b=mQm+BB/yuhk2AQQHqYXnS+iVDVZBDvzAOQmGlqp62RaXL2PHM28cKGl7Y16Nq/y7M9
         HyAWWE0VpRd2DG7SnmftBCl83VnT1r9zPoUPis/tLUqDDs8UhSkbBNBXr4uCG37A+rj+
         pxEJ9uyMj75aSuiRyuXmM3xMA2vdlSDoRQl9uP1QMFovYVuzWsJCcHca3H3rn7V7IjEV
         qvYPHCgz2rqydu6mzzGsEtjswy3yB7PlbQWHDTiURQhBRzqjZNqp2d8m4BcxPonBoA/h
         lYqjyaWtwT/i+Qrhmo3+vCkU+dNXKwTbBczY26Tz+5vV8oT3lMfBl7CqDl4c55ukxWdd
         j6Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cS+si9eh1bRTLeHNZhyjHNcMnCNz1d8mrD3qWaIpIXM=;
        b=G9CzYBCcrE6Nwy6l8Rh6vkSPLFRTTLKErelrHlto9GA8G8BUIXmsWXDB7Tcx+AZyVe
         DSutHPctf4Lhg1fOyHnMpFm6WtS/UZ1a1mrHIh0X4r7LiQ/jq0jkNHDV6chTJ7P52PLE
         pIk/kzeMlmnU5n6jOG0ZKbZEh0/psMpLj1jL1cNBVmZ+hk2CrFAPuV2p6y7vQksHZqLK
         6aQE3MTmgnGuRXPdWzTfC4fkEIHT/TEGGLLpaVuepHv4VaCemupCmqQ0ejBjVXO6xrKq
         bNrY+l9K9MueMCbx7tWORFSgjYIYe3ZRbnomRklpvBJaOI/GtbRYnMPBnNBAMtfyVc0z
         MHyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NV67c+cv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k37si3151272ybj.178.2020.08.26.07.37.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 07:37:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NV67c+cv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAwYl-0004sz-At
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 10:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kAwYU-0004p3-Ok
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 10:37:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kAwYR-0006CN-PT
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 10:37:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598452654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cS+si9eh1bRTLeHNZhyjHNcMnCNz1d8mrD3qWaIpIXM=;
 b=NV67c+cvUOLHgtvjXw1d5zHwstFWhoeK9yzJHaCQ8SndQ/M25RRkhie2HkRS1pZf0DBCOb
 cAOYjxKp/G5uVuhftxDVWYRaI8A3g/8CfWEHeuF6r0IyW/DMtflqBv1aKH7fqq4UX/FEys
 kdAkvRQcQHhvzvmg6Z7RSweiPFyUqsE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-OvNetzbbO8uKTqRxVT4r6Q-1; Wed, 26 Aug 2020 10:37:29 -0400
X-MC-Unique: OvNetzbbO8uKTqRxVT4r6Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D71D1005E65;
 Wed, 26 Aug 2020 14:37:27 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-115-59.ams2.redhat.com [10.36.115.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B189576E00;
 Wed, 26 Aug 2020 14:37:14 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Xu <peterx@redhat.com>
Subject: [RFC v6 01/13] memory: Rename memory_region_notify_one to
 memory_region_notify_iommu_one
Date: Wed, 26 Aug 2020 16:36:39 +0200
Message-Id: <20200826143651.7915-2-eperezma@redhat.com>
In-Reply-To: <20200826143651.7915-1-eperezma@redhat.com>
References: <20200625191651.5817-1-eperezma@redhat.com>
 <20200826143651.7915-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 23:30:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dT9RYnz9im9v

Previous name didn't reflect the iommu operation.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/arm/smmu-common.c  | 2 +-
 hw/arm/smmuv3.c       | 2 +-
 hw/i386/intel_iommu.c | 4 ++--
 include/exec/memory.h | 6 +++---
 softmmu/memory.c      | 6 +++---
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index e13a5f4a7c..b02ffb8822 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -396,7 +396,7 @@ static void smmu_unmap_notifier_range(IOMMUNotifier *n)
     entry.perm = IOMMU_NONE;
     entry.addr_mask = n->end - n->start;
 
-    memory_region_notify_one(n, &entry);
+    memory_region_notify_iommu_one(n, &entry);
 }
 
 /* Unmap all notifiers attached to @mr */
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 57a79df55b..3bb85ab7e1 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -838,7 +838,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
     entry.addr_mask = (1 << tt->granule_sz) - 1;
     entry.perm = IOMMU_NONE;
 
-    memory_region_notify_one(n, &entry);
+    memory_region_notify_iommu_one(n, &entry);
 }
 
 /* invalidate an asid/iova tuple in all mr's */
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 5284bb68b6..2ad6b9d796 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3498,7 +3498,7 @@ static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
         /* This field is meaningless for unmap */
         entry.translated_addr = 0;
 
-        memory_region_notify_one(n, &entry);
+        memory_region_notify_iommu_one(n, &entry);
 
         start += mask;
         remain -= mask;
@@ -3536,7 +3536,7 @@ static void vtd_address_space_refresh_all(IntelIOMMUState *s)
 
 static int vtd_replay_hook(IOMMUTLBEntry *entry, void *private)
 {
-    memory_region_notify_one((IOMMUNotifier *)private, entry);
+    memory_region_notify_iommu_one((IOMMUNotifier *)private, entry);
     return 0;
 }
 
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 0cfe987ab4..22c5f564d1 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -226,7 +226,7 @@ enum IOMMUMemoryRegionAttr {
  * The IOMMU implementation must use the IOMMU notifier infrastructure
  * to report whenever mappings are changed, by calling
  * memory_region_notify_iommu() (or, if necessary, by calling
- * memory_region_notify_one() for each registered notifier).
+ * memory_region_notify_iommu_one() for each registered notifier).
  *
  * Conceptually an IOMMU provides a mapping from input address
  * to an output TLB entry. If the IOMMU is aware of memory transaction
@@ -1274,7 +1274,7 @@ void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
                                 IOMMUTLBEntry entry);
 
 /**
- * memory_region_notify_one: notify a change in an IOMMU translation
+ * memory_region_notify_iommu_one: notify a change in an IOMMU translation
  *                           entry to a single notifier
  *
  * This works just like memory_region_notify_iommu(), but it only
@@ -1285,7 +1285,7 @@ void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
  *         replaces all old entries for the same virtual I/O address range.
  *         Deleted entries have .@perm == 0.
  */
-void memory_region_notify_one(IOMMUNotifier *notifier,
+void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
                               IOMMUTLBEntry *entry);
 
 /**
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 70b93104e8..961c25b42f 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1890,8 +1890,8 @@ void memory_region_unregister_iommu_notifier(MemoryRegion *mr,
     memory_region_update_iommu_notify_flags(iommu_mr, NULL);
 }
 
-void memory_region_notify_one(IOMMUNotifier *notifier,
-                              IOMMUTLBEntry *entry)
+void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
+                                    IOMMUTLBEntry *entry)
 {
     IOMMUNotifierFlag request_flags;
     hwaddr entry_end = entry->iova + entry->addr_mask;
@@ -1927,7 +1927,7 @@ void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
 
     IOMMU_NOTIFIER_FOREACH(iommu_notifier, iommu_mr) {
         if (iommu_notifier->iommu_idx == iommu_idx) {
-            memory_region_notify_one(iommu_notifier, &entry);
+            memory_region_notify_iommu_one(iommu_notifier, &entry);
         }
     }
 }
-- 
2.18.1

