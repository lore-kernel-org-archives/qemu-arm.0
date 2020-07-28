Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp680845lfy;
        Tue, 28 Jul 2020 08:11:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJfVzpmtLr6y5r7YvsD0TMf+uJ/6Wjpv8JJieHvwAQ9K6ccnK5kHWqtdL2ZBNeN9lpvDK4
X-Received: by 2002:a25:ac02:: with SMTP id w2mr41966055ybi.499.1595949099508;
        Tue, 28 Jul 2020 08:11:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595949099; cv=none;
        d=google.com; s=arc-20160816;
        b=HMjOvR9DfeGU2PxHVB5up1uuvURqZv8kGVRsOinN/gwi4NNEQ/2vJCwlHX1PpjyVNr
         fgkWl94Ry/9B6WfxGox8OjBEreA+QeLVo/HR6AqZU4mKM/wXG4U2urApSIv+KMGtGww7
         EGy+L05ABKlTyTDqTNGZV6OD0mBTlzjscTOHxorwLVwuWoYVeVelvYSk044/yvfXuu2v
         D9ASlswt7Lh9asiHo/VqG8wZLls4pbZ7N9+xNWNprS33txbqVJu3U7S7P4S8VxTMMTFZ
         Rxc7qiD4nmYtt+OpWn0tu7vrvrE4zPcqHr/v5/qFUxeE7NICu/QxnpYyajmgLjihjMEY
         YbFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vauk46DRMEGSFIq9RbPTJR/RlmR9d200FI40z1XjTnI=;
        b=YbUknh5h1fhCIFa5kmBi2FRACW6+LQN219lLDaDtuBdaV8v5rjXaGWyNw/lCDAaypk
         0LHjpqGEM4fjLBeYRCwBN2H+sLaPlIqyGjpryonkbD96SWXxOG2ynuBMU0NmDxUNndbC
         Wq6skC0EiO/NwaPu+t0HjyUy8w19hmsvVXWfQpjVlAqxq7Bz7vwWcXICe6IlDiGEh7x/
         9pCKBAcKjmnGlSA5q41eeUKEWPu9aJ3q+z/6PeHyCXEV6SACbpxaILkFnCQ/aCSFz4py
         aQAqpHa/7VhjlWcbB0TsTUYRuVMNeHaD9xslAagXk9loldot8eJQKhMWNCqbN6QfdvM3
         abqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YnNvdEFO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13si12411647ybs.137.2020.07.28.08.11.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 08:11:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YnNvdEFO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0RGU-0001c7-Qe
	for alex.bennee@linaro.org; Tue, 28 Jul 2020 11:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k0REi-0006oE-4N
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 11:09:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20226
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k0REf-0007g6-Pb
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 11:09:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595948985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vauk46DRMEGSFIq9RbPTJR/RlmR9d200FI40z1XjTnI=;
 b=YnNvdEFOI6BAXlCipr2X1meZWjHWZaTmh1EywqmMdRfdy9YHNDUPm82Uvrw31HbQEraThh
 lFbZvfq3wd4/CRNYMGuIcmiStjvF6GpvFTHky2FFC7r4txKKX5ZXYEjFA2AE0mvB0b0lIF
 4wvPY5am3FQ/IuSUDi3wZGveopyQjlE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-gT-uNguvNrGw0ssUAdg3Mw-1; Tue, 28 Jul 2020 11:09:42 -0400
X-MC-Unique: gT-uNguvNrGw0ssUAdg3Mw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FE7D8C5062;
 Tue, 28 Jul 2020 15:09:40 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-203.ams2.redhat.com [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 858375C1BD;
 Tue, 28 Jul 2020 15:09:36 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com
Subject: [PATCH for-5.2 v4 05/11] hw/arm/smmu-common: Manage IOTLB block
 entries
Date: Tue, 28 Jul 2020 17:08:09 +0200
Message-Id: <20200728150815.11446-6-eric.auger@redhat.com>
In-Reply-To: <20200728150815.11446-1-eric.auger@redhat.com>
References: <20200728150815.11446-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 10:31:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jean-philippe@linaro.org, robh@kernel.org, robin.murphy@arm.com,
 mst@redhat.com, zhangfei.gao@foxmail.com, shameerali.kolothum.thodi@huawei.com,
 will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FXp0VSZ8MPKi

At the moment each entry in the IOTLB corresponds to a page sized
mapping (4K, 16K or 64K), even if the page belongs to a mapped
block. In case of block mapping this unefficiently consumes IOTLB
entries.

Change the value of the entry so that it reflects the actual
mapping it belongs to (block or page start address and size).

Also the level/tg of the entry is encoded in the key. In subsequent
patches we will enable range invalidation. This latter is able
to provide the level/tg of the entry.

Encoding the level/tg directly in the key will allow to invalidate
using g_hash_table_remove() when num_pages equals to 1.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v3 -> v4:
- also use the tg field when computing the hash
- in the key equal function, compare the fields instead of
  using memcmp()
- fixed a couple of indents
- added Peter's R-b

v2 -> v3:
- simplify the logic in smmu_hash_remove_by_asid_iova as
  suggested by Peter
- the key is a struct. We take into account the lvl in the
  jenkins hash function. Also the equal function is updated.

v1 -> v2:
- recompute starting_level
---
 hw/arm/smmu-internal.h       |  7 ++++
 include/hw/arm/smmu-common.h | 10 ++++--
 hw/arm/smmu-common.c         | 67 ++++++++++++++++++++++++++----------
 hw/arm/smmuv3.c              |  6 ++--
 hw/arm/trace-events          |  2 +-
 5 files changed, 67 insertions(+), 25 deletions(-)

diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
index 3104f768cd..55147f29be 100644
--- a/hw/arm/smmu-internal.h
+++ b/hw/arm/smmu-internal.h
@@ -97,4 +97,11 @@ uint64_t iova_level_offset(uint64_t iova, int inputsize,
 }
 
 #define SMMU_IOTLB_ASID(key) ((key).asid)
+
+typedef struct SMMUIOTLBPageInvInfo {
+    int asid;
+    uint64_t iova;
+    uint64_t mask;
+} SMMUIOTLBPageInvInfo;
+
 #endif
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 79c2c6486a..ece62c3652 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -97,6 +97,8 @@ typedef struct SMMUPciBus {
 typedef struct SMMUIOTLBKey {
     uint64_t iova;
     uint16_t asid;
+    uint8_t tg;
+    uint8_t level;
 } SMMUIOTLBKey;
 
 typedef struct SMMUState {
@@ -159,12 +161,14 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
 
 #define SMMU_IOTLB_MAX_SIZE 256
 
-SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg, hwaddr iova);
+SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
+                                SMMUTransTableInfo *tt, hwaddr iova);
 void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *entry);
-SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint64_t iova);
+SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint64_t iova,
+                                uint8_t tg, uint8_t level);
 void smmu_iotlb_inv_all(SMMUState *s);
 void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
-void smmu_iotlb_inv_iova(SMMUState *s, uint16_t asid, dma_addr_t iova);
+void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova);
 
 /* Unmap the range of all the notifiers registered to any IOMMU mr */
 void smmu_inv_notifiers_all(SMMUState *s);
diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 398e958bb4..2922deec6f 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -39,7 +39,7 @@ static guint smmu_iotlb_key_hash(gconstpointer v)
 
     /* Jenkins hash */
     a = b = c = JHASH_INITVAL + sizeof(*key);
-    a += key->asid;
+    a += key->asid + key->level + key->tg;
     b += extract64(key->iova, 0, 32);
     c += extract64(key->iova, 32, 32);
 
@@ -51,24 +51,41 @@ static guint smmu_iotlb_key_hash(gconstpointer v)
 
 static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
 {
-    const SMMUIOTLBKey *k1 = v1;
-    const SMMUIOTLBKey *k2 = v2;
+    SMMUIOTLBKey *k1 = (SMMUIOTLBKey *)v1, *k2 = (SMMUIOTLBKey *)v2;
 
-    return (k1->asid == k2->asid) && (k1->iova == k2->iova);
+    return (k1->asid == k2->asid) && (k1->iova == k2->iova) &&
+           (k1->level == k2->level) && (k1->tg == k2->tg);
 }
 
-SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint64_t iova)
+SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint64_t iova,
+                                uint8_t tg, uint8_t level)
 {
-    SMMUIOTLBKey key = {.asid = asid, .iova = iova};
+    SMMUIOTLBKey key = {.asid = asid, .iova = iova, .tg = tg, .level = level};
 
     return key;
 }
 
 SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
-                                hwaddr iova)
+                                SMMUTransTableInfo *tt, hwaddr iova)
 {
-    SMMUIOTLBKey key = smmu_get_iotlb_key(cfg->asid, iova);
-    SMMUTLBEntry *entry = g_hash_table_lookup(bs->iotlb, &key);
+    uint8_t tg = (tt->granule_sz - 10) / 2;
+    uint8_t inputsize = 64 - tt->tsz;
+    uint8_t stride = tt->granule_sz - 3;
+    uint8_t level = 4 - (inputsize - 4) / stride;
+    SMMUTLBEntry *entry = NULL;
+
+    while (level <= 3) {
+        uint64_t subpage_size = 1ULL << level_shift(level, tt->granule_sz);
+        uint64_t mask = subpage_size - 1;
+        SMMUIOTLBKey key;
+
+        key = smmu_get_iotlb_key(cfg->asid, iova & ~mask, tg, level);
+        entry = g_hash_table_lookup(bs->iotlb, &key);
+        if (entry) {
+            break;
+        }
+        level++;
+    }
 
     if (entry) {
         cfg->iotlb_hits++;
@@ -89,13 +106,14 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
 void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *new)
 {
     SMMUIOTLBKey *key = g_new0(SMMUIOTLBKey, 1);
+    uint8_t tg = (new->granule - 10) / 2;
 
     if (g_hash_table_size(bs->iotlb) >= SMMU_IOTLB_MAX_SIZE) {
         smmu_iotlb_inv_all(bs);
     }
 
-    *key = smmu_get_iotlb_key(cfg->asid, new->entry.iova);
-    trace_smmu_iotlb_insert(cfg->asid, new->entry.iova);
+    *key = smmu_get_iotlb_key(cfg->asid, new->entry.iova, tg, new->level);
+    trace_smmu_iotlb_insert(cfg->asid, new->entry.iova, tg, new->level);
     g_hash_table_insert(bs->iotlb, key, new);
 }
 
@@ -114,12 +132,26 @@ static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
     return SMMU_IOTLB_ASID(*iotlb_key) == asid;
 }
 
-inline void smmu_iotlb_inv_iova(SMMUState *s, uint16_t asid, dma_addr_t iova)
+static gboolean smmu_hash_remove_by_asid_iova(gpointer key, gpointer value,
+                                              gpointer user_data)
 {
-    SMMUIOTLBKey key = smmu_get_iotlb_key(asid, iova);
+    SMMUTLBEntry *iter = (SMMUTLBEntry *)value;
+    IOMMUTLBEntry *entry = &iter->entry;
+    SMMUIOTLBPageInvInfo *info = (SMMUIOTLBPageInvInfo *)user_data;
+    SMMUIOTLBKey iotlb_key = *(SMMUIOTLBKey *)key;
+
+    if (info->asid >= 0 && info->asid != SMMU_IOTLB_ASID(iotlb_key)) {
+        return false;
+    }
+    return (info->iova & ~entry->addr_mask) == entry->iova;
+}
+
+inline void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova)
+{
+    SMMUIOTLBPageInvInfo info = {.asid = asid, .iova = iova};
 
     trace_smmu_iotlb_inv_iova(asid, iova);
-    g_hash_table_remove(s->iotlb, &key);
+    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid_iova, &info);
 }
 
 inline void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
@@ -246,9 +278,6 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
     baseaddr = extract64(tt->ttb, 0, 48);
     baseaddr &= ~indexmask;
 
-    tlbe->entry.iova = iova;
-    tlbe->entry.addr_mask = (1 << granule_sz) - 1;
-
     while (level <= 3) {
         uint64_t subpage_size = 1ULL << level_shift(level, granule_sz);
         uint64_t mask = subpage_size - 1;
@@ -298,7 +327,9 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
             goto error;
         }
 
-        tlbe->entry.translated_addr = gpa + (iova & mask);
+        tlbe->entry.translated_addr = gpa;
+        tlbe->entry.iova = iova & ~mask;
+        tlbe->entry.addr_mask = mask;
         tlbe->entry.perm = PTE_AP_TO_PERM(ap);
         tlbe->level = level;
         tlbe->granule = granule_sz;
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index db74d27add..b717bde832 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -674,7 +674,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     page_mask = (1ULL << (tt->granule_sz)) - 1;
     aligned_addr = addr & ~page_mask;
 
-    cached_entry = smmu_iotlb_lookup(bs, cfg, aligned_addr);
+    cached_entry = smmu_iotlb_lookup(bs, cfg, tt, aligned_addr);
     if (cached_entry) {
         if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
             status = SMMU_TRANS_ERROR;
@@ -744,7 +744,7 @@ epilogue:
     case SMMU_TRANS_SUCCESS:
         entry.perm = flag;
         entry.translated_addr = cached_entry->entry.translated_addr +
-                                    (addr & page_mask);
+                                    (addr & cached_entry->entry.addr_mask);
         entry.addr_mask = cached_entry->entry.addr_mask;
         trace_smmuv3_translate_success(mr->parent_obj.name, sid, addr,
                                        entry.translated_addr, entry.perm);
@@ -972,7 +972,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
 
             trace_smmuv3_cmdq_tlbi_nh_vaa(vmid, addr);
             smmuv3_inv_notifiers_iova(bs, -1, addr);
-            smmu_iotlb_inv_all(bs);
+            smmu_iotlb_inv_iova(bs, -1, addr);
             break;
         }
         case SMMU_CMD_TLBI_NH_VA:
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index b808a1bfc1..f74d3e920f 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -16,7 +16,7 @@ smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=%d addr
 smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
 smmu_iotlb_lookup_hit(uint16_t asid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
 smmu_iotlb_lookup_miss(uint16_t asid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache MISS asid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
-smmu_iotlb_insert(uint16_t asid, uint64_t addr) "IOTLB ++ asid=%d addr=0x%"PRIx64
+smmu_iotlb_insert(uint16_t asid, uint64_t addr, uint8_t tg, uint8_t level) "IOTLB ++ asid=%d addr=0x%"PRIx64" tg=%d level=%d"
 
 # smmuv3.c
 smmuv3_read_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
-- 
2.21.3

