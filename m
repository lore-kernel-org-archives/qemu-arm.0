Received: by 10.25.208.211 with SMTP id h202csp851027lfg;
        Mon, 15 Feb 2016 09:27:29 -0800 (PST)
X-Received: by 10.140.157.7 with SMTP id d7mr23143404qhd.17.1455557249557;
        Mon, 15 Feb 2016 09:27:29 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z93si35226742qgd.106.2016.02.15.09.27.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Feb 2016 09:27:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34563 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVMvo-0007hd-Tf
	for alex.bennee@linaro.org; Mon, 15 Feb 2016 12:27:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVMrb-0000Y5-Vb
	for qemu-devel@nongnu.org; Mon, 15 Feb 2016 12:23:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVMrb-0007oM-4V
	for qemu-devel@nongnu.org; Mon, 15 Feb 2016 12:23:07 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57358)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVMra-0007mW-UP; Mon, 15 Feb 2016 12:23:07 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVMrS-0000xx-Aa; Mon, 15 Feb 2016 17:22:58 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 15 Feb 2016 17:22:56 +0000
Message-Id: <1455556977-3644-11-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
References: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Sergey Fedorov <serge.fdrv@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-devel] [PATCH 10/11] target-arm: Make mode switches from Hyp
	via CPS and MRS illegal
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Zp+QyZtz3TTn

Mode switches from Hyp to any other mode via the CPS and MRS
instructions are illegal mode switches (though obviously switching
via exception return is valid).  Add this check to bad_mode_switch().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/helper.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 69e93a2..e1af9d5 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5166,12 +5166,20 @@ void arm_cp_reset_ignore(CPUARMState *env, const ARMCPRegInfo *opaque)
     /* Helper coprocessor reset function for do-nothing-on-reset registers */
 }
 
-static int bad_mode_switch(CPUARMState *env, int mode)
+static int bad_mode_switch(CPUARMState *env, int mode, CPSRWriteType write_type)
 {
     /* Return true if it is not valid for us to switch to
      * this CPU mode (ie all the UNPREDICTABLE cases in
      * the ARM ARM CPSRWriteByInstr pseudocode).
      */
+
+    /* Changes to or from Hyp via MSR and CPS are illegal. */
+    if (write_type == CPSRWriteByInstr &&
+        ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_HYP ||
+         mode == ARM_CPU_MODE_HYP)) {
+        return 1;
+    }
+
     switch (mode) {
     case ARM_CPU_MODE_USR:
     case ARM_CPU_MODE_SYS:
@@ -5290,7 +5298,7 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
     if (write_type != CPSRWriteRaw &&
         (env->uncached_cpsr & CPSR_M) != CPSR_USER &&
         ((env->uncached_cpsr ^ val) & mask & CPSR_M)) {
-        if (bad_mode_switch(env, val & CPSR_M)) {
+        if (bad_mode_switch(env, val & CPSR_M, write_type)) {
             /* Attempt to switch to an invalid mode: this is UNPREDICTABLE in
              * v7, and has defined behaviour in v8:
              *  + leave CPSR.M untouched
-- 
1.9.1

