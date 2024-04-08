Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1293595ejh;
        Mon, 8 Apr 2024 07:09:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSppOF+dY9G/EQOHDRmzKGwTrBEDZLR6gWhCRluHc5zKbSHpaRtr4YMFRc+gI7fEu7n/MVeqfxDR8wy5pm/lc77qcDoTLa
X-Received: by 2002:a0d:ef83:0:b0:60a:4c79:c429 with SMTP id y125-20020a0def83000000b0060a4c79c429mr7514570ywe.30.1712585342764;
        Mon, 08 Apr 2024 07:09:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712585342; cv=none;
        d=google.com; s=arc-20160816;
        b=QmKlykFP2Ucvt17CJnoD0HDpXP+qp+fb2ALCKE6zq5KBxPTMCJ10gb/aD8flpq1oPp
         +Oyy6KF5X6YTNXGbcZLRuxlSEqR8vbjMp9kumwJqy0j7IKlllR9sHJsThu4rRARVQMOA
         dYnL22ySilaFn4bHnXlcBbKG4Ex2KYU0/q62W+kAs1zX81NgzhBDDCiK/Rk/AZ/3pgvC
         tio04hCUhpPRCixks9oTiu867B7tHizutkFxVtypSzX86CevfJZfQ4Vu3o+CMi7H0Q6Y
         Dzk309oiwbmF/BLJCQ9C8IVJ4UoNeawiedJWaW4FrPB5jxMbqTQezeumKDbJcpDAK+kq
         e+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=BCpk0bqjnQgYw45bmFeRBdeibilZssgbLzBrwwIszIA=;
        fh=Osee1xZWIR/PuHrZStYa9tyIHj4AbX3L835JLCdsKl8=;
        b=iVcS1EfFWgEmdJG6G88P4skBlTeQk4B4lP+LYPa1QqaDQAp1hFu18iOL5XnUff87B2
         vmMyh8m0QeQ6SqUGEjUhu3o0ZHNXqW8TA9PoC4OwjykpO9Sdx+OsReJBzlnpYfkrgSMy
         jZsbuuXPZGniMyhPgqd5+I62Ae73N2TeqxZgAOd4/7bBgrwkrZdDU6zo7+Dn7w/erLHj
         poXYU9Nasa5D46uBpFXZg0qXAyAxRacf/QqkdhSzbCbiObv4ywD5LktuTUXQYsIipbNu
         8xCh+wRcN08aGplua63yUSDxVZvVesyrWDDnetTu2Jai9IzAe8D2CveKUt02iOhVk84u
         Sapw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=IBekFuqR;
       spf=pass (google.com: domain of 3fvotzggkc_ktnptubgbhpphmf.dpnbmfy.cfooffmjobsp.psh@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3fvoTZggKC_ktnptubgbhpphmf.dpnbmfy.cfooffmjobsp.psh@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3fvoTZggKC_ktnptubgbhpphmf.dpnbmfy.cfooffmjobsp.psh@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id i64-20020a819143000000b00615144bb205sor3530063ywg.19.2024.04.08.07.09.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 08 Apr 2024 07:09:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3fvotzggkc_ktnptubgbhpphmf.dpnbmfy.cfooffmjobsp.psh@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=IBekFuqR;
       spf=pass (google.com: domain of 3fvotzggkc_ktnptubgbhpphmf.dpnbmfy.cfooffmjobsp.psh@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3fvoTZggKC_ktnptubgbhpphmf.dpnbmfy.cfooffmjobsp.psh@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712585342; x=1713190142; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BCpk0bqjnQgYw45bmFeRBdeibilZssgbLzBrwwIszIA=;
        b=IBekFuqROFsRp3f1eRQxJuDoMxNTfGpXNBN+nJSmRNjwTm0x3PqOd5g+hFvzMTsSRX
         0Fg6KaahSQIufywMkrLSekof7Yfa/O7OS42wC1/WjIq9ks0G7q4Zhj+Aaz0nyS1IZ+R1
         oOKObt7Rn4yXwTUCV0Dgk69BJxbRTQB7oHsHUHobRLAa+7w0M0Rv/RDrh7Q3i8M9NEDO
         ztB4KE/mZligOMf6igBDJGp2mvXFl2IXbxEzirt4jq0XuXnzLXmdcESkB94QS0rEojoM
         sHGAtUryccrnGZOT2Trie6LQIeCVBclJYB1nWh/23VP99zeAqwsED8jP7WlSqLTQlgBc
         aW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712585342; x=1713190142;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BCpk0bqjnQgYw45bmFeRBdeibilZssgbLzBrwwIszIA=;
        b=QOD7yz+dqwkkun1M2v+GnU8OB5LkhOI8zjdk5ggYbSOiKmsIWkvF8TctyPRMr2Dwo4
         3/5/dG0Qvq6F+1iVDGQ4DSoiGkUw5ZCiS9lcExsW8V9fNE8armJl0nnqcr+F+ys6L65E
         m2MAXkxLgCS3Vw1ta7vbeY+o47XiwDKHItSQmW0U+ZDG+Z1LXoK9ilmLTCLOrXOjhA5/
         xo+12JiiIXMmbBPiHCu0tIpIVnnU25EbKNmLMe14zdEqChK+HlbwE7AACmNusUsM2g52
         1j9Yb/Vr5R1KhrwCepH0BSfHsBCu2DAHEuP/l/srnyhIDWiVB2Nnrcy8FIMvIfBsTTZI
         w5Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUgWkuPusm02LRC3qhRiuZLuyQH2Fk7pGitMJqmUjbS0BYPc+krb3mWnu8F2YH9c7BXyhLdXnhVtvG8Xfnbt1Rr/qrj7RxA
X-Gm-Message-State: AOJu0YyzuQmc8Rbby/RuIk+ZwE+Km//4rx6GTp9HQFMBRCU5DwyFpT/q
	f3wlowBr5kIWNEQj8hAUSsK6divGjX3f/NcHEkWdqjFk+weFgxZJh6h+bxxcQI8M5VFe2KUCumG
	RMQuinMTExw==
X-Google-Smtp-Source: AGHT+IHQ4jTTdpvQf+yX8IXPSjHwTo5O55siDyTFjW+nkl/JR5ZcB9Tiubk7sEaO7hp1ovpWE+u7ZjdkhOGxxw==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a81:7b54:0:b0:618:24ca:381f with SMTP id
 w81-20020a817b54000000b0061824ca381fmr44771ywc.8.1712585342258; Mon, 08 Apr
 2024 07:09:02 -0700 (PDT)
Date: Mon,  8 Apr 2024 14:08:06 +0000
In-Reply-To: <20240408140818.3799590-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240408140818.3799590-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240408140818.3799590-2-smostafa@google.com>
Subject: [RFC PATCH v2 01/13] hw/arm/smmu: Use enum for SMMU stage
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: sZg1EKNJbBTc

Currently, translation stage is represented as an int, where 1 is stage-1 and
2 is stage-2, when nested is added, 3 would be confusing to represent nesting,
so we use an enum instead.

While keeping the same values, this is useful for:
 - Doing tricks with bit masks, where BIT(0) is stage-1 and BIT(1) is
   stage-2 and both is nested.
 - Tracing, as stage is printed as int.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmu-common.c         | 14 +++++++-------
 hw/arm/smmuv3.c              | 15 ++++++++-------
 include/hw/arm/smmu-common.h | 11 +++++++++--
 3 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 4caedb4998..3a7c350aca 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -304,7 +304,7 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
                           SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
 {
     dma_addr_t baseaddr, indexmask;
-    int stage = cfg->stage;
+    SMMUStage stage = cfg->stage;
     SMMUTransTableInfo *tt = select_tt(cfg, iova);
     uint8_t level, granule_sz, inputsize, stride;
 
@@ -392,7 +392,7 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
     info->type = SMMU_PTW_ERR_TRANSLATION;
 
 error:
-    info->stage = 1;
+    info->stage = SMMU_STAGE_1;
     tlbe->entry.perm = IOMMU_NONE;
     return -EINVAL;
 }
@@ -415,7 +415,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
                           dma_addr_t ipa, IOMMUAccessFlags perm,
                           SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
 {
-    const int stage = 2;
+    const SMMUStage stage = SMMU_STAGE_2;
     int granule_sz = cfg->s2cfg.granule_sz;
     /* ARM DDI0487I.a: Table D8-7. */
     int inputsize = 64 - cfg->s2cfg.tsz;
@@ -513,7 +513,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
     info->type = SMMU_PTW_ERR_TRANSLATION;
 
 error:
-    info->stage = 2;
+    info->stage = SMMU_STAGE_2;
     tlbe->entry.perm = IOMMU_NONE;
     return -EINVAL;
 }
@@ -532,9 +532,9 @@ error:
 int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
              SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
 {
-    if (cfg->stage == 1) {
+    if (cfg->stage == SMMU_STAGE_1) {
         return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
-    } else if (cfg->stage == 2) {
+    } else if (cfg->stage == SMMU_STAGE_2) {
         /*
          * If bypassing stage 1(or unimplemented), the input address is passed
          * directly to stage 2 as IPA. If the input address of a transaction
@@ -543,7 +543,7 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
          */
         if (iova >= (1ULL << cfg->oas)) {
             info->type = SMMU_PTW_ERR_ADDR_SIZE;
-            info->stage = 1;
+            info->stage = SMMU_STAGE_1;
             tlbe->entry.perm = IOMMU_NONE;
             return -EINVAL;
         }
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 9eb56a70f3..50e5a72d54 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -34,7 +34,8 @@
 #include "smmuv3-internal.h"
 #include "smmu-internal.h"
 
-#define PTW_RECORD_FAULT(cfg)   (((cfg)->stage == 1) ? (cfg)->record_faults : \
+#define PTW_RECORD_FAULT(cfg)   (((cfg)->stage == SMMU_STAGE_1) ? \
+                                 (cfg)->record_faults : \
                                  (cfg)->s2cfg.record_faults)
 
 /**
@@ -402,7 +403,7 @@ static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
 
 static int decode_ste_s2_cfg(SMMUTransCfg *cfg, STE *ste)
 {
-    cfg->stage = 2;
+    cfg->stage = SMMU_STAGE_2;
 
     if (STE_S2AA64(ste) == 0x0) {
         qemu_log_mask(LOG_UNIMP,
@@ -678,7 +679,7 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
 
     /* we support only those at the moment */
     cfg->aa64 = true;
-    cfg->stage = 1;
+    cfg->stage = SMMU_STAGE_1;
 
     cfg->oas = oas2bits(CD_IPS(cd));
     cfg->oas = MIN(oas2bits(SMMU_IDR5_OAS), cfg->oas);
@@ -762,7 +763,7 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
         return ret;
     }
 
-    if (cfg->aborted || cfg->bypassed || (cfg->stage == 2)) {
+    if (cfg->aborted || cfg->bypassed || (cfg->stage == SMMU_STAGE_2)) {
         return 0;
     }
 
@@ -882,7 +883,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         goto epilogue;
     }
 
-    if (cfg->stage == 1) {
+    if (cfg->stage == SMMU_STAGE_1) {
         /* Select stage1 translation table. */
         tt = select_tt(cfg, addr);
         if (!tt) {
@@ -919,7 +920,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
              * nesting is not supported. So it is sufficient to check the
              * translation stage to know the TLB stage for now.
              */
-            event.u.f_walk_eabt.s2 = (cfg->stage == 2);
+            event.u.f_walk_eabt.s2 = (cfg->stage == SMMU_STAGE_2);
             if (PTW_RECORD_FAULT(cfg)) {
                 event.type = SMMU_EVT_F_PERMISSION;
                 event.u.f_permission.addr = addr;
@@ -935,7 +936,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
 
     if (smmu_ptw(cfg, aligned_addr, flag, cached_entry, &ptw_info)) {
         /* All faults from PTW has S2 field. */
-        event.u.f_walk_eabt.s2 = (ptw_info.stage == 2);
+        event.u.f_walk_eabt.s2 = (ptw_info.stage == SMMU_STAGE_2);
         g_free(cached_entry);
         switch (ptw_info.type) {
         case SMMU_PTW_ERR_WALK_EABT:
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 5ec2e6c1a4..b3c881f0ee 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -49,8 +49,15 @@ typedef enum {
     SMMU_PTW_ERR_PERMISSION,  /* Permission fault */
 } SMMUPTWEventType;
 
+/* SMMU Stage */
+typedef enum {
+    SMMU_STAGE_1 = 1,
+    SMMU_STAGE_2,
+    SMMU_NESTED,
+} SMMUStage;
+
 typedef struct SMMUPTWEventInfo {
-    int stage;
+    SMMUStage stage;
     SMMUPTWEventType type;
     dma_addr_t addr; /* fetched address that induced an abort, if any */
 } SMMUPTWEventInfo;
@@ -88,7 +95,7 @@ typedef struct SMMUS2Cfg {
  */
 typedef struct SMMUTransCfg {
     /* Shared fields between stage-1 and stage-2. */
-    int stage;                 /* translation stage */
+    SMMUStage stage;           /* translation stage */
     bool disabled;             /* smmu is disabled */
     bool bypassed;             /* translation is bypassed */
     bool aborted;              /* translation is aborted */
-- 
2.44.0.478.gd926399ef9-goog
