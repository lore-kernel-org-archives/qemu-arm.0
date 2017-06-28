Received: by 10.25.227.6 with SMTP id a6csp3092284lfh;
        Wed, 28 Jun 2017 06:57:43 -0700 (PDT)
X-Received: by 10.25.18.70 with SMTP id h67mr3728804lfi.0.1498658263459;
        Wed, 28 Jun 2017 06:57:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498658263; cv=none;
        d=google.com; s=arc-20160816;
        b=g0KSk1Q9cug37u/xXHvM7gBX/5EA9ix+wP8rrQJu4HMI6tJDQIcWyPL42yalmTvDhz
         +8E+SgjbBF27KN6a89hSaAAf9ZzwvOY5bs16+oxQYHUtnErRS6IoqtlJvBbhoQ/VRFBz
         sQRlldcXefE6Tw9id8SgfwhCiH3o6t2ruMIlZS72n5Zx74qqSKKOqj9FMDZk/MlF2sr+
         aEi3aE09epBK9WwtHrGql5YSDPV2M9+NxDhGwx1vrQ9Inl4K8M+g/Q9C/DqE0RV5AzYv
         ti2ZEmps6XVTmIDfiPf1UqB5vMnk2lZK0F8G17VAZtJWBrEBfEjblviGf+7WJDUgzx5l
         SB+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=V2Ur4B8+Z9o6bHKtn14z3DqKmzm17hkl5E1FA6yFpX0=;
        b=EgHZqlpwrAUOEmKdin20i3Dy6L6RF7Os9sfsLHJfTf+CmzlG5y4RV1cmomyRkj7KkV
         D6DJ0oh4VCOJ1xc0ee4wbDEeH8zqv5wzDf38dLJ0PsRCFmv0FsakRJc1VYxsVIss5Jvh
         YXmsD0/ivO5KBLABT+ObNt3LFwQjA6Qe6Wwrt0pco229AriKuaQ3vNwj2oFjrgTv5Fkv
         Vmf+ZP3FLnl3xVLU36AUPOd6v4fKZDxAuo2RdqLDFFGAB9RcdMznszK4jUHcBylCrc/w
         JqhaPY6ClnSIK6X4zrnXRb50sHL0/TEyB0c/XJW759grL6uPxIRfRy1OdrNRb/9qXD+M
         LgcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id 9si1035955ljg.306.2017.06.28.06.57.43;
        Wed, 28 Jun 2017 06:57:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5SDveuC028318;
	Wed, 28 Jun 2017 15:57:40 +0200
Received: from localhost (unknown [132.68.50.243])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id E65CA165;
	Wed, 28 Jun 2017 15:57:34 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v11 25/29] target/arm: [tcg] Port to tb_stop
Date: Wed, 28 Jun 2017 16:57:33 +0300
Message-Id: <149865825357.17063.13113603039704787150.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: Uq/90AFuEc1H

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate.c |  195 ++++++++++++++++++++++++++----------------------
 1 file changed, 104 insertions(+), 91 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7ab09a7e5f..ef0b870a2f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -12018,103 +12018,21 @@ static target_ulong arm_trblock_translate_insn(DisasContextBase *dcbase,
     return dc->pc;
 }
 
-/* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
+static void arm_trblock_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 {
-    DisasContext dc1, *dc = &dc1;
-    int max_insns;
-
-    /* generate intermediate code */
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    /* The A64 decoder has its own top level loop, because it doesn't need
-     * the A32/T32 complexity to do with conditional execution/IT blocks/etc.
-     */
-    if (ARM_TBFLAG_AARCH64_STATE(tb->flags)) {
-        gen_intermediate_code_a64(&dc->base, cpu, tb);
+    if (dc->base.is_jmp == DISAS_SKIP) {
         return;
     }
 
-    dc->base.tb = tb;
-    dc->base.pc_first = dc->base.tb->pc;
-    dc->base.pc_next = dc->base.pc_first;
-    dc->base.is_jmp = DISAS_NEXT;
-    dc->base.num_insns = 0;
-    dc->base.singlestep_enabled = cpu->singlestep_enabled;
-    arm_trblock_init_disas_context(&dc->base, cpu);
-
-
-    arm_trblock_init_globals(&dc->base, cpu);
-    max_insns = tb->cflags & CF_COUNT_MASK;
-    if (max_insns == 0) {
-        max_insns = CF_COUNT_MASK;
-    }
-    if (max_insns > TCG_MAX_INSNS) {
-        max_insns = TCG_MAX_INSNS;
+    if ((dc->base.tb->cflags & CF_LAST_IO) && dc->condjmp) {
+        /* FIXME: This can theoretically happen with self-modifying code. */
+        cpu_abort(cpu, "IO on conditional branch instruction");
     }
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
-    if (dc->base.is_jmp != DISAS_SKIP) {
-    if (tb->cflags & CF_LAST_IO) {
-        if (dc->condjmp) {
-            /* FIXME:  This can theoretically happen with self-modifying
-               code.  */
-            cpu_abort(cpu, "IO on conditional branch instruction");
-        }
-        gen_io_end();
+    if (dc->base.tb->cflags & CF_LAST_IO && dc->condjmp) {
+        /* FIXME: This can theoretically happen with self-modifying code. */
+        cpu_abort(cpu, "IO on conditional branch instruction");
     }
 
     /* At this stage dc->condjmp will only be set when the skipped
@@ -12218,6 +12136,101 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
             gen_goto_tb(dc, 1, dc->pc);
         }
     }
+}
+
+/* generate intermediate code for basic block 'tb'.  */
+void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
+{
+    DisasContext dc1, *dc = &dc1;
+    int max_insns;
+
+    /* generate intermediate code */
+
+    /* The A64 decoder has its own top level loop, because it doesn't need
+     * the A32/T32 complexity to do with conditional execution/IT blocks/etc.
+     */
+    if (ARM_TBFLAG_AARCH64_STATE(tb->flags)) {
+        gen_intermediate_code_a64(&dc->base, cpu, tb);
+        return;
+    }
+
+    dc->base.tb = tb;
+    dc->base.pc_first = dc->base.tb->pc;
+    dc->base.pc_next = dc->base.pc_first;
+    dc->base.is_jmp = DISAS_NEXT;
+    dc->base.num_insns = 0;
+    dc->base.singlestep_enabled = cpu->singlestep_enabled;
+    arm_trblock_init_disas_context(&dc->base, cpu);
+
+
+    arm_trblock_init_globals(&dc->base, cpu);
+    max_insns = tb->cflags & CF_COUNT_MASK;
+    if (max_insns == 0) {
+        max_insns = CF_COUNT_MASK;
+    }
+    if (max_insns > TCG_MAX_INSNS) {
+        max_insns = TCG_MAX_INSNS;
+    }
+
+    gen_tb_start(tb);
+
+    tcg_clear_temp_count();
+    arm_trblock_tb_start(&dc->base, cpu);
+
+    do {
+        dc->base.num_insns++;
+        arm_trblock_insn_start(&dc->base, cpu);
+
+        if (unlikely(!QTAILQ_EMPTY(&cpu->breakpoints))) {
+            CPUBreakpoint *bp;
+            QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
+                if (bp->pc == dc->base.pc_next) {
+                    BreakpointCheckType bp_check =
+                        arm_trblock_breakpoint_check(&dc->base, cpu, bp);
+                    switch (bp_check) {
+                    case BC_MISS:
+                        /* Target ignored this breakpoint, go to next */
+                        break;
+                    case BC_HIT_INSN:
+                        /* Hit, keep translating */
+                        /*
+                         * TODO: if we're never going to have more than one
+                         *       BP in a single address, we can simply use a
+                         *       bool here.
+                         */
+                        goto done_breakpoints;
+                    case BC_HIT_TB:
+                        /* Hit, end TB */
+                        goto done_generating;
+                    default:
+                        g_assert_not_reached();
+                    }
+                }
+            }
+        }
+    done_breakpoints:
+
+        if (dc->base.num_insns == max_insns && (tb->cflags & CF_LAST_IO)) {
+            gen_io_start();
+        }
+
+        dc->base.pc_next = arm_trblock_translate_insn(&dc->base, cpu);
+
+        if (tcg_check_temp_count()) {
+            fprintf(stderr, "TCG temporary leak before "TARGET_FMT_lx"\n",
+                    dc->pc);
+        }
+
+        if (!dc->base.is_jmp && (tcg_op_buf_full() || singlestep ||
+                            dc->base.num_insns >= max_insns)) {
+            dc->base.is_jmp = DISAS_TOO_MANY;
+        }
+    } while (!dc->base.is_jmp);
+
+    arm_trblock_tb_stop(&dc->base, cpu);
+
+    if (dc->base.tb->cflags & CF_LAST_IO) {
+        gen_io_end();
     }
 
 done_generating:
