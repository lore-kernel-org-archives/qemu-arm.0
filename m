Received: by 10.80.166.35 with SMTP id d32csp1781247edc;
        Sat, 29 Oct 2016 14:10:49 -0700 (PDT)
X-Received: by 10.99.160.17 with SMTP id r17mr30109297pge.49.1477775449077;
        Sat, 29 Oct 2016 14:10:49 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id t90si18468406pfk.190.2016.10.29.14.10.48;
        Sat, 29 Oct 2016 14:10:49 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753187AbcJ2VKr (ORCPT <rfc822;xinliang.liu@linaro.org>
        + 7 others); Sat, 29 Oct 2016 17:10:47 -0400
Received: from mx2.suse.de ([195.135.220.15]:41419 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752607AbcJ2VKp (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sat, 29 Oct 2016 17:10:45 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 20CBCAB9D;
        Sat, 29 Oct 2016 21:10:42 +0000 (UTC)
From:   Alexander Graf <agraf@suse.de>
To:     qemu-devel@nongnu.org
Cc:     peter.maydell@linaro.org, pbonzini@redhat.com, kvm@vger.kernel.org,
        qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu
Subject: [RFC 2/2] ARM: KVM: Enable in-kernel timers with user space gic
Date:   Sat, 29 Oct 2016 23:10:49 +0200
Message-Id: <1477775449-115472-2-git-send-email-agraf@suse.de>
X-Mailer: git-send-email 1.8.5.6
In-Reply-To: <1477775449-115472-1-git-send-email-agraf@suse.de>
References: <1477775449-115472-1-git-send-email-agraf@suse.de>
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: zPIU+VrwvsAz

When running with KVM enabled, you can choose between emulating the
gic in kernel or user space. If the kernel supports in-kernel virtualization
of the interrupt controller, it will default to that. If not, if will
default to user space emulation.

Unfortunately when running in user mode gic emulation, we miss out on
timer events which are only available from kernel space. This patch leverages
the new kernel/user space pending line synchronization for those timer events.

Signed-off-by: Alexander Graf <agraf@suse.de>
---
 hw/arm/virt.c    | 10 ++++++++++
 target-arm/cpu.h |  3 +++
 target-arm/kvm.c | 19 +++++++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 070bbf8..8ac81e3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -622,6 +622,16 @@ static void create_gic(VirtBoardInfo *vbi, qemu_irq *pic, int type,
     } else if (type == 2) {
         create_v2m(vbi, pic);
     }
+
+#ifdef CONFIG_KVM
+    if (kvm_enabled() && !kvm_irqchip_in_kernel()) {
+        if (!kvm_check_extension(kvm_state, KVM_CAP_ARM_TIMER)) {
+            error_report("KVM with user space irqchip only works when the "
+                         "host kernel supports KVM_CAP_ARM_TIMER");
+            exit(1);
+        }
+    }
+#endif
 }
 
 static void create_uart(const VirtBoardInfo *vbi, qemu_irq *pic, int uart,
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 19d967b..7686082 100644
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
index c00b94e..0d8b642 100644
--- a/target-arm/kvm.c
+++ b/target-arm/kvm.c
@@ -527,6 +527,25 @@ void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)
 
 MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
 {
+    ARMCPU *cpu;
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
+        qemu_set_irq(ARM_CPU(cs)->gt_timer_outputs[GTIMER_VIRT],
+                     run->s.regs.timer_irq_level & KVM_ARM_TIMER_VTIMER);
+        cpu->timer_irq_level = run->s.regs.timer_irq_level;
+    }
+
     return MEMTXATTRS_UNSPECIFIED;
 }
 
-- 
1.8.5.6

