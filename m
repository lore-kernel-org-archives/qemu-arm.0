Received: by 10.25.159.19 with SMTP id i19csp314872lfe;
        Thu, 11 Feb 2016 08:26:40 -0800 (PST)
X-Received: by 10.140.251.70 with SMTP id w67mr23439927qhc.99.1455208000879;
        Thu, 11 Feb 2016 08:26:40 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g35si10236163qgf.101.2016.02.11.08.26.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Feb 2016 08:26:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51446 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aTu4m-0004tT-Bw
	for alex.bennee@linaro.org; Thu, 11 Feb 2016 11:26:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aTu1H-0007lR-Et
	for qemu-devel@nongnu.org; Thu, 11 Feb 2016 11:23:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aTu1D-0005Gk-8S
	for qemu-devel@nongnu.org; Thu, 11 Feb 2016 11:23:03 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:41147)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aTu1D-0005GI-1t; Thu, 11 Feb 2016 11:22:59 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aTtiL-0007IM-Ff; Thu, 11 Feb 2016 16:03:29 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 11 Feb 2016 16:03:24 +0000
Message-Id: <1455206609-28009-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455206609-28009-1-git-send-email-peter.maydell@linaro.org>
References: <1455206609-28009-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 81.2.115.146
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Sergey Fedorov <serge.fdrv@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-devel] [PATCH v2 1/6] target-arm: correct CNTFRQ access rights
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
X-TUID: 7fBIw4M1NSdQ

Correct some corner cases we were getting wrong for
CNTFRQ access rights:
 * should UNDEF from 32-bit Secure EL1
 * only writable from the highest implemented exception level,
   which might not be EL1 now

To clarify the code, provide a new utility function
arm_highest_el() which returns the highest implemented
exception level.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Rewritten to use arm_highest_el() to improve clarity
---
 target-arm/cpu.h    | 12 ++++++++++++
 target-arm/helper.c | 29 ++++++++++++++++++++++++++---
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 5137632..afbf366 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1255,6 +1255,18 @@ static inline bool cptype_valid(int cptype)
 #define PL1_RW (PL1_R | PL1_W)
 #define PL0_RW (PL0_R | PL0_W)
 
+/* Return the highest implemented Exception Level */
+static inline int arm_highest_el(CPUARMState *env)
+{
+    if (arm_feature(env, ARM_FEATURE_EL3)) {
+        return 3;
+    }
+    if (arm_feature(env, ARM_FEATURE_EL2)) {
+        return 2;
+    }
+    return 1;
+}
+
 /* Return the current Exception Level (as per ARMv8; note that this differs
  * from the ARMv7 Privilege Level).
  */
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 2f9db72..4d27c00 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -1218,10 +1218,33 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
 static CPAccessResult gt_cntfrq_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                        bool isread)
 {
-    /* CNTFRQ: not visible from PL0 if both PL0PCTEN and PL0VCTEN are zero */
-    if (arm_current_el(env) == 0 && !extract32(env->cp15.c14_cntkctl, 0, 2)) {
-        return CP_ACCESS_TRAP;
+    /* CNTFRQ: not visible from PL0 if both PL0PCTEN and PL0VCTEN are zero.
+     * Writable only at the highest implemented exception level.
+     */
+    int el = arm_current_el(env);
+
+    switch (el) {
+    case 0:
+        if (!extract32(env->cp15.c14_cntkctl, 0, 2)) {
+            return CP_ACCESS_TRAP;
+        }
+        break;
+    case 1:
+        if (!isread && ri->state == ARM_CP_STATE_AA32 &&
+            arm_is_secure_below_el3(env)) {
+            /* Accesses from 32-bit Secure EL1 UNDEF (*not* trap to EL3!) */
+            return CP_ACCESS_TRAP_UNCATEGORIZED;
+        }
+        break;
+    case 2:
+    case 3:
+        break;
     }
+
+    if (!isread && el < arm_highest_el(env)) {
+        return CP_ACCESS_TRAP_UNCATEGORIZED;
+    }
+
     return CP_ACCESS_OK;
 }
 
-- 
1.9.1

