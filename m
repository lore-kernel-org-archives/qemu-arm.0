Received: by 10.25.227.6 with SMTP id a6csp3084017lfh;
        Wed, 28 Jun 2017 06:49:42 -0700 (PDT)
X-Received: by 10.84.213.8 with SMTP id f8mr12035867pli.22.1498657782225;
        Wed, 28 Jun 2017 06:49:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498657782; cv=none;
        d=google.com; s=arc-20160816;
        b=mLLu5uPm61kud2HqRLTaMJrLjFqwEWSoJqc6P2ycOft2zKMAt/x9uMORhhZRWjTM5P
         gjzYsfEChp4JsFaC+HHJIpMZo8J4tSvA2DBepJI8EhV4pVC4RKuSSGc/KFNIfWno6OzE
         nUYS/XzlTw07ZLSJ/3zkUGKtuRR6+jTgKSnWjP0r1BpYiqT2HTKP4N9PkfdWScU8SkAm
         c16Ljy02JTHCWcS6j1IHsRrS0gvM1Of1pyJqDDqJg3edHcqzQ4bnMOouMDO27+TeGkMf
         I5bPefOkTGMWMULblTsHhU5zvqxlp2Pdwlzb1L/awTtj6VwGA+frKAjCYM69lWGvd+KS
         LrCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=iRVisi7oqRtRZZIOnP/mFnof3FXzOKFV/Lan+eE3UlQ=;
        b=LENCi+Qk8OI7FW9k52WzAY4TRh/MJYAgdvBdC2wcC0WO/7g9AwdFQjpmjkodobXAXl
         EbeoW5FK0YNyUjLXLZ02psmdsW+9jCuiphwAdc7gN2zZUX5Jrvos1c7rK9Si5sIKrHdV
         vGfbD0J3RZlhzz6ah5omF1ULCqq+m0vTxYv+MV0UW/5fI6H67ngq+u+Gn1A/EgxJAg9h
         FG4YHZpm1Z6YVyj+Un2gvJH5ahBZZsXS2L2+854Ybn4X4VOcF1HLANXMJxoSuIqmwwnd
         fdlSPdmt5/h8RGE7fJtd5jjzdlDCaudz1WDUeXGewj0mZI/aqzq+OgqAvdgrzcDRFnnc
         TALQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id 96si1794844pld.107.2017.06.28.06.49.40;
        Wed, 28 Jun 2017 06:49:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5SDnac1028129;
	Wed, 28 Jun 2017 15:49:36 +0200
Received: from localhost (unknown [132.68.50.243])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id D3CD91C4;
	Wed, 28 Jun 2017 15:49:30 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v11 23/29] target/arm: [tcg] Port to translate_insn
Date: Wed, 28 Jun 2017 16:49:29 +0300
Message-Id: <149865776960.17063.4875279139522061160.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: E21z59kXudca

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate.c |  147 +++++++++++++++++++++++++++---------------------
 target/arm/translate.h |    4 +
 2 files changed, 88 insertions(+), 63 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 790eaa2164..7ab09a7e5f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11841,6 +11841,9 @@ static void arm_trblock_init_disas_context(DisasContextBase *dcbase,
     dc->pstate_ss = ARM_TBFLAG_PSTATE_SS(dc->base.tb->flags);
     dc->is_ldex = false;
     dc->ss_same_el = false; /* Can't be true since EL_d must be AArch64 */
+
+    dc->next_page_start =
+        (dc->base.pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
 }
 
 static void arm_trblock_init_globals(DisasContextBase *dcbase, CPUState *cpu)
@@ -11944,14 +11947,82 @@ static BreakpointCheckType arm_trblock_breakpoint_check(
     }
 }
 
+static target_ulong arm_trblock_translate_insn(DisasContextBase *dcbase,
+                                               CPUState *cpu)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+    CPUARMState *env = cpu->env_ptr;
+
+    if (dc->ss_active && !dc->pstate_ss) {
+        /* Singlestep state is Active-pending.
+         * If we're in this state at the start of a TB then either
+         *  a) we just took an exception to an EL which is being debugged
+         *     and this is the first insn in the exception handler
+         *  b) debug exceptions were masked and we just unmasked them
+         *     without changing EL (eg by clearing PSTATE.D)
+         * In either case we're going to take a swstep exception in the
+         * "did not step an insn" case, and so the syndrome ISV and EX
+         * bits should be zero.
+         */
+        assert(dc->base.num_insns == 1);
+        gen_exception(EXCP_UDEF, syn_swstep(dc->ss_same_el, 0, 0),
+                      default_exception_el(dc));
+        dc->base.is_jmp = DISAS_SKIP;
+        return dc->pc;
+    }
+
+    if (dc->thumb) {
+        disas_thumb_insn(env, dc);
+        if (dc->condexec_mask) {
+            dc->condexec_cond = (dc->condexec_cond & 0xe)
+                | ((dc->condexec_mask >> 4) & 1);
+            dc->condexec_mask = (dc->condexec_mask << 1) & 0x1f;
+            if (dc->condexec_mask == 0) {
+                dc->condexec_cond = 0;
+            }
+        }
+    } else {
+        unsigned int insn = arm_ldl_code(env, dc->pc, dc->sctlr_b);
+        dc->pc += 4;
+        disas_arm_insn(dc, insn);
+    }
+
+    if (dc->condjmp && !dc->base.is_jmp) {
+        gen_set_label(dc->condlabel);
+        dc->condjmp = 0;
+    }
+
+
+    /* Translation stops when a conditional branch is encountered.
+     * Otherwise the subsequent code could get translated several times.
+     * Also stop translation when a page boundary is reached.  This
+     * ensures prefetch aborts occur at the right place.  */
+
+    if (is_singlestepping(dc)) {
+        dc->base.is_jmp = DISAS_SS;
+    } else if ((dc->pc >= dc->next_page_start) ||
+               ((dc->pc >= dc->next_page_start - 3) &&
+                insn_crosses_page(env, dc))) {
+        /* We want to stop the TB if the next insn starts in a new page,
+         * or if it spans between this page and the next. This means that
+         * if we're looking at the last halfword in the page we need to
+         * see if it's a 16-bit Thumb insn (which will fit in this TB)
+         * or a 32-bit Thumb insn (which won't).
+         * This is to avoid generating a silly TB with a single 16-bit insn
+         * in it at the end of this page (which would execute correctly
+         * but isn't very efficient).
+         */
+        return DISAS_PAGE_CROSS;
+    }
+
+    return dc->pc;
+}
+
 /* generate intermediate code for basic block 'tb'.  */
 void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
 {
-    CPUARMState *env = cpu->env_ptr;
     DisasContext dc1, *dc = &dc1;
-    target_ulong next_page_start;
     int max_insns;
-    bool end_of_page;
 
     /* generate intermediate code */
 
@@ -11973,7 +12044,6 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
 
 
     arm_trblock_init_globals(&dc->base, cpu);
-    next_page_start = (dc->base.pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
     max_insns = tb->cflags & CF_COUNT_MASK;
     if (max_insns == 0) {
         max_insns = CF_COUNT_MASK;
@@ -12024,72 +12094,20 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
             gen_io_start();
         }
 
-        if (dc->ss_active && !dc->pstate_ss) {
-            /* Singlestep state is Active-pending.
-             * If we're in this state at the start of a TB then either
-             *  a) we just took an exception to an EL which is being debugged
-             *     and this is the first insn in the exception handler
-             *  b) debug exceptions were masked and we just unmasked them
-             *     without changing EL (eg by clearing PSTATE.D)
-             * In either case we're going to take a swstep exception in the
-             * "did not step an insn" case, and so the syndrome ISV and EX
-             * bits should be zero.
-             */
-            assert(dc->base.num_insns == 1);
-            gen_exception(EXCP_UDEF, syn_swstep(dc->ss_same_el, 0, 0),
-                          default_exception_el(dc));
-            goto done_generating;
-        }
-
-        if (dc->thumb) {
-            disas_thumb_insn(env, dc);
-            if (dc->condexec_mask) {
-                dc->condexec_cond = (dc->condexec_cond & 0xe)
-                                   | ((dc->condexec_mask >> 4) & 1);
-                dc->condexec_mask = (dc->condexec_mask << 1) & 0x1f;
-                if (dc->condexec_mask == 0) {
-                    dc->condexec_cond = 0;
-                }
-            }
-        } else {
-            unsigned int insn = arm_ldl_code(env, dc->pc, dc->sctlr_b);
-            dc->pc += 4;
-            disas_arm_insn(dc, insn);
-        }
-
-        if (dc->condjmp && !dc->base.is_jmp) {
-            gen_set_label(dc->condlabel);
-            dc->condjmp = 0;
-        }
+        dc->base.pc_next = arm_trblock_translate_insn(&dc->base, cpu);
 
         if (tcg_check_temp_count()) {
             fprintf(stderr, "TCG temporary leak before "TARGET_FMT_lx"\n",
                     dc->pc);
         }
 
-        /* Translation stops when a conditional branch is encountered.
-         * Otherwise the subsequent code could get translated several times.
-         * Also stop translation when a page boundary is reached.  This
-         * ensures prefetch aborts occur at the right place.  */
-
-        /* We want to stop the TB if the next insn starts in a new page,
-         * or if it spans between this page and the next. This means that
-         * if we're looking at the last halfword in the page we need to
-         * see if it's a 16-bit Thumb insn (which will fit in this TB)
-         * or a 32-bit Thumb insn (which won't).
-         * This is to avoid generating a silly TB with a single 16-bit insn
-         * in it at the end of this page (which would execute correctly
-         * but isn't very efficient).
-         */
-        end_of_page = (dc->pc >= next_page_start) ||
-            ((dc->pc >= next_page_start - 3) && insn_crosses_page(env, dc));
-
-    } while (!dc->base.is_jmp && !tcg_op_buf_full() &&
-             !is_singlestepping(dc) &&
-             !singlestep &&
-             !end_of_page &&
-             dc->base.num_insns < max_insns);
+        if (!dc->base.is_jmp && (tcg_op_buf_full() || singlestep ||
+                            dc->base.num_insns >= max_insns)) {
+            dc->base.is_jmp = DISAS_TOO_MANY;
+        }
+    } while (!dc->base.is_jmp);
 
+    if (dc->base.is_jmp != DISAS_SKIP) {
     if (tb->cflags & CF_LAST_IO) {
         if (dc->condjmp) {
             /* FIXME:  This can theoretically happen with self-modifying
@@ -12127,6 +12145,7 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
             gen_exception(EXCP_SMC, syn_aa32_smc(), 3);
             break;
         case DISAS_NEXT:
+        case DISAS_TOO_MANY:
         case DISAS_UPDATE:
             gen_set_pc_im(dc, dc->pc);
             /* fall through */
@@ -12145,6 +12164,7 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
          */
         switch(dc->base.is_jmp) {
         case DISAS_NEXT:
+        case DISAS_TOO_MANY:
             gen_goto_tb(dc, 1, dc->pc);
             break;
         case DISAS_UPDATE:
@@ -12198,6 +12218,7 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
             gen_goto_tb(dc, 1, dc->pc);
         }
     }
+    }
 
 done_generating:
     gen_tb_end(tb, dc->base.num_insns);
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 6fe40a344a..f830775540 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -9,6 +9,7 @@ typedef struct DisasContext {
     DisasContextBase base;
 
     target_ulong pc;
+    target_ulong next_page_start;
     uint32_t insn;
     /* Nonzero if this instruction has been conditionally skipped.  */
     int condjmp;
@@ -148,6 +149,9 @@ static void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
  * as opposed to attempting to use lookup_and_goto_ptr.
  */
 #define DISAS_EXIT DISAS_TARGET_11
+#define DISAS_SS   DISAS_TARGET_12
+#define DISAS_PAGE_CROSS DISAS_TARGET_13
+#define DISAS_SKIP DISAS_TARGET_14
 
 #ifdef TARGET_AARCH64
 void a64_translate_init(void);
