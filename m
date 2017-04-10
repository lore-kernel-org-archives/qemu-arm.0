Received: by 10.25.0.144 with SMTP id 138csp800684lfa;
        Mon, 10 Apr 2017 03:45:12 -0700 (PDT)
X-Received: by 10.55.65.81 with SMTP id o78mr47615929qka.82.1491821112243;
        Mon, 10 Apr 2017 03:45:12 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t18si13102637qkg.259.2017.04.10.03.45.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 03:45:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33630 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxWon-0001TX-HR
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 06:45:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cxWof-0001T2-OP
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 06:45:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cxWoe-00082M-Bd
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 06:45:01 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:49107)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cxWoe-000826-3o; Mon, 10 Apr 2017 06:45:00 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cxWob-0005UM-Fg; Mon, 10 Apr 2017 11:44:57 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 10 Apr 2017 11:44:57 +0100
Message-Id: <1491821097-5647-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] arm: Move excnames[] array into
 arm_log_exceptions()
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YYsy5r+nZ62O

The excnames[] array is defined in internals.h because we used
to use it from two different source files for handling logging
of AArch32 and AArch64 exception entry. Refactoring means that
it's now used only in arm_log_exception() in helper.c, so move
the array into that function.

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       |  2 +-
 target/arm/internals.h | 23 -----------------------
 target/arm/helper.c    | 19 +++++++++++++++++++
 3 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e6f05e2..ab86943 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -58,7 +58,7 @@
 #define EXCP_SEMIHOST       16   /* semihosting call */
 #define EXCP_NOCP           17   /* v7M NOCP UsageFault */
 #define EXCP_INVSTATE       18   /* v7M INVSTATE UsageFault */
-/* NB: new EXCP_ defines should be added to the excnames[] array too */
+/* NB: add new EXCP_ defines to the array in arm_log_exception() too */
 
 #define ARMV7M_EXCP_RESET   1
 #define ARMV7M_EXCP_NMI     2
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 97ca034..1f6efef 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -51,29 +51,6 @@ static inline bool excp_is_internal(int excp)
         || excp == EXCP_SEMIHOST;
 }
 
-/* Exception names for debug logging; note that not all of these
- * precisely correspond to architectural exceptions.
- */
-static const char * const excnames[] = {
-    [EXCP_UDEF] = "Undefined Instruction",
-    [EXCP_SWI] = "SVC",
-    [EXCP_PREFETCH_ABORT] = "Prefetch Abort",
-    [EXCP_DATA_ABORT] = "Data Abort",
-    [EXCP_IRQ] = "IRQ",
-    [EXCP_FIQ] = "FIQ",
-    [EXCP_BKPT] = "Breakpoint",
-    [EXCP_EXCEPTION_EXIT] = "QEMU v7M exception exit",
-    [EXCP_KERNEL_TRAP] = "QEMU intercept of kernel commpage",
-    [EXCP_HVC] = "Hypervisor Call",
-    [EXCP_HYP_TRAP] = "Hypervisor Trap",
-    [EXCP_SMC] = "Secure Monitor Call",
-    [EXCP_VIRQ] = "Virtual IRQ",
-    [EXCP_VFIQ] = "Virtual FIQ",
-    [EXCP_SEMIHOST] = "Semihosting call",
-    [EXCP_NOCP] = "v7M NOCP UsageFault",
-    [EXCP_INVSTATE] = "v7M INVSTATE UsageFault",
-};
-
 /* Scale factor for generic timers, ie number of ns per tick.
  * This gives a 62.5MHz timer.
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8cb7a94..8a3e448 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6271,6 +6271,25 @@ static void arm_log_exception(int idx)
 {
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
         const char *exc = NULL;
+        static const char * const excnames[] = {
+            [EXCP_UDEF] = "Undefined Instruction",
+            [EXCP_SWI] = "SVC",
+            [EXCP_PREFETCH_ABORT] = "Prefetch Abort",
+            [EXCP_DATA_ABORT] = "Data Abort",
+            [EXCP_IRQ] = "IRQ",
+            [EXCP_FIQ] = "FIQ",
+            [EXCP_BKPT] = "Breakpoint",
+            [EXCP_EXCEPTION_EXIT] = "QEMU v7M exception exit",
+            [EXCP_KERNEL_TRAP] = "QEMU intercept of kernel commpage",
+            [EXCP_HVC] = "Hypervisor Call",
+            [EXCP_HYP_TRAP] = "Hypervisor Trap",
+            [EXCP_SMC] = "Secure Monitor Call",
+            [EXCP_VIRQ] = "Virtual IRQ",
+            [EXCP_VFIQ] = "Virtual FIQ",
+            [EXCP_SEMIHOST] = "Semihosting call",
+            [EXCP_NOCP] = "v7M NOCP UsageFault",
+            [EXCP_INVSTATE] = "v7M INVSTATE UsageFault",
+        };
 
         if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
             exc = excnames[idx];
-- 
2.7.4

