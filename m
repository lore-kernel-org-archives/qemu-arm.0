Received: by 10.25.227.6 with SMTP id a6csp3088110lfh;
        Wed, 28 Jun 2017 06:53:42 -0700 (PDT)
X-Received: by 10.25.213.83 with SMTP id m80mr4131238lfg.177.1498658022007;
        Wed, 28 Jun 2017 06:53:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498658022; cv=none;
        d=google.com; s=arc-20160816;
        b=ApytZmWGGjdAodbQT/Qy5+eYW5a5VheSv932IpYVtAEA8dEdYxRJa5FlaT6phA8FK+
         1tyQHdTwpIRVNdPRqEnQmDlPuaDp/EEh9qHNbTRUmER8yQ66I6DAiXS7kGfuDHY+XJg+
         Opc2EAJoZOzhb0Yi3shLIW69F5vsAK3heNuueak7agMvL1HgXbcTt7GWnlbAlvrvRdxt
         Y2nkjSkDaz2TJLj79BQP1l8lhYyYcV31PV17O7nLrWNMjVdRCmz3QtGfSwoo6mk3u7+g
         V1AzvDRvKCkDclc0Pxp1ZeiQHWkXOcvk6faxNdM/OurfHahsIiM/mWDJKiBElJjFXNdL
         p1XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=QFmEyIPL60SBaI+EH4u3TdbyFX+wWywO74/Og9U6PPQ=;
        b=HN99epUwnfDveCoA0LrghT+0kLvGCCkG3US6oOtR5xwxTAmvae5KLNzDL3lYA0NO/z
         6F5qN9dFl5dmsg3mD8M63Q7qbdu0MlEHn5gCTIb4L+C8i3jPfoeeYtidOg3JIi97m5Uj
         LbjSxYYxqUmUfWBZWLYJFMeksm/w+Y93AGIFQwRj62GJsc31aPbvTRudeHvOztzJGB7s
         VNRMqC+S9flsiPfftOOD0FeX3oV/NHCyxPcNXFXjQ1xDxTbMKanf2BU33ihheB2QnPAH
         uh5hSvpuBOasu/apYCb8W3wN2cPkuOoEBTZ9iQezdlwmktUSuXlU9nEfP61yk4yLZIeM
         N0WA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id k135si1066666lfg.171.2017.06.28.06.53.41;
        Wed, 28 Jun 2017 06:53:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5SDrcYv028225;
	Wed, 28 Jun 2017 15:53:38 +0200
Received: from localhost (unknown [132.68.50.243])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id E18761E1;
	Wed, 28 Jun 2017 15:53:32 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v11 24/29] target/arm: [tcg,a64] Port to translate_insn
Date: Wed, 28 Jun 2017 16:53:31 +0300
Message-Id: <149865801156.17063.15618379976159104550.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: UIpvoeJqKjl8

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate-a64.c |   74 +++++++++++++++++++++++++++-----------------
 1 file changed, 46 insertions(+), 28 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9c870f6d07..586a01a2de 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11244,6 +11244,9 @@ static void aarch64_trblock_init_disas_context(DisasContextBase *dcbase,
     dc->is_ldex = false;
     dc->ss_same_el = (arm_debug_target_el(env) == dc->current_el);
 
+    dc->next_page_start =
+        (dc->base.pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+
     init_tmp_a64_array(dc);
 }
 
@@ -11278,12 +11281,45 @@ static BreakpointCheckType aarch64_trblock_breakpoint_check(
     }
 }
 
+static target_ulong aarch64_trblock_translate_insn(DisasContextBase *dcbase,
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
+    if (dc->ss_active) {
+        dc->base.is_jmp = DISAS_SS;
+    } else if (dc->pc >= dc->next_page_start) {
+        dc->base.is_jmp = DISAS_PAGE_CROSS;
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
     aarch64_trblock_init_disas_context(&dc->base, cs);
 
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
+        dc->base.pc_next = aarch64_trblock_translate_insn(&dc->base, cs);
 
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
