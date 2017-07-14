Received: by 10.25.44.15 with SMTP id s15csp683933lfs;
        Fri, 14 Jul 2017 02:34:29 -0700 (PDT)
X-Received: by 10.28.147.200 with SMTP id v191mr2240391wmd.95.1500024868988;
        Fri, 14 Jul 2017 02:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500024868; cv=none;
        d=google.com; s=arc-20160816;
        b=evTrpNRYHlOsQ0ORJ9deCO7CJRwYbFOcG2I1HAfgPexvZkfmlgUGSFfvZfzDSdHaTt
         SAoCSnDujE0N5y6Cp1WCjfAPJMXyfvRFayhIUpX0zWQbS2BuZ+d9k93HQnQqPl6Myv35
         SSWvZ11LGIugr2NDzwIXATk9C2epDfB0vQOaXbSaB9txH4cfH2/iyuMwAbxof9iXZlhS
         PrrCM0Gxt2Z8lG6jzr+1dJ+rcjzzEKMB5drnZ1n6MUsNL+sJuTQdAASpMBjnvePp+A/N
         fr0oNrtv+1esSMkBGzYc3oiKfc0KhwghLKnSuDx2lgVymsloUHoCcDW7wqiJtw1a8pcx
         teRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=vb4iUphm857PG1uV7L8Zs/GlnJNzI0h/hT2Q9tTaulw=;
        b=D3OqY2E7IdGhK+FwidXJ9RDe/KxhIPCT8ZS4gJEuZMDfCsyLDDC4YB3I0Etbw4tXyp
         Ikax3niC3uNyk6Jj6bwD+Ij+QXSpoPjWBNhkTcUbHKoYwO4adB3AYUEa6CldPaOVw0uG
         s1cSc+FsfLjd8+56UKyhyg4Qwx8rR/vi9CFjpXEWhFm44GKLysbUyjwttbzI+Tt2+4SQ
         oYfFioF+eEhdyXJtVoIyL17nxF2Hm5R31a0jJJv4ZO8dXRGvVhxDLxfnSj41Ilqntq+6
         axtAllvSdd/DfhPgHQh5el3x/EyV1Kyj2VQP1WHXkbEtVnxfxXZa/mKmNIGSvdFNbCKO
         1heA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id 20si1784113wma.1.2017.07.14.02.34.28;
        Fri, 14 Jul 2017 02:34:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v6E9YPLP009839;
	Fri, 14 Jul 2017 11:34:25 +0200
Received: from localhost (unknown [31.210.188.120])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 035AB1A7;
	Fri, 14 Jul 2017 11:34:19 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v13 20/26] target/arm: [tcg] Port to translate_insn
Date: Fri, 14 Jul 2017 12:34:18 +0300
Message-Id: <150002485863.22386.13949856269576226529.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
References: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: UtUQPkec71p5

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate.c |  148 ++++++++++++++++++++++++++++--------------------
 target/arm/translate.h |    2 +
 2 files changed, 87 insertions(+), 63 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 55bef09739..c60be757dc 100644
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
@@ -11944,14 +11947,83 @@ static bool arm_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
     return true;
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
 
@@ -11971,7 +12043,6 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
     dc->base.singlestep_enabled = cs->singlestep_enabled;
     arm_tr_init_disas_context(&dc->base, cs);
 
-    next_page_start = (dc->base.pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
     max_insns = tb->cflags & CF_COUNT_MASK;
     if (max_insns == 0) {
         max_insns = CF_COUNT_MASK;
@@ -12008,72 +12079,20 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
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
@@ -12111,6 +12130,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
             gen_exception(EXCP_SMC, syn_aa32_smc(), 3);
             break;
         case DISAS_NEXT:
+        case DISAS_TOO_MANY:
         case DISAS_UPDATE:
             gen_set_pc_im(dc, dc->pc);
             /* fall through */
@@ -12129,6 +12149,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
          */
         switch(dc->base.is_jmp) {
         case DISAS_NEXT:
+        case DISAS_TOO_MANY:
             gen_goto_tb(dc, 1, dc->pc);
             break;
         case DISAS_UPDATE:
@@ -12182,6 +12203,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
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
