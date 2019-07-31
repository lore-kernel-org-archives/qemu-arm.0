Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071442wrv;
        Wed, 31 Jul 2019 13:38:42 -0700 (PDT)
X-Received: by 2002:a62:8f91:: with SMTP id n139mr8503000pfd.48.1564605522835;
        Wed, 31 Jul 2019 13:38:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605522; cv=none;
        d=google.com; s=arc-20160816;
        b=O2+9Gs2dSIMBHZL5wUCVUI8B992Lt7B3i3iPy/VXCynzvitkIaXOZ0smjikp5KEEdI
         92Jg+hYfN4VXz5yHxhnbbZMePTb7fhlEGPLf2JVFPV5nslrdtBeoeXb8+FcFsnRZNOyD
         dnQtiLxfJMdBZS7F6UyyIIbAsKSm7mEXj8XYu6LOsnAEWwz1Jgw+E+hbowWI99NkNpjB
         51TK8j3Z3Fc2V6bcWtVK0yr1aD8L1tA44UmNozJhBSdvUgG1Ilno4LMKAYnZjcF9GQcz
         0CenSxvphk2mp75woHCrAIZhsDZ0ouy3LfhhIKxOor85gdV033GzrhnQyZbycan2XeOY
         zTWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=F8zJJPz0HoAAcPGItYsG98fn3EhRGHL9/KSAWCPhxyQ=;
        b=p1fWD2NDS37faXTrB7jz61juG316TCUEDE3rprHtvOkrhGVvLJfCjPJ9LDHXquyEmU
         /qVLlwxlPuN2xEKNIK96Lp/AlbJyNmk9YYPh5z2+NEboDJniyX/oeNt2kJnE+xkBBaDn
         ag9JJHAmm763XhrLgGGOwkLiIZ6wRRi3ApL227IS/TzpMFDRBySVTubCTAO0/MAjaiom
         doxVhH9JWmTjYX9ej/wJHEOUEHpNSRa7zko8RtONchMZIHNZuzonWZqBSxm7qQFmi63l
         BVRN90M4rXriQtu2YXyx/y1HavDofW3kx6/LqXOeNQEgNjUiDMN0vAspB+5eY2JsLA81
         bFwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kdwl74B6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 142sor46089916pge.7.2019.07.31.13.38.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kdwl74B6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=F8zJJPz0HoAAcPGItYsG98fn3EhRGHL9/KSAWCPhxyQ=;
        b=Kdwl74B6/jWmsEEKylVhNh+FnEqvpfAEzIn2lRU1DV+O/n0aqloQ5a9vX12Kj+4j+a
         AhFLTo/SkoMoEZu0dPjijScKjTXgFHIreIjwOGrdEpw/a8TLIsXUs8BT66ED9TnXbzYe
         VuK58p3XkTOTfylmbJXdoHnsQkMk0JfAw3i8+dCotxAOcyZ3+WxrhPH5Y08pZ1xUdH6d
         VcGvyaF2775EPpVE1zlsbEJjPZwCAOwagUCd9m9Q1DmZ+W7jA25BCPeyS9hzI+wDedeq
         IsqL8bubc932Lws41JBLO2MTvydw/Bz8l12PPTb7Hxfkw9MctKDI6qdeZ+ZTcRXvAoae
         clgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=F8zJJPz0HoAAcPGItYsG98fn3EhRGHL9/KSAWCPhxyQ=;
        b=avXL2FrE6cBHB+r2A9KLr9onaneRQFS8JdPq7jWX13hqLsER2+8Y19V2XaHZUWg493
         gPWgX5k5rt4yHP0A9k6deklNt+442TqdUwg4xu9enQ6yksFPx5huy3QexSz3mg+WGcrq
         AcDGfDk8tKIMV9ZVtU298Mv3vAhGWiFY88zWiwQp0Wi6ZDIin7frmuutZ6LPt0o0rLKZ
         KEDx7ZNj1I1+ZhYUBjqOSnu2bfbid1Mn+0/pEHkeFuxKnpVC8Ic4NltnzaxwqHajChSI
         CVRfTfJFEztv2AYdrv7dcHsDskkltU7q/h66by/awGIhdTI8y52KmFxNtIyksWPhyzA1
         vgBw==
X-Gm-Message-State: APjAAAXJJ86Poa8n+hUkMzr+Fkj9KAkonxnyYg5a2LppPpwxJHg1ckh0
	34TencSNgf9I/NVf/kLym5FOSiUPwzww5Q==
X-Google-Smtp-Source: APXvYqzMfdfh+XWUeoxyr1jeHDBR6hkx2nkKxbcKB8o5LdXGl98IHaupUed4PR2GNMK8i22Pfx8bLg==
X-Received: by 2002:a63:7c0d:: with SMTP id x13mr75531824pgc.360.1564605522335;
        Wed, 31 Jul 2019 13:38:42 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 22/32] target/arm: Add regime_has_2_ranges
Date: Wed, 31 Jul 2019 13:38:03 -0700
Message-Id: <20190731203813.30765-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
X-TUID: ikrAb57/jWNR

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h     | 16 ++++++++++++++++
 target/arm/helper.c        | 22 +++++-----------------
 target/arm/translate-a64.c |  3 +--
 3 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index dd0bc4377f..1b64ceeda6 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -824,6 +824,22 @@ static inline void arm_call_el_change_hook(ARMCPU *cpu)
     }
 }
 
+/* Return true if this address translation regime has two ranges.  */
+static inline bool regime_has_2_ranges(ARMMMUIdx mmu_idx)
+{
+    switch (mmu_idx) {
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_E1:
+    case ARMMMUIdx_EL10_0:
+    case ARMMMUIdx_EL10_1:
+    case ARMMMUIdx_EL20_0:
+    case ARMMMUIdx_EL20_2:
+        return true;
+    default:
+        return false;
+    }
+}
+
 /* Return true if this address translation regime is secure */
 static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9c2c81c434..5472424179 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9006,15 +9006,8 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
     }
 
     if (is_aa64) {
-        switch (regime_el(env, mmu_idx)) {
-        case 1:
-            if (!is_user) {
-                xn = pxn || (user_rw & PAGE_WRITE);
-            }
-            break;
-        case 2:
-        case 3:
-            break;
+        if (regime_has_2_ranges(mmu_idx) && !is_user) {
+            xn = pxn || (user_rw & PAGE_WRITE);
         }
     } else if (arm_feature(env, ARM_FEATURE_V7)) {
         switch (regime_el(env, mmu_idx)) {
@@ -9548,7 +9541,6 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
                                         ARMMMUIdx mmu_idx)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
-    uint32_t el = regime_el(env, mmu_idx);
     bool tbi, tbid, epd, hpd, using16k, using64k;
     int select, tsz;
 
@@ -9558,7 +9550,7 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
      */
     select = extract64(va, 55, 1);
 
-    if (el > 1) {
+    if (!regime_has_2_ranges(mmu_idx)) {
         tsz = extract32(tcr, 0, 6);
         using64k = extract32(tcr, 14, 1);
         using16k = extract32(tcr, 15, 1);
@@ -9714,10 +9706,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         param = aa64_va_parameters(env, address, mmu_idx,
                                    access_type != MMU_INST_FETCH);
         level = 0;
-        /* If we are in 64-bit EL2 or EL3 then there is no TTBR1, so mark it
-         * invalid.
-         */
-        ttbr1_valid = (el < 2);
+        ttbr1_valid = regime_has_2_ranges(mmu_idx);
         addrsize = 64 - 8 * param.tbi;
         inputsize = 64 - param.tsz;
     } else {
@@ -11368,8 +11357,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             ARMVAParameters p0 = aa64_va_parameters_both(env, 0, stage1);
             int tbii, tbid;
 
-            /* FIXME: ARMv8.1-VHE S2 translation regime.  */
-            if (regime_el(env, stage1) < 2) {
+            if (regime_has_2_ranges(mmu_idx)) {
                 ARMVAParameters p1 = aa64_va_parameters_both(env, -1, stage1);
                 tbid = (p1.tbi << 1) | p0.tbi;
                 tbii = tbid & ~((p1.tbid << 1) | p0.tbid);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index dbe2189e51..06ff3a7f2e 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -175,8 +175,7 @@ static void gen_top_byte_ignore(DisasContext *s, TCGv_i64 dst,
     if (tbi == 0) {
         /* Load unmodified address */
         tcg_gen_mov_i64(dst, src);
-    } else if (s->current_el >= 2) {
-        /* FIXME: ARMv8.1-VHE S2 translation regime.  */
+    } else if (!regime_has_2_ranges(s->mmu_idx)) {
         /* Force tag byte to all zero */
         tcg_gen_extract_i64(dst, src, 0, 56);
     } else {
-- 
2.17.1
