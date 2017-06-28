Received: by 10.25.227.6 with SMTP id a6csp3075562lfh;
        Wed, 28 Jun 2017 06:41:35 -0700 (PDT)
X-Received: by 10.46.20.14 with SMTP id u14mr3026992ljd.111.1498657295536;
        Wed, 28 Jun 2017 06:41:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498657295; cv=none;
        d=google.com; s=arc-20160816;
        b=ESzPW+XIIiHWhIKF6ofxbeO7lmcCOx+qN56Zn1ixHr4xx9nlYHIOXR/E8BqK8XkSd0
         Xbq0aE3c7kHjO+NpScM8kXO0hr6ETzbI0bD/7SGHr8KtPJPmcTZ+5KZoYIjPFYfhjtSj
         zh0dFEBfXI6jTxEAgBghrLhvIZUkADK1YSWVpdC49PO1n0g0+Y4eQjahxJYFYrnw+K/X
         zarxQwgpVQOa1mUyoKx006GqAjcW3DHtffoJ6t0pg6H3a52f9lmtXOve5rNAERFbF8/6
         T+KcKi0WUsG3B25lEQmH0jOq8k+I0e3Uocjhf2TlmLx6q6sDOMu+Dlc7hBOkW95igAUQ
         rOMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=kXzvmK7ZIwIsKZYuQ9GGmeuI+jNi/Fa5QXmBogtCKqY=;
        b=yic4raV2za4YrAJwVsD/pjmQ9qBk3WpycgHXKn+ruNodsiE8G5e0VSCRdrm+xFpVCB
         grITFV+IngJCkTegHT0COOAhjTJWwYKcLeKhO9LTTergZVNUw7EFQgQN87NE98fp1b1N
         4BuAjcWM099a6ZyTpMnxNq+FfkU2WndjhTKm8LG4jseeQDzR9v8q7j1Fw6oa7c6byrBg
         0eY3P3c26HypfUh5lFHUdVTMYP3KefvIV/KvQL8Ex9+0Cu0d3t5NFSEXvA8a6L7iNcra
         UGRjDPwmaEA8aL+t3WR5539ysctt+d12FWB7Rri4U0zzD/6vf7nHYtreOhvL5TaWRGSx
         Zy+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id r193si1101880lff.417.2017.06.28.06.41.35;
        Wed, 28 Jun 2017 06:41:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5SDfWei027919;
	Wed, 28 Jun 2017 15:41:32 +0200
Received: from localhost (unknown [132.68.50.243])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id 0EBE6165;
	Wed, 28 Jun 2017 15:41:26 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v11 21/29] target/arm: [tcg] Port to breakpoint_check
Date: Wed, 28 Jun 2017 16:41:26 +0300
Message-Id: <149865728578.17063.13455172137587126808.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: mcSG3m2cr3fv

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate.c |   68 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 22 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index c7e188b50e..790eaa2164 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11918,6 +11918,32 @@ static void arm_trblock_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 #endif
 }
 
+static BreakpointCheckType arm_trblock_breakpoint_check(
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
 void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
 {
@@ -11965,36 +11991,34 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
         dc->base.num_insns++;
         arm_trblock_insn_start(&dc->base, cpu);
 
-        if (unlikely(dc->base.is_jmp > DISAS_NEXT)) {
-            break;
-        }
-
         if (unlikely(!QTAILQ_EMPTY(&cpu->breakpoints))) {
             CPUBreakpoint *bp;
             QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
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
+                        arm_trblock_breakpoint_check(&dc->base, cpu, bp);
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
