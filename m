Received: by 10.25.44.15 with SMTP id s15csp82913lfs;
        Fri, 7 Jul 2017 06:06:49 -0700 (PDT)
X-Received: by 10.223.172.15 with SMTP id v15mr809935wrc.84.1499432809753;
        Fri, 07 Jul 2017 06:06:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499432809; cv=none;
        d=google.com; s=arc-20160816;
        b=PqsSrWhlMU8m/fybi9yvrNZIqWhdH7wPsBV2MF/gbs7c83eiVhpofEhKrZiF5q3i3s
         WOYAfJUqd8Q1J9SKTV0McmFIvSzBFLUB1Y73ROvHELx7qnxNsCoWTEJRdxbkHkUiCw7B
         maCxkSK5wH3PdwyqhSnyqxzBq5JxLV/pJ7/b05TbQ79jb4t4IJ9tPHBCQOZNs2QIDsbA
         VJ67iOWLUGjPmj+0pvhzzKE8BYjwCCXnjJDqUdsJ7ae2A92yWzlr7NsB0CAB0RA0evjm
         H0cNPoZk0L6plpmwUXt8NBNGw1c5jgW/4gkkS9x1vVkvBnyFe1k16YFe54BjVS9B8fGp
         2deQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=Nnmqh3tCZhe0euzAUX7Z/OU1gq9tGRZ0g0WRIz1H1mQ=;
        b=S+67pSABGvkTiTJs9pEU61I6uWONV9RS5f3yW0tOtHdOxVzq10RyT5+f96tkr2XyVf
         GXP84Rqkkcs9gYRsHBfMIGSXEtlU1AcoKVxFZKAIWobIGXCB9yR0IkogKFd06ErdDq/L
         yhbX31EdgXd2ZRFa20AN09PpbLVOnh/DBU569Z4baSZCwkIcQaBLM2ai25tJQL+lF07F
         d48Dx8e5DR/w6JISixYH+GB8gXAv29WSNEF0/Co7xaJY6pbCYQbSjwE83z0stDrGE2LN
         MGAE2kHDYX5VszPOPEIfGbzhIW6QV092jy1Byob4q+zIYoTzbyAmtFZaLJPw8bnqG+c8
         O1Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id d205si2946707wmf.195.2017.07.07.06.06.49;
        Fri, 07 Jul 2017 06:06:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v67D6kOI022369;
	Fri, 7 Jul 2017 15:06:46 +0200
Received: from localhost (63.red-83-51-187.dynamicip.rima-tde.net [83.51.187.63])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 42041269;
	Fri,  7 Jul 2017 15:06:41 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v12 21/27] target/arm: [tcg] Port to translate_insn
Date: Fri,  7 Jul 2017 15:06:35 +0200
Message-Id: <149943279497.8972.16033572732296843579.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <149942760788.8972.474351671751194003.stgit@frigg.lan>
References: <149942760788.8972.474351671751194003.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: LXrfGvtgfYGB

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate.c |  148 ++++++++++++++++++++++++++++--------------------
 target/arm/translate.h |    2 +
 2 files changed, 87 insertions(+), 63 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 29428b2920..9d033f2fb7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11842,6 +11842,9 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase,
     dc->is_ldex = false;
     dc->ss_same_el = false; /* Can't be true since EL_d must be AArch64 */
 
+    dc->next_page_start =
+        (dc->base.pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+
 
     cpu_F0s = tcg_temp_new_i32();
     cpu_F1s = tcg_temp_new_i32();
@@ -11942,14 +11945,83 @@ static BreakpointCheckType arm_tr_breakpoint_check(
     }
 }
 
+static target_ulong arm_tr_translate_insn(DisasContextBase *dcbase,
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
+    if (dc->base.is_jmp == DISAS_NEXT) {
+        /* Translation stops when a conditional branch is encountered.
+         * Otherwise the subsequent code could get translated several times.
+         * Also stop translation when a page boundary is reached.  This
+         * ensures prefetch aborts occur at the right place.  */
+
+        if (is_singlestepping(dc)) {
+            dc->base.is_jmp = DISAS_TOO_MANY;
+        } else if ((dc->pc >= dc->next_page_start) ||
+                   ((dc->pc >= dc->next_page_start - 3) &&
+                    insn_crosses_page(env, dc))) {
+            /* We want to stop the TB if the next insn starts in a new page,
+             * or if it spans between this page and the next. This means that
+             * if we're looking at the last halfword in the page we need to
+             * see if it's a 16-bit Thumb insn (which will fit in this TB)
+             * or a 32-bit Thumb insn (which won't).
+             * This is to avoid generating a silly TB with a single 16-bit insn
+             * in it at the end of this page (which would execute correctly
+             * but isn't very efficient).
+             */
+            dc->base.is_jmp = DISAS_TOO_MANY;
+        }
+    }
+
+    return dc->pc;
+}
+
 /* generate intermediate code for basic block 'tb'.  */
 void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
 {
-    CPUARMState *env = cs->env_ptr;
     DisasContext dc1, *dc = &dc1;
-    target_ulong next_page_start;
     int max_insns;
-    bool end_of_page;
 
     /* generate intermediate code */
 
@@ -11969,7 +12041,6 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
     dc->base.singlestep_enabled = cs->singlestep_enabled;
     arm_tr_init_disas_context(&dc->base, cs);
 
-    next_page_start = (dc->base.pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
     max_insns = tb->cflags & CF_COUNT_MASK;
     if (max_insns == 0) {
         max_insns = CF_COUNT_MASK;
@@ -12020,72 +12091,20 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
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
+        dc->base.pc_next = arm_tr_translate_insn(&dc->base, cs);
 
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
@@ -12123,6 +12142,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
             gen_exception(EXCP_SMC, syn_aa32_smc(), 3);
             break;
         case DISAS_NEXT:
+        case DISAS_TOO_MANY:
         case DISAS_UPDATE:
             gen_set_pc_im(dc, dc->pc);
             /* fall through */
@@ -12141,6 +12161,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
          */
         switch(dc->base.is_jmp) {
         case DISAS_NEXT:
+        case DISAS_TOO_MANY:
             gen_goto_tb(dc, 1, dc->pc);
             break;
         case DISAS_UPDATE:
@@ -12194,6 +12215,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
             gen_goto_tb(dc, 1, dc->pc);
         }
     }
+    }
 
 done_generating:
     gen_tb_end(tb, dc->base.num_insns);
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 6fe40a344a..83e56dcb08 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -9,6 +9,7 @@ typedef struct DisasContext {
     DisasContextBase base;
 
     target_ulong pc;
+    target_ulong next_page_start;
     uint32_t insn;
     /* Nonzero if this instruction has been conditionally skipped.  */
     int condjmp;
@@ -148,6 +149,7 @@ static void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
  * as opposed to attempting to use lookup_and_goto_ptr.
  */
 #define DISAS_EXIT DISAS_TARGET_11
+#define DISAS_SKIP DISAS_TARGET_12
 
 #ifdef TARGET_AARCH64
 void a64_translate_init(void);
