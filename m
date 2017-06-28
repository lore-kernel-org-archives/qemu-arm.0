Received: by 10.25.227.6 with SMTP id a6csp3097293lfh;
        Wed, 28 Jun 2017 07:01:49 -0700 (PDT)
X-Received: by 10.84.224.134 with SMTP id s6mr11891660plj.263.1498658509056;
        Wed, 28 Jun 2017 07:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498658509; cv=none;
        d=google.com; s=arc-20160816;
        b=SfU5fF1fEImzK4oK/tz2LcuhfBD0nAZSrXaF/Uj1qsevw+maqd3GC0tXGtbBE5BA4N
         KFcmMIDh/R+iQP5GmIir4kVy+dTf4zQ5hsySSS/OxCDwdUg1YMVHCsAsgf96lnVeIkrk
         Xw/5ChEvVC8b+Ok8XIs8rPNy0plxXEtIFsg1pQbwUtVa2UJKUaOUIU1iq1O3KOZxj3Jy
         iPwbrcy8ax3YFHM18uXeHxlPzE3Wfeh2LeXsn1z+bWHJ3ouyk9TKBM9boqsCU7P8zHY9
         LAe/DrKLLGHuxmaXzzg4qp2IR8vvzukDuqgdGK7E/AZOqVtL7kVTMZkcckCbvd2K791m
         TxGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=axcY01kHH6Htp2SJNz0TTL4fvG5fVgdRHAEfzt+bcvk=;
        b=o4lBYDx3jSOMVhSx5HQNu04Sa2H/CNNqsXLJC6LM+sRsP8heSbQYw6QsiFvFf5NVhM
         5g3TPirx5XFdKh/4SijZPPZhS4H2g+PGss9Yf2WmB0uG+cEXsj3nbOAV4kPNdvAVU223
         m2bYcb0wJ4S5BY94LL/ra/54gs3rsaxMqDPGQUJaQlBHaq/SpHPw5AZqAsOASQzcPnyc
         eO+1UkLKFAatozaRA9qYlzuL1vzp6Fc8yhNxnz2cp8RQzmh7azZY6jSBqYwCGtu3Xiw5
         KdnZ1tC46tiOK/nSRYun2WdQXY7rC01InJLRif/nFwtm6JBUlr7zuQoaqAWq3dW5QugJ
         Mw/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id t2si1502944pgs.229.2017.06.28.07.01.46;
        Wed, 28 Jun 2017 07:01:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5SE1gxu028441;
	Wed, 28 Jun 2017 16:01:42 +0200
Received: from localhost (unknown [132.68.50.243])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id E0EAE165;
	Wed, 28 Jun 2017 16:01:36 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v11 26/29] target/arm: [tcg,a64] Port to tb_stop
Date: Wed, 28 Jun 2017 17:01:35 +0300
Message-Id: <149865849564.17063.5123403029688828196.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: E+7fdcv9tYzp

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate-a64.c |  123 +++++++++++++++++++++++---------------------
 1 file changed, 65 insertions(+), 58 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 586a01a2de..c57f475dc0 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11316,6 +11316,69 @@ static target_ulong aarch64_trblock_translate_insn(DisasContextBase *dcbase,
     return dc->pc;
 }
 
+static void aarch64_trblock_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
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
 
+    aarch64_trblock_tb_stop(&dc->base, cs);
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
 
