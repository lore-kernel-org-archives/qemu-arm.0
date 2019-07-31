Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071484wrv;
        Wed, 31 Jul 2019 13:38:46 -0700 (PDT)
X-Received: by 2002:a62:b411:: with SMTP id h17mr47156616pfn.99.1564605526205;
        Wed, 31 Jul 2019 13:38:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605526; cv=none;
        d=google.com; s=arc-20160816;
        b=xGtfW3SfRw2dELvlLK9n/5SUr8/+54zIs3+h5llW+5cc32FyajfWk6iuM5XrKbLutq
         QR2G1GCG98SaO/CZG6ljw9jm3QoESV7WlIEJMlPh1TSTlwAQVigDGIuqxEYfcfTYWHq4
         Rk+2kVXbz1VEWNoowNtloLR+A6g5n9ymZQ4j617Q12sy7zSpxhUT108xCBtRfJ+10j+K
         AiRIAMeIiJJBvbilK5MvGCJpJAJQ5mTpLB9BHaJV4cjb3WD9QK8HvDO1FUq24//KfPGl
         KiLYFzcbbShx12npWQ0SyhtUHRZPcNv0SCI5xqm98S7PhbuPiQgOz8QekMHudrvUB7Vc
         yx6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=LCePFTUgV8mXAATt2U3SG8TFwN2aa4K3amCrfCCSR5k=;
        b=QBHeyPWH57xLw66zmL9HVDoJzTLULyFbK7Gm3ecsI6Hf/cb/lymHaBOdMPPK7vARr2
         0+dXXYPUOwSknB0hXSVdWH6gtelD5EayZLqniHvk5fFH0Syhny/WaRt9GaGJCWldIaa+
         suP8wQANV5X+TxvXc45+QUbI4Oi4MFtFPLXzGLpV+VoBDLJpoUUfEVRgxfYWCaGX/Hq0
         Fy+1/4JftV66Y0xDSXSpOxm0XxV/Lhf5H24D8aJAyavCZcSUtgV5tRKcza8zGqZoR9Zu
         rd2rZjtnSuZ/SKClVk2LHN1r+/V+MJddmnjSpsZKHx7T5yHS0+PzWfHXv0DsS28VIHbA
         INBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ylcLI33w;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 75sor50297135pfv.11.2019.07.31.13.38.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ylcLI33w;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LCePFTUgV8mXAATt2U3SG8TFwN2aa4K3amCrfCCSR5k=;
        b=ylcLI33wAu8jB+aF2RW3yIA7CY7z4OkSO67AZXkNhw0oJWzLdIplqnhrrRQRhUGiX+
         MRrS1dCFaWrcsZ0CO/dMpxAui4+ZBtg6dRA+TlZauo6VV7NXtil+5dpCzWVBuUm8dJko
         /9CVVD5eQh14fJaRha5bs2zg5EnLxDyMGgTBKJduh6Tact3fBZf1Zyl7r+KrKheGa0L2
         582ykZER8T+zrtCCauIOt96pruwGsEkhYX2Ydq4ZcFPUvZrO2H7Yb1eItzoLkCLK9pV/
         li33q3IkeJPZf4kTyGLEMWO2Ad7kUp+8GQITwwrzPkOgBn9Y6TwLlsRNmyHGrAuvKeoE
         xQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LCePFTUgV8mXAATt2U3SG8TFwN2aa4K3amCrfCCSR5k=;
        b=OzSbdUPCtMG6WUP9JGL3Eu0VShPlan07mE7aP9J+Jw/BymFDEmOu+QDD4dBlBcgbOW
         cHLXGcAvYAS23aZVSr1JNjyRpj/qO2w2Q6Ki+6V2jpSOJu2YT9KYyu0RDa77KGoiI4mX
         2AghwW4MlXe8Vefhq5n+d5OFDlkBtwZKQdNeO5evSRc2QNBDpptt9uenTo1XCTLOmyJ/
         9CpfMBcPccrp+rJBB9Ndhf+c6SosZmVnclBKG6HPyKyEkjOL2dnTbDhcqkcXWRTLqo5i
         61Xaz2XCtpJLZ0XGDh+IXIn2I8qQPBH/sKoiH6L6lrOnHJrQIgZuuO6TtaYQOw+wf86b
         NCyw==
X-Gm-Message-State: APjAAAWo45dcDbQ2wJAqnIZZpryOvGOHIOwhHJIx7a+sh7sM41G97VJq
	loHu4UOiGbCJYiFAL1s6GUW7lcJD
X-Google-Smtp-Source: APXvYqxnYjLEeHlM08/x5xP620ezHYZoGXIJPtdB14e+wl1qym3Dj9OqqPwR/DEsiQD8o7781IX0JA==
X-Received: by 2002:aa7:93a8:: with SMTP id x8mr50841612pff.49.1564605525791;
        Wed, 31 Jul 2019 13:38:45 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 25/32] target/arm: Install asids for E2&0 translation regime
Date: Wed, 31 Jul 2019 13:38:06 -0700
Message-Id: <20190731203813.30765-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
X-TUID: OL2Pk87oOqV2

When clearing HCR_E2H, this involves re-installing the EL1&0 asid.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 38 ++++++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2883d6e568..30f93f4792 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3518,10 +3518,29 @@ static void vmsa_ttbr_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
+static void update_el2_asid(CPUARMState *env)
+{
+    CPUState *cs = env_cpu(env);
+    uint64_t ttbr0, ttbr1, ttcr;
+    int asid, idxmask;
+
+    ttbr0 = env->cp15.ttbr0_el[2];
+    ttbr1 = env->cp15.ttbr1_el[2];
+    ttcr = env->cp15.tcr_el[2].raw_tcr;
+    idxmask = ARMMMUIdxBit_EL20_2 | ARMMMUIdxBit_EL20_0;
+    asid = extract64(ttcr & TTBCR_A1 ? ttbr1 : ttbr0, 48, 16);
+
+    tlb_set_asid_for_mmuidx(cs, asid, idxmask, 0);
+}
+
 static void vmsa_tcr_ttbr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                     uint64_t value)
 {
     raw_write(env, ri, value);
+    if (arm_hcr_el2_eff(env) & HCR_E2H) {
+        /* We are running with EL2&0 regime and the ASID is active.  */
+        update_el2_asid(env);
+    }
 }
 
 static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4654,6 +4673,7 @@ static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     ARMCPU *cpu = env_archcpu(env);
     /* Begin with bits defined in base ARMv8.0.  */
     uint64_t valid_mask = MAKE_64BIT_MASK(0, 34);
+    uint64_t old_value;
 
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         valid_mask &= ~HCR_HCD;
@@ -4680,15 +4700,25 @@ static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     /* Clear RES0 bits.  */
     value &= valid_mask;
 
-    /* These bits change the MMU setup:
+    old_value = env->cp15.hcr_el2;
+    env->cp15.hcr_el2 = value;
+
+    /*
+     * These bits change the MMU setup:
      * HCR_VM enables stage 2 translation
      * HCR_PTW forbids certain page-table setups
-     * HCR_DC Disables stage1 and enables stage2 translation
+     * HCR_DC disables stage1 and enables stage2 translation
+     * HCR_E2H enables E2&0 translation regime.
      */
-    if ((env->cp15.hcr_el2 ^ value) & (HCR_VM | HCR_PTW | HCR_DC)) {
+    if ((old_value ^ value) & (HCR_VM | HCR_PTW | HCR_DC | HCR_E2H)) {
         tlb_flush(CPU(cpu));
+        /* Also install the correct ASID for the regime.  */
+        if (value & HCR_E2H) {
+            update_el2_asid(env);
+        } else {
+            update_lpae_el1_asid(env, false);
+        }
     }
-    env->cp15.hcr_el2 = value;
 
     /*
      * Updates to VI and VF require us to update the status of
-- 
2.17.1
