Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4380581wru;
        Tue, 14 Aug 2018 11:26:31 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwBXZQzSV9G5bWFogCUbbSFfWFv/ekRTPNlW7QP00K+OI+HFCqC2lhBKNfkMchl7pe/EoCf
X-Received: by 2002:a37:8506:: with SMTP id h6-v6mr20041680qkd.175.1534271191210;
        Tue, 14 Aug 2018 11:26:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534271191; cv=none;
        d=google.com; s=arc-20160816;
        b=VTgWTM0f1p75lfW+7ywZI/LeELkUIuRIx6wHBNqExJuaDbscGd0IeYlEGbQPcYhqtd
         1IQlFQkhMNOY3gBZSQrt5fDXkltzxLwIzfIqVcfPgsd9sENKrfDEYPi8UPoTfrcNCKxx
         +wwzzPclnKFxqH6Vqe65IE1nVBSaKmtwn0KngnR9lX0xhHjlFZP890wxWulOxk44F72O
         mbegpjcI6YiWdAEAKtEUJGDMHr6difA3zZ0hwUvsaiwu6h105embIOiU2RtmcXT3xvn5
         4Vy0PJZJLJ9nQz5FH5el/Y+c3XTt2MfpnpVpDUEVoRTlX4Q45qBEtH7FXLzCTzBCkukC
         8rVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=dR+sIMhSzyBPJVNcoV84w2lW3MinFwxrlZIrffzws4k=;
        b=NJm0eGSpylPbjndnXhD8JxQB6vMIMfGrMFZkuwNTw7XxoXJpehq53qXtfOhXV/Tvoq
         dqdaVaapB8dJFi/sblCU75SQn2Ex/TfmxlnehiNU9F0PI0n+u6IgmCKRYvmnGheo+0CC
         gw2FUPDtUv3bYiNdvWoVhu4WBxsi9u4cKrWRPn1H7eJEMyYqT28k52eV+GlYb7tQxKfA
         Je5skRF6YVIEuLgxl5/nS8p81N+ZzhhvjqXBtTvg2qLvtMD07HgcvmqQkWG/NClRsVT0
         7fcJ3BpRaFrFQuZ4UXLJeLyMXymFil8JRJAd49wpKK1rgKk6kMBHAoYJba8xk3/LNfGF
         6wUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k4-v6si1222180qkf.310.2018.08.14.11.26.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 11:26:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45627 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpe1W-0001Bb-KV
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 14:26:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rka@sysgo.com>) id 1fpdrz-0002Yw-AP
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 14:17:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rka@sysgo.com>) id 1fpdrX-0004tf-Lq
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 14:16:39 -0400
Received: from mail.sysgo.com ([176.9.12.79]:60778)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rka@sysgo.com>)
	id 1fpdqW-0003kw-9X; Tue, 14 Aug 2018 14:15:08 -0400
From: Roman Kapl <rka@sysgo.com>
To: 
Date: Tue, 14 Aug 2018 18:19:48 +0200
Message-Id: <20180814161948.13590-1-rka@sysgo.com>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 176.9.12.79
Subject: [Qemu-devel] [PATCH] target/arm: crash on conditional instr in it
 block
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Roman Kapl <rka@sysgo.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wkT63qB62dcY

If an instruction is conditional (like CBZ) and it is executed conditionally
(using the ITx instruction), a jump to undefined label is generated.

Fix the 'skip on condtion' code to create a new label only if it does not
already exist. Previously multiple labels were created, but only the last one of
them was set.

Signed-off-by: Roman Kapl <rka@sysgo.com>
---
 target/arm/translate.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f845da7c63..f7c03a36e6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8480,6 +8480,16 @@ static void gen_srs(DisasContext *s,
     s->base.is_jmp = DISAS_UPDATE;
 }
 
+/* Skip this instruction if the condition is true */
+static void arm_conditional_skip(DisasContext *s, uint32_t cond)
+{
+    if (!s->condjmp) {
+        s->condlabel = gen_new_label();
+        s->condjmp = 1;
+    }
+    arm_gen_test_cc(cond, s->condlabel);
+}
+
 static void disas_arm_insn(DisasContext *s, unsigned int insn)
 {
     unsigned int cond, val, op1, i, shift, rm, rs, rn, rd, sh;
@@ -8709,9 +8719,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
     if (cond != 0xe) {
         /* if not always execute, we generate a conditional jump to
            next instruction */
-        s->condlabel = gen_new_label();
-        arm_gen_test_cc(cond ^ 1, s->condlabel);
-        s->condjmp = 1;
+        arm_conditional_skip(s, cond ^ 1);
     }
     if ((insn & 0x0f900000) == 0x03000000) {
         if ((insn & (1 << 21)) == 0) {
@@ -11205,9 +11213,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 /* Conditional branch.  */
                 op = (insn >> 22) & 0xf;
                 /* Generate a conditional jump to next instruction.  */
-                s->condlabel = gen_new_label();
-                arm_gen_test_cc(op ^ 1, s->condlabel);
-                s->condjmp = 1;
+                arm_conditional_skip(s, op ^ 1);
 
                 /* offset[11:1] = insn[10:0] */
                 offset = (insn & 0x7ff) << 1;
@@ -12131,8 +12137,10 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         case 1: case 3: case 9: case 11: /* czb */
             rm = insn & 7;
             tmp = load_reg(s, rm);
-            s->condlabel = gen_new_label();
-            s->condjmp = 1;
+            if (!s->condjmp) {
+                s->condlabel = gen_new_label();
+                s->condjmp = 1;
+            }
             if (insn & (1 << 11))
                 tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 0, s->condlabel);
             else
@@ -12295,9 +12303,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
             break;
         }
         /* generate a conditional jump to next instruction */
-        s->condlabel = gen_new_label();
-        arm_gen_test_cc(cond ^ 1, s->condlabel);
-        s->condjmp = 1;
+        arm_conditional_skip(s, cond ^ 1);
 
         /* jump to the offset */
         val = (uint32_t)s->pc + 2;
@@ -12676,9 +12682,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         uint32_t cond = dc->condexec_cond;
 
         if (cond != 0x0e) {     /* Skip conditional when condition is AL. */
-            dc->condlabel = gen_new_label();
-            arm_gen_test_cc(cond ^ 1, dc->condlabel);
-            dc->condjmp = 1;
+            arm_conditional_skip(dc, cond ^ 1);
         }
     }
 
-- 
2.11.0

