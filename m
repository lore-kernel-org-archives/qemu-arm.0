Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id x7sm8156479wre.8.2021.06.04.11.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 11:22:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2F1161FF7E;
	Fri,  4 Jun 2021 16:53:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 34/99] target/arm: move arm_hcr_el2_eff from tcg/ to common_cpu
Date: Fri,  4 Jun 2021 16:52:07 +0100
Message-Id: <20210604155312.15902-35-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: I9iTUZIW+7Yn

From: Claudio Fontana <cfontana@suse.de>

we will need this for KVM too, especially for Nested support.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-common.c | 68 +++++++++++++++++++++++++++++++++++++++++
 target/arm/tcg/helper.c | 68 -----------------------------------------
 2 files changed, 68 insertions(+), 68 deletions(-)

diff --git a/target/arm/cpu-common.c b/target/arm/cpu-common.c
index 694e5d73f3..040e06392a 100644
--- a/target/arm/cpu-common.c
+++ b/target/arm/cpu-common.c
@@ -231,3 +231,71 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
     mask &= ~CACHED_CPSR_BITS;
     env->uncached_cpsr = (env->uncached_cpsr & ~mask) | (val & mask);
 }
+
+/*
+ * Return the effective value of HCR_EL2.
+ * Bits that are not included here:
+ * RW       (read from SCR_EL3.RW as needed)
+ */
+uint64_t arm_hcr_el2_eff(CPUARMState *env)
+{
+    uint64_t ret = env->cp15.hcr_el2;
+
+    if (!arm_is_el2_enabled(env)) {
+        /*
+         * "This register has no effect if EL2 is not enabled in the
+         * current Security state".  This is ARMv8.4-SecEL2 speak for
+         * !(SCR_EL3.NS==1 || SCR_EL3.EEL2==1).
+         *
+         * Prior to that, the language was "In an implementation that
+         * includes EL3, when the value of SCR_EL3.NS is 0 the PE behaves
+         * as if this field is 0 for all purposes other than a direct
+         * read or write access of HCR_EL2".  With lots of enumeration
+         * on a per-field basis.  In current QEMU, this is condition
+         * is arm_is_secure_below_el3.
+         *
+         * Since the v8.4 language applies to the entire register, and
+         * appears to be backward compatible, use that.
+         */
+        return 0;
+    }
+
+    /*
+     * For a cpu that supports both aarch64 and aarch32, we can set bits
+     * in HCR_EL2 (e.g. via EL3) that are RES0 when we enter EL2 as aa32.
+     * Ignore all of the bits in HCR+HCR2 that are not valid for aarch32.
+     */
+    if (!arm_el_is_aa64(env, 2)) {
+        uint64_t aa32_valid;
+
+        /*
+         * These bits are up-to-date as of ARMv8.6.
+         * For HCR, it's easiest to list just the 2 bits that are invalid.
+         * For HCR2, list those that are valid.
+         */
+        aa32_valid = MAKE_64BIT_MASK(0, 32) & ~(HCR_RW | HCR_TDZ);
+        aa32_valid |= (HCR_CD | HCR_ID | HCR_TERR | HCR_TEA | HCR_MIOCNCE |
+                       HCR_TID4 | HCR_TICAB | HCR_TOCU | HCR_TTLBIS);
+        ret &= aa32_valid;
+    }
+
+    if (ret & HCR_TGE) {
+        /* These bits are up-to-date as of ARMv8.6.  */
+        if (ret & HCR_E2H) {
+            ret &= ~(HCR_VM | HCR_FMO | HCR_IMO | HCR_AMO |
+                     HCR_BSU_MASK | HCR_DC | HCR_TWI | HCR_TWE |
+                     HCR_TID0 | HCR_TID2 | HCR_TPCP | HCR_TPU |
+                     HCR_TDZ | HCR_CD | HCR_ID | HCR_MIOCNCE |
+                     HCR_TID4 | HCR_TICAB | HCR_TOCU | HCR_ENSCXT |
+                     HCR_TTLBIS | HCR_TTLBOS | HCR_TID5);
+        } else {
+            ret |= HCR_FMO | HCR_IMO | HCR_AMO;
+        }
+        ret &= ~(HCR_SWIO | HCR_PTW | HCR_VF | HCR_VI | HCR_VSE |
+                 HCR_FB | HCR_TID1 | HCR_TID3 | HCR_TSC | HCR_TACR |
+                 HCR_TSW | HCR_TTLB | HCR_TVM | HCR_HCD | HCR_TRVM |
+                 HCR_TLOR);
+    }
+
+    return ret;
+}
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index d32f9659bc..e85e2bfed9 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -261,74 +261,6 @@ static int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg)
 }
 #endif /* TARGET_AARCH64 */
 
-/*
- * Return the effective value of HCR_EL2.
- * Bits that are not included here:
- * RW       (read from SCR_EL3.RW as needed)
- */
-uint64_t arm_hcr_el2_eff(CPUARMState *env)
-{
-    uint64_t ret = env->cp15.hcr_el2;
-
-    if (!arm_is_el2_enabled(env)) {
-        /*
-         * "This register has no effect if EL2 is not enabled in the
-         * current Security state".  This is ARMv8.4-SecEL2 speak for
-         * !(SCR_EL3.NS==1 || SCR_EL3.EEL2==1).
-         *
-         * Prior to that, the language was "In an implementation that
-         * includes EL3, when the value of SCR_EL3.NS is 0 the PE behaves
-         * as if this field is 0 for all purposes other than a direct
-         * read or write access of HCR_EL2".  With lots of enumeration
-         * on a per-field basis.  In current QEMU, this is condition
-         * is arm_is_secure_below_el3.
-         *
-         * Since the v8.4 language applies to the entire register, and
-         * appears to be backward compatible, use that.
-         */
-        return 0;
-    }
-
-    /*
-     * For a cpu that supports both aarch64 and aarch32, we can set bits
-     * in HCR_EL2 (e.g. via EL3) that are RES0 when we enter EL2 as aa32.
-     * Ignore all of the bits in HCR+HCR2 that are not valid for aarch32.
-     */
-    if (!arm_el_is_aa64(env, 2)) {
-        uint64_t aa32_valid;
-
-        /*
-         * These bits are up-to-date as of ARMv8.6.
-         * For HCR, it's easiest to list just the 2 bits that are invalid.
-         * For HCR2, list those that are valid.
-         */
-        aa32_valid = MAKE_64BIT_MASK(0, 32) & ~(HCR_RW | HCR_TDZ);
-        aa32_valid |= (HCR_CD | HCR_ID | HCR_TERR | HCR_TEA | HCR_MIOCNCE |
-                       HCR_TID4 | HCR_TICAB | HCR_TOCU | HCR_TTLBIS);
-        ret &= aa32_valid;
-    }
-
-    if (ret & HCR_TGE) {
-        /* These bits are up-to-date as of ARMv8.6.  */
-        if (ret & HCR_E2H) {
-            ret &= ~(HCR_VM | HCR_FMO | HCR_IMO | HCR_AMO |
-                     HCR_BSU_MASK | HCR_DC | HCR_TWI | HCR_TWE |
-                     HCR_TID0 | HCR_TID2 | HCR_TPCP | HCR_TPU |
-                     HCR_TDZ | HCR_CD | HCR_ID | HCR_MIOCNCE |
-                     HCR_TID4 | HCR_TICAB | HCR_TOCU | HCR_ENSCXT |
-                     HCR_TTLBIS | HCR_TTLBOS | HCR_TID5);
-        } else {
-            ret |= HCR_FMO | HCR_IMO | HCR_AMO;
-        }
-        ret &= ~(HCR_SWIO | HCR_PTW | HCR_VF | HCR_VI | HCR_VSE |
-                 HCR_FB | HCR_TID1 | HCR_TID3 | HCR_TSC | HCR_TACR |
-                 HCR_TSW | HCR_TTLB | HCR_TVM | HCR_HCD | HCR_TRVM |
-                 HCR_TLOR);
-    }
-
-    return ret;
-}
-
 /* Return the exception level to which exceptions should be taken
  * via SVEAccessTrap.  If an exception should be routed through
  * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
-- 
2.20.1
