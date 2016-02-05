Received: by 10.25.159.19 with SMTP id i19csp34478lfe;
        Fri, 5 Feb 2016 08:45:24 -0800 (PST)
X-Received: by 10.140.19.43 with SMTP id 40mr17694917qgg.72.1454690723972;
        Fri, 05 Feb 2016 08:45:23 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f20si16517876qhe.122.2016.02.05.08.45.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Feb 2016 08:45:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49278 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aRjVb-0007zb-FJ
	for alex.bennee@linaro.org; Fri, 05 Feb 2016 11:45:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aRjVR-0007h3-W7
	for qemu-arm@nongnu.org; Fri, 05 Feb 2016 11:45:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aRjVN-00051f-O3
	for qemu-arm@nongnu.org; Fri, 05 Feb 2016 11:45:13 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57200)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aRjVL-0004xh-8I; Fri, 05 Feb 2016 11:45:07 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aRjVI-0004EU-4Q; Fri, 05 Feb 2016 16:45:04 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  5 Feb 2016 16:45:00 +0000
Message-Id: <1454690704-16233-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454690704-16233-1-git-send-email-peter.maydell@linaro.org>
References: <1454690704-16233-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-arm] [PATCH 2/6] target-arm: Fix handling of SCR.SMD
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
X-TUID: cAkq7MIeW7Eh

We weren't quite implementing the handling of SCR.SMD correctly.
The condition governing whether the SMD bit should apply only
for NS state is "is EL3 is AArch32", not "is the current EL AArch32".
Fix the condition, and clarify the comment both to reflect this and
to expand slightly on what's going on for the v7-no-Virtualization case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The bit about forcing SMD to zero confused me, anyway, since I
expected it to mean "in this function", not elsewhere...
---
 target-arm/op_helper.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 313c0f8..4fedae5 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -614,12 +614,14 @@ void HELPER(pre_smc)(CPUARMState *env, uint32_t syndrome)
     int cur_el = arm_current_el(env);
     bool secure = arm_is_secure(env);
     bool smd = env->cp15.scr_el3 & SCR_SMD;
-    /* On ARMv8 AArch32, SMD only applies to NS state.
-     * On ARMv7 SMD only applies to NS state and only if EL2 is available.
-     * For ARMv7 non EL2, we force SMD to zero so we don't need to re-check
-     * the EL2 condition here.
+    /* On ARMv8 with EL3 AArch64, SMD applies to both S and NS state.
+     * On ARMv8 with EL3 AArch32, or ARMv7 with the Virtualization
+     *  extensions, SMD only applies to NS state.
+     * On ARMv7 without the Virtualization extensions, the SMD bit
+     * doesn't exist, but we forbid the guest to set it to 1 in scr_write(),
+     * so we need not special case this here.
      */
-    bool undef = is_a64(env) ? smd : (!secure && smd);
+    bool undef = arm_feature(env, ARM_FEATURE_AARCH64) ? smd : smd && !secure;
 
     if (arm_is_psci_call(cpu, EXCP_SMC)) {
         /* If PSCI is enabled and this looks like a valid PSCI call then
-- 
1.9.1

