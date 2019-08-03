Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2201101wrv;
        Sat, 3 Aug 2019 11:48:31 -0700 (PDT)
X-Received: by 2002:a17:902:23:: with SMTP id 32mr50422937pla.34.1564858110906;
        Sat, 03 Aug 2019 11:48:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858110; cv=none;
        d=google.com; s=arc-20160816;
        b=A3PvOJqoKDYfLY5e3GbS4gXP4azOW4WCisNDGflheQaGViJ8kraTEZmiMnk7DbOEKl
         1iu8mFRjevjvT/UNo8zgVWBODO9lY7d8xoUz5Yvqfs13d+zcZEMwHO56NUkE4CprhIig
         KvjI0ePC6P83SMVH66xTPydqx2uhhKUZajOMlahTVlLnONfeq+e/4ZkMrscDzjPzjJ89
         l1FBgfYY4jh4dfN3XkR8OzOg7FxhbwK9CwivGrcHgmoR/Cn8ssjtex9hOPEXF3+jYgtU
         Gw8aHbMsXq1klsuMGU6GvNSfnInTmtUg7wBUXvz5fA9BoawmEpYHXIF7rV+zCnn84HHp
         3bbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=990oq3Jk2iwM+tnufP71c3BjXCbJEu9Ritd8u64nkfc=;
        b=xBfB4UyWnAvWJ+l8GW69I1cMdukKl6mo503OhfK89uJMnl2moJ3wWgHjDkGAc2LwS0
         unkjmn7BVnS6R5FjOeS2NclDPL5FSXt4GFhoFg1F/q9Kwe11fJYeA5ZxJ4q8KGJIRjWA
         vZfQZeokmIRjRr382T8cqWxd0MXaTz+qglIDhad14H6wQynPVhTzkJb+bAxKcMp1FCwW
         7oH38UaFsmtZKmyE9bfDUtV5VoTdMjuhYeMlmNVzBjjVU7bvyzrQkvXnx8Iv1cedO/XI
         PDkse+QzrsTih1Gys4FCIEONkpZpZJFJVBV/IBCqTf39Rby/vYeq3+fG8yZtmz0dKJZO
         qOYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QAYOiJWr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r11sor14662945pjb.8.2019.08.03.11.48.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QAYOiJWr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=990oq3Jk2iwM+tnufP71c3BjXCbJEu9Ritd8u64nkfc=;
        b=QAYOiJWrEQohdb0ezaHo0wG2XvNgh80GWi42I6kfRjO7WMPazyDP9i06wrRYddoSmU
         uyWtoHoeIPKeWz96c/rCKqO39n5zTWue5SNHTTkA1XC6iG+6ZOMSqHc+Jnt2jYSObR7g
         4LCzxJW17ZhlCD8D5oiuCWB++EnKAFLT0MCCHTQ+3lXrIzhAwhnQWkynvvh7ui4Hmnde
         slOiqtQA0ZYhfC0IX1XsB3XRFp5NRnCg3KJ/ArwUzKqCT7DWx7qNFsZULQdA0t2qb0o3
         EwS5cLkpEZI6NqR2ovZNEd7H5962ZgpoL+IfwuIZp3XjH5BIC+RWyRx9hNIhqiqG5jbB
         njkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=990oq3Jk2iwM+tnufP71c3BjXCbJEu9Ritd8u64nkfc=;
        b=plDyZkbKIJFGfCfsKysWwKHFNnOfIKmCp0HlN5FPjcrLp+ql2X0elHeDwfNej9bG9I
         J2HOn4Aqj9169HVzArITd7pBk/EAU0lfuYSbL5hlN3/JVBKf5yxSx0D/TD9GFnOaVBmA
         ShP2smDl4tGJEdQuxvh2VZUlwMGJqbj2X/fcHkC/Q5FNCuoWUbtR1OUwcL3a9lQWcs1y
         XikWnw4n/K10MXPxXAth974mYtm+Gt5HIWBdSK/KU6FtOdbcqTAYyeDev7WKJgHXT1ai
         5j3r7Z0ZwIRcMEwEIYlKe+iba8Syw0/6AfzmUIYNRdqRTVIueV92uLAEKBt5h86suN0L
         AOpg==
X-Gm-Message-State: APjAAAWx5jck3cOz8I/3DmHS/yFGtjJhtwZdicX02THMzOJkNClqV+DZ
	dY6Khb+nnJrSn8WPpTL5F4wCsGad
X-Google-Smtp-Source: APXvYqwhG6VHzfES0jWWi8+IF7AlBXj5dQ588Do/GJ4ibhrfMcKk9x05R7KxkIdGCGEbm/v8yQ3G6g==
X-Received: by 2002:a17:90a:9bc5:: with SMTP id b5mr10473944pjw.109.1564858110427;
        Sat, 03 Aug 2019 11:48:30 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 23/34] target/arm: Update arm_mmu_idx for VHE
Date: Sat,  3 Aug 2019 11:47:49 -0700
Message-Id: <20190803184800.8221-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: EMssbsbdsPb2

Return the indexes for the EL2&0 regime when the appropriate bits
are set within HCR_EL2.  This happens for initial generation in
arm_mmu_idx, and reconstruction in core_to_arm_mmu_idx.

In order to make this reliable, we also need a bit in TBFLAGS.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v5: Consistently check E2H & TGE & ELUsingAArch32(EL2).
---
 target/arm/cpu.h    |  2 ++
 target/arm/helper.c | 51 ++++++++++++++++++++++++++++++++-------------
 2 files changed, 39 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b5300f9014..8d90a4fc4d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3153,6 +3153,8 @@ FIELD(TBFLAG_ANY, PSTATE_SS, 26, 1)
 /* Target EL if we take a floating-point-disabled exception */
 FIELD(TBFLAG_ANY, FPEXC_EL, 24, 2)
 FIELD(TBFLAG_ANY, BE_DATA, 23, 1)
+/* For A profile only, if EL2 is AA64 and HCR_EL2.<E2H,TGE> == 11 */
+FIELD(TBFLAG_ANY, E2H_TGE, 22, 1)
 
 /* Bit usage when in AArch32 state: */
 FIELD(TBFLAG_A32, THUMB, 0, 1)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5472424179..a570d43232 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11257,21 +11257,31 @@ int fp_exception_el(CPUARMState *env, int cur_el)
 
 ARMMMUIdx core_to_arm_mmu_idx(CPUARMState *env, int mmu_idx)
 {
+    bool e2h;
+
     if (arm_feature(env, ARM_FEATURE_M)) {
         return mmu_idx | ARM_MMU_IDX_M;
     }
 
     mmu_idx |= ARM_MMU_IDX_A;
+    if (mmu_idx & ARM_MMU_IDX_S) {
+        return mmu_idx;
+    }
+
+    /*
+     * All remaining states are non-secure, so we can directly
+     * access hcr_el2 for these two bits.
+     */
+    e2h = (env->cp15.hcr_el2 & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)
+          && arm_el_is_aa64(env, 2);
+
     switch (mmu_idx) {
     case 0 | ARM_MMU_IDX_A:
-        return ARMMMUIdx_EL10_0;
+        return e2h ? ARMMMUIdx_EL20_0 : ARMMMUIdx_EL10_0;
     case 1 | ARM_MMU_IDX_A:
         return ARMMMUIdx_EL10_1;
     case ARMMMUIdx_E2:
-    case ARMMMUIdx_SE0:
-    case ARMMMUIdx_SE1:
-    case ARMMMUIdx_SE3:
-        return mmu_idx;
+        return e2h ? ARMMMUIdx_EL20_2 : ARMMMUIdx_E2;
     default:
         g_assert_not_reached();
     }
@@ -11300,25 +11310,27 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
 ARMMMUIdx arm_mmu_idx(CPUARMState *env)
 {
     int el;
+    bool e2h;
 
     if (arm_feature(env, ARM_FEATURE_M)) {
         return arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
     }
 
     el = arm_current_el(env);
+    if (el == 3 || arm_is_secure_below_el3(env)) {
+        return ARMMMUIdx_SE0 + el;
+    }
+
+    e2h = (env->cp15.hcr_el2 & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)
+          && arm_el_is_aa64(env, 2);
+
     switch (el) {
     case 0:
-        /* TODO: ARMv8.1-VHE */
+        return e2h ? ARMMMUIdx_EL20_0 : ARMMMUIdx_EL10_0;
     case 1:
-        return (arm_is_secure_below_el3(env)
-                ? ARMMMUIdx_SE0 + el
-                : ARMMMUIdx_EL10_0 + el);
+        return ARMMMUIdx_EL10_1;
     case 2:
-        /* TODO: ARMv8.1-VHE */
-        /* TODO: ARMv8.4-SecEL2 */
-        return ARMMMUIdx_E2;
-    case 3:
-        return ARMMMUIdx_SE3;
+        return e2h ? ARMMMUIdx_EL20_2 : ARMMMUIdx_E2;
     default:
         g_assert_not_reached();
     }
@@ -11428,6 +11440,17 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
 
     flags = FIELD_DP32(flags, TBFLAG_ANY, MMUIDX, arm_to_core_mmu_idx(mmu_idx));
 
+    /*
+     * Include E2H in TBFLAGS so that core_to_arm_mmu_idx can
+     * reliably determine EL1&0 vs EL2&0 regimes.
+     */
+    if (arm_el_is_aa64(env, 2)) {
+        uint64_t hcr = arm_hcr_el2_eff(env);
+        if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
+            flags = FIELD_DP32(flags, TBFLAG_ANY, E2H_TGE, 1);
+        }
+    }
+
     /* The SS_ACTIVE and PSTATE_SS bits correspond to the state machine
      * states defined in the ARM ARM for software singlestep:
      *  SS_ACTIVE   PSTATE.SS   State
-- 
2.17.1
