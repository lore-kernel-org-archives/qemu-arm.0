Received: by 10.25.159.19 with SMTP id i19csp1234220lfe;
        Wed, 3 Feb 2016 05:53:31 -0800 (PST)
X-Received: by 10.140.27.139 with SMTP id 11mr1672606qgx.62.1454507610625;
        Wed, 03 Feb 2016 05:53:30 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z107si5615805qge.1.2016.02.03.05.53.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Feb 2016 05:53:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35095 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aQxsA-0000mg-6v
	for alex.bennee@linaro.org; Wed, 03 Feb 2016 08:53:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aQxrf-00006w-SC
	for qemu-devel@nongnu.org; Wed, 03 Feb 2016 08:53:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aQxre-0006gG-OR
	for qemu-devel@nongnu.org; Wed, 03 Feb 2016 08:52:59 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57186)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aQxre-0006eA-Hu; Wed, 03 Feb 2016 08:52:58 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aQxdq-00035o-7x; Wed, 03 Feb 2016 13:38:42 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  3 Feb 2016 13:38:38 +0000
Message-Id: <1454506721-11843-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-devel] [PATCH 4/7] target-arm: Update
	arm_generate_debug_exceptions() to handle EL2/EL3
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
X-TUID: BsIp+6VQemnM

The arm_generate_debug_exceptions() function as originally implemented
assumes no EL2 or EL3. Since we now have much more of an implementation
of those now, fix this assumption.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/cpu.h | 48 +++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 5 deletions(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index cf2df50..0fb79d0 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1742,9 +1742,7 @@ typedef enum ARMASIdx {
     ARMASIdx_S = 1,
 } ARMASIdx;
 
-/* Return the Exception Level targeted by debug exceptions;
- * currently always EL1 since we don't implement EL2 or EL3.
- */
+/* Return the Exception Level targeted by debug exceptions. */
 static inline int arm_debug_target_el(CPUARMState *env)
 {
     bool secure = arm_is_secure(env);
@@ -1767,6 +1765,14 @@ static inline int arm_debug_target_el(CPUARMState *env)
 
 static inline bool aa64_generate_debug_exceptions(CPUARMState *env)
 {
+    if (arm_is_secure(env)) {
+        /* MDCR_EL3.SDD disables debug events from Secure state */
+        if (extract32(env->cp15.mdcr_el3, 16, 1) != 0
+            || arm_current_el(env) == 3) {
+            return false;
+        }
+    }
+
     if (arm_current_el(env) == arm_debug_target_el(env)) {
         if ((extract32(env->cp15.mdscr_el1, 13, 1) == 0)
             || (env->daif & PSTATE_D)) {
@@ -1778,10 +1784,42 @@ static inline bool aa64_generate_debug_exceptions(CPUARMState *env)
 
 static inline bool aa32_generate_debug_exceptions(CPUARMState *env)
 {
-    if (arm_current_el(env) == 0 && arm_el_is_aa64(env, 1)) {
+    int el = arm_current_el(env);
+
+    if (el == 0 && arm_el_is_aa64(env, 1)) {
         return aa64_generate_debug_exceptions(env);
     }
-    return arm_current_el(env) != 2;
+
+    if (arm_is_secure(env)) {
+        int spd;
+
+        if (el == 0 && (env->cp15.sder & 1)) {
+            /* SDER.SUIDEN means debug exceptions from Secure EL0
+             * are always enabled. Otherwise they are controlled by
+             * SDCR.SPD like those from other Secure ELs.
+             */
+            return true;
+        }
+
+        spd = extract32(env->cp15.mdcr_el3, 14, 2);
+        switch (spd) {
+        case 1:
+            /* SPD == 0b01 is reserved, but behaves as 0b00. */
+        case 0:
+            /* For 0b00 we return true if external secure invasive debug
+             * is enabled. On real hardware this is controlled by external
+             * signals to the core. QEMU always permits debug, and behaves
+             * as if DBGEN, SPIDEN, NIDEN and SPNIDEN are all tied high.
+             */
+            return true;
+        case 2:
+            return false;
+        case 3:
+            return true;
+        }
+    }
+
+    return el != 2;
 }
 
 /* Return true if debugging exceptions are currently enabled.
-- 
1.9.1

