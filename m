Received: by 10.25.208.211 with SMTP id h202csp202275lfg;
        Thu, 31 Mar 2016 07:50:14 -0700 (PDT)
X-Received: by 10.55.79.17 with SMTP id d17mr16746315qkb.56.1459435814169;
        Thu, 31 Mar 2016 07:50:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c52si8077592qgc.5.2016.03.31.07.50.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Mar 2016 07:50:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60931 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aldvJ-00080Q-NS
	for alex.bennee@linaro.org; Thu, 31 Mar 2016 10:50:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aldup-00079V-Mc
	for qemu-arm@nongnu.org; Thu, 31 Mar 2016 10:49:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1alduo-0003v5-LD
	for qemu-arm@nongnu.org; Thu, 31 Mar 2016 10:49:43 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56299)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1alduo-0003tV-Ee; Thu, 31 Mar 2016 10:49:42 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aldun-0001mV-A6; Thu, 31 Mar 2016 15:49:41 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 31 Mar 2016 15:49:38 +0100
Message-Id: <1459435778-5526-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459435778-5526-1-git-send-email-peter.maydell@linaro.org>
References: <1459435778-5526-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Cc: Sergey Fedorov <sergey.fedorov@linaro.org>
Subject: [Qemu-arm] [PATCH 4/4] target-arm: Avoid unnecessary TLB flush on
	TCR_EL2 writes
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FtuQz2i2Sn7y

The TCR_EL2 regdef was incorrectly using the vmsa_tcr_el1_write
function for writes. Since TCR_EL2 doesn't have the A1 bit that
TCR_EL1 does, we don't need to do a tlb_flush() when it is written.
Remove the unnecessary .writefn and also the harmless but unneeded
.raw_writefn and .resetfn definitions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 09638b2..4dbd844 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -3559,8 +3559,10 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .resetvalue = 0 },
     { .name = "TCR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 2,
-      .access = PL2_RW, .writefn = vmsa_tcr_el1_write,
-      .resetfn = vmsa_ttbcr_reset, .raw_writefn = raw_write,
+      .access = PL2_RW,
+      /* no .writefn needed as this can't cause an ASID change;
+       * no .raw_writefn or .resetfn needed as we never use mask/base_mask
+       */
       .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[2]) },
     { .name = "VTCR", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
-- 
1.9.1

