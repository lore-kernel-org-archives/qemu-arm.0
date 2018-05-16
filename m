Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1183069wme;
        Wed, 16 May 2018 07:29:56 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrTORdCo+uQcIc7RO6+xvu6WfM1Mw9lu0K+cocYrNpphLoZHIS7i1FfnQ1TXwggmjJOTfWz
X-Received: by 2002:a37:2ba8:: with SMTP id r40-v6mr1018466qkr.432.1526480996149;
        Wed, 16 May 2018 07:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526480996; cv=none;
        d=google.com; s=arc-20160816;
        b=Z8/wUBxX6sx/+yTo45cpC76mJZRG/GmTg7kdpHPTv9INp7B8yIuIGDPkrvED0PWCMJ
         zykl1y1dolSIHo7S7H9mwcfe2afRBv24smDi7YamzLyPDWCTgSNWo25G11HkcUpQijK7
         DKWDMC9eh+OxJl6Nev+G6XKzvBAWFqCWpnhqXYfg7jzSB+MAbSUbFlkuiP1Pz6Hrdlea
         8sNbO7VXOaurLpU25+TCjcOz/PAK59MrozQUJosZs5p53zgM77FoCiVuC/fZ2dBZK/Go
         W1h/Gb3vxEyR2u9SXC/3tBYLgeHdGJlFsqVZJ8h6XZfvQOU6MrJ75oQL+LpqgPNa/S9P
         09Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=FSHnnTiEFt4TaUYiGjrCIIy9sHmxFxXcQnMqJ+Se+NE=;
        b=CUw3uTyGPJQt+iyMvuboJi4ENSyH/CpBiWlsOpkvRBYdqcJ5SfSHLwXT35YBW6MHzb
         JhrRba1DbsSQmXopkrxPMNG889XqMf2kQyrSyiAw+IbOjIeaNkBe1ZBxm/Aix7kRsCuz
         o/porbYKXlaCjzGfS/IvuedNA4rybAESynbZIrk5OCV2rqQblk5TKQRXPFzOuovEa/ih
         sB5lU4YS/aUyluuMR0CYzIlx0cA4iT4okBshK5fr4KNPTN5WsZhzrL3I4Klx6jqBAMRa
         GEgKBfxIdqXR/Lsd4xRg/OIEzKCCcz17/c+zTv93G7FWKhlm2r05t7WzFmroaqDu0qtQ
         r9LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d36-v6si2787611qtf.7.2018.05.16.07.29.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 07:29:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48915 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fIxRD-0004xJ-AJ
	for alex.bennee@linaro.org; Wed, 16 May 2018 10:29:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fIxOZ-0002lM-Nk
	for qemu-arm@nongnu.org; Wed, 16 May 2018 10:27:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fIxOV-0000PP-8w
	for qemu-arm@nongnu.org; Wed, 16 May 2018 10:27:11 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60724 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fIxOV-0000P7-3l; Wed, 16 May 2018 10:27:07 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AF945BB40E;
	Wed, 16 May 2018 14:27:06 +0000 (UTC)
Received: from dhcp19-241-177.khw3.lab.eng.bos.redhat.com
	(gigabyte-r120-16.khw3.lab.eng.bos.redhat.com [10.19.240.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6FD39112D199;
	Wed, 16 May 2018 14:27:06 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 16 May 2018 14:31:14 -0400
Message-Id: <1526495474-26394-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1526495474-26394-1-git-send-email-eric.auger@redhat.com>
References: <1526495474-26394-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 16 May 2018 14:27:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 16 May 2018 14:27:06 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 3/3] hw/arm/smmuv3: Add notifications on
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jU8Z2F2e1NBc

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
index e4408c4..9caa149 100644
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
index 6c89a71..01ec6ee 100644
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
index 3eb9180..f1198f7 100644
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
1.8.3.1

