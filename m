Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2201141wrv;
        Sat, 3 Aug 2019 11:48:36 -0700 (PDT)
X-Received: by 2002:a62:e301:: with SMTP id g1mr62981736pfh.119.1564858116669;
        Sat, 03 Aug 2019 11:48:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858116; cv=none;
        d=google.com; s=arc-20160816;
        b=DwCyUpSR9AwX7M3P7VuYEVLsUhf3GjqVXlcYRQte73rJkuuo/qJGDSlo7+HuBujiFx
         LWBNOBtv/JOUINNA5TpG6VYilnZ9Aqpnf06S+i/vnYtNRjvtPkCN5s1nwskNH/Q/c5FM
         trzfn5oMCrG7xSkVe9l6ryZ2dk387UTr2lxd6xPodG+/+DlrTz/86YYl4X6mwXvZ3tTQ
         j9Qp5DV1RPdLniUeVVw1QYyq0Y9N4sT8Bs1lgY9eJJESm+RvY5fYIp7c8004FuQHr0Zi
         8QDnZqtpc732IQodAAXB5CAg3Lic8+q45jX0MYjTQgMZO5YxdXzct2YMY0p+V/6nlxK+
         HbZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=AKU1gGfJD0fHB3QeRt9QRaO7IOfL7ZvP1zaRZud/BsE=;
        b=ov6eUwVguk30A1+ts8+3vLnhdiHEpSlMPVfjqskjOsW3Kgaqfz6KrJ5uwqcj8uGwLF
         Oor8P4+rGENd2UBYRwZ6cj22Dv+AkTq5ELrU1FufCH+oQPY2Z6yj/86SD7N9c/b7qKfw
         8Y65ueEmCPWTNVs11pjBSmW8IItRsl7eQTeCceyJF0hz9jZwFRGHjDRyoWt5hKD95hY5
         CCIOAQjEKrIhcqB5MSUavQpY92QtGUylcaM+tOs3XQ8HqR3M2DEWcs/IPZdQD6rgPnQY
         aIh8Vou5b6jDG2hMrSo+xGOfl5QSS2I1ZIB3ucJAJXjHlp9mvggnPcxgMJk0gEA7QrAY
         WtKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RzRDhP10;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r9sor4369944pgj.41.2019.08.03.11.48.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RzRDhP10;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AKU1gGfJD0fHB3QeRt9QRaO7IOfL7ZvP1zaRZud/BsE=;
        b=RzRDhP10pg0B8kssRnKpGMDyeZ0CTYSkr/iXpyetK+I8OqDcpyaHvTOEzBw9q1+vnS
         yRXRNdfbYkO7LoK95UnEZ+G6QuxWCyTwjDy/eBXf4WpoKjVDPqMUSIS5pHc7BzDaztVT
         8f5XPqSlCC5FCy6ick5E2j062jJ91k70CN8IBZxr5CsWTIB29MKBccHdbLbERCCpFMur
         vS8dfJo8ddRCKHLQzpXt1t+/3sjVieV8Qz0Z01+0EuNNoAJL4eGO3RVvsKoIaltd1syB
         eBQh2rtbnAiKOx1WHALl/cLcW2DlglBKn8iLF0Bdx8cm3qv2uCP7WuYf68vS057Sy+1Z
         KX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AKU1gGfJD0fHB3QeRt9QRaO7IOfL7ZvP1zaRZud/BsE=;
        b=nR7kq5PoNX+qBI/ZN+FN4Y7MWl9nsH97mcAuzqOd/UtO/DbUj3dsPvvEadfxQJCso5
         m+P4VauwCh5fNGRfnGiB6NIbJ+zq7mYVe3wJk1FFDyxEr60LgE1XBUiplGBZ3kw9fB2y
         zdQKyRwI5jcHWbqsNDIsMhKS7OfAIgLu/6Fg2c6Vl2C3LKRhArYjth1EcK+XxkXf7PyF
         F2k9EuegCxkj0A7b2m5KEjcIDjLCEknXmq1xlKuJFGx+J/zQCaYjQ6YXvnJVC7Wk1Hjt
         39SF9UWiMW+mZiPDry59Yvf5TtoexpQuNAJ11IboZhWBZRTOfVMWHHXW4BJ+nIZKodBc
         wgag==
X-Gm-Message-State: APjAAAVXO8Rq7UkKISsFSeRHBal9bnHYn+Lah3TllkQAhluwr4Jxy81r
	ZRXe1JutX/GwIQr/fKDQbxf1img+
X-Google-Smtp-Source: APXvYqxfGRFlZW0fGSbd060rHVdWw+XBpeejBw0pnbxlt97oLl0uZuoml62TGlrd5/xB8IhgPdTSOw==
X-Received: by 2002:a65:57ca:: with SMTP id q10mr133449832pgr.52.1564858116151;
        Sat, 03 Aug 2019 11:48:36 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 28/34] target/arm: Flush tlbs for E2&0 translation regime
Date: Sat,  3 Aug 2019 11:47:54 -0700
Message-Id: <20190803184800.8221-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
X-TUID: MeUOAZmopQEm

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9d74162bbd..984a441cc4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3917,8 +3917,11 @@ static CPAccessResult aa64_cacheop_access(CPUARMState *env,
 
 static int vae1_tlbmask(CPUARMState *env)
 {
+    /* Since we exclude secure first, we may read HCR_EL2 directly. */
     if (arm_is_secure_below_el3(env)) {
         return ARMMMUIdxBit_SE1 | ARMMMUIdxBit_SE0;
+    } else if (env->cp15.hcr_el2 & HCR_E2H) {
+        return ARMMMUIdxBit_EL20_2 | ARMMMUIdxBit_EL10_0;
     } else {
         return ARMMMUIdxBit_EL10_1 | ARMMMUIdxBit_EL10_0;
     }
@@ -3956,6 +3959,10 @@ static int vmalle1_tlbmask(CPUARMState *env)
     if (arm_is_secure_below_el3(env)) {
         return ARMMMUIdxBit_SE1 | ARMMMUIdxBit_SE0;
     } else if (arm_feature(env, ARM_FEATURE_EL2)) {
+        /* Since we exclude secure first, we may read HCR_EL2 directly. */
+        if (env->cp15.hcr_el2 & HCR_E2H) {
+            return ARMMMUIdxBit_EL20_2 | ARMMMUIdxBit_EL20_0;
+        }
         return ARMMMUIdxBit_EL10_1 | ARMMMUIdxBit_EL10_0 | ARMMMUIdxBit_Stage2;
     } else {
         return ARMMMUIdxBit_EL10_1 | ARMMMUIdxBit_EL10_0;
@@ -3971,13 +3978,22 @@ static void tlbi_aa64_alle1_write(CPUARMState *env, const ARMCPRegInfo *ri,
     tlb_flush_by_mmuidx(cs, mask);
 }
 
+static int vae2_tlbmask(CPUARMState *env)
+{
+    if (arm_hcr_el2_eff(env) & HCR_E2H) {
+        return ARMMMUIdxBit_EL20_0 | ARMMMUIdxBit_EL20_2;
+    } else {
+        return ARMMMUIdxBit_E2;
+    }
+}
+
 static void tlbi_aa64_alle2_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                   uint64_t value)
 {
-    ARMCPU *cpu = env_archcpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUState *cs = env_cpu(env);
+    int mask = vae2_tlbmask(env);
 
-    tlb_flush_by_mmuidx(cs, ARMMMUIdxBit_E2);
+    tlb_flush_by_mmuidx(cs, mask);
 }
 
 static void tlbi_aa64_alle3_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4002,8 +4018,9 @@ static void tlbi_aa64_alle2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                     uint64_t value)
 {
     CPUState *cs = env_cpu(env);
+    int mask = vae2_tlbmask(env);
 
-    tlb_flush_by_mmuidx_all_cpus_synced(cs, ARMMMUIdxBit_E2);
+    tlb_flush_by_mmuidx_all_cpus_synced(cs, mask);
 }
 
 static void tlbi_aa64_alle3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4021,11 +4038,11 @@ static void tlbi_aa64_vae2_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * Currently handles both VAE2 and VALE2, since we don't support
      * flush-last-level-only.
      */
-    ARMCPU *cpu = env_archcpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUState *cs = env_cpu(env);
+    int mask = vae2_tlbmask(env);
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
 
-    tlb_flush_page_by_mmuidx(cs, pageaddr, ARMMMUIdxBit_E2);
+    tlb_flush_page_by_mmuidx(cs, pageaddr, mask);
 }
 
 static void tlbi_aa64_vae3_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.17.1
