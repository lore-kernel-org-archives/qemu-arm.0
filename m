Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp597469ejj;
        Mon, 25 Mar 2024 03:15:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXSIpkGUP+gT0EilaBY1gO6WXSHJyGGYirgtL/Gnl9yrKbLnlbFJpzDMkKqUeDQn/gHDV7i3kIlmej6F/7u+AQSFpU2DERT
X-Received: by 2002:a25:c7c1:0:b0:dcc:623d:e475 with SMTP id w184-20020a25c7c1000000b00dcc623de475mr4410141ybe.30.1711361706935;
        Mon, 25 Mar 2024 03:15:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711361706; cv=none;
        d=google.com; s=arc-20160816;
        b=0CsRUYG1H4KaJV7HpcDhYxzYBQQKOc3sZ+ohEoz0npzeTEEdhh54OTFEe028KTWakD
         1y2WzIPIpob97MgU1z7FHByG2/YtHXRIIeJ2itg5tfDcxjQZnODC1QbaCOAsVldzZ9GI
         mGdE4Kb5Gi7Da1R6Iw9XEt1OLmAettRCdLsqbNxXWf7N/ySuO0nSPi7HHTemZT1p2mUe
         JYqgDfQ4M7oz96u8wj1+IOpDM6fppcWbFdeD0PsS8hFmsxg08vV4T+RDcP7Y2HmlD7Lk
         QmsLnkuFjTJxHtCbdslXeimhS1YaCbPzBE+2xbYscAsDkHwOftOrHWwDLCn8aLBOBu09
         5Htw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=1NtgBd1Mca3tPMTdTj2CfLElT5NGWJBs2kmuXue+WGE=;
        fh=YyHMIw4vENeUN9jfH/h6rF0Us/jZFyyIYktnb0OO3D0=;
        b=dwqIZRzJFI2wdbC/JaFbf9le0bNiTvd35ybR0rqTecR7pxS08hMWtbnARVWVmwu026
         z7vjtiGUToAfzmoGs0b0MR/QaXrM5civ7eshTOgEhfR3oLFtAzlw1Q6v+6L3EM89Igbx
         wMvjpSBE0desvZn8NrEnsWJmPpoJ/UotNyfVuHTjUZZ4lo5ZQMZvwtrDTsJ6jOoQDLJF
         RY0ryjjpgenCPVONOKmnZPrPZN5MIhK61cznRO7BpLEvTNvi30QL8oYIrgcoHYN2CvPh
         qVKfVj3jD+8QrAEYuXFpxF62MYOFvUrag5iPTsjH6qseQFufI6v+AhHnUEoMndbz4A6M
         27Ww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=CAigYQq1;
       spf=pass (google.com: domain of 3qk4bzggkc4mztvz0hmhnvvnsl.jvthsl4.iluullspuhyv.vyn@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3qk4BZggKC4Mztvz0hmhnvvnsl.jvthsl4.iluullspuhyv.vyn@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3qk4BZggKC4Mztvz0hmhnvvnsl.jvthsl4.iluullspuhyv.vyn@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id e192-20020a25d3c9000000b00dc7494869dbsor2117304ybf.17.2024.03.25.03.15.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Mar 2024 03:15:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3qk4bzggkc4mztvz0hmhnvvnsl.jvthsl4.iluullspuhyv.vyn@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=CAigYQq1;
       spf=pass (google.com: domain of 3qk4bzggkc4mztvz0hmhnvvnsl.jvthsl4.iluullspuhyv.vyn@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3qk4BZggKC4Mztvz0hmhnvvnsl.jvthsl4.iluullspuhyv.vyn@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711361706; x=1711966506; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1NtgBd1Mca3tPMTdTj2CfLElT5NGWJBs2kmuXue+WGE=;
        b=CAigYQq1ij71LW8ef5YpFmUf/f1x+tcXGohJ/1OHd+sXaUhUqcnutdPVvtHYWm3QWQ
         IqMRVXgeAlrvHvvvMwR2h1bPIF2B+vSr5nSxBu8hs61U9pB1zCx4OsGx7RNqzkQXSeH4
         RgwWpJNhMCWD4VRJ66lwgjb6JiDAdlQeHMN9onq9V+w4LBiSkyrAl30YwYJ+nrPK9M/q
         /n2rWzqNMUmCwY+HznAL+zOeRRq0yiTg6BTupxMH/VZ6SC5YR96yDtuoSHGOHqtmvWbX
         xI4djJ9JTjkWlGXIvImfD0UJhX7OQgaSTXPRKqFrd6SEUJdvNhtINwLyBWIGfwljdKAa
         PbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711361706; x=1711966506;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1NtgBd1Mca3tPMTdTj2CfLElT5NGWJBs2kmuXue+WGE=;
        b=qG1TPpaahfWSbd1dzNwozMWFluuCBighdT3XKhzjizJ7TX0Z75GAP0nLqHL12P41JL
         lf9NlptQfUmCs7jNj+ZM8tVFz+HvJCN5UA0niquggO9fHis39/SULCbN0mZyJ4XaqJXK
         7x9XPOuZferHhtKmEZiho7GPG70NAqX1ImRQ9T8z8SI1So/RJQCu/r4LXaSdW2QaITWr
         G4qu6MTIU9xnXrKSosvz7cs/SPWvesJ944dVf+S07jSuy6nXTHWDKpI3b1JUV97OftkZ
         GFfOkXw/jH+ChmoTvnLRAytzMVuYOTjmfwSJr0eEr05L3I7aeaqIVnzaRqE1fW0+NZow
         pyEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD3Lo2F2zp7jesipVqKqiysC7vwnEsm9OVRAdSSessY6+51cvUpZ8KAzDZE8e4PhvMZgsPuvBUKmp8vYWXT7IgUvIsaLve
X-Gm-Message-State: AOJu0YzuSnxXIop78KlH/P7zj39mL/Tizdefc5jgmVBhcDVfNLkjBvx0
	ahzQV1BOh9ms2sEV7GYX2KLzgwgdye0t4t3sRs5naInPUL6PzwSqwFWGzNk9D+7SwKOUmvVdyGR
	8PBa7Fc/mdw==
X-Google-Smtp-Source: AGHT+IFRffcyDHdmoy3xhmlxazkAgvDJzJMTe/s47yUZTkS+3mOJknsEBfQKymJrxxhAStoaXzcWAbD2ACrR5w==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:e09:b0:dcc:c57c:8873 with SMTP
 id df9-20020a0569020e0900b00dccc57c8873mr2108259ybb.9.1711361706566; Mon, 25
 Mar 2024 03:15:06 -0700 (PDT)
Date: Mon, 25 Mar 2024 10:13:57 +0000
In-Reply-To: <20240325101442.1306300-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240325101442.1306300-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <20240325101442.1306300-2-smostafa@google.com>
Subject: [RFC PATCH 01/12] hw/arm/smmu: Use enum for SMMU stage
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: bZdQjokM4u5w

Currently, translation stage is represented as an int, where 1 is stage-1 and
2 is stage-2, when nested is added, 3 would be confusing to represent nesting,
so we use an enum instead.

While keeping the same values, this is useful for:
 - Doing tricks with bit masks, where BIT(0) is stage-1 and BIT(1) is
   stage-2 and both is nested.
 - Tracing, as stage is printed as int.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
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
2.44.0.396.g6e790dbe36-goog
