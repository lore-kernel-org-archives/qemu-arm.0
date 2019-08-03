Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2201113wrv;
        Sat, 3 Aug 2019 11:48:32 -0700 (PDT)
X-Received: by 2002:a63:a66:: with SMTP id z38mr34868674pgk.247.1564858112008;
        Sat, 03 Aug 2019 11:48:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858112; cv=none;
        d=google.com; s=arc-20160816;
        b=KDss4qENaYGRSHnWi8fEiH9sV+A47r1geVh1lDXqY5/qGvxvCrUdOBlYjrdnyyR+Fk
         eF4qUA0udM3tF30pprlNf0DJxsZFir3fayN8krF5eqsjJALxHfmfRq5sTrFV/MFGV1JJ
         jX+vMnUQ3rW8YPmZ0OLXhIYRktSw4HHs8NFu2G/xOyE/EFS9W4mI0weN6XVN74G5srfu
         78zbGO+3fejDcuZo/5czFs2cbJuqouR1nPJrMSlKfY5BtC6TKfZdl0Y6fxjdSGAhxB9G
         lzqQkp+96fZhbuEpz6B7YDNfetUzTCPKlMVVkE7kPaAk5rrNZsfNj6XnHviAT1bZR6Xi
         Sm0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nHfPCz5YwCEUlzjuGzWzTb7gnkajF/XBRvaJmIbxmI0=;
        b=nSaf61X7bk8QiH4PABCzBwILb3DtkoS+GZ4RI67Hwg2DV2jul25HJk+7Ilpa/rvLEU
         HE35s+XgEYFd7Bt28kfoy6ayYnBWAnvb0vd8t12ZR9kNlE9Dim4Ogz/qw67evZo191TV
         R8xtGEgUdkHy2liSkOMa1tM7AdYIErBZ9rAsqwXoRWVlIAg2nwgu/CWDmiQl35DCv1lb
         v6dzPtqkKKiIdC/qR5Ysg2JWj7dPMbCKwL7dtAhjHv2BJJQ9ndvkDOpj70t/uFtauX/2
         rh2Bt7LPrcFCvpqLMiexB9/CviemFQ2b99fb7+WMmdqOtq3ngV/A3nCRGPq65hQaQYN3
         11kA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hXxC9JbV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 134sor7769024pgh.67.2019.08.03.11.48.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hXxC9JbV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nHfPCz5YwCEUlzjuGzWzTb7gnkajF/XBRvaJmIbxmI0=;
        b=hXxC9JbVWxcs5YnVTE4WAwREG86bgECaTH2NORht9mgPe6k9Dg2bTQSpTsz7SBlWuU
         QC+fxv5+FUgKq2V1gu/3cKNHYyfw/g8B7au/L2bg2YpkYwHH0Cv98WMv47VCA3swB2a1
         nTLBl0vHndkP0WIYA1EK8tqZXz8oKt4SHpEMwgxLVZGJ0Wl7nsMKnWUoGQaXHBJVjJz2
         eZvX91NtuWi3fa+Z83IlYexblAHHXEXauFI8A8ALj6zPdCcx6NvXUJXKitcGjf3NGEAf
         R6UnC+nKLtkwBr+DPP2UJ9+M7AgVayW+j8ct7QrGAryEIdARj+IJdKku/MSFucfVcw9M
         lyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nHfPCz5YwCEUlzjuGzWzTb7gnkajF/XBRvaJmIbxmI0=;
        b=HD6ghjLttNjI64+wWnbG5iAEwm725k9NoX8b2GF4OKoygAfgZFaYIYebKn2a9TaYtS
         J6qqOiBiM3IohpUOUMSVA1oxLo5P7MVg2gbh7uXY6wnqkg0GCJ5fzPDXKBYoI5DFlyZu
         dfolO0KWkHN77g1uJN6MIY7qT0wUhskVeGDjwt5t9u0tzWA9ST3kn8U2a64b6PweZtZj
         FiTrXl0IgSG5dxlU2WQfEJ5G02mY43d4FzG2zmwYB36LD9i79v+rkut3pIESFNalSfEm
         R674Noj3TQG5BAirDFAbgSXpasXP+OKnau/xDfqrJzEYhUdsZ3EQXzLMki4d7vvt2K72
         rETw==
X-Gm-Message-State: APjAAAVK5r/f82JCSP8+hZ/NCNoQNyQdfwED68/UQ3uIFRJbs2qYod6T
	pTy2wDnqOGdMA9dD82t7h5mYOvCJ
X-Google-Smtp-Source: APXvYqx3Of1+yWCTj60XS0ZNONOuwP6m8JwYsCiapXVqwT+kjVBbmnxjspb3mk8OpmZcPOXEBs9xKg==
X-Received: by 2002:a63:184b:: with SMTP id 11mr70008432pgy.112.1564858111468;
        Sat, 03 Aug 2019 11:48:31 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 24/34] target/arm: Update arm_sctlr for VHE
Date: Sat,  3 Aug 2019 11:47:50 -0700
Message-Id: <20190803184800.8221-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5Xt0KPfhGtjy

Use the correct sctlr for EL2&0 regime.  Due to header ordering,
and where arm_mmu_idx is declared, we need to move the function
out of line.  Use the function in many more places in order to
select the correct control.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v5: Use arm_mmu_idx() to avoid incorrectly replicating the el2&0
    condition therein.  Drop the change to cpu_get_dump_info, as
    that needs a more significant rethink of hard-coded oddness.
---
 target/arm/cpu.h          | 11 +----------
 target/arm/helper-a64.c   |  2 +-
 target/arm/helper.c       | 14 ++++++++++++--
 target/arm/pauth_helper.c |  9 +--------
 4 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8d90a4fc4d..d7c5a123a3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3096,16 +3096,7 @@ static inline bool arm_sctlr_b(CPUARMState *env)
         (env->cp15.sctlr_el[1] & SCTLR_B) != 0;
 }
 
-static inline uint64_t arm_sctlr(CPUARMState *env, int el)
-{
-    if (el == 0) {
-        /* FIXME: ARMv8.1-VHE S2 translation regime.  */
-        return env->cp15.sctlr_el[1];
-    } else {
-        return env->cp15.sctlr_el[el];
-    }
-}
-
+uint64_t arm_sctlr(CPUARMState *env, int el);
 
 /* Return true if the processor is in big-endian mode. */
 static inline bool arm_cpu_data_is_big_endian(CPUARMState *env)
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 060699b901..3bf1b731e7 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -70,7 +70,7 @@ static void daif_check(CPUARMState *env, uint32_t op,
                        uint32_t imm, uintptr_t ra)
 {
     /* DAIF update to PSTATE. This is OK from EL0 only if UMA is set.  */
-    if (arm_current_el(env) == 0 && !(env->cp15.sctlr_el[1] & SCTLR_UMA)) {
+    if (arm_current_el(env) == 0 && !(arm_sctlr(env, 0) & SCTLR_UMA)) {
         raise_exception_ra(env, EXCP_UDEF,
                            syn_aa64_sysregtrap(0, extract32(op, 0, 3),
                                                extract32(op, 3, 3), 4,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index a570d43232..9e9d2ce99b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3867,7 +3867,7 @@ static void aa64_fpsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static CPAccessResult aa64_daif_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                        bool isread)
 {
-    if (arm_current_el(env) == 0 && !(env->cp15.sctlr_el[1] & SCTLR_UMA)) {
+    if (arm_current_el(env) == 0 && !(arm_sctlr(env, 0) & SCTLR_UMA)) {
         return CP_ACCESS_TRAP;
     }
     return CP_ACCESS_OK;
@@ -3886,7 +3886,7 @@ static CPAccessResult aa64_cacheop_access(CPUARMState *env,
     /* Cache invalidate/clean: NOP, but EL0 must UNDEF unless
      * SCTLR_EL1.UCI is set.
      */
-    if (arm_current_el(env) == 0 && !(env->cp15.sctlr_el[1] & SCTLR_UCI)) {
+    if (arm_current_el(env) == 0 && !(arm_sctlr(env, 0) & SCTLR_UCI)) {
         return CP_ACCESS_TRAP;
     }
     return CP_ACCESS_OK;
@@ -8718,6 +8718,16 @@ static uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+uint64_t arm_sctlr(CPUARMState *env, int el)
+{
+    /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
+    if (el == 0) {
+        ARMMMUIdx mmu_idx = arm_mmu_idx(env);
+        el = (mmu_idx == ARMMMUIdx_EL20_0 ? 2 : 1);
+    }
+    return env->cp15.sctlr_el[el];
+}
+
 #ifndef CONFIG_USER_ONLY
 
 /* Return the SCTLR value which controls this address translation regime */
diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index d3194f2043..42c9141bb7 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -386,14 +386,7 @@ static void pauth_check_trap(CPUARMState *env, int el, uintptr_t ra)
 
 static bool pauth_key_enabled(CPUARMState *env, int el, uint32_t bit)
 {
-    uint32_t sctlr;
-    if (el == 0) {
-        /* FIXME: ARMv8.1-VHE S2 translation regime.  */
-        sctlr = env->cp15.sctlr_el[1];
-    } else {
-        sctlr = env->cp15.sctlr_el[el];
-    }
-    return (sctlr & bit) != 0;
+    return (arm_sctlr(env, el) & bit) != 0;
 }
 
 uint64_t HELPER(pacia)(CPUARMState *env, uint64_t x, uint64_t y)
-- 
2.17.1
