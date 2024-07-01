Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1286456njm;
        Mon, 1 Jul 2024 04:03:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXgmd2yERlhde9BAuA0Dfx+KN06zsu7ZTVMGVGSHwlNF2cKXtcWnJA+vEcD43gscJ7dHxQ8Q1OJWo+6wdw9u9X1i+IgIj5D
X-Received: by 2002:a05:6512:3da5:b0:52c:e5ae:87e1 with SMTP id 2adb3069b0e04-52e82643c4cmr3873320e87.9.1719831812929;
        Mon, 01 Jul 2024 04:03:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719831812; cv=none;
        d=google.com; s=arc-20160816;
        b=JRQU64XAdxb13X+XHlw+iNcn9/l5Z4EuBIp17Of9xJhk+WUQP6n2Zrt0le9KnAO5Ga
         7jjk7JA6g5xO2c4v4seZSoiWs20S+KUslzIMTHPLlmbJ+TEl3vBHh6XKki6H1mrGHNe3
         8lc1QKkZCEo36ERVK8muwiY3yoBdq99R39e6hVvovCNJ1wW4KQ/zEt1rbLKNM1HhnicA
         0dSP9iKw8U90DK9oaXdS8zP8GriYkA/kT53aE+fX8XVgakCmWqRzrvS45wYuDJv2yEhy
         WR6xYRh6hP28sDBdaXDA0hs6UwqgwEy07ynr5W4BGJO2OTCtuzNzKOUVSL+RrFJijoOn
         Dsvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=pLiLD9Y6hPJK630FI36/76GCsbQcYnRJXZm5rXlVToQ=;
        fh=QIsR6+HYz9CS2aMb6dclqcW1AF47UM8V3rc1EZ/Qwtg=;
        b=fnEHxTdvAtWZK8N0xdmASdvXyNCVAXEPFg7fhsjVUqLf/3+QlNICRfNm5QTm82iTUk
         c/sVmwj2M1iL9o2NhUfNMBuExjHFjMdVuZwC+s9yQLn+AzG4H56AIsris0po+DH8yZWT
         lRbopfty6xtoncf495JKXoo/91o9NpBFyJ5b5jzJDjyTVelXyy/cQPtEuPAL5F6dLF26
         dd3F/GLBLrXHTnHzLyQBuBwMWVRXrVqdzWfB0pnM+1pCFmLzaLFi2SduErtITaKSjITr
         jCRNnS8acoY8HFxQXgTw4Sh4rZsXl7cesfsjeVGzKmv5gY662wCbsTP033y5eoleQLUo
         0z2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=qXBKOOT0;
       spf=pass (google.com: domain of 3bi2czggkc2mtnptubgbhpphmf.dpnbmfy.cfooffmjobsp.psh@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3BI2CZggKC2MTNPTUBGBHPPHMF.DPNBMFY.CFOOFFMJOBSP.PSH@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3BI2CZggKC2MTNPTUBGBHPPHMF.DPNBMFY.CFOOFFMJOBSP.PSH@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 5b1f17b1804b1-425655b013esor24454605e9.6.2024.07.01.04.03.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2024 04:03:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3bi2czggkc2mtnptubgbhpphmf.dpnbmfy.cfooffmjobsp.psh@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=qXBKOOT0;
       spf=pass (google.com: domain of 3bi2czggkc2mtnptubgbhpphmf.dpnbmfy.cfooffmjobsp.psh@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3BI2CZggKC2MTNPTUBGBHPPHMF.DPNBMFY.CFOOFFMJOBSP.PSH@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719831812; x=1720436612; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pLiLD9Y6hPJK630FI36/76GCsbQcYnRJXZm5rXlVToQ=;
        b=qXBKOOT0KeuXMmMKCyPUe/p8RsC50NcW2XDBG8ITzpLwES8pDL2FYl91M4/oB8mNPg
         Ifxy67xYCkeaduRgqZL6WI2CxY0KiFjzUImD+5Dxelvo3pBgLRhSpRj2sav8e+r/8115
         61yFTjBx9uFLKpCR0EerRhadasqvSltMA0h/vQdfS1SIN1OAGLieYWPBBMd4px+vxTxT
         mNxMYpeKZ4AmtmNdpig/6P7CXSKBCW9ImL3XSIKqpnjLZRHwpEphX3RcmvrkxrmYb+Bn
         9tWeHx+e+Lt3IBD++WycmUYZj/zEhX5ssCOIwYCG8AzBphS2qT8l54GZjir9Aka6Lsst
         1fWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831812; x=1720436612;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pLiLD9Y6hPJK630FI36/76GCsbQcYnRJXZm5rXlVToQ=;
        b=EFzwrpT5JiUxvUvR0uEgTwHlxWIN4bE5tFrMHdoS9ipUYfMHU+J+MtTSss8vG0bboi
         LTmoN8z5g7UXGnrb6dLwuzdndLdZiLKRTKjohXpADXZQhTAQ2hgkNOtErnnvbh6vAoRa
         380hLY6Ly8MlJTQrWSSzNSSBN1b9ZFMPjJmlb3P39p+Xp1Y2spSWstX0CkM3l7rn4yc6
         8ZxihGi562kYpsXXQnf5lh9cKLzM6KTkB9x33GOvXaS15haDhsOrHBe1wuWMNFZEcVxV
         840CIaC+pY/ewwjJCDCfzTM+MYcyoA0h/BhIaeuO5NmrMg3R0Tq3o+tNQCNIWU44/g0z
         z3/g==
X-Forwarded-Encrypted: i=1; AJvYcCWQIrNtHc8Yz7IPjT7TeDU3QnEOmDfhmvooOlOWF9iyrsZzrvbWVESXHtyIwtU0aUct/vpLlL6sjH2jm0FolYOEPXxuAHtk
X-Gm-Message-State: AOJu0YwWFr6NcHoNVUGGo3xtWb2t8I+Ylh7MxPdtEIH28+bslH6Q2Feh
	HFwV+mi2YuTmttLi8+c0PPXwzwde6P9Y0LNl8naaYjLN9yhmKJzk9PSdn/pnnhpO3UXXe7cpQAq
	dxD4QIrlQhQ==
X-Google-Smtp-Source: AGHT+IE4M0AH42DOJTFwqeKXn9/m3zipf6JPuJXv8nEERd3pFQpf4gLR85Sf9TFoqxGMP/qmIIN/R/SHi/kXyQ==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6000:1445:b0:366:ebf5:c6cb with SMTP
 id ffacd0b85a97d-3677571b760mr8352f8f.11.1719831812129; Mon, 01 Jul 2024
 04:03:32 -0700 (PDT)
Date: Mon,  1 Jul 2024 11:02:33 +0000
In-Reply-To: <20240701110241.2005222-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240701110241.2005222-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240701110241.2005222-12-smostafa@google.com>
Subject: [PATCH v4 11/19] hw/arm/smmu-common: Support nested translation
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: bla76W4nWQI/

When nested translation is requested, do the following:

- Translate stage-1 table address IPA into PA through stage-2.
- Translate stage-1 table walk output (IPA) through stage-2.
- Create a single TLB entry from stage-1 and stage-2 translations
  using logic introduced before.

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
 hw/arm/smmu-common.c         | 72 +++++++++++++++++++++++++++++++-----
 include/hw/arm/smmu-common.h |  2 +-
 2 files changed, 64 insertions(+), 10 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 24b7d09e2b..71afd486ba 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -318,6 +318,38 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
     return NULL;
 }
 
+/* Translate stage-1 table address using stage-2 page table. */
+static inline int translate_table_addr_ipa(dma_addr_t *table_addr,
+                                           SMMUTransCfg *cfg,
+                                           SMMUPTWEventInfo *info,
+                                           SMMUState *bs)
+{
+    dma_addr_t addr = *table_addr;
+    SMMUTLBEntry *cached_entry;
+    int asid;
+
+    /*
+     * The translation table walks performed from TTB0 or TTB1 are always
+     * performed in IPA space if stage 2 translations are enabled.
+     */
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
@@ -333,7 +365,8 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
  */
 static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
                           dma_addr_t iova, IOMMUAccessFlags perm,
-                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
+                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info,
+                          SMMUState *bs)
 {
     dma_addr_t baseaddr, indexmask;
     SMMUStage stage = cfg->stage;
@@ -381,6 +414,11 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
                 goto error;
             }
             baseaddr = get_table_pte_address(pte, granule_sz);
+            if (cfg->stage == SMMU_NESTED) {
+                if (translate_table_addr_ipa(&baseaddr, cfg, info, bs)) {
+                    goto error;
+                }
+            }
             level++;
             continue;
         } else if (is_page_pte(pte, level)) {
@@ -568,10 +606,8 @@ error:
  * combine S1 and S2 TLB entries into a single entry.
  * As a result the S1 entry is overriden with combined data.
  */
-static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
-                                                SMMUTLBEntry *tlbe_s2,
-                                                dma_addr_t iova,
-                                                SMMUTransCfg *cfg)
+static void combine_tlb(SMMUTLBEntry *tlbe, SMMUTLBEntry *tlbe_s2,
+                        dma_addr_t iova, SMMUTransCfg *cfg)
 {
     if (tlbe_s2->entry.addr_mask < tlbe->entry.addr_mask) {
         tlbe->entry.addr_mask = tlbe_s2->entry.addr_mask;
@@ -596,14 +632,19 @@ static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
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
@@ -621,7 +662,20 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
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
@@ -677,7 +731,7 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
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
2.45.2.803.g4e1b14247a-goog
