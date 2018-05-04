Received: by 10.28.4.212 with SMTP id 203csp159860wme;
        Fri, 4 May 2018 08:34:52 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrET4Df9inJO1/3GVyrcXCXrg3EHaMH0Yhe8Vx5NqCPQAtpMXGMQh6Q6qfN3tv10PZgbtDt
X-Received: by 2002:ac8:668c:: with SMTP id d12-v6mr24017048qtp.344.1525448092338;
        Fri, 04 May 2018 08:34:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525448092; cv=none;
        d=google.com; s=arc-20160816;
        b=IR5GSwJwaQJj64R2ineZTWU4K8bpq6frEmIXOMRltIIfsdYDROtiXJfsLLSG/BBW86
         UXKtpU0RQfF3HCjtvLYfnzE13vPQEC8GzOFvaMcKGnuL+lLNaNUtgqL3vERG0bCh61Wm
         TLXscfUi4H3wgsA7NKlKQcLwP2SWC6tBBstAVM0YRo5dSV6PP5nCGXWGqEeETvHrXky6
         UsGvp/j8hBlpRHlkMLMhYAG4tT1UhVlROligjgpZ/rjfLQrnnyUf2KqLqfQWnrTvY082
         L6n8+cTVhw75qO8tzfTC1q8+lQnBTXotParWwGgxuCz4ALhIBceUrrGHeDCnmsnNrgwB
         mb8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=F6s+LEZ+RiNHL99qcZDjeG71kp9aO/KPuht4xTYTogs=;
        b=bo1vT8gdbQhI+EZeIz3HQWpuSJv5fGm1qBCQPfA0NLTtFw1z6M/Su4hKN7M16fjPRL
         oPzN3W+XTh4LIa3h1GwsykSmu3n4h5L8/6KSZkTHfUi3bMH9Ccu3t+4E4RAeuDur5TOs
         HoaSwGJmGHDBBn+p97ZFpBTp1c5z/e26BbBRztOKv+nOqkuvZhrekCFT7Qihk5DAo4sg
         HyKXwK5k/k7d2t9fH59pnbwofSrtgWwugyLp24/MItfbtDDpdlgQQXSBb1kDFcVhEALw
         pHuzXRRVv5C7CjctZDz+eq6VfTz8kkMxqOHe2TlhNLrIYc9V7ny04fj0KC4p+5Q/iYus
         T/gw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g127si1566384qkb.90.2018.05.04.08.34.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 May 2018 08:34:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34884 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEcjT-0007No-Pg
	for alex.bennee@linaro.org; Fri, 04 May 2018 11:34:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fEcjJ-0007NK-HS
	for qemu-arm@nongnu.org; Fri, 04 May 2018 11:34:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fEcjI-0006el-JL
	for qemu-arm@nongnu.org; Fri, 04 May 2018 11:34:41 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:41470)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fEcjI-0006cu-AJ; Fri, 04 May 2018 11:34:40 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fEcjA-0002tD-7h; Fri, 04 May 2018 16:34:32 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  4 May 2018 16:34:31 +0100
Message-Id: <20180504153431.5169-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] tcg/i386: Fix dup_vec in non-AVX2 codepath
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
Cc: Richard Henderson <rth@twiddle.net>, qemu-stable@nongnu.org,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fCBOOElrKVwz

The VPUNPCKLD* instructions are all "non-destructive source",
indicated by "NDS" in the encoding string in the x86 ISA manual.
This means that they take two source operands, one of which is
encoded in the VEX.vvvv field. We were incorrectly treating them
as if they were destructive-source and passing 0 as the 'v'
argument of tcg_out_vex_modrm(). This meant we were always
using %xmm0 as one of the source operands, causing incorrect
results if the register allocator happened to want to use
something else. For instance the input AArch64 insn:
 DUP v26.16b, w21
which becomes TCG IR ops:
 dup_vec v128,e8,tmp2,x21
 st_vec v128,e8,tmp2,env,$0xa40
was assembled to:
0x607c568c:  c4 c1 7a 7e 86 e8 00 00  vmovq    0xe8(%r14), %xmm0
0x607c5694:  00
0x607c5695:  c5 f9 60 c8              vpunpcklbw %xmm0, %xmm0, %xmm1
0x607c5699:  c5 f9 61 c9              vpunpcklwd %xmm1, %xmm0, %xmm1
0x607c569d:  c5 f9 70 c9 00           vpshufd  $0, %xmm1, %xmm1
0x607c56a2:  c4 c1 7a 7f 8e 40 0a 00  vmovdqu  %xmm1, 0xa40(%r14)
0x607c56aa:  00

when the vpunpcklwd insn should be "%xmm1, %xmm1, %xmm1".
This resulted in our incorrectly setting the output vector to
q26=0000320000003200:0000320000003200
when given an input of x21 == 0000000002803200
rather than the expected all-zeroes.

Pass the correct source register number to tcg_out_vex_modrm()
for these insns.

Fixes: 770c2fc7bb70804a
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tcg/i386/tcg-target.inc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c
index d7e59e79c5..5357909fff 100644
--- a/tcg/i386/tcg-target.inc.c
+++ b/tcg/i386/tcg-target.inc.c
@@ -854,11 +854,11 @@ static void tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
         switch (vece) {
         case MO_8:
             /* ??? With zero in a register, use PSHUFB.  */
-            tcg_out_vex_modrm(s, OPC_PUNPCKLBW, r, 0, a);
+            tcg_out_vex_modrm(s, OPC_PUNPCKLBW, r, a, a);
             a = r;
             /* FALLTHRU */
         case MO_16:
-            tcg_out_vex_modrm(s, OPC_PUNPCKLWD, r, 0, a);
+            tcg_out_vex_modrm(s, OPC_PUNPCKLWD, r, a, a);
             a = r;
             /* FALLTHRU */
         case MO_32:
@@ -867,7 +867,7 @@ static void tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
             tcg_out8(s, 0);
             break;
         case MO_64:
-            tcg_out_vex_modrm(s, OPC_PUNPCKLQDQ, r, 0, a);
+            tcg_out_vex_modrm(s, OPC_PUNPCKLQDQ, r, a, a);
             break;
         default:
             g_assert_not_reached();
-- 
2.17.0

