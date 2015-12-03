Received: by 10.182.158.201 with SMTP id ww9csp3413451obb;
        Wed, 2 Dec 2015 16:22:03 -0800 (PST)
X-Received: by 10.140.25.227 with SMTP id 90mr7635602qgt.73.1449102123291;
        Wed, 02 Dec 2015 16:22:03 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x143si2880449qka.122.2015.12.02.16.22.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:22:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60936 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4Hes-0000rs-QB
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:22:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc3-0004DX-RU
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc2-0001zR-Pr
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:07 -0500
Received: from mail-qg0-x22d.google.com ([2607:f8b0:400d:c04::22d]:34323)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4Hc2-0001zB-Lb; Wed, 02 Dec 2015 19:19:06 -0500
Received: by qgeb1 with SMTP id b1so48723712qge.1;
	Wed, 02 Dec 2015 16:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Odl2n4B6hRIL0IUldbRtbmcVptNwJB8N6tac4jRl84g=;
	b=vEsPzxIMgouWInjIW/ZnzY5pg8EvLmMU1G9+nMGLLwPjgzt+TknLzfcMBh0hc/sWWW
	Y/voM8lXLoOhf5CIcTnhCSGl3k6kLWx2UtCfBHh97DtK2IeHx6zame9B0nO1JshTTJ0X
	t/TRBvEM2BwNg9fycHVW2+iKNmx4gPnOIaWDQfBncCv+R3h3ebXk9zVcsrb2vLJRd5v2
	uv1PteIwBKAwz/d6M4MyNmZS/fN8R79/65MkwitIBibRhlZfTMTxVYh1euLqYLGc3sQJ
	JeDe9t5KnrLWeOysHVvZ6HHhN8uudm8xDPaBJhd9ifdx/vmHg+LCHDA6vTsHxnc6tC4L
	DVtg==
X-Received: by 10.140.241.146 with SMTP id m140mr8139134qhc.102.1449101946225; 
	Wed, 02 Dec 2015 16:19:06 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:05 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:36 -0500
Message-Id: <1449101933-24928-10-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::22d
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH v2 09/26] armv7m: implement CFSR, HFSR, BFAR,
	and MMFAR
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
X-TUID: 1jecdh4N4b2Z

Add the Configurable, HardFault, BusFault and MemManage Status registers.
Note undefined instructions, violations, and escalations.

No BusFaults are raised at this point.
---
 hw/intc/armv7m_nvic.c | 28 ++++++++++++++++++++++------
 target-arm/cpu.h      |  4 ++++
 target-arm/helper.c   |  3 +++
 target-arm/machine.c  |  8 ++++++--
 4 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index ca9bd4c..619c320 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -333,6 +333,7 @@ void armv7m_nvic_set_pending(void *opaque, int irq)
             irq = ARMV7M_EXCP_HARD;
             vec = &s->vectors[irq];
 
+            s->cpu->env.v7m.hfsr |= 1<<30; /* FORCED */
             DPRINTF(0, "Escalate %d to HardFault\n", oldirq);
         }
     }
@@ -548,16 +549,20 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset)
         if (s->vectors[ARMV7M_EXCP_USAGE].enabled) val |= (1 << 18);
         return val;
     case 0xd28: /* Configurable Fault Status.  */
-        /* TODO: Implement Fault Status.  */
-        qemu_log_mask(LOG_UNIMP, "Configurable Fault Status unimplemented\n");
-        return 0;
+        return cpu->env.v7m.cfsr;
     case 0xd2c: /* Hard Fault Status.  */
+        return cpu->env.v7m.hfsr;
     case 0xd30: /* Debug Fault Status.  */
-    case 0xd34: /* Mem Manage Address.  */
+        qemu_log_mask(LOG_UNIMP, "Debug Fault status register unimplemented\n");
+        return 0;
+    case 0xd34: /* MMFAR MemManage Fault Address */
+        return cpu->env.v7m.mmfar;
     case 0xd38: /* Bus Fault Address.  */
+        return cpu->env.v7m.bfar;
     case 0xd3c: /* Aux Fault Status.  */
         /* TODO: Implement fault status registers.  */
-        qemu_log_mask(LOG_UNIMP, "Fault status registers unimplemented\n");
+        qemu_log_mask(LOG_UNIMP,
+                      "Aux Fault status registers unimplemented\n");
         return 0;
     case 0xd40: /* PFR0.  */
         return 0x00000030;
@@ -690,13 +695,24 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
          */
         break;
     case 0xd28: /* Configurable Fault Status.  */
+        cpu->env.v7m.cfsr &= ~value; /* W1C */
+        break;
     case 0xd2c: /* Hard Fault Status.  */
+        cpu->env.v7m.hfsr &= ~value; /* W1C */
+        break;
     case 0xd30: /* Debug Fault Status.  */
+        qemu_log_mask(LOG_UNIMP,
+                      "NVIC: debug fault status register unimplemented\n");
+        break;
     case 0xd34: /* Mem Manage Address.  */
+        cpu->env.v7m.mmfar = value;
+        return;
     case 0xd38: /* Bus Fault Address.  */
+        cpu->env.v7m.bfar = value;
+        return;
     case 0xd3c: /* Aux Fault Status.  */
         qemu_log_mask(LOG_UNIMP,
-                      "NVIC: fault status registers unimplemented\n");
+                      "NVIC: Aux fault status registers unimplemented\n");
         break;
     case 0xf00: /* Software Triggered Interrupt Register */
         if ((value & 0x1ff) < NVIC_MAX_IRQ) {
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 4b7f78e..4262efc 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -396,6 +396,10 @@ typedef struct CPUARMState {
         uint32_t vecbase;
         uint32_t basepri;
         uint32_t control;
+        uint32_t cfsr; /* Configurable Fault Status */
+        uint32_t hfsr; /* HardFault Status */
+        uint32_t mmfar; /* MemManage Fault Address */
+        uint32_t bfar; /* BusFault Address */
         int current_sp;
         int exception;
         int exception_prio;
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 4490b74..d1ca011 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5454,6 +5454,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
     switch (cs->exception_index) {
     case EXCP_UDEF:
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
+        env->v7m.cfsr |= 1<<16; /* UNDEFINSTR */
         break;
     case EXCP_SWI:
         /* The PC already points to the next instruction.  */
@@ -5465,6 +5466,8 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
          * should set the MMFAR, etc from exception.fsr and exception.vaddress.
          */
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM);
+        env->v7m.mmfar = env->exception.vaddress;
+        env->v7m.cfsr = (1<<1)|(1<<7); /* DACCVIOL and MMARVALID */
         break;
     case EXCP_BKPT:
         if (semihosting_enabled()) {
diff --git a/target-arm/machine.c b/target-arm/machine.c
index 36a0d15..14a4882 100644
--- a/target-arm/machine.c
+++ b/target-arm/machine.c
@@ -92,14 +92,18 @@ static bool m_needed(void *opaque)
 
 static const VMStateDescription vmstate_m = {
     .name = "cpu/m",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .needed = m_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(env.v7m.other_sp, ARMCPU),
         VMSTATE_UINT32(env.v7m.vecbase, ARMCPU),
         VMSTATE_UINT32(env.v7m.basepri, ARMCPU),
         VMSTATE_UINT32(env.v7m.control, ARMCPU),
+        VMSTATE_UINT32(env.v7m.cfsr, ARMCPU),
+        VMSTATE_UINT32(env.v7m.hfsr, ARMCPU),
+        VMSTATE_UINT32(env.v7m.mmfar, ARMCPU),
+        VMSTATE_UINT32(env.v7m.bfar, ARMCPU),
         VMSTATE_INT32(env.v7m.current_sp, ARMCPU),
         VMSTATE_INT32(env.v7m.exception, ARMCPU),
         VMSTATE_END_OF_LIST()
-- 
2.1.4

