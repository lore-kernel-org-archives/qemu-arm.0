Received: by 10.25.44.15 with SMTP id s15csp6359903lfs;
        Wed, 2 Aug 2017 09:50:55 -0700 (PDT)
X-Received: by 10.55.212.194 with SMTP id s63mr22761059qks.102.1501692655253;
        Wed, 02 Aug 2017 09:50:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501692655; cv=none;
        d=google.com; s=arc-20160816;
        b=DwbT0jsYnasGJhIegSkLBeagCi9i87kEa6SwsnyYFbR94j81YZjuW2EnWzaZVt3NLJ
         vqfXjAVametmoW2vrS22Uuxoyqdx1f5NfbSJDu84BYpMf39D8dcfMIxoZogbNXXlSCdS
         +9DRwFJ9q9Uy+OZPaSgwE571WImn23eIjeY0am7DYZSvPoecqS1slMi8ccTzDzF3uAnj
         fxNBmPgYJPCDS3JsN1Pai/kHxN5DsVhvS3L6zOtFmT08qm/obgU9FtVyH+WA2kT64aBk
         l/cmJ9LTpIB6Mx1CnJ66yt/K+xjtDSKm/092Mvs1Y1GV3nwJ2F/d017zGC4Iys04nY4O
         z6xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=xACm1ObE4RWwOUveFdJ0M5TkxnS4WSXWROrEXqq41/Q=;
        b=Aqx0BUR+WDuRtk8vdugRWXZ5d9PTeSnHWMzZ4wX/1XkJoZzh/UK37k4L8ejx/zKAiO
         t/FEQNsHk3YmkaRTTQZPADuCzs7tM0xGmwxTzqChbwGuG4/UbkwE6nDrH3TE4pj5jdHE
         36WCXII+W+4fBhoRSRbdun08Z1syqnL7TvXRGikvR7j8Sy69O+cS6O318M8DsHVYSH4G
         iCFerkUb7OYlMiOFv/8CBUoDH4uODSueWUtGf9Mb0SizmwQr6ermuVTECAUL9Yi7A5Vv
         HdWCpHn1RO9Ue7jNkYXZxcwxjzRLYj/IStmNsSgiczxxp3tg6Hh4QcutkfPEIp4H+M7u
         bCrg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 80si33913625qku.154.2017.08.02.09.50.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 09:50:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48708 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcwrE-0000WY-Jd
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 12:50:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwlC-0003c6-90
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 12:44:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwlB-0004o1-1j
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 12:44:38 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37764)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dcwlA-0003zA-QY; Wed, 02 Aug 2017 12:44:36 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dcwke-0003x6-Ho; Wed, 02 Aug 2017 17:44:04 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  2 Aug 2017 17:43:50 +0100
Message-Id: <1501692241-23310-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 04/15] target/arm: Tighten up Thumb decode where
 new v8M insns will be
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ATsbWcIVaW2r

Tighten up the T32 decoder in the places where new v8M instructions
will be:
 * TT/TTT/TTA/TTAT are in what was nominally LDREX/STREX r15, ...
   which is UNPREDICTABLE:
   make the UNPREDICTABLE behaviour be to UNDEF
 * BXNS/BLXNS are distinguished from BX/BLX via the low 3 bits,
   which in previous architectural versions are SBZ:
   enforce the SBZ via UNDEF rather than ignoring it, and move
   the "ARCH(5)" UNDEF case up so we don't leak a TCG temporary
 * SG is in the encoding which would be LDRD/STRD with rn = r15;
   this is UNPREDICTABLE and we currently UNDEF:
   move this check further up the code so that we don't leak
   TCG temporaries in the UNDEF case and have a better place
   to put the SG decode.

This means that if a v8M binary is accidentally run on v7M
or if a test case hits something that we haven't implemented
yet the behaviour will be obvious (UNDEF) rather than obscure
(plough on treating it as a different instruction).

In the process, add some comments about the instruction patterns
at these points in the decode. Our Thumb and ARM decoders are
very difficult to understand currently, but gradually adding
comments like this should help to clarify what exactly has
been decoded when.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 48 +++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index d1a5f56..3c14cb0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9735,10 +9735,23 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
         abort();
     case 4:
         if (insn & (1 << 22)) {
-            /* Other load/store, table branch.  */
+            /* 0b1110_100x_x1xx_xxxx_xxxx_xxxx_xxxx_xxxx
+             * - load/store doubleword, load/store exclusive, ldacq/strel,
+             *   table branch.
+             */
             if (insn & 0x01200000) {
-                /* Load/store doubleword.  */
+                /* 0b1110_1000_x11x_xxxx_xxxx_xxxx_xxxx_xxxx
+                 *  - load/store dual (post-indexed)
+                 * 0b1111_1001_x10x_xxxx_xxxx_xxxx_xxxx_xxxx
+                 *  - load/store dual (literal and immediate)
+                 * 0b1111_1001_x11x_xxxx_xxxx_xxxx_xxxx_xxxx
+                 *  - load/store dual (pre-indexed)
+                 */
                 if (rn == 15) {
+                    if (insn & (1 << 21)) {
+                        /* UNPREDICTABLE */
+                        goto illegal_op;
+                    }
                     addr = tcg_temp_new_i32();
                     tcg_gen_movi_i32(addr, s->pc & ~3);
                 } else {
@@ -9772,15 +9785,18 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
                 }
                 if (insn & (1 << 21)) {
                     /* Base writeback.  */
-                    if (rn == 15)
-                        goto illegal_op;
                     tcg_gen_addi_i32(addr, addr, offset - 4);
                     store_reg(s, rn, addr);
                 } else {
                     tcg_temp_free_i32(addr);
                 }
             } else if ((insn & (1 << 23)) == 0) {
-                /* Load/store exclusive word.  */
+                /* 0b1110_1000_010x_xxxx_xxxx_xxxx_xxxx_xxxx
+                 * - load/store exclusive word
+                 */
+                if (rs == 15) {
+                    goto illegal_op;
+                }
                 addr = tcg_temp_local_new_i32();
                 load_reg_var(s, addr, rn);
                 tcg_gen_addi_i32(addr, addr, (insn & 0xff) << 2);
@@ -11137,7 +11153,9 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
             break;
         }
         if (insn & (1 << 10)) {
-            /* data processing extended or blx */
+            /* 0b0100_01xx_xxxx_xxxx
+             * - data processing extended, branch and exchange
+             */
             rd = (insn & 7) | ((insn >> 4) & 8);
             rm = (insn >> 3) & 0xf;
             op = (insn >> 8) & 3;
@@ -11160,10 +11178,21 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
                 tmp = load_reg(s, rm);
                 store_reg(s, rd, tmp);
                 break;
-            case 3:/* branch [and link] exchange thumb register */
-                tmp = load_reg(s, rm);
-                if (insn & (1 << 7)) {
+            case 3:
+            {
+                /* 0b0100_0111_xxxx_xxxx
+                 * - branch [and link] exchange thumb register
+                 */
+                bool link = insn & (1 << 7);
+
+                if (insn & 7) {
+                    goto undef;
+                }
+                if (link) {
                     ARCH(5);
+                }
+                tmp = load_reg(s, rm);
+                if (link) {
                     val = (uint32_t)s->pc | 1;
                     tmp2 = tcg_temp_new_i32();
                     tcg_gen_movi_i32(tmp2, val);
@@ -11175,6 +11204,7 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
                 }
                 break;
             }
+            }
             break;
         }
 
-- 
2.7.4

