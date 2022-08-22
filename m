Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp979525ejc;
        Mon, 22 Aug 2022 08:27:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:a04:b0:534:d8a6:40ce with SMTP id p4-20020a056a000a0400b00534d8a640cemr21669684pfh.15.1661182078373;
        Mon, 22 Aug 2022 08:27:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661182078; cv=none;
        d=google.com; s=arc-20160816;
        b=AkloQv8F9gzZEh/DJuiDzkzLUSGWtQ8Vl/spO5OdspIrVcOBUHquulTidcZXBRN268
         3KPRDe2qF3zHsWpcH9oVPDWkS8PVDKN+kl9VVNq2XIYF9e1CiwuyLgSC1irzGqNn1Boh
         E9RorWA+Ix93X6vk4CLcCZs/S6ZFhRz3unOgT9aiWVL4B7wn0o0uvo8MJDgFEigoWb71
         dJ3mXOtDl3GUGY4zc2LlhvF3N20keg6ZQan/rUQqwOEECzUOGOeTHxe38cgbLPBTfJLr
         u501y1TWmoXHkRGYE1oSsqHkNm71MtwUhO14th7qCAJBq8vCSCdd29BU0y06DCU2rY9f
         7yzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=O81TsU9W9xgRybd2C2RW59kpRj18EtKgy1SuNeOJbJ0=;
        b=rn0yCpNsQW2keVYf3emrkJtunNqpSdWDOBDJd156b1D1fQR2Zzks6WPJ5+/9YBZOiW
         MvybLyDprJ00Lhbyxvx2SAoeZIDAHdSC8bC8AaxmhtWAmNMslOThexlBul03R8unUChX
         bufTzKQzcM0UaiTewJvfYC4enrfSZW3YYaxWXxSWClg0Ds+dqdlyMhBIHFAT19zQ/qjA
         9GONdUz5QNZ+tD3eNQagSACAmnY0ETk2IjNs92+VNuFAHI8tWM2ItkjCh6bSeCD+uwsM
         dtbs3smeA/9Je0yGMMq0UmVW3FK+AJAbjwrHTHnS9wtelme0fegTmKkSXUxwFZMCf4fM
         fLpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kiPm+u8H;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p3-20020a056a000b4300b00527f5f81992sor6461403pfo.99.2022.08.22.08.27.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Aug 2022 08:27:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kiPm+u8H;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=O81TsU9W9xgRybd2C2RW59kpRj18EtKgy1SuNeOJbJ0=;
        b=kiPm+u8Hc8qLcHnZFBkQXnyuVsYdWL5yXKcw5yyulDrYozxrWW120rmERBEfVYBSf/
         MXkoqAxaMGAbTuH97Gz/bKwySgalZw28mPKBPOBnFE+TqwNbdh5AXFncYPQ5GiRLGkcg
         53UBUnTAWIhzPnOoKD5IWWyRcBIUR+oDKvRtYW5FSdNeXQNvLKribFnh+1oF628WhVHd
         bcju/LMAJrCGqXXToCRyhGJn6s18FIX8doyd9shqer7H/4Bjb7ZRenw4ydWZX7fhW27L
         qxJdK/K2k/s5D/iijieFxcgfjgevlnDOUZwjVm9bYTPQh29XGan0n0zulb2cga1q4BGi
         YgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=O81TsU9W9xgRybd2C2RW59kpRj18EtKgy1SuNeOJbJ0=;
        b=qqmQ4Id6h/Y7SDc9is/Q2d+i9AF+Q6yPc2d3KmaSJAIOhfKChfrVqg/Y4FBUVttdo4
         nzlulU6iQzLDZiazu9KaiZmzbCAtOsRs0eIAnAZKbUIsMZ2AZW6XAwJl/1xx+VNZQFi4
         IJvtT42sJlBQiOTcIRIOVickS5hRHTfk13EX/nw9Tnz0pdLHocsKtesATwGEKYwggPuU
         lvZjsnfAH+PasIOCoevpFkcCWQSmoP5rwvxogqkSDvONDLjGK2TSS7/KeCQsXUjDUNoL
         darNxrU09mSL014JWovY3thv9bU2338sR0f4US9+1ZwlD/7wjkCK6sejkeviNZv6RE8a
         o48w==
X-Gm-Message-State: ACgBeo3Yy7hX+3yKgbgwTg/ER88XktRkuQh/XzT91/T0CtHLSNstLgQc
	/C+wD7MeaKajHP8a4iulshszXiA/
X-Google-Smtp-Source: AA6agR6E4+ybGApzzgDpfTyhyCGROJULZl4dUwPGJIKNQa28w0XmQ346r82ni/MRSuGbyez8qnJfhw==
X-Received: by 2002:a63:86c2:0:b0:42a:42d5:a4a6 with SMTP id x185-20020a6386c2000000b0042a42d5a4a6mr12720471pgd.189.1661182077816;
        Mon, 22 Aug 2022 08:27:57 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([71.212.157.236])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:27:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 19/66] target/arm: Add is_secure parameter to regime_translation_disabled
Date: Mon, 22 Aug 2022 08:26:54 -0700
Message-Id: <20220822152741.1617527-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yDCypx75gP8q

Remove the use of regime_is_secure from regime_translation_disabled,
using the new parameter instead.

This fixes a bug in S1_ptw_translate and get_phys_addr where we had
passed ARMMMUIdx_Stage2 and not ARMMMUIdx_Stage2_S to determine if
Stage2 is disabled, affecting FEAT_SEL2.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 224ba09ecd..eca7763367 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -131,12 +131,13 @@ static uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn)
 }
 
 /* Return true if the specified stage of address translation is disabled */
-static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx)
+static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
+                                        bool is_secure)
 {
     uint64_t hcr_el2;
 
     if (arm_feature(env, ARM_FEATURE_M)) {
-        switch (env->v7m.mpu_ctrl[regime_is_secure(env, mmu_idx)] &
+        switch (env->v7m.mpu_ctrl[is_secure] &
                 (R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK)) {
         case R_V7M_MPU_CTRL_ENABLE_MASK:
             /* Enabled, but not for HardFault and NMI */
@@ -163,7 +164,7 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx)
 
     if (hcr_el2 & HCR_TGE) {
         /* TGE means that NS EL0/1 act as if SCTLR_EL1.M is zero */
-        if (!regime_is_secure(env, mmu_idx) && regime_el(env, mmu_idx) == 1) {
+        if (!is_secure && regime_el(env, mmu_idx) == 1) {
             return true;
         }
     }
@@ -201,7 +202,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
                                ARMMMUFaultInfo *fi)
 {
     if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
-        !regime_translation_disabled(env, ARMMMUIdx_Stage2)) {
+        !regime_translation_disabled(env, ARMMMUIdx_Stage2, *is_secure)) {
         ARMMMUIdx s2_mmu_idx = *is_secure ? ARMMMUIdx_Stage2_S
                                           : ARMMMUIdx_Stage2;
         GetPhysAddrResult s2 = {};
@@ -1355,9 +1356,10 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
     int n;
     uint32_t mask;
     uint32_t base;
+    bool is_secure = regime_is_secure(env, mmu_idx);
     bool is_user = regime_is_user(env, mmu_idx);
 
-    if (regime_translation_disabled(env, mmu_idx)) {
+    if (regime_translation_disabled(env, mmu_idx, is_secure)) {
         /* MPU disabled.  */
         result->phys = address;
         result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
@@ -1521,7 +1523,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
     result->page_size = TARGET_PAGE_SIZE;
     result->prot = 0;
 
-    if (regime_translation_disabled(env, mmu_idx) ||
+    if (regime_translation_disabled(env, mmu_idx, secure) ||
         m_is_ppb_region(env, address)) {
         /*
          * MPU disabled or M profile PPB access: use default memory map.
@@ -1732,7 +1734,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
      * are done in arm_v7m_load_vector(), which always does a direct
      * read using address_space_ldl(), rather than going via this function.
      */
-    if (regime_translation_disabled(env, mmu_idx)) { /* MPU disabled */
+    if (regime_translation_disabled(env, mmu_idx, secure)) { /* MPU disabled */
         hit = true;
     } else if (m_is_ppb_region(env, address)) {
         hit = true;
@@ -2306,7 +2308,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                 result, fi);
 
             /* If S1 fails or S2 is disabled, return early.  */
-            if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2)) {
+            if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2,
+                                                   is_secure)) {
                 return ret;
             }
 
@@ -2434,7 +2437,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
     /* Definitely a real MMU, not an MPU */
 
-    if (regime_translation_disabled(env, mmu_idx)) {
+    if (regime_translation_disabled(env, mmu_idx, is_secure)) {
         uint64_t hcr;
         uint8_t memattr;
 
-- 
2.34.1
