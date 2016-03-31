Received: by 10.25.208.211 with SMTP id h202csp204310lfg;
        Thu, 31 Mar 2016 07:54:21 -0700 (PDT)
X-Received: by 10.140.104.180 with SMTP id a49mr17225260qgf.26.1459436061797;
        Thu, 31 Mar 2016 07:54:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j7si8028227qgf.83.2016.03.31.07.54.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Mar 2016 07:54:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60945 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aldzJ-0002I1-DL
	for alex.bennee@linaro.org; Thu, 31 Mar 2016 10:54:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aldzF-0002DG-5B
	for qemu-arm@nongnu.org; Thu, 31 Mar 2016 10:54:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aldzE-00060z-6f
	for qemu-arm@nongnu.org; Thu, 31 Mar 2016 10:54:17 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56309)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aldzD-00060U-W4; Thu, 31 Mar 2016 10:54:16 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aldum-0001lx-Bj; Thu, 31 Mar 2016 15:49:40 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 31 Mar 2016 15:49:36 +0100
Message-Id: <1459435778-5526-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459435778-5526-1-git-send-email-peter.maydell@linaro.org>
References: <1459435778-5526-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Cc: Sergey Fedorov <sergey.fedorov@linaro.org>
Subject: [Qemu-arm] [PATCH 2/4] target-arm: Remove incorrect ALIAS tags from
	ESR_EL2 and ESR_EL3
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
X-TUID: tjQBp76kDeZp

The regdefs for the ESR_EL2 and ESR_EL3 system registers should not
be marked as ARM_CP_ALIAS, because these are the master copies; the
DFSR regdef in vmsa_pmsa_cp_reginfo[] is marked as an alias.
Remove the ALIAS tags so that these registers are correctly migrated.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index e583e6a..0e54d90 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -3509,7 +3509,6 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .access = PL2_RW,
       .fieldoffset = offsetof(CPUARMState, elr_el[2]) },
     { .name = "ESR_EL2", .state = ARM_CP_STATE_AA64,
-      .type = ARM_CP_ALIAS,
       .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 0,
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.esr_el[2]) },
     { .name = "FAR_EL2", .state = ARM_CP_STATE_AA64,
@@ -3759,7 +3758,6 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
       .access = PL3_RW,
       .fieldoffset = offsetof(CPUARMState, elr_el[3]) },
     { .name = "ESR_EL3", .state = ARM_CP_STATE_AA64,
-      .type = ARM_CP_ALIAS,
       .opc0 = 3, .opc1 = 6, .crn = 5, .crm = 2, .opc2 = 0,
       .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.esr_el[3]) },
     { .name = "FAR_EL3", .state = ARM_CP_STATE_AA64,
-- 
1.9.1

