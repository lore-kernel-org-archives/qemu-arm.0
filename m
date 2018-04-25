Received: by 10.28.4.212 with SMTP id 203csp886092wme;
        Wed, 25 Apr 2018 07:29:41 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqgEvuSjox6Ytril3Fx1NDhqEucsVOKbSqe2iscmkK1IAh1o5JABBcSSsCF7ZqZirkDUkUa
X-Received: by 10.12.174.47 with SMTP id y44mr8275279qvc.157.1524666581250;
        Wed, 25 Apr 2018 07:29:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524666581; cv=none;
        d=google.com; s=arc-20160816;
        b=RdV9I7Xw28BtRTOmnWoIQEta94+aLVHQlEmt2lH+ttTVK7yokR0aDssNT9evi9WaDJ
         G9hIW9zTJVeuHLzmLrAgIb9Z7zJg7jE6gZQ4u4mqpdL/EDe4WgUSQw+pBKPDzX+o8v9M
         xIa59v1Hx7fED9TU77HX2wOlmGTVdHdkimaXcAb3pJDas8rAEOpBOuW1YzhuzRty+F7c
         qv3IzQ8uSLLbKas29AKf7JHUkAZYnEkFlB+3XoWtIT9Tp+rJ5L4VXUWhZoRxUgZpKUld
         UXoXrb3rAETLSMMPDtb0MV3LmB1o8/kODbENocx+DwE/N+pXo4CeMDskzJqZREM6yaFo
         tYXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=42OyNdoed04qPL7KhGp01FV8LJwP+bjSJRtZY7yqh3U=;
        b=aDIwWD7r0krHId8tZKVqM/+Z07X4USBSfIj9je5yPOv5uLUCeWLPKBdeAeqnm/nAxY
         vx21pJ8THJQc40k++gvYK5TIMjbcz5ZKKhS557etmg/pp3TEn4268ezZGB2drLlu+2Iz
         6r9oncV8UqPoniCvQW9y/FhI93xySlwMx+4im/7M4rmMxKCyRirYJH/m8DsQazkY9wmh
         Xs2DR/fKGM242yHmSfeoJjl9aRijqe6iMpNOejJMUa9utXkoo2B05kjZeVcBbzXMbO03
         CsCAg4GrW6KRDhWQJtqg7nI1RcNt7KjyJGpGZrWLqvNR7LOc56cLBxZ1hf36duX03EYF
         vcXA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o57-v6si5146979qtf.181.2018.04.25.07.29.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Apr 2018 07:29:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37247 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBLQS-0002Xc-JW
	for alex.bennee@linaro.org; Wed, 25 Apr 2018 10:29:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLEH-00012p-T3
	for qemu-arm@nongnu.org; Wed, 25 Apr 2018 10:17:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLEF-0006Fy-7d
	for qemu-arm@nongnu.org; Wed, 25 Apr 2018 10:17:05 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33188 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fBLEF-0006FV-33; Wed, 25 Apr 2018 10:17:03 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B53DB722C3;
	Wed, 25 Apr 2018 14:17:02 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-141.ams2.redhat.com
	[10.36.116.141])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 27AF0202323C;
	Wed, 25 Apr 2018 14:17:00 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Wed, 25 Apr 2018 16:16:02 +0200
Message-Id: <1524665762-31355-18-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
References: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 25 Apr 2018 14:17:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 25 Apr 2018 14:17:02 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v12 17/17] hw/arm/smmuv3: Add notifications on
 invalidation
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
Cc: cdall@kernel.org, mst@redhat.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, peterx@redhat.com, alex.williamson@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, jintack@cs.columbia.edu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SBMFDskVzvM9

On TLB invalidation commands, let's call registered
IOMMU notifiers. Those can only be UNMAP notifiers.
SMMUv3 does not support notification on MAP (VFIO).

This patch allows vhost use case where IOTLB API is notified
on each guest IOTLB invalidation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmu-common.c         | 34 +++++++++++++++
 hw/arm/smmuv3.c              | 99 +++++++++++++++++++++++++++++++++++++++++++-
 hw/arm/trace-events          |  5 +++
 include/hw/arm/smmu-common.h |  6 +++
 4 files changed, 142 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index aaa80c3..abec46c 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -386,6 +386,40 @@ static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
     return (k1->asid == k2->asid) && (k1->iova == k2->iova);
 }
 
+/* Unmap the whole notifier's range */
+static void smmu_unmap_notifier_range(IOMMUNotifier *n)
+{
+    IOMMUTLBEntry entry;
+
+    entry.target_as = &address_space_memory;
+    entry.iova = n->start;
+    entry.perm = IOMMU_NONE;
+    entry.addr_mask = n->end - n->start;
+
+    memory_region_notify_one(n, &entry);
+}
+
+/* Unmap all notifiers attached to @mr */
+inline void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr)
+{
+    IOMMUNotifier *n;
+
+    trace_smmu_inv_notifiers_mr(mr->parent_obj.name);
+    IOMMU_NOTIFIER_FOREACH(n, mr) {
+        smmu_unmap_notifier_range(n);
+    }
+}
+
+/* Unmap all notifiers of all mr's */
+void smmu_inv_notifiers_all(SMMUState *s)
+{
+    SMMUNotifierNode *node;
+
+    QLIST_FOREACH(node, &s->notifiers_list, next) {
+        smmu_inv_notifiers_mr(&node->sdev->iommu);
+    }
+}
+
 static void smmu_base_realize(DeviceState *dev, Error **errp)
 {
     SMMUState *s = ARM_SMMU(dev);
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 1a0e2e1..f183304 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -744,6 +744,68 @@ out:
     return entry;
 }
 
+/**
+ * smmuv3_notify_iova - call the notifier @n for a given
+ * @asid and @iova tuple.
+ *
+ * @mr: IOMMU mr region handle
+ * @n: notifier to be called
+ * @asid: address space ID or negative value if we don't care
+ * @iova: iova
+ */
+static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
+                               IOMMUNotifier *n,
+                               int asid,
+                               dma_addr_t iova)
+{
+    SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
+    SMMUEventInfo event = {};
+    SMMUTransTableInfo *tt;
+    SMMUTransCfg *cfg;
+    IOMMUTLBEntry entry;
+
+    cfg = smmuv3_get_config(sdev, &event);
+    if (!cfg) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s error decoding the configuration for iommu mr=%s\n",
+                      __func__, mr->parent_obj.name);
+        return;
+    }
+
+    if (asid >= 0 && cfg->asid != asid) {
+        return;
+    }
+
+    tt = select_tt(cfg, iova);
+    if (!tt) {
+        return;
+    }
+
+    entry.target_as = &address_space_memory;
+    entry.iova = iova;
+    entry.addr_mask = (1 << tt->granule_sz) - 1;
+    entry.perm = IOMMU_NONE;
+
+    memory_region_notify_one(n, &entry);
+}
+
+/* invalidate an asid/iova tuple in all mr's */
+static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova)
+{
+    SMMUNotifierNode *node;
+
+    QLIST_FOREACH(node, &s->notifiers_list, next) {
+        IOMMUMemoryRegion *mr = &node->sdev->iommu;
+        IOMMUNotifier *n;
+
+        trace_smmuv3_inv_notifiers_iova(mr->parent_obj.name, asid, iova);
+
+        IOMMU_NOTIFIER_FOREACH(n, mr) {
+            smmuv3_notify_iova(mr, n, asid, iova);
+        }
+    }
+}
+
 static int smmuv3_cmdq_consume(SMMUv3State *s)
 {
     SMMUState *bs = ARM_SMMU(s);
@@ -862,12 +924,14 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
             uint16_t asid = CMD_ASID(&cmd);
 
             trace_smmuv3_cmdq_tlbi_nh_asid(asid);
+            smmu_inv_notifiers_all(&s->smmu_state);
             smmu_iotlb_inv_asid(bs, asid);
             break;
         }
         case SMMU_CMD_TLBI_NH_ALL:
         case SMMU_CMD_TLBI_NSNH_ALL:
             trace_smmuv3_cmdq_tlbi_nh();
+            smmu_inv_notifiers_all(&s->smmu_state);
             smmu_iotlb_inv_all(bs);
             break;
         case SMMU_CMD_TLBI_NH_VAA:
@@ -876,6 +940,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
             uint16_t vmid = CMD_VMID(&cmd);
 
             trace_smmuv3_cmdq_tlbi_nh_vaa(vmid, addr);
+            smmuv3_inv_notifiers_iova(bs, -1, addr);
             smmu_iotlb_inv_all(bs);
             break;
         }
@@ -887,6 +952,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
             bool leaf = CMD_LEAF(&cmd);
 
             trace_smmuv3_cmdq_tlbi_nh_va(vmid, asid, addr, leaf);
+            smmuv3_inv_notifiers_iova(bs, asid, addr);
             smmu_iotlb_inv_iova(bs, asid, addr);
             break;
         }
@@ -1362,9 +1428,38 @@ static void smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
                                        IOMMUNotifierFlag old,
                                        IOMMUNotifierFlag new)
 {
+    SMMUDevice *sdev = container_of(iommu, SMMUDevice, iommu);
+    SMMUv3State *s3 = sdev->smmu;
+    SMMUState *s = &(s3->smmu_state);
+    SMMUNotifierNode *node = NULL;
+    SMMUNotifierNode *next_node = NULL;
+
+    if (new == IOMMU_NOTIFIER_MAP) {
+        int bus_num = pci_bus_num(sdev->bus);
+        PCIDevice *pcidev = pci_find_device(sdev->bus, bus_num, sdev->devfn);
+
+        warn_report("SMMUv3 does not support notification on MAP: "
+                     "device %s will not function properly", pcidev->name);
+    }
+
     if (old == IOMMU_NOTIFIER_NONE) {
-        warn_report("SMMUV3 does not support vhost/vfio integration yet: "
-                    "devices of those types will not function properly");
+        trace_smmuv3_notify_flag_add(iommu->parent_obj.name);
+        node = g_malloc0(sizeof(*node));
+        node->sdev = sdev;
+        QLIST_INSERT_HEAD(&s->notifiers_list, node, next);
+        return;
+    }
+
+    /* update notifier node with new flags */
+    QLIST_FOREACH_SAFE(node, &s->notifiers_list, next, next_node) {
+        if (node->sdev == sdev) {
+            if (new == IOMMU_NOTIFIER_NONE) {
+                trace_smmuv3_notify_flag_del(iommu->parent_obj.name);
+                QLIST_REMOVE(node, next);
+                g_free(node);
+            }
+            return;
+        }
     }
 }
 
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index e0cfcfc..acd2de4 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -17,6 +17,7 @@ smmu_iotlb_cache_miss(uint16_t asid, uint64_t addr, uint32_t hit, uint32_t miss,
 smmu_iotlb_inv_all(void) "IOTLB invalidate all"
 smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=%d"
 smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
+smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
 
 #hw/arm/smmuv3.c
 smmuv3_read_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
@@ -55,3 +56,7 @@ smmuv3_cmdq_cfgi_cd(uint32_t sid) "     |_ streamid = %d"
 smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, float perc) "Config cache HIT for sid %d (hits=%d, misses=%d, hit rate=%.1f)"
 smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, float perc) "Config cache MISS for sid %d (hits=%d, misses=%d, hit rate=%.1f)"
 smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid %d"
+smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
+smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
+smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint64_t iova) "iommu mr=%s asid=%d iova=0x%"PRIx64
+
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index d173806..50e2912 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -160,4 +160,10 @@ void smmu_iotlb_inv_all(SMMUState *s);
 void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
 void smmu_iotlb_inv_iova(SMMUState *s, uint16_t asid, dma_addr_t iova);
 
+/* Unmap the range of all the notifiers registered to any IOMMU mr */
+void smmu_inv_notifiers_all(SMMUState *s);
+
+/* Unmap the range of all the notifiers registered to @mr */
+void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr);
+
 #endif  /* HW_ARM_SMMU_COMMON */
-- 
2.5.5

