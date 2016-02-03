Received: by 10.25.159.19 with SMTP id i19csp1227478lfe;
        Wed, 3 Feb 2016 05:39:31 -0800 (PST)
X-Received: by 10.140.241.147 with SMTP id m141mr1678532qhc.76.1454506771212;
        Wed, 03 Feb 2016 05:39:31 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g7si5525391qhc.102.2016.02.03.05.39.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Feb 2016 05:39:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34959 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aQxec-0004nm-Mk
	for alex.bennee@linaro.org; Wed, 03 Feb 2016 08:39:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aQxdv-0003pv-Lz
	for qemu-devel@nongnu.org; Wed, 03 Feb 2016 08:38:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aQxdt-0003Sf-DN
	for qemu-devel@nongnu.org; Wed, 03 Feb 2016 08:38:47 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57171)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aQxdt-0003SC-2F; Wed, 03 Feb 2016 08:38:45 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aQxdq-00035s-9u; Wed, 03 Feb 2016 13:38:42 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  3 Feb 2016 13:38:39 +0000
Message-Id: <1454506721-11843-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-devel] [PATCH 5/7] target-arm: Add isread parameter to
	CPAccessFns
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2YLKGPupIqe3

System registers might have access requirements which need to
be described via a CPAccessFn and which differ for reads and
writes. For this to be possible we need to pass the access
function a parameter to tell it whether the access being checked
is a read or a write.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/cpu.h           |  4 ++-
 target-arm/helper.c        | 81 +++++++++++++++++++++++++++++-----------------
 target-arm/helper.h        |  2 +-
 target-arm/op_helper.c     |  5 +--
 target-arm/translate-a64.c |  6 ++--
 target-arm/translate.c     |  7 ++--
 6 files changed, 68 insertions(+), 37 deletions(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 0fb79d0..5137632 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1319,7 +1319,9 @@ typedef uint64_t CPReadFn(CPUARMState *env, const ARMCPRegInfo *opaque);
 typedef void CPWriteFn(CPUARMState *env, const ARMCPRegInfo *opaque,
                        uint64_t value);
 /* Access permission check functions for coprocessor registers. */
-typedef CPAccessResult CPAccessFn(CPUARMState *env, const ARMCPRegInfo *opaque);
+typedef CPAccessResult CPAccessFn(CPUARMState *env,
+                                  const ARMCPRegInfo *opaque,
+                                  bool isread);
 /* Hook function for register reset */
 typedef void CPResetFn(CPUARMState *env, const ARMCPRegInfo *opaque);
 
diff --git a/target-arm/helper.c b/target-arm/helper.c
index d85b04f..8bc3ea3 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -344,7 +344,8 @@ void init_cpreg_list(ARMCPU *cpu)
  * access_el3_aa32ns_aa64any: Used to check both AArch32/64 register views.
  */
 static CPAccessResult access_el3_aa32ns(CPUARMState *env,
-                                        const ARMCPRegInfo *ri)
+                                        const ARMCPRegInfo *ri,
+                                        bool isread)
 {
     bool secure = arm_is_secure_below_el3(env);
 
@@ -356,10 +357,11 @@ static CPAccessResult access_el3_aa32ns(CPUARMState *env,
 }
 
 static CPAccessResult access_el3_aa32ns_aa64any(CPUARMState *env,
-                                                const ARMCPRegInfo *ri)
+                                                const ARMCPRegInfo *ri,
+                                                bool isread)
 {
     if (!arm_el_is_aa64(env, 3)) {
-        return access_el3_aa32ns(env, ri);
+        return access_el3_aa32ns(env, ri, isread);
     }
     return CP_ACCESS_OK;
 }
@@ -369,7 +371,8 @@ static CPAccessResult access_el3_aa32ns_aa64any(CPUARMState *env,
  * We assume that the .access field is set to PL1_RW.
  */
 static CPAccessResult access_trap_aa32s_el1(CPUARMState *env,
-                                            const ARMCPRegInfo *ri)
+                                            const ARMCPRegInfo *ri,
+                                            bool isread)
 {
     if (arm_current_el(env) == 3) {
         return CP_ACCESS_OK;
@@ -651,7 +654,8 @@ static void cpacr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     env->cp15.cpacr_el1 = value;
 }
 
-static CPAccessResult cpacr_access(CPUARMState *env, const ARMCPRegInfo *ri)
+static CPAccessResult cpacr_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                   bool isread)
 {
     if (arm_feature(env, ARM_FEATURE_V8)) {
         /* Check if CPACR accesses are to be trapped to EL2 */
@@ -668,7 +672,8 @@ static CPAccessResult cpacr_access(CPUARMState *env, const ARMCPRegInfo *ri)
     return CP_ACCESS_OK;
 }
 
-static CPAccessResult cptr_access(CPUARMState *env, const ARMCPRegInfo *ri)
+static CPAccessResult cptr_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
 {
     /* Check if CPTR accesses are set to trap to EL3 */
     if (arm_current_el(env) == 2 && (env->cp15.cptr_el[3] & CPTR_TCPAC)) {
@@ -710,7 +715,8 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
-static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *ri)
+static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                   bool isread)
 {
     /* Performance monitor registers user accessibility is controlled
      * by PMUSERENR.
@@ -1154,7 +1160,8 @@ static void teecr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     env->teecr = value;
 }
 
-static CPAccessResult teehbr_access(CPUARMState *env, const ARMCPRegInfo *ri)
+static CPAccessResult teehbr_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    bool isread)
 {
     if (arm_current_el(env) == 0 && (env->teecr & 1)) {
         return CP_ACCESS_TRAP;
@@ -1207,7 +1214,8 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
 
 #ifndef CONFIG_USER_ONLY
 
-static CPAccessResult gt_cntfrq_access(CPUARMState *env, const ARMCPRegInfo *ri)
+static CPAccessResult gt_cntfrq_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                       bool isread)
 {
     /* CNTFRQ: not visible from PL0 if both PL0PCTEN and PL0VCTEN are zero */
     if (arm_current_el(env) == 0 && !extract32(env->cp15.c14_cntkctl, 0, 2)) {
@@ -1216,7 +1224,8 @@ static CPAccessResult gt_cntfrq_access(CPUARMState *env, const ARMCPRegInfo *ri)
     return CP_ACCESS_OK;
 }
 
-static CPAccessResult gt_counter_access(CPUARMState *env, int timeridx)
+static CPAccessResult gt_counter_access(CPUARMState *env, int timeridx,
+                                        bool isread)
 {
     unsigned int cur_el = arm_current_el(env);
     bool secure = arm_is_secure(env);
@@ -1235,7 +1244,8 @@ static CPAccessResult gt_counter_access(CPUARMState *env, int timeridx)
     return CP_ACCESS_OK;
 }
 
-static CPAccessResult gt_timer_access(CPUARMState *env, int timeridx)
+static CPAccessResult gt_timer_access(CPUARMState *env, int timeridx,
+                                      bool isread)
 {
     unsigned int cur_el = arm_current_el(env);
     bool secure = arm_is_secure(env);
@@ -1257,29 +1267,34 @@ static CPAccessResult gt_timer_access(CPUARMState *env, int timeridx)
 }
 
 static CPAccessResult gt_pct_access(CPUARMState *env,
-                                         const ARMCPRegInfo *ri)
+                                    const ARMCPRegInfo *ri,
+                                    bool isread)
 {
-    return gt_counter_access(env, GTIMER_PHYS);
+    return gt_counter_access(env, GTIMER_PHYS, isread);
 }
 
 static CPAccessResult gt_vct_access(CPUARMState *env,
-                                         const ARMCPRegInfo *ri)
+                                    const ARMCPRegInfo *ri,
+                                    bool isread)
 {
-    return gt_counter_access(env, GTIMER_VIRT);
+    return gt_counter_access(env, GTIMER_VIRT, isread);
 }
 
-static CPAccessResult gt_ptimer_access(CPUARMState *env, const ARMCPRegInfo *ri)
+static CPAccessResult gt_ptimer_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                       bool isread)
 {
-    return gt_timer_access(env, GTIMER_PHYS);
+    return gt_timer_access(env, GTIMER_PHYS, isread);
 }
 
-static CPAccessResult gt_vtimer_access(CPUARMState *env, const ARMCPRegInfo *ri)
+static CPAccessResult gt_vtimer_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                       bool isread)
 {
-    return gt_timer_access(env, GTIMER_VIRT);
+    return gt_timer_access(env, GTIMER_VIRT, isread);
 }
 
 static CPAccessResult gt_stimer_access(CPUARMState *env,
-                                       const ARMCPRegInfo *ri)
+                                       const ARMCPRegInfo *ri,
+                                       bool isread)
 {
     /* The AArch64 register view of the secure physical timer is
      * always accessible from EL3, and configurably accessible from
@@ -1776,7 +1791,8 @@ static void par_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 #ifndef CONFIG_USER_ONLY
 /* get_phys_addr() isn't present for user-mode-only targets */
 
-static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri)
+static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                 bool isread)
 {
     if (ri->opc2 & 4) {
         /* The ATS12NSO* operations must trap to EL3 if executed in
@@ -1921,7 +1937,8 @@ static void ats1h_write(CPUARMState *env, const ARMCPRegInfo *ri,
     A32_BANKED_CURRENT_REG_SET(env, par, par64);
 }
 
-static CPAccessResult at_s1e2_access(CPUARMState *env, const ARMCPRegInfo *ri)
+static CPAccessResult at_s1e2_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                     bool isread)
 {
     if (arm_current_el(env) == 3 && !(env->cp15.scr_el3 & SCR_NS)) {
         return CP_ACCESS_TRAP;
@@ -2575,7 +2592,8 @@ static void aa64_fpsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     vfp_set_fpsr(env, value);
 }
 
-static CPAccessResult aa64_daif_access(CPUARMState *env, const ARMCPRegInfo *ri)
+static CPAccessResult aa64_daif_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                       bool isread)
 {
     if (arm_current_el(env) == 0 && !(env->cp15.sctlr_el[1] & SCTLR_UMA)) {
         return CP_ACCESS_TRAP;
@@ -2590,7 +2608,8 @@ static void aa64_daif_write(CPUARMState *env, const ARMCPRegInfo *ri,
 }
 
 static CPAccessResult aa64_cacheop_access(CPUARMState *env,
-                                          const ARMCPRegInfo *ri)
+                                          const ARMCPRegInfo *ri,
+                                          bool isread)
 {
     /* Cache invalidate/clean: NOP, but EL0 must UNDEF unless
      * SCTLR_EL1.UCI is set.
@@ -2846,7 +2865,8 @@ static void tlbi_aa64_ipas2e1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
-static CPAccessResult aa64_zva_access(CPUARMState *env, const ARMCPRegInfo *ri)
+static CPAccessResult aa64_zva_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                      bool isread)
 {
     /* We don't implement EL2, so the only control on DC ZVA is the
      * bit in the SCTLR which can prohibit access for EL0.
@@ -2863,13 +2883,14 @@ static uint64_t aa64_dczid_read(CPUARMState *env, const ARMCPRegInfo *ri)
     int dzp_bit = 1 << 4;
 
     /* DZP indicates whether DC ZVA access is allowed */
-    if (aa64_zva_access(env, NULL) == CP_ACCESS_OK) {
+    if (aa64_zva_access(env, NULL, false) == CP_ACCESS_OK) {
         dzp_bit = 0;
     }
     return cpu->dcz_blocksize | dzp_bit;
 }
 
-static CPAccessResult sp_el0_access(CPUARMState *env, const ARMCPRegInfo *ri)
+static CPAccessResult sp_el0_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    bool isread)
 {
     if (!(env->pstate & PSTATE_SP)) {
         /* Access to SP_EL0 is undefined if it's being used as
@@ -2908,7 +2929,8 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     tlb_flush(CPU(cpu), 1);
 }
 
-static CPAccessResult fpexc32_access(CPUARMState *env, const ARMCPRegInfo *ri)
+static CPAccessResult fpexc32_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                     bool isread)
 {
     if ((env->cp15.cptr_el[2] & CPTR_TFP) && arm_current_el(env) == 2) {
         return CP_ACCESS_TRAP_EL2;
@@ -3656,7 +3678,8 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
-static CPAccessResult ctr_el0_access(CPUARMState *env, const ARMCPRegInfo *ri)
+static CPAccessResult ctr_el0_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                     bool isread)
 {
     /* Only accessible in EL0 if SCTLR.UCT is set (and only in AArch64,
      * but the AArch32 CTR has its own reginfo struct)
diff --git a/target-arm/helper.h b/target-arm/helper.h
index c2a85c7..c98e9ce 100644
--- a/target-arm/helper.h
+++ b/target-arm/helper.h
@@ -62,7 +62,7 @@ DEF_HELPER_1(cpsr_read, i32, env)
 DEF_HELPER_3(v7m_msr, void, env, i32, i32)
 DEF_HELPER_2(v7m_mrs, i32, env, i32)
 
-DEF_HELPER_3(access_check_cp_reg, void, env, ptr, i32)
+DEF_HELPER_4(access_check_cp_reg, void, env, ptr, i32, i32)
 DEF_HELPER_3(set_cp_reg, void, env, ptr, i32)
 DEF_HELPER_2(get_cp_reg, i32, env, ptr)
 DEF_HELPER_3(set_cp_reg64, void, env, ptr, i64)
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index a5ee65f..313c0f8 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -457,7 +457,8 @@ void HELPER(set_user_reg)(CPUARMState *env, uint32_t regno, uint32_t val)
     }
 }
 
-void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome)
+void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
+                                 uint32_t isread)
 {
     const ARMCPRegInfo *ri = rip;
     int target_el;
@@ -471,7 +472,7 @@ void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome)
         return;
     }
 
-    switch (ri->accessfn(env, ri)) {
+    switch (ri->accessfn(env, ri, isread)) {
     case CP_ACCESS_OK:
         return;
     case CP_ACCESS_TRAP:
diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index 80f6c20..8f1eaad 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -1366,16 +1366,18 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
          * runtime; this may result in an exception.
          */
         TCGv_ptr tmpptr;
-        TCGv_i32 tcg_syn;
+        TCGv_i32 tcg_syn, tcg_isread;
         uint32_t syndrome;
 
         gen_a64_set_pc_im(s->pc - 4);
         tmpptr = tcg_const_ptr(ri);
         syndrome = syn_aa64_sysregtrap(op0, op1, op2, crn, crm, rt, isread);
         tcg_syn = tcg_const_i32(syndrome);
-        gen_helper_access_check_cp_reg(cpu_env, tmpptr, tcg_syn);
+        tcg_isread = tcg_const_i32(isread);
+        gen_helper_access_check_cp_reg(cpu_env, tmpptr, tcg_syn, tcg_isread);
         tcg_temp_free_ptr(tmpptr);
         tcg_temp_free_i32(tcg_syn);
+        tcg_temp_free_i32(tcg_isread);
     }
 
     /* Handle special cases first */
diff --git a/target-arm/translate.c b/target-arm/translate.c
index cff511b..375acf5 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -7168,7 +7168,7 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
              * call in order to handle c15_cpar.
              */
             TCGv_ptr tmpptr;
-            TCGv_i32 tcg_syn;
+            TCGv_i32 tcg_syn, tcg_isread;
             uint32_t syndrome;
 
             /* Note that since we are an implementation which takes an
@@ -7213,9 +7213,12 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
             gen_set_pc_im(s, s->pc - 4);
             tmpptr = tcg_const_ptr(ri);
             tcg_syn = tcg_const_i32(syndrome);
-            gen_helper_access_check_cp_reg(cpu_env, tmpptr, tcg_syn);
+            tcg_isread = tcg_const_i32(isread);
+            gen_helper_access_check_cp_reg(cpu_env, tmpptr, tcg_syn,
+                                           tcg_isread);
             tcg_temp_free_ptr(tmpptr);
             tcg_temp_free_i32(tcg_syn);
+            tcg_temp_free_i32(tcg_isread);
         }
 
         /* Handle special cases first */
-- 
1.9.1

