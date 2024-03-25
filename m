Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp597579ejj;
        Mon, 25 Mar 2024 03:15:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+D4YrpwB2OEoHk3sLgJXu+xNvSt1u7MYoVTLxwq33fgk+YqwZzijxLezIHgzn3VarF2dpt/Cs39riRC9tI0Qk/qHp3TBD
X-Received: by 2002:a25:ae4c:0:b0:dc6:cc35:35e9 with SMTP id g12-20020a25ae4c000000b00dc6cc3535e9mr4738786ybe.35.1711361720530;
        Mon, 25 Mar 2024 03:15:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711361720; cv=none;
        d=google.com; s=arc-20160816;
        b=jCWenZCNX38Pl+c425n+69gXPHkPEu7AsLQa74Jt8W8DhzyhPNKYB3SFFf4phcELa2
         z17lU6lEYMVbdYZCeN1PX6vkmb1CfUMd21aJaNcR8rz4Ody+9cK362ntEo66InOrEAUC
         m3eQ591LMsiCaxEfT2jbzKhFazhs5n0/qI5pRZ9nFJuWlKDBHaWw7GOfhZZBetiySzmh
         KtZbEWp1V+35HANF4UKdLzhun2IUWunBgNJXIJrva3WX2UtzGfES03IxxlIw6lYc7qae
         5UqgYJm/+3jW5QUxdemCnzbFzl+c6wRQeFh5C/99cs6PkPof17bESqA595P0GAWN1IQW
         2Rvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=fSN09FPbbiwAOPaRrzotNJWTUCQMS1xWJ+mdnnfOvl0=;
        fh=pjQLF3ehq0u7LEYDhFpdFTFUY83gQEasnfrb7lkqCeg=;
        b=ULxonXUxIBmu8pMs8rkE5s4+tr4+4Ed/OJdQhsqi/xLgr5YL0152p4hmkO8ISTQilJ
         kkOH6wytEMl4GsZxohE3tHmttyKR4snt1bnF6owmgTao3KZW9ZdVSRnb228h8Sjc9KXY
         N47NSNBqi5vJsvVzuN3TsI8sS5F/lDTw+8VLrdO3N0VbXC7oCLzkC1Bl3Bkg42c8ODjY
         AZNyTb/+/KUJ/eYgQS5l4QDPPwBvIRO6jeLuHRKw2dyd5J6QwFR8eJrEuzLfh+M4nS0E
         oYyVHlZ1Z60FE66QjmcVwvbZouvvFkOoHL+oh6IRmIi3GRfJNWOVg/CGZNZnDZ0AVjaE
         jzoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Sbwrpjk+;
       spf=pass (google.com: domain of 3t04bzggkc5ac68cduzu08805y.w86u5yh.vy77yy527ub8.8b0@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3t04BZggKC5AC68CDuzu08805y.w86u5yH.vy77yy527uB8.8B0@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3t04BZggKC5AC68CDuzu08805y.w86u5yH.vy77yy527uB8.8B0@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id r14-20020a25ac4e000000b00dd10ebcc7ccsor2226925ybd.16.2024.03.25.03.15.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Mar 2024 03:15:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3t04bzggkc5ac68cduzu08805y.w86u5yh.vy77yy527ub8.8b0@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Sbwrpjk+;
       spf=pass (google.com: domain of 3t04bzggkc5ac68cduzu08805y.w86u5yh.vy77yy527ub8.8b0@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3t04BZggKC5AC68CDuzu08805y.w86u5yH.vy77yy527uB8.8B0@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711361720; x=1711966520; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fSN09FPbbiwAOPaRrzotNJWTUCQMS1xWJ+mdnnfOvl0=;
        b=Sbwrpjk+7zeovXClhOxDwqGx3KJXRgxvE98FmMJe1HDPWw9+WIIzh7hMylo6xBlAnt
         4WHhLWT7Z3ccKZb05OEurQsHI65XyqsJAscXPmk93T74fRYNK6nd55/RcAXPSVaSnPP9
         MLSewmVxAYzYfjuA01pCB+lcn8PWaZbsRkWcT95wH9TBFd59we8C1eXqq31lnPBO5AZe
         MJ2/C3IVJq1xhWRklzY15irvF28kKQ63IEzpOXUf9rRsGY+iyXXZOkzgPLxIs0+uo6gO
         jDQWcLUDEkiVttYQhyb3lBVgQKqt6qc1fvYKFVvhPxGRKZjSkP5cXDkMwxM9YHz7fl4v
         advw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711361720; x=1711966520;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fSN09FPbbiwAOPaRrzotNJWTUCQMS1xWJ+mdnnfOvl0=;
        b=d4RH54eBoLeraF08QS5qRkoqBkp3oIt0/Cp+eeSY7C14lRN5L2/rWAkL0I6njm+iSa
         wRpp0trcVyS2zIB0OwCJnqj4oxHA9BkF9cUzw48GefOb2ljT1djvH/AW8mQMEEd89T8K
         gMs2H9WhGjnZ8SSlB62HQIa9Wr/kirIBRyB1iZYjU2JvUpGYXFJzYHkWPDdhpV+3t7F1
         +VDRImIcznw4D1znBeD6thJ/AbJNRSN9din4UjqSL0GoUz2xocMjIzyghUXId3OlW1C3
         MOwwW8rC2HjbnEVUaeTO2Auxgif8UzpyQOg5A4+NBTTdvQ6hh0wtkDLHPA8rGYblQudj
         fPdA==
X-Forwarded-Encrypted: i=1; AJvYcCVoeqsXdPhAekP6YODLeCOc07Gu+e9imH1/beQepdvHbW02A2a0JqQIGTw+7Xq9RKbXyaALJ9TeYRpQ+3l5Waj0rjVwWQzP
X-Gm-Message-State: AOJu0Yw1KhiK5n2I7Pklx9bCmvrcyOeLcJMxPkgosiTlx+yQncPL874b
	KwIoo901NYI74Uuo33qlQWrV45TodcG7UKlBsWt0s9WspC3UGQqlxTpuLOo9iQpDA2TJ5gRAleB
	V1yEdjASa6Q==
X-Google-Smtp-Source: AGHT+IEj8GCo+IbiANve4/bCNmi371BRoA/fg9TKCeM4M5PMW6xDcZ0z3SvSF5drxusLGLqWu1vRWpm0Sx4zgg==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:2508:b0:dc6:c2e4:5126 with SMTP
 id dt8-20020a056902250800b00dc6c2e45126mr2169190ybb.12.1711361719941; Mon, 25
 Mar 2024 03:15:19 -0700 (PDT)
Date: Mon, 25 Mar 2024 10:14:03 +0000
In-Reply-To: <20240325101442.1306300-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240325101442.1306300-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <20240325101442.1306300-8-smostafa@google.com>
Subject: [RFC PATCH 07/12] hw/arm/smmu-common: Support nested translation
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: zVgFDmoL05or

When nested translation is requested, we need  to do:

- Translate stage-1 IPA using stage-2 to a physical address.
- Translate stage-1 PTW walks using stage-2.
- Combine both to create a single TLB entry

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c         | 135 ++++++++++++++++++++++++++++-------
 hw/arm/trace-events          |   2 +-
 include/hw/arm/smmu-common.h |   3 +-
 3 files changed, 113 insertions(+), 27 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index f0905c28cf..da8776ecec 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -119,7 +119,7 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *new)
     *key = smmu_get_iotlb_key(cfg->asid, cfg->s2cfg.vmid, new->entry.iova,
                               tg, new->level, stage_tag);
     trace_smmu_iotlb_insert(cfg->asid, cfg->s2cfg.vmid, new->entry.iova,
-                            tg, new->level, stage_tag);
+                            tg, new->level, new->entry.addr_mask, stage_tag);
     g_hash_table_insert(bs->iotlb, key, new);
 }
 
@@ -305,6 +305,27 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
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
@@ -320,7 +341,8 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
  */
 static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
                           dma_addr_t iova, IOMMUAccessFlags perm,
-                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
+                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info,
+                          SMMUState *bs)
 {
     dma_addr_t baseaddr, indexmask;
     SMMUStage stage = cfg->stage;
@@ -368,6 +390,10 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
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
@@ -403,7 +429,7 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
         tlbe->entry.translated_addr = gpa;
         tlbe->entry.iova = iova & ~mask;
         tlbe->entry.addr_mask = mask;
-        tlbe->entry.perm = PTE_AP_TO_PERM(ap);
+        tlbe->parent_perm = tlbe->entry.perm = PTE_AP_TO_PERM(ap);
         tlbe->level = level;
         tlbe->granule = granule_sz;
         return 0;
@@ -412,6 +438,7 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
 
 error:
     info->stage = SMMU_STAGE_1;
+error_no_stage:
     tlbe->entry.perm = IOMMU_NONE;
     return -EINVAL;
 }
@@ -524,7 +551,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
         tlbe->entry.translated_addr = gpa;
         tlbe->entry.iova = ipa & ~mask;
         tlbe->entry.addr_mask = mask;
-        tlbe->entry.perm = s2ap;
+        tlbe->parent_perm = tlbe->entry.perm = s2ap;
         tlbe->level = level;
         tlbe->granule = granule_sz;
         return 0;
@@ -537,6 +564,35 @@ error:
     return -EINVAL;
 }
 
+/* Combine 2 TLB enteries and return in tlbe. */
+static void combine_tlb(SMMUTLBEntry *tlbe, SMMUTLBEntry *tlbe_s2,
+                        dma_addr_t iova, SMMUTransCfg *cfg)
+{
+        if (cfg->stage == SMMU_NESTED) {
+
+            /*
+             * tg and level are used from stage-1, while the addr mask can be
+             * smaller in case stage-2 size(based on granule and level) was
+             * smaller than stage-1.
+             * That should have no impact on:
+             * - lookup: as iova is properly aligned with the stage-1 level and
+             *   granule.
+             * - Invalidation: as it uses the entry mask.
+             */
+            tlbe->entry.addr_mask = MIN(tlbe->entry.addr_mask,
+                                        tlbe_s2->entry.addr_mask);
+            tlbe->entry.translated_addr = CACHED_ENTRY_TO_ADDR(tlbe_s2,
+                                          tlbe->entry.translated_addr);
+
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
@@ -549,28 +605,59 @@ error:
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
+
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
+    }
 
-        return smmu_ptw_64_s2(cfg, iova, perm, tlbe, info);
+    if (cfg->stage & SMMU_STAGE_2) {
+        ret = smmu_ptw_64_s2(cfg, ipa, perm, &tlbe_s2, info);
+        if (ret) {
+            return ret;
+        }
+        combine_tlb(tlbe, &tlbe_s2, iova, cfg);
     }
 
-    g_assert_not_reached();
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
@@ -614,16 +701,14 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
 
     cached_entry = smmu_iotlb_lookup(bs, cfg, &tt_combined, aligned_addr);
     if (cached_entry) {
-        if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
-            info->type = SMMU_PTW_ERR_PERMISSION;
-            info->stage = SMMU_STAGE_TO_TLB_TAG(cfg->stage);
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
index 34b10af83f..215df91ea3 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -18,7 +18,7 @@ smmu_iotlb_inv_stage(int stage) "Stage invalidate stage=%d"
 smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
 smmu_iotlb_lookup_hit(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
 smmu_iotlb_lookup_miss(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache MISS asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
-smmu_iotlb_insert(uint16_t asid, uint16_t vmid, uint64_t addr, uint8_t tg, uint8_t level, int stage) "IOTLB ++ asid=%d vmid=%d addr=0x%"PRIx64" tg=%d level=%d stage=%d"
+smmu_iotlb_insert(uint16_t asid, uint16_t vmid, uint64_t addr, uint8_t tg, uint8_t level, uint64_t mask, int stage) "IOTLB ++ asid=%d vmid=%d addr=0x%"PRIx64" tg=%d level=%d mask=0x%"PRIx64" stage=%d"
 
 # smmuv3.c
 smmuv3_read_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index c0969e461d..4f9505d91c 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -91,6 +91,7 @@ typedef struct SMMUTLBEntry {
     IOMMUTLBEntry entry;
     uint8_t level;
     uint8_t granule;
+    IOMMUAccessFlags parent_perm;
 } SMMUTLBEntry;
 
 /* Stage-2 configuration. */
@@ -199,7 +200,7 @@ static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
  * pair, according to @cfg translation config
  */
 int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
-             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info);
+             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info, SMMUState *bs);
 
 
 /* smmu_translate - Look for a translation in TLB, if not, do a PTW. */
-- 
2.44.0.396.g6e790dbe36-goog
