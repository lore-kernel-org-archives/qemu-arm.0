Received: by 10.25.227.6 with SMTP id a6csp3066584lfh;
        Wed, 28 Jun 2017 06:33:34 -0700 (PDT)
X-Received: by 10.99.66.193 with SMTP id p184mr10402742pga.253.1498656813858;
        Wed, 28 Jun 2017 06:33:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498656813; cv=none;
        d=google.com; s=arc-20160816;
        b=WZ2LUses6e0bmEqxR9iWox4/A1ZWdln1HgrWon1ShtfoM5Z5I0vjT+Dm4Xw6Na8O4M
         hQwIXoIYnDBiDLswmiQ28h2bSP5k8PP8cSG9zj8sajqZZ+5fJaVRrHV1/gmFAq9QFCUI
         Cc4nuVZb4ltVmI+awGwM0vsj3xBwB/XqcFFq6TLBCbTCLbAGPZSFq4tEq3DN38sc4PGU
         z3OhxDLB69fZqRLypXcWzi2GRGOuE2IP5mtpJ2zglMT9bPmiP5BPbp2zdkiBoeR7HoxI
         pKvxfnZAKdshDmpjMmlGC/eoJ/T/Q1pE2tcE0gXZ1ROHUZ15/OKYHEmrunn7tSi9Dqai
         GLrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=W/6agNkg30FsRkQncvZCWraoCuIuT3FBYIDCGQatMMw=;
        b=0UmHEmoBtLrImQMaGHwJFAGWKE0iSGzQumZtuAZojdfbRgbdoMcKLLkkp3h/8ustv9
         nU3hvbqEm0cmagqrbKzGTVYvIptu0MwVfUbZu01w60i16j5QdoczB7qIHkayTsR2gcz6
         g3U8G8CbrMhhr6qq7jazGufnhywqS0nOWIcStrxJ5Pnn8kHJIijP/FqyPYWE0TLkxZpB
         jChrIeuiIaOP5cHh5G0wDiVNvD3aSct/vg1MAAwlOnHnem8DGQ8R+j4qYTmbdG2S/No7
         iOjapQz01lQUKK7/jbAhYJMpJvOaAMK++HiCqfcLvhEQW98oabWpEXNrB/QNs+QBQoSn
         jIqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id b24si1625270pfk.123.2017.06.28.06.33.32;
        Wed, 28 Jun 2017 06:33:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5SDXShi027675;
	Wed, 28 Jun 2017 15:33:28 +0200
Received: from localhost (unknown [132.68.50.243])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 23C851C4;
	Wed, 28 Jun 2017 15:33:23 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v11 19/29] target/arm: [tcg] Port to insn_start
Date: Wed, 28 Jun 2017 16:33:22 +0300
Message-Id: <149865680190.17063.16072451312204148936.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: E8pfKpDzVbr+

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate.c |   34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 029c4d3550..c7e188b50e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11898,6 +11898,26 @@ static void arm_trblock_tb_start(DisasContextBase *dcbase, CPUState *cpu)
     }
 }
 
+static void arm_trblock_insn_start(DisasContextBase *dcbase, CPUState *cpu)
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
 void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
 {
@@ -11943,21 +11963,11 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
 
     do {
         dc->base.num_insns++;
-        dc->insn_start_idx = tcg_op_buf_count();
-        tcg_gen_insn_start(dc->pc,
-                           (dc->condexec_cond << 4) | (dc->condexec_mask >> 1),
-                           0);
+        arm_trblock_insn_start(&dc->base, cpu);
 
-#ifdef CONFIG_USER_ONLY
-        /* Intercept jump to the magic kernel page.  */
-        if (dc->pc >= 0xffff0000) {
-            /* We always get here via a jump, so know we are not in a
-               conditional execution block.  */
-            gen_exception_internal(EXCP_KERNEL_TRAP);
-            dc->base.is_jmp = DISAS_EXC;
+        if (unlikely(dc->base.is_jmp > DISAS_NEXT)) {
             break;
         }
-#endif
 
         if (unlikely(!QTAILQ_EMPTY(&cpu->breakpoints))) {
             CPUBreakpoint *bp;
