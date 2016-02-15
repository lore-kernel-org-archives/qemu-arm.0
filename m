Received: by 10.25.208.211 with SMTP id h202csp850653lfg;
        Mon, 15 Feb 2016 09:26:40 -0800 (PST)
X-Received: by 10.55.212.28 with SMTP id l28mr21742664qki.93.1455557200566;
        Mon, 15 Feb 2016 09:26:40 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u21si35231999qki.75.2016.02.15.09.26.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Feb 2016 09:26:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34558 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVMv1-0006gc-Vv
	for alex.bennee@linaro.org; Mon, 15 Feb 2016 12:26:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVMrh-0000gd-KT
	for qemu-arm@nongnu.org; Mon, 15 Feb 2016 12:23:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVMrg-0007sM-7z
	for qemu-arm@nongnu.org; Mon, 15 Feb 2016 12:23:13 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57358)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVMrc-0007mW-6x; Mon, 15 Feb 2016 12:23:08 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVMrR-0000xR-RU; Mon, 15 Feb 2016 17:22:57 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 15 Feb 2016 17:22:48 +0000
Message-Id: <1455556977-3644-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
References: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-arm] [PATCH 02/11] target-arm: Add write_type argument to
	cpsr_write()
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
X-TUID: z0TjRX/bIzo5

Add an argument to cpsr_write() to indicate what kind of CPSR
write is being requested, since the exact behaviour should
differ for the different cases.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/arm/nwfpe/fpa11.h |  2 +-
 linux-user/main.c            |  6 +++---
 linux-user/signal.c          |  4 ++--
 target-arm/cpu.h             | 13 +++++++++++--
 target-arm/gdbstub.c         |  2 +-
 target-arm/helper.c          |  3 ++-
 target-arm/kvm32.c           |  2 +-
 target-arm/kvm64.c           |  2 +-
 target-arm/machine.c         |  2 +-
 target-arm/op_helper.c       |  6 +++---
 10 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/linux-user/arm/nwfpe/fpa11.h b/linux-user/arm/nwfpe/fpa11.h
index bb9ac65..faa6b00 100644
--- a/linux-user/arm/nwfpe/fpa11.h
+++ b/linux-user/arm/nwfpe/fpa11.h
@@ -108,7 +108,7 @@ static inline void writeRegister(unsigned int x, unsigned int y)
 
 static inline void writeConditionCodes(unsigned int x)
 {
-        cpsr_write(user_registers,x,CPSR_NZCV);
+    cpsr_write(user_registers, x, CPSR_NZCV, CPSRWriteByInstr);
 }
 
 #define ARM_REG_PC 15
diff --git a/linux-user/main.c b/linux-user/main.c
index e719a2d..1269470 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -513,7 +513,7 @@ static void arm_kernel_cmpxchg64_helper(CPUARMState *env)
         env->regs[0] = -1;
         cpsr &= ~CPSR_C;
     }
-    cpsr_write(env, cpsr, CPSR_C);
+    cpsr_write(env, cpsr, CPSR_C, CPSRWriteByInstr);
     end_exclusive();
     return;
 
@@ -562,7 +562,7 @@ do_kernel_trap(CPUARMState *env)
             env->regs[0] = -1;
             cpsr &= ~CPSR_C;
         }
-        cpsr_write(env, cpsr, CPSR_C);
+        cpsr_write(env, cpsr, CPSR_C, CPSRWriteByInstr);
         end_exclusive();
         break;
     case 0xffff0fe0: /* __kernel_get_tls */
@@ -4446,7 +4446,7 @@ int main(int argc, char **argv, char **envp)
 #elif defined(TARGET_ARM)
     {
         int i;
-        cpsr_write(env, regs->uregs[16], 0xffffffff);
+        cpsr_write(env, regs->uregs[16], 0xffffffff, CPSRWriteByInstr);
         for(i = 0; i < 16; i++) {
             env->regs[i] = regs->uregs[i];
         }
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 327c032..82f81c7 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -1611,7 +1611,7 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
 	env->regs[13] = frame_addr;
 	env->regs[14] = retcode;
 	env->regs[15] = handler & (thumb ? ~1 : ~3);
-	cpsr_write(env, cpsr, 0xffffffff);
+        cpsr_write(env, cpsr, 0xffffffff, CPSRWriteByInstr);
 }
 
 static abi_ulong *setup_sigframe_v2_vfp(abi_ulong *regspace, CPUARMState *env)
@@ -1843,7 +1843,7 @@ restore_sigcontext(CPUARMState *env, struct target_sigcontext *sc)
     __get_user(env->regs[15], &sc->arm_pc);
 #ifdef TARGET_CONFIG_CPU_32
     __get_user(cpsr, &sc->arm_cpsr);
-        cpsr_write(env, cpsr, CPSR_USER | CPSR_EXEC);
+    cpsr_write(env, cpsr, CPSR_USER | CPSR_EXEC, CPSRWriteByInstr);
 #endif
 
 	err |= !valid_user_regs(env);
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 1623821..e72e33b 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -719,8 +719,17 @@ static inline void pstate_write(CPUARMState *env, uint32_t val)
 
 /* Return the current CPSR value.  */
 uint32_t cpsr_read(CPUARMState *env);
-/* Set the CPSR.  Note that some bits of mask must be all-set or all-clear.  */
-void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask);
+
+typedef enum CPSRWriteType {
+    CPSRWriteByInstr = 0,         /* from guest MSR or CPS */
+    CPSRWriteExceptionReturn = 1, /* from guest exception return insn */
+    CPSRWriteRaw = 2,             /* trust values, do not switch reg banks */
+    CPSRWriteByGDBStub = 3,       /* from the GDB stub */
+} CPSRWriteType;
+
+/* Set the CPSR.  Note that some bits of mask must be all-set or all-clear.*/
+void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
+                CPSRWriteType write_type);
 
 /* Return the current xPSR value.  */
 static inline uint32_t xpsr_read(CPUARMState *env)
diff --git a/target-arm/gdbstub.c b/target-arm/gdbstub.c
index 08b91a4..3ba9aad 100644
--- a/target-arm/gdbstub.c
+++ b/target-arm/gdbstub.c
@@ -94,7 +94,7 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
         return 4;
     case 25:
         /* CPSR */
-        cpsr_write(env, tmp, 0xffffffff);
+        cpsr_write(env, tmp, 0xffffffff, CPSRWriteByGDBStub);
         return 4;
     }
     /* Unknown register.  */
diff --git a/target-arm/helper.c b/target-arm/helper.c
index a420a2a..828822b 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5199,7 +5199,8 @@ uint32_t cpsr_read(CPUARMState *env)
         | (env->GE << 16) | (env->daif & CPSR_AIF);
 }
 
-void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
+void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
+                CPSRWriteType write_type)
 {
     uint32_t changed_daif;
 
diff --git a/target-arm/kvm32.c b/target-arm/kvm32.c
index ea01932..d44a7f9 100644
--- a/target-arm/kvm32.c
+++ b/target-arm/kvm32.c
@@ -428,7 +428,7 @@ int kvm_arch_get_registers(CPUState *cs)
     if (ret) {
         return ret;
     }
-    cpsr_write(env, cpsr, 0xffffffff);
+    cpsr_write(env, cpsr, 0xffffffff, CPSRWriteRaw);
 
     /* Make sure the current mode regs are properly set */
     mode = env->uncached_cpsr & CPSR_M;
diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
index 0f1b4d6..08c2c81 100644
--- a/target-arm/kvm64.c
+++ b/target-arm/kvm64.c
@@ -723,7 +723,7 @@ int kvm_arch_get_registers(CPUState *cs)
         pstate_write(env, val);
     } else {
         env->uncached_cpsr = val & CPSR_M;
-        cpsr_write(env, val, 0xffffffff);
+        cpsr_write(env, val, 0xffffffff, CPSRWriteRaw);
     }
 
     /* KVM puts SP_EL0 in regs.sp and SP_EL1 in regs.sp_el1. On the
diff --git a/target-arm/machine.c b/target-arm/machine.c
index ed1925a..0fc7df0 100644
--- a/target-arm/machine.c
+++ b/target-arm/machine.c
@@ -175,7 +175,7 @@ static int get_cpsr(QEMUFile *f, void *opaque, size_t size)
 
     /* Avoid mode switch when restoring CPSR */
     env->uncached_cpsr = val & CPSR_M;
-    cpsr_write(env, val, 0xffffffff);
+    cpsr_write(env, val, 0xffffffff, CPSRWriteRaw);
     return 0;
 }
 
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index e3ddd5a..543d33a 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -422,13 +422,13 @@ uint32_t HELPER(cpsr_read)(CPUARMState *env)
 
 void HELPER(cpsr_write)(CPUARMState *env, uint32_t val, uint32_t mask)
 {
-    cpsr_write(env, val, mask);
+    cpsr_write(env, val, mask, CPSRWriteByInstr);
 }
 
 /* Write the CPSR for a 32-bit exception return */
 void HELPER(cpsr_write_eret)(CPUARMState *env, uint32_t val)
 {
-    cpsr_write(env, val, CPSR_ERET_MASK);
+    cpsr_write(env, val, CPSR_ERET_MASK, CPSRWriteExceptionReturn);
 }
 
 /* Access to user mode registers from privileged modes.  */
@@ -780,7 +780,7 @@ void HELPER(exception_return)(CPUARMState *env)
     if (!return_to_aa64) {
         env->aarch64 = 0;
         env->uncached_cpsr = spsr & CPSR_M;
-        cpsr_write(env, spsr, ~0);
+        cpsr_write(env, spsr, ~0, CPSRWriteRaw);
         if (!arm_singlestep_active(env)) {
             env->uncached_cpsr &= ~PSTATE_SS;
         }
-- 
1.9.1

