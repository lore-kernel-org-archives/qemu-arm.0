Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id d16sm29784405wrg.27.2019.12.09.06.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 06:37:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7D4701FF87;
	Mon,  9 Dec 2019 14:37:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] target/arm: ensure we use current exception state after SCR update
Date: Mon,  9 Dec 2019 14:37:23 +0000
Message-Id: <20191209143723.6368-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QgWbosFKWsAr

A write to the SCR can change the effective EL by droppping the system
from secure to non-secure mode. However if we use a cached current_el
from before the change we'll rebuild the flags incorrectly. To fix
this we overload the ARM_CP_CURRENTEL flag for the register and ensure
the new EL is used when recomputing the flags.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/cpu.h       |  1 +
 target/arm/helper.h    |  1 +
 target/arm/helper.c    | 14 +++++++++++++-
 target/arm/translate.c |  6 +++++-
 4 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bd4d5b4445b..d2ef4644d8f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2262,6 +2262,7 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
 #define ARM_CP_NOP               (ARM_CP_SPECIAL | 0x0100)
 #define ARM_CP_WFI               (ARM_CP_SPECIAL | 0x0200)
 #define ARM_CP_NZCV              (ARM_CP_SPECIAL | 0x0300)
+/* Re-read the current EL, don't use cached values */
 #define ARM_CP_CURRENTEL         (ARM_CP_SPECIAL | 0x0400)
 #define ARM_CP_DC_ZVA            (ARM_CP_SPECIAL | 0x0500)
 #define ARM_LAST_SPECIAL         ARM_CP_DC_ZVA
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
index 489c31504a6..db2e33224d6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5179,7 +5179,7 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.scr_el3),
       .resetvalue = 0, .writefn = scr_write },
-    { .name = "SCR",  .type = ARM_CP_ALIAS,
+    { .name = "SCR",  .type = ARM_CP_ALIAS | ARM_CP_CURRENTEL,
       .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.scr_el3),
@@ -11437,6 +11437,18 @@ void HELPER(rebuild_hflags_m32)(CPUARMState *env, int el)
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
index 4d5d4bd8886..59213310065 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7083,7 +7083,11 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
             if (arm_dc_feature(s, ARM_FEATURE_M)) {
                 gen_helper_rebuild_hflags_m32(cpu_env, tcg_el);
             } else {
-                gen_helper_rebuild_hflags_a32(cpu_env, tcg_el);
+                if (ri->type & ARM_CP_CURRENTEL) {
+                    gen_helper_rebuild_hflags_a32_newel(cpu_env);
+                } else {
+                    gen_helper_rebuild_hflags_a32(cpu_env, tcg_el);
+                }
             }
             tcg_temp_free_i32(tcg_el);
             /*
-- 
2.20.1
