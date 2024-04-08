Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1293710ejh;
        Mon, 8 Apr 2024 07:09:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVyqQEHMcMaSBozXcY6W9F6BZiUp6PMP1j+B4JyHa0MkWPuoIskne7Ec7N2LxsomuUGwiO/zJ56D6cTY+0w8+eS/P42ySKn
X-Received: by 2002:a81:4911:0:b0:615:3b4a:5c9b with SMTP id w17-20020a814911000000b006153b4a5c9bmr8035250ywa.31.1712585352485;
        Mon, 08 Apr 2024 07:09:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712585352; cv=none;
        d=google.com; s=arc-20160816;
        b=wpaFghSZlOrdN2gnWrkyZKVSl17UzGPN+ffbNTirjuBF54Sygag59dHsYUO90mpoXv
         q21LudiomaB4A8tTd6D4l6/07u93C7wT3NK5RterDEcQTqzHoh7Ne6f5tKDkwl1lSajf
         w1+Xut7MmZ2UW/F/sQgglYJP6FkUcE+rpAl6k4B5se8/sNbJeLJpevakvnf6lW42HR0d
         quID4kTDK50nhiOlIHxtyeWmQWk68zTa4pB7FR84z1z/AELMZX1CuItaz3+RawvAwjEM
         RQ6zmdM2/+06tzlwWW725d0vnebRuBmzuQ8Bw2pNgo+s5cmNMCXniXsKhwmqBmVGI6dn
         cSHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=pSWfvyeD9wqAqTJ3MFH1nt/3AYPAupNlsKJNXIiWPoY=;
        fh=HcumTEkg1DKxf5dJADGR/ix98B5yvfk2uaLCnuzzvXo=;
        b=wiUC2tZMKWbZsxBMteqqIJIdHCRg/oePQaJrcdd58V9peDZCtVkDnUc9QJwxNHO8ha
         ziuXRP1rKyyA3N1VALuBlb58Yl3KcDt0sOFgLa92lTbun+kyR68D/88XncKksbXJ5nLk
         aVHkPezv/nIb42gnWSTjSiKQV/XjqBmRfFfbR5vViH9vdwyUT9GotOxd4l2OVaSYn5r/
         yaLd27s+/eAokM6nH7etnFEQm+Y1O9Iw5sAbMYeFpRIAWSTRUt7sfelU1AEt4lVd2S6F
         RdbL8qTrdKQuSQe3BHxqNJN0aAGnEohzTXhYQm2GkC9YezJGFtSuUySbQ5s86EDFUo1A
         G34Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="xMw/sHCt";
       spf=pass (google.com: domain of 3ipotzggkcwuxrtxyfkflttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3iPoTZggKCwUxrtxyfkflttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3iPoTZggKCwUxrtxyfkflttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id t139-20020a0dea91000000b00617f92531e9sor1932258ywe.14.2024.04.08.07.09.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 08 Apr 2024 07:09:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3ipotzggkcwuxrtxyfkflttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="xMw/sHCt";
       spf=pass (google.com: domain of 3ipotzggkcwuxrtxyfkflttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3iPoTZggKCwUxrtxyfkflttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712585352; x=1713190152; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pSWfvyeD9wqAqTJ3MFH1nt/3AYPAupNlsKJNXIiWPoY=;
        b=xMw/sHCtLMgBeEwJKq8gkiKh79lz/KFQrslIRaI/fOGVyniVTs8WmezFiWzJbYLES9
         Nn6FvkApwc0NvzjWuMRzVpO4IHqtV5YWeU/QEtEcOnQqY+9RV3I53r4JNzBEwvXdABR5
         w3dyJgWSXEtijN7/KX6HlTpQNKzVmfGc1ZqqlgqYGOvNjBQYL9eaIssWUYSooPtI20rx
         MDXMtvJ7CeLgtoo7ZJi+iSdVnSJb3vBdPoFafoVjpv8K/2PhT9PM7PNMY44XwR9jcMrg
         xlm3Lt4S/GHy+KSS/vjgu7Ph/f3dRwt1J4oznxJxcld0JaGyFfpyYMSuaj9UlQ0JRPCu
         IQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712585352; x=1713190152;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pSWfvyeD9wqAqTJ3MFH1nt/3AYPAupNlsKJNXIiWPoY=;
        b=bsvmdI9P3kujiOlw65B3Sa8ECH9mxkmmfD+SKjAw3fxgDDmMSgIme/3u4fqzTRmhY6
         FFQoDUsiQeo+nzn8g83lBw53ytnTT6ObrFK0VOwMk3rY7jvKFx3sFlmGnIwGxaC3MmgR
         MqJa4TBtp6rtF4iRqzU24OGhXUuVIbx+TpgAF1x6PfVRor2wqZuTLgtvuSosCHHjntFc
         lHIUwHTKcXHaef1VguNp0WU0SuRSbzrkTEHtm304Ot72JfEqLigtW5jAvJYs3HYgbbF1
         LNz1zl4E1IWTm1NTmllfu2UvVqcl+eH2+sDtO7svYCoGw8VMHIISZIpkgZeVnSi0koyb
         0+0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhgKfKb4rLqjdbW33HK0UIqDBY99LN+0iyEuILDOkJrIwtuDrI7D3qlZkmTYy5cUbjPEP5gEOrPExmeaNi7xNebuZ8lPas
X-Gm-Message-State: AOJu0YzdMMkvqx6AzjjlToX/o/rGo3aR75DZxzUN02njd22DYf6gRxdC
	5PfWyqDKTZrNgLxJVomVFlNnKX3A5n5BL4GH45KVqTCYK5vCk65GqrK4Ii4OER+XTz9GRdMfG2N
	hCVFw65s5aQ==
X-Google-Smtp-Source: AGHT+IGQhJCW8NjJVYYTyicGFaMV/HaF215cmoReg9wzzwTkSSgmcm6tgikjeDqiUO+zwlnBKPv9BNBhl03aqA==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:1508:b0:dcc:e1a6:aca9 with SMTP
 id q8-20020a056902150800b00dcce1a6aca9mr2790949ybu.9.1712585352082; Mon, 08
 Apr 2024 07:09:12 -0700 (PDT)
Date: Mon,  8 Apr 2024 14:08:10 +0000
In-Reply-To: <20240408140818.3799590-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240408140818.3799590-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240408140818.3799590-6-smostafa@google.com>
Subject: [RFC PATCH v2 05/13] hw/arm/smmu-common: Support nested translation
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: pr8qDJFxCuGt

When nested translation is requested, do the following:

- Translate stage-1 IPA using stage-2 to a physical address.
- Translate stage-1 PTW walks using stage-2.
- Combine both to create a single TLB entry, for that we choose
  the smallest entry to cache, which means that if the smallest
  entry comes from stage-2, and stage-2 use different granule,
  TLB lookup for stage-1 (in nested config) will always miss.
  Lookup logic is modified for nesting to lookup using stage-2
  granule if stage-1 granule missed and they are different.

Also, add more visibility in trace points, to make it easier to debug.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c         | 153 ++++++++++++++++++++++++++++-------
 hw/arm/trace-events          |   6 +-
 include/hw/arm/smmu-common.h |   3 +-
 3 files changed, 131 insertions(+), 31 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 771b9c79a3..2cf27b490b 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -66,8 +66,10 @@ SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
     return key;
 }
 
-SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
-                                SMMUTransTableInfo *tt, hwaddr iova)
+static SMMUTLBEntry *smmu_iotlb_lookup_all_levels(SMMUState *bs,
+                                                  SMMUTransCfg *cfg,
+                                                  SMMUTransTableInfo *tt,
+                                                  hwaddr iova)
 {
     uint8_t tg = (tt->granule_sz - 10) / 2;
     uint8_t inputsize = 64 - tt->tsz;
@@ -88,10 +90,29 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
         }
         level++;
     }
+    return entry;
+}
+
+SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
+                                SMMUTransTableInfo *tt, hwaddr iova)
+{
+    SMMUTLBEntry *entry = NULL;
+
+    entry = smmu_iotlb_lookup_all_levels(bs, cfg, tt, iova);
+    /*
+     * For nested translation also use the s2 granule, as the TLB will insert
+     * the smallest of both, so the entry can be cached with the s2 granule.
+     */
+    if (!entry && (cfg->stage == SMMU_NESTED) &&
+        (cfg->s2cfg.granule_sz != tt->granule_sz)) {
+        tt->granule_sz = cfg->s2cfg.granule_sz;
+        entry = smmu_iotlb_lookup_all_levels(bs, cfg, tt, iova);
+    }
 
     if (entry) {
         cfg->iotlb_hits++;
         trace_smmu_iotlb_lookup_hit(cfg->asid, cfg->s2cfg.vmid, iova,
+                                    entry->entry.addr_mask,
                                     cfg->iotlb_hits, cfg->iotlb_misses,
                                     100 * cfg->iotlb_hits /
                                     (cfg->iotlb_hits + cfg->iotlb_misses));
@@ -117,7 +138,7 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *new)
     *key = smmu_get_iotlb_key(cfg->asid, cfg->s2cfg.vmid, new->entry.iova,
                               tg, new->level);
     trace_smmu_iotlb_insert(cfg->asid, cfg->s2cfg.vmid, new->entry.iova,
-                            tg, new->level);
+                            tg, new->level, new->entry.translated_addr);
     g_hash_table_insert(bs->iotlb, key, new);
 }
 
@@ -286,6 +307,27 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
     return NULL;
 }
 
+/* Return the correct table address based on configuration. */
+static inline int translate_table_s1(dma_addr_t *table_addr, SMMUTransCfg *cfg,
+                                     SMMUPTWEventInfo *info, SMMUState *bs)
+{
+    dma_addr_t addr = *table_addr;
+    SMMUTLBEntry *cached_entry;
+
+    if (cfg->stage != SMMU_NESTED) {
+        return 0;
+    }
+
+    CALL_FUNC_CFG_S2(cfg, cached_entry, smmu_translate,
+                     bs, cfg, addr, IOMMU_RO, info);
+
+    if (cached_entry) {
+        *table_addr = CACHED_ENTRY_TO_ADDR(cached_entry, addr);
+        return 0;
+    }
+    return -EINVAL;
+}
+
 /**
  * smmu_ptw_64_s1 - VMSAv8-64 Walk of the page tables for a given IOVA
  * @cfg: translation config
@@ -301,7 +343,8 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
  */
 static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
                           dma_addr_t iova, IOMMUAccessFlags perm,
-                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
+                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info,
+                          SMMUState *bs)
 {
     dma_addr_t baseaddr, indexmask;
     SMMUStage stage = cfg->stage;
@@ -349,6 +392,10 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
                 goto error;
             }
             baseaddr = get_table_pte_address(pte, granule_sz);
+            /* In case of failure, retain stage-2 fault. */
+            if (translate_table_s1(&baseaddr, cfg, info, bs)) {
+                goto error_no_stage;
+            }
             level++;
             continue;
         } else if (is_page_pte(pte, level)) {
@@ -384,7 +431,7 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
         tlbe->entry.translated_addr = gpa;
         tlbe->entry.iova = iova & ~mask;
         tlbe->entry.addr_mask = mask;
-        tlbe->entry.perm = PTE_AP_TO_PERM(ap);
+        tlbe->parent_perm = tlbe->entry.perm = PTE_AP_TO_PERM(ap);
         tlbe->level = level;
         tlbe->granule = granule_sz;
         return 0;
@@ -393,6 +440,7 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
 
 error:
     info->stage = SMMU_STAGE_1;
+error_no_stage:
     tlbe->entry.perm = IOMMU_NONE;
     return -EINVAL;
 }
@@ -505,7 +553,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
         tlbe->entry.translated_addr = gpa;
         tlbe->entry.iova = ipa & ~mask;
         tlbe->entry.addr_mask = mask;
-        tlbe->entry.perm = s2ap;
+        tlbe->parent_perm = tlbe->entry.perm = s2ap;
         tlbe->level = level;
         tlbe->granule = granule_sz;
         return 0;
@@ -518,6 +566,28 @@ error:
     return -EINVAL;
 }
 
+/* Combine 2 TLB enteries and return in tlbe. */
+static void combine_tlb(SMMUTLBEntry *tlbe, SMMUTLBEntry *tlbe_s2,
+                        dma_addr_t iova, SMMUTransCfg *cfg)
+{
+        if (cfg->stage == SMMU_NESTED) {
+            tlbe->entry.addr_mask = MIN(tlbe->entry.addr_mask,
+                                        tlbe_s2->entry.addr_mask);
+            tlbe->entry.translated_addr = CACHED_ENTRY_TO_ADDR(tlbe_s2,
+                                          tlbe->entry.translated_addr);
+
+            tlbe->granule = MIN(tlbe->granule, tlbe_s2->granule);
+            tlbe->level = MAX(tlbe->level, tlbe_s2->level);
+            tlbe->entry.iova = iova & ~tlbe->entry.addr_mask;
+            /* parent_perm has s2 perm while perm has s1 perm. */
+            tlbe->parent_perm = tlbe_s2->entry.perm;
+            return;
+        }
+
+        /* That was not nested, use the s2. */
+        memcpy(tlbe, tlbe_s2, sizeof(*tlbe));
+}
+
 /**
  * smmu_ptw - Walk the page tables for an IOVA, according to @cfg
  *
@@ -530,28 +600,59 @@ error:
  * return 0 on success
  */
 int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
-             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
+             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info, SMMUState *bs)
 {
-    if (cfg->stage == SMMU_STAGE_1) {
-        return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
-    } else if (cfg->stage == SMMU_STAGE_2) {
-        /*
-         * If bypassing stage 1(or unimplemented), the input address is passed
-         * directly to stage 2 as IPA. If the input address of a transaction
-         * exceeds the size of the IAS, a stage 1 Address Size fault occurs.
-         * For AA64, IAS = OAS according to (IHI 0070.E.a) "3.4 Address sizes"
-         */
-        if (iova >= (1ULL << cfg->oas)) {
-            info->type = SMMU_PTW_ERR_ADDR_SIZE;
-            info->stage = SMMU_STAGE_1;
-            tlbe->entry.perm = IOMMU_NONE;
-            return -EINVAL;
+    int ret = 0;
+    SMMUTLBEntry tlbe_s2;
+    dma_addr_t ipa = iova;
+
+    if (cfg->stage & SMMU_STAGE_1) {
+        ret = smmu_ptw_64_s1(cfg, iova, perm, tlbe, info, bs);
+        if (ret) {
+            return ret;
         }
+        /* This is the IPA for next stage.*/
+        ipa = CACHED_ENTRY_TO_ADDR(tlbe, iova);
+    }
 
-        return smmu_ptw_64_s2(cfg, iova, perm, tlbe, info);
+    /*
+     * The address output from the translation causes a stage 1 Address Size
+     * fault if it exceeds the range of the effective IPA size for the given CD.
+     * If bypassing stage 1(or unimplemented), the input address is passed
+     * directly to stage 2 as IPA. If the input address of a transaction
+     * exceeds the size of the IAS, a stage 1 Address Size fault occurs.
+     * For AA64, IAS = OAS according to (IHI 0070.E.a) "3.4 Address sizes"
+     */
+    if (ipa >= (1ULL << cfg->oas)) {
+        info->type = SMMU_PTW_ERR_ADDR_SIZE;
+        info->stage = SMMU_STAGE_1;
+        tlbe->entry.perm = IOMMU_NONE;
+        return -EINVAL;
     }
 
-    g_assert_not_reached();
+    if (cfg->stage & SMMU_STAGE_2) {
+        ret = smmu_ptw_64_s2(cfg, ipa, perm, &tlbe_s2, info);
+        if (ret) {
+            return ret;
+        }
+        combine_tlb(tlbe, &tlbe_s2, iova, cfg);
+    }
+
+    return ret;
+}
+
+static int validate_tlb_entry(SMMUTLBEntry *cached_entry, IOMMUAccessFlags flag,
+                              SMMUPTWEventInfo *info)
+{
+        if ((flag & IOMMU_WO) && !(cached_entry->entry.perm &
+            cached_entry->parent_perm & IOMMU_WO)) {
+            info->type = SMMU_PTW_ERR_PERMISSION;
+            info->stage = !(cached_entry->entry.perm & IOMMU_WO) ?
+                          SMMU_STAGE_1 :
+                          SMMU_STAGE_2;
+            return -EINVAL;
+        }
+        return 0;
 }
 
 SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
@@ -595,16 +696,14 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
 
     cached_entry = smmu_iotlb_lookup(bs, cfg, &tt_combined, aligned_addr);
     if (cached_entry) {
-        if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
-            info->type = SMMU_PTW_ERR_PERMISSION;
-            info->stage = cfg->stage;
+        if (validate_tlb_entry(cached_entry, flag, info)) {
             return NULL;
         }
         return cached_entry;
     }
 
     cached_entry = g_new0(SMMUTLBEntry, 1);
-    status = smmu_ptw(cfg, aligned_addr, flag, cached_entry, info);
+    status = smmu_ptw(cfg, aligned_addr, flag, cached_entry, info, bs);
     if (status) {
             g_free(cached_entry);
             return NULL;
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index cc12924a84..5f23f0b963 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -15,9 +15,9 @@ smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=%d"
 smmu_iotlb_inv_vmid(uint16_t vmid) "IOTLB invalidate vmid=%d"
 smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
 smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
-smmu_iotlb_lookup_hit(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
-smmu_iotlb_lookup_miss(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache MISS asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
-smmu_iotlb_insert(uint16_t asid, uint16_t vmid, uint64_t addr, uint8_t tg, uint8_t level) "IOTLB ++ asid=%d vmid=%d addr=0x%"PRIx64" tg=%d level=%d"
+smmu_iotlb_lookup_hit(int asid, uint16_t vmid, uint64_t addr, uint64_t mask, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d vmid=%d addr=0x%"PRIx64" mask=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
+smmu_iotlb_lookup_miss(int asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache MISS asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
+smmu_iotlb_insert(int asid, uint16_t vmid, uint64_t addr, uint8_t tg, uint8_t level, uint64_t translate_addr) "IOTLB ++ asid=%d vmid=%d addr=0x%"PRIx64" tg=%d level=%d translate_addr=0x%"PRIx64
 
 # smmuv3.c
 smmuv3_read_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 2772175115..03ff0f02ba 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -91,6 +91,7 @@ typedef struct SMMUTLBEntry {
     IOMMUTLBEntry entry;
     uint8_t level;
     uint8_t granule;
+    IOMMUAccessFlags parent_perm;
 } SMMUTLBEntry;
 
 /* Stage-2 configuration. */
@@ -198,7 +199,7 @@ static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
  * pair, according to @cfg translation config
  */
 int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
-             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info);
+             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info, SMMUState *bs);
 
 
 /*
-- 
2.44.0.478.gd926399ef9-goog
