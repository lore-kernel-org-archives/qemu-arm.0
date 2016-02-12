Received: by 10.25.159.19 with SMTP id i19csp899167lfe;
        Fri, 12 Feb 2016 07:51:06 -0800 (PST)
X-Received: by 10.55.209.6 with SMTP id s6mr2738692qki.63.1455292266281;
        Fri, 12 Feb 2016 07:51:06 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 39si16284598qgo.127.2016.02.12.07.51.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 07:51:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33805 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aUFzt-0004Ok-Qn
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 10:51:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aUFzk-0004Fu-Uo
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 10:50:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aUFzg-0006zl-6i
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 10:50:56 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57340)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aUFzc-0006wv-Gs; Fri, 12 Feb 2016 10:50:48 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aUFhM-0007tS-4T; Fri, 12 Feb 2016 15:31:56 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 12 Feb 2016 15:31:53 +0000
Message-Id: <1455291115-30305-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455291115-30305-1-git-send-email-peter.maydell@linaro.org>
References: <1455291115-30305-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-arm] [PATCH v2 2/4] target-arm: Move get/set_r13_banked() to
	op_helper.c
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
X-TUID: Z8/2w+ikxb/K

Move get/set_r13_banked() from helper.c to op_helper.c. This will
let us add exception-raising code to them, and also puts them
in the same file as get/set_user_reg(), which makes some conceptual
sense.

(The original reason for the helper.c/op_helper.c split was that
only op_helper.c had access to the CPU env pointer; this distinction
has not been true for a long time, though, and so the split is
now rather arbitrary.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/helper.c    | 33 ---------------------------------
 target-arm/op_helper.c | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 33 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index bb913c6..c46e3d0 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5365,21 +5365,6 @@ void switch_mode(CPUARMState *env, int mode)
     }
 }
 
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
 uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
                                  uint32_t cur_el, bool secure)
 {
@@ -7762,24 +7747,6 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     return phys_addr;
 }
 
-void HELPER(set_r13_banked)(CPUARMState *env, uint32_t mode, uint32_t val)
-{
-    if ((env->uncached_cpsr & CPSR_M) == mode) {
-        env->regs[13] = val;
-    } else {
-        env->banked_r13[bank_number(mode)] = val;
-    }
-}
-
-uint32_t HELPER(get_r13_banked)(CPUARMState *env, uint32_t mode)
-{
-    if ((env->uncached_cpsr & CPSR_M) == mode) {
-        return env->regs[13];
-    } else {
-        return env->banked_r13[bank_number(mode)];
-    }
-}
-
 uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 049b521..053e9b6 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -457,6 +457,43 @@ void HELPER(set_user_reg)(CPUARMState *env, uint32_t regno, uint32_t val)
     }
 }
 
+#if defined(CONFIG_USER_ONLY)
+void HELPER(set_r13_banked)(CPUARMState *env, uint32_t mode, uint32_t val)
+{
+    ARMCPU *cpu = arm_env_get_cpu(env);
+
+    cpu_abort(CPU(cpu), "banked r13 write\n");
+}
+
+uint32_t HELPER(get_r13_banked)(CPUARMState *env, uint32_t mode)
+{
+    ARMCPU *cpu = arm_env_get_cpu(env);
+
+    cpu_abort(CPU(cpu), "banked r13 read\n");
+    return 0;
+}
+
+#else
+
+void HELPER(set_r13_banked)(CPUARMState *env, uint32_t mode, uint32_t val)
+{
+    if ((env->uncached_cpsr & CPSR_M) == mode) {
+        env->regs[13] = val;
+    } else {
+        env->banked_r13[bank_number(mode)] = val;
+    }
+}
+
+uint32_t HELPER(get_r13_banked)(CPUARMState *env, uint32_t mode)
+{
+    if ((env->uncached_cpsr & CPSR_M) == mode) {
+        return env->regs[13];
+    } else {
+        return env->banked_r13[bank_number(mode)];
+    }
+}
+#endif
+
 void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
                                  uint32_t isread)
 {
-- 
1.9.1

