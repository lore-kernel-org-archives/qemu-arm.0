Received: by 10.25.15.197 with SMTP id 66csp918434lfp;
        Sun, 25 Jun 2017 03:20:46 -0700 (PDT)
X-Received: by 10.98.76.145 with SMTP id e17mr4663806pfj.78.1498386046334;
        Sun, 25 Jun 2017 03:20:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498386046; cv=none;
        d=google.com; s=arc-20160816;
        b=ipCqx6kAv8gjMeGCm7azywhN11uQ7rkDrnY0fGWa9kQqd08UQy3uNOy/SE3+iCYnOg
         +u7S/qaENjv7iU0lR5+99WS1p/v5/zEBewe8pXHIQpC/RtKFYGwjJLF49XD4EA/CjVxI
         QE9AML0an85k4WGESCCnbjCg4xDO83KO1/87ycziLbOnw/6LHPqgvLxsPWgYThQ2CpJo
         BBHJw9xzAhfN7YhnrzH5PxA1lyLS1XmUGl7rZvFZtppLyZkH8Gc4PMwvtANuxMAlW/5D
         xIuq9vDVjtL+8+fx7Pu+5iaQWU38R+xiEQZlds1q23HZgl6CsJJ1Q+eJRNlXd+MXTZdO
         fCFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=7m/8hUWIsbt8BdF5uGYiahlfjL39jNNURduFYKp9+Dc=;
        b=QCLknEDtltBn7oSloWhSzPRlS+/lrtOQgPGW5eOjyOQClVxNAfWH5KThfHNiBlAQBf
         8qi7HPoYJuzW+L47geOzofPZFob/Ei0J7+8p5in9UobH8UMOAKNZ39swI6DTtYd7ZvBE
         cp8bBi0OjWiutbBj/EjpI0CMudPvVJiwBxX3am27nms9HgVyI+WsALkeJgQZRwHnlE9Z
         zk4fCe+6Ssy9wcF5Wva9JnobgGaZtNOOwfzTwIkaiCSsUHzK6/rgyjxwgf9QYiHGQasv
         vrA3EfUIGnsY0UYkD+MvqsdN9xQxiSP4c3IBORUFFyBK85bbIHBmrCU/sMo/7wB1a0dn
         wIGg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id l11si6815781pgc.375.2017.06.25.03.20.44;
        Sun, 25 Jun 2017 03:20:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5PAKgOX020643;
	Sun, 25 Jun 2017 12:20:42 +0200
Received: from localhost (unknown [132.68.53.125])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id 2582512B4;
	Sun, 25 Jun 2017 12:20:37 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v9 24/26] target: [tcg,arm] Port to tb_stop
Date: Sun, 25 Jun 2017 13:20:36 +0300
Message-Id: <149838603591.6497.5274008259647705750.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
References: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: LokIoO74ZsiL

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate-a64.c |  121 +++++++++++++++--------------
 target/arm/translate.c     |  185 ++++++++++++++++++++++++--------------------
 2 files changed, 164 insertions(+), 142 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f618a15062..b14e96cd58 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11327,6 +11327,68 @@ static target_ulong aarch64_trblock_disas_insn(DisasContextBase *db,
     return dc->pc;
 }
 
+static void aarch64_trblock_tb_stop(DisasContextBase *db, CPUState *cpu)
+{
+    DisasContext *dc = container_of(db, DisasContext, base);
+
+    if (unlikely(db->singlestep_enabled || dc->ss_active)
+        && db->is_jmp != DJ_EXC) {
+        /* Note that this means single stepping WFI doesn't halt the CPU.
+         * For conditional branch insns this is harmless unreachable code as
+         * gen_goto_tb() has already handled emitting the debug exception
+         * (and thus a tb-jump is not possible when singlestepping).
+         */
+        assert(db->is_jmp != DJ_TB_JUMP);
+        if (db->is_jmp != DJ_JUMP) {
+            gen_a64_set_pc_im(dc->pc);
+        }
+        if (db->singlestep_enabled) {
+            gen_exception_internal(EXCP_DEBUG);
+        } else {
+            gen_step_complete_exception(dc);
+        }
+    } else {
+        /* Cast because target-specific values are not in generic enum */
+        unsigned int is_jmp = (unsigned int)db->is_jmp;
+        switch (is_jmp) {
+        case DJ_NEXT:
+        case DJ_TOO_MANY:
+            gen_goto_tb(dc, 1, dc->pc);
+            break;
+        default:
+        case DJ_UPDATE:
+            gen_a64_set_pc_im(dc->pc);
+            /* fall through */
+        case DJ_JUMP:
+            tcg_gen_lookup_and_goto_ptr(cpu_pc);
+            break;
+        case DJ_TB_JUMP:
+        case DJ_EXC:
+        case DJ_SWI:
+            break;
+        case DJ_WFE:
+            gen_a64_set_pc_im(dc->pc);
+            gen_helper_wfe(cpu_env);
+            break;
+        case DJ_YIELD:
+            gen_a64_set_pc_im(dc->pc);
+            gen_helper_yield(cpu_env);
+            break;
+        case DJ_WFI:
+            /* This is a special case because we don't want to just halt the CPU
+             * if trying to debug across a WFI.
+             */
+            gen_a64_set_pc_im(dc->pc);
+            gen_helper_wfi(cpu_env);
+            /* The helper doesn't necessarily throw an exception, but we
+             * must go back to the main loop to check for interrupts anyway.
+             */
+            tcg_gen_exit_tb(0);
+            break;
+        }
+    }
+}
+
 void gen_intermediate_code_a64(DisasContextBase *db, ARMCPU *cpu,
                                TranslationBlock *tb)
 {
@@ -11401,67 +11463,12 @@ void gen_intermediate_code_a64(DisasContextBase *db, ARMCPU *cpu,
          */
     } while (!db->is_jmp);
 
+    aarch64_trblock_tb_stop(db, cs);
+
     if (tb->cflags & CF_LAST_IO) {
         gen_io_end(cpu_env);
     }
 
-    if (unlikely(cs->singlestep_enabled || dc->ss_active)
-        && db->is_jmp != DJ_EXC) {
-        /* Note that this means single stepping WFI doesn't halt the CPU.
-         * For conditional branch insns this is harmless unreachable code as
-         * gen_goto_tb() has already handled emitting the debug exception
-         * (and thus a tb-jump is not possible when singlestepping).
-         */
-        assert(db->is_jmp != DJ_TB_JUMP);
-        if (db->is_jmp != DJ_JUMP) {
-            gen_a64_set_pc_im(dc->pc);
-        }
-        if (cs->singlestep_enabled) {
-            gen_exception_internal(EXCP_DEBUG);
-        } else {
-            gen_step_complete_exception(dc);
-        }
-    } else {
-        /* Cast because target-specific values are not in generic enum */
-        unsigned int is_jmp = (unsigned int)db->is_jmp;
-        switch (is_jmp) {
-        case DJ_NEXT:
-        case DJ_TOO_MANY:
-            gen_goto_tb(dc, 1, dc->pc);
-            break;
-        default:
-        case DJ_UPDATE:
-            gen_a64_set_pc_im(dc->pc);
-            /* fall through */
-        case DJ_JUMP:
-            tcg_gen_lookup_and_goto_ptr(cpu_pc);
-            break;
-        case DJ_TB_JUMP:
-        case DJ_EXC:
-        case DJ_SWI:
-            break;
-        case DJ_WFE:
-            gen_a64_set_pc_im(dc->pc);
-            gen_helper_wfe(cpu_env);
-            break;
-        case DJ_YIELD:
-            gen_a64_set_pc_im(dc->pc);
-            gen_helper_yield(cpu_env);
-            break;
-        case DJ_WFI:
-            /* This is a special case because we don't want to just halt the CPU
-             * if trying to debug across a WFI.
-             */
-            gen_a64_set_pc_im(dc->pc);
-            gen_helper_wfi(cpu_env);
-            /* The helper doesn't necessarily throw an exception, but we
-             * must go back to the main loop to check for interrupts anyway.
-             */
-            tcg_gen_exit_tb(0);
-            break;
-        }
-    }
-
 done_generating:
     gen_tb_end(tb, db->num_insns);
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index f4c57ed078..db31611258 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -12053,97 +12053,23 @@ static target_ulong arm_trblock_disas_insn(DisasContextBase *db, CPUState *cpu)
     return dc->pc;
 }
 
-/* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
+static void arm_trblock_tb_stop(DisasContextBase *db, CPUState *cpu)
 {
-    CPUARMState *env = cpu->env_ptr;
-    ARMCPU *arm_cpu = arm_env_get_cpu(env);
-    DisasContext dc1, *dc = &dc1;
-    DisasContextBase *db = &dc->base;
-    int max_insns;
-    CPUBreakpoint *bp;
-
-    /* generate intermediate code */
+    DisasContext *dc = container_of(db, DisasContext, base);
+    /* Cast because target-specific values are not in generic enum */
+    unsigned int is_jmp = (unsigned int)db->is_jmp;
 
-    /* The A64 decoder has its own top level loop, because it doesn't need
-     * the A32/T32 complexity to do with conditional execution/IT blocks/etc.
-     */
-    if (ARM_TBFLAG_AARCH64_STATE(tb->flags)) {
-        gen_intermediate_code_a64(db, arm_cpu, tb);
+    if (is_jmp == DJ_SKIP) {
         return;
     }
 
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
+    if ((dc->base.tb->cflags & CF_LAST_IO) && dc->condjmp) {
+        /* FIXME: This can theoretically happen with self-modifying code. */
+        cpu_abort(cpu, "IO on conditional branch instruction");
     }
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
-    if (db->is_jmp != DJ_SKIP) {
-    if (tb->cflags & CF_LAST_IO) {
-        if (dc->condjmp) {
-            /* FIXME:  This can theoretically happen with self-modifying
-               code.  */
-            cpu_abort(cpu, "IO on conditional branch instruction");
-        }
-        gen_io_end(cpu_env);
+    if (db->tb->cflags & CF_LAST_IO && dc->condjmp) {
+        /* FIXME: This can theoretically happen with self-modifying code. */
+        cpu_abort(cpu, "IO on conditional branch instruction");
     }
 
     /* At this stage dc->condjmp will only be set when the skipped
@@ -12251,6 +12177,95 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
             gen_goto_tb(dc, 1, dc->pc);
         }
     }
+}
+
+/* generate intermediate code for basic block 'tb'.  */
+void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
+{
+    CPUARMState *env = cpu->env_ptr;
+    ARMCPU *arm_cpu = arm_env_get_cpu(env);
+    DisasContext dc1, *dc = &dc1;
+    DisasContextBase *db = &dc->base;
+    int max_insns;
+    CPUBreakpoint *bp;
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
+
+    arm_trblock_init_globals(db, cpu);
+    max_insns = tb->cflags & CF_COUNT_MASK;
+    if (max_insns == 0) {
+        max_insns = CF_COUNT_MASK;
+    }
+    if (max_insns > TCG_MAX_INSNS) {
+        max_insns = TCG_MAX_INSNS;
+    }
+
+    gen_tb_start(tb, cpu_env);
+
+    tcg_clear_temp_count();
+    arm_trblock_tb_start(db, cpu);
+
+    do {
+        db->num_insns++;
+        arm_trblock_insn_start(db, cpu);
+
+        bp = NULL;
+        do {
+            bp = cpu_breakpoint_get(cpu, db->pc_next, bp);
+            if (unlikely(bp)) {
+                BreakpointCheckType bp_check = arm_trblock_breakpoint_check(
+                    db, cpu, bp);
+                if (bp_check == BC_HIT_INSN) {
+                    /* Hit, keep translating */
+                    /*
+                     * TODO: if we're never going to have more than one BP in a
+                     *       single address, we can simply use a bool here.
+                     */
+                    break;
+                } else {
+                    goto done_generating;
+                }
+            }
+        } while (bp != NULL);
+
+        if (db->num_insns == max_insns && (tb->cflags & CF_LAST_IO)) {
+            gen_io_start(cpu_env);
+        }
+
+        db->pc_next = arm_trblock_disas_insn(db, cpu);
+
+        if (tcg_check_temp_count()) {
+            fprintf(stderr, "TCG temporary leak before "TARGET_FMT_lx"\n",
+                    dc->pc);
+        }
+
+        if (!db->is_jmp && (tcg_op_buf_full() || singlestep ||
+                            db->num_insns >= max_insns)) {
+            db->is_jmp = DJ_TOO_MANY;
+        }
+    } while (!db->is_jmp);
+
+    arm_trblock_tb_stop(db, cpu);
+
+    if (tb->cflags & CF_LAST_IO) {
+        gen_io_end(cpu_env);
     }
 
 done_generating:
