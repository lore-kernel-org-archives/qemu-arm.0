Received: by 10.25.77.65 with SMTP id a62csp125413lfb;
        Fri, 20 Jan 2017 10:45:28 -0800 (PST)
X-Received: by 10.200.37.85 with SMTP id 21mr13843202qtn.238.1484937928131;
        Fri, 20 Jan 2017 10:45:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p188si5431847qke.226.2017.01.20.10.45.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Jan 2017 10:45:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56747 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cUeBh-0003Vd-Co
	for alex.bennee@linaro.org; Fri, 20 Jan 2017 13:45:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cUeBG-00035s-4r
	for qemu-arm@nongnu.org; Fri, 20 Jan 2017 13:44:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cUeBF-0002Xw-3k
	for qemu-arm@nongnu.org; Fri, 20 Jan 2017 13:44:58 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48217)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cUeBE-0002QO-Sf; Fri, 20 Jan 2017 13:44:57 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cUeB2-00046s-VS; Fri, 20 Jan 2017 18:44:44 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 20 Jan 2017 18:44:39 +0000
Message-Id: <1484937883-1068-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484937883-1068-1-git-send-email-peter.maydell@linaro.org>
References: <1484937883-1068-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/6] armv7m: Replace armv7m.hack with
 unassigned_access handler
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
Cc: Liviu Ionescu <ilg@livius.net>, Michael Davidsaver <mdavidsaver@gmail.com>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X2eAAPhQGVgi

From: Michael Davidsaver <mdavidsaver@gmail.com>

For v7m we need to catch attempts to execute from special
addresses at 0xfffffff0 and above. Previously we did this
with the aid of a hacky special purpose lump of memory
in the address space and a check in translate.c for whether
we were translating code at those addresses.

We can implement this more cleanly using a CPU
unassigned access handler which throws the exception
if the unassigned access is for one of the special addresses.

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
[PMM:
 * drop the deletion of the "don't interrupt if PC is magic"
   code in arm_v7m_cpu_exec_interrupt() -- this is still
   required
 * don't generate an exception for unassigned accesses
   which aren't to the magic address -- although doing
   this is in theory correct in practice it will break
   currently working guests which rely on the RAZ/WI
   behaviour when they touch devices which we haven't
   modelled.
 * trigger EXCP_EXCEPTION_EXIT on is_exec, not !is_write
]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armv7m.c        |  8 --------
 target/arm/cpu.c       | 28 ++++++++++++++++++++++++++++
 target/arm/translate.c | 12 ++++++------
 3 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 49d3078..0c9ca7b 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -180,7 +180,6 @@ DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
     uint64_t entry;
     uint64_t lowaddr;
     int big_endian;
-    MemoryRegion *hack = g_new(MemoryRegion, 1);
 
     if (cpu_model == NULL) {
 	cpu_model = "cortex-m3";
@@ -225,13 +224,6 @@ DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
         }
     }
 
-    /* Hack to map an additional page of ram at the top of the address
-       space.  This stops qemu complaining about executing code outside RAM
-       when returning from an exception.  */
-    memory_region_init_ram(hack, NULL, "armv7m.hack", 0x1000, &error_fatal);
-    vmstate_register_ram_global(hack);
-    memory_region_add_subregion(system_memory, 0xfffff000, hack);
-
     qemu_register_reset(armv7m_reset, cpu);
     return nvic;
 }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 3f2cdb6..47759c9 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -292,6 +292,33 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 }
 
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
+static void arm_v7m_unassigned_access(CPUState *cpu, hwaddr addr,
+                                      bool is_write, bool is_exec, int opaque,
+                                      unsigned size)
+{
+    ARMCPU *arm = ARM_CPU(cpu);
+    CPUARMState *env = &arm->env;
+
+    /* ARMv7-M interrupt return works by loading a magic value into the PC.
+     * On real hardware the load causes the return to occur.  The qemu
+     * implementation performs the jump normally, then does the exception
+     * return by throwing a special exception when when the CPU tries to
+     * execute code at the magic address.
+     */
+    if (env->v7m.exception != 0 && addr >= 0xfffffff0 && is_exec) {
+        cpu->exception_index = EXCP_EXCEPTION_EXIT;
+        cpu_loop_exit(cpu);
+    }
+
+    /* In real hardware an attempt to access parts of the address space
+     * with nothing there will usually cause an external abort.
+     * However our QEMU board models are often missing device models where
+     * the guest can boot anyway with the default read-as-zero/writes-ignored
+     * behaviour that you get without a QEMU unassigned_access hook.
+     * So just return here to retain that default behaviour.
+     */
+}
+
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
@@ -1016,6 +1043,7 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
     cc->do_interrupt = arm_v7m_cpu_do_interrupt;
 #endif
 
+    cc->do_unassigned_access = arm_v7m_unassigned_access;
     cc->cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt;
 }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index c9186b6..a7c2abe 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11719,12 +11719,12 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
             break;
         }
 #else
-        if (dc->pc >= 0xfffffff0 && arm_dc_feature(dc, ARM_FEATURE_M)) {
-            /* We always get here via a jump, so know we are not in a
-               conditional execution block.  */
-            gen_exception_internal(EXCP_EXCEPTION_EXIT);
-            dc->is_jmp = DISAS_EXC;
-            break;
+        if (arm_dc_feature(dc, ARM_FEATURE_M)) {
+            /* Branches to the magic exception-return addresses should
+             * already have been caught via the arm_v7m_unassigned_access hook,
+             * and never get here.
+             */
+            assert(dc->pc < 0xfffffff0);
         }
 #endif
 
-- 
2.7.4

