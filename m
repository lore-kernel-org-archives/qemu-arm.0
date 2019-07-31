Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071512wrv;
        Wed, 31 Jul 2019 13:38:48 -0700 (PDT)
X-Received: by 2002:a62:6044:: with SMTP id u65mr48285043pfb.15.1564605527901;
        Wed, 31 Jul 2019 13:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605527; cv=none;
        d=google.com; s=arc-20160816;
        b=Qw5QU0RZqfSAy0KeLUwD9sEu+fRST6+ux0spiQDiw9P1eph9MSn/ly/PL49t0BZk4u
         aJkE30/xOQ7EYEurH785HPz9fsI8N0ZmoniorIuApg5CEpcVnbxLRTncF3JUx75vzzcQ
         9S1tTvGxNy9olEApqb0jOuJEqVskS+EKrXGbcDljWXzK7JfMSv4iFvorAIJE+uw3smEK
         UF748hPmbRE8L8OBGIgldlHAmvFm5YpGh0X+b0FRwnAVQVFL8jyWTSxbLULKYX1qA4zw
         CxdF0nKAadqdyhz/+5oFuEEKSxXxB75zDNTjJBZNBAnz31VJUjxYogp9vhCawF+U+J9l
         Tj3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=YBFs9iOiLgu7VKenmzw4aXW6nYPbjotzvVPML6HKYTM=;
        b=n2hmCyKgM4/ndtCr5CyQx5Ua0zXibFn7jbEeZQ1Uy8Nj3ojt2jiFXo/dovVLgyCyeq
         WEkR/8JZt8iqk5IkkJ/yQZXJeZ+Ppx9OE+awaRckgUvavedjADJ9F+1OiiPkMCcrPKf2
         dNcvBtkb4w8OCLoB0CgaguOAKheemkpnrZClv0KgfTCNFV2ZPwDWnsck8KExNe3dgZEs
         H+xdeLief6L9lyvDDFy0sXvnE9tO2GUKS/xWoW2smgt6oUG4dDYqAw4OAO02w6yOqQvk
         KcZobTVX6q9x8pmv0Eo8vI9fhT8L/pvYDcptGgDuQr8laNzaZ0IrldtA3dLLkb5WkQvA
         z5sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k6Yc8ZuB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k1sor25524178pfi.70.2019.07.31.13.38.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k6Yc8ZuB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YBFs9iOiLgu7VKenmzw4aXW6nYPbjotzvVPML6HKYTM=;
        b=k6Yc8ZuBX4U2Cf5P4Q38L4WBfL+KxeqRknh+AXILTGEQ6PRNkpVJa9gf4KdGj+GTcb
         0bD1ELvDm4LRZtVLcHYvYdHus+mHicLOuU/hMLVTVWhC5jdvQCLcohfYwzVSMDEbsGB3
         XTIqIhLnFrOXrR02pYdmjKHgqZDgwekvj+c8V2mIjYs1H1tvwDM+UrSqeVJAkFFcOm0z
         sn9sGlpsNaLxmcU/Z4QzX91A18J/jZy7uRcR2s5cF1WdcAcG1gh22MRBMoB0ymTvQU+9
         2fsn9g5XmvZKmGwvzrMTyaFFzNeNajzhzUfcUmlfYNK1AeXUWuvHDkO+OqBexipY0/+i
         hD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YBFs9iOiLgu7VKenmzw4aXW6nYPbjotzvVPML6HKYTM=;
        b=mpj/EsF7ghkol8ArNDzjcwoihf+zPZlSJu4Sgrifl7LPK5N8APnpR2gyJVmRw545hh
         OJmAuOMOW1lr8JDJC0nzvZh+k+iVdlGor97scbpuRU0iLELBMO4hh73UO2VgnpwRdbc4
         ugWxBEqr+eJGgMwcKtaEYqpQyx/6qJAVxJNJ4emCL3P2uOkDAWCyM9Yu1aj0Asr2PfU7
         +DtyV9ExeY/7jzk+QnA1IT8x7zewYYbsgm7xwYdV3RXB+Tvy4zFb+lZqgxf++Mb8ViOi
         tP+zbrVvzHho3e94v6TAhNoxX7BXss4FB9xPnmLGdY6R3oTlRl80SMYgKjo+7sij87tg
         m5pA==
X-Gm-Message-State: APjAAAUdcLug+QLbDjkPQCLAL/weizf6eSL7+QnA9SXwv1glz1ckNNPS
	dfpZuRTIIxabrbxte9+ufxKRFYTm
X-Google-Smtp-Source: APXvYqzs+e0yce+b0Wn1L/LBNw7LkwwUyudDlOpEWjZbRa2l+ynSc3FUc9+06wJlMLvxDRLu2eneyA==
X-Received: by 2002:a62:8246:: with SMTP id w67mr50443183pfd.226.1564605527448;
        Wed, 31 Jul 2019 13:38:47 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.45
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 26/32] target/arm: Flush tlbs for E2&0 translation regime
Date: Wed, 31 Jul 2019 13:38:07 -0700
Message-Id: <20190731203813.30765-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
X-TUID: MONKB502GFKl

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 30f93f4792..b9f0d387f4 100644
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
