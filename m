Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n3sm5492409wrs.8.2019.12.12.03.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 03:47:46 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 097061FF87;
	Thu, 12 Dec 2019 11:47:46 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2] target/arm: ensure we use current exception state after SCR update
Date: Thu, 12 Dec 2019 11:47:34 +0000
Message-Id: <20191212114734.6962-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pORXngyLg5fo

A write to the SCR can change the effective EL by droppping the system
from secure to non-secure mode. However if we use a cached current_el
from before the change we'll rebuild the flags incorrectly. To fix
this we introduce the ARM_CP_NEWEL CP flag to indicate the new EL
should be used when recomputing the flags.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20191209143723.6368-1-alex.bennee@linaro.org>

---
v2
  - don't override a ARM_CP_SPECIAL, use a new flag
---
 target/arm/cpu.h       |  8 ++++++--
 target/arm/helper.h    |  1 +
 target/arm/helper.c    | 14 +++++++++++++-
 target/arm/translate.c |  6 +++++-
 4 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 83a809d4bac..c3ab47d8962 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2238,6 +2238,9 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
  * RAISES_EXC is for when the read or write hook might raise an exception;
  * the generated code will synchronize the CPU state before calling the hook
  * so that it is safe for the hook to call raise_exception().
+ * NEWEL is for writes to registers that might change the exception
+ * level - typically on older ARM chips. For those cases we need to
+ * re-read the new el when recomputing the translation flags.
  */
 #define ARM_CP_SPECIAL           0x0001
 #define ARM_CP_CONST             0x0002
@@ -2257,10 +2260,11 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
 #define ARM_CP_SVE               0x2000
 #define ARM_CP_NO_GDB            0x4000
 #define ARM_CP_RAISES_EXC        0x8000
+#define ARM_CP_NEWEL             0x10000
 /* Used only as a terminator for ARMCPRegInfo lists */
-#define ARM_CP_SENTINEL          0xffff
+#define ARM_CP_SENTINEL          0xfffff
 /* Mask of only the flag bits in a type field */
-#define ARM_CP_FLAG_MASK         0xf0ff
+#define ARM_CP_FLAG_MASK         0x1f0ff
 
 /* Valid values for ARMCPRegInfo state field, indicating which of
  * the AArch32 and AArch64 execution states this register is visible in.
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 3d4ec267a2c..e345bdb726a 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -91,6 +91,7 @@ DEF_HELPER_2(get_user_reg, i32, env, i32)
 DEF_HELPER_3(set_user_reg, void, env, i32, i32)
 
 DEF_HELPER_FLAGS_2(rebuild_hflags_m32, TCG_CALL_NO_RWG, void, env, int)
+DEF_HELPER_FLAGS_1(rebuild_hflags_a32_newel, TCG_CALL_NO_RWG, void, env)
 DEF_HELPER_FLAGS_2(rebuild_hflags_a32, TCG_CALL_NO_RWG, void, env, int)
 DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, int)
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0bf8f53d4b8..b92ef9d1905 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5096,7 +5096,7 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.scr_el3),
       .resetvalue = 0, .writefn = scr_write },
-    { .name = "SCR",  .type = ARM_CP_ALIAS,
+    { .name = "SCR",  .type = ARM_CP_ALIAS | ARM_CP_NEWEL,
       .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.scr_el3),
@@ -11332,6 +11332,18 @@ void HELPER(rebuild_hflags_m32)(CPUARMState *env, int el)
     env->hflags = rebuild_hflags_m32(env, fp_el, mmu_idx);
 }
 
+/*
+ * If we have triggered a EL state change we can't rely on the
+ * translator having passed it too us, we need to recompute.
+ */
+void HELPER(rebuild_hflags_a32_newel)(CPUARMState *env)
+{
+    int el = arm_current_el(env);
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+    env->hflags = rebuild_hflags_a32(env, fp_el, mmu_idx);
+}
+
 void HELPER(rebuild_hflags_a32)(CPUARMState *env, int el)
 {
     int fp_el = fp_exception_el(env, el);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4d5d4bd8886..83aa331b1ec 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7083,7 +7083,11 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
             if (arm_dc_feature(s, ARM_FEATURE_M)) {
                 gen_helper_rebuild_hflags_m32(cpu_env, tcg_el);
             } else {
-                gen_helper_rebuild_hflags_a32(cpu_env, tcg_el);
+                if (ri->type & ARM_CP_NEWEL) {
+                    gen_helper_rebuild_hflags_a32_newel(cpu_env);
+                } else {
+                    gen_helper_rebuild_hflags_a32(cpu_env, tcg_el);
+                }
             }
             tcg_temp_free_i32(tcg_el);
             /*
-- 
2.20.1
