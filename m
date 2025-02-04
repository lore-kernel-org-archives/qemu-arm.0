Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp183720njb;
        Tue, 4 Feb 2025 04:50:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVStZoc3FOaQHc7ui74Aj4x2KSc2twUAFijXUpR4/RPSsPu9Jq62OYZUlAgtV+HaDBfJ01g9yYo+0oKyg==@linaro.org
X-Received: by 2002:a5d:6d0c:0:b0:38a:88b8:97a9 with SMTP id ffacd0b85a97d-38c51949b38mr19155083f8f.2.1738673418166;
        Tue, 04 Feb 2025 04:50:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738673418; cv=none;
        d=google.com; s=arc-20240605;
        b=IdtRpan0t9jMF9kFIDqqqhi25206Ed3pu91DAf5XLK6xaB8/Wj6Jozb4WftzFR4HjH
         ZzPENQ8Og0PJF/AmdsWIIF7edQkvzswt3lXir4BG9lns6PvgDBHjDJVihGtqEeXJs499
         Jt4mkdb3Tx2BSt8l0aq3JWqZzFmKcD7/GIxpgufmPQYn7Fc23nGaX3JU1MCblZyFlJa6
         8yxeTi/B5D93v5LGy/kuWO4TuvRFXw7hP0IuITds1eenpJ9aHDYiUq3tK1tNmqdFG/67
         QBJJiK6frZcrrRlWNhEOUhFlKmWIwIoo2Ghd/lUGljz9z3CYDxOONlP+s9A9TuyyB5wX
         mUAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5C04XmL9mrmAcsBNUPKjSrw0Pg8WQ3LqYabnkNL2Gl8=;
        fh=r91pmosu59rOkXi3rxEp5FSy6JV13xqxChl7+s5bIz0=;
        b=KL18auchSuFj5IFl3s4nO1kZquy3aJhqvlLJSWI1R2cQNkAA2pvqJBVriWedcRtXoB
         1rioVUix/bv2naSa/m9dWUxs7NVrQ3mwOwlEN9bfVTob3XzdbiYjZ2TPwGDR74lcWQJA
         9h8fh/XrZm668YhiSX2ZQQ9hI56Z8OtiDHzw8BX2hUNamaCOaYx/K1Ng4s/SFI8vQQSp
         JhtBpfhBsLPzICE1dFAz5efjTrjfXDq2xDUPl/M6B2lrNDIRI4HWq6rd9VcOM63uzNYN
         t9FdTgwBD+Effw+xi+Yl6CtCVkRwPbAHUX2HX+uTTVVb9IBg9WGL/Dq//qy8WWxie9NU
         jngg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U7N1H+8p;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438e2451e35sor41744335e9.7.2025.02.04.04.50.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Feb 2025 04:50:18 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U7N1H+8p;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738673417; x=1739278217; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5C04XmL9mrmAcsBNUPKjSrw0Pg8WQ3LqYabnkNL2Gl8=;
        b=U7N1H+8pqqJTvODz5aMK0+Tyi6C2dmm6cOO8a3HO8Dd+Ut9qDbvV4VCmiO54Waa13z
         j+DDOdlUqFy0ZRf0fbcPkwTISwBZo7HJsuYH8vMxFTztSf5kkQJgSG+btZshigGtK1Yi
         8C2kVAp8Cd54Qo0zmVIkvXFFNAJALtPF3yBrAJ4bBJ5dUJ4YOuY++xTuT4iUbb7PhmJB
         ACMSLm7We1DIq0wJ9v6MPvzgj7MUDLAsmHe8LlChsvG1hdszWIOKjGY7kIku3eEgVGZn
         HIXcFv5c5Bh0wFX0cCjHl4ac//b853gf66q/B7eyrDaFbxBIKJEGRlFwsg11NCG+jlmf
         FbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673417; x=1739278217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5C04XmL9mrmAcsBNUPKjSrw0Pg8WQ3LqYabnkNL2Gl8=;
        b=h21dbOuRL71kX7n8TiGAV6h8PhMK7/i2Z4F3yvfq+xpjXlucrIlg8BSxhKEbaHo1ZS
         FOW7EyIMc45nO+MUdJyKXGBYthVGkS15QAuUWx+s0eHqyQIh41ldqUp7q3OOCH48Cgw/
         lwbjXTQJRoFdDLaKR5qITBb3Y09hJ3pTknUeE6upCmavtLfUz70nTbUDPkAGOnZPlgAe
         pJzt7uLHvxaT2A28W2T1zyHXUT1JnGwOcsPYNQQkNHDTLRiv8GCn6bY8sPkRKCNKS6VV
         Dee0h7bCtYO0W+Kn3BqjXP9LGgVPgwtOTgxYY7cRRC77w6UULrn4NT1SQxzfNe8sYjcb
         TNew==
X-Forwarded-Encrypted: i=1; AJvYcCX3tiOZMoq/3wVlZ8CC5/gR8h5cJDUzj27RAUN0wwr51VOegtszj03dkadtI+EI6a0Jg3jlf1bgLUILRA==@linaro.org
X-Gm-Message-State: AOJu0YwNOUxsPkFNLJm91ofD41gYOO63Mu9+Qdyz0haX3teDcbCztFlJ
	KHsgbsPVE10PjxzI64YiJNmDjyHEMo0xMnjLUYz9NveuLWKm2tPDr98R8hEOPS+NTA==
X-Gm-Gg: ASbGnctekuLesVp0p2Ykp9Bjq7ZKgc6Q2EvB81ovwYlmLD6Ywh1JQcyfqdWICboh/Ce
	vCfr7jrU/D4xuRIm7bKLfADVk3nEJB0QQNPnQ9/a+GPrS3tMsYrCgLjreC1BBdh9roy3sO0uOmK
	v+O88QlKmR4qwD+YRFEp7AtRmRMB/YE7vhTywafYQ0VZ0yHceoDBBkj6NBFH5/fWnob21ww4IEB
	Vq2g3N1gHQMnMGLKUwuppcft/3rg4DVwcZ0JPlpoz3Jchvw2ZpLiurHrH0QVCBRCihlYTZk/y9M
	nAxud36F2tImGKftglm5vg==
X-Google-Smtp-Source: AGHT+IFTiu0seO05C8kwhRsYHHQD9uUyjtaNp+TDBCnSSssLSG+GsXUf1yfFb2Zw0XJaLudjMtU2nw==
X-Received: by 2002:a5d:5f44:0:b0:385:e411:c894 with SMTP id ffacd0b85a97d-38c520938eemr24335837f8f.43.1738673416878;
        Tue, 04 Feb 2025 04:50:16 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c122465sm15757919f8f.47.2025.02.04.04.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 04:50:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 5/9] target/arm: Refactor handling of timer offset for direct register accesses
Date: Tue,  4 Feb 2025 12:50:05 +0000
Message-Id: <20250204125009.2281315-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204125009.2281315-1-peter.maydell@linaro.org>
References: <20250204125009.2281315-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: wkkKbzGLNx5d

When reading or writing the timer registers, sometimes we need to
apply one of the timer offsets.  Specifically, this happens for
direct reads of the counter registers CNTPCT_EL0 and CNTVCT_EL0 (and
their self-synchronized variants CNTVCTSS_EL0 and CNTPCTSS_EL0).  It
also applies for direct reads and writes of the CNT*_TVAL_EL*
registers that provide the 32-bit downcounting view of each timer.

We currently do this with duplicated code in gt_tval_read() and
gt_tval_write() and a special-case in gt_virt_cnt_read() and
gt_cnt_read().  Refactor this so that we handle it all in a single
function gt_direct_access_timer_offset(), to parallel how we handle
the offset for indirect accesses.

The call in the WFIT helper previously to gt_virt_cnt_offset() is
now to gt_direct_access_timer_offset(); this is the correct
behaviour, but it's not immediately obvious that it shouldn't be
considered an indirect access, so we add an explanatory comment.

This commit should make no behavioural changes.

(Cc to stable because the following bugfix commit will
depend on this one.)

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h     |   5 +-
 target/arm/helper.c        | 103 +++++++++++++++++++------------------
 target/arm/tcg/op_helper.c |   8 ++-
 3 files changed, 62 insertions(+), 54 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 863a84edf81..b4b3d196191 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1819,9 +1819,10 @@ int delete_hw_watchpoint(target_ulong addr, target_ulong len, int type);
 uint64_t gt_get_countervalue(CPUARMState *env);
 /*
  * Return the currently applicable offset between the system counter
- * and CNTVCT_EL0 (this will be either 0 or the value of CNTVOFF_EL2).
+ * and the counter for the specified timer, as used for direct register
+ * accesses.
  */
-uint64_t gt_virt_cnt_offset(CPUARMState *env);
+uint64_t gt_direct_access_timer_offset(CPUARMState *env, int timeridx);
 
 /*
  * Return mask of ARMMMUIdxBit values corresponding to an "invalidate
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 01ca222903d..c021c237b9b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2455,14 +2455,6 @@ static uint64_t gt_phys_raw_cnt_offset(CPUARMState *env)
     return 0;
 }
 
-static uint64_t gt_phys_cnt_offset(CPUARMState *env)
-{
-    if (arm_current_el(env) >= 2) {
-        return 0;
-    }
-    return gt_phys_raw_cnt_offset(env);
-}
-
 static uint64_t gt_indirect_access_timer_offset(CPUARMState *env, int timeridx)
 {
     /*
@@ -2489,6 +2481,52 @@ static uint64_t gt_indirect_access_timer_offset(CPUARMState *env, int timeridx)
     }
 }
 
+uint64_t gt_direct_access_timer_offset(CPUARMState *env, int timeridx)
+{
+    /*
+     * Return the timer offset to use for direct accesses to the
+     * counter registers CNTPCT and CNTVCT, and for direct accesses
+     * to the CNT*_TVAL registers.
+     *
+     * This isn't exactly the same as the indirect-access offset,
+     * because here we also care about what EL the register access
+     * is being made from.
+     *
+     * This corresponds to the access pseudocode for the registers.
+     */
+    uint64_t hcr;
+
+    switch (timeridx) {
+    case GTIMER_PHYS:
+        if (arm_current_el(env) >= 2) {
+            return 0;
+        }
+        return gt_phys_raw_cnt_offset(env);
+    case GTIMER_VIRT:
+        switch (arm_current_el(env)) {
+        case 2:
+            hcr = arm_hcr_el2_eff(env);
+            if (hcr & HCR_E2H) {
+                return 0;
+            }
+            break;
+        case 0:
+            hcr = arm_hcr_el2_eff(env);
+            if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
+                return 0;
+            }
+            break;
+        }
+        return env->cp15.cntvoff_el2;
+    case GTIMER_HYP:
+    case GTIMER_SEC:
+    case GTIMER_HYPVIRT:
+        return 0;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
 {
     ARMGenericTimer *gt = &cpu->env.cp15.c14_timer[timeridx];
@@ -2561,34 +2599,14 @@ static void gt_timer_reset(CPUARMState *env, const ARMCPRegInfo *ri,
 
 static uint64_t gt_cnt_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-    return gt_get_countervalue(env) - gt_phys_cnt_offset(env);
-}
-
-uint64_t gt_virt_cnt_offset(CPUARMState *env)
-{
-    uint64_t hcr;
-
-    switch (arm_current_el(env)) {
-    case 2:
-        hcr = arm_hcr_el2_eff(env);
-        if (hcr & HCR_E2H) {
-            return 0;
-        }
-        break;
-    case 0:
-        hcr = arm_hcr_el2_eff(env);
-        if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
-            return 0;
-        }
-        break;
-    }
-
-    return env->cp15.cntvoff_el2;
+    uint64_t offset = gt_direct_access_timer_offset(env, GTIMER_PHYS);
+    return gt_get_countervalue(env) - offset;
 }
 
 static uint64_t gt_virt_cnt_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-    return gt_get_countervalue(env) - gt_virt_cnt_offset(env);
+    uint64_t offset = gt_direct_access_timer_offset(env, GTIMER_VIRT);
+    return gt_get_countervalue(env) - offset;
 }
 
 static void gt_cval_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -2609,16 +2627,7 @@ static uint64_t do_tval_read(CPUARMState *env, int timeridx, uint64_t offset)
 static uint64_t gt_tval_read(CPUARMState *env, const ARMCPRegInfo *ri,
                              int timeridx)
 {
-    uint64_t offset = 0;
-
-    switch (timeridx) {
-    case GTIMER_VIRT:
-        offset = gt_virt_cnt_offset(env);
-        break;
-    case GTIMER_PHYS:
-        offset = gt_phys_cnt_offset(env);
-        break;
-    }
+    uint64_t offset = gt_direct_access_timer_offset(env, timeridx);
 
     return do_tval_read(env, timeridx, offset);
 }
@@ -2636,16 +2645,8 @@ static void gt_tval_write(CPUARMState *env, const ARMCPRegInfo *ri,
                           int timeridx,
                           uint64_t value)
 {
-    uint64_t offset = 0;
+    uint64_t offset = gt_direct_access_timer_offset(env, timeridx);
 
-    switch (timeridx) {
-    case GTIMER_VIRT:
-        offset = gt_virt_cnt_offset(env);
-        break;
-    case GTIMER_PHYS:
-        offset = gt_phys_cnt_offset(env);
-        break;
-    }
     do_tval_write(env, timeridx, value, offset);
 }
 
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 02c375d196d..30786fd1ff4 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -427,7 +427,13 @@ void HELPER(wfit)(CPUARMState *env, uint64_t timeout)
     int target_el = check_wfx_trap(env, false, &excp);
     /* The WFIT should time out when CNTVCT_EL0 >= the specified value. */
     uint64_t cntval = gt_get_countervalue(env);
-    uint64_t offset = gt_virt_cnt_offset(env);
+    /*
+     * We want the value that we would get if we read CNTVCT_EL0 from
+     * the current exception level, so the direct_access offset, not
+     * the indirect_access one. Compare the pseudocode LocalTimeoutEvent(),
+     * which calls VirtualCounterTimer().
+     */
+    uint64_t offset = gt_direct_access_timer_offset(env, GTIMER_VIRT);
     uint64_t cntvct = cntval - offset;
     uint64_t nexttick;
 
-- 
2.34.1
