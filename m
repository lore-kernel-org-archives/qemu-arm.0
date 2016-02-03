Received: by 10.25.159.19 with SMTP id i19csp1234094lfe;
        Wed, 3 Feb 2016 05:53:15 -0800 (PST)
X-Received: by 10.140.228.69 with SMTP id y66mr1740465qhb.78.1454507591351;
        Wed, 03 Feb 2016 05:53:11 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k65si5595621qgf.53.2016.02.03.05.53.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Feb 2016 05:53:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35093 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aQxrq-0000Rl-RJ
	for alex.bennee@linaro.org; Wed, 03 Feb 2016 08:53:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aQxrn-0000KC-J8
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 08:53:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aQxrm-0006i6-FT
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 08:53:07 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57188)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aQxrf-0006ga-Rc; Wed, 03 Feb 2016 08:52:59 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aQxdq-00035k-68; Wed, 03 Feb 2016 13:38:42 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  3 Feb 2016 13:38:37 +0000
Message-Id: <1454506721-11843-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-arm] [PATCH 3/7] target-arm: Use access_trap_aa32s_el1() for
	SCR and MVBAR
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
X-TUID: Qh9RpdQuHY+N

The registers MVBAR and SCR should have the behaviour of trapping to
EL3 if accessed from Secure EL1, but we were incorrectly implementing
them to UNDEF (which would trap to EL1).  Fix this by using the new
access_trap_aa32s_el1() access function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 8b96b80..d85b04f 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -3547,7 +3547,8 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
       .resetvalue = 0, .writefn = scr_write },
     { .name = "SCR",  .type = ARM_CP_ALIAS,
       .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 0,
-      .access = PL3_RW, .fieldoffset = offsetoflow32(CPUARMState, cp15.scr_el3),
+      .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
+      .fieldoffset = offsetoflow32(CPUARMState, cp15.scr_el3),
       .writefn = scr_write },
     { .name = "MDCR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 3, .opc2 = 1,
@@ -3569,7 +3570,8 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
       .access = PL3_W | PL1_R, .resetvalue = 0,
       .fieldoffset = offsetof(CPUARMState, cp15.nsacr) },
     { .name = "MVBAR", .cp = 15, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 1,
-      .access = PL3_RW, .writefn = vbar_write, .resetvalue = 0,
+      .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
+      .writefn = vbar_write, .resetvalue = 0,
       .fieldoffset = offsetof(CPUARMState, cp15.mvbar) },
     { .name = "SCTLR_EL3", .state = ARM_CP_STATE_AA64,
       .type = ARM_CP_ALIAS, /* reset handled by AArch32 view */
-- 
1.9.1

