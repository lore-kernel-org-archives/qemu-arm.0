Received: by 10.223.188.70 with SMTP id a6csp5102428wrh;
        Tue, 22 Aug 2017 08:43:28 -0700 (PDT)
X-Received: by 10.55.133.195 with SMTP id h186mr1564739qkd.21.1503416608412;
        Tue, 22 Aug 2017 08:43:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503416608; cv=none;
        d=google.com; s=arc-20160816;
        b=a5ppbqQpG66dgGe36FsN55nkxYQQcpYl7KQ/i63Pt7B7C28Pn+YdaYv+Kh3IgyIR/a
         WqK8xW6awA+ecm/OUjs/wQCLRalpmMXakBumTAZ+iTzliDU9UkTyImXNYqoeHjcPsS8Q
         dmWjsLUR7WXgDrnuD+7xQEhUQh6CQ6qhwE+THfkBU6AWEs+80oxTIyMuO21gOByhKQUx
         61vJ1Lh9zVgkFZ1uByspgBZpfR+p3dHTWWknu1a6uak1/faaCgFGK6TjD+Oro3rAdMeR
         p2bM8wMFKtCrh5JzNS7ejVC2/t0lTCjL4PR9YoxELQlH+zYC3IXL52UWrQ0azv6nw77w
         BfZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=JimyCQvoa7E6JwMzt2RYVcOPVmWADuz+2q+QxWl3IKA=;
        b=x+Djizp969jL+ON8No6hXeyur1wT6Oi4oBjdKHlFRB4VLfmGF7O19M2pqnJhj41253
         2s1Kc7m/0rxvqpBMsMcKRfz0cvxF6Bvmw4bQxUmzNt39brbSIcyqwgt92MElIK/VjuXO
         0i/KxC911I5LNnJcj7URMc37QmrXtoQvRN2AVG+KjeMJX7jJGzddl7szk//pCDnTbOo6
         92FouTfbBNUoCFT1/R/WYQtrZK38qKtQSOySAwPGv3wnyTK88lR3qggr5Pzg7m4/jeRp
         ZL0Qs8DU4wf/uGV3IruwRLrUCygK4UBJ7B0P80yBBhS/0iia7ccLEdOE2W8v3nxRl4cQ
         2yYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s2si13825410qkd.346.2017.08.22.08.43.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:43:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55688 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkBKw-0004HO-1f
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:43:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnj-0006Kj-7A
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnh-000382-TP
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:07 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36936)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dkAnh-00031e-Lj; Tue, 22 Aug 2017 11:09:05 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dkAnf-0004gf-2e; Tue, 22 Aug 2017 16:09:03 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 22 Aug 2017 16:08:47 +0100
Message-Id: <1503414539-28762-9-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 08/20] target/arm: Make FAULTMASK register banked
 for v8M
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
X-TUID: vmib8WJHWq+I

Make the FAULTMASK register banked if v8M security extensions are enabled.

Note that we do not yet implement the functionality of the new
AIRCR.PRIS bit (which allows the effect of the NS copy of FAULTMASK to
be restricted).

This patch includes the code to determine for v8M which copy
of FAULTMASK should be updated on exception exit; further
changes will be required to the exception exit code in general
to support v8M, so this is just a small piece of that.

The v8M ARM ARM introduces a notation where individual paragraphs
are labelled with R (for rule) or I (for information) followed
by a random group of subscript letters. In comments where we want
to refer to a particular part of the manual we use this convention,
which should be more stable across document revisions than using
section or page numbers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h      | 14 ++++++++++++--
 hw/intc/armv7m_nvic.c |  9 ++++++++-
 target/arm/helper.c   | 20 ++++++++++++++++----
 target/arm/machine.c  |  5 +++--
 4 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index fee337b..edd4c9e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -432,7 +432,7 @@ typedef struct CPUARMState {
         unsigned mpu_ctrl; /* MPU_CTRL */
         int exception;
         uint32_t primask[2];
-        uint32_t faultmask;
+        uint32_t faultmask[2];
         uint32_t secure; /* Is CPU in Secure state? (not guest visible) */
     } v7m;
 
@@ -1443,6 +1443,16 @@ void armv7m_nvic_acknowledge_irq(void *opaque);
  * (Ignoring -1, this is the same as the RETTOBASE value before completion.)
  */
 int armv7m_nvic_complete_irq(void *opaque, int irq);
+/**
+ * armv7m_nvic_raw_execution_priority: return the raw execution priority
+ * @opaque: the NVIC
+ *
+ * Returns: the raw execution priority as defined by the v8M architecture.
+ * This is the execution priority minus the effects of AIRCR.PRIS,
+ * and minus any PRIMASK/FAULTMASK/BASEPRI priority boosting.
+ * (v8M ARM ARM I_PKLD.)
+ */
+int armv7m_nvic_raw_execution_priority(void *opaque);
 
 /* Interface for defining coprocessor registers.
  * Registers are defined in tables of arm_cp_reginfo structs
@@ -2228,7 +2238,7 @@ static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
          * we're in a HardFault or NMI handler.
          */
         if ((env->v7m.exception > 0 && env->v7m.exception <= 3)
-            || env->v7m.faultmask) {
+            || env->v7m.faultmask[env->v7m.secure]) {
             mmu_idx = ARMMMUIdx_MNegPri;
         }
 
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index a654792..babdc3b 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -167,7 +167,7 @@ static inline int nvic_exec_prio(NVICState *s)
     CPUARMState *env = &s->cpu->env;
     int running;
 
-    if (env->v7m.faultmask) {
+    if (env->v7m.faultmask[env->v7m.secure]) {
         running = -1;
     } else if (env->v7m.primask[env->v7m.secure]) {
         running = 0;
@@ -187,6 +187,13 @@ bool armv7m_nvic_can_take_pending_exception(void *opaque)
     return nvic_exec_prio(s) > nvic_pending_prio(s);
 }
 
+int armv7m_nvic_raw_execution_priority(void *opaque)
+{
+    NVICState *s = opaque;
+
+    return s->exception_prio;
+}
+
 /* caller must call nvic_irq_update() after this */
 static void set_prio(NVICState *s, unsigned irq, uint8_t prio)
 {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c0a6dbd..b8f3b23 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6171,8 +6171,20 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
     }
 
     if (env->v7m.exception != ARMV7M_EXCP_NMI) {
-        /* Auto-clear FAULTMASK on return from other than NMI */
-        env->v7m.faultmask = 0;
+        /* Auto-clear FAULTMASK on return from other than NMI.
+         * If the security extension is implemented then this only
+         * happens if the raw execution priority is >= 0; the
+         * value of the ES bit in the exception return value indicates
+         * which security state's faultmask to clear. (v8M ARM ARM R_KBNF.)
+         */
+        if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+            int es = type & 1;
+            if (armv7m_nvic_raw_execution_priority(env->nvic) >= 0) {
+                env->v7m.faultmask[es] = 0;
+            }
+        } else {
+            env->v7m.faultmask[M_REG_NS] = 0;
+        }
     }
 
     switch (armv7m_nvic_complete_irq(env->nvic, env->v7m.exception)) {
@@ -8840,7 +8852,7 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
     case 18: /* BASEPRI_MAX */
         return env->v7m.basepri[env->v7m.secure];
     case 19: /* FAULTMASK */
-        return env->v7m.faultmask;
+        return env->v7m.faultmask[env->v7m.secure];
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "Attempt to read unknown special"
                                        " register %d\n", reg);
@@ -8908,7 +8920,7 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
         }
         break;
     case 19: /* FAULTMASK */
-        env->v7m.faultmask = val & 1;
+        env->v7m.faultmask[env->v7m.secure] = val & 1;
         break;
     case 20: /* CONTROL */
         /* Writing to the SPSEL bit only has an effect if we are in
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 6f0f6c9..bd7aba1 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -102,7 +102,7 @@ static const VMStateDescription vmstate_m_faultmask_primask = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT32(env.v7m.faultmask, ARMCPU),
+        VMSTATE_UINT32(env.v7m.faultmask[M_REG_NS], ARMCPU),
         VMSTATE_UINT32(env.v7m.primask[M_REG_NS], ARMCPU),
         VMSTATE_END_OF_LIST()
     }
@@ -252,6 +252,7 @@ static const VMStateDescription vmstate_m_security = {
         VMSTATE_UINT32(env.v7m.secure, ARMCPU),
         VMSTATE_UINT32(env.v7m.basepri[M_REG_S], ARMCPU),
         VMSTATE_UINT32(env.v7m.primask[M_REG_S], ARMCPU),
+        VMSTATE_UINT32(env.v7m.faultmask[M_REG_S], ARMCPU),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -289,7 +290,7 @@ static int get_cpsr(QEMUFile *f, void *opaque, size_t size,
              * transferred using the vmstate_m_faultmask_primask subsection.
              */
             if (val & CPSR_F) {
-                env->v7m.faultmask = 1;
+                env->v7m.faultmask[M_REG_NS] = 1;
             }
             if (val & CPSR_I) {
                 env->v7m.primask[M_REG_NS] = 1;
-- 
2.7.4

