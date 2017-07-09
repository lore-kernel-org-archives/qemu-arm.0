Received: by 10.25.44.15 with SMTP id s15csp2624699lfs;
        Sun, 9 Jul 2017 13:56:36 -0700 (PDT)
X-Received: by 10.200.54.181 with SMTP id a50mr654675qtc.66.1499633796652;
        Sun, 09 Jul 2017 13:56:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499633796; cv=none;
        d=google.com; s=arc-20160816;
        b=KP9V9wk2VJtX0MRLLGylB4eFrwgyq9FWmo8fs7MEdhoqfCoPimCq+hrkfznXTKNGJI
         WdV5Mcf7gjw0UwCDlFP9z+fnSFbVWcA0KENSkNBb6IUGPHnz6nuGuH466Fb6VaIUcnhp
         tM5axtEL4m7+kHT8Cx8NxawwtcSkHq8raFcJge4BMQjFiOO6PAYsDRgc3hnPGTDA9WvV
         3XH2qG66pbVTf84BysN9/sP7yi+CRPqy5kYKeiQt251WjS1RtYyjjL0vVlhvWcsXvbyS
         dDGEoGQc9On/lSVUsu6IrfqN42f6JY+W7X67vV/REZ5z6J8faC5ksz6pHqm+E+rsXWpZ
         onSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=KgpewhFr+Furqe8F3+QQ/695e6zp3opdzz/1r1fa53M=;
        b=QZkyYwQNFZnfoApsG41jI6FCy2ntXHa5jsNH6v+4EewQlV/HZyNIISiEt0kLHNJBL4
         3bBKxGkPBCINACr+7MguZlq+z2x2MY5iCAPmb3c6d4oqsBEuT2AmBsvwPpwYFei32Y5o
         GeAWBDI6l5CHusZ+Ix51P2OMIPkmqTvhGKgvs2aDOXRXOIEv5MbK14YfUaMqvaRu+26h
         jUNOkMnbvdHgkkAF/Ht9D6EhdjQXaOhcLCtenXmApd5n5q8tWYLXzpJGabxd/x4MQRE+
         /RUHBH/kLsqrgt3q7pGNmLPJ8+M+vadJx3jwu8S6kSMRAcOJoJIh30hBSiMSx5YjcUUB
         IjqA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id d123si8878367qka.329.2017.07.09.13.56.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 09 Jul 2017 13:56:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37450 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUJFp-00058s-Rl
	for alex.bennee@linaro.org; Sun, 09 Jul 2017 16:56:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dUJCk-0002Ze-Hc
	for qemu-devel@nongnu.org; Sun, 09 Jul 2017 16:53:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dUJCj-0006OO-7Q
	for qemu-devel@nongnu.org; Sun, 09 Jul 2017 16:53:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50238)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dUJCc-0006Lg-6W; Sun, 09 Jul 2017 16:53:14 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 024CB61B82;
	Sun,  9 Jul 2017 20:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 024CB61B82
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 024CB61B82
Received: from localhost.localdomain.com (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9F50D17DC6;
	Sun,  9 Jul 2017 20:52:59 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	prem.mallappa@gmail.com
Date: Sun,  9 Jul 2017 22:51:33 +0200
Message-Id: <1499633493-19865-9-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
References: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Sun, 09 Jul 2017 20:53:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v5 8/8] hw/arm/smmuv3: VFIO integration
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	will.deacon@arm.com, robin.murphy@arm.com, peterx@redhat.com,
	edgar.iglesias@gmail.com, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sKeqgCUCD7oA

This patch allows doing PCIe passthrough with a guest exposed
with a vSMMUv3. It implements the replay and notify_flag_changed
iommu ops. Also on TLB and data structure invalidation commands,
we replay the mappings so that the physical IOMMU implements
updated stage 1 settings (Guest IOVA -> Guest PA) + stage 2 settings.

This works only if the guest smmuv3 driver implements the
"tlbi-on-map" option.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

at the moment the "tlbi-on-map" option only is set in DT mode.
---
 hw/arm/smmuv3.c     | 123 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/trace-events |   6 +++
 2 files changed, 129 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 639f682..1ff77f7 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -143,6 +143,32 @@ static MemTxResult smmu_read_cmdq(SMMUV3State *s, Cmd *cmd)
     return ret;
 }
 
+static void smmu_replay_all(SMMUState *s)
+{
+    SMMUNotifierNode *node;
+
+    QLIST_FOREACH(node, &s->notifiers_list, next) {
+        memory_region_iommu_replay_all(&node->sdev->iommu);
+    }
+}
+
+static void smmuv3_replay_single(MemoryRegion *mr, IOMMUNotifier *n,
+                                 uint64_t iova);
+
+static void smmu_notify_all(SMMUState *s, uint64_t iova)
+{
+    SMMUNotifierNode *node;
+
+    QLIST_FOREACH(node, &s->notifiers_list, next) {
+        MemoryRegion *mr = &node->sdev->iommu;
+        IOMMUNotifier *n;
+
+        IOMMU_NOTIFIER_FOREACH(n, mr) {
+            smmuv3_replay_single(mr, n, iova);
+        }
+    }
+}
+
 static int smmu_cmdq_consume(SMMUV3State *s)
 {
     uint32_t error = SMMU_CMD_ERR_NONE;
@@ -183,6 +209,7 @@ static int smmu_cmdq_consume(SMMUV3State *s)
              uint32_t streamid = cmd.word[1];
 
              trace_smmuv3_cmdq_cfgi_ste(streamid);
+             smmu_replay_all(&s->smmu_state);
             break;
         }
         case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
@@ -192,14 +219,17 @@ static int smmu_cmdq_consume(SMMUV3State *s)
             range = extract32(cmd.word[2], 0, 5);
             end = start + (1 << (range + 1)) - 1;
             trace_smmuv3_cmdq_cfgi_ste_range(start, end);
+            smmu_replay_all(&s->smmu_state);
             break;
         }
         case SMMU_CMD_CFGI_CD:
         case SMMU_CMD_CFGI_CD_ALL:
+            smmu_replay_all(&s->smmu_state);
             break;
         case SMMU_CMD_TLBI_NH_ALL:
         case SMMU_CMD_TLBI_NH_ASID:
             printf("%s TLBI* replay\n", __func__);
+            smmu_replay_all(&s->smmu_state);
             break;
         case SMMU_CMD_TLBI_NH_VA:
         {
@@ -210,6 +240,7 @@ static int smmu_cmdq_consume(SMMUV3State *s)
             uint64_t addr = high << 32 | (low << 12);
 
             trace_smmuv3_cmdq_tlbi_nh_va(asid, vmid, addr);
+            smmu_notify_all(&s->smmu_state, addr);
             break;
         }
         case SMMU_CMD_TLBI_NH_VAA:
@@ -222,6 +253,7 @@ static int smmu_cmdq_consume(SMMUV3State *s)
         case SMMU_CMD_TLBI_S12_VMALL:
         case SMMU_CMD_TLBI_S2_IPA:
         case SMMU_CMD_TLBI_NSNH_ALL:
+            smmu_replay_all(&s->smmu_state);
             break;
         case SMMU_CMD_ATC_INV:
         case SMMU_CMD_PRI_RESP:
@@ -804,6 +836,95 @@ out:
     return entry;
 }
 
+static int smmuv3_replay_hook(IOMMUTLBEntry *entry, void *private)
+{
+    int perm = entry->perm;
+
+    trace_smmuv3_replay_hook(entry->iova, entry->translated_addr,
+                             entry->addr_mask, entry->perm);
+    entry->perm = IOMMU_NONE;
+    memory_region_notify_one((IOMMUNotifier *)private, entry);
+    entry->perm = perm;
+    memory_region_notify_one((IOMMUNotifier *)private, entry);
+    return 0;
+}
+
+static void smmuv3_replay(MemoryRegion *mr, IOMMUNotifier *n)
+{
+    SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
+    SMMUV3State *s = sdev->smmu;
+    SMMUBaseClass *sbc = SMMU_DEVICE_GET_CLASS(s);
+    SMMUTransCfg cfg = {};
+    int ret;
+
+    ret = smmuv3_decode_config(mr, &cfg);
+    if (ret) {
+        error_report("%s error decoding the configuration for iommu mr=%s",
+                     __func__, mr->name);
+    }
+
+    if (cfg.disabled || cfg.bypassed) {
+        return;
+    }
+    /* is the smmu enabled */
+    sbc->page_walk_64(&cfg, 0, (1ULL << (64 - cfg.tsz)) - 1, false,
+                      smmuv3_replay_hook, n);
+}
+
+static void smmuv3_replay_single(MemoryRegion *mr, IOMMUNotifier *n,
+                                 uint64_t iova)
+{
+    SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
+    SMMUV3State *s = sdev->smmu;
+    SMMUBaseClass *sbc = SMMU_DEVICE_GET_CLASS(s);
+    SMMUTransCfg cfg = {};
+    int ret;
+
+    trace_smmuv3_replay_single(mr->name, iova, n);
+    ret = smmuv3_decode_config(mr, &cfg);
+    if (ret) {
+        error_report("%s error decoding the configuration for iommu mr=%s",
+                     __func__, mr->name);
+    }
+
+    if (cfg.disabled || cfg.bypassed) {
+        return;
+    }
+    /* is the smmu enabled */
+    sbc->page_walk_64(&cfg, iova, iova + 1, false,
+                      smmuv3_replay_hook, n);
+}
+
+static void smmuv3_notify_flag_changed(MemoryRegion *iommu,
+                                       IOMMUNotifierFlag old,
+                                       IOMMUNotifierFlag new)
+{
+    SMMUDevice *sdev = container_of(iommu, SMMUDevice, iommu);
+    SMMUV3State *s3 = sdev->smmu;
+    SMMUState *s = &(s3->smmu_state);
+    SMMUNotifierNode *node = NULL;
+    SMMUNotifierNode *next_node = NULL;
+
+    if (old == IOMMU_NOTIFIER_NONE) {
+        trace_smmuv3_notify_flag_add(iommu->name);
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
+                trace_smmuv3_notify_flag_del(iommu->name);
+                QLIST_REMOVE(node, next);
+                g_free(node);
+            }
+            return;
+        }
+    }
+}
 
 static inline void smmu_update_base_reg(SMMUV3State *s, uint64_t *base,
                                         uint64_t val)
@@ -1072,6 +1193,8 @@ static void smmu_realize(DeviceState *d, Error **errp)
     SysBusDevice *dev = SYS_BUS_DEVICE(d);
 
     sys->iommu_ops.translate = smmuv3_translate;
+    sys->iommu_ops.notify_flag_changed = smmuv3_notify_flag_changed;
+    sys->iommu_ops.replay = smmuv3_replay;
     /* Register Access */
     memset(sys->smmu_as_by_bus_num, 0, sizeof(sys->smmu_as_by_bus_num));
     memory_region_init_io(&sys->iomem, OBJECT(s),
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 30a817b..6c143be 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -50,3 +50,9 @@ smmuv3_dump_ste(int i, uint32_t word0, int j,  uint32_t word1) "STE[%2d]: %#010x
 smmuv3_dump_cd(int i, uint32_t word0, int j,  uint32_t word1) "CD[%2d]: %#010x\t CD[%2d]: %#010x"
 smmuv3_dump_cmd(int i, uint32_t word0, int j,  uint32_t word1) "CMD[%2d]: %#010x\t CMD[%2d]: %#010x"
 smmuv3_cfg_stage(int s, uint32_t oas, uint32_t tsz, uint64_t ttbr, bool aa64, uint32_t granule_sz, int initial_level) "TransCFG stage:%d oas:%d tsz:%d ttbr:0x%"PRIx64"  aa64:%d granule_sz:%d, initial_level = %d"
+
+smmuv3_replay(uint16_t sid, bool enabled) "sid=%d, enabled=%d"
+smmuv3_replay_hook(hwaddr iova, hwaddr pa, hwaddr mask, int perm) "iova=0x%"PRIx64" pa=0x%" PRIx64" mask=0x%"PRIx64" perm=%d"
+smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
+smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
+smmuv3_replay_single(const char *name, uint64_t iova, void *n) "iommu mr=%s iova=0x%"PRIx64" n=%p"
-- 
2.5.5

