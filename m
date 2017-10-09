Received: by 10.223.197.9 with SMTP id q9csp2470222wrf;
        Mon, 9 Oct 2017 06:49:06 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAFe5cQlTkLqcofB1W+fF1O5VVVk0nmTlbBZObimSemC57i83idmkM6hRHnTtplpxrkCX83
X-Received: by 10.237.59.198 with SMTP id s6mr14964614qte.281.1507556946774;
        Mon, 09 Oct 2017 06:49:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507556946; cv=none;
        d=google.com; s=arc-20160816;
        b=zG7URhKNPfryyUI2DLTTZ2JUqDdm66/yU9KBfc7MatJYgV+GRUrVsUneCcjVqsMKjP
         Fjg1BKAYlcQg7Fv7doFqF1sNoN44BEfWGPnttrdLl6/jdH/bmT/6iU1aD0Vhrd+QSxoU
         +GkkJwKD52ujglWYkD/jnrx0nPlC9CfHdEwBgt5vpaY0MkvWXPK3YcnYclwTr34buYER
         ZNR8dbpO2z419WUWOwyAdv9kxMOihx/5w2AwY7SC9i3HnZCELYvxASmUdyJ5az30wLjv
         AUCQ7145skUflZgMKbZqEIV23viHBwXjAlAvdLH3IKUJcAm7zqo2rZtpJ1GJ3iZs5FW3
         lt7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=HfkvtX/5ex7btrwBCHOLOHxshPqOEyQgHN6qs1CgxiQ=;
        b=TIugqEh4G+ihdyJZrjDHhTayuqwYHe7r7GZLDlI5JyrstrEkYfMPDNuNvrJ12dF/4e
         KAnkXM4uNvNapjl0vASwk7CYvL5fXEt9Y8uxj/Hz4bjVP7zhAyf68gMEik8Z+GFuEGEp
         WEuaClHPRhTiQfPl/BidjaLLy/K1kewNdTyhnoPnMkXkZryQJuRdJzpcGFMF8dUzKyVL
         XmQj2+CKGaCVjHWheQlNEHbg8DvcizoIDuieA3hNcXpQY7l0sFbWKNU2qezKZLyvOCHs
         WWK1DfHjDvDrcEnpb3AAgKtRK/J1uuq38EaWHLKIXJPg2YKkfgazP86OAKjtgFxyCgG8
         f8PA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q15si1020905qte.2.2017.10.09.06.49.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 06:49:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57993 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1YQc-0001Jo-6n
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 09:49:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1e1YQM-0001HD-Uo
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 09:48:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1e1YQM-00045W-2G
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 09:48:51 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37778)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1e1YQL-0003zX-R4; Mon, 09 Oct 2017 09:48:49 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1e1YQE-0004ZG-UP; Mon, 09 Oct 2017 14:48:42 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 Oct 2017 14:48:37 +0100
Message-Id: <1507556919-24992-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507556919-24992-1-git-send-email-peter.maydell@linaro.org>
References: <1507556919-24992-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 7/9] target-arm: Simplify insn_crosses_page()
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
X-TUID: YX1sKAdW3Blg

Recent changes have left insn_crosses_page() more complicated
than it needed to be:
 * it's only called from thumb_tr_translate_insn() so we know
   for certain that we're looking at a Thumb insn
 * the caller's check for dc->pc >= dc->next_page_start - 3
   means that dc->pc can't possibly be 4 aligned, so there's
   no need to check that (the check was partly there to ensure
   that we didn't treat an ARM insn as Thumb, I think)
 * we now have thumb_insn_is_16bit() which lets us do a precise
   check of the length of the next insn, rather than opencoding
   an inaccurate check

Simplify it down to just loading the first half of the insn
and calling thumb_insn_is_16bit() on it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 8d3203e..5838e67 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11875,29 +11875,14 @@ static bool insn_crosses_page(CPUARMState *env, DisasContext *s)
 {
     /* Return true if the insn at dc->pc might cross a page boundary.
      * (False positives are OK, false negatives are not.)
+     * We know this is a Thumb insn, and our caller ensures we are
+     * only called if dc->pc is less than 4 bytes from the page
+     * boundary, so we cross the page if the first 16 bits indicate
+     * that this is a 32 bit insn.
      */
-    uint16_t insn;
+    uint16_t insn = arm_lduw_code(env, s->pc, s->sctlr_b);
 
-    if ((s->pc & 3) == 0) {
-        /* At a 4-aligned address we can't be crossing a page */
-        return false;
-    }
-
-    /* This must be a Thumb insn */
-    insn = arm_lduw_code(env, s->pc, s->sctlr_b);
-
-    if ((insn >> 11) >= 0x1d) {
-        /* Top five bits 0b11101 / 0b11110 / 0b11111 : this is the
-         * First half of a 32-bit Thumb insn. Thumb-1 cores might
-         * end up actually treating this as two 16-bit insns (see the
-         * code at the start of disas_thumb2_insn()) but we don't bother
-         * to check for that as it is unlikely, and false positives here
-         * are harmless.
-         */
-        return true;
-    }
-    /* Definitely a 16-bit insn, can't be crossing a page. */
-    return false;
+    return !thumb_insn_is_16bit(s, insn);
 }
 
 static int arm_tr_init_disas_context(DisasContextBase *dcbase,
-- 
2.7.4

