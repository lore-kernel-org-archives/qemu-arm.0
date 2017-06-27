Received: by 10.25.227.6 with SMTP id a6csp1748134lfh;
        Tue, 27 Jun 2017 06:08:24 -0700 (PDT)
X-Received: by 10.84.132.2 with SMTP id 2mr5830465ple.190.1498568904682;
        Tue, 27 Jun 2017 06:08:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498568904; cv=none;
        d=google.com; s=arc-20160816;
        b=FrpYINBuOVAmsYdoSY4TFLNZsY/I5krq0X6gmXnV4ICQTw2mLZSaaB9xgbZrypOLRm
         C+PcFCyu1Jb6uldFz1zLPbxyURQho8tbcRQ2hDK0zBo38eAQkjjZKup0UerUJbMBewZT
         d/W66vN1oKC41f86t/h4NoHubweztaZLe26uC+dxY5ql8lzrMa4UGi8wKqTZRY4v1/FZ
         gUgJcy633Y2BjHoUzZNxRYSKqIH/crrYNDrM+CyBblZ2zsM5zY9wOPHB6eC60mkbmpnk
         fJZzq/S8yn5UoDb2s5GVK6cTInQz9AjdeESQvWRGYQJmHn6UMPpN53c5jAV/hxN2Coh6
         yGOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=nCk6Q3NGWifuZMiVqQf3z7FRbcZXaOO0mjCclZeSBsY=;
        b=nLCVGkKNsDtREV7+WcLtFRhfipcGBEEaG6O9oXEDt3+uHtr8nLFKWNWkYvailFz8R6
         zW4rjsnG2hMMKRYw/htEtbDGwkNs3ibcuxX/VBD3GR9gjg/ptAp5O2qnQBRzxYc12FxK
         rIiBntIgVgWPeYUQI0JExXs/o2wL66llUoxLai15whpcXWeR+FHeRStNFHeqYQvJ1pfW
         QjW0hrRwXJC+IDLZcOBztcgyelShdRb44UBvWMBiYZgEsztc1UT5HEq8cYctgkPtX3qs
         bnxITmbCGyS2tIxm6dersSGoSlz9de5urRjSQibFTTOzffItQEGLhtRMW0kryOz0/hNR
         wM7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id e5si1901313pgk.350.2017.06.27.06.08.24;
        Tue, 27 Jun 2017 06:08:24 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752694AbdF0NIW (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Tue, 27 Jun 2017 09:08:22 -0400
Received: from mx2.suse.de ([195.135.220.15]:37478 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751453AbdF0NIV (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 27 Jun 2017 09:08:21 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 07B1FAB9D;
        Tue, 27 Jun 2017 13:08:20 +0000 (UTC)
From:   Alexander Graf <agraf@suse.de>
To:     qemu-devel@nongnu.org
Cc:     Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
        cdall@linaro.org, qemu-arm@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Andrew Jones <drjones@redhat.com>
Subject: [PATCH v2] ARM: KVM: Enable in-kernel timers with user space gic
Date:   Tue, 27 Jun 2017 15:08:43 +0200
Message-Id: <1498568923-115764-1-git-send-email-agraf@suse.de>
X-Mailer: git-send-email 1.8.5.6
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: jm5LC3BLNLZr

When running with KVM enabled, you can choose between emulating the
gic in kernel or user space. If the kernel supports in-kernel virtualization
of the interrupt controller, it will default to that. If not, if will
default to user space emulation.

Unfortunately when running in user mode gic emulation, we miss out on
interrupt events which are only available from kernel space, such as the timer.
This patch leverages the new kernel/user space pending line synchronization for
timer events. It does not handle PMU events yet.

Signed-off-by: Alexander Graf <agraf@suse.de>

---

v1 -> v2:

  - whitespace fixes
  - use !! to determine whether bit is set
  - call in-kernel device IRQs out by their name everywhere
---
 accel/kvm/kvm-all.c    |  5 +++++
 accel/stubs/kvm-stub.c |  5 +++++
 hw/intc/arm_gic.c      |  7 +++++++
 include/sysemu/kvm.h   | 11 +++++++++++
 target/arm/cpu.h       |  3 +++
 target/arm/kvm.c       | 51 ++++++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 82 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 75feffa..ade32ea 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2285,6 +2285,11 @@ int kvm_has_intx_set_mask(void)
     return kvm_state->intx_set_mask;
 }
 
+bool kvm_arm_supports_user_irq(void)
+{
+    return kvm_check_extension(kvm_state, KVM_CAP_ARM_USER_IRQ);
+}
+
 #ifdef KVM_CAP_SET_GUEST_DEBUG
 struct kvm_sw_breakpoint *kvm_find_sw_breakpoint(CPUState *cpu,
                                                  target_ulong pc)
diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index ef0c734..3965c52 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -155,4 +155,9 @@ void kvm_init_cpu_signals(CPUState *cpu)
 {
     abort();
 }
+
+bool kvm_arm_supports_user_irq(void)
+{
+    return false;
+}
 #endif
diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index b305d90..5a0e2a3 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -25,6 +25,7 @@
 #include "qom/cpu.h"
 #include "qemu/log.h"
 #include "trace.h"
+#include "sysemu/kvm.h"
 
 /* #define DEBUG_GIC */
 
@@ -1412,6 +1413,12 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (kvm_enabled() && !kvm_arm_supports_user_irq()) {
+        error_setg(errp, "KVM with user space irqchip only works when the "
+                         "host kernel supports KVM_CAP_ARM_USER_IRQ");
+        return;
+    }
+
     /* This creates distributor and main CPU interface (s->cpuiomem[0]) */
     gic_init_irqs_and_mmio(s, gic_set_irq, gic_ops);
 
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 1e91613..9f11fc0 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -227,6 +227,17 @@ int kvm_init_vcpu(CPUState *cpu);
 int kvm_cpu_exec(CPUState *cpu);
 int kvm_destroy_vcpu(CPUState *cpu);
 
+/**
+ * kvm_arm_supports_user_irq
+ *
+ * Not all KVM implementations support notifications for kernel generated
+ * interrupt events to user space. This function indicates whether the current
+ * KVM implementation does support them.
+ *
+ * Returns: true if KVM supports using kernel generated IRQs from user space
+ */
+bool kvm_arm_supports_user_irq(void);
+
 #ifdef NEED_CPU_H
 #include "cpu.h"
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 16a1e59..102c58a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -706,6 +706,9 @@ struct ARMCPU {
     void *el_change_hook_opaque;
 
     int32_t node_id; /* NUMA node this CPU belongs to */
+
+    /* Used to synchronize KVM and QEMU in-kernel device levels */
+    uint8_t device_irq_level;
 };
 
 static inline ARMCPU *arm_env_get_cpu(CPUARMState *env)
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 4555468..f750f94 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -174,6 +174,12 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
      */
     kvm_async_interrupts_allowed = true;
 
+    /*
+     * PSCI wakes up secondary cores, so we always need to
+     * have vCPUs waiting in kernel space
+     */
+    kvm_halt_in_kernel_allowed = true;
+
     cap_has_mp_state = kvm_check_extension(s, KVM_CAP_MP_STATE);
 
     type_register_static(&host_arm_cpu_type_info);
@@ -528,6 +534,51 @@ void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)
 
 MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
 {
+    ARMCPU *cpu;
+    uint32_t switched_level;
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
+    /* Synchronize our internal timer irq lines with the kvm ones */
+    if (run->s.regs.device_irq_level != cpu->device_irq_level) {
+        switched_level = cpu->device_irq_level ^ run->s.regs.device_irq_level;
+
+        qemu_mutex_lock_iothread();
+
+        if (switched_level & KVM_ARM_DEV_EL1_VTIMER) {
+            qemu_set_irq(cpu->gt_timer_outputs[GTIMER_VIRT],
+                         !!(run->s.regs.device_irq_level &
+                            KVM_ARM_DEV_EL1_VTIMER));
+            switched_level &= ~KVM_ARM_DEV_EL1_VTIMER;
+        }
+
+        if (switched_level & KVM_ARM_DEV_EL1_PTIMER) {
+            qemu_set_irq(cpu->gt_timer_outputs[GTIMER_PHYS],
+                         !!(run->s.regs.device_irq_level &
+                            KVM_ARM_DEV_EL1_PTIMER));
+            switched_level &= ~KVM_ARM_DEV_EL1_PTIMER;
+        }
+
+        /* XXX PMU IRQ is missing */
+
+        if (switched_level) {
+            qemu_log_mask(LOG_UNIMP, "%s: unhandled in-kernel device IRQ %x\n",
+                          __func__, switched_level);
+        }
+
+        /* We also mark unknown levels as processed to not waste cycles */
+        cpu->device_irq_level = run->s.regs.device_irq_level;
+        qemu_mutex_unlock_iothread();
+    }
+
     return MEMTXATTRS_UNSPECIFIED;
 }
 
-- 
1.8.5.6
