Received: by 10.223.188.70 with SMTP id a6csp5085955wrh;
        Tue, 22 Aug 2017 08:29:04 -0700 (PDT)
X-Received: by 10.200.48.170 with SMTP id v39mr1483984qta.114.1503415744843;
        Tue, 22 Aug 2017 08:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503415744; cv=none;
        d=google.com; s=arc-20160816;
        b=I9EIgrCBcpTD3LN4Hqfwpaq2GPeBLFJRaSUnO95zGadCYJkHmm2Fpuml/gkWWs8I0F
         7SA6zXhqWcqfkotGZ6UQb8vQzOX4LcUP0uevmGXAXv6k0a76xt5qCGMnYYAIrA9cU9yu
         EiS8UPrpQa+ngN5JXzkaxvn/53D3tFTm2G1LgpRTEYy58imW86QndlIlao/MwzzkhvDo
         iwSaMUC3pBVbdUHgIP7BowTbaDjMW/Vxww4zUZ5k1WPSwwTQDMZVccA2Wz6/7EZxmcjc
         MtoeMquaz26JbESQnhGO9RnJmg0O/jcjYFG56dQo+Z7GUlB95lMSNjGQc6UaY6G6yJlI
         BnSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=i35px/cVwmZI7aAmHE1o6idhO6qXvbvULgKf75+1LEk=;
        b=bzbXB80b/9wJ2eXVbdO4mlVItcD/I3HMP4MxwwQqsNGa4OPT0Wmkph/o2fN0AGn51U
         rZWXTSjGtj96ZM+CLOsKnDsYtzCj7S9kqN2Uqnq+qrnZst0Vlzqgyep8AoSGlXcuoThR
         FcrBbMw3tE7t9AhpxEvM2Jl5uVDqkI19ZfVGcRALI5SERS7hzLFJseSJLIpkVyQj0SWf
         eN1xZHf1gV+YRQDtBr1FhUuq+gRr3gRBJM1WuYbq4ZRa7p7gFPV2XDh7KzvFhJP/QxDq
         A9IM4S5ikCyQvLsZRmCirFcbw414P1hPewgvPWsuScjvfXamQY4+nh7MB4/fWQFb3kcX
         FJmg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b8si13922616qtk.555.2017.08.22.08.29.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:29:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkB70-0006ro-9K
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:29:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnl-0006Le-42
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnj-00039g-RV
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:09 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36936)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dkAnj-00031e-KT; Tue, 22 Aug 2017 11:09:07 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dkAne-0004fz-9a; Tue, 22 Aug 2017 16:09:02 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 22 Aug 2017 16:08:46 +0100
Message-Id: <1503414539-28762-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 07/20] target/arm: Make PRIMASK register banked
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
X-TUID: M3XNPu4bCi5G

Make the PRIMASK register banked if v8M security extensions are enabled.

Note that we do not yet implement the functionality of the new
AIRCR.PRIS bit (which allows the effect of the NS copy of PRIMASK to
be restricted).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h      | 2 +-
 hw/intc/armv7m_nvic.c | 2 +-
 target/arm/helper.c   | 4 ++--
 target/arm/machine.c  | 9 +++++++--
 4 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 0c28dfd..fee337b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -431,7 +431,7 @@ typedef struct CPUARMState {
         uint32_t bfar; /* BusFault Address */
         unsigned mpu_ctrl; /* MPU_CTRL */
         int exception;
-        uint32_t primask;
+        uint32_t primask[2];
         uint32_t faultmask;
         uint32_t secure; /* Is CPU in Secure state? (not guest visible) */
     } v7m;
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 2a41e5d..a654792 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -169,7 +169,7 @@ static inline int nvic_exec_prio(NVICState *s)
 
     if (env->v7m.faultmask) {
         running = -1;
-    } else if (env->v7m.primask) {
+    } else if (env->v7m.primask[env->v7m.secure]) {
         running = 0;
     } else if (env->v7m.basepri[env->v7m.secure] > 0) {
         running = env->v7m.basepri[env->v7m.secure] & nvic_gprio_mask(s);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1087f19..c0a6dbd 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8835,7 +8835,7 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
         return (env->v7m.control & R_V7M_CONTROL_SPSEL_MASK) ?
             env->regs[13] : env->v7m.other_sp;
     case 16: /* PRIMASK */
-        return env->v7m.primask;
+        return env->v7m.primask[env->v7m.secure];
     case 17: /* BASEPRI */
     case 18: /* BASEPRI_MAX */
         return env->v7m.basepri[env->v7m.secure];
@@ -8895,7 +8895,7 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
         }
         break;
     case 16: /* PRIMASK */
-        env->v7m.primask = val & 1;
+        env->v7m.primask[env->v7m.secure] = val & 1;
         break;
     case 17: /* BASEPRI */
         env->v7m.basepri[env->v7m.secure] = val & 0xff;
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 8476efd..6f0f6c9 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -103,7 +103,7 @@ static const VMStateDescription vmstate_m_faultmask_primask = {
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(env.v7m.faultmask, ARMCPU),
-        VMSTATE_UINT32(env.v7m.primask, ARMCPU),
+        VMSTATE_UINT32(env.v7m.primask[M_REG_NS], ARMCPU),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -251,6 +251,7 @@ static const VMStateDescription vmstate_m_security = {
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(env.v7m.secure, ARMCPU),
         VMSTATE_UINT32(env.v7m.basepri[M_REG_S], ARMCPU),
+        VMSTATE_UINT32(env.v7m.primask[M_REG_S], ARMCPU),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -271,9 +272,13 @@ static int get_cpsr(QEMUFile *f, void *opaque, size_t size,
              * differences are that the T bit is not in the same place, the
              * primask/faultmask info may be in the CPSR I and F bits, and
              * we do not want the mode bits.
+             * We know that this cleanup happened before v8M, so there
+             * is no complication with banked primask/faultmask.
              */
             uint32_t newval = val;
 
+            assert(!arm_feature(env, ARM_FEATURE_M_SECURITY));
+
             newval &= (CPSR_NZCV | CPSR_Q | CPSR_IT | CPSR_GE);
             if (val & CPSR_T) {
                 newval |= XPSR_T;
@@ -287,7 +292,7 @@ static int get_cpsr(QEMUFile *f, void *opaque, size_t size,
                 env->v7m.faultmask = 1;
             }
             if (val & CPSR_I) {
-                env->v7m.primask = 1;
+                env->v7m.primask[M_REG_NS] = 1;
             }
             val = newval;
         }
-- 
2.7.4

