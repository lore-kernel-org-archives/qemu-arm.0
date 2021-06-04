Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a12sm5974399wmj.36.2021.06.04.09.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:12:52 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D4AA71FFF6;
	Fri,  4 Jun 2021 16:53:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 82/99] target/arm: move sve_zcr_len_for_el to TARGET_AARCH64-only cpu-sve
Date: Fri,  4 Jun 2021 16:52:55 +0100
Message-Id: <20210604155312.15902-83-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: S+o3I/eMrY7H

From: Claudio Fontana <cfontana@suse.de>

now that we handled the dependency between HELPER(), cpregs defs
and functions in tcg/,

we can make sve_zcr_len_for_el TARGET_AARCH64-only,
and move it to the cpu-sve module.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-sve.h    |  3 +++
 target/arm/cpu.h        |  4 ++--
 target/arm/arch_dump.c  |  1 +
 target/arm/cpu-common.c | 43 -----------------------------------------
 target/arm/cpu-sve.c    | 33 +++++++++++++++++++++++++++++++
 target/arm/cpu.c        |  4 ++++
 target/arm/tcg/cpregs.c |  1 +
 target/arm/tcg/helper.c |  4 ++++
 8 files changed, 48 insertions(+), 45 deletions(-)

diff --git a/target/arm/cpu-sve.h b/target/arm/cpu-sve.h
index 6ab74b1d8f..1512c56a6b 100644
--- a/target/arm/cpu-sve.h
+++ b/target/arm/cpu-sve.h
@@ -34,4 +34,7 @@ void cpu_sve_add_props(Object *obj);
 /* add the CPU SVE properties specific to the "MAX" CPU */
 void cpu_sve_add_props_max(Object *obj);
 
+/* return the vector length for EL */
+uint32_t sve_zcr_len_for_el(CPUARMState *env, int el);
+
 #endif /* CPU_SVE_H */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 3edf8bb4ec..e9bfb6f575 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -223,7 +223,8 @@ typedef struct ARMPACKey {
 } ARMPACKey;
 #else
 static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
-#endif
+
+#endif /* TARGET_AARCH64 */
 
 /* See the commentary above the TBFLAG field definitions.  */
 typedef struct CPUARMTBFlags {
@@ -1097,7 +1098,6 @@ void aarch64_sync_64_to_32(CPUARMState *env);
 
 int fp_exception_el(CPUARMState *env, int cur_el);
 int sve_exception_el(CPUARMState *env, int cur_el);
-uint32_t sve_zcr_len_for_el(CPUARMState *env, int el);
 
 /* you can call this signal handler from your SIGBUS and SIGSEGV
    signal handlers to inform the virtual CPU of exceptions. non zero
diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index 9cc75a6fda..9b2e76f5a7 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -24,6 +24,7 @@
 #include "sysemu/dump.h"
 
 #ifdef TARGET_AARCH64
+#include "cpu-sve.h"
 
 /* struct user_pt_regs from arch/arm64/include/uapi/asm/ptrace.h */
 struct aarch64_user_regs {
diff --git a/target/arm/cpu-common.c b/target/arm/cpu-common.c
index f4a3780e9e..b7a199a8d6 100644
--- a/target/arm/cpu-common.c
+++ b/target/arm/cpu-common.c
@@ -301,49 +301,6 @@ uint64_t arm_hcr_el2_eff(CPUARMState *env)
     return ret;
 }
 
-/*
- * these are AARCH64-only, but due to the chain of dependencies,
- * between HELPER prototypes, hflags, cpreg definitions and functions in
- * tcg/ etc, it becomes incredibly messy to add what should be here:
- *
- * #ifdef TARGET_AARCH64
- */
-
-static uint32_t sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
-{
-    uint32_t end_len;
-
-    end_len = start_len &= 0xf;
-    if (!test_bit(start_len, cpu->sve_vq_map)) {
-        end_len = find_last_bit(cpu->sve_vq_map, start_len);
-        assert(end_len < start_len);
-    }
-    return end_len;
-}
-
-/*
- * Given that SVE is enabled, return the vector length for EL.
- */
-uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
-{
-    ARMCPU *cpu = env_archcpu(env);
-    uint32_t zcr_len = cpu->sve_max_vq - 1;
-
-    if (el <= 1) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
-    }
-    if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[2]);
-    }
-    if (arm_feature(env, ARM_FEATURE_EL3)) {
-        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
-    }
-
-    return sve_zcr_get_valid_len(cpu, zcr_len);
-}
-
-/* #endif TARGET_AARCH64 , see matching comment above */
-
 uint64_t arm_sctlr(CPUARMState *env, int el)
 {
     /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
diff --git a/target/arm/cpu-sve.c b/target/arm/cpu-sve.c
index 24bffbba8b..e8e817e110 100644
--- a/target/arm/cpu-sve.c
+++ b/target/arm/cpu-sve.c
@@ -288,3 +288,36 @@ void cpu_sve_add_props_max(Object *obj)
 {
     object_property_add(obj, "sve-max-vq", "uint32", get_prop_max_vq, set_prop_max_vq, NULL, NULL);
 }
+
+static uint32_t sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
+{
+    uint32_t end_len;
+
+    end_len = start_len &= 0xf;
+    if (!test_bit(start_len, cpu->sve_vq_map)) {
+        end_len = find_last_bit(cpu->sve_vq_map, start_len);
+        assert(end_len < start_len);
+    }
+    return end_len;
+}
+
+/*
+ * Given that SVE is enabled, return the vector length for EL.
+ */
+uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    uint32_t zcr_len = cpu->sve_max_vq - 1;
+
+    if (el <= 1) {
+        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
+    }
+    if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
+        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[2]);
+    }
+    if (arm_feature(env, ARM_FEATURE_EL3)) {
+        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
+    }
+
+    return sve_zcr_get_valid_len(cpu, zcr_len);
+}
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b297d0e6aa..0e41854b92 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -23,7 +23,11 @@
 #include "target/arm/idau.h"
 #include "qapi/error.h"
 #include "cpu.h"
+
+#ifdef TARGET_AARCH64
 #include "cpu-sve.h"
+#endif /* TARGET_AARCH64 */
+
 #include "cpregs.h"
 
 #ifdef CONFIG_TCG
diff --git a/target/arm/tcg/cpregs.c b/target/arm/tcg/cpregs.c
index 9d4ac66281..c971dc6097 100644
--- a/target/arm/tcg/cpregs.c
+++ b/target/arm/tcg/cpregs.c
@@ -17,6 +17,7 @@
 #include "cpregs.h"
 
 #ifdef TARGET_AARCH64
+#include "cpu-sve.h"
 #include "tcg/tcg-sve.h"
 #endif /* TARGET_AARCH64 */
 
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index edc4b4cb4e..984dae7643 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -18,6 +18,10 @@
 #include "cpregs.h"
 #include "tcg-cpu.h"
 
+#ifdef TARGET_AARCH64
+#include "cpu-sve.h"
+#endif /* TARGET_AARCH64 */
+
 static int vfp_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
 {
     ARMCPU *cpu = env_archcpu(env);
-- 
2.20.1
