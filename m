Received: by 10.182.105.169 with SMTP id gn9csp902203obb;
        Sun, 8 Nov 2015 17:19:09 -0800 (PST)
X-Received: by 10.55.18.154 with SMTP id 26mr26386566qks.0.1447031949701;
        Sun, 08 Nov 2015 17:19:09 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c2si2539833qge.105.2015.11.08.17.19.09
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 17:19:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49422 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zvb6z-0003Lj-Cu
	for alex.bennee@linaro.org; Sun, 08 Nov 2015 20:19:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1R-0001My-S7
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1P-0007xS-D6
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:25 -0500
Received: from mail-qg0-x232.google.com ([2607:f8b0:400d:c04::232]:36423)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1Zvb1P-0007xL-6o; Sun, 08 Nov 2015 20:13:23 -0500
Received: by qgad10 with SMTP id d10so132319709qga.3;
	Sun, 08 Nov 2015 17:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=o4cDqv7J7X3mA3bDOlMKAloeMOLcVS3foT/0TR3t8d4=;
	b=j12xd2I07nshGW6Bj70WEGtzE80RWnVnClQ2K8P6fRqiVV/T8C8ay7pzmL0v/gUru0
	qZWKtanp+uKV3wwd+wmrn5sgrK6w/eNn+coLjML0NWgXdzPecoMlTeE16ivuBqKg797O
	0aMxI5Qt4F3MB77103L0cxQDPkfBORYKA2tF2iK0/o+XbmdWn0daUS6BnJUH3Qq/xo5Q
	5KIFkZoTsaRhV4gAGOM2fbSMPQlNjMi2aheV4vKgJFwwAtfG9VKttr7UpvmdR4KKFxpP
	4dejlsLAT3zlEM45iqics3ceXygnH7nQlORccUbT6//fRzv1ZAK3BpAlm6n8lcnon1fZ
	elbA==
X-Received: by 10.140.146.13 with SMTP id 13mr28076730qhs.1.1447031602823;
	Sun, 08 Nov 2015 17:13:22 -0800 (PST)
Received: from localhost.localdomain (ool-182df582.dyn.optonline.net.
	[24.45.245.130])
	by smtp.gmail.com with ESMTPSA id g97sm3915552qge.6.2015.11.08.17.13.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Nov 2015 17:13:22 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  8 Nov 2015 20:11:38 -0500
Message-Id: <1447031505-12477-12-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::232
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH 11/18] armv7m: fix I and F flag handling
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
X-TUID: 0iooMqcWl/UL

Despite having the same notation, these bits
have completely different meaning than -AR.

Add armv7m_excp_unmasked()
to calculate the currently runable exception priority
taking into account masks and active handlers.
Use this in conjunction with the pending exception
priority to determine if the pending exception
can interrupt execution.

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
---
 target-arm/cpu.c | 26 +++++++-------------------
 target-arm/cpu.h | 27 ++++++++++++++++++++++++++-
 2 files changed, 33 insertions(+), 20 deletions(-)

diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index be026bc..5d03117 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -173,6 +173,8 @@ static void arm_cpu_reset(CPUState *s)
         uint32_t initial_pc; /* Loaded from 0x4 */
         uint8_t *rom;
 
+        env->v7m.exception_prio = env->v7m.pending_prio = 0x100;
+
         env->daif &= ~PSTATE_I;
         rom = rom_ptr(0);
         if (rom) {
@@ -301,29 +303,15 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
     ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
     bool ret = false;
 
-
-    if (interrupt_request & CPU_INTERRUPT_FIQ
-        && !(env->daif & PSTATE_F)) {
-        cs->exception_index = EXCP_FIQ;
-        cc->do_interrupt(cs);
-        ret = true;
-    }
-    /* ARMv7-M interrupt return works by loading a magic value
-     * into the PC.  On real hardware the load causes the
-     * return to occur.  The qemu implementation performs the
-     * jump normally, then does the exception return when the
-     * CPU tries to execute code at the magic address.
-     * This will cause the magic PC value to be pushed to
-     * the stack if an interrupt occurred at the wrong time.
-     * We avoid this by disabling interrupts when
-     * pc contains a magic address.
+    /* ARMv7-M interrupt masking works differently than -A or -R.
+     * There is no FIQ/IRQ distinction.
+     * Instead of masking interrupt sources, the I and F bits
+     * (along with basepri) mask certain exception priority levels.
      */
     if (interrupt_request & CPU_INTERRUPT_HARD
-        && !(env->daif & PSTATE_I)
-        && (env->regs[15] < 0xfffffff0)) {
+            && (armv7m_excp_unmasked(cpu) >= cpu->env.v7m.pending_prio)) {
         cs->exception_index = EXCP_IRQ;
         cc->do_interrupt(cs);
         ret = true;
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index c193fbb..29d89ce 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1033,9 +1033,34 @@ void arm_cpu_list(FILE *f, fprintf_function cpu_fprintf);
 uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
                                  uint32_t cur_el, bool secure);
 
+/* @returns highest (numerically lowest) unmasked exception priority
+ */
+static inline
+int armv7m_excp_unmasked(ARMCPU *cpu)
+{
+    CPUARMState *env = &cpu->env;
+    int runnable;
+
+    /* find highest (numerically lowest) priority which could
+     * run based on masks
+     */
+    if (env->daif&PSTATE_F) { /* FAULTMASK */
+        runnable = -2;
+    } else if (env->daif&PSTATE_I) { /* PRIMASK */
+        runnable = -1;
+    } else if (env->v7m.basepri > 0) {
+        /* BASEPRI==1 -> runnable==-1 (same as PRIMASK==1) */
+        runnable = env->v7m.basepri-2;
+    } else {
+        runnable = 0x100; /* lower than any possible priority */
+    }
+    /* consider priority of active handler */
+    return MIN(runnable, env->v7m.exception_prio-1);
+}
+
 /* Interface between CPU and Interrupt controller.  */
 void armv7m_nvic_set_pending(void *opaque, int irq);
-int armv7m_nvic_acknowledge_irq(void *opaque);
+void armv7m_nvic_acknowledge_irq(void *opaque);
 void armv7m_nvic_complete_irq(void *opaque, int irq);
 
 /* Interface for defining coprocessor registers.
-- 
2.1.4

