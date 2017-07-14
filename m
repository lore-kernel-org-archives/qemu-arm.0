Received: by 10.25.44.15 with SMTP id s15csp687729lfs;
        Fri, 14 Jul 2017 02:38:30 -0700 (PDT)
X-Received: by 10.223.141.131 with SMTP id o3mr3767267wrb.110.1500025110847;
        Fri, 14 Jul 2017 02:38:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500025110; cv=none;
        d=google.com; s=arc-20160816;
        b=HLhUNyEhsHny4fEy4w56ACZCWUs0lllG+i0RXQVwULeOmYpmcOf3iSbJt/xEXiO0N5
         eJkOtiW4zBXlwErWY05UsB+ui0BrB7W6EO/uNHAWn7UsgF4gwKoOhpBVAy/8TKjw0hWy
         BxUsoM5YHjJUZodDoS1wYOqO9a/G/0wdfuqrjIl/oOQGWlnqbgz3QeOo4dpslnJfCd4c
         koA2GurLNtQut2M2nsbYz4RY/wdUIG5wCL1RvH9dB3FgT2BxN/4IF9V1GmKDQgU2ocVP
         tCPrlG6Uiimale5s3iZc5aJYEIbQSnS7DgkWSMSWHTHC7yqIIz+fbEZPfaEcOVbH4FXK
         yI2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=L/YnvQVhro7MFvnP4GCxpmCQQuOlwAX2ZJrk1hLCeCQ=;
        b=hmGt6ubytX1fPD5yaOWPoEfb3rt9Pbm9zyoaN0sKsB8v/OyOYtUyC8jiLlQvvq/Vhg
         M8l344THvWhGAgXQIoGpfhelqxCSAstV30uOaadBJbJZjz63cTaXt04N7sfjYHf4hRU2
         Pym/e5+wKcVhYL7H4j3mH6i7/YZIpGy4C0y1SVhg0hsHFTkGO5Eek6aODxNByVrfKdLY
         kFbjtyWWBK1R7hmvXy9WfMxETPLfJ0ok8qy9Ne7G3ds7JxrBR4PcrtmpzEa1LamhaRIG
         RsO9vZKr5Dh25CHIDJ/jlTzaxlaVfTsxRoTm2n3p80/L/RDBM4cYx5x2wO2HH1C+Q+zD
         DdLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id g2si6029329wrc.311.2017.07.14.02.38.30;
        Fri, 14 Jul 2017 02:38:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v6E9cR8g009968;
	Fri, 14 Jul 2017 11:38:27 +0200
Received: from localhost (unknown [31.210.188.120])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 33DC23A9;
	Fri, 14 Jul 2017 11:38:22 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v13 21/26] target/arm: [tcg,a64] Port to translate_insn
Date: Fri, 14 Jul 2017 12:38:21 +0300
Message-Id: <150002510079.22386.10164419868911710218.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
References: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: GS8wBc7lIhpb

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate-a64.c |   74 +++++++++++++++++++++++++++-----------------
 1 file changed, 46 insertions(+), 28 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 51a9c26396..0f0051ac98 100644
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
 
@@ -11279,12 +11282,45 @@ static bool aarch64_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
     return true;
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
@@ -11295,7 +11331,6 @@ void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
     dc->base.singlestep_enabled = cs->singlestep_enabled;
     aarch64_tr_init_disas_context(&dc->base, cs);
 
-    next_page_start = (dc->base.pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
     max_insns = dc->base.tb->cflags & CF_COUNT_MASK;
     if (max_insns == 0) {
         max_insns = CF_COUNT_MASK;
@@ -11331,42 +11366,24 @@ void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
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
@@ -11391,6 +11408,7 @@ void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
     } else {
         switch (dc->base.is_jmp) {
         case DISAS_NEXT:
+        case DISAS_TOO_MANY:
             gen_goto_tb(dc, 1, dc->pc);
             break;
         default:
