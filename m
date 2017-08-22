Received: by 10.223.188.70 with SMTP id a6csp5091481wrh;
        Tue, 22 Aug 2017 08:33:46 -0700 (PDT)
X-Received: by 10.55.184.71 with SMTP id i68mr1527901qkf.162.1503416026582;
        Tue, 22 Aug 2017 08:33:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503416026; cv=none;
        d=google.com; s=arc-20160816;
        b=iMxtckQQzpau7anUs777uwgwZ8qaww/sf1eI3p74EmG8zi/zyzMfexY9xU0vR0+uYI
         uZ30lI3RiQQNE/28nIrKGFYWKVxlF53ggSXVkuiFU3CstB8d5yAWGkbRJ6bN1ebyBajW
         9MEb112NKKG9VrRi8KE9xm6uRc24sQ3wpdjGuhTrqS/Up4mQMpbImZ1otXmcAFPAw+M6
         NypZuCvs7v1im+fZRw1dvDiayXza0T1f3RpMKEsRGB5a4iV0eaoXPC+6y1D7CNUo5Xbn
         SMJwz6sSp4Ysj+YPzuOrxerlf5E89rkNdP3g6sd+4vgkdjV+BD1Y2kthqlJ7+x+mf5h2
         Ktyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=JyU0DYomgjAN4R4XYcA2L0EnrWl0Osvx4RYV470Cvj4=;
        b=ITFE6LzlBj/VBvuMDHuh33A7STMAABcKNufswRX11atZQlk0g3kh0Hum+EhYeESC2F
         vd1hk+w3zZYTT4Kzhm4a2rDP3Zk/jV2UcIzqQ96hX0mCfaM1R8tHKjV22V4/t/ZReb32
         T30aw8idOllxkf+2nZCQGUMlwVGOIcn6/rexO2dIxVBOwa2znDGbpV2EBZe8N2Fh4iWg
         WEAJOset2dXbPzKevOaft4daoSifqk2NQqp/BEgt+1eSbtnikobXPdo+8fSc0y7wBOp1
         V51MA1wmRrxqqT794pXKL7Li5vtrjqeORNiGOhsq7/n1HJBZJMYopBqmXloEXvWF1TK/
         euLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o128si13918989qka.497.2017.08.22.08.33.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:33:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54651 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkBBY-0001k0-5A
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:33:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAo4-0006pq-83
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 11:09:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAo2-0003QX-HH
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 11:09:28 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36984)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dkAnp-0003E6-RH; Tue, 22 Aug 2017 11:09:14 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dkAnn-0004lV-1q; Tue, 22 Aug 2017 16:09:11 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 22 Aug 2017 16:08:57 +0100
Message-Id: <1503414539-28762-19-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 18/20] target/arm: Make CFSR register banked
 for v8M
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ycygvoj1w9j/

Make the CFSR register banked if v8M security extensions are enabled.

Not all the bits in this register are banked: the BFSR
bits [15:8] are shared between S and NS, and we store them
in the NS copy of the register.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h      |  7 ++++++-
 hw/intc/armv7m_nvic.c | 15 +++++++++++++--
 target/arm/helper.c   | 18 +++++++++---------
 target/arm/machine.c  |  3 ++-
 4 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 21c68d7..3683537 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -424,7 +424,7 @@ typedef struct CPUARMState {
         uint32_t basepri[2];
         uint32_t control[2];
         uint32_t ccr[2]; /* Configuration and Control */
-        uint32_t cfsr; /* Configurable Fault Status */
+        uint32_t cfsr[2]; /* Configurable Fault Status */
         uint32_t hfsr; /* HardFault Status */
         uint32_t dfsr; /* Debug Fault Status Register */
         uint32_t mmfar[2]; /* MemManage Fault Address */
@@ -1210,6 +1210,11 @@ FIELD(V7M_CFSR, NOCP, 16 + 3, 1)
 FIELD(V7M_CFSR, UNALIGNED, 16 + 8, 1)
 FIELD(V7M_CFSR, DIVBYZERO, 16 + 9, 1)
 
+/* V7M CFSR bit masks covering all of the subregister bits */
+FIELD(V7M_CFSR, MMFSR, 0, 8)
+FIELD(V7M_CFSR, BFSR, 8, 8)
+FIELD(V7M_CFSR, UFSR, 16, 16)
+
 /* V7M HFSR bits */
 FIELD(V7M_HFSR, VECTTBL, 1, 1)
 FIELD(V7M_HFSR, FORCED, 30, 1)
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 99b62ac..3c14cc8 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -500,7 +500,12 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
         }
         return val;
     case 0xd28: /* Configurable Fault Status.  */
-        return cpu->env.v7m.cfsr;
+        /* The BFSR bits [15:8] are shared between security states
+         * and we store them in the NS copy
+         */
+        val = cpu->env.v7m.cfsr[attrs.secure];
+        val |= cpu->env.v7m.cfsr[M_REG_NS] & R_V7M_CFSR_BFSR_MASK;
+        return val;
     case 0xd2c: /* Hard Fault Status.  */
         return cpu->env.v7m.hfsr;
     case 0xd30: /* Debug Fault Status.  */
@@ -714,7 +719,13 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
         nvic_irq_update(s);
         break;
     case 0xd28: /* Configurable Fault Status.  */
-        cpu->env.v7m.cfsr &= ~value; /* W1C */
+        cpu->env.v7m.cfsr[attrs.secure] &= ~value; /* W1C */
+        if (attrs.secure) {
+            /* The BFSR bits [15:8] are shared between security states
+             * and we store them in the NS copy.
+             */
+            cpu->env.v7m.cfsr[M_REG_NS] &= ~(value & R_V7M_CFSR_BFSR_MASK);
+        }
         break;
     case 0xd2c: /* Hard Fault Status.  */
         cpu->env.v7m.hfsr &= ~value; /* W1C */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e587e85..67b3874 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6229,7 +6229,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
         /* Bad exception return: instead of popping the exception
          * stack, directly take a usage fault on the current stack.
          */
-        env->v7m.cfsr |= R_V7M_CFSR_INVPC_MASK;
+        env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVPC_MASK;
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
         v7m_exception_taken(cpu, type | 0xf0000000);
         qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
@@ -6271,7 +6271,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
     if (return_to_handler != arm_v7m_is_handler_mode(env)) {
         /* Take an INVPC UsageFault by pushing the stack again. */
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
-        env->v7m.cfsr |= R_V7M_CFSR_INVPC_MASK;
+        env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVPC_MASK;
         v7m_push_stack(cpu);
         v7m_exception_taken(cpu, type | 0xf0000000);
         qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on new stackframe: "
@@ -6330,15 +6330,15 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
     switch (cs->exception_index) {
     case EXCP_UDEF:
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
-        env->v7m.cfsr |= R_V7M_CFSR_UNDEFINSTR_MASK;
+        env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_UNDEFINSTR_MASK;
         break;
     case EXCP_NOCP:
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
-        env->v7m.cfsr |= R_V7M_CFSR_NOCP_MASK;
+        env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_NOCP_MASK;
         break;
     case EXCP_INVSTATE:
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
-        env->v7m.cfsr |= R_V7M_CFSR_INVSTATE_MASK;
+        env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVSTATE_MASK;
         break;
     case EXCP_SWI:
         /* The PC already points to the next instruction.  */
@@ -6354,11 +6354,11 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         case 0x8: /* External Abort */
             switch (cs->exception_index) {
             case EXCP_PREFETCH_ABORT:
-                env->v7m.cfsr |= R_V7M_CFSR_PRECISERR_MASK;
+                env->v7m.cfsr[M_REG_NS] |= R_V7M_CFSR_PRECISERR_MASK;
                 qemu_log_mask(CPU_LOG_INT, "...with CFSR.PRECISERR\n");
                 break;
             case EXCP_DATA_ABORT:
-                env->v7m.cfsr |=
+                env->v7m.cfsr[M_REG_NS] |=
                     (R_V7M_CFSR_IBUSERR_MASK | R_V7M_CFSR_BFARVALID_MASK);
                 env->v7m.bfar = env->exception.vaddress;
                 qemu_log_mask(CPU_LOG_INT,
@@ -6374,11 +6374,11 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
              */
             switch (cs->exception_index) {
             case EXCP_PREFETCH_ABORT:
-                env->v7m.cfsr |= R_V7M_CFSR_IACCVIOL_MASK;
+                env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_IACCVIOL_MASK;
                 qemu_log_mask(CPU_LOG_INT, "...with CFSR.IACCVIOL\n");
                 break;
             case EXCP_DATA_ABORT:
-                env->v7m.cfsr |=
+                env->v7m.cfsr[env->v7m.secure] |=
                     (R_V7M_CFSR_DACCVIOL_MASK | R_V7M_CFSR_MMARVALID_MASK);
                 env->v7m.mmfar[env->v7m.secure] = env->exception.vaddress;
                 qemu_log_mask(CPU_LOG_INT,
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 5122e58..3cc94b4 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -118,7 +118,7 @@ static const VMStateDescription vmstate_m = {
         VMSTATE_UINT32(env.v7m.basepri[M_REG_NS], ARMCPU),
         VMSTATE_UINT32(env.v7m.control[M_REG_NS], ARMCPU),
         VMSTATE_UINT32(env.v7m.ccr[M_REG_NS], ARMCPU),
-        VMSTATE_UINT32(env.v7m.cfsr, ARMCPU),
+        VMSTATE_UINT32(env.v7m.cfsr[M_REG_NS], ARMCPU),
         VMSTATE_UINT32(env.v7m.hfsr, ARMCPU),
         VMSTATE_UINT32(env.v7m.dfsr, ARMCPU),
         VMSTATE_UINT32(env.v7m.mmfar[M_REG_NS], ARMCPU),
@@ -273,6 +273,7 @@ static const VMStateDescription vmstate_m_security = {
         VMSTATE_UINT32(env.v7m.mpu_ctrl[M_REG_S], ARMCPU),
         VMSTATE_UINT32(env.v7m.ccr[M_REG_S], ARMCPU),
         VMSTATE_UINT32(env.v7m.mmfar[M_REG_S], ARMCPU),
+        VMSTATE_UINT32(env.v7m.cfsr[M_REG_S], ARMCPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.7.4

