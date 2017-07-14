Received: by 10.25.44.15 with SMTP id s15csp676027lfs;
        Fri, 14 Jul 2017 02:26:24 -0700 (PDT)
X-Received: by 10.28.134.144 with SMTP id i138mr2074342wmd.27.1500024384301;
        Fri, 14 Jul 2017 02:26:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500024384; cv=none;
        d=google.com; s=arc-20160816;
        b=MkoY0j/fzjBlPcnXI5SElFEgdARg+4k5Id81yJc/8bZGGBW+CvT07gP2zYLXr7uRWr
         jj3P+f+iCU7lWhDJS1iKHXAw3qWDc1OdQbHbJLgHjQ1bBR6DJgtSTk701aghIBu/uZZN
         tjG+PVT14qslrCFyATlfmlKcFh+R+rSQ9UasQeAJcdgq/R/LjxiMxUG+RySuvI9GWuNO
         /WHKrrcBR7Is0TSqy4+h7Yz7WYmdshKo4Ybg21F2LID7PdnmP+Vfkeo7bTCaMX3d/mfh
         7b2hmCwylHFKIY+eE58cV1/1vBrGhbmu1pW4YmuvZM5cYL/CmoMnv0kdEk7KaWBdJNLd
         OdYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=13Rw9U9W9iEJeSXzDRuczjtaYViLbLQcQoUlWmOKhqc=;
        b=fdZqz+0VWfsAZUojaQTnz1cSqBzGZSEGXC0uHwuXjQ8hSwHj2iuqohmj7IL3DdKHYP
         jKwkhen+00PTpd4GjbULLq6e8HS3EoMxb9mtaBQ5LnJJ+d7eZAAH62+gVToCrY3JY5Vk
         gJ0q9/hImwBp7qFGVQ5wpBnP1SSpI6Gu579NjRWqgN8CR0zmL6d1Bzg94dmu4Y2ZGIhu
         0v2SlDk2hZM/RRySwcjLl40Wk9HXj7ebyKrE8zkNH/KYgzGRFPF11EG06O5r3HnGAANO
         51Hyz0aotie1m1ElLI87fQmdxSBa10HWNlospjkpqUVy9PT4gGZS3sCftmdToIOOGyUz
         QSjw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id y142si1821735wmd.19.2017.07.14.02.26.24;
        Fri, 14 Jul 2017 02:26:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v6E9QL5r009614;
	Fri, 14 Jul 2017 11:26:21 +0200
Received: from localhost (unknown [31.210.188.120])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id 871E05C8;
	Fri, 14 Jul 2017 11:26:15 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v13 18/26] target/arm: [tcg] Port to breakpoint_check
Date: Fri, 14 Jul 2017 12:26:14 +0300
Message-Id: <150002437386.22386.7745855254236101855.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
References: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: eaNt2S6wktNM

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 target/arm/translate.c |   53 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 19 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index b9183fc511..55bef09739 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11917,6 +11917,33 @@ static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 #endif
 }
 
+static bool arm_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
+                                    const CPUBreakpoint *bp)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+
+    if (bp->flags & BP_CPU) {
+        gen_set_condexec(dc);
+        gen_set_pc_im(dc, dc->pc);
+        gen_helper_check_breakpoints(cpu_env);
+        /* End the TB early; it's likely not going to be executed */
+        dc->base.is_jmp = DISAS_UPDATE;
+    } else {
+        gen_exception_internal_insn(dc, 0, EXCP_DEBUG);
+        /* The address covered by the breakpoint must be
+           included in [tb->pc, tb->pc + tb->size) in order
+           to for it to be properly cleared -- thus we
+           increment the PC here so that the logic setting
+           tb->size below does the right thing.  */
+        /* TODO: Advance PC by correct instruction length to
+         * avoid disassembler error messages */
+        dc->pc += 2;
+        dc->base.is_jmp = DISAS_NORETURN;
+    }
+
+    return true;
+}
+
 /* generate intermediate code for basic block 'tb'.  */
 void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
 {
@@ -11965,28 +11992,16 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
         if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
             CPUBreakpoint *bp;
             QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
-                if (bp->pc == dc->pc) {
-                    if (bp->flags & BP_CPU) {
-                        gen_set_condexec(dc);
-                        gen_set_pc_im(dc, dc->pc);
-                        gen_helper_check_breakpoints(cpu_env);
-                        /* End the TB early; it's likely not going to be executed */
-                        dc->base.is_jmp = DISAS_UPDATE;
-                    } else {
-                        gen_exception_internal_insn(dc, 0, EXCP_DEBUG);
-                        /* The address covered by the breakpoint must be
-                           included in [tb->pc, tb->pc + tb->size) in order
-                           to for it to be properly cleared -- thus we
-                           increment the PC here so that the logic setting
-                           tb->size below does the right thing.  */
-                        /* TODO: Advance PC by correct instruction length to
-                         * avoid disassembler error messages */
-                        dc->pc += 2;
-                        goto done_generating;
+                if (bp->pc == dc->base.pc_next) {
+                    if (arm_tr_breakpoint_check(&dc->base, cs, bp)) {
+                        break;
                     }
-                    break;
                 }
             }
+
+            if (dc->base.is_jmp == DISAS_NORETURN) {
+                break;
+            }
         }
 
         if (dc->base.num_insns == max_insns && (tb->cflags & CF_LAST_IO)) {
