Received: by 10.25.15.197 with SMTP id 66csp914373lfp;
        Sun, 25 Jun 2017 03:04:35 -0700 (PDT)
X-Received: by 10.46.19.18 with SMTP id 18mr5273309ljt.57.1498385075496;
        Sun, 25 Jun 2017 03:04:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498385075; cv=none;
        d=google.com; s=arc-20160816;
        b=csiiS8AP2N2XhYuy0NWqir4B42wdNoXrm6fAOpcFmKLhOyv0oTBKQ1pLyhehvauV6n
         FB6d3ql3uOdkgZwy157dfnFAaWPdEe0Wow+QAUDiX4nRGV5O2P1cAvumEOhYkz50MjfF
         qHJ8qHdYdfzCUDnnihBDttRKDFfDKthbrEPC73wlN/IFZ3DztFS/Wgoy4sK97rlgSu2E
         mtgZqDZ09HFOzgkPUDWhPecIG4/ssVJjQ46Wh0SeeLsxgiRlzK+EeZUGha40tLpfe5Yj
         bjjcHpSIfoEFjzCOdMSqbLXQ9wjVjtPBvEYqoJyfm/v15T+bRVzDzWDLVOg1wKa/f++2
         NkSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=m/e0cLaiYncbIVZ8nBeCxSznz5Wt6rT/1tmcyn64LAI=;
        b=RHuJ1hq+DhymCDRVdPvC3pstS2hHaemInXk6YkxCHEmfR1sUCzvcq57gtm6zJTJxP+
         uvSlUHg6q96V/OygoQD5ieqJLirCyEuYfDvvLOC90PSxOcvsMX8VH5Hvrga52hbo0tgP
         vi+mC0I/YnAQpyp/xIB2G8o7l9h1mSyfSDiNW4YXV0QfJstlxI3xbzIghKyeKlpEmVf3
         IOmcltpawxLuAqnMbCjpqfPKRi0lCox+/ybY3PlxPl5SIIlATa/qwToFUT7j4S0JL6Fs
         irGXHINFbPnHrWmqpQAxZdfo4BmKYt//VbxU5gSkpATmt2Xde2PzBoZoV/1jMispz5Ah
         L0/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id h6si4251186ljb.98.2017.06.25.03.04.35;
        Sun, 25 Jun 2017 03:04:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5PA4YoC020356;
	Sun, 25 Jun 2017 12:04:34 +0200
Received: from localhost (unknown [132.68.53.125])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id 51C7E12B4;
	Sun, 25 Jun 2017 12:04:29 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v9 20/26] target: [tcg,arm] Port to tb_start
Date: Sun, 25 Jun 2017 13:04:27 +0300
Message-Id: <149838506776.6497.12965175172938472340.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
References: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: QYRJhJlkb1gM

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate.c |   82 ++++++++++++++++++++++++++----------------------
 1 file changed, 44 insertions(+), 38 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index cc11dacd56..ae3f772446 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11891,6 +11891,49 @@ static void arm_trblock_init_globals(DisasContextBase *db, CPUState *cpu)
     cpu_M0 = tcg_temp_new_i64();
 }
 
+static void arm_trblock_tb_start(DisasContextBase *db, CPUState *cpu)
+{
+    DisasContext *dc = container_of(db, DisasContext, base);
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
@@ -11934,45 +11977,8 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
     gen_tb_start(tb, cpu_env);
 
     tcg_clear_temp_count();
+    arm_trblock_tb_start(db, cpu);
 
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
         db->num_insns++;
         dc->insn_start_idx = tcg_op_buf_count();
