Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2118230nji;
        Mon, 15 Jul 2024 01:46:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUh/t9PhtTAcaDlf0BjhetIQafIuIDN1WURYQk/88yKbturaiG02tzlqJ1ZkNwDWIQtKIq8H0P+uFOnxeBaQ8cvFmzdLpYa
X-Received: by 2002:a05:600c:21a:b0:426:59fe:ac2e with SMTP id 5b1f17b1804b1-426707f812dmr131056775e9.29.1721033169867;
        Mon, 15 Jul 2024 01:46:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721033169; cv=none;
        d=google.com; s=arc-20160816;
        b=pHoBsWGvgvuiJAxceexkICJntHdqUmZ4y1wMX9YMb5UOnI2uJurrt/s6FRole6chRE
         OWgf5Aznr1K4bp1cg4rAvU5v2DwKxWhp427e29uPhEdld6qdcgvfEYfm7Q+LbrKylchs
         tbiR67qt+joz4/PlKtAEnpT72/lLtSod1FppqjFft9pAC59JvW8DP0CzSV6gm70SBrIh
         lM/EO4BK+r9c1za9/RVFc79yp9WbVLPdbZS1l2G4Mg7QQIJCXE3QidAF91/SoKzi9qgD
         c/z+8AI56e/S3rhgqUZnpJXiA4y3nF90ck9I02ef0nMgL+63mj20oWlCyhCZ82LjgPrs
         i2+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=kj36bY1MZTmA3fn0hogzzbR0HenoL/hm4YWjDVye+LY=;
        fh=TPCOiTrkzjlD5KjwEobeORZcu+Ux3JrynJxBwz+K9aY=;
        b=wWvmADJ23tEi78qEU0rF/0zu+84ppL0lliE+loPXUKiF5wYaYdrHuxQKH6oqYjws7/
         um4/mAAZ+jbzuYN86F1PbNT1KulQtGDTX3nqJC8nE4+qJyWUwH5b2UZimHRgJ5h4U+Uy
         lbiq4UUyFqg6G90zqTX5ilMGmYcpVb/r9xpXOOP3fZqnXrFKcky2EQNz/9A4v42rHTYX
         eqnWaZmAHJ9TonFa5BC9boFTm8f9DunnkJL4AClCZB9zEsaocIfuxi1+bTWalRsvv0Zu
         P4u3JaCID6MtrsMb4M7oke7KTuRbREXrmXPYrZSfztVfDFFlCfckYLxVfF+vF1pOWRta
         RxPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=P8XKCTwC;
       spf=pass (google.com: domain of 30eguzggkcyqsmostafagoogle.comalex.benneelinaro.org@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=30eGUZggKCyQSMOSTAFAGOOGLE.COMALEX.BENNEELINARO.ORG@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <30eGUZggKCyQSMOSTAFAGOOGLE.COMALEX.BENNEELINARO.ORG@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 5b1f17b1804b1-427a641906asor8877255e9.11.2024.07.15.01.46.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Jul 2024 01:46:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of 30eguzggkcyqsmostafagoogle.comalex.benneelinaro.org@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=P8XKCTwC;
       spf=pass (google.com: domain of 30eguzggkcyqsmostafagoogle.comalex.benneelinaro.org@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=30eGUZggKCyQSMOSTAFAGOOGLE.COMALEX.BENNEELINARO.ORG@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721033169; x=1721637969; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kj36bY1MZTmA3fn0hogzzbR0HenoL/hm4YWjDVye+LY=;
        b=P8XKCTwCmC3fPvzNYbNaMHF7xTTb3f2JOtJoputL6/NruxB82+w3TgI69twPCRefL8
         AWzFg9wPBKt+O8vsADccKby73rg1kNxBXraEBhr3nDwpUrXvTBtbu5GbspWsO2wbN9qE
         PUdU2gA1QWsvUde7ANfWJmsWtQWyM1uuFuT1fMeHdKY+rulBgyNHewIUCelhraOgwALN
         QbjHyI8qSIilqSqUFZTr7W07xwERFJ+xD5CaqBFR2i1GaxiF5xbXx5ViS4S3oMQbPdFv
         8wHGZd3Xu0/1ol7lz8K1VlsItCrt/FpyUmAyHIp3Fh3tp07clfUEY5RSsdrRhBOtPJjL
         6VvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033169; x=1721637969;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kj36bY1MZTmA3fn0hogzzbR0HenoL/hm4YWjDVye+LY=;
        b=b01WwGgKZYX/7tDsTZBJ8LBFLAa7UIvvG3iAWWT597vuTfnEoQM4EVzWkzXuC0AxnZ
         Ra5lpJalHwkrj9C0xIZzbtvBCD9kcukQLHJcVGl3TW004epbm+ulRMZwAAF7hbg27rbs
         x1JByTDoDRd9axcif4e/nMAyC7h3Jj2pL4kecwZMEmQ7u/TBrSDSYE9Bzciz8loDIr36
         1zqffaWEac8phi87nkyO48ZCK2EHiMQp6YJtlJ5O5tA34nPmrFVZ7PcfIB+XGApvnvgM
         9TSyGnhJUUlsHGum4cg7UcxHC0ZTh/wIX064CgKrFkOqdltJ2JmCeDUvtPM1Pdrw9dZp
         Izjg==
X-Forwarded-Encrypted: i=1; AJvYcCUDP0eCO1u9je67fmr0cKmkfrjmoosob8i+oCxOlQ22AG3aP1gQA7OvwgfW1cK+1k77NrkOjY6rZz1mpc/7Ri9gw9wyRoUc
X-Gm-Message-State: AOJu0Yyv8mjO+JgEXi8UlyEpdcM6o3sPMKeXi+nSaD2gkiTsrd6XUswy
	p9nMVhWM0MABxkFbxNSmjQZlZBDcP59K8RaPgLeuDBEje1cS32zWxfAzVzYBLA6UGO13V0CnKdE
	R8F8y00WLZA==
X-Google-Smtp-Source: AGHT+IE3yCMqArE3cgMvUT0H3jfFFd5ZEhuDMLDaM3jAWXcItxSXdUDMCvnTlFvbN/fuc7Qtufq69t4jc+J3hA==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:4fd3:b0:426:62a2:e0b with SMTP
 id 5b1f17b1804b1-426705cf7c4mr937075e9.2.1721033169264; Mon, 15 Jul 2024
 01:46:09 -0700 (PDT)
Date: Mon, 15 Jul 2024 08:45:18 +0000
In-Reply-To: <20240715084519.1189624-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240715084519.1189624-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240715084519.1189624-19-smostafa@google.com>
Subject: [PATCH v5 18/18] hw/arm/smmu: Refactor SMMU OAS
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: Gm3EqGvWaaNA

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
index 67cb134d23..7d8a353956 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -452,7 +452,8 @@ static int smmu_ptw_64_s1(SMMUState *bs, SMMUTransCfg *cfg,
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
index 32b1f4cb75..d119a8026f 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -402,10 +402,10 @@ static bool s2t0sz_valid(SMMUTransCfg *cfg)
     }
 
     if (cfg->s2cfg.granule_sz == 16) {
-        return (cfg->s2cfg.tsz >= 64 - oas2bits(SMMU_IDR5_OAS));
+        return (cfg->s2cfg.tsz >= 64 - cfg->s2cfg.eff_ps);
     }
 
-    return (cfg->s2cfg.tsz >= MAX(64 - oas2bits(SMMU_IDR5_OAS), 16));
+    return (cfg->s2cfg.tsz >= MAX(64 - cfg->s2cfg.eff_ps, 16));
 }
 
 /*
@@ -426,8 +426,11 @@ static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
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
@@ -460,7 +463,15 @@ static int decode_ste_s2_cfg(SMMUTransCfg *cfg, STE *ste)
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
@@ -536,6 +547,7 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
                       STE *ste, SMMUEventInfo *event)
 {
     uint32_t config;
+    uint8_t oas = FIELD_EX32(s->idr[5], IDR5, OAS);
     int ret;
 
     if (!STE_VALID(ste)) {
@@ -579,8 +591,8 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
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
@@ -706,6 +718,7 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
     int i;
     SMMUTranslationStatus status;
     SMMUTLBEntry *entry;
+    uint8_t oas = FIELD_EX32(s->idr[5], IDR5, OAS);
 
     if (!CD_VALID(cd) || !CD_AARCH64(cd)) {
         goto bad_cd;
@@ -724,7 +737,7 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
     cfg->aa64 = true;
 
     cfg->oas = oas2bits(CD_IPS(cd));
-    cfg->oas = MIN(oas2bits(SMMU_IDR5_OAS), cfg->oas);
+    cfg->oas = MIN(oas2bits(oas), cfg->oas);
     cfg->tbi = CD_TBI(cd);
     cfg->asid = CD_ASID(cd);
     cfg->affd = CD_AFFD(cd);
@@ -753,6 +766,14 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
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
2.45.2.993.g49e7a77208-goog
