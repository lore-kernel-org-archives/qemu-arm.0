Received: by 10.25.15.197 with SMTP id 66csp915450lfp;
        Sun, 25 Jun 2017 03:08:40 -0700 (PDT)
X-Received: by 10.84.131.6 with SMTP id 6mr18544440pld.33.1498385320130;
        Sun, 25 Jun 2017 03:08:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498385320; cv=none;
        d=google.com; s=arc-20160816;
        b=YXUQ7r5ijz/nlFO4ERBQfw2TY2Gpx8L01LeGiNjwpwwz2kJYYqJ4oqSds89uawOzJs
         YqvEq6bQs+pHwaWl/jobrKdsbPQ3Rawrs7PGDK7J6Y67bnVgHV3iJ4EP790s/YWAKE+C
         mHGDre9COeKxDna/P9AZM2RWFHPe6pYmkR2uRI52mbhQLxSGCPdUDAOBWhc4GNl1wb9w
         lDOPLi19T6mjlfy6xjzHVp/Iuzp1JZGUjAjmKarBbvwCZLFlRNq+CoFeLcEQS9ixmKlS
         tD5HCZ5YWbCDl/227CCbKPw/UpnI7mvy+I9mC2OoS/mwFdnQcaNyoNPNIerLBsxMntkC
         pgaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=3nDKgmD52P1R2RLFV1LI2+G6DpG2V+Pbxx/L5iyU+YE=;
        b=FLBt5Ln9oWA9wR2gaoQ54CnB5+VGyOx05+ZEsfXPQ1WJ/DRaVjMqfCgQVp9rJymBVJ
         XE4mclFeApvC3k4s/O5EFH5+RR/ItNZCSgyjKDHq2RPjs+0oMnMEjP4SupyRgcx7ixOI
         W1E3xl2xdHGS8q9VD8llkyRuDoH6OCAqtpOAgaFkxRlBpbiyKYjbh+6yZvUaXIp+m/cM
         ydq8NhmVD2gH1hDUjgzI/qRgZtluDy/F5UVtl/rHGv4DqKtwNB+jN9saHuDOJjGrwz2Z
         LSnmGo9SQNotZXEW9c8+PJlFvjORKJXhJ1cQh35zU9Tj2d4DDjvb8WZuXchzhPyCZWbK
         wAjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id 198si4190946pfu.378.2017.06.25.03.08.38;
        Sun, 25 Jun 2017 03:08:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5PA8amZ020432;
	Sun, 25 Jun 2017 12:08:36 +0200
Received: from localhost (unknown [132.68.53.125])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id 445B712B4;
	Sun, 25 Jun 2017 12:08:31 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v9 21/26] target: [tcg,arm] Port to insn_start
Date: Sun, 25 Jun 2017 13:08:30 +0300
Message-Id: <149838531005.6497.12362377034456580175.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
References: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: Dn/JzkgZoIuh

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate-a64.c |   11 +++++++++--
 target/arm/translate.c     |   36 +++++++++++++++++++++---------------
 2 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 1959f27377..bfc2cdabb5 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11259,6 +11259,14 @@ static void aarch64_trblock_init_disas_context(DisasContextBase *db,
     init_tmp_a64_array(dc);
 }
 
+static void aarch64_trblock_insn_start(DisasContextBase *db, CPUState *cpu)
+{
+    DisasContext *dc = container_of(db, DisasContext, base);
+
+    dc->insn_start_idx = tcg_op_buf_count();
+    tcg_gen_insn_start(dc->pc, 0, 0);
+}
+
 void gen_intermediate_code_a64(DisasContextBase *db, ARMCPU *cpu,
                                TranslationBlock *tb)
 {
@@ -11291,8 +11299,7 @@ void gen_intermediate_code_a64(DisasContextBase *db, ARMCPU *cpu,
 
     do {
         db->num_insns++;
-        dc->insn_start_idx = tcg_op_buf_count();
-        tcg_gen_insn_start(dc->pc, 0, 0);
+        aarch64_trblock_insn_start(db, cs);
 
         if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
             CPUBreakpoint *bp;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index ae3f772446..18b0e8fbb6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11934,6 +11934,26 @@ static void arm_trblock_tb_start(DisasContextBase *db, CPUState *cpu)
     }
 }
 
+static void arm_trblock_insn_start(DisasContextBase *db, CPUState *cpu)
+{
+    DisasContext *dc = container_of(db, DisasContext, base);
+
+    dc->insn_start_idx = tcg_op_buf_count();
+    tcg_gen_insn_start(dc->pc,
+                       (dc->condexec_cond << 4) | (dc->condexec_mask >> 1),
+                       0);
+
+#ifdef CONFIG_USER_ONLY
+    /* Intercept jump to the magic kernel page.  */
+    if (dc->pc >= 0xffff0000) {
+        /* We always get here via a jump, so know we are not in a
+           conditional execution block.  */
+        gen_exception_internal(EXCP_KERNEL_TRAP);
+        dc->is_jmp = DJ_EXC;
+    }
+#endif
+}
+
 /* generate intermediate code for basic block 'tb'.  */
 void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
 {
@@ -11981,21 +12001,7 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
 
     do {
         db->num_insns++;
-        dc->insn_start_idx = tcg_op_buf_count();
-        tcg_gen_insn_start(dc->pc,
-                           (dc->condexec_cond << 4) | (dc->condexec_mask >> 1),
-                           0);
-
-#ifdef CONFIG_USER_ONLY
-        /* Intercept jump to the magic kernel page.  */
-        if (dc->pc >= 0xffff0000) {
-            /* We always get here via a jump, so know we are not in a
-               conditional execution block.  */
-            gen_exception_internal(EXCP_KERNEL_TRAP);
-            dc->is_jmp = DJ_EXC;
-            break;
-        }
-#endif
+        arm_trblock_insn_start(db, cpu);
 
         if (unlikely(!QTAILQ_EMPTY(&cpu->breakpoints))) {
             CPUBreakpoint *bp;
