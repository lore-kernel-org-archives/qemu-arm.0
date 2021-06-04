Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l16sm9356859wmj.47.2021.06.04.08.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 08:53:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7295E1FFBC;
	Fri,  4 Jun 2021 16:53:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 36/99] target/arm: move arm_mmu_idx* to cpu-mmu
Date: Fri,  4 Jun 2021 16:52:09 +0100
Message-Id: <20210604155312.15902-37-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xtVtpz5D8MAE

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-mmu.c    | 95 +++++++++++++++++++++++++++++++++++++++++
 target/arm/tcg/helper.c | 95 -----------------------------------------
 2 files changed, 95 insertions(+), 95 deletions(-)

diff --git a/target/arm/cpu-mmu.c b/target/arm/cpu-mmu.c
index f463f8458e..c6ac90a61e 100644
--- a/target/arm/cpu-mmu.c
+++ b/target/arm/cpu-mmu.c
@@ -122,3 +122,98 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .using64k = using64k,
     };
 }
+
+/* Return the exception level we're running at if this is our mmu_idx */
+int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
+{
+    if (mmu_idx & ARM_MMU_IDX_M) {
+        return mmu_idx & ARM_MMU_IDX_M_PRIV;
+    }
+
+    switch (mmu_idx) {
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_SE10_0:
+    case ARMMMUIdx_SE20_0:
+        return 0;
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
+    case ARMMMUIdx_SE10_1:
+    case ARMMMUIdx_SE10_1_PAN:
+        return 1;
+    case ARMMMUIdx_E2:
+    case ARMMMUIdx_E20_2:
+    case ARMMMUIdx_E20_2_PAN:
+    case ARMMMUIdx_SE2:
+    case ARMMMUIdx_SE20_2:
+    case ARMMMUIdx_SE20_2_PAN:
+        return 2;
+    case ARMMMUIdx_SE3:
+        return 3;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+#ifndef CONFIG_TCG
+ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
+{
+    g_assert_not_reached();
+}
+#endif
+
+ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
+{
+    ARMMMUIdx idx;
+    uint64_t hcr;
+
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        return arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
+    }
+
+    /* See ARM pseudo-function ELIsInHost.  */
+    switch (el) {
+    case 0:
+        hcr = arm_hcr_el2_eff(env);
+        if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
+            idx = ARMMMUIdx_E20_0;
+        } else {
+            idx = ARMMMUIdx_E10_0;
+        }
+        break;
+    case 1:
+        if (env->pstate & PSTATE_PAN) {
+            idx = ARMMMUIdx_E10_1_PAN;
+        } else {
+            idx = ARMMMUIdx_E10_1;
+        }
+        break;
+    case 2:
+        /* Note that TGE does not apply at EL2.  */
+        if (arm_hcr_el2_eff(env) & HCR_E2H) {
+            if (env->pstate & PSTATE_PAN) {
+                idx = ARMMMUIdx_E20_2_PAN;
+            } else {
+                idx = ARMMMUIdx_E20_2;
+            }
+        } else {
+            idx = ARMMMUIdx_E2;
+        }
+        break;
+    case 3:
+        return ARMMMUIdx_SE3;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (arm_is_secure_below_el3(env)) {
+        idx &= ~ARM_MMU_IDX_A_NS;
+    }
+
+    return idx;
+}
+
+ARMMMUIdx arm_mmu_idx(CPUARMState *env)
+{
+    return arm_mmu_idx_el(env, arm_current_el(env));
+}
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index e85e2bfed9..a4630b4039 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -2093,101 +2093,6 @@ int fp_exception_el(CPUARMState *env, int cur_el)
     return 0;
 }
 
-/* Return the exception level we're running at if this is our mmu_idx */
-int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
-{
-    if (mmu_idx & ARM_MMU_IDX_M) {
-        return mmu_idx & ARM_MMU_IDX_M_PRIV;
-    }
-
-    switch (mmu_idx) {
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_SE10_0:
-    case ARMMMUIdx_SE20_0:
-        return 0;
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-    case ARMMMUIdx_SE10_1:
-    case ARMMMUIdx_SE10_1_PAN:
-        return 1;
-    case ARMMMUIdx_E2:
-    case ARMMMUIdx_E20_2:
-    case ARMMMUIdx_E20_2_PAN:
-    case ARMMMUIdx_SE2:
-    case ARMMMUIdx_SE20_2:
-    case ARMMMUIdx_SE20_2_PAN:
-        return 2;
-    case ARMMMUIdx_SE3:
-        return 3;
-    default:
-        g_assert_not_reached();
-    }
-}
-
-#ifndef CONFIG_TCG
-ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
-{
-    g_assert_not_reached();
-}
-#endif
-
-ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
-{
-    ARMMMUIdx idx;
-    uint64_t hcr;
-
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        return arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
-    }
-
-    /* See ARM pseudo-function ELIsInHost.  */
-    switch (el) {
-    case 0:
-        hcr = arm_hcr_el2_eff(env);
-        if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
-            idx = ARMMMUIdx_E20_0;
-        } else {
-            idx = ARMMMUIdx_E10_0;
-        }
-        break;
-    case 1:
-        if (env->pstate & PSTATE_PAN) {
-            idx = ARMMMUIdx_E10_1_PAN;
-        } else {
-            idx = ARMMMUIdx_E10_1;
-        }
-        break;
-    case 2:
-        /* Note that TGE does not apply at EL2.  */
-        if (arm_hcr_el2_eff(env) & HCR_E2H) {
-            if (env->pstate & PSTATE_PAN) {
-                idx = ARMMMUIdx_E20_2_PAN;
-            } else {
-                idx = ARMMMUIdx_E20_2;
-            }
-        } else {
-            idx = ARMMMUIdx_E2;
-        }
-        break;
-    case 3:
-        return ARMMMUIdx_SE3;
-    default:
-        g_assert_not_reached();
-    }
-
-    if (arm_is_secure_below_el3(env)) {
-        idx &= ~ARM_MMU_IDX_A_NS;
-    }
-
-    return idx;
-}
-
-ARMMMUIdx arm_mmu_idx(CPUARMState *env)
-{
-    return arm_mmu_idx_el(env, arm_current_el(env));
-}
-
 #ifndef CONFIG_USER_ONLY
 ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
 {
-- 
2.20.1
