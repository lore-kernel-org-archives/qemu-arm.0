Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g17sm2392705wrp.61.2021.06.04.09.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:12:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 036231FFF7;
	Fri,  4 Jun 2021 16:53:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 83/99] cpu-sve: rename sve_zcr_len_for_el to cpu_sve_get_zcr_len_for_el
Date: Fri,  4 Jun 2021 16:52:56 +0100
Message-Id: <20210604155312.15902-84-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Fsu5WMGldO0n

From: Claudio Fontana <cfontana@suse.de>

use a canonical module prefix followed by the get_zcr_len_for_el()
method name. Also rename the static internal auxiliary function,
where the module prefix is not necessary.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-sve.h     | 2 +-
 target/arm/arch_dump.c   | 2 +-
 target/arm/cpu-sve.c     | 6 +++---
 target/arm/cpu64.c       | 2 +-
 target/arm/tcg/cpregs.c  | 4 ++--
 target/arm/tcg/helper.c  | 4 ++--
 target/arm/tcg/tcg-sve.c | 4 ++--
 7 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/arm/cpu-sve.h b/target/arm/cpu-sve.h
index 1512c56a6b..c83508ea0a 100644
--- a/target/arm/cpu-sve.h
+++ b/target/arm/cpu-sve.h
@@ -35,6 +35,6 @@ void cpu_sve_add_props(Object *obj);
 void cpu_sve_add_props_max(Object *obj);
 
 /* return the vector length for EL */
-uint32_t sve_zcr_len_for_el(CPUARMState *env, int el);
+uint32_t cpu_sve_get_zcr_len_for_el(CPUARMState *env, int el);
 
 #endif /* CPU_SVE_H */
diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index 9b2e76f5a7..f192c8df97 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -168,7 +168,7 @@ static off_t sve_fpcr_offset(uint32_t vq)
 
 static uint32_t sve_current_vq(CPUARMState *env)
 {
-    return sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
+    return cpu_sve_get_zcr_len_for_el(env, arm_current_el(env)) + 1;
 }
 
 static size_t sve_size_vq(uint32_t vq)
diff --git a/target/arm/cpu-sve.c b/target/arm/cpu-sve.c
index e8e817e110..1bc8c0bdb0 100644
--- a/target/arm/cpu-sve.c
+++ b/target/arm/cpu-sve.c
@@ -289,7 +289,7 @@ void cpu_sve_add_props_max(Object *obj)
     object_property_add(obj, "sve-max-vq", "uint32", get_prop_max_vq, set_prop_max_vq, NULL, NULL);
 }
 
-static uint32_t sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
+static uint32_t get_valid_len(ARMCPU *cpu, uint32_t start_len)
 {
     uint32_t end_len;
 
@@ -304,7 +304,7 @@ static uint32_t sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
 /*
  * Given that SVE is enabled, return the vector length for EL.
  */
-uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
+uint32_t cpu_sve_get_zcr_len_for_el(CPUARMState *env, int el)
 {
     ARMCPU *cpu = env_archcpu(env);
     uint32_t zcr_len = cpu->sve_max_vq - 1;
@@ -319,5 +319,5 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
         zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
     }
 
-    return sve_zcr_get_valid_len(cpu, zcr_len);
+    return get_valid_len(cpu, zcr_len);
 }
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 03ed637bdb..67b35feb17 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -549,7 +549,7 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                  vfp_get_fpcr(env), vfp_get_fpsr(env));
 
     if (cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) == 0) {
-        int j, zcr_len = sve_zcr_len_for_el(env, el);
+        int j, zcr_len = cpu_sve_get_zcr_len_for_el(env, el);
 
         for (i = 0; i <= FFR_PRED_NUM; i++) {
             bool eol;
diff --git a/target/arm/tcg/cpregs.c b/target/arm/tcg/cpregs.c
index c971dc6097..9118f4347c 100644
--- a/target/arm/tcg/cpregs.c
+++ b/target/arm/tcg/cpregs.c
@@ -5802,7 +5802,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                       uint64_t value)
 {
     int cur_el = arm_current_el(env);
-    int old_len = sve_zcr_len_for_el(env, cur_el);
+    int old_len = cpu_sve_get_zcr_len_for_el(env, cur_el);
     int new_len;
 
     /* Bits other than [3:0] are RAZ/WI.  */
@@ -5813,7 +5813,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * Because we arrived here, we know both FP and SVE are enabled;
      * otherwise we would have trapped access to the ZCR_ELn register.
      */
-    new_len = sve_zcr_len_for_el(env, cur_el);
+    new_len = cpu_sve_get_zcr_len_for_el(env, cur_el);
     if (new_len < old_len) {
         tcg_sve_narrow_vq(env, new_len + 1);
     }
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 984dae7643..fff185f422 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -186,7 +186,7 @@ static int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg)
          * We report in Vector Granules (VG) which is 64bit in a Z reg
          * while the ZCR works in Vector Quads (VQ) which is 128bit chunks.
          */
-        int vq = sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
+        int vq = cpu_sve_get_zcr_len_for_el(env, arm_current_el(env)) + 1;
         return gdb_get_reg64(buf, vq * 2);
     }
     default:
@@ -1034,7 +1034,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         if (sve_el != 0 && fp_el == 0) {
             zcr_len = 0;
         } else {
-            zcr_len = sve_zcr_len_for_el(env, el);
+            zcr_len = cpu_sve_get_zcr_len_for_el(env, el);
         }
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
         DP_TBFLAG_A64(flags, ZCR_LEN, zcr_len);
diff --git a/target/arm/tcg/tcg-sve.c b/target/arm/tcg/tcg-sve.c
index 25d5a5867c..80a37caf6e 100644
--- a/target/arm/tcg/tcg-sve.c
+++ b/target/arm/tcg/tcg-sve.c
@@ -155,10 +155,10 @@ void tcg_sve_change_el(CPUARMState *env, int old_el,
      */
     old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
     old_len = (old_a64 && !sve_exception_el(env, old_el)
-               ? sve_zcr_len_for_el(env, old_el) : 0);
+               ? cpu_sve_get_zcr_len_for_el(env, old_el) : 0);
     new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
     new_len = (new_a64 && !sve_exception_el(env, new_el)
-               ? sve_zcr_len_for_el(env, new_el) : 0);
+               ? cpu_sve_get_zcr_len_for_el(env, new_el) : 0);
 
     /* When changing vector length, clear inaccessible state.  */
     if (new_len < old_len) {
-- 
2.20.1
