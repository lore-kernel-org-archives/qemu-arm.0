Received: by 10.25.44.15 with SMTP id s15csp52577lfs;
        Fri, 7 Jul 2017 05:38:01 -0700 (PDT)
X-Received: by 10.28.132.13 with SMTP id g13mr2201023wmd.58.1499431081372;
        Fri, 07 Jul 2017 05:38:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499431081; cv=none;
        d=google.com; s=arc-20160816;
        b=Cf7NHcmdBT8JA13ym+FefxFfA6ir11uCjhzK4KfOC3qJ9hNsyC91QkUSiVAX9qKpY7
         9oneR4FKOMi8xJeuSz/PJdB5JKueOlNn0Z1u7VBQK1Uepn6FCa4tkmb3sEn0YfnFySq7
         6vjG7h7EkEGnYixwA/UVFf4xuG69B9Lk5zvmTOtliMZLZmqccN5MPg8xrww8S8r+r5up
         6t6Oh6tEYvMmIpP+vAGJC6twwfrYyXgE9g2r6FpH3Olttv0UrxzLpbz9SlW8+GMGTqVr
         5wKpBv9ddB2u5Y3ABq6TDPg9fY87c8/KMVc5as9ILhxJzaBkfL7KOK6+V4fBwbBHv4c4
         PywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=n9XGPh9HIjU6yKCjFkNEQkcAoFDRbMlZiJjcnPVtDPQ=;
        b=1EWU3AfKbNxNzFj46xzI4qNT6tE0t6pFi44c+RCihNxl6ugw74A4P5inRx6w0ekowz
         Q4PatCb1gfHcEcqYnJ9r63kbPhokNRUpkdvbQ0vZfjw5MNCoNIIjuU2jwYAAVNuW7Wx3
         czwP9vynCytt/yAvUZvkgrxncRlBwcRQYjaIdexHLJUb3kYDIfK8YPVjIpnvQ45lkgkl
         5sl64aaHC/gvnFWoqAcsN+ix6a5ObJ25nMQsT9xrp0TDpBB0QADrG9lpzyymXq4Bg9Ap
         A7myShqCdfQ7HTdeU3AKKFkLajfCxItNk74RG2n6KvDAETCcC/ruRnfISAxcUWcGOaby
         duoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id 124si2828971wmq.166.2017.07.07.05.38.01;
        Fri, 07 Jul 2017 05:38:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v67Cbvif021516;
	Fri, 7 Jul 2017 14:37:57 +0200
Received: from localhost (63.red-83-51-187.dynamicip.rima-tde.net [83.51.187.63])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id 5909D456;
	Fri,  7 Jul 2017 14:37:52 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v12 14/27] target/arm: [tcg] Port to init_disas_context
Date: Fri,  7 Jul 2017 14:37:46 +0200
Message-Id: <149943106604.8972.10208441394697288474.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <149942760788.8972.474351671751194003.stgit@frigg.lan>
References: <149942760788.8972.474351671751194003.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: gYigb97pCHWi

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 target/arm/translate.c |   86 +++++++++++++++++++++++++++---------------------
 1 file changed, 48 insertions(+), 38 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 15b4fcb417..0179b1ce79 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11786,32 +11786,12 @@ static bool insn_crosses_page(CPUARMState *env, DisasContext *s)
     return false;
 }
 
-/* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
+static void arm_tr_init_disas_context(DisasContextBase *dcbase,
+                                           CPUState *cs)
 {
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUARMState *env = cs->env_ptr;
     ARMCPU *cpu = arm_env_get_cpu(env);
-    DisasContext dc1, *dc = &dc1;
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
-        gen_intermediate_code_a64(&dc->base, cs, tb);
-        return;
-    }
-
-    dc->base.tb = tb;
-    dc->base.pc_first = tb->pc;
-    dc->base.pc_next = dc->base.pc_first;
-    dc->base.is_jmp = DISAS_NEXT;
-    dc->base.num_insns = 0;
-    dc->base.singlestep_enabled = cs->singlestep_enabled;
 
     dc->pc = dc->base.pc_first;
     dc->condjmp = 0;
@@ -11822,23 +11802,23 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
      */
     dc->secure_routed_to_el3 = arm_feature(env, ARM_FEATURE_EL3) &&
                                !arm_el_is_aa64(env, 3);
-    dc->thumb = ARM_TBFLAG_THUMB(tb->flags);
-    dc->sctlr_b = ARM_TBFLAG_SCTLR_B(tb->flags);
-    dc->be_data = ARM_TBFLAG_BE_DATA(tb->flags) ? MO_BE : MO_LE;
-    dc->condexec_mask = (ARM_TBFLAG_CONDEXEC(tb->flags) & 0xf) << 1;
-    dc->condexec_cond = ARM_TBFLAG_CONDEXEC(tb->flags) >> 4;
-    dc->mmu_idx = core_to_arm_mmu_idx(env, ARM_TBFLAG_MMUIDX(tb->flags));
+    dc->thumb = ARM_TBFLAG_THUMB(dc->base.tb->flags);
+    dc->sctlr_b = ARM_TBFLAG_SCTLR_B(dc->base.tb->flags);
+    dc->be_data = ARM_TBFLAG_BE_DATA(dc->base.tb->flags) ? MO_BE : MO_LE;
+    dc->condexec_mask = (ARM_TBFLAG_CONDEXEC(dc->base.tb->flags) & 0xf) << 1;
+    dc->condexec_cond = ARM_TBFLAG_CONDEXEC(dc->base.tb->flags) >> 4;
+    dc->mmu_idx = core_to_arm_mmu_idx(env, ARM_TBFLAG_MMUIDX(dc->base.tb->flags));
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
+    dc->ns = ARM_TBFLAG_NS(dc->base.tb->flags);
+    dc->fp_excp_el = ARM_TBFLAG_FPEXC_EL(dc->base.tb->flags);
+    dc->vfp_enabled = ARM_TBFLAG_VFPEN(dc->base.tb->flags);
+    dc->vec_len = ARM_TBFLAG_VECLEN(dc->base.tb->flags);
+    dc->vec_stride = ARM_TBFLAG_VECSTRIDE(dc->base.tb->flags);
+    dc->c15_cpar = ARM_TBFLAG_XSCALE_CPAR(dc->base.tb->flags);
+    dc->v7m_handler_mode = ARM_TBFLAG_HANDLER(dc->base.tb->flags);
     dc->cp_regs = cpu->cp_regs;
     dc->features = env->features;
 
@@ -11857,11 +11837,12 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
      *   emit code to generate a software step exception
      *   end the TB
      */
-    dc->ss_active = ARM_TBFLAG_SS_ACTIVE(tb->flags);
-    dc->pstate_ss = ARM_TBFLAG_PSTATE_SS(tb->flags);
+    dc->ss_active = ARM_TBFLAG_SS_ACTIVE(dc->base.tb->flags);
+    dc->pstate_ss = ARM_TBFLAG_PSTATE_SS(dc->base.tb->flags);
     dc->is_ldex = false;
     dc->ss_same_el = false; /* Can't be true since EL_d must be AArch64 */
 
+
     cpu_F0s = tcg_temp_new_i32();
     cpu_F1s = tcg_temp_new_i32();
     cpu_F0d = tcg_temp_new_i64();
@@ -11870,6 +11851,35 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
     cpu_V1 = cpu_F1d;
     /* FIXME: cpu_M0 can probably be the same as cpu_V0.  */
     cpu_M0 = tcg_temp_new_i64();
+}
+
+/* generate intermediate code for basic block 'tb'.  */
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
+{
+    CPUARMState *env = cs->env_ptr;
+    DisasContext dc1, *dc = &dc1;
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
+        gen_intermediate_code_a64(&dc->base, cs, tb);
+        return;
+    }
+
+    dc->base.tb = tb;
+    dc->base.pc_first = dc->base.tb->pc;
+    dc->base.pc_next = dc->base.pc_first;
+    dc->base.is_jmp = DISAS_NEXT;
+    dc->base.num_insns = 0;
+    dc->base.singlestep_enabled = cs->singlestep_enabled;
+    arm_tr_init_disas_context(&dc->base, cs);
+
     next_page_start = (dc->base.pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
     max_insns = tb->cflags & CF_COUNT_MASK;
     if (max_insns == 0) {
