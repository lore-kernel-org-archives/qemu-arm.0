Received: by 10.25.44.15 with SMTP id s15csp6354128lfs;
        Wed, 2 Aug 2017 09:44:47 -0700 (PDT)
X-Received: by 10.55.111.4 with SMTP id k4mr30006553qkc.287.1501692287248;
        Wed, 02 Aug 2017 09:44:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501692287; cv=none;
        d=google.com; s=arc-20160816;
        b=jAG0fTwmu7Zo7jkQYgXQBh21W+f75BFMFZobHWpIwyc4mu2uVle6e3Vh1a2wELnWp9
         iilatWBllsrzOBlAMprBiZ9z1hW5rrz/sHMbcrcL2XrLTVq3B1ymt/BQt8tf38yb3xsC
         tjgs/ubiHCaQ7C4ANNULldy7SH4Ja2mhIpAA4mBgxrha+iusCuNuDZz8aiDAhETnmuBa
         ODdVL30OMAHYs2WSVjE/2ce+IkqA4v6iiXafKOMciIMmy1JsyqYvoUM7qHcCxsa/211v
         LF1CTh7LFxZvfM6GQ9h7FhT0Q+uwGdZBcSrIPwKeuEZfY6VHdOq3c4lqN6kbL++Eo+wH
         jiNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=3ZTuLbp07JH9BmNpmUIy+gxCRsW5I5x6DtvxcxNVH8M=;
        b=SWod6SBbTBWxaD64iFHeRklKrPbXVzAyiKV8QxJ0V+2gaORfJtHtee6qFUKrjeu7I2
         QD6e9yAka+/zEylC822kGrQ6URUb75h5FQIg2coShKA95F9O5HUQALppoobEW9oZaao5
         5DgsfgcTVsyJayVO/9VHo+8LNn0w+3n57oPGYLBCI51eS4hxCUzDQDil7SpE9WwgUc8f
         Kpab9E9nag+EP9e1lr3H/W7VeyHQBz2TAXuvH4I/7zjJ7RP069oP/XmPKBPETJgcblra
         fpw3hlVWcOwzO8LNTIJS4jJbBwsPL7uKHCyR/u4kvAwnP1WTFPdK1nwj1AJN02KDyYj/
         2nPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w69si23511132qkb.361.2017.08.02.09.44.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 09:44:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48671 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcwlI-0003fB-KO
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 12:44:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwl4-0003Tu-J9
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 12:44:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwl3-0004d1-Iy
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 12:44:30 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37764)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dcwl3-0003zA-BQ; Wed, 02 Aug 2017 12:44:29 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dcwki-00040j-RZ; Wed, 02 Aug 2017 17:44:08 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  2 Aug 2017 17:43:59 +0100
Message-Id: <1501692241-23310-14-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 13/15] target/arm: Create and use new function
 arm_v7m_is_handler_mode()
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
X-TUID: uG2KxN4lGs9e

Add a utility function for testing whether the CPU is in Handler
mode; this is just a check whether v7m.exception is non-zero, but
we do it in several places and it makes the code a bit easier
to read to not have to mentally figure out what the test is testing.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 10 ++++++++--
 target/arm/helper.c |  8 ++++----
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index da90b7a..a3b4b78 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1630,13 +1630,19 @@ static inline int arm_highest_el(CPUARMState *env)
     return 1;
 }
 
+/* Return true if a v7M CPU is in Handler mode */
+static inline bool arm_v7m_is_handler_mode(CPUARMState *env)
+{
+    return env->v7m.exception != 0;
+}
+
 /* Return the current Exception Level (as per ARMv8; note that this differs
  * from the ARMv7 Privilege Level).
  */
 static inline int arm_current_el(CPUARMState *env)
 {
     if (arm_feature(env, ARM_FEATURE_M)) {
-        return !((env->v7m.exception == 0) && (env->v7m.control & 1));
+        return arm_v7m_is_handler_mode(env) || !(env->v7m.control & 1);
     }
 
     if (is_a64(env)) {
@@ -2636,7 +2642,7 @@ static inline void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     }
     *flags |= fp_exception_el(env) << ARM_TBFLAG_FPEXC_EL_SHIFT;
 
-    if (env->v7m.exception != 0) {
+    if (arm_v7m_is_handler_mode(env)) {
         *flags |= ARM_TBFLAG_HANDLER_MASK;
     }
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0ecc8f1..7920153 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6147,7 +6147,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
      * that jumps to magic addresses don't have magic behaviour unless
      * we're in Handler mode (compare pseudocode BXWritePC()).
      */
-    assert(env->v7m.exception != 0);
+    assert(arm_v7m_is_handler_mode(env));
 
     /* In the spec pseudocode ExceptionReturn() is called directly
      * from BXWritePC() and gets the full target PC value including
@@ -6254,7 +6254,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
      * resuming in Thread mode. If that doesn't match what the
      * exception return type specified then this is a UsageFault.
      */
-    if (return_to_handler == (env->v7m.exception == 0)) {
+    if (return_to_handler != arm_v7m_is_handler_mode(env)) {
         /* Take an INVPC UsageFault by pushing the stack again. */
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
         env->v7m.cfsr |= R_V7M_CFSR_INVPC_MASK;
@@ -6405,7 +6405,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
     if (env->v7m.control & R_V7M_CONTROL_SPSEL_MASK) {
         lr |= 4;
     }
-    if (env->v7m.exception == 0) {
+    if (!arm_v7m_is_handler_mode(env)) {
         lr |= 8;
     }
 
@@ -8798,7 +8798,7 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
          * switch_v7m_sp() deals with updating the SPSEL bit in
          * env->v7m.control, so we only need update the others.
          */
-        if (env->v7m.exception == 0) {
+        if (!arm_v7m_is_handler_mode(env)) {
             switch_v7m_sp(env, (val & R_V7M_CONTROL_SPSEL_MASK) != 0);
         }
         env->v7m.control &= ~R_V7M_CONTROL_NPRIV_MASK;
-- 
2.7.4

