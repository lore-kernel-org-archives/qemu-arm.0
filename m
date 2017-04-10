Received: by 10.25.0.144 with SMTP id 138csp801414lfa;
        Mon, 10 Apr 2017 03:47:36 -0700 (PDT)
X-Received: by 10.237.53.139 with SMTP id c11mr7377105qte.285.1491821256582;
        Mon, 10 Apr 2017 03:47:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 21si13134824qtp.63.2017.04.10.03.47.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 03:47:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33652 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxWr7-0003WM-UA
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 06:47:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cxWoi-0001TZ-9W
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 06:45:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cxWoh-00084L-Cv
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 06:45:04 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:49107)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cxWoh-000826-61; Mon, 10 Apr 2017 06:45:03 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cxWji-0005QP-Ik; Mon, 10 Apr 2017 11:39:54 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 10 Apr 2017 11:39:47 +0100
Message-Id: <1491820793-5348-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491820793-5348-1-git-send-email-peter.maydell@linaro.org>
References: <1491820793-5348-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/7] arm: Don't implement BXJ on M-profile CPUs
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
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qw2IQHNQtMxz

For M-profile CPUs, the BXJ instruction does not exist at all, and
the encoding should always UNDEF. We were accidentally implementing
it to behave like A-profile BXJ; correct the error.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index e32e38c..fe3f442 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10485,7 +10485,12 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
                         }
                         break;
                     case 4: /* bxj */
-                        /* Trivial implementation equivalent to bx.  */
+                        /* Trivial implementation equivalent to bx.
+                         * This instruction doesn't exist at all for M-profile.
+                         */
+                        if (arm_dc_feature(s, ARM_FEATURE_M)) {
+                            goto illegal_op;
+                        }
                         tmp = load_reg(s, rn);
                         gen_bx(s, tmp);
                         break;
-- 
2.7.4

