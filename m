Received: by 10.25.150.194 with SMTP id y185csp1026756lfd;
        Mon, 14 Nov 2016 06:32:15 -0800 (PST)
X-Received: by 10.98.53.199 with SMTP id c190mr36438092pfa.63.1479133935039;
        Mon, 14 Nov 2016 06:32:15 -0800 (PST)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d124si22421151pga.215.2016.11.14.06.32.14;
        Mon, 14 Nov 2016 06:32:15 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752822AbcKNOcM (ORCPT <rfc822;xinliang.liu@linaro.org>
        + 7 others); Mon, 14 Nov 2016 09:32:12 -0500
Received: from mx2.suse.de ([195.135.220.15]:57068 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751971AbcKNOcI (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 14 Nov 2016 09:32:08 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id CB18DAC48;
        Mon, 14 Nov 2016 14:32:06 +0000 (UTC)
From:   Alexander Graf <agraf@suse.de>
To:     QEMU Developers <qemu-devel@nongnu.org>
Cc:     Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: [PATCH RFC v2 2/2] ARM: KVM: Enable in-kernel timers with user space gic
Date:   Mon, 14 Nov 2016 15:32:15 +0100
Message-Id: <1479133935-63848-3-git-send-email-agraf@suse.de>
X-Mailer: git-send-email 1.8.5.6
In-Reply-To: <1479133935-63848-1-git-send-email-agraf@suse.de>
References: <1479133935-63848-1-git-send-email-agraf@suse.de>
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Iz9IiKmaX9HM

When running with KVM enabled, you can choose between emulating the
gic in kernel or user space. If the kernel supports in-kernel virtualization
of the interrupt controller, it will default to that. If not, if will
default to user space emulation.

Unfortunately when running in user mode gic emulation, we miss out on
timer events which are only available from kernel space. This patch leverages
the new kernel/user space pending line synchronization for those timer events.

Signed-off-by: Alexander Graf <agraf@suse.de>

---

rfc1 -> rfc2:

  - use local variable for ARM_CPU
  - remove bear trap
  - move timer warning to gic device
---
 hw/intc/arm_gic.c    |  7 +++++++
 include/sysemu/kvm.h | 11 +++++++++++
 kvm-all.c            |  5 +++++
 kvm-stub.c           |  5 +++++
 target-arm/cpu.h     |  3 +++
 target-arm/kvm.c     | 20 ++++++++++++++++++++
 6 files changed, 51 insertions(+)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 521aac3..1f3aacf 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -25,6 +25,7 @@
 #include "qom/cpu.h"
 #include "qemu/log.h"
 #include "trace.h"
+#include "sysemu/kvm.h"
 
 //#define DEBUG_GIC
 
@@ -1428,6 +1429,12 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (kvm_enabled() && !kvm_arm_supports_timer()) {
+            error_setg(errp, "KVM with user space irqchip only works when the "
+                             "host kernel supports KVM_CAP_ARM_TIMER");
+            return;
+    }
+
     /* This creates distributor and main CPU interface (s->cpuiomem[0]) */
     gic_init_irqs_and_mmio(s, gic_set_irq, gic_ops);
 
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index df67cc0..9715fee 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -227,6 +227,17 @@ int kvm_init_vcpu(CPUState *cpu);
 int kvm_cpu_exec(CPUState *cpu);
 int kvm_destroy_vcpu(CPUState *cpu);
 
+/**
+ * kvm_arm_supports_timer
+ *
+ * Not all KVM implementations support notifications for the CP15 timers to
+ * user space. This function indicates whether the current KVM implementation
+ * does support them.
+ *
+ * Returns: true if KVM supports using ARM core timers from user space
+ */
+bool kvm_arm_supports_timer(void);
+
 #ifdef NEED_CPU_H
 #include "cpu.h"
 
diff --git a/kvm-all.c b/kvm-all.c
index 330219e..8d4696c 100644
--- a/kvm-all.c
+++ b/kvm-all.c
@@ -2194,6 +2194,11 @@ int kvm_has_intx_set_mask(void)
     return kvm_state->intx_set_mask;
 }
 
+bool kvm_arm_supports_timer(void)
+{
+    return kvm_check_extension(kvm_state, KVM_CAP_ARM_TIMER);
+}
+
 #ifdef KVM_CAP_SET_GUEST_DEBUG
 struct kvm_sw_breakpoint *kvm_find_sw_breakpoint(CPUState *cpu,
                                                  target_ulong pc)
diff --git a/kvm-stub.c b/kvm-stub.c
index b1b6b96..a4d408b 100644
--- a/kvm-stub.c
+++ b/kvm-stub.c
@@ -157,4 +157,9 @@ bool kvm_has_free_slot(MachineState *ms)
 {
     return false;
 }
+
+bool kvm_arm_supports_timer(void)
+{
+    return false;
+}
 #endif
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index ca5c849..2c379a3 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -659,6 +659,9 @@ struct ARMCPU {
 
     ARMELChangeHook *el_change_hook;
     void *el_change_hook_opaque;
+
+    /* Used to synchronize KVM and QEMU timer levels */
+    uint8_t timer_irq_level;
 };
 
 static inline ARMCPU *arm_env_get_cpu(CPUARMState *env)
diff --git a/target-arm/kvm.c b/target-arm/kvm.c
index c00b94e..c5f0d37 100644
--- a/target-arm/kvm.c
+++ b/target-arm/kvm.c
@@ -527,6 +527,26 @@ void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)
 
 MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
 {
+    ARMCPU *cpu;
+    bool vtimer_high;
+
+    if (kvm_irqchip_in_kernel()) {
+        /*
+         * We only need to sync timer states with user-space interrupt
+         * controllers, so return early and save cycles if we don't.
+         */
+        return MEMTXATTRS_UNSPECIFIED;
+    }
+
+    cpu = ARM_CPU(cs);
+
+    /* Synchronize our internal vtimer irq line with the kvm one */
+    if (run->s.regs.timer_irq_level != cpu->timer_irq_level) {
+        vtimer_high = run->s.regs.timer_irq_level & KVM_ARM_TIMER_VTIMER;
+        qemu_set_irq(cpu->gt_timer_outputs[GTIMER_VIRT], vtimer_high ? 1 : 0);
+        cpu->timer_irq_level = run->s.regs.timer_irq_level;
+    }
+
     return MEMTXATTRS_UNSPECIFIED;
 }
 
-- 
1.8.5.6

