Received: by 10.25.44.15 with SMTP id s15csp657084lfs;
        Fri, 14 Jul 2017 02:06:11 -0700 (PDT)
X-Received: by 10.28.11.134 with SMTP id 128mr2225295wml.79.1500023171833;
        Fri, 14 Jul 2017 02:06:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500023171; cv=none;
        d=google.com; s=arc-20160816;
        b=Xc6gb7lGHH9Jx2fhIqVludxvmAdhwdSx3nCSNX3eAhxg2dsoxdABy/6oFIdPxMP77y
         tx7L/YaBoU94qKlNrg2AQpyEzzfwirUQ9RUtm/mglVzbjxz4ZXL83EvpSJkUSDCQWBhG
         ri6cbTOBSU7M9d8l/EsfyMJnDCKZavwKWm0U1FHg4XEuxiGiauGQ4m2T04j27pyDQimL
         WIbUtPrtVL8YExKS95U8w1rS7msxQEcbc0ac7GBtJzhtKgfvIgfLs8PQlqEqE2CVqjnN
         ghIzwNJPg0I4Y4YP4+xFn2a5qnSRE33cDD6a49oZcyf/3nLrrqs8Bmv8lwHd7DbLiL3w
         eb4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=gTBeUWedxfBToYD9AmPBw7KAYjRj9oZN755AqI9zLmo=;
        b=WjuoTn2HZA6F/cR3bVV4EFs+w0yrgyKOKCfn5TCn6RjhsEgQI6k8TpYB9Zo2KPEh17
         sscJY/CTZgL+wYuogwBrFeSDd3qRliFpfj1ypfaJhOlT8GXnAGjPhpPk0DSYuoLWAIP+
         qHLpGWzSv9QvRRNtEUE+yicaUAVqpXDJn3kUg2FLMa3kI1DwNmeoUr8d+2z7UBxbjI7h
         U50RcnKbgqa7bdKQsnxzz8xlDoS3ZVI6hTiiVmew3rHoFhFEP23VErXmtAZzVs6rn6OU
         KrwapcgPgZMDO67NxQu3MDxZqe4UaRrt6OvZkz4QKvDYhSbov8S+vqWcbSxsQmMbdGWZ
         W7ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id y23si6123997wrb.262.2017.07.14.02.06.11;
        Fri, 14 Jul 2017 02:06:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v6E969Z1009042;
	Fri, 14 Jul 2017 11:06:09 +0200
Received: from localhost (unknown [31.210.188.120])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id 87A386FE;
	Fri, 14 Jul 2017 11:06:03 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v13 13/26] target/arm: [tcg] Port to init_disas_context
Date: Fri, 14 Jul 2017 12:06:02 +0300
Message-Id: <150002316201.22386.12115078843605656029.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
References: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: JBoDV70cSjfM

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
Reviewed-by: Richard Henderson <rth@twiddle.net>
Reviewed-by: Alex Benneé <alex.benee@linaro.org>
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
