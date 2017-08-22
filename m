Received: by 10.223.188.70 with SMTP id a6csp5092457wrh;
        Tue, 22 Aug 2017 08:34:43 -0700 (PDT)
X-Received: by 10.55.47.135 with SMTP id v129mr1614324qkh.13.1503416083089;
        Tue, 22 Aug 2017 08:34:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503416083; cv=none;
        d=google.com; s=arc-20160816;
        b=V+rqmkuC66AEU1QSkB38RHBdZnYLJOXoyUZhQrJY4jQ5wROorK/CFArHCtKSAq0N9j
         zxJB4eYmgLbqwtvPxbfLIDqw9xlKFQ6V1A988LW7NOuLZgC92k9FzAqyVdereRjVGnV7
         GZRkuxX8i1x0NFT7JPCv8THebhuFMGtO3A+fTzp8H9z0ZLLTSB08HlOZGhM+LmmJ7W5X
         bTyYuh6pGSkwC+VMf4dPQwvT2YoiWcZvmvWTelkOoVhdx2qt+NYey/4xfVjYMJOL1J3g
         wNweHx4cKRHHP6YAt9WG2IqYaZ/0nsAYrFn0sNsqw314YsCdHOaW18TMafkcLwoiRD/a
         IPkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=kE6xWZi2IMg4sT8d0R+McIWwziPSQ44v6M9kDzQFZN8=;
        b=n2kGU9US+jBQzNGHjKGToszHl0zAu9Q3O1J4z87EFBFu2jBqJEsSC15+87GOI0eJ2h
         Frc6PmCV9j0lUALkgtjngwkFyeTKijEgTHd71SPr38Zz0sI4+iVptRUk/z06/Y+4KsoV
         RkkguvKXROxG2GksFLyppn/JfK3UbwcZXVFFzYzwE/OaCQc9CqDcYNg/1hhNeb30wqFV
         mEqD2CgSCwimaaRmPPxgxqGUKLWksJr9PBaN8TxOceIvht6np8+ccQNnco+hrR6opSEg
         bS3UuciBajfBRItZeCsaC4VuaTxrOWGCqNeTIfZZ1BxHDw5gX5xK6Lv702kcAgP5IvNE
         +2aw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o2si13602826qkc.93.2017.08.22.08.34.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:34:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54785 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkBCS-00036A-Ob
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:34:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnp-0006VO-Dm
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnn-0003Do-Pv
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:13 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36978)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dkAnn-0003CS-Er; Tue, 22 Aug 2017 11:09:11 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dkAnm-0004l3-5h; Tue, 22 Aug 2017 16:09:10 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 22 Aug 2017 16:08:56 +0100
Message-Id: <1503414539-28762-18-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 17/20] target/arm: Make MMFAR banked for v8M
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QT8YFzBor1CR

Make the MMFAR register banked if v8M security extensions are
enabled.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h      | 2 +-
 hw/intc/armv7m_nvic.c | 4 ++--
 target/arm/helper.c   | 4 ++--
 target/arm/machine.c  | 3 ++-
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 25ebf9e..21c68d7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -427,7 +427,7 @@ typedef struct CPUARMState {
         uint32_t cfsr; /* Configurable Fault Status */
         uint32_t hfsr; /* HardFault Status */
         uint32_t dfsr; /* Debug Fault Status Register */
-        uint32_t mmfar; /* MemManage Fault Address */
+        uint32_t mmfar[2]; /* MemManage Fault Address */
         uint32_t bfar; /* BusFault Address */
         unsigned mpu_ctrl[2]; /* MPU_CTRL */
         int exception;
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index f071649..99b62ac 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -506,7 +506,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
     case 0xd30: /* Debug Fault Status.  */
         return cpu->env.v7m.dfsr;
     case 0xd34: /* MMFAR MemManage Fault Address */
-        return cpu->env.v7m.mmfar;
+        return cpu->env.v7m.mmfar[attrs.secure];
     case 0xd38: /* Bus Fault Address.  */
         return cpu->env.v7m.bfar;
     case 0xd3c: /* Aux Fault Status.  */
@@ -723,7 +723,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
         cpu->env.v7m.dfsr &= ~value; /* W1C */
         break;
     case 0xd34: /* Mem Manage Address.  */
-        cpu->env.v7m.mmfar = value;
+        cpu->env.v7m.mmfar[attrs.secure] = value;
         return;
     case 0xd38: /* Bus Fault Address.  */
         cpu->env.v7m.bfar = value;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 28b3d6c..e587e85 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6380,10 +6380,10 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
             case EXCP_DATA_ABORT:
                 env->v7m.cfsr |=
                     (R_V7M_CFSR_DACCVIOL_MASK | R_V7M_CFSR_MMARVALID_MASK);
-                env->v7m.mmfar = env->exception.vaddress;
+                env->v7m.mmfar[env->v7m.secure] = env->exception.vaddress;
                 qemu_log_mask(CPU_LOG_INT,
                               "...with CFSR.DACCVIOL and MMFAR 0x%x\n",
-                              env->v7m.mmfar);
+                              env->v7m.mmfar[env->v7m.secure]);
                 break;
             }
             armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM);
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 4457ec6..5122e58 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -121,7 +121,7 @@ static const VMStateDescription vmstate_m = {
         VMSTATE_UINT32(env.v7m.cfsr, ARMCPU),
         VMSTATE_UINT32(env.v7m.hfsr, ARMCPU),
         VMSTATE_UINT32(env.v7m.dfsr, ARMCPU),
-        VMSTATE_UINT32(env.v7m.mmfar, ARMCPU),
+        VMSTATE_UINT32(env.v7m.mmfar[M_REG_NS], ARMCPU),
         VMSTATE_UINT32(env.v7m.bfar, ARMCPU),
         VMSTATE_UINT32(env.v7m.mpu_ctrl[M_REG_NS], ARMCPU),
         VMSTATE_INT32(env.v7m.exception, ARMCPU),
@@ -272,6 +272,7 @@ static const VMStateDescription vmstate_m_security = {
         VMSTATE_VALIDATE("secure MPU_RNR is valid", s_rnr_vmstate_validate),
         VMSTATE_UINT32(env.v7m.mpu_ctrl[M_REG_S], ARMCPU),
         VMSTATE_UINT32(env.v7m.ccr[M_REG_S], ARMCPU),
+        VMSTATE_UINT32(env.v7m.mmfar[M_REG_S], ARMCPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.7.4

