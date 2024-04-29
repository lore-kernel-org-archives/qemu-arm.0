Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp1931784ejb;
        Sun, 28 Apr 2024 20:24:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX2LA1+6tUDEGbn8Tdid/ze0rwl93usUHXDt0xAKa1a+3YmJdUVFn0UzZCai0M1RuVi9Ygcyzv6cxz8sh/HAW0Fod41awgE
X-Received: by 2002:a05:651c:2123:b0:2dc:b964:b15 with SMTP id a35-20020a05651c212300b002dcb9640b15mr6301678ljq.25.1714361095637;
        Sun, 28 Apr 2024 20:24:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714361095; cv=none;
        d=google.com; s=arc-20160816;
        b=ykLV/l3u4MQAIrQPZg682qTOAtb2f+sc+dH3O2L3DszJL2TZWnkn2ieJ+mSpyLz9QZ
         mxMJllh3pGdg3e22UwKO40XpvcSGs61HrjZvZVERmYrtsxZgNETgHgLOcsRMEt2N+vp1
         7DHTxptHxEJwcpw6BrGdHjRMYPgJGVtoQhIYQ4nqRQK3Liq9Bmpvwk1UpJHqTzL1tGkQ
         kGgM+TzcHIhiQhMT0l2rpob4w/C7Ec3WaIbMuALxAr7tq/6+nHJUaVmOE5/UpORu41AR
         uHKAnKUmtoTsSVRRJqJ6sA/zPpUIF5tTbunFf91hctz2iFSmmSepyQHfe48dAMdUyuD1
         G5pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=4DCf3/0y5iNAG3sQ+Ensu4vclHCTV4/Csx27RH2Mf/w=;
        fh=fjgYm7emi7E6LGw+emOYME1hkWKPSqYEy0ekh4QuWSA=;
        b=PY+4HTM1oqERPeAZwTryiBXIReodfKzr1stNbGbDauSCdBDZf29p9p4vy0CFv9/j06
         vfVEibgGc0sb9O357s4LOYNYJFKDSIsV8PJ/XZmx5VkeSGmKCgG9Ympt8pxJ1laBzH3E
         ghUwMjQBM/j8hGkD911rNlCYi1DHhziwtnee5mZTpYqK7l3rP0NSo0gndPO2Rf7RQLnH
         Mff8HDfariVGpRkBmBu6rgk5NcbNUhGs9RXdsWcU5vvbrwnPdGt83Kxs2vCzEpZqMEa5
         1aXfeYkFb3oJVja+LchejL7OrCOHrrvn6ZPc5htRpYY+GBBMD1FvUOkFdtkWqjoOF0tl
         ztpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=wy45L4Q2;
       spf=pass (google.com: domain of 3bxmvzggkcyiqkmqr8d8emmejc.amk8jcv.9cllccjgl8pm.mpe@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3BxMvZggKCyIQKMQR8D8EMMEJC.AMK8JCV.9CLLCCJGL8PM.MPE@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3BxMvZggKCyIQKMQR8D8EMMEJC.AMK8JCV.9CLLCCJGL8PM.MPE@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id n17-20020a7bcbd1000000b00416867e3d6esor9457551wmi.11.2024.04.28.20.24.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 28 Apr 2024 20:24:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3bxmvzggkcyiqkmqr8d8emmejc.amk8jcv.9cllccjgl8pm.mpe@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=wy45L4Q2;
       spf=pass (google.com: domain of 3bxmvzggkcyiqkmqr8d8emmejc.amk8jcv.9cllccjgl8pm.mpe@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3BxMvZggKCyIQKMQR8D8EMMEJC.AMK8JCV.9CLLCCJGL8PM.MPE@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714361095; x=1714965895; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4DCf3/0y5iNAG3sQ+Ensu4vclHCTV4/Csx27RH2Mf/w=;
        b=wy45L4Q2vXs1aPL6WvYu9VQLu7JCEqeelp+FupbOzgJNawBA2OTJVSnqM7aLNkmVAg
         n/TOtGr2G24wk9C7iEnB6p5li4M+aOOtuaLspXKCtosVcWyNwX64cZsjlxz3owUU9WXo
         gRIAVZHgHXaXp0pic3yr5VViJTwGu94TrdbmOUo9io8FT9cMX42okDR4YTxW6NU+HPRa
         H9SIQKeXUsFXO4g9wVb5GV2SUzyGMBV4zleaWSwF2GAwDRNzc0TfLnw/J7oMLrZmRhw0
         rKs5iltCxC6J912FX4yrtj9Po8mzXWIL17gOuPN74oaqeA5zA0D+GWyjfpiMpJVd5Zxt
         zQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714361095; x=1714965895;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4DCf3/0y5iNAG3sQ+Ensu4vclHCTV4/Csx27RH2Mf/w=;
        b=doLyHcNzTKmBXT+886AZotTBH89CRXXY1p1H1bbupMGJkro/mXFWn8A/bNn6zVlSH6
         3ChQBhCmNC4T4UnI7riEtToIXihjdUwDPMGgFFikXjhWeK5cbxC4QBOxgkJBKVazkXNt
         zJZ3cnsv9kMdzDCetpgpPWg2Z9iptojODfsoPrLzWE2d53NApq3cI53Qj7Ghg/sVI/h5
         DN8+UYafnzi0xmBKsGhaP7OwAjDpOZtSdtDsHPe3rYV2Uua9RgBJi5BZB0qyVtjxJZtp
         MaVZMu9S4hzlennMAi/vkd9vNDnOcu3dJkz2AF5f/hb1xXdtfcVOaDZOUoEb2VmsZqI0
         JAJw==
X-Forwarded-Encrypted: i=1; AJvYcCWp36g/dbRYDQQE9SgpErQFGNMTTYUajTq6MrUnPuN1U2jj8kCuMowGvPmOy8ILuYfsEZCABKbsTtb47woA1JG8zqfnbRG6
X-Gm-Message-State: AOJu0YxIgEihNYgWtdk/w7vyZ/U8qmGeufthG60eGiOeCW1J0gCWzrx5
	n0wukKTLKv/uXLFSCCo7C8vxOQ4xGB3w2O6W1wLM31STVQVZdqa+XH9Ldl2lOUaIyrAOCFLyRA2
	vcPfWdJWnTA==
X-Google-Smtp-Source: AGHT+IG4v8PHU0eSOLRDOK5EuqIpfDoj/wpK8XcWd8BJnZchGbsNWDX/3LQoyih3WdrJTTMwYCDlvUh3JICMpg==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:4f41:b0:41c:2c5c:6e1b with SMTP
 id m1-20020a05600c4f4100b0041c2c5c6e1bmr7966wmq.6.1714361095208; Sun, 28 Apr
 2024 20:24:55 -0700 (PDT)
Date: Mon, 29 Apr 2024 03:23:54 +0000
In-Reply-To: <20240429032403.74910-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240429032403.74910-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240429032403.74910-11-smostafa@google.com>
Subject: [RFC PATCH v3 10/18] hw/arm/smmu-common: Support nested translation
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: a6loVTMmAnLl

When nested translation is requested, do the following:

- Translate stage-1 IPA using stage-2 to a physical address.
- Translate stage-1 table walks using stage-2.
- Combine both to create a single TLB entry using the logic
  introduced before.

For stage-1 table translation, the spec (ARM IHI 0070 F.b) says in:
    7.3.12 F_WALK_EABT:
        Translation of an IPA for Stage 1 descriptor fetch:
	S2 == 1 (stage 2), CLASS == T
So, F_WALK_EABT is used which propagtes to CLASS == TT.

smmu_ptw() has a new argument SMMUState which include the TLB as
stage-1 table address can be cached in there.

Also in smmu_ptw() a separate path used for nesting to simplify the
code, although some logic can be combined.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c         | 67 ++++++++++++++++++++++++++++++------
 include/hw/arm/smmu-common.h |  2 +-
 2 files changed, 58 insertions(+), 11 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index c67af3bc6d..d48ec08947 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -306,6 +306,32 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
     return NULL;
 }
 
+/* Translate stage-1 table address using stage-2 page table. */
+static inline int translate_table_s1(dma_addr_t *table_addr, SMMUTransCfg *cfg,
+                                     SMMUPTWEventInfo *info, SMMUState *bs)
+{
+    dma_addr_t addr = *table_addr;
+    SMMUTLBEntry *cached_entry;
+    int asid;
+
+    asid = cfg->asid;
+    cfg->stage = SMMU_STAGE_2;
+    cfg->asid = -1;
+    cached_entry = smmu_translate(bs, cfg, addr, IOMMU_RO, info);
+    cfg->asid = asid;
+    cfg->stage = SMMU_NESTED;
+
+    if (cached_entry) {
+        *table_addr = CACHED_ENTRY_TO_ADDR(cached_entry, addr);
+        return 0;
+    }
+
+    info->stage = SMMU_STAGE_2;
+    info->type = SMMU_PTW_ERR_WALK_EABT;
+    info->addr = addr;
+    return -EINVAL;
+}
+
 /**
  * smmu_ptw_64_s1 - VMSAv8-64 Walk of the page tables for a given IOVA
  * @cfg: translation config
@@ -321,7 +347,8 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
  */
 static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
                           dma_addr_t iova, IOMMUAccessFlags perm,
-                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
+                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info,
+                          SMMUState *bs)
 {
     dma_addr_t baseaddr, indexmask;
     SMMUStage stage = cfg->stage;
@@ -369,6 +396,11 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
                 goto error;
             }
             baseaddr = get_table_pte_address(pte, granule_sz);
+            if (cfg->stage == SMMU_NESTED) {
+                if (translate_table_s1(&baseaddr, cfg, info, bs)) {
+                    goto error;
+                }
+            }
             level++;
             continue;
         } else if (is_page_pte(pte, level)) {
@@ -551,10 +583,8 @@ error:
 }
 
 /* combine 2 TLB entries and return in tlbe in nested config. */
-static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
-                                                SMMUTLBEntry *tlbe_s2,
-                                                dma_addr_t iova,
-                                                SMMUTransCfg *cfg)
+static void combine_tlb(SMMUTLBEntry *tlbe, SMMUTLBEntry *tlbe_s2,
+                        dma_addr_t iova, SMMUTransCfg *cfg)
 {
     if (tlbe_s2->entry.addr_mask < tlbe->entry.addr_mask) {
         tlbe->entry.addr_mask = tlbe_s2->entry.addr_mask;
@@ -579,14 +609,19 @@ static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
  * @perm: tentative access type
  * @tlbe: returned entry
  * @info: ptw event handle
+ * @bs: smmu state which includes TLB instance
  *
  * return 0 on success
  */
 int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
-             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
+             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info, SMMUState *bs)
 {
+    int ret;
+    SMMUTLBEntry tlbe_s2;
+    dma_addr_t ipa;
+
     if (cfg->stage == SMMU_STAGE_1) {
-        return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
+        return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info, bs);
     } else if (cfg->stage == SMMU_STAGE_2) {
         /*
          * If bypassing stage 1(or unimplemented), the input address is passed
@@ -600,11 +635,23 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
             tlbe->entry.perm = IOMMU_NONE;
             return -EINVAL;
         }
-
         return smmu_ptw_64_s2(cfg, iova, perm, tlbe, info);
     }
 
-    g_assert_not_reached();
+    /* SMMU_NESTED. */
+    ret = smmu_ptw_64_s1(cfg, iova, perm, tlbe, info, bs);
+    if (ret) {
+        return ret;
+    }
+
+    ipa = CACHED_ENTRY_TO_ADDR(tlbe, iova);
+    ret = smmu_ptw_64_s2(cfg, ipa, perm, &tlbe_s2, info);
+    if (ret) {
+        return ret;
+    }
+
+    combine_tlb(tlbe, &tlbe_s2, iova, cfg);
+    return 0;
 }
 
 SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
@@ -660,7 +707,7 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
     }
 
     cached_entry = g_new0(SMMUTLBEntry, 1);
-    status = smmu_ptw(cfg, aligned_addr, flag, cached_entry, info);
+    status = smmu_ptw(cfg, aligned_addr, flag, cached_entry, info, bs);
     if (status) {
             g_free(cached_entry);
             return NULL;
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 1db566d451..cf0fd3ec74 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -185,7 +185,7 @@ static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
  * pair, according to @cfg translation config
  */
 int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
-             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info);
+             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info, SMMUState *bs);
 
 
 /*
-- 
2.44.0.769.g3c40516874-goog
