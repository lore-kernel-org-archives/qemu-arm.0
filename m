Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1286673njm;
        Mon, 1 Jul 2024 04:03:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXsySrRshoD4UaCcCw4FWzSFnksZKzk0ncf99toTvKOr/0fBe6oGs6/ReOhDNUER9zEwiw67ugcP2aYXZun+3/3Kh/PcooJ
X-Received: by 2002:a05:600c:4f52:b0:424:aa64:e9b3 with SMTP id 5b1f17b1804b1-4257a02b701mr34385785e9.29.1719831831834;
        Mon, 01 Jul 2024 04:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719831831; cv=none;
        d=google.com; s=arc-20160816;
        b=j9ITqNaIY6jYpQLAcmQqQeGp9MZoWqD6IqSy7H6urp74cvN9zVYdmL5jhfcUidR53/
         +cODF+ihOd0bArVNPSo8MPf8kVzcc3hzjn6GIxWrlXaSCcRoWeNivpiBX9xvjkYFNjJn
         KIV5On/SgjPSi6aiyCm7CHixlJcXXgdXAulbCLgvn4j8re4bXWxRSIoQyRmMjAKc7AdQ
         IX07z0l8VOT2aoORiWU7gWdtokm3P6oS7YkXiao9fTAf3CAy135FRri2fMZt/jU7HzGe
         mCf6YEH6XLs0M2VmEevdG9zxvG08DKTcwuZrCkcXOJE+alwtUzYel/D/m+CgmC+EoL0r
         KNRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=qrJKnFaCEJDJnPHMZ/xtMAaHa/F2XKk5TQh+K0QKGvQ=;
        fh=3jF6wVVYMLcVm3RCD2Z0hRRqxffuyGXGxcj4oChIZ10=;
        b=RdwQhGK7eibPRmKpUEV1mlbklpDU7zdJr7u0WbfpMspLQwthW4QXRMAjJmy4TstjbY
         h3VUlSO7CIHtlQxvUQQtv/2cffZRa1DztgiylBfRafR0SXDBtiKRRWtlUdQpjki+0EP/
         uDnxLy4APwaCRr76+YxhUDdl9Ictlp2H1yvCd43CuwHUf/jkDh+q7+YBCsnqtDEKB6z/
         0oCGTuL/brHoO3ee8jBVltdQMMNYgTZ97qaTWuvsM5oQl1ylulBW7BRqwkWQSkRZMIj9
         oa32eAugqdixDdiSlL9lP0GlwwEOMMewo4//oMYdYwUQ0cMF8FEe8MkLL3zUSrFG5zdJ
         Fe2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=pm56eQvI;
       spf=pass (google.com: domain of 3fo2czggkc3ulfhlmtytzhhzex.vhftexq.uxggxxebgtkh.hkz@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3Fo2CZggKC3UlfhlmTYTZhhZeX.VhfTeXq.UXggXXebgTkh.hkZ@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3Fo2CZggKC3UlfhlmTYTZhhZeX.VhfTeXq.UXggXXebgTkh.hkZ@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4256b93cd58sor18401025e9.6.2024.07.01.04.03.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2024 04:03:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3fo2czggkc3ulfhlmtytzhhzex.vhftexq.uxggxxebgtkh.hkz@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=pm56eQvI;
       spf=pass (google.com: domain of 3fo2czggkc3ulfhlmtytzhhzex.vhftexq.uxggxxebgtkh.hkz@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3Fo2CZggKC3UlfhlmTYTZhhZeX.VhfTeXq.UXggXXebgTkh.hkZ@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719831831; x=1720436631; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qrJKnFaCEJDJnPHMZ/xtMAaHa/F2XKk5TQh+K0QKGvQ=;
        b=pm56eQvIxYPmjkyegn37cur7NLIkQtAmCIz5h5OMQdHajb31/R3qb+BXUn/x4us0gi
         YtQmnuZYeSYApHIdHK/aJiAZgLtUJ0WFeiSCxvKhKoSdmLXy+BlcTf2/yqAQRWS821eE
         42auS8iBWbQhqAfe5h/edS/rW2HJ0S1DihL13raWem85RBB6celCVvDWpnuQl9nvKncH
         jODN0DKNP/tM/3qZeYeMq+zr834iT8ghn4zVg/pdnUWIdMtlDzRFNJRhUHf29eJqJj5m
         Fth+f61UkiZ4VKt9nWpk6MGRVKrCfF4O1Z0RcCoiMPEAFtH15GGMwIU40+tAXQHz/XDr
         TmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831831; x=1720436631;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qrJKnFaCEJDJnPHMZ/xtMAaHa/F2XKk5TQh+K0QKGvQ=;
        b=cgFki0ouyn8WaK3/ZKlqdj7KnRIHNrgRDtVeFVZTw8GbKP5YU1HBQ5TrHkhWG5aM/z
         2HHwbyDPSqq433G9aVEPykXmKo4glbWY6a+wRxC1blIS72Qq+y7N0vKC1t/s8SS4U4Fr
         CI/dY/73ggn7HK8CGyD37AYtzNrRR+w7bsNXG5VcINmjUSgSRJeFhtDV2rnI9Hegb7x1
         NETrWDkJ06FnJexIqWjfbiDmLFbi/jQSXAZkYTB1wLvWkEcEnT6VEQK9ViyD0G0gYrat
         sVOyjo5dPIRqQgjSpAZkKd6HJKyYgpvW7+I9g7gZPdr/+PB0q5WQDLJBBw46bd9wbq/z
         JsEw==
X-Forwarded-Encrypted: i=1; AJvYcCWqhS1s0AdJpFpyMzVuMIb4PSHfs8OpsC2/J18y6XmJSD2hUUhWjlPqc3aVEriNzi1KJCIkCrgeB4qEJCZdR3w8GEXGW20I
X-Gm-Message-State: AOJu0Yxf8lcVNxAWNArKJ9Kr20wYecq+Tis1OgNlH/WPb6et5+wikM0q
	V0+iUKZnZEIdm4UermSp5gjCKV9LYa1FcHFMm7nm2YzRZH1XPCOr358VfMqw1poCqbk6m2FxNNP
	4BuuTLrUvgg==
X-Google-Smtp-Source: AGHT+IFUvw3RBG+2kPGfC4p+U48kacJg4z32znanatvhv6jKM8UzBbL7avg9ABDM3lU5yDveYhbHWHW2gt+c/g==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:5488:b0:424:a585:4b48 with SMTP
 id 5b1f17b1804b1-4257a08a9cfmr218315e9.7.1719831830959; Mon, 01 Jul 2024
 04:03:50 -0700 (PDT)
Date: Mon,  1 Jul 2024 11:02:41 +0000
In-Reply-To: <20240701110241.2005222-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240701110241.2005222-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240701110241.2005222-20-smostafa@google.com>
Subject: [PATCH v4 19/19] hw/arm/smmu: Refactor SMMU OAS
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: ew2rPtUZRptT

SMMUv3 OAS is currently hardcoded in the code to 44 bits, for nested
configurations that can be a problem, as stage-2 might be shared with
the CPU which might have different PARANGE, and according to SMMU manual
ARM IHI 0070F.b:
    6.3.6 SMMU_IDR5, OAS must match the system physical address size.

This patch doesn't change the SMMU OAS, but refactors the code to
make it easier to do that:
- Rely everywhere on IDR5 for reading OAS instead of using the
  SMMU_IDR5_OAS macro, so, it is easier just to change IDR5 and
  it propagages correctly.
- Add additional checks when OAS is greater than 48bits.
- Remove unused functions/macros: pa_range/MAX_PA.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c     |  7 ++++---
 hw/arm/smmuv3-internal.h | 13 -------------
 hw/arm/smmuv3.c          | 35 ++++++++++++++++++++++++++++-------
 3 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index faba4adc49..2cff80e5dd 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -452,7 +452,8 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
     inputsize = 64 - tt->tsz;
     level = 4 - (inputsize - 4) / stride;
     indexmask = VMSA_IDXMSK(inputsize, stride, level);
-    baseaddr = extract64(tt->ttb, 0, 48);
+
+    baseaddr = extract64(tt->ttb, 0, cfg->oas);
     baseaddr &= ~indexmask;
 
     while (level < VMSA_LEVELS) {
@@ -576,8 +577,8 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
      * Get the ttb from concatenated structure.
      * The offset is the idx * size of each ttb(number of ptes * (sizeof(pte))
      */
-    uint64_t baseaddr = extract64(cfg->s2cfg.vttb, 0, 48) + (1 << stride) *
-                                  idx * sizeof(uint64_t);
+    uint64_t baseaddr = extract64(cfg->s2cfg.vttb, 0, cfg->s2cfg.eff_ps) +
+                                  (1 << stride) * idx * sizeof(uint64_t);
     dma_addr_t indexmask = VMSA_IDXMSK(inputsize, stride, level);
 
     baseaddr &= ~indexmask;
diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 0f3ecec804..0ebf2eebcf 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -602,19 +602,6 @@ static inline int oas2bits(int oas_field)
     return -1;
 }
 
-static inline int pa_range(STE *ste)
-{
-    int oas_field = MIN(STE_S2PS(ste), SMMU_IDR5_OAS);
-
-    if (!STE_S2AA64(ste)) {
-        return 40;
-    }
-
-    return oas2bits(oas_field);
-}
-
-#define MAX_PA(ste) ((1 << pa_range(ste)) - 1)
-
 /* CD fields */
 
 #define CD_VALID(x)   extract32((x)->word[0], 31, 1)
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 88378e83dd..6954b385c7 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -410,10 +410,10 @@ static bool s2t0sz_valid(SMMUTransCfg *cfg)
     }
 
     if (cfg->s2cfg.granule_sz == 16) {
-        return (cfg->s2cfg.tsz >= 64 - oas2bits(SMMU_IDR5_OAS));
+        return (cfg->s2cfg.tsz >= 64 - cfg->s2cfg.eff_ps);
     }
 
-    return (cfg->s2cfg.tsz >= MAX(64 - oas2bits(SMMU_IDR5_OAS), 16));
+    return (cfg->s2cfg.tsz >= MAX(64 - cfg->s2cfg.eff_ps, 16));
 }
 
 /*
@@ -434,8 +434,11 @@ static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
     return nr_concat <= VMSA_MAX_S2_CONCAT;
 }
 
-static int decode_ste_s2_cfg(SMMUTransCfg *cfg, STE *ste)
+static int decode_ste_s2_cfg(SMMUv3State *s, SMMUTransCfg *cfg,
+                             STE *ste)
 {
+    uint8_t oas = FIELD_EX32(s->idr[5], IDR5, OAS);
+
     if (STE_S2AA64(ste) == 0x0) {
         qemu_log_mask(LOG_UNIMP,
                       "SMMUv3 AArch32 tables not supported\n");
@@ -468,7 +471,15 @@ static int decode_ste_s2_cfg(SMMUTransCfg *cfg, STE *ste)
     }
 
     /* For AA64, The effective S2PS size is capped to the OAS. */
-    cfg->s2cfg.eff_ps = oas2bits(MIN(STE_S2PS(ste), SMMU_IDR5_OAS));
+    cfg->s2cfg.eff_ps = oas2bits(MIN(STE_S2PS(ste), oas));
+    /*
+     * For SMMUv3.1 and later, when OAS == IAS == 52, the stage 2 input
+     * range is further limited to 48 bits unless STE.S2TG indicates a
+     * 64KB granule.
+     */
+    if (cfg->s2cfg.granule_sz != 16) {
+        cfg->s2cfg.eff_ps = MIN(cfg->s2cfg.eff_ps, 48);
+    }
     /*
      * It is ILLEGAL for the address in S2TTB to be outside the range
      * described by the effective S2PS value.
@@ -544,6 +555,7 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
                       STE *ste, SMMUEventInfo *event)
 {
     uint32_t config;
+    uint8_t oas = FIELD_EX32(s->idr[5], IDR5, OAS);
     int ret;
 
     if (!STE_VALID(ste)) {
@@ -587,8 +599,8 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
          * Stage-1 OAS defaults to OAS even if not enabled as it would be used
          * in input address check for stage-2.
          */
-        cfg->oas = oas2bits(SMMU_IDR5_OAS);
-        ret = decode_ste_s2_cfg(cfg, ste);
+        cfg->oas = oas2bits(oas);
+        ret = decode_ste_s2_cfg(s, cfg, ste);
         if (ret) {
             goto bad_ste;
         }
@@ -714,6 +726,7 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
     int i;
     SMMUTranslationStatus status;
     SMMUTLBEntry *entry;
+    uint8_t oas = FIELD_EX32(s->idr[5], IDR5, OAS);
 
     if (!CD_VALID(cd) || !CD_AARCH64(cd)) {
         goto bad_cd;
@@ -732,7 +745,7 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
     cfg->aa64 = true;
 
     cfg->oas = oas2bits(CD_IPS(cd));
-    cfg->oas = MIN(oas2bits(SMMU_IDR5_OAS), cfg->oas);
+    cfg->oas = MIN(oas2bits(oas), cfg->oas);
     cfg->tbi = CD_TBI(cd);
     cfg->asid = CD_ASID(cd);
     cfg->affd = CD_AFFD(cd);
@@ -761,6 +774,14 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
             goto bad_cd;
         }
 
+        /*
+         * An address greater than 48 bits in size can only be output from a
+         * TTD when, in SMMUv3.1 and later, the effective IPS is 52 and a 64KB
+         * granule is in use for that translation table
+         */
+        if (tt->granule_sz != 16) {
+            cfg->oas = MIN(cfg->oas, 48);
+        }
         tt->tsz = tsz;
         tt->ttb = CD_TTB(cd, i);
 
-- 
2.45.2.803.g4e1b14247a-goog
