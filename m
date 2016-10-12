Received: by 10.80.166.35 with SMTP id d32csp659384edc;
        Wed, 12 Oct 2016 10:54:58 -0700 (PDT)
X-Received: by 10.55.52.1 with SMTP id b1mr2370286qka.223.1476294897958;
        Wed, 12 Oct 2016 10:54:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q126si4424673qke.132.2016.10.12.10.54.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Oct 2016 10:54:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34996 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1buNk1-00073Q-DD
	for alex.bennee@linaro.org; Wed, 12 Oct 2016 13:54:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1buNju-00070Q-9O
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 13:54:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1buNjr-00033Q-Qc
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 13:54:49 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47325)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1buNjr-00030L-Jj; Wed, 12 Oct 2016 13:54:47 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1buNjj-0001st-Dg; Wed, 12 Oct 2016 18:54:39 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed, 12 Oct 2016 18:54:34 +0100
Message-Id: <1476294876-12340-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476294876-12340-1-git-send-email-peter.maydell@linaro.org>
References: <1476294876-12340-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 2/4] target-arm: Add trace events for the
 generic timers
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qLZvXGJfEOWG

Add some useful trace events for the ARM generic timers (notably
the various register writes and the resulting IRQ line state).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 Makefile.objs           |  1 +
 target-arm/helper.c     | 20 ++++++++++++++++----
 target-arm/trace-events | 10 ++++++++++
 3 files changed, 27 insertions(+), 4 deletions(-)
 create mode 100644 target-arm/trace-events

diff --git a/Makefile.objs b/Makefile.objs
index 02fb8e7..69fdd48 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -155,6 +155,7 @@ trace-events-y += hw/alpha/trace-events
 trace-events-y += ui/trace-events
 trace-events-y += audio/trace-events
 trace-events-y += net/trace-events
+trace-events-y += target-arm/trace-events
 trace-events-y += target-i386/trace-events
 trace-events-y += target-sparc/trace-events
 trace-events-y += target-s390x/trace-events
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 23792ab..5fcdc2b 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -1,4 +1,5 @@
 #include "qemu/osdep.h"
+#include "trace.h"
 #include "cpu.h"
 #include "internals.h"
 #include "exec/gdbstub.h"
@@ -1560,10 +1561,13 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
         /* Note that this must be unsigned 64 bit arithmetic: */
         int istatus = count - offset >= gt->cval;
         uint64_t nexttick;
+        int irqstate;
 
         gt->ctl = deposit32(gt->ctl, 2, 1, istatus);
-        qemu_set_irq(cpu->gt_timer_outputs[timeridx],
-                     (istatus && !(gt->ctl & 2)));
+
+        irqstate = (istatus && !(gt->ctl & 2));
+        qemu_set_irq(cpu->gt_timer_outputs[timeridx], irqstate);
+
         if (istatus) {
             /* Next transition is when count rolls back over to zero */
             nexttick = UINT64_MAX;
@@ -1580,11 +1584,13 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
             nexttick = INT64_MAX / GTIMER_SCALE;
         }
         timer_mod(cpu->gt_timer[timeridx], nexttick);
+        trace_arm_gt_recalc(timeridx, irqstate, nexttick);
     } else {
         /* Timer disabled: ISTATUS and timer output always clear */
         gt->ctl &= ~4;
         qemu_set_irq(cpu->gt_timer_outputs[timeridx], 0);
         timer_del(cpu->gt_timer[timeridx]);
+        trace_arm_gt_recalc_disabled(timeridx);
     }
 }
 
@@ -1610,6 +1616,7 @@ static void gt_cval_write(CPUARMState *env, const ARMCPRegInfo *ri,
                           int timeridx,
                           uint64_t value)
 {
+    trace_arm_gt_cval_write(timeridx, value);
     env->cp15.c14_timer[timeridx].cval = value;
     gt_recalc_timer(arm_env_get_cpu(env), timeridx);
 }
@@ -1629,6 +1636,7 @@ static void gt_tval_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     uint64_t offset = timeridx == GTIMER_VIRT ? env->cp15.cntvoff_el2 : 0;
 
+    trace_arm_gt_tval_write(timeridx, value);
     env->cp15.c14_timer[timeridx].cval = gt_get_countervalue(env) - offset +
                                          sextract64(value, 0, 32);
     gt_recalc_timer(arm_env_get_cpu(env), timeridx);
@@ -1641,6 +1649,7 @@ static void gt_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
     ARMCPU *cpu = arm_env_get_cpu(env);
     uint32_t oldval = env->cp15.c14_timer[timeridx].ctl;
 
+    trace_arm_gt_ctl_write(timeridx, value);
     env->cp15.c14_timer[timeridx].ctl = deposit64(oldval, 0, 2, value);
     if ((oldval ^ value) & 1) {
         /* Enable toggled */
@@ -1649,8 +1658,10 @@ static void gt_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
         /* IMASK toggled: don't need to recalculate,
          * just set the interrupt line based on ISTATUS
          */
-        qemu_set_irq(cpu->gt_timer_outputs[timeridx],
-                     (oldval & 4) && !(value & 2));
+        int irqstate = (oldval & 4) && !(value & 2);
+
+        trace_arm_gt_imask_toggle(timeridx, irqstate);
+        qemu_set_irq(cpu->gt_timer_outputs[timeridx], irqstate);
     }
 }
 
@@ -1715,6 +1726,7 @@ static void gt_cntvoff_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
 
+    trace_arm_gt_cntvoff_write(value);
     raw_write(env, ri, value);
     gt_recalc_timer(cpu, GTIMER_VIRT);
 }
diff --git a/target-arm/trace-events b/target-arm/trace-events
new file mode 100644
index 0000000..9f726bd
--- /dev/null
+++ b/target-arm/trace-events
@@ -0,0 +1,10 @@
+# See docs/tracing.txt for syntax documentation.
+
+# target-arm/helper.c
+arm_gt_recalc(int timer, int irqstate, uint64_t nexttick) "gt recalc: timer %d irqstate %d next tick %" PRIx64
+arm_gt_recalc_disabled(int timer) "gt recalc: timer %d irqstate 0 timer disabled"
+arm_gt_cval_write(int timer, uint64_t value) "gt_cval_write: timer %d value %" PRIx64
+arm_gt_tval_write(int timer, uint64_t value) "gt_tval_write: timer %d value %" PRIx64
+arm_gt_ctl_write(int timer, uint64_t value) "gt_ctl_write: timer %d value %" PRIx64
+arm_gt_imask_toggle(int timer, int irqstate) "gt_ctl_write: timer %d IMASK toggle, new irqstate %d"
+arm_gt_cntvoff_write(uint64_t value) "gt_cntvoff_write: value %" PRIx64
-- 
2.7.4

