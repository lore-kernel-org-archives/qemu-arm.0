Received: by 10.28.71.155 with SMTP id m27csp1613600wmi;
        Thu, 12 Apr 2018 00:52:12 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/X9DujmGbtkUeMvH0XEYlA7e6zRJ9WrLO953XYjlxu8pvx3LQmP6r7FW37yJxumizJKSeR
X-Received: by 10.200.49.176 with SMTP id h45mr2375283qte.170.1523519532085;
        Thu, 12 Apr 2018 00:52:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523519532; cv=none;
        d=google.com; s=arc-20160816;
        b=T9Z1xUl6Lqt8/Cd1jHh4oIMV7mIaDT8ks8mVIFDM96ZRNpnisiH76uaMx772/BdL0l
         pv6KcJk6bD68L5axZojTV2nT7x64713PWNzayyND9MBHxGqocUiDSf8uV8w7HfS99tyk
         Rj4zC2uRX3JFtZmPyoOiEjTcP9HuAL3TiskmRBTDkxMsTXJnu4cNP/TpPPfRq468Q/tz
         5RgBysnwblsm6nxOiL9ABFmWRLG394ta33McRgYMPLPcmpkiwMe/E/A3NjjIh3xcmVVr
         0+Y4w0KJZ6ji3wLgYqbD4la9suCtiPxiqbvTL9/DvzsGVqwc2rQkrZNk2yJBXOU0DdaP
         28Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=quz7Qo8a3ZPtk9X4DLm5lCHW4QhQdLKb/1TBLSEbJv4=;
        b=k3Xx/USV85QmTcpUNOa5ndM4pT9hWd6ZRufrpyFJKP5TEesa8o2mfeynpHjdBcnSry
         nMIO1VVRYVrat3hnx2wbEqKDMkCvt7Y3BsC7nCRXiqG+v9DnXQJ7cJAAyNHuS45SAYN/
         Otg76XN+A14Hp0aJJBkXvyG2Zc6U+481CPjeRyCfrRmskFypmE5tqK11ErVa+wsNlFxC
         cMuVyeLinrGiKUjrbairAthccF3G/ZFqZzoUUtGpB2un80QJjnY/mZYvwMCQXClQUa52
         OynOVjgNOB4yT69KfyTvz+BBaIrT0Tpf47hrWavzadaJ8TllLOSYNNY9aP3EW1MvOuYr
         vucw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 13si448177qkh.0.2018.04.12.00.52.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 00:52:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44321 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6X1f-0002K6-Hd
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 03:52:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f6WpD-0007Ej-SM
	for qemu-devel@nongnu.org; Thu, 12 Apr 2018 03:39:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f6WpB-0003XJ-VL
	for qemu-devel@nongnu.org; Thu, 12 Apr 2018 03:39:19 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35686 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1f6Wp4-0003TS-JZ; Thu, 12 Apr 2018 03:39:10 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1565681A88A0;
	Thu, 12 Apr 2018 07:39:10 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-192.ams2.redhat.com
	[10.36.116.192])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 78E95215CDC6;
	Thu, 12 Apr 2018 07:39:07 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Thu, 12 Apr 2018 09:38:07 +0200
Message-Id: <1523518688-26674-17-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1523518688-26674-1-git-send-email-eric.auger@redhat.com>
References: <1523518688-26674-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 12 Apr 2018 07:39:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 12 Apr 2018 07:39:10 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v11 16/17] hw/arm/smmuv3: IOTLB emulation
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
Cc: cdall@kernel.org, mst@redhat.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, peterx@redhat.com, alex.williamson@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, jintack@cs.columbia.edu
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LrIEtVZaZXoI

We emulate a TLB cache of size SMMU_IOTLB_MAX_SIZE=256.
It is implemented as a hash table whose key is a combination
of the 16b asid and 48b IOVA.

Entries are invalidated on TLB invalidation commands, either
globally, or per asid, or per asid/iova.

One peculiarity is the NH_VA invalidation command does not
convey any information about the size to be invalidated (as
opposed to what Intel does, for instance, with the am field).
Hence, when NH_VA arrives we both invalidate the 4K and 64K
entries, the both granules that we support.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

Credit to Tomasz Nowicki who did the first implementation of
this IOTLB implementation, inspired of intel_iommu implemtation.
---
 hw/arm/smmu-common.c         |  33 ++++++++++++++
 hw/arm/smmuv3.c              | 105 +++++++++++++++++++++++++++++++++++++++++--
 hw/arm/trace-events          |   9 ++++
 include/hw/arm/smmu-common.h |  11 +++++
 4 files changed, 154 insertions(+), 4 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index c271a28..3d25339 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -29,6 +29,36 @@
 #include "hw/arm/smmu-common.h"
 #include "smmu-internal.h"
 
+/* IOTLB Management */
+
+inline void smmu_iotlb_inv_all(SMMUState *s)
+{
+    trace_smmu_iotlb_inv_all();
+    g_hash_table_remove_all(s->iotlb);
+}
+
+static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
+                                         gpointer user_data)
+{
+    uint16_t asid = *(uint16_t *)user_data;
+
+    return ((*(uint64_t *)key) >> IOTLB_KEY_ASID_SHIFT) == asid;
+}
+
+inline void smmu_iotlb_inv_iova(SMMUState *s, uint16_t asid, dma_addr_t iova)
+{
+    uint64_t key = SMMU_IOTLB_KEY(asid, iova);
+
+    trace_smmu_iotlb_inv_iova(asid, iova);
+    g_hash_table_remove(s->iotlb, &key);
+}
+
+inline void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
+{
+    trace_smmu_iotlb_inv_asid(asid);
+    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid);
+}
+
 /* VMSAv8-64 Translation */
 
 /**
@@ -327,6 +357,8 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
         return;
     }
     s->configs = g_hash_table_new_full(NULL, NULL, NULL, g_free);
+    s->iotlb = g_hash_table_new_full(g_int64_hash, g_int64_equal,
+                                     g_free, g_free);
     s->smmu_pcibus_by_busptr = g_hash_table_new(NULL, NULL);
 
     if (s->primary_bus) {
@@ -341,6 +373,7 @@ static void smmu_base_reset(DeviceState *dev)
     SMMUState *s = ARM_SMMU(dev);
 
     g_hash_table_remove_all(s->configs);
+    g_hash_table_remove_all(s->iotlb);
 }
 
 static Property smmu_dev_properties[] = {
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 938052e..081f0fb 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -551,6 +551,8 @@ static SMMUTransCfg *smmuv3_get_config(SMMUDevice *sdev, SMMUEventInfo *event)
                                        sdev->devfn);
         cfg = g_new0(SMMUTransCfg, 1);
         g_hash_table_insert(bc->configs, sdev, cfg);
+        cfg->iotlb_miss = 0;
+        cfg->iotlb_hit = 0;
 
         if (smmuv3_decode_config(&sdev->iommu, cfg, event)) {
             g_hash_table_remove(bc->configs, sdev);
@@ -575,8 +577,12 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
     SMMUv3State *s = sdev->smmu;
     uint32_t sid = smmu_get_sid(sdev);
+    SMMUState *bs = ARM_SMMU(s);
     SMMUEventInfo event = {.type = SMMU_EVT_OK, .sid = sid};
+    uint64_t key_val, page_mask, aligned_addr;
+    IOMMUTLBEntry *cached_entry = NULL;
     SMMUPTWEventInfo ptw_info = {};
+    SMMUTransTableInfo *tt;
     SMMUTransCfg *cfg = NULL;
     IOMMUTLBEntry entry = {
         .target_as = &address_space_memory,
@@ -585,6 +591,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         .addr_mask = ~(hwaddr)0,
         .perm = IOMMU_NONE,
     };
+    uint64_t *key;
     int ret = 0;
 
     if (!smmu_enabled(s)) {
@@ -607,7 +614,56 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         goto out;
     }
 
-    ret = smmu_ptw(cfg, addr, flag, &entry, &ptw_info);
+    tt = select_tt(cfg, addr);
+    if (!tt) {
+        if (event.record_trans_faults) {
+            event.type = SMMU_EVT_F_TRANSLATION;
+            event.u.f_translation.addr = addr;
+            event.u.f_translation.rnw = flag & 0x1;
+        }
+        ret = -EINVAL;
+        goto out;
+    }
+
+    page_mask = (1ULL << (tt->granule_sz)) - 1;
+    aligned_addr = addr & ~page_mask;
+
+    key_val = SMMU_IOTLB_KEY(cfg->asid, aligned_addr);
+
+    cached_entry = g_hash_table_lookup(bs->iotlb, &key_val);
+    if (cached_entry) {
+        cfg->iotlb_hit += 1;
+        trace_smmu_iotlb_cache_hit(cfg->asid, aligned_addr,
+                                   cfg->iotlb_hit, cfg->iotlb_miss,
+                                   100 * cfg->iotlb_hit /
+                                   (cfg->iotlb_hit + cfg->iotlb_miss));
+        if ((flag & IOMMU_WO) && !(cached_entry->perm & IOMMU_WO)) {
+            ret = -EFAULT;
+            if (event.record_trans_faults) {
+                event.type = SMMU_EVT_F_PERMISSION;
+                event.u.f_permission.addr = addr;
+                event.u.f_permission.rnw = flag & 0x1;
+            }
+        }
+        goto out;
+    }
+
+    cfg->iotlb_miss += 1;
+    trace_smmu_iotlb_cache_miss(cfg->asid, addr & ~page_mask,
+                                cfg->iotlb_hit, cfg->iotlb_miss,
+                                100 * cfg->iotlb_hit /
+                                (cfg->iotlb_hit + cfg->iotlb_miss));
+
+    if (g_hash_table_size(bs->iotlb) >= SMMU_IOTLB_MAX_SIZE) {
+        smmu_iotlb_inv_all(bs);
+    }
+
+    cached_entry = g_new0(IOMMUTLBEntry, 1);
+    key = g_new0(uint64_t, 1);
+    *key = key_val;
+    g_hash_table_insert(bs->iotlb, key, cached_entry);
+
+    ret = smmu_ptw(cfg, aligned_addr, flag, cached_entry, &ptw_info);
     if (ret) {
         switch (ptw_info.type) {
         case SMMU_PTW_ERR_WALK_EABT:
@@ -656,8 +712,14 @@ out:
                       mr->parent_obj.name, addr, ret);
         entry.perm = IOMMU_NONE;
         smmuv3_record_event(s, &event);
+        if (cached_entry) {
+            smmu_iotlb_inv_iova(bs, cfg->asid, aligned_addr);
+        }
     } else if (!cfg->aborted) {
         entry.perm = flag;
+        entry.translated_addr = cached_entry->translated_addr +
+                                    (addr & page_mask);
+        entry.addr_mask = cached_entry->addr_mask;
         trace_smmuv3_translate(mr->parent_obj.name, sid, addr,
                                entry.translated_addr, entry.perm);
     }
@@ -781,10 +843,46 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
             smmuv3_put_config(sdev);
             break;
         }
-        case SMMU_CMD_TLBI_NH_ALL:
         case SMMU_CMD_TLBI_NH_ASID:
-        case SMMU_CMD_TLBI_NH_VA:
+        {
+            uint16_t asid = CMD_ASID(&cmd);
+
+            trace_smmuv3_cmdq_tlbi_nh_asid(asid);
+            /* TODO: be more precise and invalidate for @asid */
+            smmu_iotlb_inv_asid(bs, asid);
+            break;
+        }
+        case SMMU_CMD_TLBI_NH_ALL:
+        case SMMU_CMD_TLBI_NSNH_ALL:
+            trace_smmuv3_cmdq_tlbi_nh();
+            smmu_iotlb_inv_all(bs);
+            break;
         case SMMU_CMD_TLBI_NH_VAA:
+        {
+            dma_addr_t addr = CMD_ADDR(&cmd);
+            uint16_t vmid = CMD_VMID(&cmd);
+
+            trace_smmuv3_cmdq_tlbi_nh_vaa(vmid, addr);
+            smmu_iotlb_inv_all(bs);
+            break;
+        }
+        case SMMU_CMD_TLBI_NH_VA:
+        {
+            uint16_t asid = CMD_ASID(&cmd);
+            uint16_t vmid = CMD_VMID(&cmd);
+            dma_addr_t addr = CMD_ADDR(&cmd);
+            bool leaf = CMD_LEAF(&cmd);
+
+            trace_smmuv3_cmdq_tlbi_nh_va(vmid, asid, addr, leaf);
+            /**
+             * we don't know the size of the granule so
+             * let's invalidate both 4K entry and 64kB entry.
+             * The spec allow to invalidate more than necessary.
+             */
+            smmu_iotlb_inv_iova(bs, asid, addr & ~0xFFF);
+            smmu_iotlb_inv_iova(bs, asid, addr & ~0xFFFF);
+            break;
+        }
         case SMMU_CMD_TLBI_EL3_ALL:
         case SMMU_CMD_TLBI_EL3_VA:
         case SMMU_CMD_TLBI_EL2_ALL:
@@ -793,7 +891,6 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         case SMMU_CMD_TLBI_EL2_VAA:
         case SMMU_CMD_TLBI_S12_VMALL:
         case SMMU_CMD_TLBI_S2_IPA:
-        case SMMU_CMD_TLBI_NSNH_ALL:
         case SMMU_CMD_ATC_INV:
         case SMMU_CMD_PRI_RESP:
         case SMMU_CMD_RESUME:
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index ecc30be..7fdc08e 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -12,6 +12,11 @@ smmu_ptw_invalid_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr,
 smmu_ptw_page_pte(int stage, int level,  uint64_t iova, uint64_t baseaddr, uint64_t pteaddr, uint64_t pte, uint64_t address) "stage=%d level=%d iova=0x%"PRIx64" base@=0x%"PRIx64" pte@=0x%"PRIx64" pte=0x%"PRIx64" page address = 0x%"PRIx64
 smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, uint64_t pte, uint64_t iova, uint64_t gpa, int bsize_mb) "stage=%d level=%d base@=0x%"PRIx64" pte@=0x%"PRIx64" pte=0x%"PRIx64" iova=0x%"PRIx64" block address = 0x%"PRIx64" block size = %d MiB"
 smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "baseaddr=0x%"PRIx64" index=0x%x, pteaddr=0x%"PRIx64", pte=0x%"PRIx64
+smmu_iotlb_cache_hit(uint16_t asid, uint64_t addr, uint32_t hit, uint32_t miss, float p) "IOTLB cache HIT asid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%.1f"
+smmu_iotlb_cache_miss(uint16_t asid, uint64_t addr, uint32_t hit, uint32_t miss, float p) "IOTLB cache MISS asid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%.1f"
+smmu_iotlb_inv_all(void) "IOTLB invalidate all"
+smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=%d"
+smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
 
 #hw/arm/smmuv3.c
 smmuv3_read_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
@@ -41,6 +46,10 @@ smmuv3_decode_cd(uint32_t oas) "oas=%d"
 smmuv3_decode_cd_tt(int i, uint32_t tsz, uint64_t ttb, uint32_t granule_sz, int initial_level) "TT[%d]:tsz:%d ttb:0x%"PRIx64" granule_sz:%d, initial_level = %d"
 smmuv3_cmdq_cfgi_ste(int streamid) "     |_ streamid =%d"
 smmuv3_cmdq_cfgi_ste_range(int start, int end) "     |_ start=0x%d - end=0x%d"
+smmuv3_cmdq_tlbi_nh_va(int vmid, int asid, uint64_t addr, bool leaf) "     |_ vmid =%d asid =%d addr=0x%"PRIx64" leaf=%d"
+smmuv3_cmdq_tlbi_nh_vaa(int vmid, uint64_t addr) "     |_ vmid =%d addr=0x%"PRIx64
+smmuv3_cmdq_tlbi_nh(void) ""
+smmuv3_cmdq_tlbi_nh_asid(uint16_t asid) "asid=%d"
 smmuv3_cmdq_cfgi_cd(uint32_t sid) "     |_ streamid = %d"
 smmuv3_config_cache_hit(uint32_t sid) "Config cache HIT for sid %d"
 smmuv3_config_cache_miss(uint32_t sid) "Config cache MISS for sid %d"
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index ff07734..1c9c648 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -68,6 +68,8 @@ typedef struct SMMUTransCfg {
     uint8_t tbi;               /* Top Byte Ignore */
     uint16_t asid;
     SMMUTransTableInfo tt[2];
+    uint32_t iotlb_hit;
+    uint32_t iotlb_miss;
 } SMMUTransCfg;
 
 typedef struct SMMUDevice {
@@ -146,4 +148,13 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova);
 /* Return the iommu mr associated to @sid, or NULL if none */
 IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
 
+#define SMMU_IOTLB_MAX_SIZE 256
+#define IOTLB_KEY_ASID_SHIFT SMMU_MAX_VA_BITS
+#define SMMU_IOTLB_KEY(asid, iova)                       \
+    (iova | (uint64_t)(asid) << IOTLB_KEY_ASID_SHIFT);
+
+void smmu_iotlb_inv_all(SMMUState *s);
+void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
+void smmu_iotlb_inv_iova(SMMUState *s, uint16_t asid, dma_addr_t iova);
+
 #endif  /* HW_ARM_SMMU_COMMON */
-- 
2.5.5

