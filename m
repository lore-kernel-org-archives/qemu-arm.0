Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071544wrv;
        Wed, 31 Jul 2019 13:38:51 -0700 (PDT)
X-Received: by 2002:a17:90a:ac13:: with SMTP id o19mr4720277pjq.143.1564605531166;
        Wed, 31 Jul 2019 13:38:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605531; cv=none;
        d=google.com; s=arc-20160816;
        b=hWKxkNLFCcNpQsc6KlfNR/xrwnY2jyQ40uGXFgXloGDLnexWDR6vxkjFkX370LmbkA
         jRlb5JfHbqP9+lGVqV2Fo3qxF4AzirPzQIrw5XxeXxXGPeDpX4bNc7Yi4vtLL4vkcszU
         0x4L4q0AtOOrwWcl1vHDSy5xFzX4Rmxb2CtnNrgSmpu8AZClQAJVCWP1pm2ArT0xgJae
         Fuk5RStLz3KgbxLjMjRFgEOvlKEo9hTZZcW6ZCy/NjJI9V3xHRdl39VYQTQRsRI8I69p
         XU/6AYKlD5JeCit0v1XdOUxyPJUEE5Qor4JD1pBtV0C+yXgdDb/7OE9VFf0vTKgaqy5t
         MBhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=+7keF6G5xzpT4+93ObrzwUEEy1FTEHDioAfRG1ABjog=;
        b=q0Xuw8mon4pLT91nUtH5gdOwONh8QYMSNu5y4zAi2mVhE1zvtJTi4OZmpbSiLRrJJo
         eJN/9EXFZvivbzydB56uABFj3tzyc/pCabeK/ojdqLGUyg+V3EuEqw1PXk56IBtBNbBQ
         FcF1xmiKK7xA9giaAwAIbrcjf+X0CgnAY14KwNM4J7L9xHE96robLOj1BolWbsxDcyPt
         8o/NkEB3WLQsh/QQhP9RnERPH3/U68mWsTQTZbBKQda7wOKhrL3m1j8emsoYVowTmu43
         2auj+MdnYvWAdcxNFeHSlbSrTmi/24zDibcUajLGTP8cpiHZaj5XGzvESAT4k1/Jw2St
         096g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hb+iG6hi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 36sor83073271pla.71.2019.07.31.13.38.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hb+iG6hi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+7keF6G5xzpT4+93ObrzwUEEy1FTEHDioAfRG1ABjog=;
        b=Hb+iG6hikB6nHFx/0MT8WzAVyCuE4kWuAO6EzmOEnNm3pFGP9rMfaa1afO3UPUFGnv
         17DQ2LWK+1yBpJTJLNPFOiJwODFNOF90nLDcIgpHG0kwEYnRZjq0JXk/KkvqdwvJg/CK
         pQch3+YjbwCiE2BwPmod0uoZT2TyuP7J2F6c4Z4mvkyo8QnjfDok7IReDNPNkQlp/tXw
         oDzcFFZZ2bb7UBYwaidmj5/YQClk1pXg8m0qIr38dxZrN1k3QhnzeXRXJcsfiLRAhSic
         fSiROngHfmDmaEwU3JQik0jKTVpRd//AbtSbbZk+IY1/siAwrNC1xfGOGTP91M302qm7
         9SKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+7keF6G5xzpT4+93ObrzwUEEy1FTEHDioAfRG1ABjog=;
        b=hEWJlBdnQKoSxIoEfW3Emgvp/ItLgRcwJrnfeAxY8mhGuqTiS1hcDhv68T7BrJRnF/
         fzqIewS54IO2e2CjREK1wiIPCp/O/GifNFvcJ/6WHuvc98jupVqPXlklg8NscI/9qvnf
         mTi5tb+jmjmbGofrnbX7ruXvh7bZ/luMykEFpLq5mz5+V50z34uTLUn9hTrCb9UmPg/T
         UQwabm/l0MjHefs0zy2rFzkNt1L9ov1LeJFcXpvjQ/RuAeC9Aiuc+WlbV8vRSSdAhWLt
         ojYIkQEc2M+ITbzrHGqYxKj6Q0i37IXCA/NlBpdZYVsA6DvIRDE8F2KA2r/UreuAaMhi
         DUOA==
X-Gm-Message-State: APjAAAWPmBi/kv2+MT04pQLeqnH+paAwTcQ4KQbIUnkYmgyorxC8AYpq
	WeJ2DPIo8KKA6t/Ph46sPN0JINk7
X-Google-Smtp-Source: APXvYqxPqhnHLkD9ZTEK6UndKKSKwUuWx9yFtf49NDBkQ9tTj1uBFc4OcS5nvaMeOGiudvRm9gc63w==
X-Received: by 2002:a17:902:f81:: with SMTP id 1mr27243792plz.191.1564605530692;
        Wed, 31 Jul 2019 13:38:50 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 29/32] target/arm: Update {fp,sve}_exception_el for VHE
Date: Wed, 31 Jul 2019 13:38:10 -0700
Message-Id: <20190731203813.30765-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
X-TUID: r88xCwDfcP7r

When TGE+E2H are both set, CPACR_EL1 is ignored.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 53 ++++++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 15a054a141..b29717edb6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5507,7 +5507,9 @@ static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
 int sve_exception_el(CPUARMState *env, int el)
 {
 #ifndef CONFIG_USER_ONLY
-    if (el <= 1) {
+    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
+
+    if (el <= 1 && (hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
         bool disabled = false;
 
         /* The CPACR.ZEN controls traps to EL1:
@@ -5522,8 +5524,7 @@ int sve_exception_el(CPUARMState *env, int el)
         }
         if (disabled) {
             /* route_to_el2 */
-            return (arm_feature(env, ARM_FEATURE_EL2)
-                    && (arm_hcr_el2_eff(env) & HCR_TGE) ? 2 : 1);
+            return hcr_el2 & HCR_TGE ? 2 : 1;
         }
 
         /* Check CPACR.FPEN.  */
@@ -11221,8 +11222,6 @@ uint32_t HELPER(crc32c)(uint32_t acc, uint32_t val, uint32_t bytes)
 int fp_exception_el(CPUARMState *env, int cur_el)
 {
 #ifndef CONFIG_USER_ONLY
-    int fpen;
-
     /* CPACR and the CPTR registers don't exist before v6, so FP is
      * always accessible
      */
@@ -11250,30 +11249,34 @@ int fp_exception_el(CPUARMState *env, int cur_el)
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
