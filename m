Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp704692wrw;
        Fri, 9 Nov 2018 05:48:38 -0800 (PST)
X-Google-Smtp-Source: AJdET5clhYPulFeDESUToxERUQ0aKJZIcwUAwyRECpvcw4ZexI+XOOrbZ/C6efhyp6FxJAuECmVm
X-Received: by 2002:a0c:e9c4:: with SMTP id q4mr8900740qvo.18.1541771318580;
        Fri, 09 Nov 2018 05:48:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541771318; cv=none;
        d=google.com; s=arc-20160816;
        b=m7l+N8ilocXUx+jg3C6uAmUC+unqEsgOXjk+Ca1PrWngANxTD0RnqxFYDeUDuO4peO
         XYtOnzSV5dfRIVr45o5ist1Gfo3PBH2VmzM5ZCxhCUIJfkxP7gpLE3mNL5wZZFU9Kfu8
         c2EeCJKnG1AZ7QGnZikqbcQuj5MBYGFUCWT6/qK9zDvOpmA5CeHQbqeje346CFpDk7+0
         Unp3A1LgOF+HxI9DEtBqJvO0IQ6HcV3kpWp42B+5PFO5L6cleHvdATk1naAhrFjfQ+E6
         i5p5guz/9CvTDDnZI/U8u90AWSM879XS8TrlLaZAo8zzV4aLBFConPa4it2AUeQenhLe
         594w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=f0k6Vy4SZenDQYnqHnq78LUZZiLS1wcpJQ6I2rWlfz0=;
        b=bPO8wb055vWmB+B05WP/MfsRlXlC2yyFS1kpH9QFa+rrExICMIA4wx0xJdsXQNi9e7
         hmk6+D3dmD1UwdzUHFZuw1MQKjLEiIrA3qQqL0pTsvbvRJnR8X7Aqu2RAbEyWinDDJyt
         JnT5y8X62fDtvLVmrFwdYfxljvfzb4sLxZm4V0QlP2PSPWkYvwlFv+zL3C6MPMqDGkMz
         MvfPWYYRKijZVnwzKRCHmSUYg73pXdc4sx7KOcj0DVO8Yk1F7DFmo2ij2XJ3ZlMHmZiT
         imZYANs0gAMrthJ2SD1wlDdkUuuQy1A/hGGsz7zh/EyJ20AB57k+u1Q7s4fyaPm1Jzzn
         srCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n16si668192qtr.77.2018.11.09.05.48.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 05:48:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34201 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gL79K-0002TX-2k
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 08:48:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gL78n-0001Ti-Sf
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 08:48:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gL78l-0008IV-SK
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 08:48:05 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:52456)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gL78j-0007ON-9C; Fri, 09 Nov 2018 08:48:01 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gL78J-0002kN-ML; Fri, 09 Nov 2018 13:47:35 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  9 Nov 2018 13:47:29 +0000
Message-Id: <20181109134731.11605-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181109134731.11605-1-peter.maydell@linaro.org>
References: <20181109134731.11605-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-v3.1 1/3] Revert "target/arm: Implement
 HCR.VI and VF"
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
Cc: Adam Lackorzynski <adam.lackorzynski@kernkonzept.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W6AQoW9xrjuq

This reverts commit 8a0fc3a29fc2315325400c738f807d0d4ae0ab7f.

The implementation of HCR.VI and VF in that commit is not
correct -- they do not track the overall "is there a pending
VIRQ or VFIQ" status, but whether there is a pending interrupt
due to "this mechanism", ie the hypervisor having set the VI/VF
bits. The overall pending state for VIRQ and VFIQ is effectively
the logical OR of the inbound lines from the GIC with the
VI and VF bits. Commit 8a0fc3a29fc231 would result in pending
VIRQ/VFIQ possibly being lost when the hypervisor wrote to HCR.

As a preliminary to implementing the HCR.VI/VF feature properly,
revert the broken one entirely.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 47 ++++-----------------------------------------
 1 file changed, 4 insertions(+), 43 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 851ea9aa977..f3878f505b7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3931,7 +3931,6 @@ static const ARMCPRegInfo el3_no_el2_v8_cp_reginfo[] = {
 static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
-    CPUState *cs = ENV_GET_CPU(env);
     uint64_t valid_mask = HCR_MASK;
 
     if (arm_feature(env, ARM_FEATURE_EL3)) {
@@ -3950,28 +3949,6 @@ static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     /* Clear RES0 bits.  */
     value &= valid_mask;
 
-    /*
-     * VI and VF are kept in cs->interrupt_request. Modifying that
-     * requires that we have the iothread lock, which is done by
-     * marking the reginfo structs as ARM_CP_IO.
-     * Note that if a write to HCR pends a VIRQ or VFIQ it is never
-     * possible for it to be taken immediately, because VIRQ and
-     * VFIQ are masked unless running at EL0 or EL1, and HCR
-     * can only be written at EL2.
-     */
-    g_assert(qemu_mutex_iothread_locked());
-    if (value & HCR_VI) {
-        cs->interrupt_request |= CPU_INTERRUPT_VIRQ;
-    } else {
-        cs->interrupt_request &= ~CPU_INTERRUPT_VIRQ;
-    }
-    if (value & HCR_VF) {
-        cs->interrupt_request |= CPU_INTERRUPT_VFIQ;
-    } else {
-        cs->interrupt_request &= ~CPU_INTERRUPT_VFIQ;
-    }
-    value &= ~(HCR_VI | HCR_VF);
-
     /* These bits change the MMU setup:
      * HCR_VM enables stage 2 translation
      * HCR_PTW forbids certain page-table setups
@@ -3999,32 +3976,16 @@ static void hcr_writelow(CPUARMState *env, const ARMCPRegInfo *ri,
     hcr_write(env, NULL, value);
 }
 
-static uint64_t hcr_read(CPUARMState *env, const ARMCPRegInfo *ri)
-{
-    /* The VI and VF bits live in cs->interrupt_request */
-    uint64_t ret = env->cp15.hcr_el2 & ~(HCR_VI | HCR_VF);
-    CPUState *cs = ENV_GET_CPU(env);
-
-    if (cs->interrupt_request & CPU_INTERRUPT_VIRQ) {
-        ret |= HCR_VI;
-    }
-    if (cs->interrupt_request & CPU_INTERRUPT_VFIQ) {
-        ret |= HCR_VF;
-    }
-    return ret;
-}
-
 static const ARMCPRegInfo el2_cp_reginfo[] = {
     { .name = "HCR_EL2", .state = ARM_CP_STATE_AA64,
-      .type = ARM_CP_IO,
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.hcr_el2),
-      .writefn = hcr_write, .readfn = hcr_read },
+      .writefn = hcr_write },
     { .name = "HCR", .state = ARM_CP_STATE_AA32,
-      .type = ARM_CP_ALIAS | ARM_CP_IO,
+      .type = ARM_CP_ALIAS,
       .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.hcr_el2),
-      .writefn = hcr_writelow, .readfn = hcr_read },
+      .writefn = hcr_writelow },
     { .name = "ELR_EL2", .state = ARM_CP_STATE_AA64,
       .type = ARM_CP_ALIAS,
       .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 0, .opc2 = 1,
@@ -4261,7 +4222,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
 
 static const ARMCPRegInfo el2_v8_cp_reginfo[] = {
     { .name = "HCR2", .state = ARM_CP_STATE_AA32,
-      .type = ARM_CP_ALIAS | ARM_CP_IO,
+      .type = ARM_CP_ALIAS,
       .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 4,
       .access = PL2_RW,
       .fieldoffset = offsetofhigh32(CPUARMState, cp15.hcr_el2),
-- 
2.19.1

