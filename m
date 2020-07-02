Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1598162lfm;
        Thu, 2 Jul 2020 08:42:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmESQsi4ZNngxM6Q+1xJcw2GPU28lA7JH0oepFqvHYhr73qVqa0wTWNU9R5KDcr0vSMTA+
X-Received: by 2002:a25:e8b:: with SMTP id 133mr50940940ybo.102.1593704528909;
        Thu, 02 Jul 2020 08:42:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593704528; cv=none;
        d=google.com; s=arc-20160816;
        b=Hbfuj9XbxFfEXeBCxes1YCMqiTd58ZfkU/8RnkHCruLTwR93ULshKNIrxZbMpV8UO4
         gtvvlbUSTmkhxUcw028hXdeuRHX8fiG/D4gbf1XCVUyWwB+JM9ApBdZnylmgtKVyMOBp
         b852RhfhvfIH04GNLsOzlkdnwyFbFl4KP04uJE2fsZ1wp5DHjL4V0UPYA8ay4yq7MlYj
         BdG1T+U0BRlcrNAN1yZxfwCX455gWq3QhSiFQ4CBEu0tzTbJPKZM3Deud1vnQth2r9aI
         PJ/IcjoiqyJx1umyEvxxpYp8unD5bDYhk8TofWbijMVRfmsAu3Hyw0IrlzkRx6PQcmvH
         cRNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NUydCa7fctjP7th4rUdELWWUxIDOm37IGdKZttAnbB8=;
        b=rinBqlwsa3/GGMamiyDb1cYZCysBLOB0zU4H/lzABlEWBQtw+kVBV2azbcmncTuM1/
         1tzAJ5uY5r838sbnU5v7vz3MHH+FRq9oYew/+qI3E5CzwPJPzlGR5la39udLdh6CmElc
         5Hvn9YbqPVcO97HoDJVhO8fqVqN5yrWEqtpG66CaZChCVgMzpMSDf2Ka5bY7S6cB1UVH
         Sw/YIbQJPrNsUFe0xbIqwa2/YKjW5VWKkmcSjtXjHfT7cNQR6G+3g1ylMNQmQsGDuN6G
         3ySXcDiJ710E/fGD9RCSNQ8nObDy03G+Ynj97uOl7i/N8JD8lhQDpirLWamLp+UU5L6D
         qoZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="BLqvzB/S";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b68si9839787ybh.348.2020.07.02.08.42.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 08:42:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="BLqvzB/S";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jr1Lk-0007lW-8H
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 11:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jr17z-0001g8-C3
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 11:27:55 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:43030
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jr17w-0006SC-Hf
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 11:27:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593703671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NUydCa7fctjP7th4rUdELWWUxIDOm37IGdKZttAnbB8=;
 b=BLqvzB/Sir/fJ9kE5lTFpfeZFdsOzbkFiZx6gMGE/vayajH6gZwZhXWOKm19jqOAzvx5Z2
 aaGd0Du87ewQAQw/sPxe6yiySgf3HqtfjWdkVoiAu1TIeIqoxjK1WjtpNOxXW3N/Rzr3XQ
 /39058hWQ2e8nRYMZJjB5awgIL3f53I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-etfQ6FK0MaWgtFyW7ckfQQ-1; Thu, 02 Jul 2020 11:27:48 -0400
X-MC-Unique: etfQ6FK0MaWgtFyW7ckfQQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1AB5A0C00;
 Thu,  2 Jul 2020 15:27:46 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-70.ams2.redhat.com [10.36.112.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C63591D1;
 Thu,  2 Jul 2020 15:27:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com
Subject: [PATCH v2 6/9] hw/arm/smmu-common: Manage IOTLB block entries
Date: Thu,  2 Jul 2020 17:26:56 +0200
Message-Id: <20200702152659.8522-7-eric.auger@redhat.com>
In-Reply-To: <20200702152659.8522-1-eric.auger@redhat.com>
References: <20200702152659.8522-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:42:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: AYeeaObIhP3w

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

v1 -> v2:
- recompute starting_level
---
 hw/arm/smmu-internal.h       |  9 ++++++
 include/hw/arm/smmu-common.h |  8 +++--
 hw/arm/smmu-common.c         | 63 ++++++++++++++++++++++++++++--------
 hw/arm/smmuv3.c              |  6 ++--
 hw/arm/trace-events          |  2 +-
 5 files changed, 67 insertions(+), 21 deletions(-)

diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
index 2ecb6f1dc6..d57f5c05c2 100644
--- a/hw/arm/smmu-internal.h
+++ b/hw/arm/smmu-internal.h
@@ -97,7 +97,16 @@ uint64_t iova_level_offset(uint64_t iova, int inputsize,
 }
 
 #define SMMU_IOTLB_ASID_SHIFT  40
+#define SMMU_IOTLB_LEVEL_SHIFT 56
+#define SMMU_IOTLB_TG_SHIFT    58
 
 #define SMMU_IOTLB_ASID(key) (((key) >> SMMU_IOTLB_ASID_SHIFT) & 0xFFFF)
 #define SMMU_IOTLB_IOVA(key) (((key) & MAKE_64BIT_MASK(0, 40)) << 12)
+
+typedef struct SMMUIOTLBPageInvInfo {
+    int asid;
+    uint64_t iova;
+    uint64_t mask;
+} SMMUIOTLBPageInvInfo;
+
 #endif
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 0db4403e94..cc228b51b4 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -156,12 +156,14 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
 
 #define SMMU_IOTLB_MAX_SIZE 256
 
-SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg, hwaddr iova);
+SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
+                                SMMUTransTableInfo *tt, hwaddr iova);
 void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *entry);
-SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint64_t iova);
+SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint64_t iova,
+                               uint8_t tg, uint8_t level);
 void smmu_iotlb_inv_all(SMMUState *s);
 void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
-void smmu_iotlb_inv_iova(SMMUState *s, uint16_t asid, dma_addr_t iova);
+void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova);
 
 /* Unmap the range of all the notifiers registered to any IOMMU mr */
 void smmu_inv_notifiers_all(SMMUState *s);
diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index a3301e56e7..5c14127a24 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -42,16 +42,35 @@ static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
     return *((const uint64_t *)v1) == *((const uint64_t *)v2);
 }
 
-SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint64_t iova)
+SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint64_t iova,
+                               uint8_t tg, uint8_t level)
 {
-    return iova >> 12 | (uint64_t)(asid) << SMMU_IOTLB_ASID_SHIFT;
+    return iova >> 12 | (uint64_t)(asid) << SMMU_IOTLB_ASID_SHIFT |
+           (uint64_t)(level) << SMMU_IOTLB_LEVEL_SHIFT |
+           (uint64_t)(tg) << SMMU_IOTLB_TG_SHIFT;
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
@@ -72,13 +91,14 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
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
 
@@ -97,12 +117,28 @@ static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
     return SMMU_IOTLB_ASID(*iotlb_key) == asid;
 }
 
-inline void smmu_iotlb_inv_iova(SMMUState *s, uint16_t asid, dma_addr_t iova)
+static gboolean smmu_hash_remove_by_asid_iova(gpointer key, gpointer value,
+                                         gpointer user_data)
 {
-    SMMUIOTLBKey key = smmu_get_iotlb_key(asid, iova);
+    SMMUTLBEntry *iter = (SMMUTLBEntry *)value;
+    IOMMUTLBEntry *entry = &iter->entry;
+    SMMUIOTLBPageInvInfo *info = (SMMUIOTLBPageInvInfo *)user_data;
+    uint64_t *iotlb_key = (uint64_t *)key;
+
+    if (info->asid >= 0) {
+        return (info->asid == SMMU_IOTLB_ASID(*iotlb_key)) &&
+                ((info->iova & ~entry->addr_mask) == entry->iova);
+    } else {
+        return (info->iova & ~entry->addr_mask) == entry->iova;
+    }
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
@@ -229,9 +265,6 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
     baseaddr = extract64(tt->ttb, 0, 48);
     baseaddr &= ~indexmask;
 
-    tlbe->entry.iova = iova;
-    tlbe->entry.addr_mask = (1 << granule_sz) - 1;
-
     while (level <= 3) {
         uint64_t subpage_size = 1ULL << level_shift(level, granule_sz);
         uint64_t mask = subpage_size - 1;
@@ -281,7 +314,9 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
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

