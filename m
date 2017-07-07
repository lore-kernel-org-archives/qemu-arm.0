Received: by 10.25.44.15 with SMTP id s15csp77622lfs;
        Fri, 7 Jul 2017 06:02:44 -0700 (PDT)
X-Received: by 10.28.26.2 with SMTP id a2mr2274226wma.21.1499432563926;
        Fri, 07 Jul 2017 06:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499432563; cv=none;
        d=google.com; s=arc-20160816;
        b=LfJFL3Y1bQ+kIw5hOVBAzs6Wt8lJkWVS8+aT/wu4tqpx06BfpkhxKGGM6vz494oOD9
         usg1/wZc8qvPa9M1SsXCNspNBcjVhx4NNVFXNUl7JvL38j5e+/eWFtdU0mKln/qGbDDg
         hyqeFMbcMuFdVVytB0qYytw0540ZYF+Jr5seyncw1Slt5qyOfmM/LDSYnADenJIHUWav
         1qqpRv/L77tkxHc/ufLccYJ3majpfL3nP0FRNIOfivE7dT36KGN3a3AjH8H0cQP8VnP2
         JmUzEb/+U5zNlNZK7F3UsXzE73sSGyXbOKXcEgeAxEF8FDi/QGiIXscz6EpLO7oBuW76
         p1RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=EASE3c5Cd1xDykuvcThvYKiyAIvUFxUgSzORijM9ypU=;
        b=fxuwOHeDtAbW00EDNMseSaIoxR3fRS3T/T0inWAO06x3TKFPFx/KH6bZ3h5agBkeoW
         AoIDaRIMJEXA5dry1WNdYr+6lzvsQRHdXYYvrVARz3MmOLaWvEXiMGbZmbog6VQh7kDH
         uvVsOzLZkqpoQpaKSDesOJ+WfGK80tobu+jKHcleK2FwIuKpOz6KUXvXg5hjclsYqsp0
         rhYqMIqt/P2bDNtNPY73OeOoDDhM/mZ8j4PtarBdheVJDbH6Hg5+AM5rH/vS8+Qc/Tdg
         BUnY8e5tcarPqCQBKxv4czEERaEt0XY+oXmg2c04N/TGug3mRDHKd/GsPFgU7sIq9J4k
         a+vA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id 91si2117940wrh.288.2017.07.07.06.02.43;
        Fri, 07 Jul 2017 06:02:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v67D2dZU022206;
	Fri, 7 Jul 2017 15:02:39 +0200
Received: from localhost (63.red-83-51-187.dynamicip.rima-tde.net [83.51.187.63])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 7C35A13C;
	Fri,  7 Jul 2017 15:02:34 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v12 20/27] target/arm: [tcg,a64] Port to breakpoint_check
Date: Fri,  7 Jul 2017 15:02:28 +0200
Message-Id: <149943254813.8972.12950702637872655040.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <149942760788.8972.474351671751194003.stgit@frigg.lan>
References: <149942760788.8972.474351671751194003.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: Nc530+LzuOB5

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 target/arm/translate-a64.c |   58 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 43 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index dc91661df0..a32f07f4bd 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11255,6 +11255,29 @@ static void aarch64_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     tcg_gen_insn_start(dc->pc, 0, 0);
 }
 
+static BreakpointCheckType aarch64_tr_breakpoint_check(
+    DisasContextBase *dcbase, CPUState *cpu, const CPUBreakpoint *bp)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+
+    if (bp->flags & BP_CPU) {
+        gen_a64_set_pc_im(dc->pc);
+        gen_helper_check_breakpoints(cpu_env);
+        /* End the TB early; it likely won't be executed */
+        dc->base.is_jmp = DISAS_UPDATE;
+        return BC_HIT_INSN;
+    } else {
+        gen_exception_internal_insn(dc, 0, EXCP_DEBUG);
+        /* The address covered by the breakpoint must be
+           included in [tb->pc, tb->pc + tb->size) in order
+           to for it to be properly cleared -- thus we
+           increment the PC here so that the logic setting
+           tb->size below does the right thing.  */
+        dc->pc += 4;
+        return BC_HIT_TB;
+    }
+}
+
 void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
                                TranslationBlock *tb)
 {
@@ -11291,26 +11314,31 @@ void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
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
+                if (bp->pc == dc->base.pc_next) {
+                    BreakpointCheckType bp_check =
+                        aarch64_tr_breakpoint_check(&dc->base, cs, bp);
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
 
         if (dc->base.num_insns == max_insns && (dc->base.tb->cflags & CF_LAST_IO)) {
             gen_io_start();
