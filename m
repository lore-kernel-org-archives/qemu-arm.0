Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1767637wru;
        Thu, 16 Aug 2018 05:05:58 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPw73QLusURe4haPlfD8qsDElF24qohqEuumOmaGyKQZ5s0IIDEhWtWaQrofoBOpgW6E/ueU
X-Received: by 2002:ac8:2bb3:: with SMTP id m48-v6mr29133104qtm.207.1534421158644;
        Thu, 16 Aug 2018 05:05:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534421158; cv=none;
        d=google.com; s=arc-20160816;
        b=vqhJLJuZfYZ+FDmYbtwmshtzKU4Gn8Wz7gtEic5i8zM91SNmdj4eI+Bp2hmuHGIS6H
         GzY7culvJ5pFciVa+1HgdV3hP35AnIdC+53KLHMU7drNbQceyCcWPN9DdVQhRLwjH880
         PnK1oHxdoNjpdDaePa3XN/GAUlN2SicDqoNiloY6NG9LcIxCI14TwfD3nYCByWOe3DGx
         L3O4FnsoUMdZYKuAjxHe7m0AIUHoxS9d0mcj34740Xpz73a4Y4ARaj9bYfan3yO1b3ad
         FI+m/mvT/X3lzQHcpscz+vWWRi4IDflrn/dnv7Z+WaawrVMwZfStZy6FKF686+NGXI/R
         vTGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=TullNgWKK+R/xc1WaS6HuSm/K23aZ/HxEInMb7e9U48=;
        b=spmOM/bsYrSkH4yuXNB6U/15pI0vwxsHNLUeQ/6MkQyHfZL21kjlqX0OYQ7p6KBgz6
         g4uHSn/gkLjpV7BsixWtfLKtEqvwzKIUuh4goUqilRAWbhK9rFDRV1MXPzOdvwQl5weq
         7CBO0OLzzQQ1ttSAO3WyyjEfKeSI6m3lQ3SPlVQRgtHj64QEnnqKY1a1jCfd9z0iBREn
         XGgXKNtl8XZWXF3wIywG/hLC9QwYjuNrj1YuJL8KIiQVtPMbH2ULmN391BHWxRB0l6Ss
         P8bPtYRxVk9gNfxy68h9X4J3rky4IiAv09XrCtBn4enVrHIqQ8brdBS0PkX3AaTWgjac
         tzCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e6-v6si4624267qte.83.2018.08.16.05.05.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 05:05:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55230 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqH2M-00089Z-3f
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 08:05:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rka@sysgo.com>) id 1fqH28-0007zr-PD
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 08:05:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rka@sysgo.com>) id 1fqH25-00048K-IH
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 08:05:44 -0400
Received: from mail.sysgo.com ([176.9.12.79]:54484)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rka@sysgo.com>)
	id 1fqH25-00047Q-8R; Thu, 16 Aug 2018 08:05:41 -0400
From: Roman Kapl <rka@sysgo.com>
To: 
Date: Thu, 16 Aug 2018 14:05:33 +0200
Message-Id: <20180816120533.6587-1-rka@sysgo.com>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 176.9.12.79
Subject: [Qemu-arm] [PATCH v2] target/arm: crash on conditional instr in it
 block
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Roman Kapl <rka@sysgo.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sU0ygjUYZt9Q

If an instruction is conditional (like CBZ) and it is executed conditionally
(using the ITx instruction), a jump to undefined label is generated.
CBZ in IT block is an unpredictable behavior, and honouring the condition code
is allowed by the spec in this case (constrained unpredictable, ARMv8, section
K1.1.7).

Fix the 'skip on condtion' code to create a new label only if it does not
already exist. Previously multiple labels were created, but only the last one of
them was set.

Signed-off-by: Roman Kapl <rka@sysgo.com>
---
v1 -> v2
 Split arm_conditional_skip into arm_gen_condlabel and arm_skip_unless to
 a) cover all usages
 b) do not force callers to ^1 the condition

 Add note about CBZ in IT block to the commit message.

 target/arm/translate.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f845da7c63..e54e0ca2ba 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8480,6 +8480,22 @@ static void gen_srs(DisasContext *s,
     s->base.is_jmp = DISAS_UPDATE;
 }
 
+/* Generate a labe used for skipping this instruction */
+static void arm_gen_condlabel(DisasContext *s)
+{
+    if (!s->condjmp) {
+        s->condlabel = gen_new_label();
+        s->condjmp = 1;
+    }
+}
+
+/* Skip this instruction if the ARM condition is false */
+static void arm_skip_unless(DisasContext *s, uint32_t cond)
+{
+    arm_gen_condlabel(s);
+    arm_gen_test_cc(cond, s->condlabel ^ 1);
+}
+
 static void disas_arm_insn(DisasContext *s, unsigned int insn)
 {
     unsigned int cond, val, op1, i, shift, rm, rs, rn, rd, sh;
@@ -8709,9 +8725,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
     if (cond != 0xe) {
         /* if not always execute, we generate a conditional jump to
            next instruction */
-        s->condlabel = gen_new_label();
-        arm_gen_test_cc(cond ^ 1, s->condlabel);
-        s->condjmp = 1;
+        arm_skip_unless(s, cond);
     }
     if ((insn & 0x0f900000) == 0x03000000) {
         if ((insn & (1 << 21)) == 0) {
@@ -11205,9 +11219,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 /* Conditional branch.  */
                 op = (insn >> 22) & 0xf;
                 /* Generate a conditional jump to next instruction.  */
-                s->condlabel = gen_new_label();
-                arm_gen_test_cc(op ^ 1, s->condlabel);
-                s->condjmp = 1;
+                arm_skip_unless(s, op);
 
                 /* offset[11:1] = insn[10:0] */
                 offset = (insn & 0x7ff) << 1;
@@ -12131,8 +12143,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         case 1: case 3: case 9: case 11: /* czb */
             rm = insn & 7;
             tmp = load_reg(s, rm);
-            s->condlabel = gen_new_label();
-            s->condjmp = 1;
+            arm_gen_condlabel(s);
             if (insn & (1 << 11))
                 tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 0, s->condlabel);
             else
@@ -12295,9 +12306,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
             break;
         }
         /* generate a conditional jump to next instruction */
-        s->condlabel = gen_new_label();
-        arm_gen_test_cc(cond ^ 1, s->condlabel);
-        s->condjmp = 1;
+        arm_skip_unless(s, cond);
 
         /* jump to the offset */
         val = (uint32_t)s->pc + 2;
@@ -12676,9 +12685,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         uint32_t cond = dc->condexec_cond;
 
         if (cond != 0x0e) {     /* Skip conditional when condition is AL. */
-            dc->condlabel = gen_new_label();
-            arm_gen_test_cc(cond ^ 1, dc->condlabel);
-            dc->condjmp = 1;
+            arm_skip_unless(dc, cond);
         }
     }
 
-- 
2.11.0

