Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2200987wrv;
        Sat, 3 Aug 2019 11:48:19 -0700 (PDT)
X-Received: by 2002:a63:d555:: with SMTP id v21mr106426149pgi.179.1564858098899;
        Sat, 03 Aug 2019 11:48:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858098; cv=none;
        d=google.com; s=arc-20160816;
        b=gn5Pz5whrSnY7FqGZjyhe9+GPbq8tMX7F4IkXQDpICCJPUMwnYP4kLrhp2WGTOaScb
         +NUj8NA2MJqKkDa27Ty/kd5rJcZcXqQhNNioYpeZHsSeBT3bsw8pforAxyIbzRlYmdvL
         zRNiybzn8RLUIKd0Y3/OSagqzk/7eEbFNWLOmnBp70/XO2JyeHn8At5f59BaGoSckW7W
         pwAJUIhwEkQjVWDwSn2spNV6acUJHPNBZPVMOVD2PMCzyowzukciCMJQrD4YXmZEKt+i
         mq+JS13aWAzES3uSvgNQl5xJBdJhzA69SkHqsMRWAKu2P4okDdCjpazSXVrH8R4TcQ31
         2vSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=h3dhwpfe86udFJHT5d1QRrLfJzUV39xxz0iIkIlTtJQ=;
        b=aickZLt6cPMl5Fy/a6/aVPRADhBTbq9vHMk3l/CjQyie9oApcJOwZtrl4sHhf4yVdE
         RLkymODZrZWAEaYinRInJyQaNJrcT4Db2akf/AAr1OgexYUbdIzLrK38JOw2t1BUqPtK
         n6dcUtVqaAfvDYq6Dq9x+NyxPooriG9mDRSamxreo26wq1/f7nQDfl50vw+19UOp2U8z
         eOall0ePvY8SUCtrJEpHrEZ7s2lbTLV5FSODsOomK7+pGdgXtS3iCbABu9wtiLEhikrt
         O9CIuzMX1DCH1lKJ/zT/xKHqphdRxC9rdEoOxsJiuFNx44UonPFOIw1qnit472ncN/Co
         jEtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p4d9sTav;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j22sor7905651pgn.48.2019.08.03.11.48.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p4d9sTav;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h3dhwpfe86udFJHT5d1QRrLfJzUV39xxz0iIkIlTtJQ=;
        b=p4d9sTavIeM8PY758QFUeYiC9aPL9OxLqab6D6paLIN1R9hY6kTAp5ovqdcPtJEjFs
         hbtdKLSserCSJ/lKcNfOs4V5QAN547FeosbSDBPkxAGsELf7n1MbJljPhzGog2AsaHMY
         3nk9SnMVuAA1PEi+xkRi0Tn4O4FhBcFpLAe/9ZaLPJciZ3JYgbXzhnt4AzBpEh9te9VQ
         HrV+HbTcXO6rt+mncHeJ56b3fi1f6IrPQFr4MrdKEq18q5J6di5FlnDtKybQqoWmoRtG
         M7ENyc1n5qV71FmxzE7YP/gGg5k97J776Lbxvlt/GuGZtDxttjFTbd0RRdA1QO0q59EX
         yDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h3dhwpfe86udFJHT5d1QRrLfJzUV39xxz0iIkIlTtJQ=;
        b=HmlO3BWPXAIS3X9FkNjAwzzAZ1rHWR7c88UBGKmox57loZSjuHVla5vrnwmBMhsz9S
         w6ylDeZrm8qKoOwoFWvyzSDYO+Lbj3IWwxllQzjEocsVuZCqnjeMXl2Akwmqi4ID75uI
         L6R1AL+myp/226vEPJ9KJuD7BRqziY98m0jSSuSUeT3a69h0cVxIUZHeqc3IgAYuWr3o
         wVCmbvCx8B3R8mlbTvFo8+QqMlfbj4cDyP3MqXMWalE9Urpggv9dZe9rzFC+HbYfnKN6
         foB5J4m/yFn3OQ52fHDHmi5USJ9W/n8wc3zMMh4dBjll7yNv5bY+rdhkTk1CeQtppyro
         Z3Pw==
X-Gm-Message-State: APjAAAWeUVTEunWJ0wytDanpnOS8Hg7+IO6MfJ51+bwAQ/50zhbfsHaW
	cr/43HRwllpTTifA29JqjmeLqakS
X-Google-Smtp-Source: APXvYqwDh7PaOvn/rBsLx8jUz5UsBCI4DflaOcPxvGWXN9GEl7gwV6I6QlV+vg98QfZzYyy+Db5/7A==
X-Received: by 2002:a63:b20f:: with SMTP id x15mr21319515pge.453.1564858098347;
        Sat, 03 Aug 2019 11:48:18 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 13/34] target/arm: Split out vae1_tlbmask, vmalle1_tlbmask
Date: Sat,  3 Aug 2019 11:47:39 -0700
Message-Id: <20190803184800.8221-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nLVKM0iwL+bN

No functional change, but unify code sequences.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 118 ++++++++++++++------------------------------
 1 file changed, 37 insertions(+), 81 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e9f4cae5e8..7ecaacb276 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3898,70 +3898,61 @@ static CPAccessResult aa64_cacheop_access(CPUARMState *env,
  * Page D4-1736 (DDI0487A.b)
  */
 
+static int vae1_tlbmask(CPUARMState *env)
+{
+    if (arm_is_secure_below_el3(env)) {
+        return ARMMMUIdxBit_S1SE1 | ARMMMUIdxBit_S1SE0;
+    } else {
+        return ARMMMUIdxBit_S12NSE1 | ARMMMUIdxBit_S12NSE0;
+    }
+}
+
 static void tlbi_aa64_vmalle1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                       uint64_t value)
 {
     CPUState *cs = env_cpu(env);
-    bool sec = arm_is_secure_below_el3(env);
+    int mask = vae1_tlbmask(env);
 
-    if (sec) {
-        tlb_flush_by_mmuidx_all_cpus_synced(cs,
-                                            ARMMMUIdxBit_S1SE1 |
-                                            ARMMMUIdxBit_S1SE0);
-    } else {
-        tlb_flush_by_mmuidx_all_cpus_synced(cs,
-                                            ARMMMUIdxBit_S12NSE1 |
-                                            ARMMMUIdxBit_S12NSE0);
-    }
+    tlb_flush_by_mmuidx_all_cpus_synced(cs, mask);
 }
 
 static void tlbi_aa64_vmalle1_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                     uint64_t value)
 {
     CPUState *cs = env_cpu(env);
+    int mask = vae1_tlbmask(env);
 
     if (tlb_force_broadcast(env)) {
         tlbi_aa64_vmalle1is_write(env, NULL, value);
         return;
     }
 
+    tlb_flush_by_mmuidx(cs, mask);
+}
+
+static int vmalle1_tlbmask(CPUARMState *env)
+{
+    /*
+     * Note that the 'ALL' scope must invalidate both stage 1 and
+     * stage 2 translations, whereas most other scopes only invalidate
+     * stage 1 translations.
+     */
     if (arm_is_secure_below_el3(env)) {
-        tlb_flush_by_mmuidx(cs,
-                            ARMMMUIdxBit_S1SE1 |
-                            ARMMMUIdxBit_S1SE0);
+        return ARMMMUIdxBit_S1SE1 | ARMMMUIdxBit_S1SE0;
+    } else if (arm_feature(env, ARM_FEATURE_EL2)) {
+        return ARMMMUIdxBit_S12NSE1 | ARMMMUIdxBit_S12NSE0 | ARMMMUIdxBit_S2NS;
     } else {
-        tlb_flush_by_mmuidx(cs,
-                            ARMMMUIdxBit_S12NSE1 |
-                            ARMMMUIdxBit_S12NSE0);
+        return ARMMMUIdxBit_S12NSE1 | ARMMMUIdxBit_S12NSE0;
     }
 }
 
 static void tlbi_aa64_alle1_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                   uint64_t value)
 {
-    /* Note that the 'ALL' scope must invalidate both stage 1 and
-     * stage 2 translations, whereas most other scopes only invalidate
-     * stage 1 translations.
-     */
-    ARMCPU *cpu = env_archcpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUState *cs = env_cpu(env);
+    int mask = vmalle1_tlbmask(env);
 
-    if (arm_is_secure_below_el3(env)) {
-        tlb_flush_by_mmuidx(cs,
-                            ARMMMUIdxBit_S1SE1 |
-                            ARMMMUIdxBit_S1SE0);
-    } else {
-        if (arm_feature(env, ARM_FEATURE_EL2)) {
-            tlb_flush_by_mmuidx(cs,
-                                ARMMMUIdxBit_S12NSE1 |
-                                ARMMMUIdxBit_S12NSE0 |
-                                ARMMMUIdxBit_S2NS);
-        } else {
-            tlb_flush_by_mmuidx(cs,
-                                ARMMMUIdxBit_S12NSE1 |
-                                ARMMMUIdxBit_S12NSE0);
-        }
-    }
+    tlb_flush_by_mmuidx(cs, mask);
 }
 
 static void tlbi_aa64_alle2_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -3985,28 +3976,10 @@ static void tlbi_aa64_alle3_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tlbi_aa64_alle1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                     uint64_t value)
 {
-    /* Note that the 'ALL' scope must invalidate both stage 1 and
-     * stage 2 translations, whereas most other scopes only invalidate
-     * stage 1 translations.
-     */
     CPUState *cs = env_cpu(env);
-    bool sec = arm_is_secure_below_el3(env);
-    bool has_el2 = arm_feature(env, ARM_FEATURE_EL2);
+    int mask = vmalle1_tlbmask(env);
 
-    if (sec) {
-        tlb_flush_by_mmuidx_all_cpus_synced(cs,
-                                            ARMMMUIdxBit_S1SE1 |
-                                            ARMMMUIdxBit_S1SE0);
-    } else if (has_el2) {
-        tlb_flush_by_mmuidx_all_cpus_synced(cs,
-                                            ARMMMUIdxBit_S12NSE1 |
-                                            ARMMMUIdxBit_S12NSE0 |
-                                            ARMMMUIdxBit_S2NS);
-    } else {
-          tlb_flush_by_mmuidx_all_cpus_synced(cs,
-                                              ARMMMUIdxBit_S12NSE1 |
-                                              ARMMMUIdxBit_S12NSE0);
-    }
+    tlb_flush_by_mmuidx_all_cpus_synced(cs, mask);
 }
 
 static void tlbi_aa64_alle2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4056,20 +4029,11 @@ static void tlbi_aa64_vae3_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tlbi_aa64_vae1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                    uint64_t value)
 {
-    ARMCPU *cpu = env_archcpu(env);
-    CPUState *cs = CPU(cpu);
-    bool sec = arm_is_secure_below_el3(env);
+    CPUState *cs = env_cpu(env);
+    int mask = vae1_tlbmask(env);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
 
-    if (sec) {
-        tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
-                                                 ARMMMUIdxBit_S1SE1 |
-                                                 ARMMMUIdxBit_S1SE0);
-    } else {
-        tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
-                                                 ARMMMUIdxBit_S12NSE1 |
-                                                 ARMMMUIdxBit_S12NSE0);
-    }
+    tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr, mask);
 }
 
 static void tlbi_aa64_vae1_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4080,8 +4044,8 @@ static void tlbi_aa64_vae1_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * since we don't support flush-for-specific-ASID-only or
      * flush-last-level-only.
      */
-    ARMCPU *cpu = env_archcpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUState *cs = env_cpu(env);
+    int mask = vae1_tlbmask(env);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
 
     if (tlb_force_broadcast(env)) {
@@ -4089,15 +4053,7 @@ static void tlbi_aa64_vae1_write(CPUARMState *env, const ARMCPRegInfo *ri,
         return;
     }
 
-    if (arm_is_secure_below_el3(env)) {
-        tlb_flush_page_by_mmuidx(cs, pageaddr,
-                                 ARMMMUIdxBit_S1SE1 |
-                                 ARMMMUIdxBit_S1SE0);
-    } else {
-        tlb_flush_page_by_mmuidx(cs, pageaddr,
-                                 ARMMMUIdxBit_S12NSE1 |
-                                 ARMMMUIdxBit_S12NSE0);
-    }
+    tlb_flush_page_by_mmuidx(cs, pageaddr, mask);
 }
 
 static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.17.1
