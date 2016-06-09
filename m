Received: by 10.25.27.66 with SMTP id b63csp397087lfb;
        Thu, 9 Jun 2016 09:04:01 -0700 (PDT)
X-Received: by 10.55.70.66 with SMTP id t63mr11083582qka.173.1465488241766;
        Thu, 09 Jun 2016 09:04:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c82si3740528qkj.237.2016.06.09.09.04.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Jun 2016 09:04:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35412 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bB2R7-0007kr-6x
	for alex.bennee@linaro.org; Thu, 09 Jun 2016 12:04:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bB2QD-0006hy-UW
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 12:03:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bB2QC-00069g-Vj
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 12:03:05 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57618)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bB2QC-00068Q-NY; Thu, 09 Jun 2016 12:03:04 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bB2Q9-0001eC-SU; Thu, 09 Jun 2016 17:03:01 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  9 Jun 2016 17:03:01 +0100
Message-Id: <1465488181-31977-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] target-arm: Fix reset and migration of TTBCR(S)
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
Cc: Sergey Fedorov <sergey.fedorov@linaro.org>,
	Pranith Kumar <bobby.prani+qemu@gmail.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hmoWXJTDg4Lu

Commit 6459b94c26dd666badb3 broke reset and migration of the AArch32
TTBCR(S) register if the guest used non-LPAE page tables. This is
because the AArch32 TTBCR register definition is marked as ARM_CP_ALIAS,
meaning that the AArch64 variant has to handle migration and reset.
Although AArch64 TCR_EL3 doesn't need to care about the mask and
base_mask fields, AArch32 may do so, and so we must use the special
TTBCR reset and raw write functions to ensure they are set correctly.

This doesn't affect TCR_EL2, because the AArch32 equivalent of that
is HTCR, which never uses the non-LPAE page table variant.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reported-by: Pranith Kumar <bobby.prani+qemu@gmail.com>
---
 target-arm/helper.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 862e780..c9730d6 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -3765,8 +3765,11 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 0, .opc2 = 2,
       .access = PL3_RW,
       /* no .writefn needed as this can't cause an ASID change;
-       * no .raw_writefn or .resetfn needed as we never use mask/base_mask
+       * we must provide a .raw_writefn and .resetfn because we handle
+       * reset and migration for the AArch32 TTBCR(S), which might be
+       * using mask and base_mask.
        */
+      .resetfn = vmsa_ttbcr_reset, .raw_writefn = vmsa_ttbcr_raw_write,
       .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[3]) },
     { .name = "ELR_EL3", .state = ARM_CP_STATE_AA64,
       .type = ARM_CP_ALIAS,
-- 
1.9.1

