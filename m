Received: by 10.25.205.13 with SMTP id d13csp11564521lfg;
        Mon, 9 Jan 2017 08:09:37 -0800 (PST)
X-Received: by 10.200.36.171 with SMTP id s40mr79744941qts.142.1483978176900;
        Mon, 09 Jan 2017 08:09:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h56si6889281qte.96.2017.01.09.08.09.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jan 2017 08:09:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40849 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQcVq-00030v-48
	for alex.bennee@linaro.org; Mon, 09 Jan 2017 11:09:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cQcSA-0007y9-DB
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 11:05:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cQcS9-0003on-Fv
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 11:05:46 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48036)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cQcS9-0003hC-9t; Mon, 09 Jan 2017 11:05:45 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cQcRq-0001ih-O4; Mon, 09 Jan 2017 16:05:26 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 Jan 2017 16:05:09 +0000
Message-Id: <1483977924-14522-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
References: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 03/18] target-arm: Expose output GPIO line for
 VCPU maintenance interrupt
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Andrew Jones <drjones@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BB0NEC0w1Th6

The GICv3 support for virtualization includes an outbound
maintenance interrupt signal which is asserted when the
CPU interface wants to signal to the hypervisor that it
needs attention. Expose this as an outbound GPIO line from
the CPU object which can be wired up as a physical interrupt
line by the board code (as we do already for the CPU timers).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/arm/cpu.h | 2 ++
 target/arm/cpu.c | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ab119e6..764b511 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -555,6 +555,8 @@ struct ARMCPU {
     QEMUTimer *gt_timer[NUM_GTIMERS];
     /* GPIO outputs for generic timer */
     qemu_irq gt_timer_outputs[NUM_GTIMERS];
+    /* GPIO output for GICv3 maintenance interrupt signal */
+    qemu_irq gicv3_maintenance_interrupt;
 
     /* MemoryRegion to use for secure physical accesses */
     MemoryRegion *secure_memory;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f5cb30a..8932086 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -466,6 +466,9 @@ static void arm_cpu_initfn(Object *obj)
                                                 arm_gt_stimer_cb, cpu);
     qdev_init_gpio_out(DEVICE(cpu), cpu->gt_timer_outputs,
                        ARRAY_SIZE(cpu->gt_timer_outputs));
+
+    qdev_init_gpio_out_named(DEVICE(cpu), &cpu->gicv3_maintenance_interrupt,
+                             "gicv3-maintenance-interrupt", 1);
 #endif
 
     /* DTB consumers generally don't in fact care what the 'compatible'
-- 
2.7.4

