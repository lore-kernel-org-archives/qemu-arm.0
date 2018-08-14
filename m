Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4030826wru;
        Tue, 14 Aug 2018 05:44:25 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPx4OsaSCDYC0S3aQt4pxoZQzqj953mn0A647qC6nxbknHSgOq8VXORbTsyl0eZk7sr7ux/O
X-Received: by 2002:a37:2bc5:: with SMTP id r66-v6mr19617300qkr.3.1534250664967;
        Tue, 14 Aug 2018 05:44:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534250664; cv=none;
        d=google.com; s=arc-20160816;
        b=brjLu2GNwPhZU0bEAAeCRg6Gk3H+y+A/D2b4qCUzxOrICiF0ZecpOw3JkcID5ytLuY
         G1MgciesiDwPZ6emx47wElntggEJGPlscX0ed1S3doSoostbSh7X9NIVaT/vuiFkcFhA
         eF0edwKZjhtW3/5tmJ2PdU9BqrBi9NQ3bK5VbCWaf1MAgp7sqMC89d6sfnehWeW7JGyr
         nrk5UblT4ESJGhuDWlyz/9/9HbYOk4zIY9PzGOxsDJGW76y/d2d1QtumlWS2phy789Yz
         UKdUdrLzd1Uaeek1kydHn3+oGP9mAcyx8V/CqgLDVkoapW+H6BabVmE29M6LGqlateXF
         QhJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=drnOtHQZwQhi4LvNEJkDpU7amBQIJl7fh/EoVz9smPU=;
        b=P3ABadSsxBnWUM5qDzS1vEkTJezQRN65rhZSO6me/rgCcFWDpKzL0yfNv0I4Z9BXnx
         6XYWYAeF9tu4Kd3MpkJ2qbwNaCOsd2wxtvtWM3BqDPL1jOmLyUj4nGDa0OGHjrsIPSEA
         85cbIMm2xd5zoC8Q3RJLnFu5N17fMIErdzKbRNcGHMxnr903uDAvMyoRmQfHkfi9FpCp
         hBBbscHYsW+SBIqwjzevYcklltsRljLxDyE/Ccw2bbyT++CsH9T3wq8Y3PTXVoZY5rHg
         JxhTj8tewJK9gIq20M9Pag9Sk66ee0GU/DBpX8RSfaYy7i6ZP+NM5JF4lCFUNF8vPH0F
         tDiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u15-v6si6703412qta.385.2018.08.14.05.44.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 05:44:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44163 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpYgS-0006QS-EO
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 08:44:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpYfJ-0005XV-Gz
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 08:43:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpYfH-0002KA-PA
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 08:43:13 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44346)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fpYfH-0002IZ-GC; Tue, 14 Aug 2018 08:43:11 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fpYfG-0006sF-Dd; Tue, 14 Aug 2018 13:43:10 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 14 Aug 2018 13:42:54 +0100
Message-Id: <20180814124254.5229-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180814124254.5229-1-peter.maydell@linaro.org>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 10/10] target/arm: Implement support for taking
 exceptions to Hyp mode
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
Cc: edgari@xilinx.com, Luc Michel <luc.michel@greensocs.com>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LaomsCozq1Uh

Implement the necessary support code for taking exceptions
to Hyp mode in AArch32.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 146 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 123 insertions(+), 23 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 80855302089..167203ac664 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8013,6 +8013,123 @@ void aarch64_sync_64_to_32(CPUARMState *env)
     env->regs[15] = env->pc;
 }
 
+static void take_aarch32_exception(CPUARMState *env, int new_mode,
+                                   uint32_t mask, uint32_t offset,
+                                   uint32_t newpc)
+{
+    /* Change the CPU state so as to actually take the exception. */
+    switch_mode(env, new_mode);
+    /*
+     * For exceptions taken to AArch32 we must clear the SS bit in both
+     * PSTATE and in the old-state value we save to SPSR_<mode>, so zero it now.
+     */
+    env->uncached_cpsr &= ~PSTATE_SS;
+    env->spsr = cpsr_read(env);
+    /* Clear IT bits.  */
+    env->condexec_bits = 0;
+    /* Switch to the new mode, and to the correct instruction set.  */
+    env->uncached_cpsr = (env->uncached_cpsr & ~CPSR_M) | new_mode;
+    /* Set new mode endianness */
+    env->uncached_cpsr &= ~CPSR_E;
+    if (env->cp15.sctlr_el[arm_current_el(env)] & SCTLR_EE) {
+        env->uncached_cpsr |= CPSR_E;
+    }
+    env->daif |= mask;
+
+    if (new_mode == ARM_CPU_MODE_HYP) {
+        env->thumb = (env->cp15.sctlr_el[2] & SCTLR_TE) != 0;
+        env->elr_el[2] = env->regs[15];
+    } else {
+        /*
+         * this is a lie, as there was no c1_sys on V4T/V5, but who cares
+         * and we should just guard the thumb mode on V4
+         */
+        if (arm_feature(env, ARM_FEATURE_V4T)) {
+            env->thumb =
+                (A32_BANKED_CURRENT_REG_GET(env, sctlr) & SCTLR_TE) != 0;
+        }
+        env->regs[14] = env->regs[15] + offset;
+    }
+    env->regs[15] = newpc;
+}
+
+static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
+{
+    /*
+     * Handle exception entry to Hyp mode; this is sufficiently
+     * different to entry to other AArch32 modes that we handle it
+     * separately here.
+     *
+     * The vector table entry used is always the 0x14 Hyp mode entry point,
+     * unless this is an UNDEF/HVC/abort taken from Hyp to Hyp.
+     * The offset applied to the preferred return address is always zero
+     * (see DDI0487C.a section G1.12.3).
+     * PSTATE A/I/F masks are set based only on the SCR.EA/IRQ/FIQ values.
+     */
+    uint32_t addr, mask;
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    switch (cs->exception_index) {
+    case EXCP_UDEF:
+        addr = 0x04;
+        break;
+    case EXCP_SWI:
+        addr = 0x14;
+        break;
+    case EXCP_BKPT:
+        /* Fall through to prefetch abort.  */
+    case EXCP_PREFETCH_ABORT:
+        env->cp15.ifar_s = env->exception.vaddress;
+        qemu_log_mask(CPU_LOG_INT, "...with HIFAR 0x%x\n",
+                      (uint32_t)env->exception.vaddress);
+        addr = 0x0c;
+        break;
+    case EXCP_DATA_ABORT:
+        env->cp15.dfar_s = env->exception.vaddress;
+        qemu_log_mask(CPU_LOG_INT, "...with HDFAR 0x%x\n",
+                      (uint32_t)env->exception.vaddress);
+        addr = 0x10;
+        break;
+    case EXCP_IRQ:
+        addr = 0x18;
+        break;
+    case EXCP_FIQ:
+        addr = 0x1c;
+        break;
+    case EXCP_HVC:
+        addr = 0x08;
+        break;
+    case EXCP_HYP_TRAP:
+        addr = 0x14;
+    default:
+        cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
+    }
+
+    if (cs->exception_index != EXCP_IRQ && cs->exception_index != EXCP_FIQ) {
+        env->cp15.esr_el[2] = env->exception.syndrome;
+    }
+
+    if (arm_current_el(env) != 2 && addr < 0x14) {
+        addr = 0x14;
+    }
+
+    mask = 0;
+    if (!(env->cp15.scr_el3 & SCR_EA)) {
+        mask |= CPSR_A;
+    }
+    if (!(env->cp15.scr_el3 & SCR_IRQ)) {
+        mask |= CPSR_I;
+    }
+    if (!(env->cp15.scr_el3 & SCR_IRQ)) {
+        mask |= CPSR_F;
+    }
+
+    addr += env->cp15.hvbar;
+
+    take_aarch32_exception(env, ARM_CPU_MODE_HYP, mask, 0, addr);
+}
+
 static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -8048,6 +8165,11 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         env->cp15.mdscr_el1 = deposit64(env->cp15.mdscr_el1, 2, 4, moe);
     }
 
+    if (env->exception.target_el == 2) {
+        arm_cpu_do_interrupt_aarch32_hyp(cs);
+        return;
+    }
+
     /* TODO: Vectored interrupt controller.  */
     switch (cs->exception_index) {
     case EXCP_UDEF:
@@ -8155,29 +8277,7 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         env->cp15.scr_el3 &= ~SCR_NS;
     }
 
-    switch_mode (env, new_mode);
-    /* For exceptions taken to AArch32 we must clear the SS bit in both
-     * PSTATE and in the old-state value we save to SPSR_<mode>, so zero it now.
-     */
-    env->uncached_cpsr &= ~PSTATE_SS;
-    env->spsr = cpsr_read(env);
-    /* Clear IT bits.  */
-    env->condexec_bits = 0;
-    /* Switch to the new mode, and to the correct instruction set.  */
-    env->uncached_cpsr = (env->uncached_cpsr & ~CPSR_M) | new_mode;
-    /* Set new mode endianness */
-    env->uncached_cpsr &= ~CPSR_E;
-    if (env->cp15.sctlr_el[arm_current_el(env)] & SCTLR_EE) {
-        env->uncached_cpsr |= CPSR_E;
-    }
-    env->daif |= mask;
-    /* this is a lie, as the was no c1_sys on V4T/V5, but who cares
-     * and we should just guard the thumb mode on V4 */
-    if (arm_feature(env, ARM_FEATURE_V4T)) {
-        env->thumb = (A32_BANKED_CURRENT_REG_GET(env, sctlr) & SCTLR_TE) != 0;
-    }
-    env->regs[14] = env->regs[15] + offset;
-    env->regs[15] = addr;
+    take_aarch32_exception(env, new_mode, mask, offset, addr);
 }
 
 /* Handle exception entry to a target EL which is using AArch64 */
-- 
2.18.0

