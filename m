Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2201131wrv;
        Sat, 3 Aug 2019 11:48:35 -0700 (PDT)
X-Received: by 2002:a65:6288:: with SMTP id f8mr123468261pgv.292.1564858115204;
        Sat, 03 Aug 2019 11:48:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858115; cv=none;
        d=google.com; s=arc-20160816;
        b=GeOh+0OAmOd80aMHs9bNDv3cbqtF4K21L1cYPE6tfR8mn7jZcCO6Oz2jGWcbHYOD6E
         4QmmbB/Fc5ta6HvoaFXe1qnzbb3uFYX+G2bUfhPHixqX3d/NMHlHJTA9YlOe1wqo0xkr
         H2ar+F/XvjMmbuXmiM5cEUkHd57AJJOaoTa3Cfqzs2H5sZTthGWIorKznovMs+jrAKyg
         kvw0Yz2U4gqhxE7nRkdWQu42sgGo3jcKfNoyfoQp+a5l2tn/vO/lasbyzX4hDSfL98ot
         jlzho9Pvjvx+NHACKq6qUvfV26DkkyNMKzRX03I7ZGwuKZMuW7Ibj85uSkezETpo5Gg7
         gVwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=MpItA1dQTcuKZiJtCdjWs8WMTH2c/gBkJl0/pbYk+Ag=;
        b=TsW/5QFIF3e0V+PPjNB9CFtXiZl4oVomqqqynASrRTdvusdH9BW2sR4SANaQhZkcUf
         Qka2ZmP0CmauhMDISwuzhvWygdT8dBSUrrzhEo/LhgyFwavtUL3GS4GSKZodEz/W72NW
         LvExB9uVAk5oq8FYUFEC1dO3laMmsdkcUiv/Cdtjx/ecLJUGiZO6J+0AWwK7Ucr5WMLw
         MWGKoIBshZ9ydk3LTWmUHBckk6Uhqf4zKFAv+rkUO+2QwIpvLg8N9ENTRcQ9IYP5OCrq
         mE5dFZykr9TvObEUfndKAVeiKgjnsqjjEUYaxEMyZBk3jq3pZdx2ne41lqa/nl5Ore0/
         LfiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dyd6gD5w;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s7sor94864522plq.42.2019.08.03.11.48.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dyd6gD5w;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MpItA1dQTcuKZiJtCdjWs8WMTH2c/gBkJl0/pbYk+Ag=;
        b=dyd6gD5w/4Z2lzudxNV49llWNQPEJUnKWUVoGSgnqRWeB254Fu61z1VLQlr3V41LAf
         PUcSyUdJt4beh8L3lxmOq/VU6wJutjNQ9Bm2BEiE+OKjKmv/ef84XRZmNDgk4IEmUbEh
         X1jSvQReMowgAPMPo40P7JTnmTGiW7nVwAU1FRYBAfV8jHXjWfRNZI6rNiRqGBzlm825
         lfBfdP2/EIZlhzW8egdiiEFA8GDjYJIUQwt7pdjWMTU//wYGNPmxPqGhfCtUhtpwWScx
         +ifF/NZ80NPq3l2CwdHxEuuWSsCV5JhdPP/aBf25qxm66O/OUmdNyRN6y/7A5QW277e2
         ozbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MpItA1dQTcuKZiJtCdjWs8WMTH2c/gBkJl0/pbYk+Ag=;
        b=tDcMo6rwJ1ugPtux+iakalczY93gGg/MH1kwEGGEn3zhjaNPLKkWOBbwxExL7ElSJh
         9KpHy90QKlzwSkuAZ8dOor6c5xo4VBQIjdDf7i8aSrbgdowpjLrzaOsobUU6IfMdVUYY
         qaB+ghak1vJCXuGoTDLiaBUC5udldRMtVYeFi5xyiPoCbvnHrPBo/gOXT42dD1L6QkzM
         PjccbeZwwKcPyBBs9ogsAy1Fu/aAvFAEa+0E5sqB/gCiiDZFTPBVKPXEJ4NVZ0l/Vq0Y
         GG3wUDVQHX+4byIghwYo8wWQsxLze6EiS/UaeSFyt3ywU8KpMjQU6HxjXCnt9NkntAdi
         ArHg==
X-Gm-Message-State: APjAAAW5NnPla8b5kaM6uFo1I44ECs1XNExuK5t59zdMGvu/hFrJsM7S
	iymOIkI+DJ4IVypJRsToBcKom9UNoPIaZA==
X-Google-Smtp-Source: APXvYqxR9hfFUx1qDYkUQWg15/UHOUV54tjNdwJbJkiJo9V2NUyvUCuagpp9ouCdRYROePBGgNLE3A==
X-Received: by 2002:a17:902:112c:: with SMTP id d41mr126176670pla.33.1564858114794;
        Sat, 03 Aug 2019 11:48:34 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 27/34] target/arm: Install asids for E2&0 translation regime
Date: Sat,  3 Aug 2019 11:47:53 -0700
Message-Id: <20190803184800.8221-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
X-TUID: ks+spIBbqT3y

When clearing HCR_E2H, this involves re-installing the EL1&0 asid.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 38 ++++++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b8c45eb484..9d74162bbd 100644
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
@@ -4670,6 +4689,7 @@ static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     ARMCPU *cpu = env_archcpu(env);
     /* Begin with bits defined in base ARMv8.0.  */
     uint64_t valid_mask = MAKE_64BIT_MASK(0, 34);
+    uint64_t old_value;
 
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         valid_mask &= ~HCR_HCD;
@@ -4696,15 +4716,25 @@ static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
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
