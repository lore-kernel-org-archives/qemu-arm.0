Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2118028nji;
        Mon, 15 Jul 2024 01:45:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXdLXpwKlpM9a378IgItdH3t7wrW+NVQAbAHtzxTOgzrN7STby+P+uxTWjhP3X4VU9YERh0zpYzMs3LUQ058N9xPCSsJbKS
X-Received: by 2002:a17:906:39d6:b0:a72:9963:eb8e with SMTP id a640c23a62f3a-a780b6b307emr1019399566b.28.1721033138092;
        Mon, 15 Jul 2024 01:45:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721033138; cv=none;
        d=google.com; s=arc-20160816;
        b=cQcYNUbzkq72lo+nWSN6tdOGrAziEePG6faBIWO2xsEPOJQ+VRVc6z6F1rPOKTuAW1
         TqiCbTEoY7X6Y/5o4jQ4equOmVqABGuFDWc2pBicBMnMmMAVlo56O1Yh2kol0Izh79CI
         FKB/6IfaC4k4RdG9UwHDhBJxDWpq4q3zhIr/YdnZqYoadjJDA0pYnfC7yIDEVDb1HEJJ
         eMIBjD5ihleuS2K1sEgT7vEgIEeL3z6YtYGAl4cZE6oFgAnLmyvYhzotKT9+3lHwNHSn
         Fa1AIR/fvAw7mDbaA0Gd435bCrQLQeMzHNO8pryAQ37+TolI25wqqPb3lMCnMjBXa0FB
         U9TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:dkim-signature;
        bh=SVPZB22kCrKx2AdRCWQ3FSMGJhTkZ9LbBIl248AKLWw=;
        fh=OLDyt538utHpvyu7U4ZVdSqzVLzU9hb4D8fZxUOj8bo=;
        b=TnpYrFOLzLLKSVaqjTsj0lsVMDLNsrkiWUKUH6TGpdDYM/tFWSzblOBfPEArYLRTQ6
         3hBgmBt2UM/DC779hDqfYIlGLykohIsNBze62u7lGQhEFhjNaQLHYKwOcy6IaBzux+zO
         wtujt3+7rBfJsOJUASOAektim3XAvUrWIHd7dDRHyPS+7PusXpEsDtcHWTmIPrQ54g0B
         Zt9Y2CqFXxWAPvYeWRQvBlidt3sM2yN1CWsBffbZUgZiOnP5TUOifJCVuBg81Znku4lW
         0mfT5+9H0xR9SPEHoACP+Inascht5GJXbK7HuCzLrxcVBw17KETfXIqAH/83wTwRCVua
         LWFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=mx3phKZ7;
       spf=pass (google.com: domain of 3seguzggkcwqwqswxejeksskpi.gsqepi1.firriipmrevs.svk@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3seGUZggKCwQwqswxejeksskpi.gsqepi1.firriipmrevs.svk@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3seGUZggKCwQwqswxejeksskpi.gsqepi1.firriipmrevs.svk@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id a640c23a62f3a-a79bc8b29besor77740866b.9.2024.07.15.01.45.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Jul 2024 01:45:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3seguzggkcwqwqswxejeksskpi.gsqepi1.firriipmrevs.svk@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=mx3phKZ7;
       spf=pass (google.com: domain of 3seguzggkcwqwqswxejeksskpi.gsqepi1.firriipmrevs.svk@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3seGUZggKCwQwqswxejeksskpi.gsqepi1.firriipmrevs.svk@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721033137; x=1721637937; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVPZB22kCrKx2AdRCWQ3FSMGJhTkZ9LbBIl248AKLWw=;
        b=mx3phKZ7S3YAJKA9Q+/zeBrn6pYJfuWVZsNrQPQX3n8g8V+PJojToQVYOgvC9iYKf6
         lSS53OznZizLEObzFeDEYVUqwndMuQQC2XYw47bbVm7Hqc6ZQTqIkPvonQKF6/8dVxPz
         yEcVgq74GoOYUmI5TP7w99wDxWcr31HvutOzOR0eQZHuRjh8MlYYbubp0RyEJrD4MDgM
         v9eupWADWqboEybh/YSfmdNu9jeiE3snULOhoRQegTT5t9Eg+hENy0CAUy3SCzz+R6QW
         kea5ECO8LbDe1WRjDFyHy06UBkl2vm63o9O+QBb54FqdOe8Wx+S3YMRpC7RH1ywO2yoQ
         a7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033137; x=1721637937;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SVPZB22kCrKx2AdRCWQ3FSMGJhTkZ9LbBIl248AKLWw=;
        b=JlX623+J6Nv85lpDEKJWdvZc8KcjO40SkRhZ8cd+ViXvB+DfqW0PlSZ74hvXYOa8Wg
         f656L/qZY//1XHYgVNH9pOoGJ41mgQxmbnz/HKThHAwUpMvf1CGTURLbUWmhB0v3JJ/D
         eztqBsEiW+ROV0tsPCcwPstCxBr+fTsiiRChlPRbGDAym9sg08wERKbm8XIxdX3OC0Mz
         BMZGdWpzJztaNSfOQ1zrZei14N6AnYW0c/LQOeI4TtjmB2KrNu8vXgZSYJ7d7dAOPqIn
         wbjvfHB1NhkjZ/Pa5zwyhThMQxet7GXOflLYTbIz1v74FifoWnIQKWBSq8je9t+H9yBE
         UNVA==
X-Forwarded-Encrypted: i=1; AJvYcCVkXCyiT3XVjn81Sc1NuQZPY9Zb2DAsqhkOh3+TmB9z01nStRgbqWK+NxN4Zst9A5vDCxy7qpJXz+nkRfibG25SzdMKCicR
X-Gm-Message-State: AOJu0YyuYFbFUv42NAmq3b0y7Nc4BnrAMMT9oKywQ+j/EPB6wMAAhVF0
	81Kxol1ebMkZCXOuyHb3/PD1Mz4r2nBTaueltiE2b0GmnDOYqJ1/PMD7K8KglQll9YVyhbRArmS
	/XSSp4oImzQ==
X-Google-Smtp-Source: AGHT+IE5ECiOnrT/u4mYwzfIOpSZ9V55eNVdD1UiJEiZKuGy45698rMF2mqET9lETGqmi7WjMP8q5N118n91MQ==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a17:906:3402:b0:a78:65b:e275 with SMTP id
 a640c23a62f3a-a780b68751fmr1135266b.2.1721033137156; Mon, 15 Jul 2024
 01:45:37 -0700 (PDT)
Date: Mon, 15 Jul 2024 08:45:04 +0000
In-Reply-To: <20240715084519.1189624-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240715084519.1189624-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240715084519.1189624-5-smostafa@google.com>
Subject: [PATCH v5 04/18] hw/arm/smmu: Use enum for SMMU stage
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 1LysGXtLzoRF

Currently, translation stage is represented as an int, where 1 is stage-1 a=
nd
2 is stage-2, when nested is added, 3 would be confusing to represent nesti=
ng,
so we use an enum instead.

While keeping the same values, this is useful for:
 - Doing tricks with bit masks, where BIT(0) is stage-1 and BIT(1) is
   stage-2 and both is nested.
 - Tracing, as stage is printed as int.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c         | 14 +++++++-------
 hw/arm/smmuv3.c              | 17 +++++++++--------
 include/hw/arm/smmu-common.h | 11 +++++++++--
 3 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 8a8c718e6b..8a5858f69f 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -304,7 +304,7 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
                           SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
 {
     dma_addr_t baseaddr, indexmask;
-    int stage =3D cfg->stage;
+    SMMUStage stage =3D cfg->stage;
     SMMUTransTableInfo *tt =3D select_tt(cfg, iova);
     uint8_t level, granule_sz, inputsize, stride;
=20
@@ -402,7 +402,7 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
     info->type =3D SMMU_PTW_ERR_TRANSLATION;
=20
 error:
-    info->stage =3D 1;
+    info->stage =3D SMMU_STAGE_1;
     tlbe->entry.perm =3D IOMMU_NONE;
     return -EINVAL;
 }
@@ -425,7 +425,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
                           dma_addr_t ipa, IOMMUAccessFlags perm,
                           SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
 {
-    const int stage =3D 2;
+    const SMMUStage stage =3D SMMU_STAGE_2;
     int granule_sz =3D cfg->s2cfg.granule_sz;
     /* ARM DDI0487I.a: Table D8-7. */
     int inputsize =3D 64 - cfg->s2cfg.tsz;
@@ -525,7 +525,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
 error_ipa:
     info->addr =3D ipa;
 error:
-    info->stage =3D 2;
+    info->stage =3D SMMU_STAGE_2;
     tlbe->entry.perm =3D IOMMU_NONE;
     return -EINVAL;
 }
@@ -544,9 +544,9 @@ error:
 int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
              SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
 {
-    if (cfg->stage =3D=3D 1) {
+    if (cfg->stage =3D=3D SMMU_STAGE_1) {
         return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
-    } else if (cfg->stage =3D=3D 2) {
+    } else if (cfg->stage =3D=3D SMMU_STAGE_2) {
         /*
          * If bypassing stage 1(or unimplemented), the input address is pa=
ssed
          * directly to stage 2 as IPA. If the input address of a transacti=
on
@@ -555,7 +555,7 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUA=
ccessFlags perm,
          */
         if (iova >=3D (1ULL << cfg->oas)) {
             info->type =3D SMMU_PTW_ERR_ADDR_SIZE;
-            info->stage =3D 1;
+            info->stage =3D SMMU_STAGE_1;
             tlbe->entry.perm =3D IOMMU_NONE;
             return -EINVAL;
         }
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 3d214c9f57..7e9874b4a6 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -34,7 +34,8 @@
 #include "smmuv3-internal.h"
 #include "smmu-internal.h"
=20
-#define PTW_RECORD_FAULT(cfg)   (((cfg)->stage =3D=3D 1) ? (cfg)->record_f=
aults : \
+#define PTW_RECORD_FAULT(cfg)   (((cfg)->stage =3D=3D SMMU_STAGE_1) ? \
+                                 (cfg)->record_faults : \
                                  (cfg)->s2cfg.record_faults)
=20
 /**
@@ -402,7 +403,7 @@ static bool s2_pgtable_config_valid(uint8_t sl0, uint8_=
t t0sz, uint8_t gran)
=20
 static int decode_ste_s2_cfg(SMMUTransCfg *cfg, STE *ste)
 {
-    cfg->stage =3D 2;
+    cfg->stage =3D SMMU_STAGE_2;
=20
     if (STE_S2AA64(ste) =3D=3D 0x0) {
         qemu_log_mask(LOG_UNIMP,
@@ -678,7 +679,7 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEve=
ntInfo *event)
=20
     /* we support only those at the moment */
     cfg->aa64 =3D true;
-    cfg->stage =3D 1;
+    cfg->stage =3D SMMU_STAGE_1;
=20
     cfg->oas =3D oas2bits(CD_IPS(cd));
     cfg->oas =3D MIN(oas2bits(SMMU_IDR5_OAS), cfg->oas);
@@ -762,7 +763,7 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, =
SMMUTransCfg *cfg,
         return ret;
     }
=20
-    if (cfg->aborted || cfg->bypassed || (cfg->stage =3D=3D 2)) {
+    if (cfg->aborted || cfg->bypassed || (cfg->stage =3D=3D SMMU_STAGE_2))=
 {
         return 0;
     }
=20
@@ -882,7 +883,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion=
 *mr, hwaddr addr,
         goto epilogue;
     }
=20
-    if (cfg->stage =3D=3D 1) {
+    if (cfg->stage =3D=3D SMMU_STAGE_1) {
         /* Select stage1 translation table. */
         tt =3D select_tt(cfg, addr);
         if (!tt) {
@@ -919,7 +920,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion=
 *mr, hwaddr addr,
              * nesting is not supported. So it is sufficient to check the
              * translation stage to know the TLB stage for now.
              */
-            event.u.f_walk_eabt.s2 =3D (cfg->stage =3D=3D 2);
+            event.u.f_walk_eabt.s2 =3D (cfg->stage =3D=3D SMMU_STAGE_2);
             if (PTW_RECORD_FAULT(cfg)) {
                 event.type =3D SMMU_EVT_F_PERMISSION;
                 event.u.f_permission.addr =3D addr;
@@ -935,7 +936,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion=
 *mr, hwaddr addr,
=20
     if (smmu_ptw(cfg, aligned_addr, flag, cached_entry, &ptw_info)) {
         /* All faults from PTW has S2 field. */
-        event.u.f_walk_eabt.s2 =3D (ptw_info.stage =3D=3D 2);
+        event.u.f_walk_eabt.s2 =3D (ptw_info.stage =3D=3D SMMU_STAGE_2);
         g_free(cached_entry);
         switch (ptw_info.type) {
         case SMMU_PTW_ERR_WALK_EABT:
@@ -943,7 +944,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion=
 *mr, hwaddr addr,
             event.u.f_walk_eabt.addr =3D addr;
             event.u.f_walk_eabt.rnw =3D flag & 0x1;
             /* Stage-2 (only) is class IN while stage-1 is class TT */
-            event.u.f_walk_eabt.class =3D (ptw_info.stage =3D=3D 2) ?
+            event.u.f_walk_eabt.class =3D (ptw_info.stage =3D=3D SMMU_STAG=
E_2) ?
                                          SMMU_CLASS_IN : SMMU_CLASS_TT;
             event.u.f_walk_eabt.addr2 =3D ptw_info.addr;
             break;
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 5ec2e6c1a4..b3c881f0ee 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -49,8 +49,15 @@ typedef enum {
     SMMU_PTW_ERR_PERMISSION,  /* Permission fault */
 } SMMUPTWEventType;
=20
+/* SMMU Stage */
+typedef enum {
+    SMMU_STAGE_1 =3D 1,
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
--=20
2.45.2.993.g49e7a77208-goog
