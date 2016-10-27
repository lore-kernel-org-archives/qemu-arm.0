Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id ya1sm9036453wjb.23.2016.10.27.08.19.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Oct 2016 08:19:55 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 85FFB3E04D2;
	Thu, 27 Oct 2016 16:11:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org,
	mttcg@listserver.greensocs.com,
	fred.konrad@greensocs.com,
	a.rigo@virtualopensystems.com,
	cota@braap.org,
	bobby.prani@gmail.com,
	nikunj@linux.vnet.ibm.com,
	mark.burton@greensocs.com,
	jan.kiszka@siemens.com,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	peter.maydell@linaro.org,
	claudio.fontana@huawei.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM cores)
Subject: [PATCH v5 31/33] target-arm: ensure BQL taken for ARM_CP_IO register access
Date: Thu, 27 Oct 2016 16:10:28 +0100
Message-Id: <20161027151030.20863-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20161027151030.20863-1-alex.bennee@linaro.org>
References: <20161027151030.20863-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: X41f+JFo9JWF

Most ARMCPRegInfo structures just allow updating of the CPU field.
However some have more complex operations that *may* be have cross vCPU
effects therefor need to be serialised. The most obvious examples at the
moment are things that affect the GICv3 IRQ controller. To avoid
applying this requirement to all registers with custom access functions
we check for if the type is marked ARM_CP_IO.

By default all MMIO access to devices already takes the BQL to serialise
hardware emulation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c |  3 +++
 target-arm/op_helper.c    | 39 +++++++++++++++++++++++++++++++++++----
 2 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index bca30c4..8ea4b5b 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -13,6 +13,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/main-loop.h"
 #include "trace.h"
 #include "gicv3_internal.h"
 #include "cpu.h"
@@ -128,6 +129,8 @@ void gicv3_cpuif_update(GICv3CPUState *cs)
     ARMCPU *cpu = ARM_CPU(cs->cpu);
     CPUARMState *env = &cpu->env;
 
+    g_assert(qemu_mutex_iothread_locked());
+
     trace_gicv3_cpuif_update(gicv3_redist_affid(cs), cs->hppi.irq,
                              cs->hppi.grp, cs->hppi.prio);
 
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index cd94216..4f0c754 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -17,6 +17,7 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "internals.h"
@@ -734,28 +735,58 @@ void HELPER(set_cp_reg)(CPUARMState *env, void *rip, uint32_t value)
 {
     const ARMCPRegInfo *ri = rip;
 
-    ri->writefn(env, ri, value);
+    if (ri->type & ARM_CP_IO) {
+        qemu_mutex_lock_iothread();
+        ri->writefn(env, ri, value);
+        qemu_mutex_unlock_iothread();
+    } else {
+        ri->writefn(env, ri, value);
+    }
 }
 
 uint32_t HELPER(get_cp_reg)(CPUARMState *env, void *rip)
 {
     const ARMCPRegInfo *ri = rip;
+    uint32_t res;
 
-    return ri->readfn(env, ri);
+    if (ri->type & ARM_CP_IO) {
+        qemu_mutex_lock_iothread();
+        res = ri->readfn(env, ri);
+        qemu_mutex_unlock_iothread();
+    } else {
+        res = ri->readfn(env, ri);
+    }
+
+    return res;
 }
 
 void HELPER(set_cp_reg64)(CPUARMState *env, void *rip, uint64_t value)
 {
     const ARMCPRegInfo *ri = rip;
 
-    ri->writefn(env, ri, value);
+    if (ri->type & ARM_CP_IO) {
+        qemu_mutex_lock_iothread();
+        ri->writefn(env, ri, value);
+        qemu_mutex_unlock_iothread();
+    } else {
+        ri->writefn(env, ri, value);
+    }
 }
 
 uint64_t HELPER(get_cp_reg64)(CPUARMState *env, void *rip)
 {
     const ARMCPRegInfo *ri = rip;
+    uint64_t res;
+
+    if (ri->type & ARM_CP_IO) {
+        qemu_mutex_lock_iothread();
+        res = ri->readfn(env, ri);
+        qemu_mutex_unlock_iothread();
+    } else {
+        res = ri->readfn(env, ri);
+    }
 
-    return ri->readfn(env, ri);
+    return res;
 }
 
 void HELPER(msr_i_pstate)(CPUARMState *env, uint32_t op, uint32_t imm)
-- 
2.10.1
