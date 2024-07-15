Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2118130nji;
        Mon, 15 Jul 2024 01:45:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVapGgDB7Os1Ju7me9p8PatOCrMPaIK3JtEbS4HdskbK25bmPnok0LSgDOemRym1mXRL7BOH1L21nG9F9H0ohASyITfWDzO
X-Received: by 2002:a2e:b045:0:b0:2ee:8698:10ec with SMTP id 38308e7fff4ca-2eeb3198767mr119376181fa.48.1721033154209;
        Mon, 15 Jul 2024 01:45:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721033154; cv=none;
        d=google.com; s=arc-20160816;
        b=HTmg1nrfT0q6DxNx1rebaS5E60b9jmyB7h+ar6DlwgRLDxxXqku3oBF53UJ0j3FE0s
         bHvwO5Q8J80aOKuFIpouSjy1PIbDrLun0YYs/S37pIKiyu8V0ZboSCf6lmRIPWBcB+XD
         9f7mja/lwZZBhGQM1kCpLVQsvNvsrC5HTQ1Umn3VrZJ6I+H84EOvKWWW6OWTaMKXiBP1
         yGUckYdAsi37Ih3y7rfq3fgyE3EV2i51sG6sD16ZvcTeSstU7zt1mG8XHHJjiOM0EiTc
         8Jl3FmczYCT1hqs+HVAtHi8yZApTVgzmMWRL5xyH33kidFISITk8IjldsKdC2OeW5qj6
         EGRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=l0Soo9RWetj5yxS136m2PIQhSOE18Tim7cY2xe4qkxM=;
        fh=YqF4O3kD9mDEfNDAThypxP5j5nPOTgyyQnSGQaQEIzE=;
        b=zWyE3gaUEZTbGwcFL8t32Ddi4BIrCuYp5CAIGgvHqoGItDw1/cDAXOywqngyCxQt3F
         oBliP9BUu7b01K3oNRzl4vynheWrsPffONVq7nTa1C601ABjTkf+tVk7k7N49QVWvISV
         pcm1npS5aV6M+MDUdnVJrieAaB0MyxmPMNQ2ZxYrE7s7DSuXGV/TAesFMBqpAwTIXzHu
         toTESIYQRfrUKWiwyzPgjvrPBM3LMNu9YWy0dZsgs8Ifz659Pm/f2qO7DndQz8VSkw6M
         doQAQ53qrzpMnwQpnvfl0X6H7+xzm87JPivYnTY+DGreIB+ddhd4DPibBRvqxoKbF/Ot
         t7Ug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=qZh3feHo;
       spf=pass (google.com: domain of 3weguzggkcxqc68cduzu08805y.w86u5yh.vy77yy527ub8.8b0@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3weGUZggKCxQC68CDuzu08805y.w86u5yH.vy77yy527uB8.8B0@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3weGUZggKCxQC68CDuzu08805y.w86u5yH.vy77yy527uB8.8B0@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id ffacd0b85a97d-3680dd70c2bsor1064801f8f.10.2024.07.15.01.45.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Jul 2024 01:45:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3weguzggkcxqc68cduzu08805y.w86u5yh.vy77yy527ub8.8b0@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=qZh3feHo;
       spf=pass (google.com: domain of 3weguzggkcxqc68cduzu08805y.w86u5yh.vy77yy527ub8.8b0@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3weGUZggKCxQC68CDuzu08805y.w86u5yH.vy77yy527uB8.8B0@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721033153; x=1721637953; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=l0Soo9RWetj5yxS136m2PIQhSOE18Tim7cY2xe4qkxM=;
        b=qZh3feHoTfWTdcBRotB9JnPCUAPro0L8JJiuroCPY229i28OwiJ34j4IVHY565xT6Q
         ap+TW+FYZHuzFcTZAmPWgu1ldHtKnMWJZwKc6u/tf5OGEmgl83XOnZrykIxP+jDnxBzg
         BRAoPSWlz3UCdHJ1IOLbkJfsboLUl+4yQl8VPLrPWISgbR/J7wSMZa94oMO49hMow/TT
         JLca+/AXnpNWAtYpJkxcptIyVIxJzcPLLMPVJuEiaHiMIEWawHESJZehbhes2wOsaooh
         rNLSwMVfaBrKhLR2Brhv1HsJS7cTQkgC4qCuqgnxTzLdyAbS8Z1UNvIpHktW+FWKSf6I
         0yug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033153; x=1721637953;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0Soo9RWetj5yxS136m2PIQhSOE18Tim7cY2xe4qkxM=;
        b=w/Dhzts5zbDd/ZCUo4dbYngnKUkx5SYw4kbOeeh+1G+9AisEWOML7jx135JuOiw5qO
         1jc75Ik/M1oBBAxDmNsj16LXvSyPe0c7GJeIKLzATkeaIBVt19weoRe+ynUSusNYjP0S
         iCuJ2Au+yuKPW5zV0k558cXJQXooSCU5n0BQKj8m3P7ZRBNcmnMkC7AB1M2a5qaxGovB
         f2GVN8EOQUl/UCdb1bFn8663HA2wE9NOGkx6vbSmRURbI3CbTlQfhbYAySxfE6iwhN5s
         NMWQxamF+YT1vHfRfedLL6+Iaa61Okx+7hTT7kTw/BWTpxJmFyHoW3vgEnv4gPdtAxbF
         MSvw==
X-Forwarded-Encrypted: i=1; AJvYcCXR4LHecpgsu68/wJI/J3QZcL8Ar+s31EmvoCZmxqgNkVVK1n43zQUKQcF82ti8hF2+J7RoEvet02kR1TEiYVrVBGL6IVwt
X-Gm-Message-State: AOJu0YySz2E4k8zDSB3ZZdWjhCklimQPGiF1cbLVRf1bKsnMpDlnD/9y
	IeKnTM+sVUwf+Pugw60bARlwnSPydk5Y6KdBj11+yOUh5rWsrbWM/xFEukC6lI1vN+isFGRrdEy
	ZkpdLQIlJaw==
X-Google-Smtp-Source: AGHT+IFb/6ITOtb9CoGhqXNQ6F5+1aO1YUAiqFhf0rBwObaxua+cZuRYKSBiB4nawtbP5DTzrT0RfTqP1LwAlQ==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a5d:5542:0:b0:367:f0f2:66c2 with SMTP id
 ffacd0b85a97d-367f0f27d02mr21798f8f.2.1721033153477; Mon, 15 Jul 2024
 01:45:53 -0700 (PDT)
Date: Mon, 15 Jul 2024 08:45:11 +0000
In-Reply-To: <20240715084519.1189624-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240715084519.1189624-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240715084519.1189624-12-smostafa@google.com>
Subject: [PATCH v5 11/18] hw/arm/smmu-common: Support nested translation
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: eVd4doatQP6r

When nested translation is requested, do the following:
- Translate stage-1 table address IPA into PA through stage-2.
- Translate stage-1 table walk output (IPA) through stage-2.
- Create a single TLB entry from stage-1 and stage-2 translations
  using logic introduced before.

smmu_ptw() has a new argument SMMUState which include the TLB as
stage-1 table address can be cached in there.

Also in smmu_ptw(), a separate path used for nesting to simplify the
code, although some logic can be combined.

With nested translation class of translation fault can be different,
from the class of the translation, as faults from translating stage-1
tables are considered as CLASS_TT and not CLASS_IN, a new member
"is_ipa_descriptor" added to "SMMUPTWEventInfo" to differ faults
from walking stage 1 translation table and faults from translating
an IPA for a transaction.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c         | 74 +++++++++++++++++++++++++++++++-----
 hw/arm/smmuv3.c              | 14 +++++++
 include/hw/arm/smmu-common.h |  7 ++--
 3 files changed, 82 insertions(+), 13 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index c894c4c621..8ed53f5b1d 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -318,8 +318,41 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
     return NULL;
 }
 
+/* Translate stage-1 table address using stage-2 page table. */
+static inline int translate_table_addr_ipa(SMMUState *bs,
+                                           dma_addr_t *table_addr,
+                                           SMMUTransCfg *cfg,
+                                           SMMUPTWEventInfo *info)
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
+    info->addr = addr;
+    info->is_ipa_descriptor = true;
+    return -EINVAL;
+}
+
 /**
  * smmu_ptw_64_s1 - VMSAv8-64 Walk of the page tables for a given IOVA
+ * @bs: smmu state which includes TLB instance
  * @cfg: translation config
  * @iova: iova to translate
  * @perm: access type
@@ -331,7 +364,7 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
  * Upon success, @tlbe is filled with translated_addr and entry
  * permission rights.
  */
-static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
+static int smmu_ptw_64_s1(SMMUState *bs, SMMUTransCfg *cfg,
                           dma_addr_t iova, IOMMUAccessFlags perm,
                           SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
 {
@@ -381,6 +414,11 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
                 goto error;
             }
             baseaddr = get_table_pte_address(pte, granule_sz);
+            if (cfg->stage == SMMU_NESTED) {
+                if (translate_table_addr_ipa(bs, &baseaddr, cfg, info)) {
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
@@ -591,6 +627,7 @@ static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
 /**
  * smmu_ptw - Walk the page tables for an IOVA, according to @cfg
  *
+ * @bs: smmu state which includes TLB instance
  * @cfg: translation configuration
  * @iova: iova to translate
  * @perm: tentative access type
@@ -599,11 +636,15 @@ static void __attribute__((unused)) combine_tlb(SMMUTLBEntry *tlbe,
  *
  * return 0 on success
  */
-int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
-             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
+int smmu_ptw(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t iova,
+             IOMMUAccessFlags perm, SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
 {
+    int ret;
+    SMMUTLBEntry tlbe_s2;
+    dma_addr_t ipa;
+
     if (cfg->stage == SMMU_STAGE_1) {
-        return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
+        return smmu_ptw_64_s1(bs, cfg, iova, perm, tlbe, info);
     } else if (cfg->stage == SMMU_STAGE_2) {
         /*
          * If bypassing stage 1(or unimplemented), the input address is passed
@@ -621,7 +662,20 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
         return smmu_ptw_64_s2(cfg, iova, perm, tlbe, info);
     }
 
-    g_assert_not_reached();
+    /* SMMU_NESTED. */
+    ret = smmu_ptw_64_s1(bs, cfg, iova, perm, tlbe, info);
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
@@ -667,7 +721,7 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
     }
 
     cached_entry = g_new0(SMMUTLBEntry, 1);
-    status = smmu_ptw(cfg, addr, flag, cached_entry, info);
+    status = smmu_ptw(bs, cfg, addr, flag, cached_entry, info);
     if (status) {
             g_free(cached_entry);
             return NULL;
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 73d5a25705..06a96c65eb 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -910,6 +910,20 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
     if (!cached_entry) {
         /* All faults from PTW has S2 field. */
         event->u.f_walk_eabt.s2 = (ptw_info.stage == SMMU_STAGE_2);
+        /*
+         * Fault class is set as follows based on "class" input to
+         * the function and to "ptw_info" from "smmu_translate()"
+         * For stage-1:
+         *   - EABT => CLASS_TT (hardcoded)
+         *   - other events => CLASS_IN (input to function)
+         * For stage-2 => CLASS_IN (input to function)
+         * For nested, for all events:
+         *  - CD fetch => CLASS_CD (input to function)
+         *  - walking stage 1 translation table  => CLASS_TT (from
+         *    is_ipa_descriptor or input in case of TTBx)
+         *  - s2 translation => CLASS_IN (input to function)
+         */
+        class = ptw_info.is_ipa_descriptor ? SMMU_CLASS_TT : class;
         switch (ptw_info.type) {
         case SMMU_PTW_ERR_WALK_EABT:
             event->type = SMMU_EVT_F_WALK_EABT;
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index d84de64122..a3e6ab1b36 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -63,6 +63,7 @@ typedef struct SMMUPTWEventInfo {
     SMMUStage stage;
     SMMUPTWEventType type;
     dma_addr_t addr; /* fetched address that induced an abort, if any */
+    bool is_ipa_descriptor; /* src for fault in nested translation. */
 } SMMUPTWEventInfo;
 
 typedef struct SMMUTransTableInfo {
@@ -184,9 +185,9 @@ static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
  * smmu_ptw - Perform the page table walk for a given iova / access flags
  * pair, according to @cfg translation config
  */
-int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
-             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info);
-
+int smmu_ptw(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t iova,
+             IOMMUAccessFlags perm, SMMUTLBEntry *tlbe,
+             SMMUPTWEventInfo *info);
 
 /*
  * smmu_translate - Look for a translation in TLB, if not, do a PTW.
-- 
2.45.2.993.g49e7a77208-goog
