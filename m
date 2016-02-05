Received: by 10.25.159.19 with SMTP id i19csp38764lfe;
        Fri, 5 Feb 2016 08:54:41 -0800 (PST)
X-Received: by 10.140.160.130 with SMTP id g124mr16584516qhg.88.1454691280752;
        Fri, 05 Feb 2016 08:54:40 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n31si10762741qge.54.2016.02.05.08.54.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Feb 2016 08:54:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49315 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aRjea-0004vn-9B
	for alex.bennee@linaro.org; Fri, 05 Feb 2016 11:54:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aRjcy-0002SN-PZ
	for qemu-devel@nongnu.org; Fri, 05 Feb 2016 11:53:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aRjcx-000776-Uv
	for qemu-devel@nongnu.org; Fri, 05 Feb 2016 11:53:00 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57215)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aRjcx-00076x-O3; Fri, 05 Feb 2016 11:52:59 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aRjVI-0004EQ-2a; Fri, 05 Feb 2016 16:45:04 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  5 Feb 2016 16:44:59 +0000
Message-Id: <1454690704-16233-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454690704-16233-1-git-send-email-peter.maydell@linaro.org>
References: <1454690704-16233-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-devel] [PATCH 1/6] target-arm: correct CNTFRQ access rights
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
X-TUID: tt2M7MsuHYKX

Correct some corner cases we were getting wrong for
CNTFRQ access rights:
 * should UNDEF from 32-bit Secure EL1
 * only writable from the highest implemented exception level,
   which might not be EL1 now

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/helper.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 7a8881a..082701a 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -1217,9 +1217,34 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
 static CPAccessResult gt_cntfrq_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                        bool isread)
 {
-    /* CNTFRQ: not visible from PL0 if both PL0PCTEN and PL0VCTEN are zero */
-    if (arm_current_el(env) == 0 && !extract32(env->cp15.c14_cntkctl, 0, 2)) {
-        return CP_ACCESS_TRAP;
+    /* CNTFRQ: not visible from PL0 if both PL0PCTEN and PL0VCTEN are zero.
+     * Writable only at the highest implemented exception level.
+     */
+    switch (arm_current_el(env)) {
+    case 0:
+        if (!extract32(env->cp15.c14_cntkctl, 0, 2)) {
+            return CP_ACCESS_TRAP;
+        }
+        /* EL0 reads are forbidden by the .access fields */
+        break;
+    case 1:
+        if (!isread && (arm_feature(env, ARM_FEATURE_EL2)
+                        || arm_feature(env, ARM_FEATURE_EL3))) {
+            return CP_ACCESS_TRAP_UNCATEGORIZED;
+        }
+        if (!isread && ri->state == ARM_CP_STATE_AA32 &&
+            arm_is_secure_below_el3(env)) {
+            /* Accesses from 32-bit Secure EL1 UNDEF (*not* trap to EL3!) */
+            return CP_ACCESS_TRAP_UNCATEGORIZED;
+        }
+        break;
+    case 2:
+        if (!isread && arm_feature(env, ARM_FEATURE_EL3)) {
+            return CP_ACCESS_TRAP_UNCATEGORIZED;
+        }
+        break;
+    case 3:
+        break;
     }
     return CP_ACCESS_OK;
 }
-- 
1.9.1

