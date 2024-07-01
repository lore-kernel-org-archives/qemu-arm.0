Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1286273njm;
        Mon, 1 Jul 2024 04:03:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWDWpE27+ua8JibIrvhbjRfdi34E+niMD2HHPVTs9uME+yUiyRrGHh49UNnb9iTArLkHEzWLse8pIWa0oINevDx0YJozFGM
X-Received: by 2002:a25:68cd:0:b0:e02:c3de:5d95 with SMTP id 3f1490d57ef6-e036ec35e84mr5037331276.43.1719831796389;
        Mon, 01 Jul 2024 04:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719831796; cv=none;
        d=google.com; s=arc-20160816;
        b=Wqi40Rf2esQNrYKqsTOnjp7JtFq2Z7SyDx5ustq97yxQr4FFrwnY7AVEZ9s8U95qoD
         QtvscgBaLquNgteJY19PkjuxosaZmqYPUzVutirBTUCQhhde0gC8UUQJY0HZIl4UC493
         D8AocUmhYgcabgkAzFOamgYkY7MTWBYxp2W1W/+wXJvaCW5YOeg2BLh9I3Swhl4zcYkk
         AL6c1Te4sJU1igTe/ia8tls9qHSj93D5XtE1ng1JuP2m43vMjya5Dx4OEloE68j3lozL
         2oFIhzSzfhjF8ouq2rRoOUdQoSfIfZ2MMIRRvlHt1+wcVabCghAiq/TsWio7VP1CtQiZ
         EMFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:dkim-signature;
        bh=v6i/k4KE9wMIHefg6Fd4MukNNhIG2TD4w+diY8npbq0=;
        fh=FpiSPJncRjEOPu9GbJsyA5tk8txfX1Xo2GQ5+3LKwzs=;
        b=PjS5ZyGQ4awb/Vaqx3nFMvmRphGs4dJvEZMO8HIyNfCb9HEZeT2R+8tP3feWcjJ5Ek
         rWhZnBrUm7LSoKSk60PQw9zyR+Bfww0RrHtKF/BRrwoFMhfCI3nEXB4/Wbi1eG0d9pHN
         xygAvkhWIll4qQTWenQwR47z5+ZiAFBy8q1mANoYf5+3X7Cl9c1bNF71+YUvnZdlsupp
         PdMUP6LjT3k39D+jJZxaxvHsUtrVDZmavDHzr2FHqWxCadkMzcwGCKP/RcWaTqUs7xtG
         97aCpLzwYoifHYZWXyvDm8T4BzfkkJqhaUa/TRgTn8V9ZOQatNRnhQser3lSp5Q24D93
         Ujgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=xVTKkn23;
       spf=pass (google.com: domain of 39iyczggkc1md79dev0v19916z.x97v6zi.wz88zz638vc9.9c1@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=39IyCZggKC1MD79DEv0v19916z.x97v6zI.wz88zz638vC9.9C1@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <39IyCZggKC1MD79DEv0v19916z.x97v6zI.wz88zz638vC9.9C1@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 3f1490d57ef6-e0354076993sor3746978276.18.2024.07.01.04.03.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2024 04:03:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of 39iyczggkc1md79dev0v19916z.x97v6zi.wz88zz638vc9.9c1@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=xVTKkn23;
       spf=pass (google.com: domain of 39iyczggkc1md79dev0v19916z.x97v6zi.wz88zz638vc9.9c1@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=39IyCZggKC1MD79DEv0v19916z.x97v6zI.wz88zz638vC9.9C1@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719831796; x=1720436596; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6i/k4KE9wMIHefg6Fd4MukNNhIG2TD4w+diY8npbq0=;
        b=xVTKkn23PboIgL5qN1jxaB5krsRpPtNg6uj0nrYGTZIlOGEfCrxu28u2etI/YOgY04
         3ldd24iC2ZkHcaYsvznK1IahS2qovPWjZHXwcCIZQ0BRc21wT6qQ0sDESD7kkTOImwyn
         dOFXKvUex3p7JbwjTADSlbOVBBXuKgi6WUGzrtYMuWTq8afvB4JL2GmnqjqnENZuEisz
         +dsyLIjf7tZF95AVP+sdHQHZuXlnsFH8Z5tZUkElIfkUL4PeNX1/a2d1Na46bFxJ23Q2
         XMwnCUpuoszw8BPenI3X7Cu9uUxNKjCzKQ1kJEuh9WUw7wtDcIKOc1I7ZXTokfvZ4Bze
         avmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831796; x=1720436596;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v6i/k4KE9wMIHefg6Fd4MukNNhIG2TD4w+diY8npbq0=;
        b=ekDSF/Y24nk1kX5jpO2zAfKccsVLrZeRcVhpKQe+X7qNaqr8YxzJEwrfP3q4GpLQsl
         4MbgZ0Gaecg0HYMbo2G8wljgQVszAANCQXzBCN8pDD4zBKe4ZwY6hwILBPCyVUOCCTMP
         /XNl2fUeQ2uTUtItutTKHnmLAikyBXWE30A/sdpHG4LAqoD5kzlOHWfnimB9LXMutD6o
         S300I7zHmtxVKmtgxvJUEwxraMIggcBlF89hChKxJeyOSGnb/xMNorZRVLLVn+3gKOaj
         xHubKW8R86FS7e8FLTMa95FP8JBqdiGEgIQjTOkr6P9NZ/Tq/BrvFqOFkgt4ZK4FUQIE
         3W+w==
X-Forwarded-Encrypted: i=1; AJvYcCUd3iq/sjH/j1YXiilx4mpWeVQQfMkCkOnUW2Okhg6tPrvi6ach4pzLv4kvl1xfEZ3VMe10dFpyl28hfXsHf1PPnuMRKu+1
X-Gm-Message-State: AOJu0Yz1kIiFr43VI0i8nM/SKnviZaX/weXZMsHjlOe6ugOXYtPSeXf3
	RK/0+q1A4RMDmwlH/+RziLTgV0Mh80fNHgb2r7I59nvZNuEc0C8jQGvhKAYGB5tTd97kI/Weytf
	LJXSgyOYxmg==
X-Google-Smtp-Source: AGHT+IFZYkuHURlA+DgQIDFZ7TXkB+xG4Cl+Eu8JRKYTV3o+yFjWf6eLmNI5oAWSFHmSyGcBq/3lMJFZPGsPOg==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:18c3:b0:e03:510d:3b6e with SMTP
 id 3f1490d57ef6-e036eae08f6mr398263276.3.1719831796002; Mon, 01 Jul 2024
 04:03:16 -0700 (PDT)
Date: Mon,  1 Jul 2024 11:02:26 +0000
In-Reply-To: <20240701110241.2005222-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240701110241.2005222-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240701110241.2005222-5-smostafa@google.com>
Subject: [PATCH v4 04/19] hw/arm/smmu: Use enum for SMMU stage
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: d3Qn+SpgJDTq

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
index 1eb5b160d2..dab3ad2db9 100644
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
2.45.2.803.g4e1b14247a-goog
