Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4028937ejc;
        Sun, 26 Feb 2023 14:08:25 -0800 (PST)
X-Google-Smtp-Source: AK7set9T4eUUftNqd6An5O01einCZe9bomJAb9HBf/lxzowe8LWfueEVVlZIaEyJeOx/BSKsOR4o
X-Received: by 2002:ad4:5aa7:0:b0:53c:9354:9721 with SMTP id u7-20020ad45aa7000000b0053c93549721mr45877409qvg.21.1677449304997;
        Sun, 26 Feb 2023 14:08:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677449304; cv=none;
        d=google.com; s=arc-20160816;
        b=ApDW4oUsnLZo217tjvibLMOaZ6kULKoW0rMrZmpqsrJ9K4G/hd0ilLmHGGp/ZoPEVA
         aFdn8wvtCObdKFvlRHMX9FMMOHrGtrbeQKR4HNvzeqE5A+F82ks8faG/MzNh9t2MkfJV
         ZAlEqp14k/mbLiVymjlMWJVsx/YH1ssvDz/wxpOM7pgXIKIcJFdk5/NafeA6JrHAvoua
         kOvmwiYBITsEsrjF1neAKy/10n6HQjm1CIQyC0xcMF7ywTuqaK6zXO6jaJODncjlnfSA
         rPKJEpCda5Cyvn10mRzbF4SCfMA0PGbGU3sZGNvcngz24ZOmhnkpuHyZB0bIfMmIPGfB
         V1IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=C2ip3b5EiKYFYCP04yKL6DAvOdXYau4SFVNkWV7zyvk=;
        b=WVUQ3uTVQo8Vrn5Kz7kwwa/04apUyOROVPhuNtvU+qJndqLHwwj0WZMMWLBzFQNIsN
         DmiXjMEmxm+vR2Jl+X6neH9uMkP3nHA+XG6qlHMg376SNUFAemiuYh7WDR7tC2XsFcN1
         yXSrIdXJWkkWLbVQOa4b5L5qtPYBpG/epST+Q0iPOhleH70FFm2CHuVuFq2TnvBBvWTC
         T+83jteJ1JsHf+ANBHANs1viJacOmGj2K6lQCb2GR4C+ma6ySjJmQ6BFRN72eWvHYBqh
         kDYRExVEb8Xgs1oYdr/iLzWQxU83gQ7HzXAldgX7DkzwxpwvGROGFzOLT9fcruWOw4gD
         1oxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Wg5OgIM5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3-20020a0cf483000000b0056eb33de335si4737768qvm.308.2023.02.26.14.08.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 14:08:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Wg5OgIM5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWPB4-0002aC-Cm; Sun, 26 Feb 2023 17:07:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3G9j7YwgKCOAUOQUVCHCIQQING.EQOSGOW-CTOPQPIPW.QTI@flex--smostafa.bounces.google.com>)
 id 1pWPB3-0002ZI-3D
 for qemu-arm@nongnu.org; Sun, 26 Feb 2023 17:07:29 -0500
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3G9j7YwgKCOAUOQUVCHCIQQING.EQOSGOW-CTOPQPIPW.QTI@flex--smostafa.bounces.google.com>)
 id 1pWPAz-0003x1-RP
 for qemu-arm@nongnu.org; Sun, 26 Feb 2023 17:07:28 -0500
Received: by mail-wm1-x349.google.com with SMTP id
 z6-20020a05600c220600b003e222c9c5f4so1773842wml.4
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 14:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=C2ip3b5EiKYFYCP04yKL6DAvOdXYau4SFVNkWV7zyvk=;
 b=Wg5OgIM5RWbI8inVSWtUeZE8DSaUh8LCFbgSieu+jkcr8TNpqDPsXOE5UQbhLt++we
 aWlS26ws3eIJHc69lisNy5iOE8N59yfz2rqSsmgUeohqngRWy0s4nHYRxf6RfOUslFRr
 cIy5UvqZ4TGb63SrRa4dJpqs8K9sAYtSFt1KmNzwGw33yfRKBzfcXqEPoYS1OYap0fSQ
 Xac2HIZyYxqTot5HLvRHypsMReXmpRF0wHxmYOd1+JcRp77klh88kr2tDGkBh0YvrWk8
 AG67KkQ5ADQZVHsYzg4T0WVplN3visVERkrIK1vQRxMkYsz6AYNGtBpYh2mpUUvyrq91
 CqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C2ip3b5EiKYFYCP04yKL6DAvOdXYau4SFVNkWV7zyvk=;
 b=BpHwwp4E6IKkvJ7w1pCQLpE0eWpMFQljc0wlys/ZqrijeHH2rSxzyUyou2Md+E2atg
 Wlk7Kdy3GtwqOLYBBfgEkqY+q7IK2S8HdlGq+VSN+shDXMuoJ4FaYwUEvvy3IcoA4VCi
 wS6lVQoVmAmFcqrSPHHvhi49yRztzbUUrTXZDv8mPVLzj+DkL3KUkWm6KiZtAu0ESIXV
 liPlfI5iyPKfwfrt5mVk7/errIbdSR3dk03q/bMsAVpdUrD8UZgjTjuHsXxIaYTVjEao
 zbjPZWoTdqmlQI6lqLOCjFGMTQMvMSCsKZsxc6Xbca/l4s5C6Zpfcm0p5Q20BX97ozAW
 1aWQ==
X-Gm-Message-State: AO0yUKX1TWafJucWa9waOhyZ032PyWo0gZEkR0WjSh+U6xdiVKINdahB
 xT5dViWG5Mo9XgCIeb/xEK2Wm1hlg45pJA==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:1d19:b0:3e2:db9:6fa9 with SMTP
 id l25-20020a05600c1d1900b003e20db96fa9mr1863374wms.4.1677449243874; Sun, 26
 Feb 2023 14:07:23 -0800 (PST)
Date: Sun, 26 Feb 2023 22:06:49 +0000
In-Reply-To: <20230226220650.1480786-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230226220650.1480786-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <20230226220650.1480786-11-smostafa@google.com>
Subject: [RFC PATCH v2 10/11] hw/arm/smmuv3: Populate OAS based on CPU PARANGE
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3G9j7YwgKCOAUOQUVCHCIQQING.EQOSGOW-CTOPQPIPW.QTI@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: A+AR7glqOjd3

OAS used to be hardcoded to 44 bits, however according to SMMU manual
6.3.6 SMMU_IDR5, OAS must match the system physical address size, so
we read it from CPU PARANGE.

Remove PA_MAX and pa_range as they were not used.

Add SMMUv3State as an argument to decode_cd, so it can read the SMMU
OAS.

As CPU can use PARANGE with 52 bits, add 52 bits check to oas2bits,
and cap OAS to 48 bits for stage-1 and stage-2 if granule is not 64KB
as specified for SMMUv3.1 and later.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmu-common.c     | 13 +++++++++----
 hw/arm/smmuv3-internal.h | 15 ++-------------
 hw/arm/smmuv3.c          | 41 ++++++++++++++++++++++++++++++++++------
 3 files changed, 46 insertions(+), 23 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index e4b477af10..3a2b06fd7f 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -307,7 +307,7 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
     dma_addr_t baseaddr, indexmask;
     int stage = cfg->stage;
     SMMUTransTableInfo *tt = select_tt(cfg, iova);
-    uint8_t level, granule_sz, inputsize, stride;
+    uint8_t level, granule_sz, inputsize, stride, oas;
 
     if (!tt || tt->disabled) {
         info->type = SMMU_PTW_ERR_TRANSLATION;
@@ -319,7 +319,12 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
     inputsize = 64 - tt->tsz;
     level = 4 - (inputsize - 4) / stride;
     indexmask = SMMU_IDXMSK(inputsize, stride, level);
-    baseaddr = extract64(tt->ttb, 0, 48);
+    oas = cfg->oas;
+    if (tt->granule_sz != 16) {
+        oas = MIN(oas, 48);
+    }
+
+    baseaddr = extract64(tt->ttb, 0, oas);
     baseaddr &= ~indexmask;
 
     while (level < SMMU_LEVELS) {
@@ -416,8 +421,8 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
      * Get the ttb from concatenated structure.
      * The offset is the idx * size of each ttb(number of ptes * (sizeof(pte))
      */
-    uint64_t baseaddr = extract64(cfg->s2cfg.vttb, 0, 48) + (1 << stride) *
-                                  idx * sizeof(uint64_t);
+    uint64_t baseaddr = extract64(cfg->s2cfg.vttb, 0, cfg->s2cfg.oas) +
+                                  (1 << stride) * idx * sizeof(uint64_t);
     dma_addr_t indexmask = SMMU_IDXMSK(inputsize, stride, level);
 
     baseaddr &= ~indexmask;
diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 3388e1a5f8..25ae12fb5c 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -564,23 +564,12 @@ static inline int oas2bits(int oas_field)
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
index 7297f6adc1..bc4ec202f4 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -238,6 +238,13 @@ void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *info)
 
 static void smmuv3_init_regs(SMMUv3State *s)
 {
+    /*
+     * According to 6.3.6 SMMU_IDR5, OAS must match the system physical address
+     * size.
+     */
+    ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
+    uint8_t oas = FIELD_EX64(armcpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
+
     /**
      * IDR0: stage1 only, AArch64 only, coherent access, 16b ASID,
      *       multi-level stream table
@@ -265,7 +272,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN16K, 1);
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
-    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
+    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, oas);
 
     s->cmdq.base = deposit64(s->cmdq.base, 0, 5, SMMU_CMDQS);
     s->cmdq.prod = 0;
@@ -374,6 +381,7 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
                       STE *ste, SMMUEventInfo *event)
 {
     uint32_t config;
+    uint8_t oas = FIELD_EX32(s->idr[5], IDR5, OAS);
 
     if (!STE_VALID(ste)) {
         if (!event->inval_ste_allowed) {
@@ -450,7 +458,16 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
         }
 
 
-        cfg->s2cfg.oas = oas2bits(MIN(STE_S2PS(ste), SMMU_IDR5_OAS));
+        cfg->s2cfg.oas = oas2bits(MIN(STE_S2PS(ste), oas));
+        /*
+         * For SMMUv3.1 and later, when OAS == IAS == 52, the stage 2 input
+         * range is further limited to 48 bits unless STE.S2TG indicates a
+         * 64KB granule.
+         */
+        if (cfg->s2cfg.granule_sz != 16) {
+            cfg->s2cfg.oas = MIN(cfg->s2cfg.oas, 48);
+        }
+
         /*
          * It is ILLEGAL for the address in S2TTB to be outside the range
          * described by the effective S2PS value.
@@ -607,10 +624,12 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
     return 0;
 }
 
-static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
+static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg, CD *cd,
+                     SMMUEventInfo *event)
 {
     int ret = -EINVAL;
     int i;
+    uint8_t oas = FIELD_EX32(s->idr[5], IDR5, OAS);
 
     if (!CD_VALID(cd) || !CD_AARCH64(cd)) {
         goto bad_cd;
@@ -630,7 +649,8 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
     cfg->stage = 1;
 
     cfg->oas = oas2bits(CD_IPS(cd));
-    cfg->oas = MIN(oas2bits(SMMU_IDR5_OAS), cfg->oas);
+    cfg->oas = MIN(oas2bits(oas), cfg->oas);
+
     cfg->tbi = CD_TBI(cd);
     cfg->asid = CD_ASID(cd);
 
@@ -658,9 +678,18 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
             goto bad_cd;
         }
 
+        /*
+         * An address greater than 48 bits in size can only be output from a
+         * TTD when, in SMMUv3.1 and later, the effective IPS is 52 and a 64KB
+         * granule is in use for that translation table
+         */
+        if (tt->granule_sz != 16) {
+            oas = MIN(cfg->oas, 48);
+        }
+
         tt->tsz = tsz;
         tt->ttb = CD_TTB(cd, i);
-        if (tt->ttb & ~(MAKE_64BIT_MASK(0, cfg->oas))) {
+        if (tt->ttb & ~(MAKE_64BIT_MASK(0, oas))) {
             goto bad_cd;
         }
         tt->had = CD_HAD(cd, i);
@@ -719,7 +748,7 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
         return ret;
     }
 
-    return decode_cd(cfg, &cd, event);
+    return decode_cd(s, cfg, &cd, event);
 }
 
 /**
-- 
2.39.2.637.g21b0678d19-goog

