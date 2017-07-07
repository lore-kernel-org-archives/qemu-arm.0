Received: by 10.25.44.15 with SMTP id s15csp93802lfs;
        Fri, 7 Jul 2017 06:15:04 -0700 (PDT)
X-Received: by 10.223.170.138 with SMTP id h10mr828215wrc.153.1499433304445;
        Fri, 07 Jul 2017 06:15:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499433304; cv=none;
        d=google.com; s=arc-20160816;
        b=lYH8dgQnwpArR3l9036f10JqpNHVViw340N/TX/HNXaur9M5rewvdNZDcoN7InnNJm
         8iQmnPH4nUVsTpYPhkBybTx1VV6VFvnpmpA0c1b/hwaCotbZzbcHs7e+9QeXILScNVL5
         y7kcdACNwsCKTT/1runaGTNj3kn7PebgAKRo7VFtiSbxUgJf3skzgnqnNWjBiOQqY6X4
         R1tyoDxMzcrdb8kFXSukMUuyBcYk7KYsePPB4N1nzqQD7bUX7OZV7PUG/OQc7WULJnVm
         WDyM+z1eCJPrYg2kRyJR2gvYk9L58ewiaKnyex5Vlmgneh2QwAnwRSqQ1qOk+lCUkG+J
         EIww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=N8s3WiGlSb8o5pjXX1vXak1Eiv4ZAN3tm8jMd7jpzzY=;
        b=XzuFIAaq06Ap8FktevCimeKXMm4NpEHpEoJZXmflsVLywARQ3LnmI/jndB/lkd7jun
         FP8iZPX1U8tK9/LmUVhkH2ib/mfVrgGwjKqzoY9bqfx2Pbo6DHw4J7E/xwFKv0SPng11
         v4B3fDtFKrKpZV/KXxruQ9NsM0DB3BdmZI/jw3dO5wApOg+Ie6nXNvnSKZn2JULEevyg
         LftV+9+bm4/WtaRdazrXRiFWuGV0ntIru5IrpgCxlhLq5HgV2yWPDDj2jFVu7aufBB95
         jrCRXCGoB+MzE7lMhc70PquQ39UxaEhyiWU2ADd8fb6mFoe1tEOlazW3A2HaFq/QPLYe
         UbfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id 90si2219433wrh.278.2017.07.07.06.15.04;
        Fri, 07 Jul 2017 06:15:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v67DF0Yx022558;
	Fri, 7 Jul 2017 15:15:00 +0200
Received: from localhost (63.red-83-51-187.dynamicip.rima-tde.net [83.51.187.63])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id AF96A6FD;
	Fri,  7 Jul 2017 15:14:54 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v12 23/27] target/arm: [tcg] Port to tb_stop
Date: Fri,  7 Jul 2017 15:14:48 +0200
Message-Id: <149943328848.8972.1818197840780080665.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <149942760788.8972.474351671751194003.stgit@frigg.lan>
References: <149942760788.8972.474351671751194003.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: HUrlaLbkTivb

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate.c |  191 +++++++++++++++++++++++++-----------------------
 1 file changed, 101 insertions(+), 90 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9d033f2fb7..00cac01d66 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -12017,101 +12017,17 @@ static target_ulong arm_tr_translate_insn(DisasContextBase *dcbase,
     return dc->pc;
 }
 
-/* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
+static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
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
-        gen_intermediate_code_a64(&dc->base, cs, tb);
+    if (dc->base.is_jmp == DISAS_SKIP) {
         return;
     }
 
-    dc->base.tb = tb;
-    dc->base.pc_first = dc->base.tb->pc;
-    dc->base.pc_next = dc->base.pc_first;
-    dc->base.is_jmp = DISAS_NEXT;
-    dc->base.num_insns = 0;
-    dc->base.singlestep_enabled = cs->singlestep_enabled;
-    arm_tr_init_disas_context(&dc->base, cs);
-
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
-    if (dc->base.is_jmp != DISAS_SKIP) {
-    if (tb->cflags & CF_LAST_IO) {
-        if (dc->condjmp) {
-            /* FIXME:  This can theoretically happen with self-modifying
-               code.  */
-            cpu_abort(cs, "IO on conditional branch instruction");
-        }
-        gen_io_end();
+    if (dc->base.tb->cflags & CF_LAST_IO && dc->condjmp) {
+        /* FIXME: This can theoretically happen with self-modifying code. */
+        cpu_abort(cpu, "IO on conditional branch instruction");
     }
 
     /* At this stage dc->condjmp will only be set when the skipped
@@ -12215,6 +12131,101 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
             gen_goto_tb(dc, 1, dc->pc);
         }
     }
+}
+
+/* generate intermediate code for basic block 'tb'.  */
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
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
+
+    arm_tr_init_globals(&dc->base, cs);
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
+    arm_tr_tb_start(&dc->base, cs);
+
+    do {
+        dc->base.num_insns++;
+        arm_tr_insn_start(&dc->base, cs);
+
+        if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
+            CPUBreakpoint *bp;
+            QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
+                if (bp->pc == dc->base.pc_next) {
+                    BreakpointCheckType bp_check =
+                        arm_tr_breakpoint_check(&dc->base, cs, bp);
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
+        dc->base.pc_next = arm_tr_translate_insn(&dc->base, cs);
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
+    arm_tr_tb_stop(&dc->base, cs);
+
+    if (dc->base.tb->cflags & CF_LAST_IO) {
+        gen_io_end();
     }
 
 done_generating:
