Received: by 10.25.44.15 with SMTP id s15csp6357332lfs;
        Wed, 2 Aug 2017 09:48:24 -0700 (PDT)
X-Received: by 10.200.56.216 with SMTP id g24mr31690946qtc.83.1501692504425;
        Wed, 02 Aug 2017 09:48:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501692504; cv=none;
        d=google.com; s=arc-20160816;
        b=b6ImyLdeV+Jmbfjsb5fXXXyWoHaqyEeg0cJOAV/LmXKj1jmHYOVX6nzJEgXXCM8tss
         RFZ1IbfQnOUKrUfomAYP+QSBqzNOwudUzRSrrkM3IsZ+YPqXLitA6nKTG7T+ZiHmLmim
         xoouLSWl1teCecs0xjMdvirQKmmtutsyGIDvCqLVUFzBi3492k+qfsfuO8CB78UGjgs3
         llYqJR/z2v6Ehvw9E5lxql1n9eEgmeurj2Hr3haBxhyiQvg1SXsqo4go930i5kk4m+yB
         eesq4pxn++nKiy5HGEA4+RKTrlfPiAhjHHp4i0tOmnCnm9sZlvsADjHID3/Wy8YF8G0S
         aCxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=fX0zB3DuXdZABnuwbp0Th9yYnae/271fCQB1YAUMOfs=;
        b=nbez0Zy1cvt0kMLz9aJbgGyCmppsQXRfdWl8QWOr/VzUT840sKwHg/f/cwFHkOHJ2u
         wiu1QmUSehIcNbBIPhQdDg1NDi47Xy1SKR9GnBQj0cVWXGXdF6V0HXQN8Xe5vULsu8YQ
         UmGh5WSYUK2lgbVQKf+CprKo7l3BjiEB4nOi7+LjIeQ+vccIkMCybqkBLyVwUreXb5OE
         kHO3CZf4p6pB0DyLK/tYh+3kCjUyPDbmxClhL7JFFt+HXrpS2FYUXVyMGJvbi90e1yhH
         5ld8tL15Ewpbj0mjnUUGvkaSFpFNighN9locnP2jqz3pBxHFLf3QQvDY0CjyOEO/Dzfd
         pMIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 136si29264282qkg.70.2017.08.02.09.48.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 09:48:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48693 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcwon-0006dN-Ok
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 12:48:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwl8-0003Y1-5R
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 12:44:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwl6-0004jF-Ur
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 12:44:34 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37764)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dcwl6-0003zA-Lo; Wed, 02 Aug 2017 12:44:32 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dcwkg-0003z0-U7; Wed, 02 Aug 2017 17:44:06 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  2 Aug 2017 17:43:55 +0100
Message-Id: <1501692241-23310-10-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 09/15] target/arm: Don't store M profile PRIMASK
 and FAULTMASK in daif
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
X-TUID: tR5yyCxWIxVu

We currently store the M profile CPU register state PRIMASK and
FAULTMASK in the daif field of the CPU state in its I and F
bits. This is a legacy from the original implementation, which
tried to share the cpu_exec_interrupt code between A profile
and M profile. We've since separated out the two cases because
they are significantly different, so now there is no common
code between M and A profile which looks at env->daif: all the
uses are either in A-only or M-only code paths. Sharing the state
fields now is just confusing, and will make things awkward
when we implement v8M, where the PRIMASK and FAULTMASK
registers are banked between security states.

Switch M profile over to using v7m.faultmask and v7m.primask
fields for these registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c |  4 ++--
 target/arm/cpu.c      |  5 -----
 target/arm/cpu.h      |  4 +++-
 target/arm/helper.c   | 18 +++++-------------
 target/arm/machine.c  | 33 +++++++++++++++++++++++++++++++++
 5 files changed, 43 insertions(+), 21 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 2e8166a..343bc16 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -167,9 +167,9 @@ static inline int nvic_exec_prio(NVICState *s)
     CPUARMState *env = &s->cpu->env;
     int running;
 
-    if (env->daif & PSTATE_F) { /* FAULTMASK */
+    if (env->v7m.faultmask) {
         running = -1;
-    } else if (env->daif & PSTATE_I) { /* PRIMASK */
+    } else if (env->v7m.primask) {
         running = 0;
     } else if (env->v7m.basepri > 0) {
         running = env->v7m.basepri & nvic_gprio_mask(s);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 05c038b..b241a63 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -185,11 +185,6 @@ static void arm_cpu_reset(CPUState *s)
         uint32_t initial_pc; /* Loaded from 0x4 */
         uint8_t *rom;
 
-        /* For M profile we store FAULTMASK and PRIMASK in the
-         * PSTATE F and I bits; these are both clear at reset.
-         */
-        env->daif &= ~(PSTATE_I | PSTATE_F);
-
         /* The reset value of this bit is IMPDEF, but ARM recommends
          * that it resets to 1, so QEMU always does that rather than making
          * it dependent on CPU model.
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1f06de0..da90b7a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -418,6 +418,8 @@ typedef struct CPUARMState {
         uint32_t bfar; /* BusFault Address */
         unsigned mpu_ctrl; /* MPU_CTRL */
         int exception;
+        uint32_t primask;
+        uint32_t faultmask;
     } v7m;
 
     /* Information associated with an exception about to be taken:
@@ -2179,7 +2181,7 @@ static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
          * we're in a HardFault or NMI handler.
          */
         if ((env->v7m.exception > 0 && env->v7m.exception <= 3)
-            || env->daif & PSTATE_F) {
+            || env->v7m.faultmask) {
             return arm_to_core_mmu_idx(ARMMMUIdx_MNegPri);
         }
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index f087d42..b64ddb1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6172,7 +6172,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
 
     if (env->v7m.exception != ARMV7M_EXCP_NMI) {
         /* Auto-clear FAULTMASK on return from other than NMI */
-        env->daif &= ~PSTATE_F;
+        env->v7m.faultmask = 0;
     }
 
     switch (armv7m_nvic_complete_irq(env->nvic, env->v7m.exception)) {
@@ -8718,12 +8718,12 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
         return (env->v7m.control & R_V7M_CONTROL_SPSEL_MASK) ?
             env->regs[13] : env->v7m.other_sp;
     case 16: /* PRIMASK */
-        return (env->daif & PSTATE_I) != 0;
+        return env->v7m.primask;
     case 17: /* BASEPRI */
     case 18: /* BASEPRI_MAX */
         return env->v7m.basepri;
     case 19: /* FAULTMASK */
-        return (env->daif & PSTATE_F) != 0;
+        return env->v7m.faultmask;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "Attempt to read unknown special"
                                        " register %d\n", reg);
@@ -8778,11 +8778,7 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
         }
         break;
     case 16: /* PRIMASK */
-        if (val & 1) {
-            env->daif |= PSTATE_I;
-        } else {
-            env->daif &= ~PSTATE_I;
-        }
+        env->v7m.primask = val & 1;
         break;
     case 17: /* BASEPRI */
         env->v7m.basepri = val & 0xff;
@@ -8793,11 +8789,7 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
             env->v7m.basepri = val;
         break;
     case 19: /* FAULTMASK */
-        if (val & 1) {
-            env->daif |= PSTATE_F;
-        } else {
-            env->daif &= ~PSTATE_F;
-        }
+        env->v7m.faultmask = val & 1;
         break;
     case 20: /* CONTROL */
         /* Writing to the SPSEL bit only has an effect if we are in
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 1f66da4..2fb4b76 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -97,6 +97,17 @@ static bool m_needed(void *opaque)
     return arm_feature(env, ARM_FEATURE_M);
 }
 
+static const VMStateDescription vmstate_m_faultmask_primask = {
+    .name = "cpu/m/faultmask-primask",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(env.v7m.faultmask, ARMCPU),
+        VMSTATE_UINT32(env.v7m.primask, ARMCPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_m = {
     .name = "cpu/m",
     .version_id = 4,
@@ -115,6 +126,10 @@ static const VMStateDescription vmstate_m = {
         VMSTATE_UINT32(env.v7m.mpu_ctrl, ARMCPU),
         VMSTATE_INT32(env.v7m.exception, ARMCPU),
         VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription*[]) {
+        &vmstate_m_faultmask_primask,
+        NULL
     }
 };
 
@@ -201,6 +216,24 @@ static int get_cpsr(QEMUFile *f, void *opaque, size_t size,
     CPUARMState *env = &cpu->env;
     uint32_t val = qemu_get_be32(f);
 
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        /* If the I or F bits are set then this is a migration from
+         * an old QEMU which still stored the M profile FAULTMASK
+         * and PRIMASK in env->daif. Set v7m.faultmask and v7m.primask
+         * accordingly, and then clear the bits so they don't confuse
+         * cpsr_write(). For a new QEMU, the bits here will always be
+         * clear, and the data is transferred using the
+         * vmstate_m_faultmask_primask subsection.
+         */
+        if (val & CPSR_F) {
+            env->v7m.faultmask = 1;
+        }
+        if (val & CPSR_I) {
+            env->v7m.primask = 1;
+        }
+        val &= ~(CPSR_F | CPSR_I);
+    }
+
     env->aarch64 = ((val & PSTATE_nRW) == 0);
 
     if (is_a64(env)) {
-- 
2.7.4

