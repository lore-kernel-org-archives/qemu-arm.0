Received: by 10.25.15.197 with SMTP id 66csp920411lfp;
        Sun, 25 Jun 2017 03:28:50 -0700 (PDT)
X-Received: by 10.99.99.195 with SMTP id x186mr15965682pgb.200.1498386530773;
        Sun, 25 Jun 2017 03:28:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498386530; cv=none;
        d=google.com; s=arc-20160816;
        b=m3EB13JEavvpvxNwb8wIh7dOJ0lLgsGhLQEyTQKsOwmF3rSApVcQJczCb6QMo+9NWT
         64/l4CUdW1+UzHvgtOtBntkgomPvR8jOLNzi7NJ9D6pO3WTWIqf/fAGKLtStHZAuAAfA
         vGhUBzznPlixCPNwmQDACSQ+izfC5Vjdi1edkyaghvtAWau1nqUMMOAbJcw49xrk8Umt
         K2elGc3OHpmr6fBq7f+eXlqTQMkgIHnpZ0TN1p/VPgv5o4LuH5pdj4CDBszqGJBLl41Q
         ar/l9S6RFqV/m4Gl49sJcr/X1TCtay6KHtsR67wt0SQD2ml0nMTvD1GQnnISaGDWigF4
         a01A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=mV1lidw2zVXZWuUek8PFyKGuRg2Q9A5P/x+N4deZ8yk=;
        b=cObcevJuBRBaWnP75S+sV7zoC6Y2QzRQnaverRuK/6LypNUIGwnyk60qhLolxSYmL7
         uUuR+FTp2pu/4FNaOIU3HA/aCOovwfNaBfeW5z+3qSAxgks8g3UmViPPsbbGz57BRdz0
         hXm2l+o8xgdD8zpcljys4BeMVafOkcrJFC11nK8Oc5XVRXO4XfpKr94u8D6X1VwJmBg6
         7zImi5B5TcNeybx/2tJOkbAfNPh3JUTt/DDTRhjdk908DvcITVZrlgaqb2GaaBSHqPD7
         GfpmgXgrazviI2XU7IvVVh0u1rRwkLP3zvF+XYQRX0/qxXLciQaWp1GOwV6Fpqs3LjV9
         ATOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id y5si6721770pfa.339.2017.06.25.03.28.48;
        Sun, 25 Jun 2017 03:28:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5PASkC1020771;
	Sun, 25 Jun 2017 12:28:46 +0200
Received: from localhost (unknown [132.68.53.125])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id 09B6013BC;
	Sun, 25 Jun 2017 12:28:40 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v9 26/26] target: [tcg, arm] Port to generic translation framework
Date: Sun, 25 Jun 2017 13:28:39 +0300
Message-Id: <149838651980.6497.760840816251179741.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
References: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: He5bZ8yqY6db

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate-a64.c |  110 ++++++-------------------------------------
 target/arm/translate.c     |  112 +++++++-------------------------------------
 target/arm/translate.h     |    6 +-
 3 files changed, 36 insertions(+), 192 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 97e8bda230..59c5d58dd1 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11387,6 +11387,9 @@ static void aarch64_trblock_tb_stop(DisasContextBase *db, CPUState *cpu)
             break;
         }
     }
+
+    /* Functions above can change dc->pc, so re-align db->pc_next */
+    db->pc_next = dc->pc;
 }
 
 static int aarch64_trblock_disas_flags(const DisasContextBase *db)
@@ -11396,102 +11399,17 @@ static int aarch64_trblock_disas_flags(const DisasContextBase *db)
     return 4 | (bswap_code(dc->sctlr_b) ? 2 : 0);
 }
 
-void gen_intermediate_code_a64(DisasContextBase *db, ARMCPU *cpu,
+static TranslatorOps aarch64_translator_ops = {
+    .init_disas_context = aarch64_trblock_init_disas_context,
+    .insn_start = aarch64_trblock_insn_start,
+    .breakpoint_check = aarch64_trblock_breakpoint_check,
+    .disas_insn = aarch64_trblock_disas_insn,
+    .tb_stop = aarch64_trblock_tb_stop,
+    .disas_flags = aarch64_trblock_disas_flags,
+};
+
+void gen_intermediate_code_a64(DisasContextBase *db, CPUState *cpu,
                                TranslationBlock *tb)
 {
-    CPUState *cs = CPU(cpu);
-    DisasContext *dc = container_of(db, DisasContext, base);
-    int max_insns;
-    CPUBreakpoint *bp;
-
-    db->tb = tb;
-    db->pc_first = tb->pc;
-    db->pc_next = db->pc_first;
-    db->is_jmp = DISAS_NEXT;
-    db->num_insns = 0;
-    db->singlestep_enabled = cs->singlestep_enabled;
-    aarch64_trblock_init_disas_context(db, cs);
-
-    max_insns = tb->cflags & CF_COUNT_MASK;
-    if (max_insns == 0) {
-        max_insns = CF_COUNT_MASK;
-    }
-    if (max_insns > TCG_MAX_INSNS) {
-        max_insns = TCG_MAX_INSNS;
-    }
-
-    gen_tb_start(tb, cpu_env);
-
-    tcg_clear_temp_count();
-
-    do {
-        db->num_insns++;
-        aarch64_trblock_insn_start(db, cs);
-
-        bp = NULL;
-        do {
-            bp = cpu_breakpoint_get(cs, db->pc_next, bp);
-            if (unlikely(bp)) {
-                BreakpointCheckType bp_check =
-                    aarch64_trblock_breakpoint_check(db, cs, bp);
-                if (bp_check == BC_HIT_INSN) {
-                    /* Hit, keep translating */
-                    /*
-                     * TODO: if we're never going to have more than one BP in a
-                     *       single address, we can simply use a bool here.
-                     */
-                    break;
-                } else {
-                    goto done_generating;
-                }
-            }
-        } while (bp != NULL);
-
-        if (db->num_insns == max_insns && (tb->cflags & CF_LAST_IO)) {
-            gen_io_start(cpu_env);
-        }
-
-        db->pc_next = aarch64_trblock_disas_insn(db, cs);
-
-        if (tcg_check_temp_count()) {
-            fprintf(stderr, "TCG temporary leak before "TARGET_FMT_lx"\n",
-                    dc->pc);
-        }
-
-        if (!db->is_jmp && (tcg_op_buf_full() || cs->singlestep_enabled ||
-                            singlestep || db->num_insns >= max_insns)) {
-            db->is_jmp = DJ_TOO_MANY;
-        }
-
-        /* Translation stops when a conditional branch is encountered.
-         * Otherwise the subsequent code could get translated several times.
-         * Also stop translation when a page boundary is reached.  This
-         * ensures prefetch aborts occur at the right place.
-         */
-    } while (!db->is_jmp);
-
-    aarch64_trblock_tb_stop(db, cs);
-
-    if (tb->cflags & CF_LAST_IO) {
-        gen_io_end(cpu_env);
-    }
-
-done_generating:
-    gen_tb_end(tb, db->num_insns);
-
-#ifdef DEBUG_DISAS
-    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM) &&
-        qemu_log_in_addr_range(db->pc_first)) {
-        int disas_flags = aarch64_trblock_disas_flags(db);
-        qemu_log_lock();
-        qemu_log("----------------\n");
-        qemu_log("IN: %s\n", lookup_symbol(db->pc_first));
-        log_target_disas(cs, db->pc_first, dc->pc - db->pc_first,
-                         disas_flags);
-        qemu_log("\n");
-        qemu_log_unlock();
-    }
-#endif
-    tb->size = dc->pc - db->pc_first;
-    tb->icount = db->num_insns;
+    translate_block(&aarch64_translator_ops, db, cpu, &cpu_env, tb);
 }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index d87328602a..d9a7d870cb 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -12177,6 +12177,9 @@ static void arm_trblock_tb_stop(DisasContextBase *db, CPUState *cpu)
             gen_goto_tb(dc, 1, dc->pc);
         }
     }
+
+    /* Functions above can change dc->pc, so re-align db->pc_next */
+    db->pc_next = dc->pc;
 }
 
 static int arm_trblock_disas_flags(const DisasContextBase *db)
@@ -12186,15 +12189,24 @@ static int arm_trblock_disas_flags(const DisasContextBase *db)
     return dc->thumb | (dc->sctlr_b << 1);
 }
 
+static TranslatorOps arm_translator_ops = {
+    .init_disas_context = arm_trblock_init_disas_context,
+    .init_globals = arm_trblock_init_globals,
+    .tb_start = arm_trblock_tb_start,
+    .insn_start = arm_trblock_insn_start,
+    .breakpoint_check = arm_trblock_breakpoint_check,
+    .disas_insn = arm_trblock_disas_insn,
+    .tb_stop = arm_trblock_tb_stop,
+    .disas_flags = arm_trblock_disas_flags,
+};
+
+#include "qemu/error-report.h"
+
 /* generate intermediate code for basic block 'tb'.  */
 void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
 {
-    CPUARMState *env = cpu->env_ptr;
-    ARMCPU *arm_cpu = arm_env_get_cpu(env);
     DisasContext dc1, *dc = &dc1;
     DisasContextBase *db = &dc->base;
-    int max_insns;
-    CPUBreakpoint *bp;
 
     /* generate intermediate code */
 
@@ -12202,97 +12214,11 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
      * the A32/T32 complexity to do with conditional execution/IT blocks/etc.
      */
     if (ARM_TBFLAG_AARCH64_STATE(tb->flags)) {
-        gen_intermediate_code_a64(db, arm_cpu, tb);
+        gen_intermediate_code_a64(db, cpu, tb);
         return;
+    } else {
+        translate_block(&arm_translator_ops, db, cpu, &cpu_env, tb);
     }
-
-    db->tb = tb;
-    db->pc_first = tb->pc;
-    db->pc_next = db->pc_first;
-    db->is_jmp = DISAS_NEXT;
-    db->num_insns = 0;
-    db->singlestep_enabled = cpu->singlestep_enabled;
-    arm_trblock_init_disas_context(db, cpu);
-
-
-    arm_trblock_init_globals(db, cpu);
-    max_insns = tb->cflags & CF_COUNT_MASK;
-    if (max_insns == 0) {
-        max_insns = CF_COUNT_MASK;
-    }
-    if (max_insns > TCG_MAX_INSNS) {
-        max_insns = TCG_MAX_INSNS;
-    }
-
-    gen_tb_start(tb, cpu_env);
-
-    tcg_clear_temp_count();
-    arm_trblock_tb_start(db, cpu);
-
-    do {
-        db->num_insns++;
-        arm_trblock_insn_start(db, cpu);
-
-        bp = NULL;
-        do {
-            bp = cpu_breakpoint_get(cpu, db->pc_next, bp);
-            if (unlikely(bp)) {
-                BreakpointCheckType bp_check = arm_trblock_breakpoint_check(
-                    db, cpu, bp);
-                if (bp_check == BC_HIT_INSN) {
-                    /* Hit, keep translating */
-                    /*
-                     * TODO: if we're never going to have more than one BP in a
-                     *       single address, we can simply use a bool here.
-                     */
-                    break;
-                } else {
-                    goto done_generating;
-                }
-            }
-        } while (bp != NULL);
-
-        if (db->num_insns == max_insns && (tb->cflags & CF_LAST_IO)) {
-            gen_io_start(cpu_env);
-        }
-
-        db->pc_next = arm_trblock_disas_insn(db, cpu);
-
-        if (tcg_check_temp_count()) {
-            fprintf(stderr, "TCG temporary leak before "TARGET_FMT_lx"\n",
-                    dc->pc);
-        }
-
-        if (!db->is_jmp && (tcg_op_buf_full() || singlestep ||
-                            db->num_insns >= max_insns)) {
-            db->is_jmp = DJ_TOO_MANY;
-        }
-    } while (!db->is_jmp);
-
-    arm_trblock_tb_stop(db, cpu);
-
-    if (tb->cflags & CF_LAST_IO) {
-        gen_io_end(cpu_env);
-    }
-
-done_generating:
-    gen_tb_end(tb, db->num_insns);
-
-#ifdef DEBUG_DISAS
-    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM) &&
-        qemu_log_in_addr_range(db->pc_first)) {
-        int disas_flags = arm_trblock_disas_flags(db);
-        qemu_log_lock();
-        qemu_log("----------------\n");
-        qemu_log("IN: %s\n", lookup_symbol(db->pc_first));
-        log_target_disas(cpu, db->pc_first, dc->pc - db->pc_first,
-                         disas_flags);
-        qemu_log("\n");
-        qemu_log_unlock();
-    }
-#endif
-    tb->size = dc->pc - db->pc_first;
-    tb->icount = db->num_insns;
 }
 
 static const char *cpu_mode_names[16] = {
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 43e8b555e3..0e60d4d771 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -152,7 +152,7 @@ static void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
 
 #ifdef TARGET_AARCH64
 void a64_translate_init(void);
-void gen_intermediate_code_a64(DisasContextBase *db, ARMCPU *cpu,
+void gen_intermediate_code_a64(DisasContextBase *db, CPUState *cpu,
                                TranslationBlock *tb);
 void gen_a64_set_pc_im(uint64_t val);
 void aarch64_cpu_dump_state(CPUState *cs, FILE *f,
@@ -162,8 +162,8 @@ static inline void a64_translate_init(void)
 {
 }
 
-static inline void gen_intermediate_code_a64(DisasContextBase *db, ARMCPU *cpu,
-                                             TranslationBlock *tb)
+static inline void gen_intermediate_code_a64(
+    DisasContextBase *db, CPUState *cpu, TranslationBlock *tb)
 {
 }
 
