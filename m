Received: by 10.25.0.144 with SMTP id 138csp966156lfa;
        Mon, 10 Apr 2017 10:34:19 -0700 (PDT)
X-Received: by 10.55.158.215 with SMTP id h206mr34573385qke.154.1491845659155;
        Mon, 10 Apr 2017 10:34:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z53si14026490qta.146.2017.04.10.10.34.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 10:34:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35631 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxdCi-0000nS-AS
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 13:34:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cxdCb-0000mt-MQ
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 13:34:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cxdCa-0006qh-TZ
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 13:34:09 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:49130)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cxdCa-0006qG-O3; Mon, 10 Apr 2017 13:34:08 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cxcsn-0005hv-P3; Mon, 10 Apr 2017 18:13:41 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 10 Apr 2017 18:13:32 +0100
Message-Id: <1491844419-12485-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491844419-12485-1-git-send-email-peter.maydell@linaro.org>
References: <1491844419-12485-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 2/9] arm: Thumb shift operations should not
 permit interworking branches
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
Cc: Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ay0QmvsYjEgq

In Thumb mode, the only instructions which can cause an interworking
branch by writing the PC are BLX, BX, BXJ, LDR, POP and LDM. Unlike
ARM mode, data processing instructions which target the PC do not
cause interworking branches.

When we added support for doing interworking branches on writes to
PC from data processing instructions in commit 21aeb3430ce7ba, we
accidentally changed a Thumb instruction to have interworking
branch behaviour for writes to PC. (MOV, MOVS register-shifted
register, encoding T2; this is the standard encoding for
LSL/LSR/ASR/ROR (register).)

For this encoding, behaviour with Rd == R15 is specified as
UNPREDICTABLE, so allowing an interworking branch is within
spec, but it's confusing and differs from our handling of this
class of UNPREDICTABLE for other Thumb ALU operations. Make
it perform a simple (non-interworking) branch like the others.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index fe3f442..ddc62b6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9959,7 +9959,7 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
             gen_arm_shift_reg(tmp, op, tmp2, logic_cc);
             if (logic_cc)
                 gen_logic_CC(tmp);
-            store_reg_bx(s, rd, tmp);
+            store_reg(s, rd, tmp);
             break;
         case 1: /* Sign/zero extend.  */
             op = (insn >> 20) & 7;
-- 
2.7.4

