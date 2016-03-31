Received: by 10.25.208.211 with SMTP id h202csp204299lfg;
        Thu, 31 Mar 2016 07:54:20 -0700 (PDT)
X-Received: by 10.140.40.37 with SMTP id w34mr16874532qgw.85.1459436060066;
        Thu, 31 Mar 2016 07:54:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f126si901084qhf.23.2016.03.31.07.54.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Mar 2016 07:54:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60944 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aldzH-0002Ex-Lu
	for alex.bennee@linaro.org; Thu, 31 Mar 2016 10:54:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59094)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aldzE-0002Cl-OT
	for qemu-arm@nongnu.org; Thu, 31 Mar 2016 10:54:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aldzD-00060r-TS
	for qemu-arm@nongnu.org; Thu, 31 Mar 2016 10:54:16 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56309)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aldzD-00060U-Mh; Thu, 31 Mar 2016 10:54:15 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aldum-0001mG-R6; Thu, 31 Mar 2016 15:49:40 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 31 Mar 2016 15:49:37 +0100
Message-Id: <1459435778-5526-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459435778-5526-1-git-send-email-peter.maydell@linaro.org>
References: <1459435778-5526-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Cc: Sergey Fedorov <sergey.fedorov@linaro.org>
Subject: [Qemu-arm] [PATCH 3/4] target-arm: Make the 64-bit version of VTCR
	do the migration
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
X-TUID: wfuKHPcyrJnI

Move the ALIAS tag from VTCR_EL2 to VTCR so that we migrate the
64-bit version, as is usual. (This has no particular effect now
unless the guest wrote to the high RES0 bits of VTCR_EL2.)
Add a comment about why it's OK that we don't have the various
accessor functions that the EL1 TCR regdefs do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/helper.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 0e54d90..09638b2 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -3564,11 +3564,15 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[2]) },
     { .name = "VTCR", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
+      .type = ARM_CP_ALIAS,
       .access = PL2_RW, .accessfn = access_el3_aa32ns,
       .fieldoffset = offsetof(CPUARMState, cp15.vtcr_el2) },
     { .name = "VTCR_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
-      .access = PL2_RW, .type = ARM_CP_ALIAS,
+      .access = PL2_RW,
+      /* no .writefn needed as this can't cause an ASID change;
+       * no .raw_writefn or .resetfn needed as we never use mask/base_mask
+       */
       .fieldoffset = offsetof(CPUARMState, cp15.vtcr_el2) },
     { .name = "VTTBR", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 6, .crm = 2,
-- 
1.9.1

