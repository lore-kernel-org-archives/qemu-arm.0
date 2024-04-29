Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp1931886ejb;
        Sun, 28 Apr 2024 20:25:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWCJMHyQ7TH5ypRrcotR5ZXIvkMbxHQPG8H/8QTOq91woP+MtFRjdg5X6MiyvDNWjYZpc0k7yhuoJ1efQFT2AOy/vxoZ1s0
X-Received: by 2002:a05:690c:6910:b0:615:10f8:124a with SMTP id if16-20020a05690c691000b0061510f8124amr9431407ywb.29.1714361110558;
        Sun, 28 Apr 2024 20:25:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714361110; cv=none;
        d=google.com; s=arc-20160816;
        b=dyogt0Yk3oOZwQKLfWF0UUe9LfMCq0bPT1kLSdxWvAd79JgrWMrMXdMFIYILMMuJ0/
         7g0MEOQn8otVsJXgp4EEbT3WZIavrgn3T8lexYGKY3XNi1X6hLXx5H9J4VRoCpRaXjOr
         ANIQuG78AlxsOtpmD2UjTNr2aAQU+cDNdL1WyKqFcYIfI3BmXz+hQViPLeqeJEPQJ8o1
         58Ljp9A15s9mhctN8SKOS+OPTZ4QbsiwpHHvvmfxph89hwMM8hiH3CEM9jOuImGemr3D
         S3GmspkTCg0wGspXjLGa7R7d+YtBrdePMW07bEoIev516tTPNjDu1Udal+JuyXme8sqG
         Y1kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=Sile4dgLuAqxQejihMVViL06ZXv9HwH/J4mfmnIQJvE=;
        fh=0sLQA3CLLY/q+5WsVYI5TfRROW3ITFUdWhKr+jtqPFE=;
        b=VwN7s+X5DrSdI/OQF2BOx+DLM5W2XdkmDpBPkw8KCDo81u/gHv9L9pUutMUN6vB5OR
         8ElEDapEiILZOJcLwUU7jQ7HajtlzjhisWHzpyQ2g2P+qFUMv1tEyWFtzHVSZ6JAgGOz
         vigDNO7/2QNQ+ktI8YCtFkZR49HXhEbBCZWMya8UsnBPayN8UkpWW9emFsSi3+M9R7gX
         WvLghSM+tctO3qVwe4ptGSQ1n1Hzuan1AYs83aJamkOWrqdzvVK8H/FetEGelZi1o2W8
         N12ditUFZshRSjmhZPywdsrn8K4u0I2Iwq5YIFG+nAdrko8/NuNQTYx69DR0E41f4vFX
         Pf7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=rJcQ79Mj;
       spf=pass (google.com: domain of 3fhmvzggkczefzbfgnsntbbtyr.pbznyrk.oraarryvaneb.bet@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3FhMvZggKCzEfZbfgNSNTbbTYR.PbZNYRk.ORaaRRYVaNeb.beT@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3FhMvZggKCzEfZbfgNSNTbbTYR.PbZNYRk.ORaaRRYVaNeb.beT@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id m21-20020a0dca15000000b0061ae5222053sor20583828ywd.2.2024.04.28.20.25.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 28 Apr 2024 20:25:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3fhmvzggkczefzbfgnsntbbtyr.pbznyrk.oraarryvaneb.bet@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=rJcQ79Mj;
       spf=pass (google.com: domain of 3fhmvzggkczefzbfgnsntbbtyr.pbznyrk.oraarryvaneb.bet@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3FhMvZggKCzEfZbfgNSNTbbTYR.PbZNYRk.ORaaRRYVaNeb.beT@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714361110; x=1714965910; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sile4dgLuAqxQejihMVViL06ZXv9HwH/J4mfmnIQJvE=;
        b=rJcQ79MjU/chfpcbkCvprTy/CEnt/LplvFSnYYXcU5U+ZfZWTeRoeCDVzLBpl0/8o3
         Rke5PIJ/aNwwAADm83IahsqALkLVdDjYgdaN383YjZmBFOzTPO9C3sjxBYJ4q8Bss7b3
         88w6gAFcjQwO3sZ4HI3ss2F0zR6ctrIBuyQxxXxmDkZod6sNoe0AXV97z2nxsSpgdZo4
         kDavHXlHonv3ZvH6bJ13tDEMKZSkI3aK9XzBO60RibjBL/2YOJxIuLaP+wH/ym748f0w
         ghIW0ZU+rW8+6A0dW8iEOsQItr1vrshOW2wNlyWk1mau3XRIyV2Khs20vZK/fqKPg5ao
         bGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714361110; x=1714965910;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sile4dgLuAqxQejihMVViL06ZXv9HwH/J4mfmnIQJvE=;
        b=KATZK5VVnkV9PWoyJpDdEd/BljnTdGqVZXo+KBeS25F7GKw38zjfkDCakxw7pcuBlV
         gHRCjpFdWSVZInRAB0hYCiS3jkKLBmE/5R1wCeQdOdEspfQ6BCSlnjLgHTzeIh7CmGJr
         HyjL4yIZBgicjUyLOAsLIPhu9xOXCkLhB47hNvdKGofcY2Jc+fMjU3/9e6dOJy5XDGfN
         SHJhwXevZcvE+5pYMmdj2QiFvnq4jqzITd4SwV1JKGhdDL9KZ59bQ3IUldDGiVIQoX5w
         zmbuZXJltpS7HrW15RhSmXxPpmWV98Umv7RLzpnxV0Pq4pPmti2QCwcq2spxQyiWJ4/Z
         OfjA==
X-Forwarded-Encrypted: i=1; AJvYcCVgqPNkVtL8F6VTH23jynMN58ULNnWbdKTKfk/W4uIG2FOwQbLAYeFsQME5CJben2qdGCHiDN3M95ITK85Q6X1I4+v9jq/Z
X-Gm-Message-State: AOJu0YxAJpA67wUeBCnPXlLqvc9Wf9Yk9b2x7chFi4Fsobfh5X1CdaGN
	cNruA2ocd/DCE4q5y3vPXTo39PRabcK26nzFMBA8o/V1yZHWrwphhA/VwgMJ3OwQm2muChOJTDV
	NtWzDnQeo7A==
X-Google-Smtp-Source: AGHT+IHqPuVE+l7Grm4xZu5oaalexsLgUXPmWuCqJ7gES26egrv3q7WjewY0OyK1K35J8jI8GU37OLjH6VSvLg==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a0d:d8d0:0:b0:61b:2122:84b2 with SMTP id
 a199-20020a0dd8d0000000b0061b212284b2mr2390514ywe.10.1714361110035; Sun, 28
 Apr 2024 20:25:10 -0700 (PDT)
Date: Mon, 29 Apr 2024 03:24:00 +0000
In-Reply-To: <20240429032403.74910-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240429032403.74910-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240429032403.74910-17-smostafa@google.com>
Subject: [RFC PATCH v3 16/18] hw/arm/smmu: Refactor SMMU OAS
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: rjdyYqTgh5ag

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
index 3ed0be05ef..b559878aef 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -434,7 +434,8 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
     inputsize = 64 - tt->tsz;
     level = 4 - (inputsize - 4) / stride;
     indexmask = VMSA_IDXMSK(inputsize, stride, level);
-    baseaddr = extract64(tt->ttb, 0, 48);
+
+    baseaddr = extract64(tt->ttb, 0, cfg->oas);
     baseaddr &= ~indexmask;
 
     while (level < VMSA_LEVELS) {
@@ -557,8 +558,8 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
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
index 8a11e41144..4ac818cf7a 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -408,10 +408,10 @@ static bool s2t0sz_valid(SMMUTransCfg *cfg)
     }
 
     if (cfg->s2cfg.granule_sz == 16) {
-        return (cfg->s2cfg.tsz >= 64 - oas2bits(SMMU_IDR5_OAS));
+        return (cfg->s2cfg.tsz >= 64 - cfg->s2cfg.eff_ps);
     }
 
-    return (cfg->s2cfg.tsz >= MAX(64 - oas2bits(SMMU_IDR5_OAS), 16));
+    return (cfg->s2cfg.tsz >= MAX(64 - cfg->s2cfg.eff_ps, 16));
 }
 
 /*
@@ -432,8 +432,11 @@ static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
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
@@ -466,7 +469,15 @@ static int decode_ste_s2_cfg(SMMUTransCfg *cfg, STE *ste)
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
@@ -542,6 +553,7 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
                       STE *ste, SMMUEventInfo *event)
 {
     uint32_t config;
+    uint8_t oas = FIELD_EX32(s->idr[5], IDR5, OAS);
     int ret;
 
     if (!STE_VALID(ste)) {
@@ -585,8 +597,8 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
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
@@ -712,6 +724,7 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
     int i;
     SMMUTranslationStatus status;
     SMMUTLBEntry *entry;
+    uint8_t oas = FIELD_EX32(s->idr[5], IDR5, OAS);
 
     if (!CD_VALID(cd) || !CD_AARCH64(cd)) {
         goto bad_cd;
@@ -730,7 +743,7 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
     cfg->aa64 = true;
 
     cfg->oas = oas2bits(CD_IPS(cd));
-    cfg->oas = MIN(oas2bits(SMMU_IDR5_OAS), cfg->oas);
+    cfg->oas = MIN(oas2bits(oas), cfg->oas);
     cfg->tbi = CD_TBI(cd);
     cfg->asid = CD_ASID(cd);
     cfg->affd = CD_AFFD(cd);
@@ -759,6 +772,14 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
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
2.44.0.769.g3c40516874-goog
