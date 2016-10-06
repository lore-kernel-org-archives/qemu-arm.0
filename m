Received: by 10.80.163.71 with SMTP id 65csp3218967edn;
        Thu, 6 Oct 2016 06:30:44 -0700 (PDT)
X-Received: by 10.55.27.32 with SMTP id b32mr13820533qkb.211.1475760644416;
        Thu, 06 Oct 2016 06:30:44 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r63si699229qkb.310.2016.10.06.06.30.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Oct 2016 06:30:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56121 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bs8l1-0004kf-9G
	for alex.bennee@linaro.org; Thu, 06 Oct 2016 09:30:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bs8c9-0004nU-AU
	for qemu-devel@nongnu.org; Thu, 06 Oct 2016 09:21:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bs8c3-0006Xt-Ig
	for qemu-devel@nongnu.org; Thu, 06 Oct 2016 09:21:32 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47223)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bs8bs-0006TD-N8; Thu, 06 Oct 2016 09:21:16 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bs8bl-0006SI-05; Thu, 06 Oct 2016 14:21:09 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Oct 2016 14:21:06 +0100
Message-Id: <1475760067-25756-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475760067-25756-1-git-send-email-peter.maydell@linaro.org>
References: <1475760067-25756-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 2/3] target-arm: Add trace events for the
 generic timers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5eMY15L5wYwu

Add some useful trace events for the ARM generic timers (notably
the various register writes and the resulting IRQ line state).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 Makefile.objs       |  1 +
 target-arm/helper.c | 20 ++++++++++++++++----
 2 files changed, 17 insertions(+), 4 deletions(-)

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
-- 
2.7.4

