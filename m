Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp597641ejj;
        Mon, 25 Mar 2024 03:15:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUeDc96Ya+Ek/qSdfUQr1G5M1twc/Tv7ey99ibuBs15AyLLAsOH7y+CAhcUxqDtbmvk2DLlCzasILMdcFPzMd9J1m8sdCfp
X-Received: by 2002:a5d:6387:0:b0:341:ab6c:71e4 with SMTP id p7-20020a5d6387000000b00341ab6c71e4mr4935491wru.19.1711361726658;
        Mon, 25 Mar 2024 03:15:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711361726; cv=none;
        d=google.com; s=arc-20160816;
        b=lYICLQhL502Eunzsbx1a7A/gXyf+OCpVLqg6IZR31GSSFt5E5ZPJ/hmwVm5u4ouQcE
         dyZDMu/FdPa3/ZGN95LbqhLKsn/ohID+tU2JGCbRKMmuQDWMv95Bafey0GRG/lKM9r+X
         JRdQEUphAPtBjfOAu7MaOvvyDhIVM1dJqcB2WVw0YpXY364xM5EQepQmFin2zyOANfiq
         1U7HXzJUO1hjQJ1Zx+SQiGNKsm3lTGriqjh8LBqzISzMptVCuBIiFqafGgDMLyuWAB3N
         vzPcQWc3IQjvRM+9uktZPaL4ejH7pLIGon/FtQiQzGuQEfBrRGah8BmXaRlFj3SMfU6n
         t8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=UqHTaZygPYcO5rxnIuRiQBfEhEaYRf9U7Q9zvZX8j20=;
        fh=fwqb8yS6iBPJTtCji1n1sp6Tx0yjcYxw5p9okkEil5Q=;
        b=K1FtEoLPvSbnrIy0vU2xYhkdOdHtZ4t9cEU4C4M1JE+JlhSCGZV9tu5BdSjMaeqSAg
         2iT3V14skk5C0nySquLPHm6xTRCdBG0gTBlRt3RU/wbNxiyLRWRwU4yBZxSa0gws727O
         3G1q7lyj14UoRZVV4soexR/pva2ugrEnO9FDRKt+M4ulgMS596qq82jVpzTxa5RbeixQ
         zM/ACchF6e70pKYo2oPecG5H6Hpn1IPVHGUF9qBlhmYskkc8dpqomcp+mQa+1stoyr+k
         CSQMeRLnT5I1pt8K/U330FjAgsoKNslw5BS+Gfkg/0EFQUywQwTTsACqzYF7x47MUg3x
         8gOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=MREXLyl5;
       spf=pass (google.com: domain of 3vk4bzggkc5cjdfjk1617ff7c5.3fd1c5o.25ee55c9e1if.fi7@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3vk4BZggKC5cJDFJK1617FF7C5.3FD1C5O.25EE55C9E1IF.FI7@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3vk4BZggKC5cJDFJK1617FF7C5.3FD1C5O.25EE55C9E1IF.FI7@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id j22-20020a05600c1c1600b004147d14de67sor974302wms.4.2024.03.25.03.15.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Mar 2024 03:15:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3vk4bzggkc5cjdfjk1617ff7c5.3fd1c5o.25ee55c9e1if.fi7@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=MREXLyl5;
       spf=pass (google.com: domain of 3vk4bzggkc5cjdfjk1617ff7c5.3fd1c5o.25ee55c9e1if.fi7@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3vk4BZggKC5cJDFJK1617FF7C5.3FD1C5O.25EE55C9E1IF.FI7@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711361726; x=1711966526; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UqHTaZygPYcO5rxnIuRiQBfEhEaYRf9U7Q9zvZX8j20=;
        b=MREXLyl5fv8ivsWUW/EnoOfEHgQzf7a9/PMstQPFZAQyoIcLt6b7AGZRWnVgLYb4Ff
         TA6XWrf5iEP4rxyP4Dd0fQM7Iw5mpqa9PxWcSY67Hl7SkAEc20cAZYAeKqbsKl3jaSnu
         O4BJGLiClJG9Jrsv5qMp+JPqqa0TMO7QHL6ocOYTLpjPOMGknxKKhfYJQwygQYCbzAL5
         7d72i9AGc7ca4rbaDJ2Q3jP1GFz3kwgNTs+DINGa9sGv4SrpZuTUQih0li94tOSbaTpd
         gTDw0nzy1PUHha+vwYZm9SWGNt/WfBvT63DInfDbrx32evLfpRL4ELrxvA36Or23UUdZ
         9E+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711361726; x=1711966526;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UqHTaZygPYcO5rxnIuRiQBfEhEaYRf9U7Q9zvZX8j20=;
        b=V8C516Zs7Vs09NoAkCMMgB00Xm2mmh36rwbmFe+97oWIW6X9dRD/HnPNPwjL/r97xM
         mpSbywxi93RT1TpIOvbB/ArKmyIWhPWOZfqD/VxEBWZOwoI7c7MWgNxNXPixtdd8kdLq
         0/IHrE4OEFaTriN6oiTcj6z7vVjQpcrR85+0g1oakehjyioi8KtUbM3cKq+2QbPL3WlX
         Y8/TvzqWQYXkqY3gzq6P5Hm696N6cFQMh6P1T1FSPso6is5e2UGteY4LGFYVcF0gCuP4
         E2g5Cyo+yFQRuUoCtmxbO7vEodnsBPLzzbyswMkOeG6pVv6QJnPZG+pknMyjrB26pddd
         rYvA==
X-Forwarded-Encrypted: i=1; AJvYcCUR5YZC/avYSe7UGGzNkxYWv9R7UakH1JlsU6yriIdgKOQ5KNK6MT3b0NPXOSWgoUlwrzPgz8lLFUskkI8eevM0cPfG/BQs
X-Gm-Message-State: AOJu0YwvaAm/nu0bG1d0qTx+XAA+mjIUbxI11RY2nO4PPZR7mva1P0iC
	FovrWnC5T1aaOTsAdkXQc5KGX8Bx+1LcnAQgoakHkjl491dlmfNg6SIEm1KPW1bVZRFgLvfZyzh
	xkl/ja403+A==
X-Google-Smtp-Source: AGHT+IE1t+lKZzlbnFZB5V+GeOeAMERzDwRCPrC4b+TazQQ3uYAzYTnWh7CI6q8SW9xI20Bk7kR7DFVqtfDLhQ==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:1396:b0:414:64b3:5036 with SMTP
 id u22-20020a05600c139600b0041464b35036mr144885wmf.3.1711361726440; Mon, 25
 Mar 2024 03:15:26 -0700 (PDT)
Date: Mon, 25 Mar 2024 10:14:06 +0000
In-Reply-To: <20240325101442.1306300-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240325101442.1306300-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <20240325101442.1306300-11-smostafa@google.com>
Subject: [RFC PATCH 10/12] hw/arm/smmu: Refactor SMMU OAS
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 6JZtbhlLo1Mx

SMMUv3 OAS is hardcoded to 44 bits, for nested configurations that
can be a problem as stage-2 might be shared with the CPU which might
have different PARANGE, and according to SMMU manual ARM IHI 0070F.b:
    6.3.6 SMMU_IDR5, OAS must match the system physical address size.

This patch doesn't change the SMMU OAS, but refactors the code to
make it easier to do that:
- Rely everywhere on IDR5 for reading OAS instead of using the macro so
  it is easier just change IDR5 and it propagages correctly.
- Make the code work if OAS is 52 bits.
- Remove unused functions/macros: pa_range/MAX_PA

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c     |  7 ++++---
 hw/arm/smmuv3-internal.h | 15 ++-------------
 hw/arm/smmuv3.c          | 35 ++++++++++++++++++++++++++++-------
 3 files changed, 34 insertions(+), 23 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index da8776ecec..a4196ddd22 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -359,7 +359,8 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
     inputsize = 64 - tt->tsz;
     level = 4 - (inputsize - 4) / stride;
     indexmask = VMSA_IDXMSK(inputsize, stride, level);
-    baseaddr = extract64(tt->ttb, 0, 48);
+
+    baseaddr = extract64(tt->ttb, 0, cfg->oas);
     baseaddr &= ~indexmask;
 
     while (level < VMSA_LEVELS) {
@@ -472,8 +473,8 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
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
index e4dd11e1e6..a7d53b3854 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -592,23 +592,12 @@ static inline int oas2bits(int oas_field)
         return 44;
     case 5:
         return 48;
+    case 6:
+        return 52;
     }
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
index 288e7cf1ae..2a29e3bccb 100644
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
@@ -591,8 +603,8 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
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
@@ -718,6 +730,7 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
     int i;
     SMMUTranslationStatus status;
     SMMUTLBEntry *entry;
+    uint8_t oas = FIELD_EX32(s->idr[5], IDR5, OAS);
 
     if (!CD_VALID(cd) || !CD_AARCH64(cd)) {
         goto bad_cd;
@@ -736,7 +749,7 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
     cfg->aa64 = true;
 
     cfg->oas = oas2bits(CD_IPS(cd));
-    cfg->oas = MIN(oas2bits(SMMU_IDR5_OAS), cfg->oas);
+    cfg->oas = MIN(oas2bits(oas), cfg->oas);
     cfg->tbi = CD_TBI(cd);
     cfg->asid = CD_ASID(cd);
     cfg->affd = CD_AFFD(cd);
@@ -765,6 +778,14 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
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
2.44.0.396.g6e790dbe36-goog
