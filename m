Received: by 10.25.44.15 with SMTP id s15csp668949lfs;
        Fri, 14 Jul 2017 02:18:19 -0700 (PDT)
X-Received: by 10.28.133.76 with SMTP id h73mr1878492wmd.92.1500023899782;
        Fri, 14 Jul 2017 02:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500023899; cv=none;
        d=google.com; s=arc-20160816;
        b=l+PrlegeDnl+9l+85ooAUwg+lvgUDICMnxszZedBZb8FLfW6NtoTj3svnuISC75Tlh
         yVqzvfmlmP3GmRVey8DdGMUiF3IIVWsTr3eG/i21wSBYLLMEYSRZql93E0aui2mVfxBy
         Kkte44TmVnFa+Y3FUhFnAHvKnjPiyRnPBXsfPY5BCVimUGEw/qzrZYf77Xf4HDgqeUNu
         EHs0i7BN2fcKJ32Atit+6ENtnAqwezDQvcqaJXGNMqrCd4fTwkdB1GI20rJAUDxS4fS2
         Yak4YCbeGSIqmu2Dp1D4FeN9pBxMzW/Z803RP0k0JDDIQaPfhmqXiJFYyw2jlAt8JREc
         taqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=ZFre8EZNsKjqhzuKSvpiA+zsbYrIjY9LWDI456H3VFI=;
        b=BapHwyVQKJI6h4st3P7X4kvipNeBHGOqPmzcyORNouDizNw34tqQ5GWbPeiyZWWeMt
         wP7AKuYkLCs8dPW9SBXpw3HUp1uLVtYqcGDs3eRy01OjuGrNJ8YWn/acu8BeB0b0tXL+
         s7bxPTqZfSBGgqgzUNWBgt/QlSiAqozHNvSSPCIi3W36e8z44RMshLKH/goAjetIhm8Y
         c3cNTNpUibuS8BzURghzPka8SlNJchBY5Mm10cWbWPcRkTBOMoDnIrYVJW33SBurgPLH
         bmOt85MtnTwn2ll6hAC5IhPGMFTz03Q9OJTsBDaOwluFt7C0fNvFjvDUPhS+o4hz6Zo4
         qpeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id l4si1758916wmf.176.2017.07.14.02.18.19;
        Fri, 14 Jul 2017 02:18:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v6E9IGYe009328;
	Fri, 14 Jul 2017 11:18:16 +0200
Received: from localhost (unknown [31.210.188.120])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 204DD114;
	Fri, 14 Jul 2017 11:18:10 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v13 16/26] target/arm: [tcg] Port to insn_start
Date: Fri, 14 Jul 2017 12:18:09 +0300
Message-Id: <150002388959.22386.12439646324427589940.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
References: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 3oGghmyQ1NDp

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
Reviewed-by: Richard Henderson <rth@twiddle.net>
Reviewed-by: Alex Benneé <alex.benee@linaro.org>
---
 target/arm/translate.c |   36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9adefae7e1..b9183fc511 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11897,6 +11897,26 @@ static void arm_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu,
     }
 }
 
+static void arm_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
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
+        dc->base.is_jmp = DISAS_EXC;
+    }
+#endif
+}
+
 /* generate intermediate code for basic block 'tb'.  */
 void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
 {
@@ -11940,21 +11960,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
 
     do {
         dc->base.num_insns++;
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
-            dc->base.is_jmp = DISAS_EXC;
-            break;
-        }
-#endif
+        arm_tr_insn_start(&dc->base, cs);
 
         if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
             CPUBreakpoint *bp;
