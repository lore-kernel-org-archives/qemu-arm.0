Received: by 10.25.15.197 with SMTP id 66csp917356lfp;
        Sun, 25 Jun 2017 03:16:42 -0700 (PDT)
X-Received: by 10.46.32.16 with SMTP id g16mr3167880ljg.125.1498385802264;
        Sun, 25 Jun 2017 03:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498385802; cv=none;
        d=google.com; s=arc-20160816;
        b=iS979pGuAg5R+FAWdCr0hC5wzMivxR7Kc91PFcRYxE5DZcGL+zt8oOg+Ku4/DDL1e5
         5G/l5fGU37J00/Gf3l8hp9zTE+QBRK3+HWFzOkNk9t6xZbgMH/W8bh7RIR4oTn4VL3mW
         xIvHA8urkJZNXFw+EGJB66nXn/keh2K8gu32EgcLOQXORGSoi7USsj7VTLgvBlL3/p8s
         fjYDddOB/8EgxX9gomr9VYrkqKKjvyN9B4EsjiqanMzXl3X6WYquei1aXGGbLaAmKzF0
         y6SR+zRBXCIkviGuwi17XdUpaOsV3ou1URRMAm3WBV4cxcKYJQGQw4f7D1j2klqko0qa
         O4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=/WeRLZVEX/1KtRDztuiz7zMGPdR8ShCiFHHYK2eZmlU=;
        b=yHbrL++Am9fZUXP1Cl04Zh09EsvKAtApt+tBoQc0z5mDgA4tFItRb68WGZOB4r6Tm6
         GJcVbg9GcVjC19z8rqhAgvAnHT/dLblmJfZgAdpyiJYoVPkjo21ZRpi7Sxn0Y6NWVQ5Y
         WaQHNGuzgrNe289EDkezaEjyOyjLPkXKktk6F3HUQQeEVy1HJ/kRVClK6YrbNLhqD2IP
         oGw6i2pOG+kB7tcRjh4f39dNZBnssT/vwR8WnItl/GTKcxpKZAStANErTVInYAFD2eYZ
         6X5fCJ6jx7saV7fEegvrcKMa1318m2pjLLZCR/kaYHFDCQgXAPbrwjHjDCeEazbBbvtj
         Sz2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id p186si5026471lfe.195.2017.06.25.03.16.41;
        Sun, 25 Jun 2017 03:16:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5PAGeS6020598;
	Sun, 25 Jun 2017 12:16:40 +0200
Received: from localhost (unknown [132.68.53.125])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 274BABDD;
	Sun, 25 Jun 2017 12:16:35 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v9 23/26] target: [tcg,arm] Port to disas_insn
Date: Sun, 25 Jun 2017 13:16:34 +0300
Message-Id: <149838579383.6497.17576888439862233362.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
References: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: pljtM+IRaGjL

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate-a64.c |   73 ++++++++++++++--------
 target/arm/translate.c     |  144 +++++++++++++++++++++++++-------------------
 target/arm/translate.h     |    4 +
 3 files changed, 131 insertions(+), 90 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 4321767355..f618a15062 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11256,6 +11256,8 @@ static void aarch64_trblock_init_disas_context(DisasContextBase *db,
     dc->is_ldex = false;
     dc->ss_same_el = (arm_debug_target_el(env) == dc->current_el);
 
+    dc->next_page_start = (db->pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+
     init_tmp_a64_array(dc);
 }
 
@@ -11290,13 +11292,46 @@ static BreakpointCheckType aarch64_trblock_breakpoint_check(
     }
 }
 
+static target_ulong aarch64_trblock_disas_insn(DisasContextBase *db,
+                                               CPUState *cpu)
+{
+    DisasContext *dc = container_of(db, DisasContext, base);
+    CPUARMState *env = cpu->env_ptr;
+
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
+        assert(db->num_insns == 1);
+        gen_exception(EXCP_UDEF, syn_swstep(dc->ss_same_el, 0, 0),
+                      default_exception_el(dc));
+        db->is_jmp = DJ_EXC;
+    } else {
+        disas_a64_insn(env, dc);
+    }
+
+    if (dc->ss_active) {
+        db->is_jmp = DJ_SS;
+    } else if (dc->pc >= dc->next_page_start) {
+        db->is_jmp = DJ_PAGE_CROSS;
+    }
+
+    return dc->pc;
+}
+
 void gen_intermediate_code_a64(DisasContextBase *db, ARMCPU *cpu,
                                TranslationBlock *tb)
 {
     CPUState *cs = CPU(cpu);
-    CPUARMState *env = &cpu->env;
     DisasContext *dc = container_of(db, DisasContext, base);
-    target_ulong next_page_start;
     int max_insns;
     CPUBreakpoint *bp;
 
@@ -11308,7 +11343,6 @@ void gen_intermediate_code_a64(DisasContextBase *db, ARMCPU *cpu,
     db->singlestep_enabled = cs->singlestep_enabled;
     aarch64_trblock_init_disas_context(db, cs);
 
-    next_page_start = (db->pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
     max_insns = tb->cflags & CF_COUNT_MASK;
     if (max_insns == 0) {
         max_insns = CF_COUNT_MASK;
@@ -11348,42 +11382,24 @@ void gen_intermediate_code_a64(DisasContextBase *db, ARMCPU *cpu,
             gen_io_start(cpu_env);
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
-            assert(db->num_insns == 1);
-            gen_exception(EXCP_UDEF, syn_swstep(dc->ss_same_el, 0, 0),
-                          default_exception_el(dc));
-            db->is_jmp = DJ_EXC;
-            break;
-        }
-
-        disas_a64_insn(env, dc);
+        db->pc_next = aarch64_trblock_disas_insn(db, cs);
 
         if (tcg_check_temp_count()) {
             fprintf(stderr, "TCG temporary leak before "TARGET_FMT_lx"\n",
                     dc->pc);
         }
 
+        if (!db->is_jmp && (tcg_op_buf_full() || cs->singlestep_enabled ||
+                            singlestep || db->num_insns >= max_insns)) {
+            db->is_jmp = DJ_TOO_MANY;
+        }
+
         /* Translation stops when a conditional branch is encountered.
          * Otherwise the subsequent code could get translated several times.
          * Also stop translation when a page boundary is reached.  This
          * ensures prefetch aborts occur at the right place.
          */
-    } while (!db->is_jmp && !tcg_op_buf_full() &&
-             !cs->singlestep_enabled &&
-             !singlestep &&
-             !dc->ss_active &&
-             dc->pc < next_page_start &&
-             db->num_insns < max_insns);
+    } while (!db->is_jmp);
 
     if (tb->cflags & CF_LAST_IO) {
         gen_io_end(cpu_env);
@@ -11410,6 +11426,7 @@ void gen_intermediate_code_a64(DisasContextBase *db, ARMCPU *cpu,
         unsigned int is_jmp = (unsigned int)db->is_jmp;
         switch (is_jmp) {
         case DJ_NEXT:
+        case DJ_TOO_MANY:
             gen_goto_tb(dc, 1, dc->pc);
             break;
         default:
diff --git a/target/arm/translate.c b/target/arm/translate.c
index a7fcaf2a21..f4c57ed078 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11877,6 +11877,8 @@ static void arm_trblock_init_disas_context(DisasContextBase *db, CPUState *cpu)
     dc->pstate_ss = ARM_TBFLAG_PSTATE_SS(db->tb->flags);
     dc->is_ldex = false;
     dc->ss_same_el = false; /* Can't be true since EL_d must be AArch64 */
+
+    dc->next_page_start = (db->pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
 }
 
 static void arm_trblock_init_globals(DisasContextBase *db, CPUState *cpu)
@@ -11981,6 +11983,76 @@ static BreakpointCheckType arm_trblock_breakpoint_check(DisasContextBase *db,
     }
 }
 
+static target_ulong arm_trblock_disas_insn(DisasContextBase *db, CPUState *cpu)
+{
+    DisasContext *dc = container_of(db, DisasContext, base);
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
+        assert(db->num_insns == 1);
+        gen_exception(EXCP_UDEF, syn_swstep(dc->ss_same_el, 0, 0),
+                      default_exception_el(dc));
+        db->is_jmp = DJ_SKIP;
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
+    if (dc->condjmp && !db->is_jmp) {
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
+        db->is_jmp = DJ_SS;
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
+        return DJ_PAGE_CROSS;
+    }
+
+    return dc->pc;
+}
+
 /* generate intermediate code for basic block 'tb'.  */
 void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
 {
@@ -11988,9 +12060,7 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
     ARMCPU *arm_cpu = arm_env_get_cpu(env);
     DisasContext dc1, *dc = &dc1;
     DisasContextBase *db = &dc->base;
-    target_ulong next_page_start;
     int max_insns;
-    bool end_of_page;
     CPUBreakpoint *bp;
 
     /* generate intermediate code */
@@ -12013,7 +12083,6 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
 
 
     arm_trblock_init_globals(db, cpu);
-    next_page_start = (db->pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
     max_insns = tb->cflags & CF_COUNT_MASK;
     if (max_insns == 0) {
         max_insns = CF_COUNT_MASK;
@@ -12054,72 +12123,20 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
             gen_io_start(cpu_env);
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
-            assert(db->num_insns == 1);
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
-        if (dc->condjmp && !db->is_jmp) {
-            gen_set_label(dc->condlabel);
-            dc->condjmp = 0;
-        }
+        db->pc_next = arm_trblock_disas_insn(db, cpu);
 
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
-    } while (!db->is_jmp && !tcg_op_buf_full() &&
-             !is_singlestepping(dc) &&
-             !singlestep &&
-             !end_of_page &&
-             db->num_insns < max_insns);
+        if (!db->is_jmp && (tcg_op_buf_full() || singlestep ||
+                            db->num_insns >= max_insns)) {
+            db->is_jmp = DJ_TOO_MANY;
+        }
+    } while (!db->is_jmp);
 
+    if (db->is_jmp != DJ_SKIP) {
     if (tb->cflags & CF_LAST_IO) {
         if (dc->condjmp) {
             /* FIXME:  This can theoretically happen with self-modifying
@@ -12159,6 +12176,7 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
             gen_exception(EXCP_SMC, syn_aa32_smc(), 3);
             break;
         case DJ_NEXT:
+        case DJ_TOO_MANY:
         case DJ_UPDATE:
             gen_set_pc_im(dc, dc->pc);
             /* fall through */
@@ -12179,6 +12197,7 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
          */
         switch (is_jmp) {
         case DJ_NEXT:
+        case DJ_TOO_MANY:
             gen_goto_tb(dc, 1, dc->pc);
             break;
         case DJ_UPDATE:
@@ -12232,6 +12251,7 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
             gen_goto_tb(dc, 1, dc->pc);
         }
     }
+    }
 
 done_generating:
     gen_tb_end(tb, db->num_insns);
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 190d461134..43e8b555e3 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -6,6 +6,7 @@ typedef struct DisasContext {
     DisasContextBase base;
 
     target_ulong pc;
+    target_ulong next_page_start;
     uint32_t insn;
     /* Nonzero if this instruction has been conditionally skipped.  */
     int condjmp;
@@ -145,6 +146,9 @@ static void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
  * as opposed to attempting to use lookup_and_goto_ptr.
  */
 #define DJ_EXIT (DJ_TARGET + 11)
+#define DJ_SS   (DJ_TARGET + 12)
+#define DJ_PAGE_CROSS (DJ_TARGET + 13)
+#define DJ_SKIP (DJ_TARGET + 14)
 
 #ifdef TARGET_AARCH64
 void a64_translate_init(void);
