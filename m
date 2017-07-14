Received: by 10.25.44.15 with SMTP id s15csp691541lfs;
        Fri, 14 Jul 2017 02:42:33 -0700 (PDT)
X-Received: by 10.28.132.13 with SMTP id g13mr2143776wmd.58.1500025353490;
        Fri, 14 Jul 2017 02:42:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500025353; cv=none;
        d=google.com; s=arc-20160816;
        b=C7gGfeg0+qB5yTCTM6dSSWWH3NeSQmTqFKg+YRKFRykrISMd4uKRFAwtrgx27I4gp3
         7wVka0NbB5EwdqciZplKzSuyyZsP6xpGkiLYci5yeVtkp//KH+VzpJDQCgzsfG+TjVdo
         z9m/Le4PhE40u/zgeSDY8KAjgF2VRBN1/puTBD8Axb30OTng7AeZDXHJGbDL+74kLtyb
         tbKmcLkrgtmfegNXkFyoZvjn0d7Ms9qLjQbkL9vtLkbwB+DdeZJpC3yMlrAOORduBuM5
         Kvn/hWUyfCKWOzI3MJC5ETPT1+zE1ZkKlSXMy4mAMbcSJXsIKf0wEJIVSD2lsB8ivUlt
         erjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=cCiSv6ncw1M6sPR725AnDtng4XYMOei34AQ3q1qcw0I=;
        b=DphDtFukO9Qup4bynYhqSDsq4CM3M5i+kkbqARYOz0dnljKgB25NVmo7N0qsGnN+h+
         EOSKe3CNHpom2nPa97sezcnEdq7Oty3l7+kqSoWWvzq0GYvRExQjAxM0fcShRqDfKMWr
         XI08ZM9F+bU3a+etLaxX1jwGguGRgSqwPBCvThowZoaKkYMoZmaITaUC4BwFn5mWzybk
         kzCSDWQfjY1FDMvKFIcSxt0RhfMaTtttQydz3WBk7yUjWoviVx7qUUS23Ty5bRvCmtMW
         pHKGsBDoqOkdW+5dxXH9s1ikvpB2N/cqC/x8LhBkmn5W+ljVxa1i3AAyI+96r/Hmpx8U
         jzIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id x186si1863958wmb.93.2017.07.14.02.42.33;
        Fri, 14 Jul 2017 02:42:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v6E9gT2d010086;
	Fri, 14 Jul 2017 11:42:29 +0200
Received: from localhost (unknown [31.210.188.120])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id 4479A5C8;
	Fri, 14 Jul 2017 11:42:24 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v13 22/26] target/arm: [tcg] Port to tb_stop
Date: Fri, 14 Jul 2017 12:42:23 +0300
Message-Id: <150002534291.22386.13499916738708680298.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
References: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 6nlDhHiS1xOu

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate.c |  165 +++++++++++++++++++++++++-----------------------
 target/arm/translate.h |    1 
 2 files changed, 87 insertions(+), 79 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index c60be757dc..f221cbee5d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11967,7 +11967,7 @@ static target_ulong arm_tr_translate_insn(DisasContextBase *dcbase,
         assert(dc->base.num_insns == 1);
         gen_exception(EXCP_UDEF, syn_swstep(dc->ss_same_el, 0, 0),
                       default_exception_el(dc));
-        dc->base.is_jmp = DISAS_SKIP;
+        dc->base.is_jmp = DISAS_NORETURN;
         return dc->pc;
     }
 
@@ -12019,87 +12019,17 @@ static target_ulong arm_tr_translate_insn(DisasContextBase *dcbase,
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
+    if (dc->base.is_jmp == DISAS_NORETURN) {
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
-    arm_tr_tb_start(&dc->base, cs, &max_insns);
-
-    do {
-        dc->base.num_insns++;
-        arm_tr_insn_start(&dc->base, cs);
-
-        if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
-            CPUBreakpoint *bp;
-            QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
-                if (bp->pc == dc->base.pc_next) {
-                    if (arm_tr_breakpoint_check(&dc->base, cs, bp)) {
-                        break;
-                    }
-                }
-            }
-
-            if (dc->base.is_jmp == DISAS_NORETURN) {
-                break;
-            }
-        }
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
@@ -12203,9 +12133,88 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
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
+    arm_tr_tb_start(&dc->base, cs, &max_insns);
+
+    do {
+        dc->base.num_insns++;
+        arm_tr_insn_start(&dc->base, cs);
+
+        if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
+            CPUBreakpoint *bp;
+            QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
+                if (bp->pc == dc->base.pc_next) {
+                    if (arm_tr_breakpoint_check(&dc->base, cs, bp)) {
+                        break;
+                    }
+                }
+            }
+
+            if (dc->base.is_jmp == DISAS_NORETURN) {
+                break;
+            }
+        }
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
 
-done_generating:
     gen_tb_end(tb, dc->base.num_insns);
 
 #ifdef DEBUG_DISAS
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 83e56dcb08..720cb102e3 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -149,7 +149,6 @@ static void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
  * as opposed to attempting to use lookup_and_goto_ptr.
  */
 #define DISAS_EXIT DISAS_TARGET_11
-#define DISAS_SKIP DISAS_TARGET_12
 
 #ifdef TARGET_AARCH64
 void a64_translate_init(void);
