Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp181957njb;
        Thu, 30 Jan 2025 10:23:26 -0800 (PST)
X-Received: by 2002:a05:600c:5112:b0:434:a202:7a0d with SMTP id 5b1f17b1804b1-438dc40d9d4mr69303495e9.22.1738261406620;
        Thu, 30 Jan 2025 10:23:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738261406; cv=none;
        d=google.com; s=arc-20240605;
        b=D/StYsY92VCRb9aXfeF9JPI3TH3yUWphRR+otFKhRQTpyYBZSpOMRFFM6Bk3e2csvw
         1WINbd0qoBmlhSDHXw+gwrQmdaqXy4LrPA3V/uTsud2c3p2HNT7BN+eDil6hHqi82tzM
         f/yoTWG9CMQ//a1PM4OCgSXyz/qgQkMxRmOiRWHSAkD0rfGK+0VZkRytyJSApgvyt8XP
         mL4vMpCg1ol1JI82wE/1+N8CkGfZneO/Jkz3civk2SZ8671ZqnmAS5eG1GR370tVKaiy
         OmQpFPccwotp7pmN/Hg122FvMqv/eT6dmObmV+yFaQIU6iTbxoTGMibB13pwCu0NFtxO
         hmzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hmP8UEFFJb/lmaE2ZgdfHHn0pCkyFx+RjhYIX8J7P0Q=;
        fh=RiJSNyFv98ecbYckNQx9NKP2dJchb+KjtIrNazRBKjc=;
        b=Akb2Mmk0uXAe82cF1uTZjYUfpDn1xO9ZC+20WtptAZc/0bUvoOT8UGVIdiDaGNmyIH
         PftUrr/lxkSwwsDYC8/2znVyQCB+BirFwVJSEHaJi1RNWDsqb4uYdh0rcumwXAi9SX+t
         2JxMWohRoVukxwX9uMIkMWT/rZPyIkZNtdxtPvnGEtKW0fRb/SiN7EoQ+SKfme5/kIyZ
         tlUw9/OaKwvfxdHFoK9jWwGOw1FcBd3aO9G3WipR7Fk/bCYY7RvI1QZIq9oIsgV2aT7O
         PFoRX8rBdjdt0NupmzDMji4Cg5ugceD0QNYlZXcqL1W7nkTq0HmpbWPXxnbR/N63o/yd
         7M+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=utTX4+wS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c5c0eb72csor760485f8f.2.2025.01.30.10.23.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Jan 2025 10:23:26 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=utTX4+wS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738261406; x=1738866206; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmP8UEFFJb/lmaE2ZgdfHHn0pCkyFx+RjhYIX8J7P0Q=;
        b=utTX4+wStlLKx4LZF3tw+8W4l3t8enjGjP+ZT9Xbp77qcZVGnU+b+vX5VBf8MvQGSd
         19YY+Pmm1PdS90eWpjL0FJBMwNmlbulv7Dm2Wud5sUfZy0oCFcjKnADLTnQf39SahSwE
         Pkiawn59+gE+PfmhSPJ+Caq9tp7/Ka0ON6HKxHQPu3CH3Pg6Vg761avKBPoGIK0UOd7w
         Y/LzXAOA7nlX1iPBOt9wv6qAG1jSjKmgW3Tp2wIFf/TdNoEP54i+XHnjWvDzrS9NYR09
         V1qacPyRjhRKyFjsjRx1KHQ3oISpCwIJthG9lo2baZ3cJ7uCUJbodH/snHz/D+cOnOSo
         YaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738261406; x=1738866206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hmP8UEFFJb/lmaE2ZgdfHHn0pCkyFx+RjhYIX8J7P0Q=;
        b=Wc5Cjupe2dShr6KJAcMFglWccYb9E+UJiJh9p0MoTb9Ea0zCv/99w1PdIYR9JECtFx
         qbjzw1YWkPwgrXUW/yHk7w69JZAAg9g1x0vLEx6/lx+HMuR3/+iLhm+eeoTrxKjXsYCn
         6tO64HNXJzlVrByQrsKIHeHluj3pNQi/5OK7UcHCk5q8CIG/9f5Pd0wdkXm7aFA2JxIt
         2f+Q1C/UdO6fYbRYIkixisqY+W/Smoilftfi1jKnnL4uYKpXjVAdWFn9X/zNczvFRq6P
         YgdQa3LllTI/s0o30RKIn0ICwFNBqCWSstES/U6loofzjW05sT0cb/qg0yytPj4ba+Pj
         EevQ==
X-Gm-Message-State: AOJu0YzciVhDpHvKrguHwofrjDkZ5ypn2yQSMBRZbneYwJZIMAZ7HQWf
	vV6i/6xG9O5pGGMG/n9i89ZbSI/RMcdva3ZRI+IJ0K4o4ncl/wXwjlq3KFhnIksMLw==
X-Gm-Gg: ASbGnctYgjsQAdWcAiLrIiHfR4GI5VjThfT3wYKaRGblhm90MMtucN3l1hALJ64zB3j
	Z2pr9E5/xO8KWdW+5PftwLZMquVZj9n2fTg84DCgYNE00UYwR0qih1YFz7i3fMf+KJfQvx9g9OK
	Cpb3xeK3fyZvYOnymkAdRiVEwTzSR55QWiDf9+16JLs6WaQG7n/AnaNx0Vq4ITWPk6zIUkjMBR8
	t8+/Bj6w8xquTkykS7MtDPRPdVx8hem0ZBTBfGSTio1w6EZiJnVC0ROwayecVQLwLwYeBdOLOIW
	BJnZroG4tUPvzydfHj/WwA==
X-Google-Smtp-Source: AGHT+IG8aY4r7B2b0xDU0aJSvyMovUrSwG/pPfK7hVFdfZtHezOuCQ61vk4gxxdxsTyiDNbfTQoHdw==
X-Received: by 2002:a05:6000:dd2:b0:385:f0c9:4b66 with SMTP id ffacd0b85a97d-38c51969feemr6698796f8f.33.1738261405982;
        Thu, 30 Jan 2025 10:23:25 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c101599sm2634426f8f.23.2025.01.30.10.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 10:23:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 14/14] target/arm: Correct errors in WFI/WFE trapping
Date: Thu, 30 Jan 2025 18:23:09 +0000
Message-Id: <20250130182309.717346-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130182309.717346-1-peter.maydell@linaro.org>
References: <20250130182309.717346-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Zscdi30ApYKt

The code for WFI/WFE trapping has several errors:
 * it wasn't using arm_sctlr(), so it would look at SCTLR_EL1
   even if the CPU was in the EL2&0 translation regime
 * it was raising UNDEF, not Monitor Trap, for traps to
   AArch32 EL3 because of SCR.{TWE,TWI}
 * it was not honouring SCR.{TWE,TWI} when running in
   AArch32 at EL3 not in Monitor mode
 * it checked SCR.{TWE,TWI} even on v7 CPUs which don't have
   those bits

Fix these bugs.

Cc: qemu-stable@nongnu.org
Fixes: b1eced713d99 ("target-arm: Add WFx instruction trap support")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/op_helper.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 2230351a8f4..02c375d196d 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -313,15 +313,19 @@ void HELPER(check_bxj_trap)(CPUARMState *env, uint32_t rm)
 }
 
 #ifndef CONFIG_USER_ONLY
-/* Function checks whether WFx (WFI/WFE) instructions are set up to be trapped.
+/*
+ * Function checks whether WFx (WFI/WFE) instructions are set up to be trapped.
  * The function returns the target EL (1-3) if the instruction is to be trapped;
  * otherwise it returns 0 indicating it is not trapped.
+ * For a trap, *excp is updated with the EXCP_* trap type to use.
  */
-static inline int check_wfx_trap(CPUARMState *env, bool is_wfe)
+static inline int check_wfx_trap(CPUARMState *env, bool is_wfe, uint32_t *excp)
 {
     int cur_el = arm_current_el(env);
     uint64_t mask;
 
+    *excp = EXCP_UDEF;
+
     if (arm_feature(env, ARM_FEATURE_M)) {
         /* M profile cores can never trap WFI/WFE. */
         return 0;
@@ -331,18 +335,9 @@ static inline int check_wfx_trap(CPUARMState *env, bool is_wfe)
      * WFx instructions being trapped to EL1. These trap bits don't exist in v7.
      */
     if (cur_el < 1 && arm_feature(env, ARM_FEATURE_V8)) {
-        int target_el;
-
         mask = is_wfe ? SCTLR_nTWE : SCTLR_nTWI;
-        if (arm_is_secure_below_el3(env) && !arm_el_is_aa64(env, 3)) {
-            /* Secure EL0 and Secure PL1 is at EL3 */
-            target_el = 3;
-        } else {
-            target_el = 1;
-        }
-
-        if (!(env->cp15.sctlr_el[target_el] & mask)) {
-            return target_el;
+        if (!(arm_sctlr(env, cur_el) & mask)) {
+            return exception_target_el(env);
         }
     }
 
@@ -358,9 +353,12 @@ static inline int check_wfx_trap(CPUARMState *env, bool is_wfe)
     }
 
     /* We are not trapping to EL1 or EL2; trap to EL3 if SCR_EL3 requires it */
-    if (cur_el < 3) {
+    if (arm_feature(env, ARM_FEATURE_V8) && !arm_is_el3_or_mon(env)) {
         mask = (is_wfe) ? SCR_TWE : SCR_TWI;
         if (env->cp15.scr_el3 & mask) {
+            if (!arm_el_is_aa64(env, 3)) {
+                *excp = EXCP_MON_TRAP;
+            }
             return 3;
         }
     }
@@ -383,7 +381,8 @@ void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
     return;
 #else
     CPUState *cs = env_cpu(env);
-    int target_el = check_wfx_trap(env, false);
+    uint32_t excp;
+    int target_el = check_wfx_trap(env, false, &excp);
 
     if (cpu_has_work(cs)) {
         /* Don't bother to go into our "low power state" if
@@ -399,7 +398,7 @@ void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
             env->regs[15] -= insn_len;
         }
 
-        raise_exception(env, EXCP_UDEF, syn_wfx(1, 0xe, 0, insn_len == 2),
+        raise_exception(env, excp, syn_wfx(1, 0xe, 0, insn_len == 2),
                         target_el);
     }
 
@@ -424,7 +423,8 @@ void HELPER(wfit)(CPUARMState *env, uint64_t timeout)
 #else
     ARMCPU *cpu = env_archcpu(env);
     CPUState *cs = env_cpu(env);
-    int target_el = check_wfx_trap(env, false);
+    uint32_t excp;
+    int target_el = check_wfx_trap(env, false, &excp);
     /* The WFIT should time out when CNTVCT_EL0 >= the specified value. */
     uint64_t cntval = gt_get_countervalue(env);
     uint64_t offset = gt_virt_cnt_offset(env);
@@ -441,8 +441,7 @@ void HELPER(wfit)(CPUARMState *env, uint64_t timeout)
 
     if (target_el) {
         env->pc -= 4;
-        raise_exception(env, EXCP_UDEF, syn_wfx(1, 0xe, 0, false),
-                        target_el);
+        raise_exception(env, excp, syn_wfx(1, 0xe, 0, false), target_el);
     }
 
     if (uadd64_overflow(timeout, offset, &nexttick)) {
-- 
2.34.1
