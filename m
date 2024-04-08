Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1293868ejh;
        Mon, 8 Apr 2024 07:09:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVcigHwi6SI+ZAJvrexNhI/FLTJeH5ruJxZvge471U7lrACIKQwf7ciSTsQinGygS109rjnNcsUEASZeaLdyCEr0w28lAPR
X-Received: by 2002:a05:6902:2b04:b0:dc7:443d:d9da with SMTP id fi4-20020a0569022b0400b00dc7443dd9damr9350660ybb.4.1712585365947;
        Mon, 08 Apr 2024 07:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712585365; cv=none;
        d=google.com; s=arc-20160816;
        b=McINY5riwZxtivBu2DB8+avTDuOnlL5r81db4nx/I2SS056BZC9WqOGtbvQMymZNuQ
         sz55C02mmMPf3swfrq/ED+zabZT56L5an9sbQFOrz9AfYJgeybT8mJwJfeyKz2P8LWb4
         IL2mBcCBqqTxNuqnHx/ZAGUa0m6EK7LwzIGXCzEmHPSdz4oySk8m90C2kUW6q0AnIpvn
         JsXpgJRrg9sYZPWnhAvULA5Wlf21Cq5iCQxHQ2q3rLxlPTaIcphAS0IuyCbq7Z8gQMyC
         7avCHqx2EqYa/fZtIxSDt4WOslMi1p48h9vc3JBqSQDP7rEW6dhbX+RzKvKQCkIEcwyw
         hCpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=ybhW/iy4MICs+VlDT9t9eZ+iakju4ebPrmZdQI0gVbA=;
        fh=AvriATKyES9Myz13x7N5sp+qaZEOQlHm/7sd9a5Ier8=;
        b=qHZdvMkh/zVf2qDPVg6Cv5fmGN8lVDwRxCK4aYZHN00cNdlpHEqmE6yr2t7iK9TCEN
         sa+PbN8gwNkD7Pz3hkDT84CaoXREohGLEPdZQwTfrfZr5i9I/SD4IwnWjjggffRSebt0
         nznwSiazhlOThmAavE0MOw3W97orzVE8Z/9YSTFuvVDTepIpI4WU/Z89BIvJZcv+gtzi
         WX2VxFl/d0Pug1Bq9qqWlVZgU0YDs+x4sgu5aFIVr7rKysD0u6B+qaABSM4J5tYKRwH8
         icCRvQ6C71LgM9OuVAubR4OWFi9V+wfj7iDathbIFqwphBH0unZHhenvuU6edAyu7iMp
         wiHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=oH4I6Kvk;
       spf=pass (google.com: domain of 3lfotzggkcxia46absxsy66y3w.u64s3wf.tw55ww305s96.69y@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3lfoTZggKCxIA46ABsxsy66y3w.u64s3wF.tw55ww305s96.69y@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3lfoTZggKCxIA46ABsxsy66y3w.u64s3wF.tw55ww305s96.69y@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id x18-20020a056902051200b00dc21e437403sor3149988ybs.14.2024.04.08.07.09.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 08 Apr 2024 07:09:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3lfotzggkcxia46absxsy66y3w.u64s3wf.tw55ww305s96.69y@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=oH4I6Kvk;
       spf=pass (google.com: domain of 3lfotzggkcxia46absxsy66y3w.u64s3wf.tw55ww305s96.69y@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3lfoTZggKCxIA46ABsxsy66y3w.u64s3wF.tw55ww305s96.69y@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712585365; x=1713190165; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ybhW/iy4MICs+VlDT9t9eZ+iakju4ebPrmZdQI0gVbA=;
        b=oH4I6KvkyqzmkvyT4H6hf2REIUmg6t4ErK4sBT7ndR2S/mdNUq+jSSZLUwcJ7MF/1W
         hXpBV3K8nC+4abAw0oUgZGLRHy28hUwbX3r690oXEK8QKIRtmFTBHuEAmiavChWxDAtR
         6ZRWukujCvDSZImq0fpvlIBnySjMjW/Qi50pkXwq/9ONkg9GWbYnRgXMB8jeIbpp2+YT
         DIbNVrM38KIi6UsRdRBq7FHyNF8uMrEEfPVr+gJywwIBtx76tGTdV7607ApvjWVwEkKO
         HXplcmN22IxH5TxWf9vYIZq0Z+M2s2y5DEy+RsglQl4fcQXuZ0R60NxcaX1JwpompRBN
         3xoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712585365; x=1713190165;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ybhW/iy4MICs+VlDT9t9eZ+iakju4ebPrmZdQI0gVbA=;
        b=MNKlfKCv/GzCfFbOV05vABsZJkVUywVBWGwCv1ZxtjWbWOzodMyhqJ+lt2tCZmm9wd
         DyuLUxiI9D0TLky4pmQIoxEDWLyc/nzMXsDqAQdT6ZdVpwEPrSCyear1e83pxzWcmIhl
         x/FWIB7jFK18Az60mi8KftTn5xBBkfR7otAiv7x32ITlAegvHJeuuSHPvM+I4aUoyd6v
         kKDgs2+pDzmqjx340u0fYYkf0OVsdPRdd8Xm60NXGUb4FsSYRcsvgpAVyUc7RFOVdunj
         NEXhaqytdnqakdVqhFUEQRKfAdCG56KkmmqkjC06izvrF1Xj6J2VaV9/+Yvn4AS/225Y
         RIpA==
X-Forwarded-Encrypted: i=1; AJvYcCUCYJq2SWp8EOjupwL+7yc6w855caaRXGQWi+i2o2CJ80Xsg5Wpvjs/RwnbpkxTEU4U5h+CrdbXuf2DobmxglAXQUYgBumi
X-Gm-Message-State: AOJu0Yy7ubUura1fzY2ISnsG2/KE2wwl8MpW4wRGIvQ63iNN4DI6X2lM
	6dAsojOFIgOMoYHiTSFEuKUPQ/UxAoejy3ymnevOhzBx/rPEJgzb0KSWUcOesuq7T7lZptAxZNv
	XOG0pSfnpkw==
X-Google-Smtp-Source: AGHT+IFnwgxxh1J3QIYMp3mLNe0VjOsiEtDzS5yjTC3dpadj/xOuyFqJvAkxo9TXIN2JrLeCjlYP34L4skGI5A==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a5b:944:0:b0:dcd:4286:4498 with SMTP id
 x4-20020a5b0944000000b00dcd42864498mr407033ybq.6.1712585365574; Mon, 08 Apr
 2024 07:09:25 -0700 (PDT)
Date: Mon,  8 Apr 2024 14:08:16 +0000
In-Reply-To: <20240408140818.3799590-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240408140818.3799590-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240408140818.3799590-12-smostafa@google.com>
Subject: [RFC PATCH v2 11/13] hw/arm/smmu: Refactor SMMU OAS
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 8Ea/nbuhzyFn

SMMUv3 OAS is hardcoded to 44 bits, for nested configurations that
can be a problem as stage-2 might be shared with the CPU which might
have different PARANGE, and according to SMMU manual ARM IHI 0070F.b:
    6.3.6 SMMU_IDR5, OAS must match the system physical address size.

This patch doesn't change the SMMU OAS, but refactors the code to
make it easier to do that:
- Rely everywhere on IDR5 for reading OAS instead of using the macro so
  it is easier just change IDR5 and it propagages correctly.
- Remove unused functions/macros: pa_range/MAX_PA

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c     |  7 ++++---
 hw/arm/smmuv3-internal.h | 13 -------------
 hw/arm/smmuv3.c          | 35 ++++++++++++++++++++++++++++-------
 3 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index b1cf1303c6..0710ee6b7d 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -430,7 +430,8 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
     inputsize = 64 - tt->tsz;
     level = 4 - (inputsize - 4) / stride;
     indexmask = VMSA_IDXMSK(inputsize, stride, level);
-    baseaddr = extract64(tt->ttb, 0, 48);
+
+    baseaddr = extract64(tt->ttb, 0, cfg->oas);
     baseaddr &= ~indexmask;
 
     while (level < VMSA_LEVELS) {
@@ -543,8 +544,8 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
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
index e4dd11e1e6..b0d7ad6da3 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -596,19 +596,6 @@ static inline int oas2bits(int oas_field)
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
index 0e367c70ad..c377c05379 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -411,10 +411,10 @@ static bool s2t0sz_valid(SMMUTransCfg *cfg)
     }
 
     if (cfg->s2cfg.granule_sz == 16) {
-        return (cfg->s2cfg.tsz >= 64 - oas2bits(SMMU_IDR5_OAS));
+        return (cfg->s2cfg.tsz >= 64 - cfg->s2cfg.eff_ps);
     }
 
-    return (cfg->s2cfg.tsz >= MAX(64 - oas2bits(SMMU_IDR5_OAS), 16));
+    return (cfg->s2cfg.tsz >= MAX(64 - cfg->s2cfg.eff_ps, 16));
 }
 
 /*
@@ -435,8 +435,11 @@ static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
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
@@ -469,7 +472,15 @@ static int decode_ste_s2_cfg(SMMUTransCfg *cfg, STE *ste)
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
@@ -545,6 +556,7 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
                       STE *ste, SMMUEventInfo *event)
 {
     uint32_t config;
+    uint8_t oas = FIELD_EX32(s->idr[5], IDR5, OAS);
     int ret;
 
     if (!STE_VALID(ste)) {
@@ -588,8 +600,8 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
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
@@ -715,6 +727,7 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
     int i;
     SMMUTranslationStatus status;
     SMMUTLBEntry *entry;
+    uint8_t oas = FIELD_EX32(s->idr[5], IDR5, OAS);
 
     if (!CD_VALID(cd) || !CD_AARCH64(cd)) {
         goto bad_cd;
@@ -733,7 +746,7 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
     cfg->aa64 = true;
 
     cfg->oas = oas2bits(CD_IPS(cd));
-    cfg->oas = MIN(oas2bits(SMMU_IDR5_OAS), cfg->oas);
+    cfg->oas = MIN(oas2bits(oas), cfg->oas);
     cfg->tbi = CD_TBI(cd);
     cfg->asid = CD_ASID(cd);
     cfg->affd = CD_AFFD(cd);
@@ -762,6 +775,14 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
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
2.44.0.478.gd926399ef9-goog
