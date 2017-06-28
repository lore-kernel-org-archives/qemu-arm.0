Received: by 10.25.227.6 with SMTP id a6csp3062047lfh;
        Wed, 28 Jun 2017 06:29:41 -0700 (PDT)
X-Received: by 10.98.214.195 with SMTP id a64mr10861100pfl.40.1498656581464;
        Wed, 28 Jun 2017 06:29:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498656581; cv=none;
        d=google.com; s=arc-20160816;
        b=hvfcOyzqpxTFCzynG9CSNAEL/WCopwU96nl9gOsh7hLTVXbTP5eszg9m9EpMj3w0Y2
         f/azulolumfQIvxb5emEavO0bzhnre6OmkoyQInmBBhFiAJ0C2PLW986awYw7o8p9OPA
         exZWyhXFwMwmvofxDwXgsoeG3kzXhIsygqrU20bL6SLStAuJHL1apF6E5iEwoLS3iVJz
         hdjpmBX3miE7BK5QdFc5eYjCbgQfVDQyeIz37puS2vcqGbewTA96inR8SoGQCku5fQLh
         qYPJLK1WwLlPZOE3CKunXFIW3Ws0Us8jAKtslJOW7l/XS9vFuQjP6GU7F1E6eQerGtuG
         5Adg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=kKbKxk4VmQdS2B6vie4QaiI9IsLbsCoD2fPpH/w7K0c=;
        b=NcyvuGi49N6ulJPvHI3oHzSXSzak26J9tL46RHVIltZ2bluqXxmUUhnPOilTfbSkR1
         lyvyqNqRbFzxYlBTiRGGcoON2+OGBBjF45PfIyI4uJ/95WsV9rJtRepGC3EWNEDBLrjB
         QTSVkvHWXks64GqlY/gsIS3Hq3ISCzwj3Tmf+a1QZFPOAbzX4/gjQGRHOorFPytG+okR
         xus01RvKQqVHzStueH0g6EzqIvswldXWL7+mwo8keTKyDH/CYV0VfpQ5l8QoYQtzoI1t
         Uibt6OYDye9qsVXlxemhmaGRuWziTZFROVbLAxK2srN/PD50Y+csClhoVTlUPPeMl7N3
         Yflw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id o10si1527609pge.508.2017.06.28.06.29.39;
        Wed, 28 Jun 2017 06:29:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5SDTZ0w027561;
	Wed, 28 Jun 2017 15:29:35 +0200
Received: from localhost (unknown [132.68.50.243])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id C7C751E3;
	Wed, 28 Jun 2017 15:29:17 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v11 18/29] target/arm: [tcg] Port to tb_start
Date: Wed, 28 Jun 2017 16:29:16 +0300
Message-Id: <149865655643.17063.11835076868609448555.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: VkjOg5o4D/YY

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate.c |   82 ++++++++++++++++++++++++++----------------------
 1 file changed, 44 insertions(+), 38 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index fc28cd45f7..029c4d3550 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11855,6 +11855,49 @@ static void arm_trblock_init_globals(DisasContextBase *dcbase, CPUState *cpu)
     cpu_M0 = tcg_temp_new_i64();
 }
 
+static void arm_trblock_tb_start(DisasContextBase *dcbase, CPUState *cpu)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+
+    /* A note on handling of the condexec (IT) bits:
+     *
+     * We want to avoid the overhead of having to write the updated condexec
+     * bits back to the CPUARMState for every instruction in an IT block. So:
+     * (1) if the condexec bits are not already zero then we write
+     * zero back into the CPUARMState now. This avoids complications trying
+     * to do it at the end of the block. (For example if we don't do this
+     * it's hard to identify whether we can safely skip writing condexec
+     * at the end of the TB, which we definitely want to do for the case
+     * where a TB doesn't do anything with the IT state at all.)
+     * (2) if we are going to leave the TB then we call gen_set_condexec()
+     * which will write the correct value into CPUARMState if zero is wrong.
+     * This is done both for leaving the TB at the end, and for leaving
+     * it because of an exception we know will happen, which is done in
+     * gen_exception_insn(). The latter is necessary because we need to
+     * leave the TB with the PC/IT state just prior to execution of the
+     * instruction which caused the exception.
+     * (3) if we leave the TB unexpectedly (eg a data abort on a load)
+     * then the CPUARMState will be wrong and we need to reset it.
+     * This is handled in the same way as restoration of the
+     * PC in these situations; we save the value of the condexec bits
+     * for each PC via tcg_gen_insn_start(), and restore_state_to_opc()
+     * then uses this to restore them after an exception.
+     *
+     * Note that there are no instructions which can read the condexec
+     * bits, and none which can write non-static values to them, so
+     * we don't need to care about whether CPUARMState is correct in the
+     * middle of a TB.
+     */
+
+    /* Reset the conditional execution bits immediately. This avoids
+       complications trying to do it at the end of the block.  */
+    if (dc->condexec_mask || dc->condexec_cond) {
+        TCGv_i32 tmp = tcg_temp_new_i32();
+        tcg_gen_movi_i32(tmp, 0);
+        store_cpu_field(tmp, condexec_bits);
+    }
+}
+
 /* generate intermediate code for basic block 'tb'.  */
 void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
 {
@@ -11896,45 +11939,8 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
     gen_tb_start(tb);
 
     tcg_clear_temp_count();
+    arm_trblock_tb_start(&dc->base, cpu);
 
-    /* A note on handling of the condexec (IT) bits:
-     *
-     * We want to avoid the overhead of having to write the updated condexec
-     * bits back to the CPUARMState for every instruction in an IT block. So:
-     * (1) if the condexec bits are not already zero then we write
-     * zero back into the CPUARMState now. This avoids complications trying
-     * to do it at the end of the block. (For example if we don't do this
-     * it's hard to identify whether we can safely skip writing condexec
-     * at the end of the TB, which we definitely want to do for the case
-     * where a TB doesn't do anything with the IT state at all.)
-     * (2) if we are going to leave the TB then we call gen_set_condexec()
-     * which will write the correct value into CPUARMState if zero is wrong.
-     * This is done both for leaving the TB at the end, and for leaving
-     * it because of an exception we know will happen, which is done in
-     * gen_exception_insn(). The latter is necessary because we need to
-     * leave the TB with the PC/IT state just prior to execution of the
-     * instruction which caused the exception.
-     * (3) if we leave the TB unexpectedly (eg a data abort on a load)
-     * then the CPUARMState will be wrong and we need to reset it.
-     * This is handled in the same way as restoration of the
-     * PC in these situations; we save the value of the condexec bits
-     * for each PC via tcg_gen_insn_start(), and restore_state_to_opc()
-     * then uses this to restore them after an exception.
-     *
-     * Note that there are no instructions which can read the condexec
-     * bits, and none which can write non-static values to them, so
-     * we don't need to care about whether CPUARMState is correct in the
-     * middle of a TB.
-     */
-
-    /* Reset the conditional execution bits immediately. This avoids
-       complications trying to do it at the end of the block.  */
-    if (dc->condexec_mask || dc->condexec_cond)
-      {
-        TCGv_i32 tmp = tcg_temp_new_i32();
-        tcg_gen_movi_i32(tmp, 0);
-        store_cpu_field(tmp, condexec_bits);
-      }
     do {
         dc->base.num_insns++;
         dc->insn_start_idx = tcg_op_buf_count();
