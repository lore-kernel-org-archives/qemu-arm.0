Received: by 10.223.188.70 with SMTP id a6csp5093176wrh;
        Tue, 22 Aug 2017 08:35:23 -0700 (PDT)
X-Received: by 10.237.32.68 with SMTP id 62mr1646512qta.164.1503416123895;
        Tue, 22 Aug 2017 08:35:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503416123; cv=none;
        d=google.com; s=arc-20160816;
        b=QfgbhhKEnrcPXqPYqG+J7YR3/pIih+8FkL3LoNcdIFGjGaposKzbmCeuUw21+jTmZX
         d5Hn6j8ylCBqcFv5CaexpgwFYHKtagRNxNxVzZVa+kURmuoKSjUFYoyl/yYgkGC1OamN
         nwwlKz/f3rKT+XcbE0X6eIPVwWtl4GQN+5h4ByJfY2VwHyulpnPWG7dbY7ec1fkpqYb8
         OZaguLzqqsanypIAaOWMFUA4pZ3awNOxF/CptAaWKe3UNyZPcG/Asxh7i9hWU6lCSahy
         bwvbd/VEQlxu9/Z9tlmL/dVsst24pGEnGqnKgsu3KvYiiXq8epE40Bf92hSzt8cBV6up
         ozYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=N/nwW7vSeZL2WgKVODgBVHZCQgOvw6DxnbDWYkbuprA=;
        b=B2iodlCKUMsHY720ZFEUwQwS7OYvGbN2lXcBebmaHD9ecB7kCd1deDOlHC/aTUlgb0
         r6lw04QyTOnYaJvS9MAN4y0IlO6QpugE1aMcLjFZtSpD1izjTnn3AR2OJq9r5xJInwzq
         eGBbSlCDthjtDL9q5mPcudggy7XkZvR/h5DFDhfpBguMlX7EVyvkNYcyztNLJSGD86ml
         HbrJ688SWGcm777zCKBY8fM1ntgysxSEVVtlAhaw9H+KrJEjPNL8AubN2Ppaqu2tiLq7
         JxfKAj+yScLiKh79zNw2pm/AhbN9oNfZmleqWKeYxpHX3ectrmy4mrDlXowB8pg0rLUy
         1j8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q32si13998490qtk.270.2017.08.22.08.35.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:35:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54865 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkBD7-0003or-FR
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:35:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnq-0006Vd-Ch
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAno-0003E1-0q
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:14 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36962)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dkAnn-00037y-Mj; Tue, 22 Aug 2017 11:09:11 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dkAnl-0004kK-Cw; Tue, 22 Aug 2017 16:09:09 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 22 Aug 2017 16:08:55 +0100
Message-Id: <1503414539-28762-17-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 16/20] target/arm: Make CCR register banked for
 v8M
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
X-TUID: e1+41SEVIUvI

Make the CCR register banked if v8M security extensions are enabled.

This is slightly more complicated than the other "add banking"
patches because there is one bit in the register which is not
banked. We keep the live data in the NS copy of the register,
and adjust it on register reads and writes. (Since we don't
currently implement the behaviour that the bit controls, there
is nowhere else that needs to care.)

This patch includes the enforcement of the bits which are newly
RES1 in ARMv8M.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h      |  2 +-
 hw/intc/armv7m_nvic.c | 36 ++++++++++++++++++++++++++++++------
 target/arm/cpu.c      | 12 +++++++++---
 target/arm/helper.c   |  5 +++--
 target/arm/machine.c  |  3 ++-
 5 files changed, 45 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 78cd3f0..25ebf9e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -423,7 +423,7 @@ typedef struct CPUARMState {
         uint32_t vecbase[2];
         uint32_t basepri[2];
         uint32_t control[2];
-        uint32_t ccr; /* Configuration and Control */
+        uint32_t ccr[2]; /* Configuration and Control */
         uint32_t cfsr; /* Configurable Fault Status */
         uint32_t hfsr; /* HardFault Status */
         uint32_t dfsr; /* Debug Fault Status Register */
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index a4c298f..f071649 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -448,7 +448,12 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
         /* TODO: Implement SLEEPONEXIT.  */
         return 0;
     case 0xd14: /* Configuration Control.  */
-        return cpu->env.v7m.ccr;
+        /* The BFHFNMIGN bit is the only non-banked bit; we
+         * keep it in the non-secure copy of the register.
+         */
+        val = cpu->env.v7m.ccr[attrs.secure];
+        val |= cpu->env.v7m.ccr[M_REG_NS] & R_V7M_CCR_BFHFNMIGN_MASK;
+        return val;
     case 0xd24: /* System Handler Status.  */
         val = 0;
         if (s->vectors[ARMV7M_EXCP_MEM].active) {
@@ -673,7 +678,23 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
                   R_V7M_CCR_USERSETMPEND_MASK |
                   R_V7M_CCR_NONBASETHRDENA_MASK);
 
-        cpu->env.v7m.ccr = value;
+        if (arm_feature(&cpu->env, ARM_FEATURE_V8)) {
+            /* v8M makes NONBASETHRDENA and STKALIGN be RES1 */
+            value |= R_V7M_CCR_NONBASETHRDENA_MASK
+                | R_V7M_CCR_STKALIGN_MASK;
+        }
+        if (attrs.secure) {
+            /* the BFHFNMIGN bit is not banked; keep that in the NS copy */
+            int new_bfhnmign = !!(value & R_V7M_CCR_BFHFNMIGN_MASK);
+
+            cpu->env.v7m.ccr[M_REG_NS] = deposit32(cpu->env.v7m.ccr[M_REG_NS],
+                                                    R_V7M_CCR_BFHFNMIGN_SHIFT,
+                                                    R_V7M_CCR_BFHFNMIGN_LENGTH,
+                                                    new_bfhnmign);
+            value &= ~R_V7M_CCR_BFHFNMIGN_MASK;
+        }
+
+        cpu->env.v7m.ccr[attrs.secure] = value;
         break;
     case 0xd24: /* System Handler Control.  */
         s->vectors[ARMV7M_EXCP_MEM].active = (value & (1 << 0)) != 0;
@@ -860,12 +881,15 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
     }
 }
 
-static bool nvic_user_access_ok(NVICState *s, hwaddr offset)
+static bool nvic_user_access_ok(NVICState *s, hwaddr offset, MemTxAttrs attrs)
 {
     /* Return true if unprivileged access to this register is permitted. */
     switch (offset) {
     case 0xf00: /* STIR: accessible only if CCR.USERSETMPEND permits */
-        return s->cpu->env.v7m.ccr & R_V7M_CCR_USERSETMPEND_MASK;
+        /* For access via STIR_NS it is the NS CCR.USERSETMPEND that
+         * controls access even though the CPU is in Secure state (I_QDKX).
+         */
+        return s->cpu->env.v7m.ccr[attrs.secure] & R_V7M_CCR_USERSETMPEND_MASK;
     default:
         /* All other user accesses cause a BusFault unconditionally */
         return false;
@@ -881,7 +905,7 @@ static MemTxResult nvic_sysreg_read(void *opaque, hwaddr addr,
     unsigned i, startvec, end;
     uint32_t val;
 
-    if (attrs.user && !nvic_user_access_ok(s, addr)) {
+    if (attrs.user && !nvic_user_access_ok(s, addr, attrs)) {
         /* Generate BusFault for unprivileged accesses */
         return MEMTX_ERROR;
     }
@@ -971,7 +995,7 @@ static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
 
     trace_nvic_sysreg_write(addr, value, size);
 
-    if (attrs.user && !nvic_user_access_ok(s, addr)) {
+    if (attrs.user && !nvic_user_access_ok(s, addr, attrs)) {
         /* Generate BusFault for unprivileged accesses */
         return MEMTX_ERROR;
     }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 11038b8..3c2ff11 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -189,11 +189,17 @@ static void arm_cpu_reset(CPUState *s)
             env->v7m.secure = true;
         }
 
-        /* The reset value of this bit is IMPDEF, but ARM recommends
+        /* In v7M the reset value of this bit is IMPDEF, but ARM recommends
          * that it resets to 1, so QEMU always does that rather than making
-         * it dependent on CPU model.
+         * it dependent on CPU model. In v8M it is RES1.
          */
-        env->v7m.ccr = R_V7M_CCR_STKALIGN_MASK;
+        env->v7m.ccr[M_REG_NS] = R_V7M_CCR_STKALIGN_MASK;
+        env->v7m.ccr[M_REG_S] = R_V7M_CCR_STKALIGN_MASK;
+        if (arm_feature(env, ARM_FEATURE_V8)) {
+            /* in v8M the NONBASETHRDENA bit [0] is RES1 */
+            env->v7m.ccr[M_REG_NS] |= R_V7M_CCR_NONBASETHRDENA_MASK;
+            env->v7m.ccr[M_REG_S] |= R_V7M_CCR_NONBASETHRDENA_MASK;
+        }
 
         /* Unlike A/R profile, M profile defines the reset LR value */
         env->regs[14] = 0xffffffff;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4a2148c..28b3d6c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6118,7 +6118,8 @@ static void v7m_push_stack(ARMCPU *cpu)
     uint32_t xpsr = xpsr_read(env);
 
     /* Align stack pointer if the guest wants that */
-    if ((env->regs[13] & 4) && (env->v7m.ccr & R_V7M_CCR_STKALIGN_MASK)) {
+    if ((env->regs[13] & 4) &&
+        (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_STKALIGN_MASK)) {
         env->regs[13] -= 4;
         xpsr |= XPSR_SPREALIGN;
     }
@@ -6216,7 +6217,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
         /* fall through */
     case 9: /* Return to Thread using Main stack */
         if (!rettobase &&
-            !(env->v7m.ccr & R_V7M_CCR_NONBASETHRDENA_MASK)) {
+            !(env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_NONBASETHRDENA_MASK)) {
             ufault = true;
         }
         break;
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 5cc95e8..4457ec6 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -117,7 +117,7 @@ static const VMStateDescription vmstate_m = {
         VMSTATE_UINT32(env.v7m.vecbase[M_REG_NS], ARMCPU),
         VMSTATE_UINT32(env.v7m.basepri[M_REG_NS], ARMCPU),
         VMSTATE_UINT32(env.v7m.control[M_REG_NS], ARMCPU),
-        VMSTATE_UINT32(env.v7m.ccr, ARMCPU),
+        VMSTATE_UINT32(env.v7m.ccr[M_REG_NS], ARMCPU),
         VMSTATE_UINT32(env.v7m.cfsr, ARMCPU),
         VMSTATE_UINT32(env.v7m.hfsr, ARMCPU),
         VMSTATE_UINT32(env.v7m.dfsr, ARMCPU),
@@ -271,6 +271,7 @@ static const VMStateDescription vmstate_m_security = {
         VMSTATE_UINT32(env.pmsav7.rnr[M_REG_S], ARMCPU),
         VMSTATE_VALIDATE("secure MPU_RNR is valid", s_rnr_vmstate_validate),
         VMSTATE_UINT32(env.v7m.mpu_ctrl[M_REG_S], ARMCPU),
+        VMSTATE_UINT32(env.v7m.ccr[M_REG_S], ARMCPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.7.4

