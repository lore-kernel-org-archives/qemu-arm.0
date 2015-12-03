Received: by 10.182.158.201 with SMTP id ww9csp3412711obb;
        Wed, 2 Dec 2015 16:20:02 -0800 (PST)
X-Received: by 10.140.92.176 with SMTP id b45mr7575069qge.104.1449102002639;
        Wed, 02 Dec 2015 16:20:02 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e32si6179631qkh.24.2015.12.02.16.20.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:20:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60909 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4Hcw-0005Ye-As
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:20:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc0-00049D-Bo
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hbx-0001wJ-FV
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:04 -0500
Received: from mail-qg0-x22a.google.com ([2607:f8b0:400d:c04::22a]:36234)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4Hbx-0001wD-Bq; Wed, 02 Dec 2015 19:19:01 -0500
Received: by qgcc31 with SMTP id c31so48112849qgc.3;
	Wed, 02 Dec 2015 16:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WyL0CSTDtF2Rc+DIKO6YZLqEDVpTo5UOU+fCg08Ku90=;
	b=suR7gjHbcrDM5PqElKrDuMrGqXfgZuj73Us7a9YWVjaGF7hoPD48DzxoecuhxdvLnb
	NsHhGLfxLXTwH8zdKuKQG2l7QaCbotlQJ9wt/6TiEtPo9mdPXu+NTkwoi6XsthGjOu7p
	XZBv8WSlxntst/YRRZDJazczByupBLf6mF92dU64+zhU45bDMldIuEUE/aJzUhWxEgzj
	tpNXW/ZlDrZw+Hha1IIDL3jUMsnDegF5eHqTLDVwx4e2CjbSW0bW9/5HU95gJ/DDNilu
	xltE2BUAMu3qqyrYh6kKJNzfIx/AS8UdNCCpRIN3LebBIFqw+CRlh95Xg5wRGKE0xXa6
	N67g==
X-Received: by 10.140.19.78 with SMTP id 72mr7602732qgg.81.1449101940914;
	Wed, 02 Dec 2015 16:19:00 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:00 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:29 -0500
Message-Id: <1449101933-24928-3-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::22a
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH v2 02/26] armv7m: Undo armv7m.hack
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /ZkI9is9N9QG

Add CPU unassigned access handler in place of special
MemoryRegion to catch exception returns.

The unassigned handler will signal other faults as either
prefetch or data exceptions, with the FSR code 0x8 to
distinguish them from memory translation faults (0xd).
Future code will make use of this distinction when
deciding to raise BusFault or MemManage exceptions.
---
 hw/arm/armv7m.c  |  8 --------
 target-arm/cpu.c | 32 +++++++++++++++++++++-----------
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index a80d2ad..68146de 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -176,7 +176,6 @@ DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
     uint64_t entry;
     uint64_t lowaddr;
     int big_endian;
-    MemoryRegion *hack = g_new(MemoryRegion, 1);
 
     if (cpu_model == NULL) {
 	cpu_model = "cortex-m3";
@@ -221,13 +220,6 @@ DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
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
diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 30739fc..728854f 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -280,6 +280,25 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 }
 
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
+static void arm_v7m_unassigned_access(CPUState *cpu, hwaddr addr,
+                                      bool is_write, bool is_exec, int opaque,
+                                      unsigned size)
+{
+    ARMCPU *arm = ARM_CPU(cpu);
+    CPUARMState *env = &arm->env;
+
+    env->exception.vaddress = addr;
+    env->exception.fsr = is_write ? 0x808 : 0x8; /* Precise External Abort */
+    if (env->v7m.exception != 0 && addr >= 0xfffffff0 && !is_write) {
+        cpu->exception_index = EXCP_EXCEPTION_EXIT;
+    } else if (is_exec) {
+        cpu->exception_index = EXCP_PREFETCH_ABORT;
+    } else {
+        cpu->exception_index = EXCP_DATA_ABORT;
+    }
+    cpu_loop_exit(cpu);
+}
+
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
@@ -294,19 +313,9 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
         cc->do_interrupt(cs);
         ret = true;
     }
-    /* ARMv7-M interrupt return works by loading a magic value
-     * into the PC.  On real hardware the load causes the
-     * return to occur.  The qemu implementation performs the
-     * jump normally, then does the exception return when the
-     * CPU tries to execute code at the magic address.
-     * This will cause the magic PC value to be pushed to
-     * the stack if an interrupt occurred at the wrong time.
-     * We avoid this by disabling interrupts when
-     * pc contains a magic address.
-     */
     if (interrupt_request & CPU_INTERRUPT_HARD
         && !(env->daif & PSTATE_I)
-        && (env->regs[15] < 0xfffffff0)) {
+            ) {
         cs->exception_index = EXCP_IRQ;
         cc->do_interrupt(cs);
         ret = true;
@@ -909,6 +918,7 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
     cc->do_interrupt = arm_v7m_cpu_do_interrupt;
 #endif
 
+    cc->do_unassigned_access = arm_v7m_unassigned_access;
     cc->cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt;
 }
 
-- 
2.1.4

