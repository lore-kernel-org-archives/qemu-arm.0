Received: by 10.25.44.15 with SMTP id s15csp111815lfs;
        Fri, 7 Jul 2017 06:31:30 -0700 (PDT)
X-Received: by 10.28.35.201 with SMTP id j192mr2339292wmj.26.1499434290142;
        Fri, 07 Jul 2017 06:31:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499434290; cv=none;
        d=google.com; s=arc-20160816;
        b=gdm9Etal1mtb6as5u+MJ62DRovY7kvbCTyaEwAtWbzy3oBVjAMIFWAjlagWyq5X40U
         O8K5+6Ik5kUKgEo8KndJ/bGnJcspD2maLvR2QXERwul/OxVwoUCrxhtaqqpoqIFFvygI
         lyZ40cvDsoWwAL04NPiRXd832r6ruu8rHLeA3zPdEL4wEfwg+wojJl8F3A/Uq1oNThiu
         xIMPbazoCrrNM78klTIE0KT+pFUV95GLKIEsx6mGhVt7IMBPQXXHgTFumu3gwYaVW1kj
         Blgnt9DsKrGIH3+Xe4mKuR8W3B7b32MMVrI6heJeLvJBgYNf55KtODZIPIlsAZYcd1zA
         e52Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=8nIbL+lxyDq2A1hZys0GsjqJX0bhLWLoubLWOCoztZM=;
        b=gVIP819jqDlcQFxkB5QYMXzGEGmfcuFxICKzMAnoGDD0spBGqReotrgRTBYRjodlK4
         +RcLhKoZEDZ3qHbNhMNAAqLuLt2GQ6Nmzupj1/yGmkWZYbNKyzv4LunBUybKpMUG8ms5
         DcKRR8ImED3yNEbQEGKGtRzbuRehZy4W/k5ItYOB7wxBEs8NZwRifhe211hSwJDoQIHM
         XQOFjps9+h8o/qbkqoMN29GgaBZwISwtcC+RPTsAc2l5Q0L5LiFasPeGS++7j8wJQyaK
         9XOrXG26w2eNQi0dizw67TDEQATYwg28UmvFGECujCYssVRG2DB/iMkSuLOpHgyuBthQ
         OLPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id i13si2959635wmd.88.2017.07.07.06.31.29;
        Fri, 07 Jul 2017 06:31:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v67DVRkX022994;
	Fri, 7 Jul 2017 15:31:27 +0200
Received: from localhost (63.red-83-51-187.dynamicip.rima-tde.net [83.51.187.63])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id 72AF4258;
	Fri,  7 Jul 2017 15:31:21 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v12 27/27] target/arm: [tcg] Port to generic translation framework
Date: Fri,  7 Jul 2017 15:31:15 +0200
Message-Id: <149943427534.8972.12180811037907145821.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <149942760788.8972.474351671751194003.stgit@frigg.lan>
References: <149942760788.8972.474351671751194003.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: rWf2ivnYJQvt

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate-a64.c |  120 ++++++-------------------------------------
 target/arm/translate.c     |  124 +++++++-------------------------------------
 target/arm/translate.h     |    8 ---
 3 files changed, 37 insertions(+), 215 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ea60d43a95..b569144ed9 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11250,6 +11250,10 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     init_tmp_a64_array(dc);
 }
 
+static void aarch64_tr_tb_start(DisasContextBase *db, CPUState *cpu)
+{
+}
+
 static void aarch64_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
@@ -11377,6 +11381,9 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             break;
         }
     }
+
+    /* Functions above can change dc->pc, so re-align db->pc_next */
+    dc->base.pc_next = dc->pc;
 }
 
 static void aarch64_tr_disas_log(const DisasContextBase *dcbase,
@@ -11389,107 +11396,12 @@ static void aarch64_tr_disas_log(const DisasContextBase *dcbase,
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
-    aarch64_tr_init_disas_context(&dc->base, cs);
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
-        aarch64_tr_insn_start(&dc->base, cs);
-
-        if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
-            CPUBreakpoint *bp;
-            QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
-                if (bp->pc == dc->base.pc_next) {
-                    BreakpointCheckType bp_check =
-                        aarch64_tr_breakpoint_check(&dc->base, cs, bp);
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
-        dc->base.pc_next = aarch64_tr_translate_insn(&dc->base, cs);
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
-    aarch64_tr_tb_stop(&dc->base, cs);
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
-        aarch64_tr_disas_log(&dc->base, cs);
-        qemu_log("\n");
-        qemu_log_unlock();
-    }
-#endif
-    dc->base.tb->size = dc->pc - dc->base.pc_first;
-    dc->base.tb->icount = dc->base.num_insns;
-}
+const TranslatorOps aarch64_translator_ops = {
+    .init_disas_context = aarch64_tr_init_disas_context,
+    .tb_start = aarch64_tr_tb_start,
+    .insn_start = aarch64_tr_insn_start,
+    .breakpoint_check = aarch64_tr_breakpoint_check,
+    .translate_insn = aarch64_tr_translate_insn,
+    .tb_stop = aarch64_tr_tb_stop,
+    .disas_log = aarch64_tr_disas_log,
+};
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5db381491f..bb6be76696 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -12131,6 +12131,9 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_goto_tb(dc, 1, dc->pc);
         }
     }
+
+    /* Functions above can change dc->pc, so re-align db->pc_next */
+    dc->base.pc_next = dc->pc;
 }
 
 static void arm_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
@@ -12142,116 +12145,29 @@ static void arm_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
                      dc->thumb | (dc->sctlr_b << 1));
 }
 
+static const TranslatorOps arm_translator_ops = {
+    .init_disas_context = arm_tr_init_disas_context,
+    .tb_start = arm_tr_tb_start,
+    .insn_start = arm_tr_insn_start,
+    .breakpoint_check = arm_tr_breakpoint_check,
+    .translate_insn = arm_tr_translate_insn,
+    .tb_stop = arm_tr_tb_stop,
+    .disas_log = arm_tr_disas_log,
+};
+
 /* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
+void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
 {
-    DisasContext dc1, *dc = &dc1;
-    int max_insns;
+    DisasContext dc;
+    const TranslatorOps *ops = &arm_translator_ops;
 
-    /* generate intermediate code */
-
-    /* The A64 decoder has its own top level loop, because it doesn't need
-     * the A32/T32 complexity to do with conditional execution/IT blocks/etc.
-     */
+#ifdef TARGET_AARCH64
     if (ARM_TBFLAG_AARCH64_STATE(tb->flags)) {
-        gen_intermediate_code_a64(&dc->base, cs, tb);
-        return;
-    }
-
-    dc->base.tb = tb;
-    dc->base.pc_first = dc->base.tb->pc;
-    dc->base.pc_next = dc->base.pc_first;
-    dc->base.is_jmp = DISAS_NEXT;
-    dc->base.num_insns = 0;
-    dc->base.singlestep_enabled = cs->singlestep_enabled;
-    arm_tr_init_disas_context(&dc->base, cs);
-
-
-    arm_tr_init_globals(&dc->base, cs);
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
-    arm_tr_tb_start(&dc->base, cs);
-
-    do {
-        dc->base.num_insns++;
-        arm_tr_insn_start(&dc->base, cs);
-
-        if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
-            CPUBreakpoint *bp;
-            QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
-                if (bp->pc == dc->base.pc_next) {
-                    BreakpointCheckType bp_check =
-                        arm_tr_breakpoint_check(&dc->base, cs, bp);
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
-        dc->base.pc_next = arm_tr_translate_insn(&dc->base, cs);
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
-    arm_tr_tb_stop(&dc->base, cs);
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
-        arm_tr_disas_log(&dc->base, cs);
-        qemu_log("\n");
-        qemu_log_unlock();
+        ops = &aarch64_translator_ops;
     }
 #endif
-    tb->size = dc->pc - dc->base.pc_first;
-    tb->icount = dc->base.num_insns;
+
+    translator_loop(ops, &dc.base, cpu, tb);
 }
 
 static const char *cpu_mode_names[16] = {
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 83e56dcb08..69d4b2f082 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -153,21 +153,15 @@ static void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
 
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
