Received: by 10.25.44.15 with SMTP id s15csp72830lfs;
        Fri, 7 Jul 2017 05:58:36 -0700 (PDT)
X-Received: by 10.28.54.65 with SMTP id d62mr2232256wma.85.1499432316326;
        Fri, 07 Jul 2017 05:58:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499432316; cv=none;
        d=google.com; s=arc-20160816;
        b=Ff9ng3cB8o0mQiykTK6k9TrcrQanNh5Hkdg7SFqb6dayn08EPDJh6cuujdKadUdsH4
         ov1kpaCRW9kCcVBOJ5QUyJVSsLoFw0rOwGW6TBwrzCwbIrHnt3FD9jYd9ASDuRRh6yep
         Z9Gr53OPDoyvigZhO05oz65bt5wNaExOMGGNB01plPvuEYfr7Wyn1afFa9wxpocAocpg
         4Z218Sfx/fkwjWQWNW0GlIRu/0905BiGQ6SmQ+oIBkJJ64GY2+u9oGl2/ROVRp+17X5Y
         vtpAe2vxa1DH3KuJPf5dRpRDRrd6F8vzEaf+drZbzY/j4RXQd3EfTJhNAXEx85VQK9+w
         9AHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=HU8d4pxipVlHdVsT7pE8SMKGTg+5pJVZn7VnlGoPtFM=;
        b=HCGyVzt2V0IEhNsSbmbdo1y11f8IOlcsu+MqwafC+zayni3mGuGTRdfCVWGgB/b7q0
         jYJ0txYnQnrVvsucsuZFBsRHGnb0LgmHMi+QyxAT4TJDovNsIcam0XAkFKQlOZgpTd9B
         AzRtxN7TrzL030Gn5duyOWGGXDJoLmj1Qy1XNGYbExUFm/7U0zw6MYvXaVGpVmM19USm
         gkqjEiY6uGOm1TithcnfvgZh4pMQV+lYPfaHkSgzh5JOEfN92SVR4Ajj9pRS1GEXjjF7
         4Z0Yyx4L7nD5ayhvRLUfOOsnxX/vRKbvGfqu4UX68Zss+lPSVG7yJRm2QghRf8lXlsQg
         nvEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id x7si2093591wrd.152.2017.07.07.05.58.36;
        Fri, 07 Jul 2017 05:58:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v67CwXSq022095;
	Fri, 7 Jul 2017 14:58:33 +0200
Received: from localhost (63.red-83-51-187.dynamicip.rima-tde.net [83.51.187.63])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id B1210456;
	Fri,  7 Jul 2017 14:58:27 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v12 19/27] target/arm: [tcg] Port to breakpoint_check
Date: Fri,  7 Jul 2017 14:58:21 +0200
Message-Id: <149943230134.8972.1522293232283101886.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <149942760788.8972.474351671751194003.stgit@frigg.lan>
References: <149942760788.8972.474351671751194003.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 5IFFJZEfd4w3

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 target/arm/translate.c |   64 +++++++++++++++++++++++++++++++++++-------------
 1 file changed, 46 insertions(+), 18 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7a1935d4d7..29428b2920 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11916,6 +11916,32 @@ static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 #endif
 }
 
+static BreakpointCheckType arm_tr_breakpoint_check(
+    DisasContextBase *dcbase, CPUState *cpu, const CPUBreakpoint *bp)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+
+    if (bp->flags & BP_CPU) {
+        gen_set_condexec(dc);
+        gen_set_pc_im(dc, dc->pc);
+        gen_helper_check_breakpoints(cpu_env);
+        /* End the TB early; it's likely not going to be executed */
+        dc->base.is_jmp = DISAS_UPDATE;
+        return BC_HIT_INSN;
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
+        return BC_HIT_TB;
+    }
+}
+
 /* generate intermediate code for basic block 'tb'.  */
 void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
 {
@@ -11964,29 +11990,31 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
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
+                if (bp->pc == dc->base.pc_next) {
+                    BreakpointCheckType bp_check =
+                        arm_tr_breakpoint_check(&dc->base, cs, bp);
+                    switch (bp_check) {
+                    case BC_MISS:
+                        /* Target ignored this breakpoint, go to next */
+                        break;
+                    case BC_HIT_INSN:
+                        /* Hit, keep translating */
+                        /*
+                         * TODO: if we're never going to have more than one
+                         *       BP in a single address, we can simply use a
+                         *       bool here.
+                         */
+                        goto done_breakpoints;
+                    case BC_HIT_TB:
+                        /* Hit, end TB */
                         goto done_generating;
+                    default:
+                        g_assert_not_reached();
                     }
-                    break;
                 }
             }
         }
+    done_breakpoints:
 
         if (dc->base.num_insns == max_insns && (tb->cflags & CF_LAST_IO)) {
             gen_io_start();
