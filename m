Received: by 10.80.166.35 with SMTP id d32csp368191edc;
        Wed, 2 Nov 2016 15:57:59 -0700 (PDT)
X-Received: by 10.237.55.72 with SMTP id i66mr5021457qtb.83.1478127479285;
        Wed, 02 Nov 2016 15:57:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f75si2465386qke.326.2016.11.02.15.57.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Nov 2016 15:57:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58127 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c24Tm-0002Kq-Rm
	for alex.bennee@linaro.org; Wed, 02 Nov 2016 18:57:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <juro.bystricky@intel.com>) id 1c2455-0007uR-DS
	for qemu-arm@nongnu.org; Wed, 02 Nov 2016 18:32:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <juro.bystricky@intel.com>) id 1c2452-0003Nv-8E
	for qemu-arm@nongnu.org; Wed, 02 Nov 2016 18:32:27 -0400
Received: from mga02.intel.com ([134.134.136.20]:16535)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <juro.bystricky@intel.com>)
	id 1c2451-0003Ne-RK
	for qemu-arm@nongnu.org; Wed, 02 Nov 2016 18:32:24 -0400
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP; 02 Nov 2016 15:32:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,436,1473145200"; d="scan'208";a="26787615"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga005.jf.intel.com with ESMTP; 02 Nov 2016 15:32:21 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: qemu-arm@nongnu.org
Date: Wed,  2 Nov 2016 15:31:03 -0700
Message-Id: <1478125863-33365-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.20
X-Mailman-Approved-At: Wed, 02 Nov 2016 18:57:57 -0400
Subject: [Qemu-arm] [PATCH] arm: Support for Base Priority Mask Register
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
Cc: jurobystricky@hotmail.com, Juro Bystricky <juro.bystricky@intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KDJqJvxFbyxc

Currently there is no emulation of the ARM BASEPRI register. Only reading/writing
the register is implemented, but no functionality.
The BASEPRI register defines the minimum priority for exception processing.
When BASEPRI is set to a nonzero value, it prevents the activation of all
exceptions with the same or lower priority level as the BASEPRI value.

This patchset implements the expected functionality. BASEPRI reads/writes are
implemented via helper routines (MSR/MRS), so a write to BASEPRI will result
in a call gic_update with a new BASEPRI value. Only writes to BASEPRI are tracked,
and gic_update is called only if BASEPRI has changed.

http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.dui0552a/CHDBIBGJ.html

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 hw/intc/arm_gic.c                |  3 ++-
 hw/intc/armv7m_nvic.c            | 14 ++++++++++++++
 include/hw/intc/arm_gic_common.h | 10 ++++++++++
 target-arm/cpu.h                 |  1 +
 target-arm/helper.c              |  8 ++++++--
 5 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index b30cc91..1917390 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -102,7 +102,8 @@ void gic_update(GICState *s)
 
         irq_level = fiq_level = 0;
 
-        if (best_prio < s->priority_mask[cpu]) {
+        if (best_prio < s->priority_mask[cpu] &&
+                            (s->basepri == 0 || best_prio < s->basepri)) {
             s->current_pending[cpu] = best_irq;
             if (best_prio < s->running_priority[cpu]) {
                 int group = GIC_TEST_GROUP(best_irq, cm);
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 06d8db6..e4cf3a7 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -153,6 +153,19 @@ void armv7m_nvic_complete_irq(void *opaque, int irq)
     gic_complete_irq(&s->gic, 0, irq, MEMTXATTRS_UNSPECIFIED);
 }
 
+
+/* Re-evaluate interrupts if BASEPRI register has changed */
+void armv7m_nvic_basepri_write(void *opaque, uint32_t val)
+{
+    nvic_state *nv = (nvic_state *)opaque;
+    GICState *s = &nv->gic;
+
+    if (val != s->basepri) {
+        s->basepri = val;
+        gic_update(s);
+    }
+}
+
 static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
 {
     ARMCPU *cpu;
@@ -486,6 +499,7 @@ static void armv7m_nvic_reset(DeviceState *dev)
     s->gic.priority_mask[0] = 0x100;
     /* The NVIC as a whole is always enabled. */
     s->gic.ctlr = 1;
+    s->gic.basepri = 0;
     systick_reset(s);
 }
 
diff --git a/include/hw/intc/arm_gic_common.h b/include/hw/intc/arm_gic_common.h
index f4c349a..c132555 100644
--- a/include/hw/intc/arm_gic_common.h
+++ b/include/hw/intc/arm_gic_common.h
@@ -100,6 +100,16 @@ typedef struct GICState {
 
     uint32_t num_cpu;
 
+    /* BASEPRI register:
+     * The processor does not process any exception with a priority value
+     * greater than or equal to BASEPRI.
+     *
+     * 0x00 = no effect
+     * Nonzero = defines the base priority for exception processing.
+     */
+
+    uint32_t basepri;
+
     MemoryRegion iomem; /* Distributor */
     /* This is just so we can have an opaque pointer which identifies
      * both this GIC and which CPU interface we should be accessing.
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index ca5c849..c96bd87 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1271,6 +1271,7 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
 void armv7m_nvic_set_pending(void *opaque, int irq);
 int armv7m_nvic_acknowledge_irq(void *opaque);
 void armv7m_nvic_complete_irq(void *opaque, int irq);
+void armv7m_nvic_basepri_write(void *opaque, uint32_t val);
 
 /* Interface for defining coprocessor registers.
  * Registers are defined in tables of arm_cp_reginfo structs
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 25b15dc..beb6a80 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -8302,12 +8302,16 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t reg, uint32_t val)
         }
         break;
     case 17: /* BASEPRI */
-        env->v7m.basepri = val & 0xff;
+        val &= 0xff;
+        env->v7m.basepri = val;
+        armv7m_nvic_basepri_write(env->nvic, val);
         break;
     case 18: /* BASEPRI_MAX */
         val &= 0xff;
-        if (val != 0 && (val < env->v7m.basepri || env->v7m.basepri == 0))
+        if (val != 0 && (val < env->v7m.basepri || env->v7m.basepri == 0)) {
             env->v7m.basepri = val;
+            armv7m_nvic_basepri_write(env->nvic, val);
+        }
         break;
     case 19: /* FAULTMASK */
         if (val & 1) {
-- 
2.7.4

