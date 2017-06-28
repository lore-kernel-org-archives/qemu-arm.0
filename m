Received: by 10.25.227.6 with SMTP id a6csp3079657lfh;
        Wed, 28 Jun 2017 06:45:37 -0700 (PDT)
X-Received: by 10.46.88.92 with SMTP id x28mr972250ljd.106.1498657537560;
        Wed, 28 Jun 2017 06:45:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498657537; cv=none;
        d=google.com; s=arc-20160816;
        b=L3vZbia/zdcZC9ak74bjiQAMdMmCaO1sXgef2WKHMeneDPibDSOAlYIdPGTIkh/UYd
         zDY4hioaFcx8XJ70GRr+GrjpIYYz6xDUMXZq4zR+j/PsTOoOZO97+FyW65Z2fAvDOrnh
         44fCtV+OYbhDwBJlLK0gO6hosM39hD2Q8vY054JBDlL9cdzYxDwDU3xaPacKisWIpP8b
         oZtxs+xffVN0Kw3y66phKfRtE2sXg7nfkKluz3Au9J+8vDJnQVleOWkNd2gxkgJMrd8f
         5JKcabHbkNuOywl/cxKAdmlqcTedbzL9ZdvFU014Ew/DckBWn5dpYLcFoEL1eEP/YTXE
         HAEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=+vF1k7Z4+k0iYBqEmqF7l1j+bGLz1zszpjHRYLdVNzY=;
        b=UI38epT14pzzdt469ZIXMaWTqS6KoHiX2StSfQ4Wv/GsqGlBdlVwxWR2aeDGbzXcbt
         dZ34aC+bNtk1fmJ393DfNVnkATAraL2sUzHZ1GmeaxQCG3ia42hXYkP9Ga4kElReKbQu
         vImTcLSXxdu68AgQqghtzDMAWntQJ51I6k6moNn7MvJwRjhhjlj/ftQuMK9aDOvpPrtT
         f/lXNZg3AjZ9wPGIRwL5njTv2q/u8yJmPKU7XzWO2Kne4xZfbsADm37uVsqSNqHZa1lu
         bUptoUbPL61X1lGAWHdWP4pxDzo22LfcToB/9aRfytzfW9QBAS8n1vfD1ZemlhTyqDMk
         WJaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id z9si1090710lfd.409.2017.06.28.06.45.37;
        Wed, 28 Jun 2017 06:45:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5SDjYYI028020;
	Wed, 28 Jun 2017 15:45:34 +0200
Received: from localhost (unknown [132.68.50.243])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 087EB1E1;
	Wed, 28 Jun 2017 15:45:28 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v11 22/29] target/arm: [tcg,a64] Port to breakpoint_check
Date: Wed, 28 Jun 2017 16:45:27 +0300
Message-Id: <149865752773.17063.5160701222440538985.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: JZuvUnp8oMPN

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate-a64.c |   58 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 43 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5784620642..9c870f6d07 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11255,6 +11255,29 @@ static void aarch64_trblock_insn_start(DisasContextBase *dcbase, CPUState *cpu)
     tcg_gen_insn_start(dc->pc, 0, 0);
 }
 
+static BreakpointCheckType aarch64_trblock_breakpoint_check(
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
+                        aarch64_trblock_breakpoint_check(&dc->base, cs, bp);
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
