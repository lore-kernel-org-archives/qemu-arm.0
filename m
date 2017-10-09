Received: by 10.223.197.9 with SMTP id q9csp2470170wrf;
        Mon, 9 Oct 2017 06:49:02 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QD95ZKd/+IMFo2oFR5yFb5bFaYMc42gLMOMOZSI61QvLj1FScpI/cJCt1A7PxBRGcihA5ot
X-Received: by 10.200.56.193 with SMTP id g1mr11982372qtc.67.1507556942334;
        Mon, 09 Oct 2017 06:49:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507556942; cv=none;
        d=google.com; s=arc-20160816;
        b=kbtDCRDDVTBzyVOv7nYqc5OdTCNtbEgldRsrNi41N0Xrc7RQ4gbRMcL0hKh7MDum0j
         zyn1ayY0IfUVmHr/G4ihfyuxxVf4RZN+4wTdshJzFbJvFTlp/uZ565Sas3D08b+YgXZp
         K+EPvZCDMcb1C15qkMH0msqBaV+24Wu3vNoBno4oUzRYW9h3+9avTADsTSlDzN11mGoE
         7oRvi2q89SlbueSgfSXxE4ReBb23jwp37S9MD8dIm2Kz8VfdRwbw66zhFAHoUiGIgH/2
         NboPOrycU7fppfxlGwdLsxtbI8IJH/1HNgTN85IFPaMj2QoWSYLBtEZ3lb9dDAeQAXox
         eVWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=LGIVxSmqV0Y2+kGBIH9c1nY2ZcPEumJZr/CqF3MXwLA=;
        b=xIRX2WFTlo22UNIzO1gfJYXt2vr4bCBlJs4AK5jth6UgQA0wK336bFVhiAI0LtEN9z
         IqIfvkJGHsYdbJHHlITe5o5voARcC0F2vLMAMyrherxYrDC9fxitx3wNPT2MnrDHCLeU
         77Gwue4mXDrzoplFMHWs3whhNL53jni4BF0P5jjimdv9CWqrwk+WqRW0htvvTWXv9NtE
         ZVngVoYpGdzV0npAKMzhFCc82QZFqk2s5XxeE0EIfood7VoHSkE5UIGhNoXQoMeFChDy
         3IA55ibv/0DraVECx9XZq4XbJ11HipQzr0WoOCdwJmdwrg0Xvzqt1YyJHHRj+eFYpyqp
         CtzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x141si1662251qkb.235.2017.10.09.06.49.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 06:49:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57992 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1YQX-0001HP-PF
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 09:49:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1e1YQL-0001GI-13
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 09:48:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1e1YQJ-00044G-WF
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 09:48:49 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37778)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1e1YQJ-0003zX-Oe; Mon, 09 Oct 2017 09:48:47 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1e1YQF-0004Zo-KS; Mon, 09 Oct 2017 14:48:43 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 Oct 2017 14:48:38 +0100
Message-Id: <1507556919-24992-9-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507556919-24992-1-git-send-email-peter.maydell@linaro.org>
References: <1507556919-24992-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 8/9] target/arm: Support some Thumb insns being
 always unconditional
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
Cc: patches@linaro.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fOlHFqsDgS+X

A few Thumb instructions are always unconditional even inside an
IT block (as opposed to being UNPREDICTABLE if used inside an
IT block): BKPT, the v8M SG instruction, and the A profile
HLT (debug halt) instruction.

This means we need to suppress the jump-over-instruction-on-condfail
code generation (though the IT state still advances as usual and
subsequent insns in the IT block may be conditional).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 48 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5838e67..9d16760 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -12115,6 +12115,52 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
        in init_disas_context by adjusting max_insns.  */
 }
 
+static bool thumb_insn_is_unconditional(DisasContext *s, uint32_t insn)
+{
+    /* Return true if this Thumb insn is always unconditional,
+     * even inside an IT block. This is true of only a very few
+     * instructions: BKPT, HLT, and SG.
+     *
+     * A larger class of instructions are UNPREDICTABLE if used
+     * inside an IT block; we do not need to detect those here, because
+     * what we do by default (perform the cc check and update the IT
+     * bits state machine) is a permitted CONSTRAINED UNPREDICTABLE
+     * choice for those situations.
+     *
+     * insn is either a 16-bit or a 32-bit instruction; the two are
+     * distinguishable because for the 16-bit case the top 16 bits
+     * are zeroes, and that isn't a valid 32-bit encoding.
+     */
+    if ((insn & 0xffffff00) == 0xbe00) {
+        /* BKPT */
+        return true;
+    }
+
+    if ((insn & 0xffffffc0) == 0xba80 && arm_dc_feature(s, ARM_FEATURE_V8) &&
+        !arm_dc_feature(s, ARM_FEATURE_M)) {
+        /* HLT: v8A only. This is unconditional even when it is going to
+         * UNDEF; see the v8A ARM ARM DDI0487B.a H3.3.
+         * For v7 cores this was a plain old undefined encoding and so
+         * honours its cc check. (We might be using the encoding as
+         * a semihosting trap, but we don't change the cc check behaviour
+         * on that account, because a debugger connected to a real v7A
+         * core and emulating semihosting traps by catching the UNDEF
+         * exception would also only see cases where the cc check passed.
+         * No guest code should be trying to do a HLT semihosting trap
+         * in an IT block anyway.
+         */
+        return true;
+    }
+
+    if (insn == 0xe97fe97f && arm_dc_feature(s, ARM_FEATURE_V8) &&
+        arm_dc_feature(s, ARM_FEATURE_M)) {
+        /* SG: v8M only */
+        return true;
+    }
+
+    return false;
+}
+
 static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
@@ -12136,7 +12182,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         dc->pc += 2;
     }
 
-    if (dc->condexec_mask) {
+    if (dc->condexec_mask && !thumb_insn_is_unconditional(dc, insn)) {
         uint32_t cond = dc->condexec_cond;
 
         if (cond != 0x0e) {     /* Skip conditional when condition is AL. */
-- 
2.7.4

