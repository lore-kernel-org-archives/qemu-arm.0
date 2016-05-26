Received: by 10.25.30.65 with SMTP id e62csp549472lfe;
        Thu, 26 May 2016 08:24:45 -0700 (PDT)
X-Received: by 10.140.238.66 with SMTP id j63mr9370310qhc.48.1464276281608;
        Thu, 26 May 2016 08:24:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f128si13396657qkd.91.2016.05.26.08.24.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 May 2016 08:24:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38957 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5x9N-0006Sv-0a
	for alex.bennee@linaro.org; Thu, 26 May 2016 11:24:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5x9G-0006PC-Jt
	for qemu-arm@nongnu.org; Thu, 26 May 2016 11:24:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5x9F-0004VR-6a
	for qemu-arm@nongnu.org; Thu, 26 May 2016 11:24:34 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57304)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5x9E-0004Uz-TJ; Thu, 26 May 2016 11:24:33 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5whL-00045r-Gq; Thu, 26 May 2016 15:55:43 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 26 May 2016 15:55:22 +0100
Message-Id: <1464274540-19693-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 04/22] target-arm: Provide hook to tell GICv3
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
X-TUID: u4KUMUPmxUNk

The GICv3 CPU interface needs to know when the CPU it is attached
to makes an exception level or mode transition that changes the
security state, because whether it is asserting IRQ or FIQ can change
depending on these things. Provide a mechanism for letting the GICv3
device register a hook to be called on such changes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/cpu.c       |  9 +++++++++
 target-arm/cpu.h       | 34 ++++++++++++++++++++++++++++++++++
 target-arm/helper.c    |  2 ++
 target-arm/internals.h |  8 ++++++++
 target-arm/op_helper.c |  4 ++++
 5 files changed, 57 insertions(+)

diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 3fd0743..0eaa907 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -51,6 +51,15 @@ static bool arm_cpu_has_work(CPUState *cs)
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
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 2fa1f41..9b045af 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -504,6 +504,13 @@ typedef struct CPUARMState {
 } CPUARMState;
 
 /**
+ * ARMELChangeHook:
+ * type of a function which can be registered via arm_register_el_change_hook()
+ * to get callbacks when the CPU changes its exception level or mode.
+ */
+typedef void ARMELChangeHook(ARMCPU *cpu, void *opaque);
+
+/**
  * ARMCPU:
  * @env: #CPUARMState
  *
@@ -641,6 +648,9 @@ struct ARMCPU {
     /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
     uint32_t dcz_blocksize;
     uint64_t rvbar;
+
+    ARMELChangeHook *el_change_hook;
+    void *el_change_hook_opaque;
 };
 
 static inline ARMCPU *arm_env_get_cpu(CPUARMState *env)
@@ -2373,4 +2383,28 @@ static inline AddressSpace *arm_addressspace(CPUState *cs, MemTxAttrs attrs)
 }
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
diff --git a/target-arm/helper.c b/target-arm/helper.c
index e3ea26f..d907598 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -6496,6 +6496,8 @@ void arm_cpu_do_interrupt(CPUState *cs)
         arm_cpu_do_interrupt_aarch32(cs);
     }
 
+    arm_call_el_change_hook(cpu);
+
     if (!kvm_enabled()) {
         cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
     }
diff --git a/target-arm/internals.h b/target-arm/internals.h
index a125873..5d8ec43 100644
--- a/target-arm/internals.h
+++ b/target-arm/internals.h
@@ -479,4 +479,12 @@ bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
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
index 0b29b9d..8021738 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -437,6 +437,8 @@ void HELPER(cpsr_write)(CPUARMState *env, uint32_t val, uint32_t mask)
 void HELPER(cpsr_write_eret)(CPUARMState *env, uint32_t val)
 {
     cpsr_write(env, val, CPSR_ERET_MASK, CPSRWriteExceptionReturn);
+
+    arm_call_el_change_hook(arm_env_get_cpu(env));
 }
 
 /* Access to user mode registers from privileged modes.  */
@@ -932,6 +934,8 @@ void HELPER(exception_return)(CPUARMState *env)
         env->pc = env->elr_el[cur_el];
     }
 
+    arm_call_el_change_hook(arm_env_get_cpu(env));
+
     return;
 
 illegal_return:
-- 
1.9.1

