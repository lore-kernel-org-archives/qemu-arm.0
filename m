Received: by 10.25.44.15 with SMTP id s15csp679777lfs;
        Fri, 14 Jul 2017 02:30:27 -0700 (PDT)
X-Received: by 10.28.69.201 with SMTP id l70mr2026195wmi.53.1500024627513;
        Fri, 14 Jul 2017 02:30:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500024627; cv=none;
        d=google.com; s=arc-20160816;
        b=o7KL3bU+X/cd9leaS5za4sg3u5eWagHXs28gexM46/TE1+aIKDJolCfW89464W2rTf
         nhqJtmFaNmDtAW5npoXpnF4V9rd1rccXbFrx1b4q/JzLyAY3uVXdgzUi3zeG9Nh/Lxxz
         UPV01O+/FQmla1H1qzlGeO+962jCSzTjfw7GB37BflKikFCBq42b2RLfjbpFKAIO3ssa
         80YS4oTs7hAKktM89ZME7F+G5FZsW3cgN5Imw3bQ7p93EdYPidBReB7p/BLzQYknB5zZ
         W2M6Uj7gkzb0CXx11JzKX4nay95cyWP6Ok/C9gko4TyBaYpFKDwiW860pJuSPpwjWtrh
         Mw4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=PvYVIufQLotsfO/cwn5LJjRZv4vgqs6DQCu6rsFIQi8=;
        b=BVzLKnOTTfXIbiOTPiDSwZkGZ6I04oJGwouaLW+Q6SCV3BRx9uZv/O+CIjm1mZ+02B
         wo12j1GZxpUWaSg5tpEqXZbkPNuDyBhPcyNtC+Z8zIXjz2g1mnUl2CvDUbEaR5ZKM+A8
         S//Ik+e/xN0HdRtruJDBvlEzz3xLwrla1l+j/6ql9SAMPoAInV3qOpumrDncZotu9cy4
         CGjvDH+GO1lSR8bK5qTJ6YbpFow4aWWQ5zyygOdC6fJwoBrvbRpBftXhl3ehrBYzjVLH
         aGG18pHPY5gZ1dGrBo0tvO2JeDY7bcQG2t9VmB5e9LUJnWoCF8RD3Nk9OgXrwArtWGdk
         j4jg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id a71si1868381wme.172.2017.07.14.02.30.27;
        Fri, 14 Jul 2017 02:30:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v6E9UNJf009721;
	Fri, 14 Jul 2017 11:30:23 +0200
Received: from localhost (unknown [31.210.188.120])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id D6E145C8;
	Fri, 14 Jul 2017 11:30:17 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v13 19/26] target/arm: [tcg,a64] Port to breakpoint_check
Date: Fri, 14 Jul 2017 12:30:16 +0300
Message-Id: <150002461630.22386.14827196109258040543.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
References: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: X0Xv1CbHBfU3

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 target/arm/translate-a64.c |   48 ++++++++++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index dc91661df0..51a9c26396 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11255,6 +11255,30 @@ static void aarch64_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     tcg_gen_insn_start(dc->pc, 0, 0);
 }
 
+static bool aarch64_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
+                                        const CPUBreakpoint *bp)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+
+    if (bp->flags & BP_CPU) {
+        gen_a64_set_pc_im(dc->pc);
+        gen_helper_check_breakpoints(cpu_env);
+        /* End the TB early; it likely won't be executed */
+        dc->base.is_jmp = DISAS_UPDATE;
+    } else {
+        gen_exception_internal_insn(dc, 0, EXCP_DEBUG);
+        /* The address covered by the breakpoint must be
+           included in [tb->pc, tb->pc + tb->size) in order
+           to for it to be properly cleared -- thus we
+           increment the PC here so that the logic setting
+           tb->size below does the right thing.  */
+        dc->pc += 4;
+        dc->base.is_jmp = DISAS_NORETURN;
+    }
+
+    return true;
+}
+
 void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
                                TranslationBlock *tb)
 {
@@ -11291,25 +11315,16 @@ void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
         if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
             CPUBreakpoint *bp;
             QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
-                if (bp->pc == dc->pc) {
-                    if (bp->flags & BP_CPU) {
-                        gen_a64_set_pc_im(dc->pc);
-                        gen_helper_check_breakpoints(cpu_env);
-                        /* End the TB early; it likely won't be executed */
-                        dc->base.is_jmp = DISAS_UPDATE;
-                    } else {
-                        gen_exception_internal_insn(dc, 0, EXCP_DEBUG);
-                        /* The address covered by the breakpoint must be
-                           included in [dc->base.tb->pc, dc->base.tb->pc + dc->base.tb->size) in order
-                           to for it to be properly cleared -- thus we
-                           increment the PC here so that the logic setting
-                           dc->base.tb->size below does the right thing.  */
-                        dc->pc += 4;
-                        goto done_generating;
+                if (bp->pc == dc->base.pc_next) {
+                    if (aarch64_tr_breakpoint_check(&dc->base, cs, bp)) {
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
 
         if (dc->base.num_insns == max_insns && (dc->base.tb->cflags & CF_LAST_IO)) {
@@ -11414,7 +11429,6 @@ void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
         }
     }
 
-done_generating:
     gen_tb_end(tb, dc->base.num_insns);
 
 #ifdef DEBUG_DISAS
