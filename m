Received: by 10.25.159.19 with SMTP id i19csp900406lfe;
        Fri, 12 Feb 2016 07:53:37 -0800 (PST)
X-Received: by 10.140.136.210 with SMTP id 201mr2981178qhi.6.1455292417309;
        Fri, 12 Feb 2016 07:53:37 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w82si16266162qhw.108.2016.02.12.07.53.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 07:53:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33842 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aUG2K-0000Tj-Sx
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 10:53:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aUG1m-0007z5-K1
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 10:53:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aUG1l-0007wI-M4
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 10:53:02 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57344)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aUG1j-0007v1-O7; Fri, 12 Feb 2016 10:52:59 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aUFhM-0007tW-6Q; Fri, 12 Feb 2016 15:31:56 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 12 Feb 2016 15:31:54 +0000
Message-Id: <1455291115-30305-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455291115-30305-1-git-send-email-peter.maydell@linaro.org>
References: <1455291115-30305-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-arm] [PATCH v2 3/4] target-arm: Combine user-only and softmmu
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
X-TUID: +IQcOvNxqpYM

The user-mode versions of get/set_r13_banked() exist just to assert
if they're ever called -- the translate time code should never
emit calls to them because SRS from user mode always UNDEF.
There's no code in the softmmu versions that can't compile in
CONFIG_USER_ONLY, and the assertion is not particularly useful,
so combine the two functions rather than having completely split
versions under ifdefs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/op_helper.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 053e9b6..cfdbc8d 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -457,24 +457,6 @@ void HELPER(set_user_reg)(CPUARMState *env, uint32_t regno, uint32_t val)
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
     if ((env->uncached_cpsr & CPSR_M) == mode) {
@@ -492,7 +474,6 @@ uint32_t HELPER(get_r13_banked)(CPUARMState *env, uint32_t mode)
         return env->banked_r13[bank_number(mode)];
     }
 }
-#endif
 
 void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
                                  uint32_t isread)
-- 
1.9.1

