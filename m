Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp704452wrw;
        Fri, 9 Nov 2018 05:48:25 -0800 (PST)
X-Google-Smtp-Source: AJdET5czMMx03bk6kK/7OAopdGnw4Ql6KGdK7qkqf0AWVSvaZbTfoj1Pa+BzLQhUhawiqSoycMSr
X-Received: by 2002:a37:c3c3:: with SMTP id r64mr8250093qkl.70.1541771305359;
        Fri, 09 Nov 2018 05:48:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541771305; cv=none;
        d=google.com; s=arc-20160816;
        b=WHRb3MVX2RD2ZPIgjduJtXhzKLBv5HLgpLOqk7zZIARVLvMcJl8rZMqX536LBc2PfN
         R/XvtxvALpc+9M9FulvtWg1LjEFrL7a4RWUtKDnPttyBFHB3IlhFJ+iwUp3XvXU3WCSM
         A3XO6XWW53wd73+wsb06jnrpE5iJdA3cRFbT6gFH1JWJHOh+UEGIJJXlLvCsjfCVAOOW
         vQ7GjNMvVZXdEFvL3Un9pCAomra5105V0sEdEwIxWTKX9bgueFY87LMyE3NoFAet1U1M
         FrzeGPXuSFOpUnUt1aPAybwN3HLCs3UUJn9IrZztxQzdciKdBwE8a/wX5Jvj13l7qM3d
         0MrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=2R/PQ4pPkRQnHfmUtxmkGvglYJi/ernM+9OqC8cTfZI=;
        b=hqqQxRxfju3MEajZLmE6XPtNCDpNWfUwWFCKy/tKEb78xwkC+JjcHGAxOiB1MimJew
         UAngZ9AXBWvF2WLsik5+D1QNw941Hzgrqejg1CFr1IkZfA/UHpaPvSv54QcAVFylS3fb
         li3SLsfcRkiQoikGGjTN7/+cQRC9iUw3SlgjthlkTCPA3jE+/JIfb36cQJSi7XXCmQF+
         tEkCJj5MigbfV4UMEaESq804+XvX4TelWX7DizyxwLlL3H++Jqd3l0anWbuxCsy+i/dl
         il1+y+fs/5sqoAkgY1+X9OS9CtMEALBJ1qBrtw+B5YEE+e3KXJhLHgu3u3mkwMTuabSa
         patQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i54si957903qvh.107.2018.11.09.05.48.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 05:48:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34200 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gL796-0001ZZ-RU
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 08:48:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gL78h-0001Po-86
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 08:48:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gL78c-0007re-MK
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 08:47:58 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:52456)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gL78b-0007ON-7I; Fri, 09 Nov 2018 08:47:54 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gL78L-0002kw-Ll; Fri, 09 Nov 2018 13:47:37 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  9 Nov 2018 13:47:31 +0000
Message-Id: <20181109134731.11605-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181109134731.11605-1-peter.maydell@linaro.org>
References: <20181109134731.11605-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-v3.1 3/3] target/arm: Correctly implement
 handling of HCR_EL2.{VI, VF}
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
X-TUID: mnbFcng+vIvR

In commit 8a0fc3a29fc2315325400 we tried to implement HCR_EL2.{VI,VF},
but we got it wrong and had to revert it.

In that commit we implemented them as simply tracking whether there
is a pending virtual IRQ or virtual FIQ. This is not correct -- these
bits cause a software-generated VIRQ/VFIQ, which is distinct from
whether there is a hardware-generated VIRQ/VFIQ caused by the
external interrupt controller. So we need to track separately
the HCR_EL2 bit state and the external virq/vfiq line state, and
OR the two together to get the actual pending VIRQ/VFIQ state.

Fixes: 8a0fc3a29fc2315325400c738f807d0d4ae0ab7f
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 18 ++++++++++++++++
 target/arm/cpu.c       | 48 +++++++++++++++++++++++++++++++++++++++++-
 target/arm/helper.c    | 20 ++++++++++++++++--
 3 files changed, 83 insertions(+), 3 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 6c2bb2deebd..a32d359dd03 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -871,4 +871,22 @@ static inline const char *aarch32_mode_name(uint32_t psr)
     return cpu_mode_names[psr & 0xf];
 }
 
+/**
+ * arm_cpu_update_virq: Update CPU_INTERRUPT_VIRQ bit in cs->interrupt_request
+ *
+ * Update the CPU_INTERRUPT_VIRQ bit in cs->interrupt_request, following
+ * a change to either the input VIRQ line from the GIC or the HCR_EL2.VI bit.
+ * Must be called with the iothread lock held.
+ */
+void arm_cpu_update_virq(ARMCPU *cpu);
+
+/**
+ * arm_cpu_update_vfiq: Update CPU_INTERRUPT_VFIQ bit in cs->interrupt_request
+ *
+ * Update the CPU_INTERRUPT_VFIQ bit in cs->interrupt_request, following
+ * a change to either the input VFIQ line from the GIC or the HCR_EL2.VF bit.
+ * Must be called with the iothread lock held.
+ */
+void arm_cpu_update_vfiq(ARMCPU *cpu);
+
 #endif
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 45c16ae90ba..6fbea4dc88c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -436,6 +436,48 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 }
 #endif
 
+void arm_cpu_update_virq(ARMCPU *cpu)
+{
+    /*
+     * Update the interrupt level for VIRQ, which is the logical OR of
+     * the HCR_EL2.VI bit and the input line level from the GIC.
+     */
+    CPUARMState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+
+    bool new_state = (env->cp15.hcr_el2 & HCR_VI) ||
+        (env->irq_line_state & CPU_INTERRUPT_VIRQ);
+
+    if (new_state != ((cs->interrupt_request & CPU_INTERRUPT_VIRQ) != 0)) {
+        if (new_state) {
+            cpu_interrupt(cs, CPU_INTERRUPT_VIRQ);
+        } else {
+            cpu_reset_interrupt(cs, CPU_INTERRUPT_VIRQ);
+        }
+    }
+}
+
+void arm_cpu_update_vfiq(ARMCPU *cpu)
+{
+    /*
+     * Update the interrupt level for VFIQ, which is the logical OR of
+     * the HCR_EL2.VF bit and the input line level from the GIC.
+     */
+    CPUARMState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+
+    bool new_state = (env->cp15.hcr_el2 & HCR_VF) ||
+        (env->irq_line_state & CPU_INTERRUPT_VFIQ);
+
+    if (new_state != ((cs->interrupt_request & CPU_INTERRUPT_VFIQ) != 0)) {
+        if (new_state) {
+            cpu_interrupt(cs, CPU_INTERRUPT_VFIQ);
+        } else {
+            cpu_reset_interrupt(cs, CPU_INTERRUPT_VFIQ);
+        }
+    }
+}
+
 #ifndef CONFIG_USER_ONLY
 static void arm_cpu_set_irq(void *opaque, int irq, int level)
 {
@@ -457,9 +499,13 @@ static void arm_cpu_set_irq(void *opaque, int irq, int level)
 
     switch (irq) {
     case ARM_CPU_VIRQ:
+        assert(arm_feature(env, ARM_FEATURE_EL2));
+        arm_cpu_update_virq(cpu);
+        break;
     case ARM_CPU_VFIQ:
         assert(arm_feature(env, ARM_FEATURE_EL2));
-        /* fall through */
+        arm_cpu_update_vfiq(cpu);
+        break;
     case ARM_CPU_IRQ:
     case ARM_CPU_FIQ:
         if (level) {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index f3878f505b7..771e4c3d0fb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3958,6 +3958,21 @@ static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         tlb_flush(CPU(cpu));
     }
     env->cp15.hcr_el2 = value;
+
+    /*
+     * Updates to VI and VF require us to update the status of
+     * virtual interrupts, which are the logical OR of these bits
+     * and the state of the input lines from the GIC. (This requires
+     * that we have the iothread lock, which is done by marking the
+     * reginfo structs as ARM_CP_IO.)
+     * Note that if a write to HCR pends a VIRQ or VFIQ it is never
+     * possible for it to be taken immediately, because VIRQ and
+     * VFIQ are masked unless running at EL0 or EL1, and HCR
+     * can only be written at EL2.
+     */
+    g_assert(qemu_mutex_iothread_locked());
+    arm_cpu_update_virq(cpu);
+    arm_cpu_update_vfiq(cpu);
 }
 
 static void hcr_writehigh(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -3978,11 +3993,12 @@ static void hcr_writelow(CPUARMState *env, const ARMCPRegInfo *ri,
 
 static const ARMCPRegInfo el2_cp_reginfo[] = {
     { .name = "HCR_EL2", .state = ARM_CP_STATE_AA64,
+      .type = ARM_CP_IO,
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.hcr_el2),
       .writefn = hcr_write },
     { .name = "HCR", .state = ARM_CP_STATE_AA32,
-      .type = ARM_CP_ALIAS,
+      .type = ARM_CP_ALIAS | ARM_CP_IO,
       .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.hcr_el2),
       .writefn = hcr_writelow },
@@ -4222,7 +4238,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
 
 static const ARMCPRegInfo el2_v8_cp_reginfo[] = {
     { .name = "HCR2", .state = ARM_CP_STATE_AA32,
-      .type = ARM_CP_ALIAS,
+      .type = ARM_CP_ALIAS | ARM_CP_IO,
       .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 4,
       .access = PL2_RW,
       .fieldoffset = offsetofhigh32(CPUARMState, cp15.hcr_el2),
-- 
2.19.1

