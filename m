Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2859962wrd;
        Fri, 21 Sep 2018 01:28:48 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZBWmAD8H/DDyHKKir1OXnDGgzXnZ0AGvOEuhAsP/uPWNs7wfYjKENvTzm+AoKk80O7YVUm
X-Received: by 2002:a37:a54f:: with SMTP id o76-v6mr21576930qke.125.1537518528546;
        Fri, 21 Sep 2018 01:28:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537518528; cv=none;
        d=google.com; s=arc-20160816;
        b=HT+ybD7qOHX5T17c5T3KngZyKoESukn78prGTQxn1LYOLFOR8z5LcoCz4oBFqqaAqu
         ecSaHOsIngr4jj6EppnnFHRDKRR3EehllT3XD3cWm1t8aYTyDNnnEv0NspnMcsjbvkcr
         gtlPI2AhhHqy9rIPueJPcI4+Qav5AXiwA8c5ayZbGrs5GvI2GvC5MmC6+2GOGee/AcEN
         ZK4rZ3+1q6HH0Sdprd0Nk8+HaRic0T86/WXPCXa3q39KrgcnUpI6l+Jt/fPlAcRws4eq
         rNtBxZ8r3EIk+7BSOgCR/U6QcBEH3ubKbw95VwKDFiQgiXGUHPqPDVJsO54KTmsl9j37
         dg6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=KxLsCUxSKD7kt8pgBiYblP6p1K6IqS+zIhQCV5kpeig=;
        b=fRNR9UsStf2bSeh6x8mYJGn+Ji8I1wv6QOix6hBdEKJDnlGXqrpjn3UAke+ObqrcYr
         BSLkicj37hCeL+1j0g0/0PZydy2//4kg9L92XlREPyHMXgcIzJOTwgBuwKRmJFsZkgsR
         17+lvNwk2FS0H5BSLHysdDtQrh5aO9EKwS8hAk9bghmbHsMSw7j4PHVdPuacZMvWBwTF
         onNl+CctPF+WL1Ec1jx5eZn7bsbopb5ckwypYRAFqN+2u5v57fsQ+l4G0/gDBKiPmELN
         6vHM3v6eGA1HUxB5cucMxVYu8gGOEzG0mqaLWjCThGfuHT43WljZd5kuMIYzNHa9jzSU
         tj4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d1-v6si1445054qtl.321.2018.09.21.01.28.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:28:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54407 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3Gnw-0004t6-1m
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:28:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3GfK-0004Mt-2m
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:19:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3GfI-000432-NB
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:19:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50118)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3GfI-00041s-Ep; Fri, 21 Sep 2018 04:19:52 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B8E4C20A9B;
	Fri, 21 Sep 2018 08:19:51 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 734A07D665;
	Fri, 21 Sep 2018 08:19:49 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:18:01 +0200
Message-Id: <20180921081819.9203-11-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 21 Sep 2018 08:19:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 10/28] memory: rename memory_region notify_iommu,
 notify_one
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xSV4LvoSm+Oz

Le's rename those notification functions to clearly discriminate
iotlb notifications from looming config notifications.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmu-common.c     |  2 +-
 hw/arm/smmuv3.c          |  2 +-
 hw/i386/intel_iommu.c    | 10 +++++-----
 hw/misc/tz-mpc.c         |  8 ++++----
 hw/ppc/spapr_iommu.c     |  2 +-
 hw/s390x/s390-pci-inst.c |  4 ++--
 include/exec/memory.h    | 20 ++++++++++----------
 memory.c                 | 12 ++++++------
 8 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index ad6ef2135b..70b014e618 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -395,7 +395,7 @@ static void smmu_unmap_notifier_range(IOMMUNotifier *n)
     entry.perm = IOMMU_NONE;
     entry.addr_mask = n->iotlb_notifier.end - n->iotlb_notifier.start;
 
-    memory_region_notify_one(n, &entry);
+    memory_region_iotlb_notify_one(n, &entry);
 }
 
 /* Unmap all notifiers attached to @mr */
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index d6895071a5..b8c41916aa 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -822,7 +822,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
     entry.addr_mask = (1 << tt->granule_sz) - 1;
     entry.perm = IOMMU_NONE;
 
-    memory_region_notify_one(n, &entry);
+    memory_region_iotlb_notify_one(n, &entry);
 }
 
 /* invalidate an asid/iova tuple in all mr's */
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 0dbd9512f2..dfd3cae054 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1031,7 +1031,7 @@ static int vtd_dev_to_context_entry(IntelIOMMUState *s, uint8_t bus_num,
 static int vtd_sync_shadow_page_hook(IOMMUTLBEntry *entry,
                                      void *private)
 {
-    memory_region_notify_iommu((IOMMUMemoryRegion *)private, 0, *entry);
+    memory_region_iotlb_notify_iommu((IOMMUMemoryRegion *)private, 0, *entry);
     return 0;
 }
 
@@ -1592,7 +1592,7 @@ static void vtd_iotlb_page_invalidate_notify(IntelIOMMUState *s,
                     .addr_mask = size - 1,
                     .perm = IOMMU_NONE,
                 };
-                memory_region_notify_iommu(&vtd_as->iommu, 0, entry);
+                memory_region_iotlb_notify_iommu(&vtd_as->iommu, 0, entry);
             }
         }
     }
@@ -2031,7 +2031,7 @@ static bool vtd_process_device_iotlb_desc(IntelIOMMUState *s,
     entry.iova = addr;
     entry.perm = IOMMU_NONE;
     entry.translated_addr = 0;
-    memory_region_notify_iommu(&vtd_dev_as->iommu, 0, entry);
+    memory_region_iotlb_notify_iommu(&vtd_dev_as->iommu, 0, entry);
 
 done:
     return true;
@@ -3036,7 +3036,7 @@ static void vtd_address_space_unmap(VTDAddressSpace *as, IOMMUNotifier *n)
     map.size = entry.addr_mask;
     iova_tree_remove(as->iova_tree, &map);
 
-    memory_region_notify_one(n, &entry);
+    memory_region_iotlb_notify_one(n, &entry);
 }
 
 static void vtd_address_space_unmap_all(IntelIOMMUState *s)
@@ -3053,7 +3053,7 @@ static void vtd_address_space_unmap_all(IntelIOMMUState *s)
 
 static int vtd_replay_hook(IOMMUTLBEntry *entry, void *private)
 {
-    memory_region_notify_one((IOMMUNotifier *)private, entry);
+    memory_region_iotlb_notify_one((IOMMUNotifier *)private, entry);
     return 0;
 }
 
diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c
index e0c58ba37e..a585e7b475 100644
--- a/hw/misc/tz-mpc.c
+++ b/hw/misc/tz-mpc.c
@@ -100,8 +100,8 @@ static void tz_mpc_iommu_notify(TZMPC *s, uint32_t lutidx,
         entry.translated_addr = addr;
 
         entry.perm = IOMMU_NONE;
-        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_S, entry);
-        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_NS, entry);
+        memory_region_iotlb_notify_iommu(&s->upstream, IOMMU_IDX_S, entry);
+        memory_region_iotlb_notify_iommu(&s->upstream, IOMMU_IDX_NS, entry);
 
         entry.perm = IOMMU_RW;
         if (block_is_ns) {
@@ -109,13 +109,13 @@ static void tz_mpc_iommu_notify(TZMPC *s, uint32_t lutidx,
         } else {
             entry.target_as = &s->downstream_as;
         }
-        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_S, entry);
+        memory_region_iotlb_notify_iommu(&s->upstream, IOMMU_IDX_S, entry);
         if (block_is_ns) {
             entry.target_as = &s->downstream_as;
         } else {
             entry.target_as = &s->blocked_io_as;
         }
-        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_NS, entry);
+        memory_region_iotlb_notify_iommu(&s->upstream, IOMMU_IDX_NS, entry);
     }
 }
 
diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
index 1b0880ac9e..680fb6ad24 100644
--- a/hw/ppc/spapr_iommu.c
+++ b/hw/ppc/spapr_iommu.c
@@ -429,7 +429,7 @@ static target_ulong put_tce_emu(sPAPRTCETable *tcet, target_ulong ioba,
     entry.translated_addr = tce & page_mask;
     entry.addr_mask = ~page_mask;
     entry.perm = spapr_tce_iommu_access_flags(tce);
-    memory_region_notify_iommu(&tcet->iommu, 0, entry);
+    memory_region_iotlb_notify_iommu(&tcet->iommu, 0, entry);
 
     return H_SUCCESS;
 }
diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 7b61367ee3..a5ad72d19c 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -589,7 +589,7 @@ static void s390_pci_update_iotlb(S390PCIIOMMU *iommu, S390IOTLBEntry *entry)
             }
 
             notify.perm = IOMMU_NONE;
-            memory_region_notify_iommu(&iommu->iommu_mr, 0, notify);
+            memory_region_iotlb_notify_iommu(&iommu->iommu_mr, 0, notify);
             notify.perm = entry->perm;
         }
 
@@ -601,7 +601,7 @@ static void s390_pci_update_iotlb(S390PCIIOMMU *iommu, S390IOTLBEntry *entry)
         g_hash_table_replace(iommu->iotlb, &cache->iova, cache);
     }
 
-    memory_region_notify_iommu(&iommu->iommu_mr, 0, notify);
+    memory_region_iotlb_notify_iommu(&iommu->iommu_mr, 0, notify);
 }
 
 int rpcit_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra)
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 31fc859c6b..5ef9bf6d21 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1024,10 +1024,10 @@ static inline IOMMUMemoryRegionClass *memory_region_get_iommu_class_nocheck(
 uint64_t memory_region_iommu_get_min_page_size(IOMMUMemoryRegion *iommu_mr);
 
 /**
- * memory_region_notify_iommu: notify a change in an IOMMU translation entry.
+ * memory_region_iotlb_notify_iommu: notify a change in an IOMMU translation
+ * entry.
  *
  * The notification type will be decided by entry.perm bits:
- *
  * - For UNMAP (cache invalidation) notifies: set entry.perm to IOMMU_NONE.
  * - For MAP (newly added entry) notifies: set entry.perm to the
  *   permission of the page (which is definitely !IOMMU_NONE).
@@ -1041,15 +1041,15 @@ uint64_t memory_region_iommu_get_min_page_size(IOMMUMemoryRegion *iommu_mr);
  *         replaces all old entries for the same virtual I/O address range.
  *         Deleted entries have .@perm == 0.
  */
-void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
-                                int iommu_idx,
-                                IOMMUTLBEntry entry);
+void memory_region_iotlb_notify_iommu(IOMMUMemoryRegion *iommu_mr,
+                                      int iommu_idx,
+                                      IOMMUTLBEntry entry);
 
 /**
- * memory_region_notify_one: notify a change in an IOMMU translation
- *                           entry to a single notifier
+ * memory_region_iotlb_notify_one: notify a change in an IOMMU translation
+ *                                 entry to a single notifier
  *
- * This works just like memory_region_notify_iommu(), but it only
+ * This works just like memory_region_iotlb_notify_iommu(), but it only
  * notifies a specific notifier, not all of them.
  *
  * @notifier: the notifier to be notified
@@ -1057,8 +1057,8 @@ void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
  *         replaces all old entries for the same virtual I/O address range.
  *         Deleted entries have .@perm == 0.
  */
-void memory_region_notify_one(IOMMUNotifier *notifier,
-                              IOMMUTLBEntry *entry);
+void memory_region_iotlb_notify_one(IOMMUNotifier *notifier,
+                                    IOMMUTLBEntry *entry);
 
 /**
  * memory_region_register_iommu_notifier: register a notifier for changes to
diff --git a/memory.c b/memory.c
index b7e2e43b68..8ee5cbdbad 100644
--- a/memory.c
+++ b/memory.c
@@ -1870,8 +1870,8 @@ void memory_region_unregister_iommu_notifier(MemoryRegion *mr,
     memory_region_update_iommu_notify_flags(iommu_mr);
 }
 
-void memory_region_notify_one(IOMMUNotifier *notifier,
-                              IOMMUTLBEntry *entry)
+void memory_region_iotlb_notify_one(IOMMUNotifier *notifier,
+                                    IOMMUTLBEntry *entry)
 {
     IOMMUNotifierFlag request_flags;
 
@@ -1895,9 +1895,9 @@ void memory_region_notify_one(IOMMUNotifier *notifier,
     }
 }
 
-void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
-                                int iommu_idx,
-                                IOMMUTLBEntry entry)
+void memory_region_iotlb_notify_iommu(IOMMUMemoryRegion *iommu_mr,
+                                      int iommu_idx,
+                                      IOMMUTLBEntry entry)
 {
     IOMMUNotifier *iommu_notifier;
 
@@ -1905,7 +1905,7 @@ void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
 
     IOMMU_NOTIFIER_FOREACH(iommu_notifier, iommu_mr) {
         if (iommu_notifier->iommu_idx == iommu_idx) {
-            memory_region_notify_one(iommu_notifier, &entry);
+            memory_region_iotlb_notify_one(iommu_notifier, &entry);
         }
     }
 }
-- 
2.17.1

