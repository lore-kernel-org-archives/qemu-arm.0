Received: by 10.25.227.6 with SMTP id a6csp3114551lfh;
        Wed, 28 Jun 2017 07:13:51 -0700 (PDT)
X-Received: by 10.25.15.74 with SMTP id e71mr3746118lfi.7.1498659231313;
        Wed, 28 Jun 2017 07:13:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498659231; cv=none;
        d=google.com; s=arc-20160816;
        b=jVQ8DJp9MU9mv5XcFD4l9u96fpXNPceR3PSmqSWIQrLtbXMD4j9hAVlm1hlbtfsqAy
         aj81e3qsJ7tjDnIhibY+XatFoAiWf08uLrqSjP11YjA89xWpXq7UDkxP+R9ElXcTto4B
         jnTYIYK6/l2ct5HITDeUyVsXmiv7/Qsl5wem7XQEdjVRpTtvjDq8ZkNFWsnG80LpkB8Y
         BRti5XyKk2oJUr5kD4nu6Wvi6x9f5fDx0d6t3xkwALRVHAXXHNgYMFLQHkbuvlcw8lR7
         tuc6zAPtrNR//R7CJZjA/3ZziKytzJB9nX52FEmSfEeZ2sAuZtzf9sCehNdMAUPMiugo
         ENgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=YF5d8m0HPk2Ot1uqq8a8yIh8v7hpQPaU40E55r3LVwE=;
        b=vTSzBlLp2meOBanbaHcom0rEt2qEcf6C6B6GZlnmdr+OqNXehrzNrwVvqz13dbV0QB
         V+BjHBeaqNWQcjZNBx/hQEUwASDocv1eABGce5jCdgc+Gd8ku/xWsnvwC2VzyDd7ghI4
         NU0F9qmwTM2L5Nv8/+AkhnFLdLrxs8JQitI3fCdXgDZT2+InRWF/3IYqshuGJB0LgBIz
         608BEVssnvbT1QWSUlaulFywqWBLgXeZjbijCAGbrOx0abEZyocQKH5lpr+joknZ5/tf
         LqAUIEWM1DnbLCP2LJ7sjbzJitvKfzELt5u0qxxWRXJSUXtSL8n+WCRp9GLBVUNrMX3P
         4U7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id b25si1048507lje.222.2017.06.28.07.13.50;
        Wed, 28 Jun 2017 07:13:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5SEDmSA028906;
	Wed, 28 Jun 2017 16:13:48 +0200
Received: from localhost (unknown [132.68.50.243])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id B792117D;
	Wed, 28 Jun 2017 16:13:42 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v11 29/29] target/arm: [tcg] Port to generic translation framework
Date: Wed, 28 Jun 2017 17:13:41 +0300
Message-Id: <149865922142.17063.17637554632892697681.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: DNsLULIlZY5/

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate-a64.c |  125 +++++++-------------------------------------
 target/arm/translate.c     |  124 +++++++-------------------------------------
 target/arm/translate.h     |    8 ---
 3 files changed, 42 insertions(+), 215 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index cc8bbb2b44..84d32ca547 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11250,6 +11250,14 @@ static void aarch64_trblock_init_disas_context(DisasContextBase *dcbase,
     init_tmp_a64_array(dc);
 }
 
+static void aarch64_trblock_init_globals(DisasContextBase *db, CPUState *cpu)
+{
+}
+
+static void aarch64_trblock_tb_start(DisasContextBase *db, CPUState *cpu)
+{
+}
+
 static void aarch64_trblock_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
@@ -11377,6 +11385,9 @@ static void aarch64_trblock_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             break;
         }
     }
+
+    /* Functions above can change dc->pc, so re-align db->pc_next */
+    dc->base.pc_next = dc->pc;
 }
 
 static void aarch64_trblock_disas_log(const DisasContextBase *dcbase,
@@ -11389,107 +11400,13 @@ static void aarch64_trblock_disas_log(const DisasContextBase *dcbase,
                      4 | (bswap_code(dc->sctlr_b) ? 2 : 0));
 }
 
-void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
-                               TranslationBlock *tb)
-{
-    DisasContext *dc = container_of(dcbase, DisasContext, base);
-    int max_insns;
-
-    dc->base.tb = tb;
-    dc->base.pc_first = dc->base.tb->pc;
-    dc->base.pc_next = dc->base.pc_first;
-    dc->base.is_jmp = DISAS_NEXT;
-    dc->base.num_insns = 0;
-    dc->base.singlestep_enabled = cs->singlestep_enabled;
-    aarch64_trblock_init_disas_context(&dc->base, cs);
-
-    max_insns = dc->base.tb->cflags & CF_COUNT_MASK;
-    if (max_insns == 0) {
-        max_insns = CF_COUNT_MASK;
-    }
-    if (max_insns > TCG_MAX_INSNS) {
-        max_insns = TCG_MAX_INSNS;
-    }
-
-    gen_tb_start(tb);
-
-    tcg_clear_temp_count();
-
-    do {
-        dc->base.num_insns++;
-        aarch64_trblock_insn_start(&dc->base, cs);
-
-        if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
-            CPUBreakpoint *bp;
-            QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
-                if (bp->pc == dc->base.pc_next) {
-                    BreakpointCheckType bp_check =
-                        aarch64_trblock_breakpoint_check(&dc->base, cs, bp);
-                    switch (bp_check) {
-                    case BC_MISS:
-                        /* Target ignored this breakpoint, go to next */
-                        break;
-                    case BC_HIT_INSN:
-                        /* Hit, keep translating */
-                        /*
-                         * TODO: if we're never going to have more than one
-                         *       BP in a single address, we can simply use a
-                         *       bool here.
-                         */
-                        goto done_breakpoints;
-                    case BC_HIT_TB:
-                        /* Hit, end TB */
-                        goto done_generating;
-                    default:
-                        g_assert_not_reached();
-                    }
-                }
-            }
-        }
-    done_breakpoints:
-
-        if (dc->base.num_insns == max_insns && (dc->base.tb->cflags & CF_LAST_IO)) {
-            gen_io_start();
-        }
-
-        dc->base.pc_next = aarch64_trblock_translate_insn(&dc->base, cs);
-
-        if (tcg_check_temp_count()) {
-            fprintf(stderr, "TCG temporary leak before "TARGET_FMT_lx"\n",
-                    dc->pc);
-        }
-
-        if (!dc->base.is_jmp && (tcg_op_buf_full() || cs->singlestep_enabled ||
-                            singlestep || dc->base.num_insns >= max_insns)) {
-            dc->base.is_jmp = DISAS_TOO_MANY;
-        }
-
-        /* Translation stops when a conditional branch is encountered.
-         * Otherwise the subsequent code could get translated several times.
-         * Also stop translation when a page boundary is reached.  This
-         * ensures prefetch aborts occur at the right place.
-         */
-    } while (!dc->base.is_jmp);
-
-    aarch64_trblock_tb_stop(&dc->base, cs);
-
-    if (dc->base.tb->cflags & CF_LAST_IO) {
-        gen_io_end();
-    }
-
-done_generating:
-    gen_tb_end(tb, dc->base.num_insns);
-
-#ifdef DEBUG_DISAS
-    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM) &&
-        qemu_log_in_addr_range(dc->base.pc_first)) {
-        qemu_log_lock();
-        qemu_log("----------------\n");
-        aarch64_trblock_disas_log(&dc->base, cs);
-        qemu_log("\n");
-        qemu_log_unlock();
-    }
-#endif
-    dc->base.tb->size = dc->pc - dc->base.pc_first;
-    dc->base.tb->icount = dc->base.num_insns;
-}
+const TranslatorOps aarch64_translator_ops = {
+    .init_disas_context = aarch64_trblock_init_disas_context,
+    .init_globals = aarch64_trblock_init_globals,
+    .tb_start = aarch64_trblock_tb_start,
+    .insn_start = aarch64_trblock_insn_start,
+    .breakpoint_check = aarch64_trblock_breakpoint_check,
+    .translate_insn = aarch64_trblock_translate_insn,
+    .tb_stop = aarch64_trblock_tb_stop,
+    .disas_log = aarch64_trblock_disas_log,
+};
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 30dacee139..323cbac672 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -12136,6 +12136,9 @@ static void arm_trblock_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_goto_tb(dc, 1, dc->pc);
         }
     }
+
+    /* Functions above can change dc->pc, so re-align db->pc_next */
+    dc->base.pc_next = dc->pc;
 }
 
 static void arm_trblock_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
@@ -12147,116 +12150,29 @@ static void arm_trblock_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
                      dc->thumb | (dc->sctlr_b << 1));
 }
 
+static const TranslatorOps arm_translator_ops = {
+    .init_disas_context = arm_trblock_init_disas_context,
+    .init_globals = arm_trblock_init_globals,
+    .tb_start = arm_trblock_tb_start,
+    .insn_start = arm_trblock_insn_start,
+    .breakpoint_check = arm_trblock_breakpoint_check,
+    .translate_insn = arm_trblock_translate_insn,
+    .tb_stop = arm_trblock_tb_stop,
+    .disas_log = arm_trblock_disas_log,
+};
+
 /* generate intermediate code for basic block 'tb'.  */
 void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
 {
     DisasContext dc1, *dc = &dc1;
-    int max_insns;
-
-    /* generate intermediate code */
-
-    /* The A64 decoder has its own top level loop, because it doesn't need
-     * the A32/T32 complexity to do with conditional execution/IT blocks/etc.
-     */
-    if (ARM_TBFLAG_AARCH64_STATE(tb->flags)) {
-        gen_intermediate_code_a64(&dc->base, cpu, tb);
-        return;
-    }
-
-    dc->base.tb = tb;
-    dc->base.pc_first = dc->base.tb->pc;
-    dc->base.pc_next = dc->base.pc_first;
-    dc->base.is_jmp = DISAS_NEXT;
-    dc->base.num_insns = 0;
-    dc->base.singlestep_enabled = cpu->singlestep_enabled;
-    arm_trblock_init_disas_context(&dc->base, cpu);
-
 
-    arm_trblock_init_globals(&dc->base, cpu);
-    max_insns = tb->cflags & CF_COUNT_MASK;
-    if (max_insns == 0) {
-        max_insns = CF_COUNT_MASK;
-    }
-    if (max_insns > TCG_MAX_INSNS) {
-        max_insns = TCG_MAX_INSNS;
-    }
-
-    gen_tb_start(tb);
-
-    tcg_clear_temp_count();
-    arm_trblock_tb_start(&dc->base, cpu);
-
-    do {
-        dc->base.num_insns++;
-        arm_trblock_insn_start(&dc->base, cpu);
-
-        if (unlikely(!QTAILQ_EMPTY(&cpu->breakpoints))) {
-            CPUBreakpoint *bp;
-            QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
-                if (bp->pc == dc->base.pc_next) {
-                    BreakpointCheckType bp_check =
-                        arm_trblock_breakpoint_check(&dc->base, cpu, bp);
-                    switch (bp_check) {
-                    case BC_MISS:
-                        /* Target ignored this breakpoint, go to next */
-                        break;
-                    case BC_HIT_INSN:
-                        /* Hit, keep translating */
-                        /*
-                         * TODO: if we're never going to have more than one
-                         *       BP in a single address, we can simply use a
-                         *       bool here.
-                         */
-                        goto done_breakpoints;
-                    case BC_HIT_TB:
-                        /* Hit, end TB */
-                        goto done_generating;
-                    default:
-                        g_assert_not_reached();
-                    }
-                }
-            }
-        }
-    done_breakpoints:
-
-        if (dc->base.num_insns == max_insns && (tb->cflags & CF_LAST_IO)) {
-            gen_io_start();
-        }
-
-        dc->base.pc_next = arm_trblock_translate_insn(&dc->base, cpu);
-
-        if (tcg_check_temp_count()) {
-            fprintf(stderr, "TCG temporary leak before "TARGET_FMT_lx"\n",
-                    dc->pc);
-        }
-
-        if (!dc->base.is_jmp && (tcg_op_buf_full() || singlestep ||
-                            dc->base.num_insns >= max_insns)) {
-            dc->base.is_jmp = DISAS_TOO_MANY;
-        }
-    } while (!dc->base.is_jmp);
-
-    arm_trblock_tb_stop(&dc->base, cpu);
-
-    if (dc->base.tb->cflags & CF_LAST_IO) {
-        gen_io_end();
-    }
-
-done_generating:
-    gen_tb_end(tb, dc->base.num_insns);
-
-#ifdef DEBUG_DISAS
-    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM) &&
-        qemu_log_in_addr_range(dc->base.pc_first)) {
-        qemu_log_lock();
-        qemu_log("----------------\n");
-        arm_trblock_disas_log(&dc->base, cpu);
-        qemu_log("\n");
-        qemu_log_unlock();
-    }
+    translate_block(
+#ifdef TARGET_AARCH64
+        ARM_TBFLAG_AARCH64_STATE(tb->flags) ?
+        &aarch64_translator_ops :
 #endif
-    tb->size = dc->pc - dc->base.pc_first;
-    tb->icount = dc->base.num_insns;
+        &arm_translator_ops,
+        &dc->base, cpu, tb);
 }
 
 static const char *cpu_mode_names[16] = {
diff --git a/target/arm/translate.h b/target/arm/translate.h
index f830775540..f0912ecc96 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -155,21 +155,15 @@ static void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
 
 #ifdef TARGET_AARCH64
 void a64_translate_init(void);
-void gen_intermediate_code_a64(DisasContextBase *db, CPUState *cpu,
-                               TranslationBlock *tb);
 void gen_a64_set_pc_im(uint64_t val);
 void aarch64_cpu_dump_state(CPUState *cs, FILE *f,
                             fprintf_function cpu_fprintf, int flags);
+extern const TranslatorOps aarch64_translator_ops;
 #else
 static inline void a64_translate_init(void)
 {
 }
 
-static inline void gen_intermediate_code_a64(DisasContextBase *db, CPUState *cpu,
-                                             TranslationBlock *tb)
-{
-}
-
 static inline void gen_a64_set_pc_im(uint64_t val)
 {
 }
