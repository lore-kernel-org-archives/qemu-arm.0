Received: by 10.25.44.15 with SMTP id s15csp98614lfs;
        Fri, 7 Jul 2017 06:19:11 -0700 (PDT)
X-Received: by 10.28.64.85 with SMTP id n82mr2275798wma.54.1499433551035;
        Fri, 07 Jul 2017 06:19:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499433551; cv=none;
        d=google.com; s=arc-20160816;
        b=CCV305E662w1RS7QEF8CXxo3vP0pL9Tj40cUno9v/UWCfvf0dLTFQ7ePWJOQhFiMHu
         k9oEm+EZHIttGX2JAFJUOkao+mMeZKgznvNB/sRChqps4mc2B78Sdi61CgUsuE1ndv//
         gpjT9F3ohyAzcelB5NkWQfJmJfoPjGbIdJvO6WOtk8mlDM4TB4Ra468zMXWOPdY8/N73
         3plpSkw7+EZj1ObAzfaGpx2kgY8Q47Djaa1URELZ33osWJV+8IFWN9xg3qCncT7l0uYR
         zF3jKgK6uDLd6291PWwwpDbGbpE0geVzljIHdnhbHA7ZdSKBuls9XFuEr820n7GkgtK0
         6xBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=ybAkskl70rSZ5I8QqtqK8tsENwTd5bwiy7VXOmyfjqk=;
        b=IKZTj9MoypVyGXRcotkYjz/vZ5l+3ERtr9qb28XGfkpC+OXKWe4RRwAWk+URc8EXmH
         hIshssa16PGTiNljN49HRSEWoXtyIihWE16mXav9ot0a0wm7ORmdU9OMmTj67qk1tU/o
         zpSYHhKWz43VuAMJDXl6Gu/aQ1Gbk2QHkB96Z54kQ+KsBTlYh7LTdIv0vFNt+s+UEnum
         3ogl5gfKKGCzAjbyKneNBPeA98cx5C4gYlj+iWvjmaJK7d2JqFwsgL2/fi2Jj1MgitAq
         xfDcoUhjDhvc16hknDTT9uCoO37gFe5PY8xkxw4t2qwqdw6X4EBuM0rzdxFGV17T6A11
         1Srg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id a17si2187511wra.327.2017.07.07.06.19.10;
        Fri, 07 Jul 2017 06:19:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v67DJ6YK022654;
	Fri, 7 Jul 2017 15:19:06 +0200
Received: from localhost (63.red-83-51-187.dynamicip.rima-tde.net [83.51.187.63])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id 89829258;
	Fri,  7 Jul 2017 15:19:01 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v12 24/27] target/arm: [tcg,a64] Port to tb_stop
Date: Fri,  7 Jul 2017 15:18:55 +0200
Message-Id: <149943353527.8972.10583420262960708622.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <149942760788.8972.474351671751194003.stgit@frigg.lan>
References: <149942760788.8972.474351671751194003.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: VrLY39OMHrgF

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 target/arm/translate-a64.c |  123 +++++++++++++++++++++++---------------------
 1 file changed, 65 insertions(+), 58 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c4cb9afb02..cead9d382c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11316,6 +11316,69 @@ static target_ulong aarch64_tr_translate_insn(DisasContextBase *dcbase,
     return dc->pc;
 }
 
+static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+
+    if (unlikely(dc->base.singlestep_enabled || dc->ss_active)
+        && dc->base.is_jmp != DISAS_EXC) {
+        /* Note that this means single stepping WFI doesn't halt the CPU.
+         * For conditional branch insns this is harmless unreachable code as
+         * gen_goto_tb() has already handled emitting the debug exception
+         * (and thus a tb-jump is not possible when singlestepping).
+         */
+        assert(dc->base.is_jmp != DISAS_TB_JUMP);
+        if (dc->base.is_jmp != DISAS_JUMP) {
+            gen_a64_set_pc_im(dc->pc);
+        }
+        if (dc->base.singlestep_enabled) {
+            gen_exception_internal(EXCP_DEBUG);
+        } else {
+            gen_step_complete_exception(dc);
+        }
+    } else {
+        switch (dc->base.is_jmp) {
+        case DISAS_NEXT:
+        case DISAS_TOO_MANY:
+            gen_goto_tb(dc, 1, dc->pc);
+            break;
+        default:
+        case DISAS_UPDATE:
+            gen_a64_set_pc_im(dc->pc);
+            /* fall through */
+        case DISAS_JUMP:
+            tcg_gen_lookup_and_goto_ptr(cpu_pc);
+            break;
+        case DISAS_EXIT:
+            tcg_gen_exit_tb(0);
+            break;
+        case DISAS_TB_JUMP:
+        case DISAS_EXC:
+        case DISAS_SWI:
+            break;
+        case DISAS_WFE:
+            gen_a64_set_pc_im(dc->pc);
+            gen_helper_wfe(cpu_env);
+            break;
+        case DISAS_YIELD:
+            gen_a64_set_pc_im(dc->pc);
+            gen_helper_yield(cpu_env);
+            break;
+        case DISAS_WFI:
+            /* This is a special case because we don't want to just halt the CPU
+             * if trying to debug across a WFI.
+             */
+            gen_a64_set_pc_im(dc->pc);
+            gen_helper_wfi(cpu_env);
+            /* The helper doesn't necessarily throw an exception, but we
+             * must go back to the main loop to check for interrupts anyway.
+             */
+            tcg_gen_exit_tb(0);
+            break;
+        }
+    }
+}
+
 void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
                                TranslationBlock *tb)
 {
@@ -11398,68 +11461,12 @@ void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
          */
     } while (!dc->base.is_jmp);
 
+    aarch64_tr_tb_stop(&dc->base, cs);
+
     if (dc->base.tb->cflags & CF_LAST_IO) {
         gen_io_end();
     }
 
-    if (unlikely(cs->singlestep_enabled || dc->ss_active)
-        && dc->base.is_jmp != DISAS_EXC) {
-        /* Note that this means single stepping WFI doesn't halt the CPU.
-         * For conditional branch insns this is harmless unreachable code as
-         * gen_goto_tb() has already handled emitting the debug exception
-         * (and thus a tb-jump is not possible when singlestepping).
-         */
-        assert(dc->base.is_jmp != DISAS_TB_JUMP);
-        if (dc->base.is_jmp != DISAS_JUMP) {
-            gen_a64_set_pc_im(dc->pc);
-        }
-        if (cs->singlestep_enabled) {
-            gen_exception_internal(EXCP_DEBUG);
-        } else {
-            gen_step_complete_exception(dc);
-        }
-    } else {
-        switch (dc->base.is_jmp) {
-        case DISAS_NEXT:
-        case DISAS_TOO_MANY:
-            gen_goto_tb(dc, 1, dc->pc);
-            break;
-        default:
-        case DISAS_UPDATE:
-            gen_a64_set_pc_im(dc->pc);
-            /* fall through */
-        case DISAS_JUMP:
-            tcg_gen_lookup_and_goto_ptr(cpu_pc);
-            break;
-        case DISAS_EXIT:
-            tcg_gen_exit_tb(0);
-            break;
-        case DISAS_TB_JUMP:
-        case DISAS_EXC:
-        case DISAS_SWI:
-            break;
-        case DISAS_WFE:
-            gen_a64_set_pc_im(dc->pc);
-            gen_helper_wfe(cpu_env);
-            break;
-        case DISAS_YIELD:
-            gen_a64_set_pc_im(dc->pc);
-            gen_helper_yield(cpu_env);
-            break;
-        case DISAS_WFI:
-            /* This is a special case because we don't want to just halt the CPU
-             * if trying to debug across a WFI.
-             */
-            gen_a64_set_pc_im(dc->pc);
-            gen_helper_wfi(cpu_env);
-            /* The helper doesn't necessarily throw an exception, but we
-             * must go back to the main loop to check for interrupts anyway.
-             */
-            tcg_gen_exit_tb(0);
-            break;
-        }
-    }
-
 done_generating:
     gen_tb_end(tb, dc->base.num_insns);
 
