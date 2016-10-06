Received: by 10.80.163.71 with SMTP id 65csp3227321edn;
        Thu, 6 Oct 2016 06:47:55 -0700 (PDT)
X-Received: by 10.55.120.195 with SMTP id t186mr14322800qkc.118.1475761675800;
        Thu, 06 Oct 2016 06:47:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e26si1154595qtc.130.2016.10.06.06.47.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Oct 2016 06:47:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56291 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bs91f-0003bw-4x
	for alex.bennee@linaro.org; Thu, 06 Oct 2016 09:47:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bs8by-0004ds-Qa
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 09:21:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bs8bt-0006Vm-6b
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 09:21:21 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47223)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bs8bt-0006TD-0j; Thu, 06 Oct 2016 09:21:17 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bs8bk-0006S2-H5; Thu, 06 Oct 2016 14:21:08 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Oct 2016 14:21:05 +0100
Message-Id: <1475760067-25756-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475760067-25756-1-git-send-email-peter.maydell@linaro.org>
References: <1475760067-25756-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/3] target-arm: Implement dummy MDCCINT_EL1
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
X-TUID: ksA4HSR5Y8vd

MDCCINT_EL1 is part of the DCC debugger communication
channel between the CPU and an attached external debugger.
QEMU doesn't implement this, but since Linux may try
to access this register we need to provide at least
a dummy implementation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 25f612d..23792ab 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -4060,6 +4060,14 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
       .cp = 14, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tda,
       .type = ARM_CP_NOP },
+    /* Dummy MDCCINT_EL1, since we don't implement the Debug Communications
+     * Channel but Linux may try to access this register. The 32-bit
+     * alias is DBGDCCINT.
+     */
+    { .name = "MDCCINT_EL1", .state = ARM_CP_STATE_BOTH,
+      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 0,
+      .access = PL1_RW, .accessfn = access_tda,
+      .type = ARM_CP_NOP },
     REGINFO_SENTINEL
 };
 
-- 
2.7.4

