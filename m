Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp1931694ejb;
        Sun, 28 Apr 2024 20:24:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVo4VRS8ekZmnGNRX/9EEX+2LGitls3JzaKQUymtEYcjRFIAeKSEMf9+VYOlRgmZjivUXHrpSnFjtIN/pJ8coDXltpw3pyB
X-Received: by 2002:a05:6902:1351:b0:dd0:bb34:1e77 with SMTP id g17-20020a056902135100b00dd0bb341e77mr9290585ybu.53.1714361081992;
        Sun, 28 Apr 2024 20:24:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714361081; cv=none;
        d=google.com; s=arc-20160816;
        b=Yy6dOvwGFJbyyYwKrh1z/DNlwrB2IP75cQ3CvNWqZ9JYpQ59vO6yB7qKW7Im6zFK9e
         8jqr5Fy0m+4JP6x03HtVg5/xijrip5eMPi/L5Q8u+n6gIGy8tDnwOlC97jTJILFYeiho
         02ob0aKb6wKl658T/17I/QpogEt4szPnkX9ncJ/Qlsg3Tf9se6DIkIDszPrFS7Dod+kq
         ihCBBFi9pqiKngmgVQDDNBBcSQqouQGyBvp6a6gxft65+1Nd9b7UDPMHEhrDZ2KxWwbJ
         KuL2kD0SSgxGHIdbHutvg2/r4GGfX9d+8uo7gNAzzIDhTnvZtZc39ZunmhwCdIEpjdgY
         FZrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=sS5i+v0wHfbx/cskH+Q0YRdI0a2J9wbsy4mW+uWp54g=;
        fh=voBe8pj7uW7EXv+ZshyJeDKPPz6M+G1PPxT2kjhmra0=;
        b=kUnzzUX32gmosgLd8jgqQpHnzlPsF1+S5QMj95lSbLGUjqPLpKIxeyCdMjQqjPBSRL
         TgmapOKQS/HQNqstP6Dv+ScdeJNdpj0ldfM3ozsKbekk8UuwVlFwmvK+Gw5gECpyb6dz
         k1vT1Y/vla6zTrVBg0JDnoqyxTLPHjJXyEN5d5tWeiWV2Fj/ufgxmTR+5dZ61hdAnKQH
         AxfcMTHm1c6pNsFrAINIX76Ub4Va7GuSznnMkDVzB9WH55EA0tiQ1ZCpLFLAeEt525Rw
         52v5544rE91sSzX8V3n+h0uXb+LUYCryDZTburg7NTk0du1IT6R8A20SW/jAFVZwkQBG
         16Mg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=aTMymRiE;
       spf=pass (google.com: domain of 3-rivzggkcxqc68cduzu08805y.w86u5yh.vy77yy527ub8.8b0@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3-RIvZggKCxQC68CDuzu08805y.w86u5yH.vy77yy527uB8.8B0@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3-RIvZggKCxQC68CDuzu08805y.w86u5yH.vy77yy527uB8.8B0@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 129-20020a251487000000b00dc746a0d55dsor15721144ybu.10.2024.04.28.20.24.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 28 Apr 2024 20:24:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3-rivzggkcxqc68cduzu08805y.w86u5yh.vy77yy527ub8.8b0@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=aTMymRiE;
       spf=pass (google.com: domain of 3-rivzggkcxqc68cduzu08805y.w86u5yh.vy77yy527ub8.8b0@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3-RIvZggKCxQC68CDuzu08805y.w86u5yH.vy77yy527uB8.8B0@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714361081; x=1714965881; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sS5i+v0wHfbx/cskH+Q0YRdI0a2J9wbsy4mW+uWp54g=;
        b=aTMymRiEZVsPE1leggcUJZ0pVtyU+z96zTgJB8nFiDtxcw/sR0GpcKMTNxP5fQtM2D
         vnnsuhL5mZHM+oY7z/JQ9fIoc/7CzHii0Ncmj4Y5S+l2VXyRemBF2AIfkATLVPqaROMy
         KSjApQ8MmcMl45aHnRTGqBjm6tw6O+7OFElhRDyKxTTmqjSOzowswtcw31IzhOJkfJYD
         F2hfc7LWwEJElAp+ZlJIm5ZEKr0hJ/7XYiM9Q+MsByPzcEaVt8BEIrMoQ/R1rlDvB6Sg
         Zx1qto4vXnTZFKxpvS+CZt1xB4C34Lhn1fp5mTWuZFtgC+WT4AB9wubrCWGvjmYekv1e
         Jfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714361081; x=1714965881;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sS5i+v0wHfbx/cskH+Q0YRdI0a2J9wbsy4mW+uWp54g=;
        b=cD+S9jRrQjMWVJyQwcEujDH7jGzEm/PzWDKST7cRqHUbUxsNTxZhi8CX4bDFUUx9G4
         YwxgwIGEsH+b2b1DTCnJUd9R7iV+cNmqAKXZlbYgZmO9/Ht5qf+IaWJQx/0jiwyLy7si
         7KEa8bYJmsCly+2kwdKgPnHuTS5zLT3JjxOlzluI7Mh/l9giHsE6qahFplNdM+kXZh96
         C1mzObAFqNgeC55MxVQrzUOawoyX1DAVtxVHmpBIZL5DL0/OvOKDfNj7ZqHRTQkjC6Ja
         LIAw1UlT32gU7gUyFL2gcxyQj01cXMXphhInASFiPLX7MP6Mho5tnJU/ruc/0eQvJWqH
         fkzA==
X-Forwarded-Encrypted: i=1; AJvYcCU5NZQ23MMRcmB0fMvD2/n9fw8Z7LXKIux1nEqPnMCmfAi0zI/7OAKZfgmy+0wE47oDqrAy8Nmr5qbIT1CUjm3XRyL6pSQr
X-Gm-Message-State: AOJu0YwWq6tyF1FUaQsUtAzMgrPk7nh77wsurdT1jPy2gN/+OIMr0D6n
	C3fJB1iSY4jAaOVqj8AmJzxxhQTKPBiIBCRa5I5N4geXYgg7MdzJX/pthepxGpEF98giKKcwUv6
	ryQDAlIChsw==
X-Google-Smtp-Source: AGHT+IFM95cyg0UMB7gOlqnXEqYcXrMq9yS3Ex8oiFOWR79pILQV0oTL6eIoyzxus5UUSefJidj/7OOflQ4CEQ==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:1896:b0:dc6:fec4:1c26 with SMTP
 id cj22-20020a056902189600b00dc6fec41c26mr2684446ybb.1.1714361081551; Sun, 28
 Apr 2024 20:24:41 -0700 (PDT)
Date: Mon, 29 Apr 2024 03:23:48 +0000
In-Reply-To: <20240429032403.74910-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240429032403.74910-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240429032403.74910-5-smostafa@google.com>
Subject: [RFC PATCH v3 04/18] hw/arm/smmu: Use enum for SMMU stage
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: d/rSopzVhAPl

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
index 8a8c718e6b..8a5858f69f 100644
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
 
@@ -402,7 +402,7 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
     info->type = SMMU_PTW_ERR_TRANSLATION;
 
 error:
-    info->stage = 1;
+    info->stage = SMMU_STAGE_1;
     tlbe->entry.perm = IOMMU_NONE;
     return -EINVAL;
 }
@@ -425,7 +425,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
                           dma_addr_t ipa, IOMMUAccessFlags perm,
                           SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
 {
-    const int stage = 2;
+    const SMMUStage stage = SMMU_STAGE_2;
     int granule_sz = cfg->s2cfg.granule_sz;
     /* ARM DDI0487I.a: Table D8-7. */
     int inputsize = 64 - cfg->s2cfg.tsz;
@@ -525,7 +525,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
 error_ipa:
     info->addr = ipa;
 error:
-    info->stage = 2;
+    info->stage = SMMU_STAGE_2;
     tlbe->entry.perm = IOMMU_NONE;
     return -EINVAL;
 }
@@ -544,9 +544,9 @@ error:
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
@@ -555,7 +555,7 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
          */
         if (iova >= (1ULL << cfg->oas)) {
             info->type = SMMU_PTW_ERR_ADDR_SIZE;
-            info->stage = 1;
+            info->stage = SMMU_STAGE_1;
             tlbe->entry.perm = IOMMU_NONE;
             return -EINVAL;
         }
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 1eb5b160d2..dab3ad2db9 100644
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
2.44.0.769.g3c40516874-goog
