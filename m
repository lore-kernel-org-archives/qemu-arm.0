Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2201185wrv;
        Sat, 3 Aug 2019 11:48:40 -0700 (PDT)
X-Received: by 2002:a17:90a:8a84:: with SMTP id x4mr10237114pjn.105.1564858119903;
        Sat, 03 Aug 2019 11:48:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858119; cv=none;
        d=google.com; s=arc-20160816;
        b=VZ+BVZqELCqth1qMoFa2ZZOmykbIA1sevgbi3CTr4N2G2wo/1mVU5YDcwh5xdBabGo
         os2+/TcEx4TwX5u/uQ3v0f+huL89i8jLXPiw8iFNKVyyyu34CUKS8QEHb6vX5CnZrg1c
         ZevTjtLPoPEQVlrmVse0MxtzY0I76aWARGEW89vuiExOHSR9QXTR4ua2sIX9lck6llSK
         xZ2A0b1pxyAfvRJLhs3Xk5mX0gkoKSL0TgOOJbeUiiEadxYA/GllpGZr67GwZfYypQAE
         FMDAR80LLBQaJYrXnFAN3WP+Yp10cDzmbc+f7xr7qGViI+yPJxR9WcL0wgHnalPpEFsn
         7DOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=fQb2baX8+br9XDTjkUGb5FILfpDmjfnieLRvexjfCRg=;
        b=BTJWRIocrkLhnkUMFfIGCl1BqfnaedouktugmOikRskKJNxsz7JklOe72cu6d9fJVD
         xY1Ab/srM4P1eYfDnVtWODxKaUhUrPdoRvFPkTmw8PmV9TmYlNTAfpkz88stdeC59t9u
         D4cJ2pEQVB8CQhqnBhyxkaXSU/6wnLXTteY9ICYlUH/TA5SBkWIqxU1PKxT/6pyDwzgb
         EJHPq95kLPwEdORgF1DJ33ih2rjYijumVKvGoJpQuhkziLCYjf1jWynWsHxRr1JZp1jJ
         6ZkZlNc/vsOpckcxHhN++XFMjFcdJmV4Pxml56pkFlMxotF5H+6LMt1geSb0XuQOBiat
         LMIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZHFbLtM2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j8sor60810371pfa.53.2019.08.03.11.48.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZHFbLtM2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fQb2baX8+br9XDTjkUGb5FILfpDmjfnieLRvexjfCRg=;
        b=ZHFbLtM2E06kgJw7hT0Egbeg9owC+1p6dPnG4drYYDaV1gn4UGEFq6dm4GnDGTxgJ6
         yPYbHxLvHHTQ3bYaIFZwUNkS/1xDppWkvjVkOmRUqHXoI+Tf4z1UGdu1DjksEdf8uGXl
         +SuFpIsNLFprQtP1if5EjQGhtH8IcVn+wwwCn7GLUllKJRV88oqO8J/DCg0D5HJfDnT6
         +o5weLX8BQujymbxv3/CzWAb7CFIMmM4VCf+WhyDSWqlwF8rYhiXKUZaPemUAn9/qU3C
         TBMaSgrAct7EUoGw408h+YJRJYNrc2S3hF6DF8YeT/KQP1YpAbN8O6n1vfsTauCdmhs1
         Q2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fQb2baX8+br9XDTjkUGb5FILfpDmjfnieLRvexjfCRg=;
        b=qnF4XvpRtUGgPl5bdSxvXR+a24B0dt3hILoXpfrJR5Mc7p8Zb7TF19jumim8/p66Ml
         iH1FAFcAvCxKUHKrqr09R97PvGBXRplNMMz58DpV7l912UlHWuak6a1BFho2susXmgH0
         g5/k1I5uSY7AWCyc9vKz/Op0DbdwUtzEPOdtV8GEG5DqdIY0sjYxHNYwywFo6Y6jVmtQ
         wtWJbR1sZoQu2heAOraVATtZNpykHqlC4zs72C8e0bylHnMajzLoUs7XjA6Kqwg5N9tX
         mD5ilfObGdi5LOB3qOoRqPcbSbpuME68GGME+aEvLu5SQZ7BQGYE+jrOwjqhcIjE4VsM
         zW6A==
X-Gm-Message-State: APjAAAVwJrxJAHefx281UkoABk3ZDrgKaiOu/jbM3KdM3nM+orNDHsKP
	xlx9vK/aLdbXGAYuW+Yvbyng0OMF
X-Google-Smtp-Source: APXvYqxINb8Pz4XuN9P/UruqFE4PZJ/nLF369CIR3xnPOPBp6QD6RZuXQ+W29y3PmKGblH6A890Abw==
X-Received: by 2002:aa7:8b10:: with SMTP id f16mr66690094pfd.44.1564858119468;
        Sat, 03 Aug 2019 11:48:39 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 31/34] target/arm: Update {fp,sve}_exception_el for VHE
Date: Sat,  3 Aug 2019 11:47:57 -0700
Message-Id: <20190803184800.8221-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
X-TUID: yz4gJ/mNsONG

When TGE+E2H are both set, CPACR_EL1 is ignored.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 53 ++++++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d481716b97..2939454c8a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5539,7 +5539,9 @@ static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
 int sve_exception_el(CPUARMState *env, int el)
 {
 #ifndef CONFIG_USER_ONLY
-    if (el <= 1) {
+    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
+
+    if (el <= 1 && (hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
         bool disabled = false;
 
         /* The CPACR.ZEN controls traps to EL1:
@@ -5554,8 +5556,7 @@ int sve_exception_el(CPUARMState *env, int el)
         }
         if (disabled) {
             /* route_to_el2 */
-            return (arm_feature(env, ARM_FEATURE_EL2)
-                    && (arm_hcr_el2_eff(env) & HCR_TGE) ? 2 : 1);
+            return hcr_el2 & HCR_TGE ? 2 : 1;
         }
 
         /* Check CPACR.FPEN.  */
@@ -11263,8 +11264,6 @@ uint32_t HELPER(crc32c)(uint32_t acc, uint32_t val, uint32_t bytes)
 int fp_exception_el(CPUARMState *env, int cur_el)
 {
 #ifndef CONFIG_USER_ONLY
-    int fpen;
-
     /* CPACR and the CPTR registers don't exist before v6, so FP is
      * always accessible
      */
@@ -11292,30 +11291,34 @@ int fp_exception_el(CPUARMState *env, int cur_el)
      * 0, 2 : trap EL0 and EL1/PL1 accesses
      * 1    : trap only EL0 accesses
      * 3    : trap no accesses
+     * This register is ignored if E2H+TGE are both set.
      */
-    fpen = extract32(env->cp15.cpacr_el1, 20, 2);
-    switch (fpen) {
-    case 0:
-    case 2:
-        if (cur_el == 0 || cur_el == 1) {
-            /* Trap to PL1, which might be EL1 or EL3 */
-            if (arm_is_secure(env) && !arm_el_is_aa64(env, 3)) {
+    if ((arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+        int fpen = extract32(env->cp15.cpacr_el1, 20, 2);
+
+        switch (fpen) {
+        case 0:
+        case 2:
+            if (cur_el == 0 || cur_el == 1) {
+                /* Trap to PL1, which might be EL1 or EL3 */
+                if (arm_is_secure(env) && !arm_el_is_aa64(env, 3)) {
+                    return 3;
+                }
+                return 1;
+            }
+            if (cur_el == 3 && !is_a64(env)) {
+                /* Secure PL1 running at EL3 */
                 return 3;
             }
-            return 1;
+            break;
+        case 1:
+            if (cur_el == 0) {
+                return 1;
+            }
+            break;
+        case 3:
+            break;
         }
-        if (cur_el == 3 && !is_a64(env)) {
-            /* Secure PL1 running at EL3 */
-            return 3;
-        }
-        break;
-    case 1:
-        if (cur_el == 0) {
-            return 1;
-        }
-        break;
-    case 3:
-        break;
     }
 
     /*
-- 
2.17.1
