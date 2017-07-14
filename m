Received: by 10.25.44.15 with SMTP id s15csp694997lfs;
        Fri, 14 Jul 2017 02:46:34 -0700 (PDT)
X-Received: by 10.28.59.138 with SMTP id i132mr2357130wma.12.1500025594686;
        Fri, 14 Jul 2017 02:46:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500025594; cv=none;
        d=google.com; s=arc-20160816;
        b=pMr+X9nehgwWGnQIPhGFKI8pcq6kHOEjAJY6OFltaRjkTtr+cl8zB5bcz/WGIlCLCJ
         /OOECOujFSYgYhnQThbotizAqFtdt/N1hr4MA5WliNBfI6ir/jfUPoaMBQJ5i72yz1Nj
         TqyYV4aWG9xsBMYkX6sXSTQ4Rk4b54HlxBCYBG/+nys83Tv0LExgq/YbmI0WEowY4DJE
         ttSwFo31/esfprmX8TQxtSMul6TAgbUNbcv0ZREcEXvok4WUELyqRvXBsMhNfmhgFJTI
         lVSwZg6eh63FiVd19UFizouTlueFgMmI5tFL5PF5DEkOJAywdD3v2lPzmNhmr2bSHAWR
         an5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=ln5tPSShMEiv38I/fX1nk79vBJmP4WkjB1Cvap0udeM=;
        b=XZpl6TIYV5ma4VDQASCeVfZWOQbjTPAf/CStnuHhgZHbUO467MHBvYj7cfbWg5BUP7
         HJp4a55RuEZVx4PG3+dSrCcO7zByK5KYzDoXGyWoGGtKLxmd28crJ0yTcc5Djx+VfPoU
         GyDVAG2TEdJlg8bmNLU6DBn1+jDGEonjd8rg1OIfMPyNVAhQydfZ5N9NBsMfefCd4R73
         Mx3p/01ogbzet1Sy1hIM0UyRd605egbJ0YayeNFnj4DGML1W50xcP4KNQJWOSmlIoS4i
         DIAWC6F2gaYB33VRtOKtaItUBf9Et3f/9AteqkQBs8vmxOu/w4TzBGLf53nvPRp1yrVc
         WPqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id b204si1849501wmd.50.2017.07.14.02.46.34;
        Fri, 14 Jul 2017 02:46:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v6E9kWGO010233;
	Fri, 14 Jul 2017 11:46:32 +0200
Received: from localhost (unknown [31.210.188.120])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id 611013AF;
	Fri, 14 Jul 2017 11:46:26 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v13 23/26] target/arm: [tcg,a64] Port to tb_stop
Date: Fri, 14 Jul 2017 12:46:25 +0300
Message-Id: <150002558503.22386.1149037590886263349.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
References: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: zNBLTlDHg2gF

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 target/arm/translate-a64.c |  123 +++++++++++++++++++++++---------------------
 1 file changed, 65 insertions(+), 58 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 0f0051ac98..caeec69d93 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11317,6 +11317,69 @@ static target_ulong aarch64_tr_translate_insn(DisasContextBase *dcbase,
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
@@ -11385,68 +11448,12 @@ void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
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
     gen_tb_end(tb, dc->base.num_insns);
 
 #ifdef DEBUG_DISAS
