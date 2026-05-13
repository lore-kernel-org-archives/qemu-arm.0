Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A343BCD37AC
	for <qemu-arm@archiver.kernel.org>; Wed, 13 May 2026 02:21:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMzE9-00030G-3U; Tue, 12 May 2026 22:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scottjgo@gmail.com>)
 id 1wMzE4-0002zg-4d
 for qemu-arm@nongnu.org; Tue, 12 May 2026 22:21:33 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <scottjgo@gmail.com>)
 id 1wMzDy-0003vw-Dp
 for qemu-arm@nongnu.org; Tue, 12 May 2026 22:21:29 -0400
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-5102582e23eso46573371cf.1
 for <qemu-arm@nongnu.org>; Tue, 12 May 2026 19:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778638885; x=1779243685; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7LFOWxct70x8Tje3bBPwmBMMatq0/11Pr+k73g4E+u0=;
 b=kcJMrl/nCqTuQdZiRJCAHSM5X2vdUSo/Ql/5zFkL6HdmgmBCzqdW1Zeik9HO/Ra7XD
 YXopQa+svJHF547O44iUiwCmpJAqKLq/OmYk14xBJ5mGLyU/9Ef9gT5BUFL1JuuVov87
 W8YcC3e/2o/5xcKo7cU3ny3sx/qPwm3j7BwL9+Q6DJNV8h/3ZLzPofeyNQr83Jz1vABd
 j3f+lHYXyoNkDzAlwKaakdiGX+9qn+Q5GFhDMK6hJQ40+FroLC6p6LJgxaLGwqlr7TAn
 wBsPBFCTu7jAvd2biw2S0cuLfdSwhj+ucFxL0xsXdkVF9OBxKL8PFHkiwfeanywXDyhA
 K24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778638885; x=1779243685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7LFOWxct70x8Tje3bBPwmBMMatq0/11Pr+k73g4E+u0=;
 b=X0W3qu6WQH1RqFeQuu2K3sGTb3cA8OIEHP86Oo7rG/FfHf3Kgku7t+jVybGWyJnX3d
 /0LMtKdTlXps+/YJdJPT5qODmiF0RB25TqKL/w98J1/6p8GTdi++K0D7g5v/KqmTl8mP
 JSX3Jv9atYCmvKXLMeREuEL/6oecJFpMza1sjHW1HksCfF9DaEJF7oR/y4uQZ67DKBzi
 XWYHeKbqikvAoMJTuUVZfoLwmRvSmYDYZCNczeFjDilyZi6ul/S1nDes7CnI+KjK5AbY
 fWEG0SZTdEqDk1B4Y1VoJCbVj61JUUUH/qKmFdmq23R3t1CEINgd6PFak12kA5T68QOI
 rw1g==
X-Forwarded-Encrypted: i=1;
 AFNElJ9YmDzjtPkk16HhIJO30tYUceu8J0ApJ0K5isslJAKQVagMQblemC8nC/i9Wq6qeA9f8y6F0JGMvQ==@nongnu.org
X-Gm-Message-State: AOJu0YzOF+l1qnDhSYn1HcCol/0dsCr6eIOh40DwoXsokmQGvVFbTNo+
 +ha3V9tRS8j/C0eixByqalAUyaQKcgIYavchr1zycoUTYbLWwkGVhYPV
X-Gm-Gg: Acq92OHy6yadO9g0NdLwLl8WIDnzlk3m28xGeEWW4vF8WFTamMb6G5cbgUVyySJ7juo
 MSDzp0euy7vU5cfJY+GELW8deEQv836exoxHXolk2lVKy9l65XSQwE4tSGAXxXI7jsFRQu+S+Pm
 5cFIj175FDfvBmbuBVfSw6bcnTRs9l0CxjK30Teprb8uz42V1L5oraMSr8LB446fszfIPipdV09
 CKxoxWo/e87v/b9/Tjy84jDqlPASqkFboQrwytN/LXQZO82baJv1Idr0XjTQMYiUbs/mdNZhVrv
 P/JiSkN3kHVm5jrEEMZl/ZmyBAd+Icf79UJZsBIoM8ztt57W/s/R6v8p3cDc0whKBdQlr70IHk6
 FjsAkQJ8dARi1kCspP/7SOtRTuL5Rj6tGC+itHxV6U8l2tN9i18wD6FhnpGcCrhBelojKHpgaX/
 10vNwp4fFWS0aJFG3eJb2N617vtU/kaHjummbafoKCjyOl0/fKPe4smx1X0hyFPop7/Wc0Yeojw
 n19HSQkUiyl
X-Received: by 2002:a05:622a:24f:b0:515:6c6b:48a0 with SMTP id
 d75a77b69052e-5162f55f9afmr18451321cf.28.1778638884612; 
 Tue, 12 May 2026 19:21:24 -0700 (PDT)
Received: from Mac.lan ([2603:7000:4df0:8300:fdb5:4a2a:97d0:addf])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5148e830ddfsm134079951cf.27.2026.05.12.19.21.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 May 2026 19:21:23 -0700 (PDT)
From: "Scott J. Goldman" <scottjgo@gmail.com>
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, "Scott J. Goldman" <scottjgo@gmail.com>
Subject: [PATCH v11.1+ v4] target/arm/hvf: Fix WFI halting to stop idle vCPU
 spinning
Date: Tue, 12 May 2026 22:21:09 -0400
Message-ID: <20260513022109.14107-1-scottjgo@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <E8468087-647B-45B5-AF4E-85DD15A6D35C@unpredictable.fr>
References: <E8468087-647B-45B5-AF4E-85DD15A6D35C@unpredictable.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=scottjgo@gmail.com; helo=mail-qt1-x830.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Commit b5f8f77271 ("accel/hvf: Implement WFI without using pselect()")
changed hvf_wfi() from blocking the vCPU thread with pselect() to
returning EXCP_HLT, intending QEMU's main event loop to handle the
idle wait. However, cpu->halted was never set, so cpu_thread_is_idle()
always returns false and the vCPU thread spins at 100% CPU per core
while the guest is idle.

Fix this by:

1. Setting cpu->halted = 1 in hvf_wfi() so the vCPU thread sleeps on
   halt_cond in qemu_process_cpu_events().

2. Arming a per-vCPU QEMU_CLOCK_VIRTUAL timer to fire when the guest's
   virtual timer (CNTV_CVAL_EL0) would expire. This is necessary
   because HVF only delivers HV_EXIT_REASON_VTIMER_ACTIVATED during
   hv_vcpu_run(), which is not called while the CPU is halted. The
   timer callback mirrors the VTIMER_ACTIVATED handler: it raises the
   vtimer IRQ through the GIC and marks vtimer_masked, causing the
   interrupt delivery chain to wake the vCPU via qemu_cpu_kick().

3. Clearing cpu->halted in hvf_arch_vcpu_exec() when cpu_has_work()
   indicates a pending interrupt, and cancelling the WFI timer.

4. Re-arming the WFI timer from hvf_vm_state_change() on the resume
   transition for any halted vCPU, since the QEMUTimer is per-instance
   state and is not migrated. After cpu_synchronize_all_states() the
   migrated vtimer state is mirrored in env, so we can read CNTV_CTL
   and CNTV_CVAL from there. If the vtimer has already expired by the
   time the destination resumes, hvf_wfi_timer_cb() is invoked
   directly so the halted vCPU is woken up.

All wfi_timer handling (allocation, arming, deletion, and the resume
re-arm) is gated on !hvf_irqchip_in_kernel(): with the Apple in-kernel
vGIC, HVF owns the vtimer and delivers wake-ups itself.

Fixes: b5f8f77271 ("accel/hvf: Implement WFI without using pselect()")
Signed-off-by: Scott J. Goldman <scottjgo@gmail.com>
---
v4: Gate all wfi_timer handling on !hvf_irqchip_in_kernel() (per
    Mohamed's review). This version is only intended for the `master`
    branch, while v3 can be applied to the 11.0 stable tree.
v3: Re-arm the wfi_timer from hvf_vm_state_change() so migration restore
    wakes a halted vCPU.

 include/system/hvf_int.h |   1 +
 target/arm/hvf/hvf.c     | 140 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 140 insertions(+), 1 deletion(-)

diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
index ad7d375109..d5eaf26dda 100644
--- a/include/system/hvf_int.h
+++ b/include/system/hvf_int.h
@@ -48,6 +48,7 @@ struct AccelCPUState {
     hv_vcpu_exit_t *exit;
     bool vtimer_masked;
     bool guest_debug_enabled;
+    struct QEMUTimer *wfi_timer;
 #endif
 };
 
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 5a1718f7f9..0666175973 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -29,6 +29,7 @@
 #include "hw/core/irq.h"
 #include "hw/arm/virt.h"
 #include "qemu/main-loop.h"
+#include "qemu/timer.h"
 #include "system/cpus.h"
 #include "arm-powerctl.h"
 #include "target/arm/cpu.h"
@@ -308,6 +309,8 @@ void hvf_arm_init_debug(void)
 #define TMR_CTL_IMASK   (1 << 1)
 #define TMR_CTL_ISTATUS (1 << 2)
 
+static void hvf_wfi_timer_cb(void *opaque);
+
 static uint32_t chosen_ipa_bit_size;
 
 typedef struct HVFVTimer {
@@ -1296,6 +1299,11 @@ void hvf_arch_vcpu_destroy(CPUState *cpu)
 {
     hv_return_t ret;
 
+    if (!hvf_irqchip_in_kernel()) {
+        timer_free(cpu->accel->wfi_timer);
+        cpu->accel->wfi_timer = NULL;
+    }
+
     ret = hv_vcpu_destroy(cpu->accel->fd);
     assert_hvf_ok(ret);
 }
@@ -1494,6 +1502,11 @@ int hvf_arch_init_vcpu(CPUState *cpu)
                               arm_cpu->isar.idregs[ID_AA64MMFR0_EL1_IDX]);
     assert_hvf_ok(ret);
 
+    if (!hvf_irqchip_in_kernel()) {
+        cpu->accel->wfi_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                             hvf_wfi_timer_cb, cpu);
+    }
+
     aarch64_add_sme_properties(OBJECT(cpu));
     return 0;
 }
@@ -2201,6 +2214,62 @@ static uint64_t hvf_vtimer_val_raw(void)
     return mach_absolute_time() - hvf_state->vtimer_offset;
 }
 
+static void hvf_wfi_timer_cb(void *opaque)
+{
+    CPUState *cpu = opaque;
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+
+    /*
+     * vtimer expired while the CPU was halted for WFI.
+     * Mirror HV_EXIT_REASON_VTIMER_ACTIVATED: raise the vtimer
+     * interrupt and mark as masked so hvf_sync_vtimer() will
+     * check and unmask when the guest handles it.
+     *
+     * The interrupt delivery chain (GIC -> cpu_interrupt ->
+     * qemu_cpu_kick) wakes the vCPU thread from halt_cond.
+     */
+    qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 1);
+    cpu->accel->vtimer_masked = true;
+}
+
+/*
+ * Arm a host-side QEMU_CLOCK_VIRTUAL timer to fire when the guest's
+ * vtimer (CNTV_CVAL_EL0) is scheduled to expire. HVF only delivers
+ * HV_EXIT_REASON_VTIMER_ACTIVATED during hv_vcpu_run(), which we won't
+ * call while the vCPU is halted, so we need this to wake the vCPU.
+ *
+ * QEMU_CLOCK_VIRTUAL pauses while the VM is stopped, which keeps the
+ * timer in lockstep with the guest's view of vtime across pause/resume.
+ *
+ * Caller must supply the current CNTV_CTL_EL0 and CNTV_CVAL_EL0 values,
+ * since the appropriate source (HVF vs. env) depends on context.
+ *
+ * Returns 0 if the timer was armed (or if the vtimer is disabled/masked
+ * and the vCPU should still halt waiting on another event), or -1 if
+ * the vtimer has already expired.
+ */
+static int hvf_arm_wfi_timer(CPUState *cpu, uint64_t ctl, uint64_t cval)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    uint64_t now;
+    int64_t delta_ns;
+
+    if (!(ctl & TMR_CTL_ENABLE) || (ctl & TMR_CTL_IMASK)) {
+        return 0;
+    }
+
+    now = hvf_vtimer_val_raw();
+    if (cval <= now) {
+        return -1;
+    }
+
+    delta_ns = muldiv64(cval - now, NANOSECONDS_PER_SECOND,
+                        arm_cpu->gt_cntfrq_hz);
+    timer_mod(cpu->accel->wfi_timer,
+              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + delta_ns);
+    return 0;
+}
+
 static int hvf_wfi(CPUState *cpu)
 {
     if (cpu_has_work(cpu)) {
@@ -2211,6 +2280,29 @@ static int hvf_wfi(CPUState *cpu)
         return 0;
     }
 
+    if (!hvf_irqchip_in_kernel()) {
+        uint64_t ctl, cval;
+        hv_return_t r;
+
+        /*
+         * Read the vtimer state directly from HVF. We're on the vCPU
+         * thread, just exited from hv_vcpu_run(), so HVF holds the
+         * authoritative values and env may be stale.
+         */
+        r = hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_CNTV_CTL_EL0,
+                                &ctl);
+        assert_hvf_ok(r);
+        r = hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_CNTV_CVAL_EL0,
+                                &cval);
+        assert_hvf_ok(r);
+
+        if (hvf_arm_wfi_timer(cpu, ctl, cval) < 0) {
+            /* vtimer already expired, don't halt */
+            return 0;
+        }
+    }
+
+    cpu->halted = 1;
     return EXCP_HLT;
 }
 
@@ -2509,7 +2601,13 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
     hv_return_t r;
 
     if (cpu->halted) {
-        return EXCP_HLT;
+        if (!cpu_has_work(cpu)) {
+            return EXCP_HLT;
+        }
+        cpu->halted = 0;
+        if (!hvf_irqchip_in_kernel()) {
+            timer_del(cpu->accel->wfi_timer);
+        }
     }
 
     flush_cpu_state(cpu);
@@ -2558,6 +2656,46 @@ static void hvf_vm_state_change(void *opaque, bool running, RunState state)
         /* Update vtimer offset on all CPUs */
         hvf_state->vtimer_offset = mach_absolute_time() - s->vtimer_val;
         cpu_synchronize_all_states();
+
+        /*
+         * After migration restore (or any resume), the wfi_timer is not
+         * scheduled on this QEMU instance, so re-arm it for any halted
+         * vCPU with a pending vtimer. For a non-migration resume the
+         * QEMU_CLOCK_VIRTUAL timer was already scheduled; recomputing the
+         * deadline produces the same value and is a harmless no-op.
+         *
+         * cpu_synchronize_all_states() above ensures env mirrors the
+         * authoritative vtimer state (whether that came from HVF or from
+         * the migration stream), so we can safely read it here from the
+         * iothread.
+         *
+         * Only applies when we own the wfi_timer; with an in-kernel vGIC
+         * the timer is never allocated and HVF handles vtimer wake-ups.
+         */
+        if (!hvf_irqchip_in_kernel()) {
+            CPUState *cpu;
+
+            CPU_FOREACH(cpu) {
+                ARMCPU *arm_cpu;
+                uint64_t ctl, cval;
+
+                if (!cpu->accel || !cpu->halted) {
+                    continue;
+                }
+
+                arm_cpu = ARM_CPU(cpu);
+                ctl = arm_cpu->env.cp15.c14_timer[GTIMER_VIRT].ctl;
+                cval = arm_cpu->env.cp15.c14_timer[GTIMER_VIRT].cval;
+
+                if (hvf_arm_wfi_timer(cpu, ctl, cval) < 0) {
+                    /*
+                     * vtimer already expired while we were paused; raise
+                     * the IRQ now so the halted vCPU wakes up.
+                     */
+                    hvf_wfi_timer_cb(cpu);
+                }
+            }
+        }
     } else {
         /* Remember vtimer value on every pause */
         s->vtimer_val = hvf_vtimer_val_raw();
-- 
2.50.1 (Apple Git-155)


