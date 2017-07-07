Received: by 10.25.44.15 with SMTP id s15csp60628lfs;
        Fri, 7 Jul 2017 05:46:16 -0700 (PDT)
X-Received: by 10.223.170.75 with SMTP id q11mr772339wrd.72.1499431576110;
        Fri, 07 Jul 2017 05:46:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499431576; cv=none;
        d=google.com; s=arc-20160816;
        b=yCHCICdNqVMbu1GzuYjlBtZgqdET6hbwRPxohyyDTjBsEHk3sE6vIp007IQ8krcGrG
         ugA8XoqHPRBvN6D/U7+aUhG/w+CghxIs8lUu6DE+Hr2ygY/KLFRyep5D78oiGjOL9buP
         lOPrCwDJ58FGlNnjvJQv4bALJn7PAEV59+e8UflfQd0x4lwjc51phQTA/pjIDQ0+TOVf
         1s30U7ukIFwCfEzd6Qfsey7RtgfMhntrVWtesY2DpVFMJ27JJ4ndlCBxVqBxQEnnsIlO
         sMjlSWuYbSzO5Luge/sYcB1+174noZICSeGMkAQVNWeZkQd8u32QykDMnJBalMHo2ybJ
         hsOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=kcjqK6w4ziZeRdkv9mi60wIB2ggc7MggKSlBPaGLtqY=;
        b=crV8xemAa4WpER0yZkDrra78PXRXyrnnDg5w7icKNeziyq21I81w1VKAYgvP93DGjD
         5cvePoyi2HNAz1yoa1p40gDee023tb84x6AhjrU/Xa/YEM+60JoX+mNY8YsYi5D8fM0j
         wp3MPj+PLOJ7acC56Cdm9P54buMN18Vyb6VqcbS+y9Sui3WmJNZcm0hl4Lqkr5NjayuE
         SgWhDcHOrMQtB98HopTjVOyYEknD6ErMUNJPjg0A0e94VA9EizHBznsNFnM5p+KSNH8D
         +Zq25H2yBoPLkS0nes0mBRP8fkpWcKhGCdJJGKAh1LYlSw69sM2aVC+YtIm+//JPq8N4
         bjng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id i12si2085030wrc.136.2017.07.07.05.46.15;
        Fri, 07 Jul 2017 05:46:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v67CkCVO021789;
	Fri, 7 Jul 2017 14:46:12 +0200
Received: from localhost (63.red-83-51-187.dynamicip.rima-tde.net [83.51.187.63])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id 22287456;
	Fri,  7 Jul 2017 14:46:07 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v12 16/27] target/arm: [tcg] Port to tb_start
Date: Fri,  7 Jul 2017 14:46:00 +0200
Message-Id: <149943155988.8972.13072889393603458854.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <149942760788.8972.474351671751194003.stgit@frigg.lan>
References: <149942760788.8972.474351671751194003.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: ilwH78VmduLo

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 target/arm/translate.c |   82 ++++++++++++++++++++++++++----------------------
 1 file changed, 44 insertions(+), 38 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 0179b1ce79..22af4e372a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11853,6 +11853,49 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase,
     cpu_M0 = tcg_temp_new_i64();
 }
 
+static void arm_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu)
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
 void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
 {
@@ -11892,45 +11935,8 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
     gen_tb_start(tb);
 
     tcg_clear_temp_count();
+    arm_tr_tb_start(&dc->base, cs);
 
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
