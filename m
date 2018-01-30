Received: by 10.28.71.27 with SMTP id u27csp1473783wma;
        Tue, 30 Jan 2018 07:02:56 -0800 (PST)
X-Google-Smtp-Source: AH8x226TzwEhLrsi7lSB5DgI5kJlw2QTj/pCjb+nZySvOFKpBtoDQq3Js4/O+nGgeRWIoHkxkQK8
X-Received: by 10.37.214.214 with SMTP id n205mr19475764ybg.104.1517324576455;
        Tue, 30 Jan 2018 07:02:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517324576; cv=none;
        d=google.com; s=arc-20160816;
        b=IljNNC/2nb0Grb5mr1D97u0/pKj568uTvZTT2SvFm2Szx+zobyPRUi2Nzr/lY3f323
         vhXs48eTgS7ZKUjVAeihjTdfDv/lhqEVVY0vGHukLq02UwIp+S8EF1BVErQ+DX4oiVQJ
         aXnIELNscMpwpXjmi3sGG1pfe0jSr+X7wEfnYI3OR0vmze4aYXSBSClu9e2kTmpcDOKv
         zQMwU2u8E3deDZr2MvhZ0049orD/qpV0BsavuLOxLJm831eA+XJK8FAIDzmF2Rg8MOzx
         +Omc8BdCAzoCB6r0e1JpEZgTE9L1DyRc/byWV6m0x/K7GZTB30k5GaWKqwxFaAuH01fU
         12kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=nhAwgSycSacPpMrydZNE0wDP1lWcQMjb5+//XvQNHs0=;
        b=HZdLkwOBlUYr9GzpXPNbLPT3aMNYIwxpdJ8w1K6NcJJkbUKPUBB7zE+bueBqEcK7hR
         rRrnvNB5+eAQZMybvD6yywyBSQ4M1gBW1dEEfQ+DB6eCntNWg/QHw5b+/FTQV6C+1ISN
         ZB4RERPYrOpweYniOPpMOEignMGNglUyJG3KTMPXdlPkcvTck5Bg0noCnBCJuW7BE3q6
         dYDsjPS+1Bkod0Yzdq5SzUncBrAfgbxWwv6jmyF2jidpecWY4G/wktyW7ev8BJQgyVF2
         eLNqm044acPJ4qv2/C0mSm8qOCLUglmm+pMSB+B97LLizQdATX0cxUmvg3Cy9SG/eHNP
         uaMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r62si2776011ywf.681.2018.01.30.07.02.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Jan 2018 07:02:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42061 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1egXR1-0000Gm-R0
	for alex.bennee@linaro.org; Tue, 30 Jan 2018 10:02:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1egXQe-0000AF-1S
	for qemu-arm@nongnu.org; Tue, 30 Jan 2018 10:02:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1egXQZ-0005UO-F8
	for qemu-arm@nongnu.org; Tue, 30 Jan 2018 10:02:32 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46104)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1egXQZ-0005Tn-5O; Tue, 30 Jan 2018 10:02:27 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1egXQX-0005sp-VE; Tue, 30 Jan 2018 15:02:25 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 30 Jan 2018 15:02:18 +0000
Message-Id: <1517324542-6607-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
References: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 3/7] target/arm: Add ignore_stackfaults argument
 to v7m_exception_taken()
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
X-TUID: 96FjqVKxPglF

In the v8M architecture, if the process of taking an exception
results in a further exception this is called a derived exception
(for example, an MPU exception when writing the exception frame to
memory). If the derived exception happens while pushing the initial
stack frame, we must ignore any subsequent possible exception
pushing the callee-saves registers.

In preparation for making the stack writes check for exceptions,
add a return value from v7m_push_stack() and a new parameter to
v7m_exception_taken(), so that the former can tell the latter that
it needs to ignore failures to write to the stack. We also plumb
the argument through to v7m_push_callee_stack(), which is where
the code to ignore the failures will be.

(Note that the v8M ARM pseudocode structures this slightly differently:
derived exceptions cause the attempt to process the original
exception to be abandoned; then at the top level it calls
DerivedLateArrival to prioritize the derived exception and call
TakeException from there. We choose to let the NVIC do the prioritization
and continue forward with a call to TakeException which will then
take either the original or the derived exception. The effect is
the same, but this structure works better for QEMU because we don't
have a convenient top level place to do the abandon-and-retry logic.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6062f38..c713eea 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6419,7 +6419,8 @@ static uint32_t arm_v7m_load_vector(ARMCPU *cpu, int exc, bool targets_secure)
     return addr;
 }
 
-static void v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotailchain)
+static void v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotailchain,
+                                  bool ignore_faults)
 {
     /* For v8M, push the callee-saves register part of the stack frame.
      * Compare the v8M pseudocode PushCalleeStack().
@@ -6453,7 +6454,8 @@ static void v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotailchain)
     *frame_sp_p = frameptr;
 }
 
-static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain)
+static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain,
+                                bool ignore_stackfaults)
 {
     /* Do the "take the exception" parts of exception entry,
      * but not the pushing of state to the stack. This is
@@ -6490,7 +6492,8 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain)
                  */
                 if (lr & R_V7M_EXCRET_DCRS_MASK &&
                     !(dotailchain && (lr & R_V7M_EXCRET_ES_MASK))) {
-                    v7m_push_callee_stack(cpu, lr, dotailchain);
+                    v7m_push_callee_stack(cpu, lr, dotailchain,
+                                          ignore_stackfaults);
                 }
                 lr |= R_V7M_EXCRET_DCRS_MASK;
             }
@@ -6551,10 +6554,13 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain)
     env->thumb = addr & 1;
 }
 
-static void v7m_push_stack(ARMCPU *cpu)
+static bool v7m_push_stack(ARMCPU *cpu)
 {
     /* Do the "set up stack frame" part of exception entry,
      * similar to pseudocode PushStack().
+     * Return true if we generate a derived exception (and so
+     * should ignore further stack faults trying to process
+     * that derived exception.)
      */
     CPUARMState *env = &cpu->env;
     uint32_t xpsr = xpsr_read(env);
@@ -6574,6 +6580,8 @@ static void v7m_push_stack(ARMCPU *cpu)
     v7m_push(env, env->regs[2]);
     v7m_push(env, env->regs[1]);
     v7m_push(env, env->regs[0]);
+
+    return false;
 }
 
 static void do_v7m_exception_exit(ARMCPU *cpu)
@@ -6719,7 +6727,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
     if (sfault) {
         env->v7m.sfsr |= R_V7M_SFSR_INVER_MASK;
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
-        v7m_exception_taken(cpu, excret, true);
+        v7m_exception_taken(cpu, excret, true, false);
         qemu_log_mask(CPU_LOG_INT, "...taking SecureFault on existing "
                       "stackframe: failed EXC_RETURN.ES validity check\n");
         return;
@@ -6731,7 +6739,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
          */
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVPC_MASK;
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.secure);
-        v7m_exception_taken(cpu, excret, true);
+        v7m_exception_taken(cpu, excret, true, false);
         qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
                       "stackframe: failed exception return integrity check\n");
         return;
@@ -6779,7 +6787,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                 /* Take a SecureFault on the current stack */
                 env->v7m.sfsr |= R_V7M_SFSR_INVIS_MASK;
                 armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
-                v7m_exception_taken(cpu, excret, true);
+                v7m_exception_taken(cpu, excret, true, false);
                 qemu_log_mask(CPU_LOG_INT, "...taking SecureFault on existing "
                               "stackframe: failed exception return integrity "
                               "signature check\n");
@@ -6844,7 +6852,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                 armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
                                         env->v7m.secure);
                 env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVPC_MASK;
-                v7m_exception_taken(cpu, excret, true);
+                v7m_exception_taken(cpu, excret, true, false);
                 qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
                               "stackframe: failed exception return integrity "
                               "check\n");
@@ -6877,11 +6885,13 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
         /* Take an INVPC UsageFault by pushing the stack again;
          * we know we're v7M so this is never a Secure UsageFault.
          */
+        bool ignore_stackfaults;
+
         assert(!arm_feature(env, ARM_FEATURE_V8));
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, false);
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVPC_MASK;
-        v7m_push_stack(cpu);
-        v7m_exception_taken(cpu, excret, false);
+        ignore_stackfaults = v7m_push_stack(cpu);
+        v7m_exception_taken(cpu, excret, false, ignore_stackfaults);
         qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on new stackframe: "
                       "failed exception return integrity check\n");
         return;
@@ -7122,6 +7132,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     uint32_t lr;
+    bool ignore_stackfaults;
 
     arm_log_exception(cs->exception_index);
 
@@ -7296,8 +7307,8 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         lr |= R_V7M_EXCRET_MODE_MASK;
     }
 
-    v7m_push_stack(cpu);
-    v7m_exception_taken(cpu, lr, false);
+    ignore_stackfaults = v7m_push_stack(cpu);
+    v7m_exception_taken(cpu, lr, false, ignore_stackfaults);
     qemu_log_mask(CPU_LOG_INT, "... as %d\n", env->v7m.exception);
 }
 
-- 
2.7.4

