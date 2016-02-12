Received: by 10.25.159.19 with SMTP id i19csp899142lfe;
        Fri, 12 Feb 2016 07:51:03 -0800 (PST)
X-Received: by 10.140.145.72 with SMTP id 69mr2889257qhr.95.1455292263681;
        Fri, 12 Feb 2016 07:51:03 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f89si16286630qga.111.2016.02.12.07.51.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 07:51:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33803 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aUFzr-0004KW-64
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 10:51:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59312)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aUFzg-0004D9-83
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 10:50:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aUFzf-0006zR-8p
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 10:50:52 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57340)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aUFzb-0006wv-Ry; Fri, 12 Feb 2016 10:50:47 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aUFzZ-0007vr-EO; Fri, 12 Feb 2016 15:50:45 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 12 Feb 2016 15:50:45 +0000
Message-Id: <1455292245-30461-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, qemu-arm@nongnu.org
Subject: [Qemu-arm] [PATCH] target-arm: Move bank_number() into internals.h
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
X-TUID: TxeHuph+U+4U

Move bank_number()'s implementation into internals.h, so
it's available in the user-mode-only compile as well.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Embarrassingly light on testing on that last change.

 target-arm/helper.c    | 25 -------------------------
 target-arm/internals.h | 26 +++++++++++++++++++++++++-
 2 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index c46e3d0..a420a2a 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5378,31 +5378,6 @@ void aarch64_sync_64_to_32(CPUARMState *env)
 
 #else
 
-/* Map CPU modes onto saved register banks.  */
-int bank_number(int mode)
-{
-    switch (mode) {
-    case ARM_CPU_MODE_USR:
-    case ARM_CPU_MODE_SYS:
-        return BANK_USRSYS;
-    case ARM_CPU_MODE_SVC:
-        return BANK_SVC;
-    case ARM_CPU_MODE_ABT:
-        return BANK_ABT;
-    case ARM_CPU_MODE_UND:
-        return BANK_UND;
-    case ARM_CPU_MODE_IRQ:
-        return BANK_IRQ;
-    case ARM_CPU_MODE_FIQ:
-        return BANK_FIQ;
-    case ARM_CPU_MODE_HYP:
-        return BANK_HYP;
-    case ARM_CPU_MODE_MON:
-        return BANK_MON;
-    }
-    g_assert_not_reached();
-}
-
 void switch_mode(CPUARMState *env, int mode)
 {
     int old_mode;
diff --git a/target-arm/internals.h b/target-arm/internals.h
index 70bec4a..2e70272 100644
--- a/target-arm/internals.h
+++ b/target-arm/internals.h
@@ -109,7 +109,31 @@ static inline unsigned int aarch64_banked_spsr_index(unsigned int el)
     return map[el];
 }
 
-int bank_number(int mode);
+/* Map CPU modes onto saved register banks.  */
+static inline int bank_number(int mode)
+{
+    switch (mode) {
+    case ARM_CPU_MODE_USR:
+    case ARM_CPU_MODE_SYS:
+        return BANK_USRSYS;
+    case ARM_CPU_MODE_SVC:
+        return BANK_SVC;
+    case ARM_CPU_MODE_ABT:
+        return BANK_ABT;
+    case ARM_CPU_MODE_UND:
+        return BANK_UND;
+    case ARM_CPU_MODE_IRQ:
+        return BANK_IRQ;
+    case ARM_CPU_MODE_FIQ:
+        return BANK_FIQ;
+    case ARM_CPU_MODE_HYP:
+        return BANK_HYP;
+    case ARM_CPU_MODE_MON:
+        return BANK_MON;
+    }
+    g_assert_not_reached();
+}
+
 void switch_mode(CPUARMState *, int);
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
 void arm_translate_init(void);
-- 
1.9.1

