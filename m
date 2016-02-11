Received: by 10.25.159.19 with SMTP id i19csp402363lfe;
        Thu, 11 Feb 2016 11:23:09 -0800 (PST)
X-Received: by 10.55.72.77 with SMTP id v74mr57395717qka.88.1455218589153;
        Thu, 11 Feb 2016 11:23:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p47si11062610qge.79.2016.02.11.11.23.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Feb 2016 11:23:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52917 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aTwpY-0001Z1-G8
	for alex.bennee@linaro.org; Thu, 11 Feb 2016 14:23:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aTwpT-0001Qf-Ig
	for qemu-arm@nongnu.org; Thu, 11 Feb 2016 14:23:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aTwpS-0006XK-Ks
	for qemu-arm@nongnu.org; Thu, 11 Feb 2016 14:23:03 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57307)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aTwpQ-0006W4-7c; Thu, 11 Feb 2016 14:23:00 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aTweb-0007NS-Lz; Thu, 11 Feb 2016 19:11:49 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 11 Feb 2016 19:11:48 +0000
Message-Id: <1455217909-28317-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455217909-28317-1-git-send-email-peter.maydell@linaro.org>
References: <1455217909-28317-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-arm] [PATCH 3/4] target-arm: Combine user-only and softmmu
	get/set_r13_banked()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: snLecLCzlQ0G

The user-mode versions of get/set_r13_banked() exist just to assert
if they're ever called -- the translate time code should never
emit calls to them because SRS from user mode always UNDEF.
There's no code in the softmmu versions that can't compile in
CONFIG_USER_ONLY, so combine the two functions rather than
having completely split versions under ifdefs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/op_helper.c | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 053e9b6..05f97a7 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -457,26 +457,11 @@ void HELPER(set_user_reg)(CPUARMState *env, uint32_t regno, uint32_t val)
     }
 }
 
-#if defined(CONFIG_USER_ONLY)
-void HELPER(set_r13_banked)(CPUARMState *env, uint32_t mode, uint32_t val)
-{
-    ARMCPU *cpu = arm_env_get_cpu(env);
-
-    cpu_abort(CPU(cpu), "banked r13 write\n");
-}
-
-uint32_t HELPER(get_r13_banked)(CPUARMState *env, uint32_t mode)
-{
-    ARMCPU *cpu = arm_env_get_cpu(env);
-
-    cpu_abort(CPU(cpu), "banked r13 read\n");
-    return 0;
-}
-
-#else
-
 void HELPER(set_r13_banked)(CPUARMState *env, uint32_t mode, uint32_t val)
 {
+#if defined(CONFIG_USER_ONLY)
+    g_assert_not_reached();
+#endif
     if ((env->uncached_cpsr & CPSR_M) == mode) {
         env->regs[13] = val;
     } else {
@@ -486,13 +471,15 @@ void HELPER(set_r13_banked)(CPUARMState *env, uint32_t mode, uint32_t val)
 
 uint32_t HELPER(get_r13_banked)(CPUARMState *env, uint32_t mode)
 {
+#if defined(CONFIG_USER_ONLY)
+    g_assert_not_reached();
+#endif
     if ((env->uncached_cpsr & CPSR_M) == mode) {
         return env->regs[13];
     } else {
         return env->banked_r13[bank_number(mode)];
     }
 }
-#endif
 
 void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
                                  uint32_t isread)
-- 
1.9.1

