Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 89sm7541924wrq.14.2021.06.04.08.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 08:53:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 912CF1FF93;
	Fri,  4 Jun 2021 16:53:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 80/99] target/arm: tcg-sve: import narrow_vq and change_el functions
Date: Fri,  4 Jun 2021 16:52:53 +0100
Message-Id: <20210604155312.15902-81-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: chnyRJeQ40wz

From: Claudio Fontana <cfontana@suse.de>

aarch64_sve_narrow_vq and aarch64_sve_change_el are SVE-related
functions only used for TCG, so we can put them in the
tcg-sve.c module.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.h                 |  7 ---
 target/arm/tcg/tcg-sve.h         |  5 ++
 linux-user/syscall.c             |  4 ++
 target/arm/cpu-exceptions-aa64.c |  1 +
 target/arm/tcg/cpregs.c          |  4 ++
 target/arm/tcg/helper-a64.c      |  1 +
 target/arm/tcg/helper.c          | 87 --------------------------------
 target/arm/tcg/tcg-sve.c         | 86 +++++++++++++++++++++++++++++++
 8 files changed, 101 insertions(+), 94 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8614948543..3edf8bb4ec 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1056,9 +1056,6 @@ int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
 #ifdef TARGET_AARCH64
 int aarch64_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
-void aarch64_sve_change_el(CPUARMState *env, int old_el,
-                           int new_el, bool el0_a64);
 
 static inline bool is_a64(CPUARMState *env)
 {
@@ -1090,10 +1087,6 @@ static inline uint64_t *sve_bswap64(uint64_t *dst, uint64_t *src, int nr)
 }
 
 #else
-static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
-static inline void aarch64_sve_change_el(CPUARMState *env, int o,
-                                         int n, bool a)
-{ }
 
 #define is_a64(env) ((void)env, false)
 
diff --git a/target/arm/tcg/tcg-sve.h b/target/arm/tcg/tcg-sve.h
index 4bed809b9a..5855bb4289 100644
--- a/target/arm/tcg/tcg-sve.h
+++ b/target/arm/tcg/tcg-sve.h
@@ -21,4 +21,9 @@ uint32_t tcg_sve_disable_lens(unsigned long *sve_vq_map,
 bool tcg_sve_validate_lens(unsigned long *sve_vq_map, uint32_t max_vq,
                            Error **errp);
 
+void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
+
+void aarch64_sve_change_el(CPUARMState *env, int old_el,
+                           int new_el, bool el0_a64);
+
 #endif /* TCG_SVE_H */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index c9f812091c..db4b7b1e46 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -134,6 +134,10 @@
 #include "fd-trans.h"
 #include "tcg/tcg.h"
 
+#ifdef TARGET_AARCH64
+#include "tcg/tcg-sve.h"
+#endif /* TARGET_AARCH64 */
+
 #ifndef CLONE_IO
 #define CLONE_IO                0x80000000      /* Clone io context */
 #endif
diff --git a/target/arm/cpu-exceptions-aa64.c b/target/arm/cpu-exceptions-aa64.c
index 7daaba0426..adaf3bab17 100644
--- a/target/arm/cpu-exceptions-aa64.c
+++ b/target/arm/cpu-exceptions-aa64.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "cpu.h"
+#include "tcg/tcg-sve.h"
 #include "internals.h"
 #include "sysemu/tcg.h"
 
diff --git a/target/arm/tcg/cpregs.c b/target/arm/tcg/cpregs.c
index 56d56f7f81..9d3c9ae841 100644
--- a/target/arm/tcg/cpregs.c
+++ b/target/arm/tcg/cpregs.c
@@ -16,6 +16,10 @@
 #include "cpu-mmu.h"
 #include "cpregs.h"
 
+#ifdef TARGET_AARCH64
+#include "tcg/tcg-sve.h"
+#endif /* TARGET_AARCH64 */
+
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 #define PMCR_NUM_COUNTERS 4 /* QEMU IMPDEF choice */
 
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 9cc3b066e2..f261f13b2c 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "cpu.h"
+#include "tcg/tcg-sve.h"
 #include "exec/gdbstub.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 7136c82795..edc4b4cb4e 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -1294,90 +1294,3 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     *pflags = flags.flags;
     *cs_base = flags.flags2;
 }
-
-#ifdef TARGET_AARCH64
-/*
- * The manual says that when SVE is enabled and VQ is widened the
- * implementation is allowed to zero the previously inaccessible
- * portion of the registers.  The corollary to that is that when
- * SVE is enabled and VQ is narrowed we are also allowed to zero
- * the now inaccessible portion of the registers.
- *
- * The intent of this is that no predicate bit beyond VQ is ever set.
- * Which means that some operations on predicate registers themselves
- * may operate on full uint64_t or even unrolled across the maximum
- * uint64_t[4].  Performing 4 bits of host arithmetic unconditionally
- * may well be cheaper than conditionals to restrict the operation
- * to the relevant portion of a uint16_t[16].
- */
-void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq)
-{
-    int i, j;
-    uint64_t pmask;
-
-    assert(vq >= 1 && vq <= ARM_MAX_VQ);
-    assert(vq <= env_archcpu(env)->sve_max_vq);
-
-    /* Zap the high bits of the zregs.  */
-    for (i = 0; i < 32; i++) {
-        memset(&env->vfp.zregs[i].d[2 * vq], 0, 16 * (ARM_MAX_VQ - vq));
-    }
-
-    /* Zap the high bits of the pregs and ffr.  */
-    pmask = 0;
-    if (vq & 3) {
-        pmask = ~(-1ULL << (16 * (vq & 3)));
-    }
-    for (j = vq / 4; j < ARM_MAX_VQ / 4; j++) {
-        for (i = 0; i < 17; ++i) {
-            env->vfp.pregs[i].p[j] &= pmask;
-        }
-        pmask = 0;
-    }
-}
-
-/*
- * Notice a change in SVE vector size when changing EL.
- */
-void aarch64_sve_change_el(CPUARMState *env, int old_el,
-                           int new_el, bool el0_a64)
-{
-    ARMCPU *cpu = env_archcpu(env);
-    int old_len, new_len;
-    bool old_a64, new_a64;
-
-    /* Nothing to do if no SVE.  */
-    if (!cpu_isar_feature(aa64_sve, cpu)) {
-        return;
-    }
-
-    /* Nothing to do if FP is disabled in either EL.  */
-    if (fp_exception_el(env, old_el) || fp_exception_el(env, new_el)) {
-        return;
-    }
-
-    /*
-     * DDI0584A.d sec 3.2: "If SVE instructions are disabled or trapped
-     * at ELx, or not available because the EL is in AArch32 state, then
-     * for all purposes other than a direct read, the ZCR_ELx.LEN field
-     * has an effective value of 0".
-     *
-     * Consider EL2 (aa64, vq=4) -> EL0 (aa32) -> EL1 (aa64, vq=0).
-     * If we ignore aa32 state, we would fail to see the vq4->vq0 transition
-     * from EL2->EL1.  Thus we go ahead and narrow when entering aa32 so that
-     * we already have the correct register contents when encountering the
-     * vq0->vq0 transition between EL0->EL1.
-     */
-    old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
-    old_len = (old_a64 && !sve_exception_el(env, old_el)
-               ? sve_zcr_len_for_el(env, old_el) : 0);
-    new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
-    new_len = (new_a64 && !sve_exception_el(env, new_el)
-               ? sve_zcr_len_for_el(env, new_el) : 0);
-
-    /* When changing vector length, clear inaccessible state.  */
-    if (new_len < old_len) {
-        aarch64_sve_narrow_vq(env, new_len + 1);
-    }
-}
-#endif
diff --git a/target/arm/tcg/tcg-sve.c b/target/arm/tcg/tcg-sve.c
index 99cfde1f41..908d2c2f2c 100644
--- a/target/arm/tcg/tcg-sve.c
+++ b/target/arm/tcg/tcg-sve.c
@@ -24,6 +24,7 @@
 #include "sysemu/tcg.h"
 #include "cpu-sve.h"
 #include "tcg-sve.h"
+#include "cpu-exceptions-aa64.h"
 
 void tcg_sve_enable_lens(unsigned long *sve_vq_map,
                          unsigned long *sve_vq_init, uint32_t max_vq)
@@ -79,3 +80,88 @@ bool tcg_sve_validate_lens(unsigned long *sve_vq_map, uint32_t max_vq,
     }
     return true;
 }
+
+/*
+ * The manual says that when SVE is enabled and VQ is widened the
+ * implementation is allowed to zero the previously inaccessible
+ * portion of the registers.  The corollary to that is that when
+ * SVE is enabled and VQ is narrowed we are also allowed to zero
+ * the now inaccessible portion of the registers.
+ *
+ * The intent of this is that no predicate bit beyond VQ is ever set.
+ * Which means that some operations on predicate registers themselves
+ * may operate on full uint64_t or even unrolled across the maximum
+ * uint64_t[4].  Performing 4 bits of host arithmetic unconditionally
+ * may well be cheaper than conditionals to restrict the operation
+ * to the relevant portion of a uint16_t[16].
+ */
+void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq)
+{
+    int i, j;
+    uint64_t pmask;
+
+    assert(vq >= 1 && vq <= ARM_MAX_VQ);
+    assert(vq <= env_archcpu(env)->sve_max_vq);
+
+    /* Zap the high bits of the zregs.  */
+    for (i = 0; i < 32; i++) {
+        memset(&env->vfp.zregs[i].d[2 * vq], 0, 16 * (ARM_MAX_VQ - vq));
+    }
+
+    /* Zap the high bits of the pregs and ffr.  */
+    pmask = 0;
+    if (vq & 3) {
+        pmask = ~(-1ULL << (16 * (vq & 3)));
+    }
+    for (j = vq / 4; j < ARM_MAX_VQ / 4; j++) {
+        for (i = 0; i < 17; ++i) {
+            env->vfp.pregs[i].p[j] &= pmask;
+        }
+        pmask = 0;
+    }
+}
+
+/*
+ * Notice a change in SVE vector size when changing EL.
+ */
+void aarch64_sve_change_el(CPUARMState *env, int old_el,
+                           int new_el, bool el0_a64)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    int old_len, new_len;
+    bool old_a64, new_a64;
+
+    /* Nothing to do if no SVE.  */
+    if (!cpu_isar_feature(aa64_sve, cpu)) {
+        return;
+    }
+
+    /* Nothing to do if FP is disabled in either EL.  */
+    if (fp_exception_el(env, old_el) || fp_exception_el(env, new_el)) {
+        return;
+    }
+
+    /*
+     * DDI0584A.d sec 3.2: "If SVE instructions are disabled or trapped
+     * at ELx, or not available because the EL is in AArch32 state, then
+     * for all purposes other than a direct read, the ZCR_ELx.LEN field
+     * has an effective value of 0".
+     *
+     * Consider EL2 (aa64, vq=4) -> EL0 (aa32) -> EL1 (aa64, vq=0).
+     * If we ignore aa32 state, we would fail to see the vq4->vq0 transition
+     * from EL2->EL1.  Thus we go ahead and narrow when entering aa32 so that
+     * we already have the correct register contents when encountering the
+     * vq0->vq0 transition between EL0->EL1.
+     */
+    old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
+    old_len = (old_a64 && !sve_exception_el(env, old_el)
+               ? sve_zcr_len_for_el(env, old_el) : 0);
+    new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
+    new_len = (new_a64 && !sve_exception_el(env, new_el)
+               ? sve_zcr_len_for_el(env, new_el) : 0);
+
+    /* When changing vector length, clear inaccessible state.  */
+    if (new_len < old_len) {
+        aarch64_sve_narrow_vq(env, new_len + 1);
+    }
+}
-- 
2.20.1
