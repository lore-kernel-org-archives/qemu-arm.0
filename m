Received: by 10.25.15.197 with SMTP id 66csp912237lfp;
        Sun, 25 Jun 2017 02:56:32 -0700 (PDT)
X-Received: by 10.84.217.134 with SMTP id p6mr18137225pli.196.1498384592058;
        Sun, 25 Jun 2017 02:56:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498384592; cv=none;
        d=google.com; s=arc-20160816;
        b=QBb23l9p1eUmjI+vhwdzMoxLdV2Q2ofnKkBsdVKQQrPofajeGyzjMo+3iHOBmPDnUD
         V74PAF5XA71qh0WBFD9k5gfgV23vDdN00yRxradfcwKDt6rcBs6inHw2wbd/ZodhnXet
         07en7Ax30jVXcvqcSmtdIal4jEX4CVB7RT2v1eDhq0Q014CQ0VaiKqtKmpfJv3Aw8qFt
         +bJfWSZ+99ctxRMwAPboEI79vT3kkHrLFK6UeggcZzEvSI3DvLg19r/zrR+l5DTCJdYm
         BRgBmcjbr3HqKhqsz5y9FRnnamPLr0Siqeydbd8rVnekyI+YdKR0yWNkLQ0C+NnPzmb5
         sIcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=dhqc5O4KWQzP83Lx81pffUaMCoyA9ywKIlNzqgkk35E=;
        b=VPE/BVAo31+8xkc60UAHyT0k2NLTdT+8t/Z36b6v022t4sDa5UG2DggczlJfiP3MFK
         efiqCoqTHPqXQNOW6MTc5tDyx9BjzTjCjdjU0eq1mFzP0ubX5j5G3EgQSabtKC2aS1A3
         B1n2gZO4ZLE2BUUDTjp1wrn9HhJr0d0+wBQyXBwEcDqu99icI26VsaCHb3MJC27GSknv
         z4Y2SiSfLet5XN2JfTBPQptlAc4KxhdsXCacP/bSU5ofKb+jcavlXLkTdaMV/8muDOX3
         Ecai8JIAmm6cV3P8fNwPtFZCgCfO8wGdeNKpl4nCB11Rn6MK3QAP412Y8y+hTqq5ks1E
         FOGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id k6si7837654pln.23.2017.06.25.02.56.30;
        Sun, 25 Jun 2017 02:56:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5P9uTJk020234;
	Sun, 25 Jun 2017 11:56:29 +0200
Received: from localhost (unknown [132.68.53.125])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id 5367B5E;
	Sun, 25 Jun 2017 11:56:23 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v9 18/26] target: [tcg,arm] Port to init_disas_context
Date: Sun, 25 Jun 2017 12:56:22 +0300
Message-Id: <149838458211.6497.11741295397438731209.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
References: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 9efGNsCpoqsN

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate-a64.c |   51 +++++++++++++++-----------
 target/arm/translate.c     |   87 ++++++++++++++++++++++++--------------------
 2 files changed, 78 insertions(+), 60 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 8d48251321..1959f27377 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11202,21 +11202,12 @@ static void disas_a64_insn(CPUARMState *env, DisasContext *s)
     free_tmp_a64(s);
 }
 
-void gen_intermediate_code_a64(DisasContextBase *db, ARMCPU *cpu,
-                               TranslationBlock *tb)
+static void aarch64_trblock_init_disas_context(DisasContextBase *db,
+                                               CPUState *cpu)
 {
-    CPUState *cs = CPU(cpu);
-    CPUARMState *env = &cpu->env;
     DisasContext *dc = container_of(db, DisasContext, base);
-    target_ulong next_page_start;
-    int max_insns;
-
-    db->tb = tb;
-    db->pc_first = tb->pc;
-    db->pc_next = db->pc_first;
-    db->is_jmp = DJ_NEXT;
-    db->num_insns = 0;
-    db->singlestep_enabled = cs->singlestep_enabled;
+    CPUARMState *env = cpu->env_ptr;
+    ARMCPU *arm_cpu = arm_env_get_cpu(env);
 
     dc->pc = db->pc_first;
     dc->condjmp = 0;
@@ -11229,20 +11220,20 @@ void gen_intermediate_code_a64(DisasContextBase *db, ARMCPU *cpu,
                                !arm_el_is_aa64(env, 3);
     dc->thumb = 0;
     dc->sctlr_b = 0;
-    dc->be_data = ARM_TBFLAG_BE_DATA(tb->flags) ? MO_BE : MO_LE;
+    dc->be_data = ARM_TBFLAG_BE_DATA(db->tb->flags) ? MO_BE : MO_LE;
     dc->condexec_mask = 0;
     dc->condexec_cond = 0;
-    dc->mmu_idx = core_to_arm_mmu_idx(env, ARM_TBFLAG_MMUIDX(tb->flags));
-    dc->tbi0 = ARM_TBFLAG_TBI0(tb->flags);
-    dc->tbi1 = ARM_TBFLAG_TBI1(tb->flags);
+    dc->mmu_idx = core_to_arm_mmu_idx(env, ARM_TBFLAG_MMUIDX(db->tb->flags));
+    dc->tbi0 = ARM_TBFLAG_TBI0(db->tb->flags);
+    dc->tbi1 = ARM_TBFLAG_TBI1(db->tb->flags);
     dc->current_el = arm_mmu_idx_to_el(dc->mmu_idx);
 #if !defined(CONFIG_USER_ONLY)
     dc->user = (dc->current_el == 0);
 #endif
-    dc->fp_excp_el = ARM_TBFLAG_FPEXC_EL(tb->flags);
+    dc->fp_excp_el = ARM_TBFLAG_FPEXC_EL(db->tb->flags);
     dc->vec_len = 0;
     dc->vec_stride = 0;
-    dc->cp_regs = cpu->cp_regs;
+    dc->cp_regs = arm_cpu->cp_regs;
     dc->features = env->features;
 
     /* Single step state. The code-generation logic here is:
@@ -11260,12 +11251,30 @@ void gen_intermediate_code_a64(DisasContextBase *db, ARMCPU *cpu,
      *   emit code to generate a software step exception
      *   end the TB
      */
-    dc->ss_active = ARM_TBFLAG_SS_ACTIVE(tb->flags);
-    dc->pstate_ss = ARM_TBFLAG_PSTATE_SS(tb->flags);
+    dc->ss_active = ARM_TBFLAG_SS_ACTIVE(db->tb->flags);
+    dc->pstate_ss = ARM_TBFLAG_PSTATE_SS(db->tb->flags);
     dc->is_ldex = false;
     dc->ss_same_el = (arm_debug_target_el(env) == dc->current_el);
 
     init_tmp_a64_array(dc);
+}
+
+void gen_intermediate_code_a64(DisasContextBase *db, ARMCPU *cpu,
+                               TranslationBlock *tb)
+{
+    CPUState *cs = CPU(cpu);
+    CPUARMState *env = &cpu->env;
+    DisasContext *dc = container_of(db, DisasContext, base);
+    target_ulong next_page_start;
+    int max_insns;
+
+    db->tb = tb;
+    db->pc_first = tb->pc;
+    db->pc_next = db->pc_first;
+    db->is_jmp = DISAS_NEXT;
+    db->num_insns = 0;
+    db->singlestep_enabled = cs->singlestep_enabled;
+    aarch64_trblock_init_disas_context(db, cs);
 
     next_page_start = (db->pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
     max_insns = tb->cflags & CF_COUNT_MASK;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 19d042d843..c469bc70ac 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11823,33 +11823,11 @@ static bool insn_crosses_page(CPUARMState *env, DisasContext *s)
     return false;
 }
 
-/* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
+static void arm_trblock_init_disas_context(DisasContextBase *db, CPUState *cpu)
 {
+    DisasContext *dc = container_of(db, DisasContext, base);
     CPUARMState *env = cpu->env_ptr;
     ARMCPU *arm_cpu = arm_env_get_cpu(env);
-    DisasContext dc1, *dc = &dc1;
-    DisasContextBase *db = &dc->base;
-    target_ulong next_page_start;
-    int max_insns;
-    bool end_of_page;
-
-    /* generate intermediate code */
-
-    /* The A64 decoder has its own top level loop, because it doesn't need
-     * the A32/T32 complexity to do with conditional execution/IT blocks/etc.
-     */
-    if (ARM_TBFLAG_AARCH64_STATE(tb->flags)) {
-        gen_intermediate_code_a64(db, arm_cpu, tb);
-        return;
-    }
-
-    db->tb = tb;
-    db->pc_first = tb->pc;
-    db->pc_next = db->pc_first;
-    db->is_jmp = DJ_NEXT;
-    db->num_insns = 0;
-    db->singlestep_enabled = cpu->singlestep_enabled;
 
     dc->pc = db->pc_first;
     dc->condjmp = 0;
@@ -11860,23 +11838,23 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
      */
     dc->secure_routed_to_el3 = arm_feature(env, ARM_FEATURE_EL3) &&
                                !arm_el_is_aa64(env, 3);
-    dc->thumb = ARM_TBFLAG_THUMB(tb->flags);
-    dc->sctlr_b = ARM_TBFLAG_SCTLR_B(tb->flags);
-    dc->be_data = ARM_TBFLAG_BE_DATA(tb->flags) ? MO_BE : MO_LE;
-    dc->condexec_mask = (ARM_TBFLAG_CONDEXEC(tb->flags) & 0xf) << 1;
-    dc->condexec_cond = ARM_TBFLAG_CONDEXEC(tb->flags) >> 4;
-    dc->mmu_idx = core_to_arm_mmu_idx(env, ARM_TBFLAG_MMUIDX(tb->flags));
+    dc->thumb = ARM_TBFLAG_THUMB(db->tb->flags);
+    dc->sctlr_b = ARM_TBFLAG_SCTLR_B(db->tb->flags);
+    dc->be_data = ARM_TBFLAG_BE_DATA(db->tb->flags) ? MO_BE : MO_LE;
+    dc->condexec_mask = (ARM_TBFLAG_CONDEXEC(db->tb->flags) & 0xf) << 1;
+    dc->condexec_cond = ARM_TBFLAG_CONDEXEC(db->tb->flags) >> 4;
+    dc->mmu_idx = core_to_arm_mmu_idx(env, ARM_TBFLAG_MMUIDX(db->tb->flags));
     dc->current_el = arm_mmu_idx_to_el(dc->mmu_idx);
 #if !defined(CONFIG_USER_ONLY)
     dc->user = (dc->current_el == 0);
 #endif
-    dc->ns = ARM_TBFLAG_NS(tb->flags);
-    dc->fp_excp_el = ARM_TBFLAG_FPEXC_EL(tb->flags);
-    dc->vfp_enabled = ARM_TBFLAG_VFPEN(tb->flags);
-    dc->vec_len = ARM_TBFLAG_VECLEN(tb->flags);
-    dc->vec_stride = ARM_TBFLAG_VECSTRIDE(tb->flags);
-    dc->c15_cpar = ARM_TBFLAG_XSCALE_CPAR(tb->flags);
-    dc->v7m_handler_mode = ARM_TBFLAG_HANDLER(tb->flags);
+    dc->ns = ARM_TBFLAG_NS(db->tb->flags);
+    dc->fp_excp_el = ARM_TBFLAG_FPEXC_EL(db->tb->flags);
+    dc->vfp_enabled = ARM_TBFLAG_VFPEN(db->tb->flags);
+    dc->vec_len = ARM_TBFLAG_VECLEN(db->tb->flags);
+    dc->vec_stride = ARM_TBFLAG_VECSTRIDE(db->tb->flags);
+    dc->c15_cpar = ARM_TBFLAG_XSCALE_CPAR(db->tb->flags);
+    dc->v7m_handler_mode = ARM_TBFLAG_HANDLER(db->tb->flags);
     dc->cp_regs = arm_cpu->cp_regs;
     dc->features = env->features;
 
@@ -11895,10 +11873,41 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
      *   emit code to generate a software step exception
      *   end the TB
      */
-    dc->ss_active = ARM_TBFLAG_SS_ACTIVE(tb->flags);
-    dc->pstate_ss = ARM_TBFLAG_PSTATE_SS(tb->flags);
+    dc->ss_active = ARM_TBFLAG_SS_ACTIVE(db->tb->flags);
+    dc->pstate_ss = ARM_TBFLAG_PSTATE_SS(db->tb->flags);
     dc->is_ldex = false;
     dc->ss_same_el = false; /* Can't be true since EL_d must be AArch64 */
+}
+
+/* generate intermediate code for basic block 'tb'.  */
+void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
+{
+    CPUARMState *env = cpu->env_ptr;
+    ARMCPU *arm_cpu = arm_env_get_cpu(env);
+    DisasContext dc1, *dc = &dc1;
+    DisasContextBase *db = &dc->base;
+    target_ulong next_page_start;
+    int max_insns;
+    bool end_of_page;
+
+    /* generate intermediate code */
+
+    /* The A64 decoder has its own top level loop, because it doesn't need
+     * the A32/T32 complexity to do with conditional execution/IT blocks/etc.
+     */
+    if (ARM_TBFLAG_AARCH64_STATE(tb->flags)) {
+        gen_intermediate_code_a64(db, arm_cpu, tb);
+        return;
+    }
+
+    db->tb = tb;
+    db->pc_first = tb->pc;
+    db->pc_next = db->pc_first;
+    db->is_jmp = DISAS_NEXT;
+    db->num_insns = 0;
+    db->singlestep_enabled = cpu->singlestep_enabled;
+    arm_trblock_init_disas_context(db, cpu);
+
 
     cpu_F0s = tcg_temp_new_i32();
     cpu_F1s = tcg_temp_new_i32();
