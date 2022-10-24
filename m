Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3034159ejn;
        Sun, 23 Oct 2022 22:19:00 -0700 (PDT)
X-Received: by 2002:a17:902:ccc4:b0:17c:7cc1:a401 with SMTP id z4-20020a170902ccc400b0017c7cc1a401mr32248752ple.58.1666588740744;
        Sun, 23 Oct 2022 22:19:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666588740; cv=none;
        d=google.com; s=arc-20160816;
        b=Za+sRhBS5I5wyycdEwnN+AuHYgih4Mi61WkjTGWIsyDMQ9OHO68uyasSMSQhFGR+9H
         UeGtGRO2Y1E+M9dJluOkPMNl+nsAy3U2Mr2orEPYmnptpkGQ6Q67bVlIcK8mpuvBEkWe
         la8rMCyWdZQD808rZCi22fDlJsj+N7RLvGwVnDoWCatb7fA0OSopIqT8zalfCj01VZkk
         dAlO4PSWCFzB1Fwk7Q4fK3ICbOeJnFGB56cGtLZWWd1sFpJBvwzpmPw/GrUlClvhImbo
         eOpZFzPqbey1A/P2MtdEQAfluE0o+8tNkzSoWYaViRv8BX2dZ8jSH+OvncLjKOztaOa9
         IZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dRBUuDv4xO4FSH5BCO5y+i5Lk2hVQIRJPv1ndVT7mQw=;
        b=ngL8fMwXySJEWYPm+mAVoSD/HCgotVuio0mObVz2mlx1aPo9MIghDbF67c+RTZNSo0
         X+8InwuZzxPy98V8CkQLPTyIAD1Ym52lazUlNlTRLKO6nMg1zgAG658KwZ9m1p1eppqy
         eMcP0xc/wyCmQK3X8Ba4T5ZspfNhBVil0qX1WrtVCYoNlZjFcvAqYUQWUMdpCVSd8hQz
         37lpmeuOGcjeQOzmuCpNxr0cuUGUzJNQAIQlqopy4G6cmhtP/Voyxk+x+Q8GJRC7jPOX
         cTbdpFl3sHlcMqF6H/ZfNopCJuNKAMcTL4S9IKJzlxpeFQSmGv4aZq28huyCtKNMYdXP
         cI9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lIfskUFu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jh1-20020a170903328100b00170a651b3b1sor4004395plb.104.2022.10.23.22.19.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 23 Oct 2022 22:19:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lIfskUFu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRBUuDv4xO4FSH5BCO5y+i5Lk2hVQIRJPv1ndVT7mQw=;
        b=lIfskUFuwd74y9mbyGyHFZpm1q3VWFHOfhC1cpd4hArkgXfbGbmQrVzPZe+5HM0WKz
         o7dxp/AlWoODR5DgSxjeCffz5VAQ/yIdLq4WrWYEf/1i/9qcwBvQQGJY79LGy6epz5/S
         dwugOjQB9aQBWmAlSwPuK6nnA0hDO651Oh00/kcBxRcTknHydTgJIjIDtywcqOdBqCcu
         QcS1qDUdhmXfrrv9a+j4zIUMOYNYOHZhBQRklLdw3F9/uLiLTzX8QyyOI+IhO3K2SK7q
         2rffRDsP47Hny1SHrCslMFx+TSAiHCHdTGSx9U+/3JYj2zp0aiLITR4lwa6Wb8nlCymc
         tW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRBUuDv4xO4FSH5BCO5y+i5Lk2hVQIRJPv1ndVT7mQw=;
        b=lDn+DT/JptdBWtn3bfEumobqZU2QttSagp+rpYgpuZwsRAmkm7H06xWtVUV6ERuwxT
         D84R3KmbqZXfqCNfBSj0x7txoahgO/c8AbOSy2h+hshaF9oDaCQWxZRoLdDr0H5BAJNP
         rMc0tIGRpplx0T0rLkfIQFeaIOFd7mh4CK8N/lJZ5VBJl0BxeNcHPNUGHyLi7vxgc9vC
         /5KN7PL5SrPx8lS8aeL0aHLDVPLKpaKiqg6QyvLYe8zMjWbeZmzTLlU6wQNOqUqW8ESZ
         zbse2H5hq1dOvAU0kUxpk20eZmmsH+x0ZxVCXnJf85K/ZKJEdvvSR9GXrtgncFrC1pcG
         J0Vw==
X-Gm-Message-State: ACrzQf1sFrhIRnHrbOc+FdoEVzp63CyrWj2pRmTz6CaqYHUyl+aFEipT
	9ZQyXlTIbVtrUdOByyk+88axAmQu
X-Google-Smtp-Source: AMsMyM7v62G1m/XdrJ2uStaGY5VMXNtIV1NwLiF27IEsM2BucKwUXJCUwDuiR+x0BMC6Ggexr+Z5tg==
X-Received: by 2002:a17:902:e952:b0:17c:2eee:c0ce with SMTP id b18-20020a170902e95200b0017c2eeec0cemr31633689pll.145.1666588740221;
        Sun, 23 Oct 2022 22:19:00 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([103.100.225.182])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902f34c00b00172951ddb12sm1895231ple.42.2022.10.23.22.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Oct 2022 22:18:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 01/14] target/arm: Introduce regime_is_stage2
Date: Mon, 24 Oct 2022 15:18:38 +1000
Message-Id: <20221024051851.3074715-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024051851.3074715-1-richard.henderson@linaro.org>
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XaqbqbDqBt76

Reduce the amount of typing required for this check.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  5 +++++
 target/arm/helper.c    | 14 +++++---------
 target/arm/ptw.c       | 14 ++++++--------
 3 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index c3c3920ded..2b6889073d 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -673,6 +673,11 @@ static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+static inline bool regime_is_stage2(ARMMMUIdx mmu_idx)
+{
+    return mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S;
+}
+
 /* Return the exception level which controls this address translation regime */
 static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c672903f43..cbfaabbc09 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10352,7 +10352,7 @@ int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
         return extract64(tcr, 37, 2);
-    } else if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+    } else if (regime_is_stage2(mmu_idx)) {
         return 0; /* VTCR_EL2 */
     } else {
         /* Replicate the single TBI bit so we always have 2 bits.  */
@@ -10364,7 +10364,7 @@ int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
         return extract64(tcr, 51, 2);
-    } else if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+    } else if (regime_is_stage2(mmu_idx)) {
         return 0; /* VTCR_EL2 */
     } else {
         /* Replicate the single TBID bit so we always have 2 bits.  */
@@ -10474,7 +10474,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMGranuleSize gran;
     ARMCPU *cpu = env_archcpu(env);
-    bool stage2 = mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S;
+    bool stage2 = regime_is_stage2(mmu_idx);
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
@@ -10532,22 +10532,18 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         }
         ds = false;
     } else if (ds) {
-        switch (mmu_idx) {
-        case ARMMMUIdx_Stage2:
-        case ARMMMUIdx_Stage2_S:
+        if (regime_is_stage2(mmu_idx)) {
             if (gran == Gran16K) {
                 ds = cpu_isar_feature(aa64_tgran16_2_lpa2, cpu);
             } else {
                 ds = cpu_isar_feature(aa64_tgran4_2_lpa2, cpu);
             }
-            break;
-        default:
+        } else {
             if (gran == Gran16K) {
                 ds = cpu_isar_feature(aa64_tgran16_lpa2, cpu);
             } else {
                 ds = cpu_isar_feature(aa64_tgran4_lpa2, cpu);
             }
-            break;
         }
         if (ds) {
             min_tsz = 12;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6c5ed56a10..004375e02b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -842,8 +842,7 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
     bool have_wxn;
     int wxn = 0;
 
-    assert(mmu_idx != ARMMMUIdx_Stage2);
-    assert(mmu_idx != ARMMMUIdx_Stage2_S);
+    assert(!regime_is_stage2(mmu_idx));
 
     user_rw = simple_ap_to_rw_prot_is_user(ap, true);
     if (is_user) {
@@ -1171,7 +1170,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         goto do_fault;
     }
 
-    if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
+    if (!regime_is_stage2(mmu_idx)) {
         /*
          * The starting level depends on the virtual address size (which can
          * be up to 48 bits) and the translation granule size. It indicates
@@ -1342,7 +1341,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         attrs = extract64(descriptor, 2, 10)
             | (extract64(descriptor, 52, 12) << 10);
 
-        if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+        if (regime_is_stage2(mmu_idx)) {
             /* Stage 2 table descriptors do not include any attribute fields */
             break;
         }
@@ -1374,7 +1373,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 
     ap = extract32(attrs, 4, 2);
 
-    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+    if (regime_is_stage2(mmu_idx)) {
         ns = mmu_idx == ARMMMUIdx_Stage2;
         xn = extract32(attrs, 11, 2);
         result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
@@ -1404,7 +1403,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         result->f.guarded = guarded;
     }
 
-    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+    if (regime_is_stage2(mmu_idx)) {
         result->cacheattrs.is_s2_format = true;
         result->cacheattrs.attrs = extract32(attrs, 0, 4);
     } else {
@@ -1435,8 +1434,7 @@ do_fault:
     fi->type = fault_type;
     fi->level = level;
     /* Tag the error as S2 for failed S1 PTW at S2 or ordinary S2.  */
-    fi->stage2 = fi->s1ptw || (mmu_idx == ARMMMUIdx_Stage2 ||
-                               mmu_idx == ARMMMUIdx_Stage2_S);
+    fi->stage2 = fi->s1ptw || regime_is_stage2(mmu_idx);
     fi->s1ns = mmu_idx == ARMMMUIdx_Stage2;
     return true;
 }
-- 
2.34.1
