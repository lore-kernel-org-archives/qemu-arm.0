Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2118103nji;
        Mon, 15 Jul 2024 01:45:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXWoEwj8ieg7UD0Q6s5gJC5z3E7yj3GZPnm66FIxNmvo8UZ71ORTpux29Y2HyduNXv8CibhABEI9GATfC87KRrBkZhr9uHr
X-Received: by 2002:a05:6902:2b06:b0:e05:cbda:31ad with SMTP id 3f1490d57ef6-e05cbda31femr583868276.55.1721033149088;
        Mon, 15 Jul 2024 01:45:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721033149; cv=none;
        d=google.com; s=arc-20160816;
        b=LxbyKa7UObpJNVpqq7UgvfDYMo+JeBDgrAFATlj0r1CF9XYHlTmwGzBmKemaP1Sdif
         /Hysl6wxveqdYzwMCnJOB3JL1JgpvR3gFkbmC6VbP0yVjkF5lDS1MJdpCzMRBgnAXuA5
         P4ihkANqQZaH/CjlCjCvol4DG5PfraWjAabm/+tASwMHjriANUMqL7XdVNIEz3ZXQb5p
         5LAVOH6+Tx2YEDkvJxGw1rTJa4WNa2crC6IeKF8JhAKasy/cSqcKm2UjXbsmDGzBwsbc
         FgriMuK0ozkQDMgwYj6DhkcHqxSgCOcSRdye8OniDVmTdZfZNbiHOXg6zCRH+XkUFDGm
         ht8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=3aUfDOhGoD48EsXGKwPhz+ox5YDV1/R2ByBW8Z0WXWA=;
        fh=ZFvrSYIHIEFUZ3cSGDrETb++QTEjB5rCYUg2lgkBxuE=;
        b=b1Es5XzbOhV7+iPKMdV7VaN1ZeHgBzdZJZ6wd3m+sF/p63T6HQksGszK58ncHMZxus
         foaXaGeHg6BT30TFht91kgBY6AAkXo9biuOdxquDrwx6RCxGuuJ1V7aIPaktDnAPLLIV
         vMiINgappobhB0ycBvL+fJVGop+1G108QVo/x+wCeyMUufGU9MEsBqqb7f6Yso64g1tv
         YZOUqgW131iDOfn56ozkyBGEYSp+AtQZOjQbe1N8CheyT6+5BVl5qfskI5CHv2Wo/Fw6
         2wARizsoGyVueG404F1b3rA+RGKPphxURa53fnKG2VGgSdXldcXNJ+RkkrElLjfesM8d
         8Sug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=1zstFUAr;
       spf=pass (google.com: domain of 3voguzggkcw871378pupv33v0t.r31p0tc.qt22tt0x2p63.36v@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3vOGUZggKCw871378pupv33v0t.r31p0tC.qt22tt0x2p63.36v@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3vOGUZggKCw871378pupv33v0t.r31p0tC.qt22tt0x2p63.36v@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 3f1490d57ef6-e05a4586813sor2259879276.8.2024.07.15.01.45.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Jul 2024 01:45:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3voguzggkcw871378pupv33v0t.r31p0tc.qt22tt0x2p63.36v@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=1zstFUAr;
       spf=pass (google.com: domain of 3voguzggkcw871378pupv33v0t.r31p0tc.qt22tt0x2p63.36v@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3vOGUZggKCw871378pupv33v0t.r31p0tC.qt22tt0x2p63.36v@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721033149; x=1721637949; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3aUfDOhGoD48EsXGKwPhz+ox5YDV1/R2ByBW8Z0WXWA=;
        b=1zstFUAr+WM5xY6fzBpl0Ne0j1kegn3KdDnpix9ioVDg6SdghMq5JtHkFwm/pqrtA5
         7Pjh/EOPeVCbTt5CfoNZgsd/S1y5xIkiqyZi/22iKzXN1rwobLdHJ0ziyBnIAMqMuXaL
         5Ww97ntSi/40DyKMt0l1hiEHOlmQhPW06NQ7S2cnV4dMfx+9L1FjZZTAJuKDBOqaP/FS
         3QewRB0P7g5tKVjJ3eg5bST1IcxQeeJKBKjgVYx/85ckv1VVRBrH79utpze2yuoadEig
         JuKtx8JoT2u+uZpH7y19FU4SLgf5IS0eA7uPJlMYna1NygV2QlbMSiX/meYO3Ht2VbzY
         TYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033149; x=1721637949;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3aUfDOhGoD48EsXGKwPhz+ox5YDV1/R2ByBW8Z0WXWA=;
        b=soLkKVLzEnRL6xNB/3NfceNgeuTQszXge2wA+0lo5b7k8A3qDOgGsYxhnb+65ALj1I
         zGBC6EItRX8TjUhk/pVMQ+jXnqKHFaZVxc01Z5MFhd8SCAKkv33hlGTXMKf5uA6gB8hQ
         9ELREfF8Bivuo7htVIG5WrQGI7pSzpO6sjhv9DCA3ihwvM4PNFfrSMRjXcdpKVQZ8+8C
         mvTTCXbLAImoQMIcRwkkGZcRJ95fAlQllWkunRYjr/FLI2PlWlCCYrFM9rhV9n/HpZXK
         DaEPca67xwFtMu7uop9Duywk6KGqNMOaVmWw4+tYeckv0HD6r1AQxf+63Okotmf9y53a
         m5og==
X-Forwarded-Encrypted: i=1; AJvYcCUDGXlj7ijicBEeONl/sQJoMxYMuE0wXFyKBZuqogHwkc1Ul2b52nf9obNzscdJctHF6ZbJUm4zQK0iMlcYBr5/z4N6npPT
X-Gm-Message-State: AOJu0YzY26x/QnxtVZKgN6hqnGM3iDXGhpzwtnPFFbBMR2HVTHxLK0lR
	qtIXrhb/IwIbXhvfAUsZ68YEEdmMo+lvMN21AvUrHKZpoLXO/8qsKR0Wv82pPiiST+I99M00AZF
	WzGxb22407g==
X-Google-Smtp-Source: AGHT+IGWEFUxmFoLuy/ZqEx2uKEmQYuA0wK3l6hIfj9u1wnjpD2+xhI+HXhNPIOZI78rLWCWhV9urPFOnwj0QQ==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:154c:b0:de5:2694:45ba with SMTP
 id 3f1490d57ef6-e041af3e29emr859892276.0.1721033148547; Mon, 15 Jul 2024
 01:45:48 -0700 (PDT)
Date: Mon, 15 Jul 2024 08:45:09 +0000
In-Reply-To: <20240715084519.1189624-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240715084519.1189624-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240715084519.1189624-10-smostafa@google.com>
Subject: [PATCH v5 09/18] hw/arm/smmu-common: Rework TLB lookup for nesting
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: k/lD7X9RKD5P

In the next patch, combine_tlb() will be added which combines 2 TLB
entries into one for nested translations, which chooses the granule
and level from the smallest entry.

This means that with nested translation, an entry can be cached with
the granule of stage-2 and not stage-1.

However, currently, the lookup for an IOVA is done with input stage
granule, which is stage-1 for nested configuration, which will not
work with the above logic.
This patch reworks lookup in that case, so it falls back to stage-2
granule if no entry is found using stage-1 granule.

Also, drop aligning the iova to avoid over-aligning in case the iova
is cached with a smaller granule, the TLB lookup will align the iova
anyway for each granule and level, and the page table walker doesn't
consider the page offset bits.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c | 64 +++++++++++++++++++++++++++++---------------
 1 file changed, 43 insertions(+), 21 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 21982621c0..f224e9c1e0 100644
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
@@ -88,6 +90,36 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
         }
         level++;
     }
+    return entry;
+}
+
+/**
+ * smmu_iotlb_lookup - Look up for a TLB entry.
+ * @bs: SMMU state which includes the TLB instance
+ * @cfg: Configuration of the translation
+ * @tt: Translation table info (granule and tsz)
+ * @iova: IOVA address to lookup
+ *
+ * returns a valid entry on success, otherwise NULL.
+ * In case of nested translation, tt can be updated to include
+ * the granule of the found entry as it might different from
+ * the IOVA granule.
+ */
+SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
+                                SMMUTransTableInfo *tt, hwaddr iova)
+{
+    SMMUTLBEntry *entry = NULL;
+
+    entry = smmu_iotlb_lookup_all_levels(bs, cfg, tt, iova);
+    /*
+     * For nested translation also try the s2 granule, as the TLB will insert
+     * it if the size of s2 tlb entry was smaller.
+     */
+    if (!entry && (cfg->stage == SMMU_NESTED) &&
+        (cfg->s2cfg.granule_sz != tt->granule_sz)) {
+        tt->granule_sz = cfg->s2cfg.granule_sz;
+        entry = smmu_iotlb_lookup_all_levels(bs, cfg, tt, iova);
+    }
 
     if (entry) {
         cfg->iotlb_hits++;
@@ -569,18 +601,21 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
 SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
                              IOMMUAccessFlags flag, SMMUPTWEventInfo *info)
 {
-    uint64_t page_mask, aligned_addr;
     SMMUTLBEntry *cached_entry = NULL;
     SMMUTransTableInfo *tt;
     int status;
 
     /*
-     * Combined attributes used for TLB lookup, as only one stage is supported,
-     * it will hold attributes based on the enabled stage.
+     * Combined attributes used for TLB lookup, holds the attributes for
+     * the input stage.
      */
     SMMUTransTableInfo tt_combined;
 
-    if (cfg->stage == SMMU_STAGE_1) {
+    if (cfg->stage == SMMU_STAGE_2) {
+        /* Stage2. */
+        tt_combined.granule_sz = cfg->s2cfg.granule_sz;
+        tt_combined.tsz = cfg->s2cfg.tsz;
+    } else {
         /* Select stage1 translation table. */
         tt = select_tt(cfg, addr);
         if (!tt) {
@@ -590,22 +625,9 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
         }
         tt_combined.granule_sz = tt->granule_sz;
         tt_combined.tsz = tt->tsz;
-
-    } else {
-        /* Stage2. */
-        tt_combined.granule_sz = cfg->s2cfg.granule_sz;
-        tt_combined.tsz = cfg->s2cfg.tsz;
     }
 
-    /*
-     * TLB lookup looks for granule and input size for a translation stage,
-     * as only one stage is supported right now, choose the right values
-     * from the configuration.
-     */
-    page_mask = (1ULL << tt_combined.granule_sz) - 1;
-    aligned_addr = addr & ~page_mask;
-
-    cached_entry = smmu_iotlb_lookup(bs, cfg, &tt_combined, aligned_addr);
+    cached_entry = smmu_iotlb_lookup(bs, cfg, &tt_combined, addr);
     if (cached_entry) {
         if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
             info->type = SMMU_PTW_ERR_PERMISSION;
@@ -616,7 +638,7 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
     }
 
     cached_entry = g_new0(SMMUTLBEntry, 1);
-    status = smmu_ptw(cfg, aligned_addr, flag, cached_entry, info);
+    status = smmu_ptw(cfg, addr, flag, cached_entry, info);
     if (status) {
             g_free(cached_entry);
             return NULL;
-- 
2.45.2.993.g49e7a77208-goog
