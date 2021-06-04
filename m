Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q20sm9145301wrf.45.2021.06.04.10.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 10:12:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 73FBC1FFC4;
	Fri,  4 Jun 2021 16:53:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 45/99] target/arm: move sve_exception_el out of TCG helpers
Date: Fri,  4 Jun 2021 16:52:18 +0100
Message-Id: <20210604155312.15902-46-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9q0qMfLxVI5b

From: Claudio Fontana <cfontana@suse.de>

we need this for KVM too.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-sysemu.c | 62 +++++++++++++++++++++++++++++++++++++++
 target/arm/cpu-user.c   |  5 ++++
 target/arm/tcg/helper.c | 64 -----------------------------------------
 3 files changed, 67 insertions(+), 64 deletions(-)

diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index 7a314bf805..7cc721fe68 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -348,3 +348,65 @@ void aarch64_sync_64_to_32(CPUARMState *env)
 
     env->regs[15] = env->pc;
 }
+
+/*
+ * Return the exception level to which exceptions should be taken
+ * via SVEAccessTrap.  If an exception should be routed through
+ * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
+ * take care of raising that exception.
+ * C.f. the ARM pseudocode function CheckSVEEnabled.
+ */
+int sve_exception_el(CPUARMState *env, int el)
+{
+    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
+
+    if (el <= 1 && (hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+        bool disabled = false;
+
+        /*
+         * The CPACR.ZEN controls traps to EL1:
+         * 0, 2 : trap EL0 and EL1 accesses
+         * 1    : trap only EL0 accesses
+         * 3    : trap no accesses
+         */
+        if (!extract32(env->cp15.cpacr_el1, 16, 1)) {
+            disabled = true;
+        } else if (!extract32(env->cp15.cpacr_el1, 17, 1)) {
+            disabled = el == 0;
+        }
+        if (disabled) {
+            /* route_to_el2 */
+            return hcr_el2 & HCR_TGE ? 2 : 1;
+        }
+
+        /* Check CPACR.FPEN.  */
+        if (!extract32(env->cp15.cpacr_el1, 20, 1)) {
+            disabled = true;
+        } else if (!extract32(env->cp15.cpacr_el1, 21, 1)) {
+            disabled = el == 0;
+        }
+        if (disabled) {
+            return 0;
+        }
+    }
+
+    /*
+     * CPTR_EL2.  Since TZ and TFP are positive,
+     * they will be zero when EL2 is not present.
+     */
+    if (el <= 2 && arm_is_el2_enabled(env)) {
+        if (env->cp15.cptr_el[2] & CPTR_TZ) {
+            return 2;
+        }
+        if (env->cp15.cptr_el[2] & CPTR_TFP) {
+            return 0;
+        }
+    }
+
+    /* CPTR_EL3.  Since EZ is negative we must check for EL3.  */
+    if (arm_feature(env, ARM_FEATURE_EL3)
+        && !(env->cp15.cptr_el[3] & CPTR_EZ)) {
+        return 3;
+    }
+    return 0;
+}
diff --git a/target/arm/cpu-user.c b/target/arm/cpu-user.c
index 0225089e46..39093ade76 100644
--- a/target/arm/cpu-user.c
+++ b/target/arm/cpu-user.c
@@ -33,3 +33,8 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
 {
     return 1;
 }
+
+int sve_exception_el(CPUARMState *env, int el)
+{
+    return 0;
+}
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 1c69a69d5a..8372089260 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -261,70 +261,6 @@ static int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg)
 }
 #endif /* TARGET_AARCH64 */
 
-/*
- * Return the exception level to which exceptions should be taken
- * via SVEAccessTrap.  If an exception should be routed through
- * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
- * take care of raising that exception.
- * C.f. the ARM pseudocode function CheckSVEEnabled.
- */
-int sve_exception_el(CPUARMState *env, int el)
-{
-#ifndef CONFIG_USER_ONLY
-    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
-
-    if (el <= 1 && (hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
-        bool disabled = false;
-
-        /*
-         * The CPACR.ZEN controls traps to EL1:
-         * 0, 2 : trap EL0 and EL1 accesses
-         * 1    : trap only EL0 accesses
-         * 3    : trap no accesses
-         */
-        if (!extract32(env->cp15.cpacr_el1, 16, 1)) {
-            disabled = true;
-        } else if (!extract32(env->cp15.cpacr_el1, 17, 1)) {
-            disabled = el == 0;
-        }
-        if (disabled) {
-            /* route_to_el2 */
-            return hcr_el2 & HCR_TGE ? 2 : 1;
-        }
-
-        /* Check CPACR.FPEN.  */
-        if (!extract32(env->cp15.cpacr_el1, 20, 1)) {
-            disabled = true;
-        } else if (!extract32(env->cp15.cpacr_el1, 21, 1)) {
-            disabled = el == 0;
-        }
-        if (disabled) {
-            return 0;
-        }
-    }
-
-    /*
-     * CPTR_EL2.  Since TZ and TFP are positive,
-     * they will be zero when EL2 is not present.
-     */
-    if (el <= 2 && arm_is_el2_enabled(env)) {
-        if (env->cp15.cptr_el[2] & CPTR_TZ) {
-            return 2;
-        }
-        if (env->cp15.cptr_el[2] & CPTR_TFP) {
-            return 0;
-        }
-    }
-
-    /* CPTR_EL3.  Since EZ is negative we must check for EL3.  */
-    if (arm_feature(env, ARM_FEATURE_EL3)
-        && !(env->cp15.cptr_el[3] & CPTR_EZ)) {
-        return 3;
-    }
-#endif
-    return 0;
-}
-
 void hw_watchpoint_update(ARMCPU *cpu, int n)
 {
     CPUARMState *env = &cpu->env;
-- 
2.20.1
