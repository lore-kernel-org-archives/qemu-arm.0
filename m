Received: by 10.25.15.197 with SMTP id 66csp1746488lfp;
        Mon, 26 Jun 2017 14:30:37 -0700 (PDT)
X-Received: by 10.99.247.83 with SMTP id f19mr2053646pgk.190.1498512637586;
        Mon, 26 Jun 2017 14:30:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498512637; cv=none;
        d=google.com; s=arc-20160816;
        b=OLIVFqePx55du7tooMT0xc3Uu8gQzJeo+dg+JiLaNf1bBaBvyGaEZ4l81m/PUEXGzx
         JiQfqQt8Rs+zNgHb96e0yXdfmghPS2tEWm4XLTKB/8PBifY3gNau8N6KVjO/FvChI2y7
         sw/HlnQALZoKoRptwOINzOUCFhnhL+iXmTeUfXtw8GV0L9DnbMn7cK1fiGHwteY61FeR
         N1iZ0VhiXb8DTaelh0n7OkgJwb7aLMQtvvb0RTSFBM0CPxY9hYwK5kmTnnFbYAiv4M7r
         VexHZUiG+KsWfR5pQEI58Ao1YrQFbeNlNdIL5O7s+i2b+hgGlZk6QXqY7oYswRkHfjql
         1dBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=WOKDhk3V5tKJVaBNsKLSUBiAaXay5rlNS+PADza9FVE=;
        b=vw7dypMd+1oyMOFcszctYWcaOVBk9yuwGeLJ4SYGeXVOlSPShOmf8xDSsAFUvFO68x
         PP1AnuytXhP+B5+usDZGo1Jzl9WTuxl4CS5IXfqg21O4tjOStBKXf1Ohwymdp6WmF39p
         w9sNHTpFpZVdtbOnkf1He03ExJ9ueu9Z9lCCeF9HklxGk6rz7Yl6IMz3vhGzL8H/kldj
         gQDP4ySoQ/hQHyyoqe4Q1+IR+ryhh3ADcQHjfzDiPI7Ig0O2wQccY+AYhU3szZXReX+0
         ynCi/yGljG6CApWHHoLXz5jafK5S8Gk5eoLrKIOQbHIQP57QS84IqO5ZNkNuHOfusXF3
         EyaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id n12si672614pgs.521.2017.06.26.14.30.37;
        Mon, 26 Jun 2017 14:30:37 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751493AbdFZVaf (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Mon, 26 Jun 2017 17:30:35 -0400
Received: from mx2.suse.de ([195.135.220.15]:42952 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751381AbdFZVae (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 26 Jun 2017 17:30:34 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 70566AC2F;
        Mon, 26 Jun 2017 21:30:33 +0000 (UTC)
From:   Alexander Graf <agraf@suse.de>
To:     qemu-devel@nongnu.org
Cc:     qemu-arm@nongnu.org, kvm@vger.kernel.org,
        Peter Maydell <peter.maydell@linaro.org>,
        Andrew Jones <drjones@redhat.com>, cdall@linaro.org,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] ARM: KVM: Enable in-kernel timers with user space gic
Date:   Mon, 26 Jun 2017 23:30:56 +0200
Message-Id: <1498512656-75289-1-git-send-email-agraf@suse.de>
X-Mailer: git-send-email 1.8.5.6
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: SbJN29a76wys

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
 accel/kvm/kvm-all.c    |  5 +++++
 accel/stubs/kvm-stub.c |  5 +++++
 hw/intc/arm_gic.c      |  7 +++++++
 include/sysemu/kvm.h   | 11 +++++++++++
 target/arm/cpu.h       |  3 +++
 target/arm/kvm.c       | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 80 insertions(+)

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
index b305d90..4ffd905 100644
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
+            error_setg(errp, "KVM with user space irqchip only works when the "
+                             "host kernel supports KVM_CAP_ARM_USER_IRQ");
+            return;
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
index 16a1e59..88ec3ee 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -706,6 +706,9 @@ struct ARMCPU {
     void *el_change_hook_opaque;
 
     int32_t node_id; /* NUMA node this CPU belongs to */
+
+    /* Used to synchronize KVM and QEMU timer levels */
+    uint8_t device_irq_level;
 };
 
 static inline ARMCPU *arm_env_get_cpu(CPUARMState *env)
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 4555468..29ee72d 100644
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
@@ -528,6 +534,49 @@ void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)
 
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
+                         run->s.regs.device_irq_level & KVM_ARM_DEV_EL1_VTIMER);
+            switched_level &= ~KVM_ARM_DEV_EL1_VTIMER;
+        }
+
+        if (switched_level & KVM_ARM_DEV_EL1_PTIMER) {
+            qemu_set_irq(cpu->gt_timer_outputs[GTIMER_PHYS],
+                         run->s.regs.device_irq_level & KVM_ARM_DEV_EL1_PTIMER);
+            switched_level &= ~KVM_ARM_DEV_EL1_PTIMER;
+        }
+
+        /* XXX PMU IRQ is missing */
+
+        if (switched_level) {
+            qemu_log_mask(LOG_UNIMP, "%s: unhandled device IRQ %x\n",
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
