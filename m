Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp816020wrd;
        Mon, 20 Aug 2018 08:30:59 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPx7wZObN6G147rHZ2Ba3HGx/ifnStxln7Gu8C3oJNUaV9gTKI+MwFPK2uFI3r9fyBIZiQCB
X-Received: by 2002:a0c:c993:: with SMTP id b19-v6mr41951498qvk.95.1534779059101;
        Mon, 20 Aug 2018 08:30:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534779059; cv=none;
        d=google.com; s=arc-20160816;
        b=jlBemAwJKkJ32JW+MeiEUqnAH7HcNYa5kmsxxqOCUxZBYd+G6WY/mgMRQuiku2zj3G
         qq8aNARYzRFrSwCuDFJx++ygumGg+kdbS52q6fOTBF6Exe3Mq/MISGAJ8PXyh1bA9pwL
         fer4/biB5znioG23JJjAHd0U7YofDdCpjBDOZUCk3UbDtZHcM8MyzrSib40ZsVwvDUJ+
         /isKA2DSP0umx3XkXWb2GpsFN5MP89hprOqEtL2Lj00ZL5VgboGnjj9ZwRHy65hnrfiu
         v6sAk6pn1jMngXQ/MjxflRSk1l6CpKbMTNZ3xwEu5VqgQbgeTa9ETlGHtZYTEs54Y8mq
         xr2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Y4gUelCrE1F3jM0cECchYrgiIiN/Ka2nn028sVC+Ikk=;
        b=jmVg4kTkTXgSwEbWbhs1MI/rm4TeejNa1NcNdomqukcob0Qq1WGlPqrTku4NXkusUr
         B85qOb/Z0XqxB10krXAz1trKnsZW6UyyTq6nouFnJiJwFvVEVTGc4NTdvab+CVMtiuif
         YBKMhnm3ABvN/yPkioldPv/HHTAighlV+TPXetyOflmtIf5hoBE2KY+n0Ld9pi10BvGu
         gXTI3N97fByBOIECeAeib01qOMzrWKjBPojMrISv5ZfmGJAkavvyLJeoyC8AKiJFBZm5
         n96kTIQvYx3jVstQbOwnqKM6FQ9YcQRvmnsxG28sDOeyLa/xi1CZH1Qw3yNQOo4cFy1n
         kYaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t5-v6si3223606qti.240.2018.08.20.08.30.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 08:30:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47747 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frm8w-0005p1-Hb
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 11:30:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frm8V-0005a6-1G
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 11:30:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frm8U-00049z-5Z
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 11:30:30 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44712)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1frm8T-00044t-KX; Mon, 20 Aug 2018 11:30:29 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1frm8Q-0003Z3-Kf; Mon, 20 Aug 2018 16:30:26 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Aug 2018 16:30:18 +0100
Message-Id: <20180820153020.21478-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820153020.21478-1-peter.maydell@linaro.org>
References: <20180820153020.21478-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 4/6] target/arm: Implement support for taking
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BvWfknuPY6Pm

Implement the necessary support code for taking exceptions
to Hyp mode in AArch32.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 82 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a4ddda5a1bd..21a2d438944 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8073,6 +8073,83 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
     env->regs[15] = newpc;
 }
 
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
+    if (!(env->cp15.scr_el3 & SCR_FIQ)) {
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
@@ -8108,6 +8185,11 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
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
-- 
2.18.0

