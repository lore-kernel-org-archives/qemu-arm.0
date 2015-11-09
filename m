Received: by 10.182.105.169 with SMTP id gn9csp900674obb;
        Sun, 8 Nov 2015 17:14:15 -0800 (PST)
X-Received: by 10.55.197.3 with SMTP id p3mr26283075qki.11.1447031654252;
        Sun, 08 Nov 2015 17:14:14 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k61si9331923qgf.23.2015.11.08.17.14.14
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 17:14:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49349 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zvb2E-0002Vj-0x
	for alex.bennee@linaro.org; Sun, 08 Nov 2015 20:14:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1O-0001KX-4K
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1J-0007tm-I5
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:22 -0500
Received: from mail-qk0-x22a.google.com ([2607:f8b0:400d:c09::22a]:34279)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1Zvb1J-0007tT-EE; Sun, 08 Nov 2015 20:13:17 -0500
Received: by qkcn129 with SMTP id n129so65854141qkc.1;
	Sun, 08 Nov 2015 17:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GcdHudkgsixUF1hJpNKI6eHpFGjyBJHLgSFr7uPLQ58=;
	b=gTZ9flfacgq1N24sKaX1wYkmS9SSQfCnef+4rLCxRyVmEfe86siFSPJC1fA7wD8jGF
	7JDgOuLf7g7P3YtCKe55gIxCKHB1ruSMbSbGDCfhX9EqSPKWGzKy2/GBh91AwQSbIIIY
	eZjvhQAUxbTTZonkaw+RFFlm9DfSWkVblKQ9b0HHDWbHJ7XCYs/kSTRyxeZCKSYRZdJB
	EQbW20P+Fw/gREdGh0l9HgfaNMIR9w2z6PK8q2cv5wYta3XfycAvALlWVzgmqsYuW7iV
	qK/CEghuO7dWwVe+mhv0X9U9jaRl0692JrMGc601ZooyHsJ2ibuzeUMnxwDP11J/QxBP
	PNxQ==
X-Received: by 10.55.72.66 with SMTP id v63mr26423980qka.105.1447031597046;
	Sun, 08 Nov 2015 17:13:17 -0800 (PST)
Received: from localhost.localdomain (ool-182df582.dyn.optonline.net.
	[24.45.245.130])
	by smtp.gmail.com with ESMTPSA id g97sm3915552qge.6.2015.11.08.17.13.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Nov 2015 17:13:16 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  8 Nov 2015 20:11:29 -0500
Message-Id: <1447031505-12477-3-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c09::22a
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH 02/18] armv7m: Undo armv7m.hack
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
X-TUID: RALyuyANLJQ5

Add CPU unassigned access handler in place of special
MemoryRegion to catch exception returns.

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
---
 hw/arm/armv7m.c  |  8 --------
 target-arm/cpu.c | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 8 deletions(-)

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
index 30739fc..be026bc 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -280,6 +280,23 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 }
 
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
+static void arm_v7m_unassigned_access(CPUState *cpu, hwaddr addr,
+                                      bool is_write, bool is_exec, int opaque,
+                                      unsigned size)
+{
+    ARMCPU *arm = ARM_CPU(cpu);
+    CPUARMState *env = &arm->env;
+
+    if (env->v7m.exception != 0 && addr >= 0xfffffff0 && !is_write) {
+        cpu->exception_index = EXCP_EXCEPTION_EXIT;
+        cpu_loop_exit(cpu);
+    } else {
+        /* TODO, signal some *Fault? */
+        cpu_abort(cpu, "Trying to access outside RAM or ROM at 0x"
+                  TARGET_FMT_plx "\n", addr);
+    }
+}
+
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
@@ -909,6 +926,7 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
     cc->do_interrupt = arm_v7m_cpu_do_interrupt;
 #endif
 
+    cc->do_unassigned_access = arm_v7m_unassigned_access;
     cc->cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt;
 }
 
-- 
2.1.4

