Received: by 10.25.77.65 with SMTP id a62csp1700199lfb;
        Tue, 24 Jan 2017 03:36:17 -0800 (PST)
X-Received: by 10.55.76.204 with SMTP id z195mr25048113qka.128.1485257777839;
        Tue, 24 Jan 2017 03:36:17 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p39si12951325qtp.30.2017.01.24.03.36.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Jan 2017 03:36:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47952 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cVzOZ-0007Tn-6t
	for alex.bennee@linaro.org; Tue, 24 Jan 2017 06:36:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cVyw2-0006PT-CH
	for qemu-devel@nongnu.org; Tue, 24 Jan 2017 06:06:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cVyw1-0001SL-KM
	for qemu-devel@nongnu.org; Tue, 24 Jan 2017 06:06:46 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48257)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cVyvz-0001QP-6a; Tue, 24 Jan 2017 06:06:43 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cVyvq-00008D-Fp; Tue, 24 Jan 2017 11:06:34 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 24 Jan 2017 11:06:33 +0000
Message-Id: <1485255993-6322-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH] arm_gicv3: Fix broken logic in ELRSR
 calculation
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tXxJqjWdjMBo

Fix a broken expression in the calculation of ELRSR
register bits: instead of "(lr & ICH_LR_EL2_HW) == 1"
we want to check for != 0, because the HW bit is not
bit 0 so a test for == 1 is always false.

Fixes: https://bugs.launchpad.net/bugs/1658506

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index a9ee7fd..c25ee03 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -2430,7 +2430,7 @@ static uint64_t ich_elrsr_read(CPUARMState *env, const ARMCPRegInfo *ri)
         uint64_t lr = cs->ich_lr_el2[i];
 
         if ((lr & ICH_LR_EL2_STATE_MASK) == 0 &&
-            ((lr & ICH_LR_EL2_HW) == 1 || (lr & ICH_LR_EL2_EOI) == 0)) {
+            ((lr & ICH_LR_EL2_HW) != 0 || (lr & ICH_LR_EL2_EOI) == 0)) {
             value |= (1 << i);
         }
     }
-- 
2.7.4

