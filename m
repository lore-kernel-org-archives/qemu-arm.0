Received: by 10.25.44.15 with SMTP id s15csp6354211lfs;
        Wed, 2 Aug 2017 09:44:52 -0700 (PDT)
X-Received: by 10.55.167.211 with SMTP id q202mr30566700qke.77.1501692292234;
        Wed, 02 Aug 2017 09:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501692292; cv=none;
        d=google.com; s=arc-20160816;
        b=mwiVquLuPtv3tGsm3u/RXFsAI5/14zK6XFCAloUX8G/Fy+EyanCazDlW29reXILvby
         4sNVGHgNu2rDOkJ7BzawsucTR0lHxu4B0cTXJzQcv8H8aRrf+X4gO84ikF3iFan9wPwa
         RBBnoNnWd4QCv5Hv1+SY6NSvarpZ0nMdRRCvn0yuxetgQ0/gZGYD9mZKZts2BAtcjmhj
         3RobAYOrmxCny/hItQNufjAgDrm3Y1mJNIzsVp+zr9tTfUfEc3B6MLTLH+Jhetfk7pNb
         xe7wdzngHRKLDiQ1GfijMtkN2cRjMHlrVna69bUVRuYwiwTBsYcBC6A9dbv/wq/2AXB5
         OVDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=LC5PFc3t5fueI0T8ImT9lfMo7MFqOCvneVZqFLN5bE0=;
        b=yO2m+W3s8Df7kFLNYeP2L22ikUNmHi51sEGXd1GB9x3ihrHHKLs10+TONxqFfFMzg2
         eKlM6l7b/yN1WFNhmW08/vdQsLw8ZISeP2JrgU2nSr7dT26DJuAMoouqnPpEbJ90bibP
         Xnjv9hzTbYoSkj5ApNRY7FVros92Oc0JtlYzbhws8krC7Ved0jfDfUDaUUyLFFQlmTOf
         PLJlnroXFG1bUOilmULrx/O0XHUigOGNyJcsNs9qQkkhDORXmgK+flk5RG6FXVfEwOIP
         4BCY0O24lY6nh/Q/7XgN3PW5GAOwaEC1UWl+NCmdExp9ZCEVdLNjXzi3BU3rYz1ijU/V
         IIww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 32si8131264qta.401.2017.08.02.09.44.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 09:44:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48673 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcwlN-0003mP-Gw
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 12:44:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwl9-0003YS-1N
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 12:44:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwl7-0004l4-Pe
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 12:44:34 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37764)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dcwl7-0003zA-HB; Wed, 02 Aug 2017 12:44:33 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dcwkg-0003yc-Do; Wed, 02 Aug 2017 17:44:06 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  2 Aug 2017 17:43:54 +0100
Message-Id: <1501692241-23310-9-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 08/15] target/arm: Define and use XPSR bit masks
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
X-TUID: g/ZesWhpGRIc

The M profile XPSR is almost the same format as the A profile CPSR,
but not quite. Define some XPSR_* macros and use them where we
definitely dealing with an XPSR rather than reusing the CPSR ones.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 38 ++++++++++++++++++++++++++++----------
 target/arm/helper.c | 15 ++++++++-------
 2 files changed, 36 insertions(+), 17 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b64474c..1f06de0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -883,6 +883,22 @@ void pmccntr_sync(CPUARMState *env);
 /* Mask of bits which may be set by exception return copying them from SPSR */
 #define CPSR_ERET_MASK (~CPSR_RESERVED)
 
+/* Bit definitions for M profile XPSR. Most are the same as CPSR. */
+#define XPSR_EXCP 0x1ffU
+#define XPSR_SPREALIGN (1U << 9) /* Only set in exception stack frames */
+#define XPSR_IT_2_7 CPSR_IT_2_7
+#define XPSR_GE CPSR_GE
+#define XPSR_SFPA (1U << 20) /* Only set in exception stack frames */
+#define XPSR_T (1U << 24) /* Not the same as CPSR_T ! */
+#define XPSR_IT_0_1 CPSR_IT_0_1
+#define XPSR_Q CPSR_Q
+#define XPSR_V CPSR_V
+#define XPSR_C CPSR_C
+#define XPSR_Z CPSR_Z
+#define XPSR_N CPSR_N
+#define XPSR_NZCV CPSR_NZCV
+#define XPSR_IT CPSR_IT
+
 #define TTBCR_N      (7U << 0) /* TTBCR.EAE==0 */
 #define TTBCR_T0SZ   (7U << 0) /* TTBCR.EAE==1 */
 #define TTBCR_PD0    (1U << 4)
@@ -987,26 +1003,28 @@ static inline uint32_t xpsr_read(CPUARMState *env)
 /* Set the xPSR.  Note that some bits of mask must be all-set or all-clear.  */
 static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 {
-    if (mask & CPSR_NZCV) {
-        env->ZF = (~val) & CPSR_Z;
+    if (mask & XPSR_NZCV) {
+        env->ZF = (~val) & XPSR_Z;
         env->NF = val;
         env->CF = (val >> 29) & 1;
         env->VF = (val << 3) & 0x80000000;
     }
-    if (mask & CPSR_Q)
-        env->QF = ((val & CPSR_Q) != 0);
-    if (mask & (1 << 24))
-        env->thumb = ((val & (1 << 24)) != 0);
-    if (mask & CPSR_IT_0_1) {
+    if (mask & XPSR_Q) {
+        env->QF = ((val & XPSR_Q) != 0);
+    }
+    if (mask & XPSR_T) {
+        env->thumb = ((val & XPSR_T) != 0);
+    }
+    if (mask & XPSR_IT_0_1) {
         env->condexec_bits &= ~3;
         env->condexec_bits |= (val >> 25) & 3;
     }
-    if (mask & CPSR_IT_2_7) {
+    if (mask & XPSR_IT_2_7) {
         env->condexec_bits &= 3;
         env->condexec_bits |= (val >> 8) & 0xfc;
     }
-    if (mask & 0x1ff) {
-        env->v7m.exception = val & 0x1ff;
+    if (mask & XPSR_EXCP) {
+        env->v7m.exception = val & XPSR_EXCP;
     }
 }
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cb88c66..f087d42 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6119,7 +6119,7 @@ static void v7m_push_stack(ARMCPU *cpu)
     /* Align stack pointer if the guest wants that */
     if ((env->regs[13] & 4) && (env->v7m.ccr & R_V7M_CCR_STKALIGN_MASK)) {
         env->regs[13] -= 4;
-        xpsr |= 0x200;
+        xpsr |= XPSR_SPREALIGN;
     }
     /* Switch to the handler mode.  */
     v7m_push(env, xpsr);
@@ -6244,10 +6244,11 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
         env->regs[15] &= ~1U;
     }
     xpsr = v7m_pop(env);
-    xpsr_write(env, xpsr, 0xfffffdff);
+    xpsr_write(env, xpsr, ~XPSR_SPREALIGN);
     /* Undo stack alignment.  */
-    if (xpsr & 0x200)
+    if (xpsr & XPSR_SPREALIGN) {
         env->regs[13] |= 4;
+    }
 
     /* The restored xPSR exception field will be zero if we're
      * resuming in Thread mode. If that doesn't match what the
@@ -8693,10 +8694,10 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
     case 0 ... 7: /* xPSR sub-fields */
         mask = 0;
         if ((reg & 1) && el) {
-            mask |= 0x000001ff; /* IPSR (unpriv. reads as zero) */
+            mask |= XPSR_EXCP; /* IPSR (unpriv. reads as zero) */
         }
         if (!(reg & 4)) {
-            mask |= 0xf8000000; /* APSR */
+            mask |= XPSR_NZCV | XPSR_Q; /* APSR */
         }
         /* EPSR reads as zero */
         return xpsr_read(env) & mask;
@@ -8754,10 +8755,10 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
             uint32_t apsrmask = 0;
 
             if (mask & 8) {
-                apsrmask |= 0xf8000000; /* APSR NZCVQ */
+                apsrmask |= XPSR_NZCV | XPSR_Q;
             }
             if ((mask & 4) && arm_feature(env, ARM_FEATURE_THUMB_DSP)) {
-                apsrmask |= 0x000f0000; /* APSR GE[3:0] */
+                apsrmask |= XPSR_GE;
             }
             xpsr_write(env, val, apsrmask);
         }
-- 
2.7.4

