Received: by 10.25.15.197 with SMTP id 66csp916392lfp;
        Sun, 25 Jun 2017 03:12:39 -0700 (PDT)
X-Received: by 10.25.215.5 with SMTP id o5mr5515465lfg.105.1498385559325;
        Sun, 25 Jun 2017 03:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498385559; cv=none;
        d=google.com; s=arc-20160816;
        b=SIlYccCEuqF98r4iWG1G+P6iG+Vz460sAA7GdYqSAiDo7wzDL2MfaPon77wVYdxunW
         8hkrB/0AWhEyK6RqmsN+3MNTms9yaeQaSvvR0GiRI7ex95vjozbO3gyM+3dUY2zCqZW/
         ey/gRoD8ZPhXaNOnn7o2bB+RB5K6RZuhfm18A8rMJsZvtkYgLO277L473QnaBbWnwseG
         BZEVcLDYRYmcoD2oQ48GMtmKM7uUsFX46nP6V9aOpzjJneXrgZd1gVu5s83i3Qszr8Bi
         OPPtMz/TeWKRkCrG9JUtnHxnvqeT51j31cSEH3HUSAbjFwf+uR/V1jFn8q3dpuAp714P
         1yOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=LexGTJVCda85rw1OnEuXYlAHn6Sa6W9KuoB+JLbCZuU=;
        b=h5rKjUjh7sxohIdS/G8tSLS5W2Y2gKuEEAW7jIMOEuu1D+wNprXhoatgG1D2XRn2at
         xxPlCyycp3ARvBp8dU5VwI+2/Ndr5GWeUAYAuopeMHuOWFhApetyAcD2xxHYb/VWJHL8
         31pNLH/7+YIk7OkUP8RM3tXAlUj/BXzkEI9to1HvEnieHsxuqezMCpomzgvxXKnX1W88
         QmEnsvtf5unq+EuZOghKzESFw1/LGtlNgeugt8YHE4hpx7PFekH2bXZUOvdZCR/gFQpm
         IWo7KgG/HEkywmnkbavBivCFSze2N5wvpvNf+aYyL69V047ZSDCm+rIB7AUDjwAeb5sa
         exig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id f28si5150339lji.81.2017.06.25.03.12.39;
        Sun, 25 Jun 2017 03:12:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5PACcJD020515;
	Sun, 25 Jun 2017 12:12:38 +0200
Received: from localhost (unknown [132.68.53.125])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id 1F40313BC;
	Sun, 25 Jun 2017 12:12:33 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v9 22/26] target: [tcg,arm] Port to breakpoint_check
Date: Sun, 25 Jun 2017 13:12:32 +0300
Message-Id: <149838555190.6497.14794381660566656791.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
References: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: DKJNQDxRI7tA

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate-a64.c |   59 ++++++++++++++++++++++++++-------------
 target/arm/translate.c     |   66 +++++++++++++++++++++++++++++---------------
 2 files changed, 82 insertions(+), 43 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index bfc2cdabb5..4321767355 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11267,6 +11267,29 @@ static void aarch64_trblock_insn_start(DisasContextBase *db, CPUState *cpu)
     tcg_gen_insn_start(dc->pc, 0, 0);
 }
 
+static BreakpointCheckType aarch64_trblock_breakpoint_check(
+    DisasContextBase *db, CPUState *cpu, const CPUBreakpoint *bp)
+{
+    DisasContext *dc = container_of(db, DisasContext, base);
+
+    if (bp->flags & BP_CPU) {
+        gen_a64_set_pc_im(dc->pc);
+        gen_helper_check_breakpoints(cpu_env);
+        /* End the TB early; it likely won't be executed */
+        db->is_jmp = DJ_UPDATE;
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
 void gen_intermediate_code_a64(DisasContextBase *db, ARMCPU *cpu,
                                TranslationBlock *tb)
 {
@@ -11275,6 +11298,7 @@ void gen_intermediate_code_a64(DisasContextBase *db, ARMCPU *cpu,
     DisasContext *dc = container_of(db, DisasContext, base);
     target_ulong next_page_start;
     int max_insns;
+    CPUBreakpoint *bp;
 
     db->tb = tb;
     db->pc_first = tb->pc;
@@ -11301,29 +11325,24 @@ void gen_intermediate_code_a64(DisasContextBase *db, ARMCPU *cpu,
         db->num_insns++;
         aarch64_trblock_insn_start(db, cs);
 
-        if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
-            CPUBreakpoint *bp;
-            QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
-                if (bp->pc == dc->pc) {
-                    if (bp->flags & BP_CPU) {
-                        gen_a64_set_pc_im(dc->pc);
-                        gen_helper_check_breakpoints(cpu_env);
-                        /* End the TB early; it likely won't be executed */
-                        db->is_jmp = DJ_UPDATE;
-                    } else {
-                        gen_exception_internal_insn(dc, 0, EXCP_DEBUG);
-                        /* The address covered by the breakpoint must be
-                           included in [tb->pc, tb->pc + tb->size) in order
-                           to for it to be properly cleared -- thus we
-                           increment the PC here so that the logic setting
-                           tb->size below does the right thing.  */
-                        dc->pc += 4;
-                        goto done_generating;
-                    }
+        bp = NULL;
+        do {
+            bp = cpu_breakpoint_get(cs, db->pc_next, bp);
+            if (unlikely(bp)) {
+                BreakpointCheckType bp_check =
+                    aarch64_trblock_breakpoint_check(db, cs, bp);
+                if (bp_check == BC_HIT_INSN) {
+                    /* Hit, keep translating */
+                    /*
+                     * TODO: if we're never going to have more than one BP in a
+                     *       single address, we can simply use a bool here.
+                     */
                     break;
+                } else {
+                    goto done_generating;
                 }
             }
-        }
+        } while (bp != NULL);
 
         if (db->num_insns == max_insns && (tb->cflags & CF_LAST_IO)) {
             gen_io_start(cpu_env);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 18b0e8fbb6..a7fcaf2a21 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11954,6 +11954,33 @@ static void arm_trblock_insn_start(DisasContextBase *db, CPUState *cpu)
 #endif
 }
 
+static BreakpointCheckType arm_trblock_breakpoint_check(DisasContextBase *db,
+                                                        CPUState *cpu,
+                                                        const CPUBreakpoint *bp)
+{
+    DisasContext *dc = container_of(db, DisasContext, base);
+
+    if (bp->flags & BP_CPU) {
+        gen_set_condexec(dc);
+        gen_set_pc_im(dc, dc->pc);
+        gen_helper_check_breakpoints(cpu_env);
+        /* End the TB early; it's likely not going to be executed */
+        db->is_jmp = DJ_UPDATE;
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
@@ -11964,6 +11991,7 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
     target_ulong next_page_start;
     int max_insns;
     bool end_of_page;
+    CPUBreakpoint *bp;
 
     /* generate intermediate code */
 
@@ -12003,32 +12031,24 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
         db->num_insns++;
         arm_trblock_insn_start(db, cpu);
 
-        if (unlikely(!QTAILQ_EMPTY(&cpu->breakpoints))) {
-            CPUBreakpoint *bp;
-            QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
-                if (bp->pc == dc->pc) {
-                    if (bp->flags & BP_CPU) {
-                        gen_set_condexec(dc);
-                        gen_set_pc_im(dc, dc->pc);
-                        gen_helper_check_breakpoints(cpu_env);
-                        /* End the TB early; it's likely not going to be executed */
-                        db->is_jmp = DJ_UPDATE;
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
-                    }
+        bp = NULL;
+        do {
+            bp = cpu_breakpoint_get(cpu, db->pc_next, bp);
+            if (unlikely(bp)) {
+                BreakpointCheckType bp_check = arm_trblock_breakpoint_check(
+                    db, cpu, bp);
+                if (bp_check == BC_HIT_INSN) {
+                    /* Hit, keep translating */
+                    /*
+                     * TODO: if we're never going to have more than one BP in a
+                     *       single address, we can simply use a bool here.
+                     */
                     break;
+                } else {
+                    goto done_generating;
                 }
             }
-        }
+        } while (bp != NULL);
 
         if (db->num_insns == max_insns && (tb->cflags & CF_LAST_IO)) {
             gen_io_start(cpu_env);
