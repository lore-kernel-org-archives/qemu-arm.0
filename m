Received: by 10.25.0.144 with SMTP id 138csp966163lfa;
        Mon, 10 Apr 2017 10:34:20 -0700 (PDT)
X-Received: by 10.55.120.70 with SMTP id t67mr5592409qkc.21.1491845660402;
        Mon, 10 Apr 2017 10:34:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g4si1507688qkd.213.2017.04.10.10.34.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 10:34:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35632 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxdCj-0000np-KZ
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 13:34:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cxdCc-0000n1-Tq
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 13:34:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cxdCb-0006rH-NR
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 13:34:10 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:49130)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cxdCb-0006qG-Fr; Mon, 10 Apr 2017 13:34:09 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cxcsr-0005l0-78; Mon, 10 Apr 2017 18:13:45 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 10 Apr 2017 18:13:39 +0100
Message-Id: <1491844419-12485-10-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491844419-12485-1-git-send-email-peter.maydell@linaro.org>
References: <1491844419-12485-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 9/9] arm: Remove workarounds for old M-profile
 exception return implementation
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
Cc: Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LTn86t8B/GQe

Now that we've rewritten M-profile exception return so that the magic
PC values are not visible to other parts of QEMU, we can delete the
special casing of them elsewhere.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/cpu.c       | 43 ++-----------------------------------------
 target/arm/translate.c |  8 --------
 2 files changed, 2 insertions(+), 49 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 04b062c..b357aee 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -304,33 +304,6 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 }
 
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
-static void arm_v7m_unassigned_access(CPUState *cpu, hwaddr addr,
-                                      bool is_write, bool is_exec, int opaque,
-                                      unsigned size)
-{
-    ARMCPU *arm = ARM_CPU(cpu);
-    CPUARMState *env = &arm->env;
-
-    /* ARMv7-M interrupt return works by loading a magic value into the PC.
-     * On real hardware the load causes the return to occur.  The qemu
-     * implementation performs the jump normally, then does the exception
-     * return by throwing a special exception when when the CPU tries to
-     * execute code at the magic address.
-     */
-    if (env->v7m.exception != 0 && addr >= 0xfffffff0 && is_exec) {
-        cpu->exception_index = EXCP_EXCEPTION_EXIT;
-        cpu_loop_exit(cpu);
-    }
-
-    /* In real hardware an attempt to access parts of the address space
-     * with nothing there will usually cause an external abort.
-     * However our QEMU board models are often missing device models where
-     * the guest can boot anyway with the default read-as-zero/writes-ignored
-     * behaviour that you get without a QEMU unassigned_access hook.
-     * So just return here to retain that default behaviour.
-     */
-}
-
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
@@ -338,17 +311,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     CPUARMState *env = &cpu->env;
     bool ret = false;
 
-    /* ARMv7-M interrupt return works by loading a magic value
-     * into the PC.  On real hardware the load causes the
-     * return to occur.  The qemu implementation performs the
-     * jump normally, then does the exception return when the
-     * CPU tries to execute code at the magic address.
-     * This will cause the magic PC value to be pushed to
-     * the stack if an interrupt occurred at the wrong time.
-     * We avoid this by disabling interrupts when
-     * pc contains a magic address.
-     *
-     * ARMv7-M interrupt masking works differently than -A or -R.
+    /* ARMv7-M interrupt masking works differently than -A or -R.
      * There is no FIQ/IRQ distinction. Instead of I and F bits
      * masking FIQ and IRQ interrupts, an exception is taken only
      * if it is higher priority than the current execution priority
@@ -356,8 +319,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
      * currently active exception).
      */
     if (interrupt_request & CPU_INTERRUPT_HARD
-        && (armv7m_nvic_can_take_pending_exception(env->nvic))
-        && (env->regs[15] < 0xfffffff0)) {
+        && (armv7m_nvic_can_take_pending_exception(env->nvic))) {
         cs->exception_index = EXCP_IRQ;
         cc->do_interrupt(cs);
         ret = true;
@@ -1091,7 +1053,6 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
     cc->do_interrupt = arm_v7m_cpu_do_interrupt;
 #endif
 
-    cc->do_unassigned_access = arm_v7m_unassigned_access;
     cc->cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt;
 }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1e8b0a8..6968f73 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11927,14 +11927,6 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
             dc->is_jmp = DISAS_EXC;
             break;
         }
-#else
-        if (arm_dc_feature(dc, ARM_FEATURE_M)) {
-            /* Branches to the magic exception-return addresses should
-             * already have been caught via the arm_v7m_unassigned_access hook,
-             * and never get here.
-             */
-            assert(dc->pc < 0xfffffff0);
-        }
 #endif
 
         if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
-- 
2.7.4

