Received: by 10.25.44.15 with SMTP id s15csp88439lfs;
        Fri, 7 Jul 2017 06:10:57 -0700 (PDT)
X-Received: by 10.28.10.131 with SMTP id 125mr2305215wmk.28.1499433057159;
        Fri, 07 Jul 2017 06:10:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499433057; cv=none;
        d=google.com; s=arc-20160816;
        b=NXglq/uszx5H85EQY/wELceEFQtAxMza2D9Ah0rZCdMwf8oSwxH2X2pAadN+C56L0G
         SXwz1kAcCbiV/6nqVIIculYXHtzcPQOvMg0ljcYKAZlQW+XDu5Yuem3j9pO9MpQcaFPG
         zBu1zBU3sIy4x6SiCrd2+FrEx/pDqiMdYODAnAxhazGTm7/ldtuRtFJjiJh3uYp/OyMV
         qLWuaVUK0Di35aGDatUGJtEECPNlidcSthCZP5eyaPXSMMqezwz6tO7tQNf3+hu+++0I
         2Yd6+hnwP/ntd+w9GTm1U/T6K0dflsDkyOy/JTqTBIHj2HJZsVwD3YwAJKrPyj/OP/cL
         yj/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=ANLeb7+fkcfakFSMpIsW5b1qbkdwVj7PRxAeoz/Aerk=;
        b=yc8VE5NwC0iSstL0fGHKG3vFKM+k5gS4w1Sr/vA6+zCSdHeg+SzCQscIN0Y+G3+NP8
         +e7olSYKJ1WwzQKn5unbNeVMEjxPsIog2u+YU0opOVAQyQxEN384AJnO7cmNct+lfPhz
         aJjfSx4LlVEsemHuVFyawhmuGXASRYq8xpQ6LHNIXJYMOW9j01+VM65SS04++6R7i3mH
         0PvQxvkEiP7H9ulp8abBPMMtmVTvCi/NofoRt9xFg1CGjPcDkKi98mzR56Nom8EYfOi4
         mFkIfIQkRvpnphNsxde5j1DKybn/8lOInfrDRgST4Va3SiZycdOB9IEaIj5sjRuMGvkE
         OzgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id m14si2081819wrb.32.2017.07.07.06.10.56;
        Fri, 07 Jul 2017 06:10:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v67DAroO022456;
	Fri, 7 Jul 2017 15:10:53 +0200
Received: from localhost (63.red-83-51-187.dynamicip.rima-tde.net [83.51.187.63])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id F0F28456;
	Fri,  7 Jul 2017 15:10:47 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v12 22/27] target/arm: [tcg,a64] Port to translate_insn
Date: Fri,  7 Jul 2017 15:10:42 +0200
Message-Id: <149943304189.8972.11359609778243205068.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <149942760788.8972.474351671751194003.stgit@frigg.lan>
References: <149942760788.8972.474351671751194003.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: GJ0acp5iq0xE

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate-a64.c |   74 +++++++++++++++++++++++++++-----------------
 1 file changed, 46 insertions(+), 28 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a32f07f4bd..c4cb9afb02 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11244,6 +11244,9 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->is_ldex = false;
     dc->ss_same_el = (arm_debug_target_el(env) == dc->current_el);
 
+    dc->next_page_start =
+        (dc->base.pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+
     init_tmp_a64_array(dc);
 }
 
@@ -11278,12 +11281,45 @@ static BreakpointCheckType aarch64_tr_breakpoint_check(
     }
 }
 
+static target_ulong aarch64_tr_translate_insn(DisasContextBase *dcbase,
+                                                   CPUState *cpu)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
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
+        assert(dc->base.num_insns == 1);
+        gen_exception(EXCP_UDEF, syn_swstep(dc->ss_same_el, 0, 0),
+                      default_exception_el(dc));
+        dc->base.is_jmp = DISAS_EXC;
+    } else {
+        disas_a64_insn(env, dc);
+    }
+
+    if (dc->base.is_jmp == DISAS_NEXT) {
+        if (dc->ss_active || dc->pc >= dc->next_page_start) {
+            dc->base.is_jmp = DISAS_TOO_MANY;
+        }
+    }
+
+    return dc->pc;
+}
+
 void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
                                TranslationBlock *tb)
 {
-    CPUARMState *env = cs->env_ptr;
     DisasContext *dc = container_of(dcbase, DisasContext, base);
-    target_ulong next_page_start;
     int max_insns;
 
     dc->base.tb = tb;
@@ -11294,7 +11330,6 @@ void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
     dc->base.singlestep_enabled = cs->singlestep_enabled;
     aarch64_tr_init_disas_context(&dc->base, cs);
 
-    next_page_start = (dc->base.pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
     max_insns = dc->base.tb->cflags & CF_COUNT_MASK;
     if (max_insns == 0) {
         max_insns = CF_COUNT_MASK;
@@ -11344,42 +11379,24 @@ void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
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
-            dc->base.is_jmp = DISAS_EXC;
-            break;
-        }
-
-        disas_a64_insn(env, dc);
+        dc->base.pc_next = aarch64_tr_translate_insn(&dc->base, cs);
 
         if (tcg_check_temp_count()) {
             fprintf(stderr, "TCG temporary leak before "TARGET_FMT_lx"\n",
                     dc->pc);
         }
 
+        if (!dc->base.is_jmp && (tcg_op_buf_full() || cs->singlestep_enabled ||
+                            singlestep || dc->base.num_insns >= max_insns)) {
+            dc->base.is_jmp = DISAS_TOO_MANY;
+        }
+
         /* Translation stops when a conditional branch is encountered.
          * Otherwise the subsequent code could get translated several times.
          * Also stop translation when a page boundary is reached.  This
          * ensures prefetch aborts occur at the right place.
          */
-    } while (!dc->base.is_jmp && !tcg_op_buf_full() &&
-             !cs->singlestep_enabled &&
-             !singlestep &&
-             !dc->ss_active &&
-             dc->pc < next_page_start &&
-             dc->base.num_insns < max_insns);
+    } while (!dc->base.is_jmp);
 
     if (dc->base.tb->cflags & CF_LAST_IO) {
         gen_io_end();
@@ -11404,6 +11421,7 @@ void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
     } else {
         switch (dc->base.is_jmp) {
         case DISAS_NEXT:
+        case DISAS_TOO_MANY:
             gen_goto_tb(dc, 1, dc->pc);
             break;
         default:
