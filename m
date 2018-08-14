Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4352559wru;
        Tue, 14 Aug 2018 10:57:19 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxw6oZC3u6dbe1trRVdk6Co4UpaoRLF1V2BMLbmp1WA5JB3/oO+aQeZwaWftZf7nxrelHRI
X-Received: by 2002:ac8:18f8:: with SMTP id o53-v6mr22724889qtk.367.1534269439700;
        Tue, 14 Aug 2018 10:57:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534269439; cv=none;
        d=google.com; s=arc-20160816;
        b=C1rWutm0mnqAmGzDADKkVjOjhSo2l8X4kiIfIsIpsVlEBxZiRIyN6tYEe9wfxeWVwh
         7L8AboVdxEJcQQFseig8EsX4gy7Sg+ZP41lABDdzZdUQrU1Tk+up5Wg3m0JgG2q3YAyB
         dEZpv2bycwi3je4W2oVJ1yAafOywbHP1dbjSbrbPCZnziJxKJAretaF+IP30Nfh6Iw63
         gw3jLMgcawLyFe5Z/YKIAGFRU646fL8n96OaaaA2O8Dn/URot1I/jo4ndKJzcbDrrE10
         Exhhvte2zwmpU0+kcTULcjrrgsuTPxAr4qWy4rSZzq/50at+GiNNTOspDCjs4uTfySDN
         lGWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=dR+sIMhSzyBPJVNcoV84w2lW3MinFwxrlZIrffzws4k=;
        b=hOn7rfiugTW1yHQrdpfnGE9KGCCfANvCfd+Ncu0Xmx9tv22+w78LDa1eIrpQWbx29L
         Rk9KHM2BdnombFw3zSeSNTxABEBLiTUz33lcoPAdbXhoC5knxP+ulljoK/qhNegxsL6/
         dBFAAAzZy+YUfSDQ1dPGwNRlbcu4GejyAkgY5vIydecwzsC2qhNlVrOqmKr1FQjEibia
         hR1n6qgmQs/sZfDMjsx7VfDbDDooMLPjHCFSk11LXkM5v5vgB26Xg/jxasVke5U+pB44
         JvfsHZlgvj5967kkTG312Ok2pZCKfyHKMLbWrr8WzJAQrR7f5Zm2YJpqbmV+1BOip83q
         fFJw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 2-v6si3663517qto.190.2018.08.14.10.57.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 10:57:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45401 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpdZH-0005OR-4f
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 13:57:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rka@sysgo.com>) id 1fpdT3-0002OF-QY
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 13:51:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rka@sysgo.com>) id 1fpdSo-0006g8-NW
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 13:50:53 -0400
Received: from mail.sysgo.com ([176.9.12.79]:60250)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rka@sysgo.com>)
	id 1fpdSJ-0005Y9-WC; Tue, 14 Aug 2018 13:50:08 -0400
From: Roman Kapl <rka@sysgo.com>
To: 
Date: Tue, 14 Aug 2018 18:54:19 +0200
Message-Id: <20180814165419.9116-1-rka@sysgo.com>
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
X-TUID: buelljTOb8wl

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

