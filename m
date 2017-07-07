Received: by 10.25.44.15 with SMTP id s15csp64733lfs;
        Fri, 7 Jul 2017 05:50:22 -0700 (PDT)
X-Received: by 10.223.162.208 with SMTP id t16mr753872wra.151.1499431822524;
        Fri, 07 Jul 2017 05:50:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499431822; cv=none;
        d=google.com; s=arc-20160816;
        b=TrWdj2s9jN7Q3F1Mi1QGjK4azKf3plyuOg2fz8M/ueruGHKSSKy4hWc9fu+DfkPnIE
         E9ELmEROn7f2p9zj64ZrnmueL2TSPpCp3KMWI4CEPRzY7hh6BlhDR8Td8zgLCcINtl+j
         SSfrY1h2eykNNXvSxw0UmIIPU6JKBzCqSWQd3syRgi62E6I6AiGwsKIQPMpXwdaE59xz
         zkmE1Mz+fiHz8JGACY8hGMFfCOv8aOd9DlU+qUPQjK1iUHSjEtGpDXk03LJH9B6xRwL4
         MhioZTzRiNcgj8iBtnR2dQ9SE7H3WKFrswOf43tlgde06Z3VIJPf8ud47EVut1NdTucJ
         waBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=ZVUwHxT00+BwREOXBJANJq6T5ZXO+egRSC5XzmqQRNY=;
        b=vdXAHdPSd4F6SM0OXxMBq9RkbcVulJ45oBcb6ywZhTSR22EvqVTV6FqbbFqEeO/9df
         CjFd5ZswGtafygnapT6pXn4jEj8HS62dFooD1HoRErH4vGqXQ5+weWfJlWpGlLccaQYO
         C2T0pIG/15S+rrW8GGAJ4ZOcIWMN+moL+GI6yt1DJEiD+r/k3DAv+6/jGL0Wl9mKaxW5
         XoTUS1Tzgn2RH+xzs3ANUeZw7OAyCJ7do+aKS05eo9LHisqy+ZQRN1Q609qeULfXBnp9
         y5FMhRdziXaPAQjDo04T29Fe0qi4HOuQurWw41zvRXKF2lXwyXeyNBQH4f1ttzJV2/N2
         MSew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id 128si932382wmz.192.2017.07.07.05.50.22;
        Fri, 07 Jul 2017 05:50:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v67CoJfF021888;
	Fri, 7 Jul 2017 14:50:19 +0200
Received: from localhost (63.red-83-51-187.dynamicip.rima-tde.net [83.51.187.63])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id B5EB0258;
	Fri,  7 Jul 2017 14:50:13 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v12 17/27] target/arm: [tcg] Port to insn_start
Date: Fri,  7 Jul 2017 14:50:07 +0200
Message-Id: <149943180765.8972.18399158340352150851.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <149942760788.8972.474351671751194003.stgit@frigg.lan>
References: <149942760788.8972.474351671751194003.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: Hnv9HF6v+zge

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 target/arm/translate.c |   36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 22af4e372a..7a1935d4d7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11896,6 +11896,26 @@ static void arm_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu)
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
@@ -11939,21 +11959,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
 
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
