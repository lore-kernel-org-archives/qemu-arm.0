Received: by 10.25.208.137 with SMTP id h131csp1685027lfg;
        Mon, 9 May 2016 10:34:49 -0700 (PDT)
X-Received: by 10.140.136.16 with SMTP id 16mr38967978qhi.25.1462815289830;
        Mon, 09 May 2016 10:34:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g31si19396801qgf.44.2016.05.09.10.34.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 May 2016 10:34:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42523 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1azp4z-0004NP-2k
	for alex.bennee@linaro.org; Mon, 09 May 2016 13:34:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1azp0n-0004Hb-Lo
	for qemu-arm@nongnu.org; Mon, 09 May 2016 13:30:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1azp0k-0000LQ-Ep
	for qemu-arm@nongnu.org; Mon, 09 May 2016 13:30:28 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1azp0k-00005k-3m; Mon, 09 May 2016 13:30:26 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1azp0C-0001RL-Ik; Mon, 09 May 2016 18:29:52 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 May 2016 18:29:30 +0100
Message-Id: <1462814989-24360-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 04/23] target-arm: Provide hook to tell GICv3
 about changes of security state
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
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V4X42X11VW3B

The GICv3 CPU interface needs to know when the CPU it is attached
to makes an exception level or mode transition that changes the
security state, because whether it is asserting IRQ or FIQ can change
depending on these things. Provide a mechanism for letting the GICv3
device register a hook to be called on such changes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/cpu-qom.h   | 40 ++++++++++++++++++++++++++++++++++++++--
 target-arm/cpu.c       |  9 +++++++++
 target-arm/helper.c    |  2 ++
 target-arm/internals.h |  8 ++++++++
 target-arm/op_helper.c |  4 ++++
 5 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
index 1061c08..6164333 100644
--- a/target-arm/cpu-qom.h
+++ b/target-arm/cpu-qom.h
@@ -47,13 +47,22 @@ typedef struct ARMCPUClass {
     void (*parent_reset)(CPUState *cpu);
 } ARMCPUClass;
 
+typedef struct ARMCPU ARMCPU;
+
+/**
+ * ARMELChangeHook:
+ * type of a function which can be registered via arm_register_el_change_hook()
+ * to get callbacks when the CPU changes its exception level or mode.
+ */
+typedef void ARMELChangeHook(ARMCPU *cpu, void *opaque);
+
 /**
  * ARMCPU:
  * @env: #CPUARMState
  *
  * An ARM CPU core.
  */
-typedef struct ARMCPU {
+struct ARMCPU {
     /*< private >*/
     CPUState parent_obj;
     /*< public >*/
@@ -185,7 +194,10 @@ typedef struct ARMCPU {
     /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
     uint32_t dcz_blocksize;
     uint64_t rvbar;
-} ARMCPU;
+
+    ARMELChangeHook *el_change_hook;
+    void *el_change_hook_opaque;
+};
 
 #define TYPE_AARCH64_CPU "aarch64-cpu"
 #define AARCH64_CPU_CLASS(klass) \
@@ -257,4 +269,28 @@ int aarch64_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 #endif
 
+/**
+ * arm_register_el_change_hook:
+ * Register a hook function which will be called back whenever this
+ * CPU changes exception level or mode. The hook function will be
+ * passed a pointer to the ARMCPU and the opaque data pointer passed
+ * to this function when the hook was registered.
+ *
+ * Note that we currently only support registering a single hook function,
+ * and will assert if this function is called twice.
+ * This facility is intended for the use of the GICv3 emulation.
+ */
+void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHook *hook,
+                                 void *opaque);
+
+/**
+ * arm_get_el_change_hook_opaque:
+ * Return the opaque data that will be used by the el_change_hook
+ * for this CPU.
+ */
+static inline void *arm_get_el_change_hook_opaque(ARMCPU *cpu)
+{
+    return cpu->el_change_hook_opaque;
+}
+
 #endif
diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index e48e83a..7e9a273 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -50,6 +50,15 @@ static bool arm_cpu_has_work(CPUState *cs)
          | CPU_INTERRUPT_EXITTB);
 }
 
+void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHook *hook,
+                                 void *opaque)
+{
+    /* We currently only support registering a single hook function */
+    assert(!cpu->el_change_hook);
+    cpu->el_change_hook = hook;
+    cpu->el_change_hook_opaque = opaque;
+}
+
 static void cp_reg_reset(gpointer key, gpointer value, gpointer opaque)
 {
     /* Reset a single ARMCPRegInfo register */
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 09638b2..c96ded4 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -6476,6 +6476,8 @@ void arm_cpu_do_interrupt(CPUState *cs)
         arm_cpu_do_interrupt_aarch32(cs);
     }
 
+    arm_call_el_change_hook(cpu);
+
     if (!kvm_enabled()) {
         cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
     }
diff --git a/target-arm/internals.h b/target-arm/internals.h
index 2e70272..3651d85 100644
--- a/target-arm/internals.h
+++ b/target-arm/internals.h
@@ -476,4 +476,12 @@ bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
 void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
                                  int is_user, uintptr_t retaddr);
 
+/* Call the EL change hook if one has been registered */
+static inline void arm_call_el_change_hook(ARMCPU *cpu)
+{
+    if (cpu->el_change_hook) {
+        cpu->el_change_hook(cpu, cpu->el_change_hook_opaque);
+    }
+}
+
 #endif
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index d626ff1..4391bf0 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -434,6 +434,8 @@ void HELPER(cpsr_write)(CPUARMState *env, uint32_t val, uint32_t mask)
 void HELPER(cpsr_write_eret)(CPUARMState *env, uint32_t val)
 {
     cpsr_write(env, val, CPSR_ERET_MASK, CPSRWriteExceptionReturn);
+
+    arm_call_el_change_hook(arm_env_get_cpu(env));
 }
 
 /* Access to user mode registers from privileged modes.  */
@@ -929,6 +931,8 @@ void HELPER(exception_return)(CPUARMState *env)
         env->pc = env->elr_el[cur_el];
     }
 
+    arm_call_el_change_hook(arm_env_get_cpu(env));
+
     return;
 
 illegal_return:
-- 
1.9.1

