Received: by 10.25.44.15 with SMTP id s15csp665025lfs;
        Fri, 14 Jul 2017 02:14:18 -0700 (PDT)
X-Received: by 10.223.163.12 with SMTP id c12mr3827623wrb.85.1500023658152;
        Fri, 14 Jul 2017 02:14:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500023658; cv=none;
        d=google.com; s=arc-20160816;
        b=YEMHZANxrhTgzeZfFd3grsQdWD0Lf1Aiu4fnD8NcLyBZqnbZWrAwsEatYRtkdYTpIc
         WZcuN4aNCtaBXuX86nwMb75z+9l6VrTM8Scb2MKk2HDoI3f6BQpNK7DHQSkibQZJ+ZEg
         YSWPP+JyQORKGPF9fOrkbDMP+6YpN3iFhIY5OyszUS0y/mpXLdjz02vmXVm2H3VdAOxk
         9+oUuxLnzZ8OGQcCtKV1z0LMPSE7ojTxTfGbiN4ktiTenTZE+YcYV0Hkxn8HxUTDSKPQ
         NS0TMpO90ff+EG2t9NXGoPoMr47vaV+1UF3tS9PaST6kLVKcBTW4Sg8mM03zyCs7PTaT
         CIYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=g34am5htiGcb1W5G7DLvihmU9gVjy8MzRivkjooQYGQ=;
        b=0lFIYNgqtCwqXnScwOnzi5wP1TSDvROZr6yTfCUANIPSaOuBolbf2mceHfXKJsvZ4w
         LJTbQJRNtkH88gqxMXgrzRZHJ5X/xxHS3LllJd7mWfKF6KyixVn7k+yKkNvTSMfMFwCp
         wEA0dlOgbloGEnP6ne8C++UO16hGwpMl0hKj0NBU4mGZhwHTvb7SuGPPorAdXz1joBEd
         +Zrxrm88asoC2ajLofFslOMmFGtQ97B1uyUMJmrNsDxHdpiwEr7rbNQXKNONfjbmTrCV
         fmU9LIIRrC6k+4JHJ9ciN3WbY8+8bcQAF8bGkUR8WWL80Q2kDDJaaHqH6LDdmoVj/Ffg
         Oqwg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id y21si1821915wmh.132.2017.07.14.02.14.17;
        Fri, 14 Jul 2017 02:14:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v6E9EE66009212;
	Fri, 14 Jul 2017 11:14:14 +0200
Received: from localhost (unknown [31.210.188.120])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id D40EE6FE;
	Fri, 14 Jul 2017 11:14:08 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v13 15/26] target/arm: [tcg] Port to tb_start
Date: Fri, 14 Jul 2017 12:14:07 +0300
Message-Id: <150002364681.22386.1701754996184325808.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
References: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: tISJNOd9O+VL

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
Reviewed-by: Richard Henderson <rth@twiddle.net>
Reviewed-by: Alex Benneé <alex.benee@linaro.org>
---
 target/arm/translate.c |   83 ++++++++++++++++++++++++++----------------------
 1 file changed, 45 insertions(+), 38 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 0179b1ce79..9adefae7e1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11853,6 +11853,50 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase,
     cpu_M0 = tcg_temp_new_i64();
 }
 
+static void arm_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu,
+                            int *max_insns)
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
@@ -11892,45 +11936,8 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
     gen_tb_start(tb);
 
     tcg_clear_temp_count();
+    arm_tr_tb_start(&dc->base, cs, &max_insns);
 
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
