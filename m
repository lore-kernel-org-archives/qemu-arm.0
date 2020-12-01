Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5992801lfb;
        Tue, 1 Dec 2020 00:22:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKvjzbUVMv9QD1Vcllu/9zKiYsdA8ARIlKeKREt973tCWZpznasdpoeckFOPc/460JvILq
X-Received: by 2002:a25:38c1:: with SMTP id f184mr1657385yba.41.1606810935676;
        Tue, 01 Dec 2020 00:22:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606810935; cv=none;
        d=google.com; s=arc-20160816;
        b=l2ge5Tao/Te1Fp4kFHTvLhTs4+iHYlIDgcZzlEJRGoh6kluilOQeGHa1HyJdilyrNf
         s+ug1UdlwTIZEvDVHMTqFEqP/9mIkYAz1CtIIIZ6jx0eXxv7yghgOns/b6OrxvEujhbj
         oCNmQYf/RAGPnQ5t0WivAt/CGnHK448YD5stfkZiENXSZSoPTiGmmHfT5Z9NtSvQX6nu
         WzPH+hWTM4FwtCLVwKltBp3vvFddZE+46Iitdzwr8h2R0vhXE5ae+gNWz0J4f9mK2ojj
         eo6T4fsDrsECxzXCKsy/aUsx8TnjH5oQenZxmNAswpiV+LjAIsGLu0Vb7cKGLP+qYu4X
         z42w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:cc:to:subject
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=sMOfVbCGiF/fkRR4mA6VIbEyZe8RVeThKvxp8g2+BMQ=;
        b=b66shjP+9lSVfBLQJFXG3o7RNZ3DJ89+nBapRCgMFDBadGvCfhcSaDcCzLf8plk8Sv
         Ae8Zh3OxSuKwUgaR+0H102ZB5HFcCm8IOvZ+n9sOrhbJ8TvHz75dkyszmk136hCcwAtd
         woHFSb5Q+Z6Z4lfYsV+eqfxzlTUXOxKXwa6TqsOEKdwLj7FgnJEwurYkGsciA63rWZt8
         ddzau+45hqSdPGVdWXuqCcHmdtnJXOaBOzVAN40G/AVNuQN/zQT1Do9PIIF5Tva25vEZ
         qn93vzUITnng1ABmowmszh6wuX4RRam4fM2YevrOkpXGyhwrJJcZwC8E4iingKDiy9fb
         kqmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=eFi9v5re;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o4si1537330ybm.144.2020.12.01.00.22.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 00:22:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=eFi9v5re;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:54678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk0vO-00013e-U1
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 03:22:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3JP3FXwMKCDsmZZdlldib.Zljnbjr-Xojklkdkr.lod@flex--pcc.bounces.google.com>)
 id 1kk0vD-00013J-5I
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 03:22:03 -0500
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a]:59672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3JP3FXwMKCDsmZZdlldib.Zljnbjr-Xojklkdkr.lod@flex--pcc.bounces.google.com>)
 id 1kk0vA-0007fs-C8
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 03:22:02 -0500
Received: by mail-pj1-x104a.google.com with SMTP id l5so623710pjk.9
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 00:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:subject:from:to:cc;
 bh=sMOfVbCGiF/fkRR4mA6VIbEyZe8RVeThKvxp8g2+BMQ=;
 b=eFi9v5reXvotnwLRdLnxaJ7uipa0c1Dss5qy6R8I3+XWdVhaO9oEO5mERWiDToEMqu
 HMEhOSXKM0nUCJRtt7Dj+h5RcgzgyVOFT7dzSRSngYqwoS0gMX6RlZtqYh3b9IbX2Yh5
 VMlJn6iQvwOfdKP2s4yIV/oTQMsVAK4CmnHZMRwkyzmVAU6okxmNcGfs8BRC3IdVxCw9
 M+DBbQrZHUTB/3rt8BvP/Z53CPmSOuo2T21puTqweylB3svmOuHCZTQSfvicaqKn+UdS
 idmBYhlBqbncLks4tS0pXzr03K5bDBNwa1qZRD9DLAalIdT1UkxCSV9lDvWyczhllF9t
 JHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :subject:from:to:cc;
 bh=sMOfVbCGiF/fkRR4mA6VIbEyZe8RVeThKvxp8g2+BMQ=;
 b=YaHgRtEEnGRSHCAS1P9JBoaOjteY8/wP7IpKXm0v0TUf03uQj04N9jV7I4wqySvqIW
 2jf0Omh52aPGzvYdqw3/uUMx+yuhfoQpFN4B7EgzBPk2PfVOR8GAywZHKn+VTjLbExP3
 AbGovohWdufCC3Dtc1U0FwK+JdQm9DVwdTCxJShUQVk59TBFExCNOaLZOhARl+ZsMfO/
 j563ZyK1nS9fuH7L2UxxO+s8WVsHvOHniNmM65IfnYc7dmTsmpvEi3QxscJA2y99DGPO
 +ZWBSWXaVctXinHi7ahCN7lzBTQLCFdf2KC8ujsYKa38qH9kr6kZIkTUHyNhAo++Z/gg
 WBFw==
X-Gm-Message-State: AOAM531pDp6DGU4OJK5QnAQozLeZXHhkjAyVuvMxzAjg9PJ6LyZtRGon
 k+lwC++t/xG9xAGSClRkwzkJbi8=
X-Received: from pcc-desktop.svl.corp.google.com
 ([2620:15c:2ce:0:7220:84ff:fe09:385a])
 (user=pcc job=sendgmr) by 2002:a17:90a:17a4:: with SMTP id
 q33mr192910pja.0.1606810916388; Tue, 01 Dec 2020 00:21:56 -0800 (PST)
Date: Tue,  1 Dec 2020 00:21:42 -0800
In-Reply-To: <ed83843e-2bd1-771a-cb89-ac0f1a4aaae4@csgraf.de>
Message-Id: <20201201082142.649007-1-pcc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH] arm/hvf: Optimize and simplify WFI handling
To: Alexander Graf <agraf@csgraf.de>
Cc: Peter Collingbourne <pcc@google.com>, Frank Yang <lfy@google.com>, 
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, 
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3JP3FXwMKCDsmZZdlldib.Zljnbjr-Xojklkdkr.lod@flex--pcc.bounces.google.com;
 helo=mail-pj1-x104a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to: Peter Collingbourne <pcc@google.com>
From: Peter Collingbourne via <qemu-arm@nongnu.org>
X-TUID: 23LnFeisxwN3

Sleep on WFx until the VTIMER is due but allow ourselves to be woken
up on IPI.

Signed-off-by: Peter Collingbourne <pcc@google.com>
---
Alexander Graf wrote:
> I would love to take a patch from you here :). I'll still be stuck for a
> while with the sysreg sync rework that Peter asked for before I can look
> at WFI again.

Okay, here's a patch :) It's a relatively straightforward adaptation
of what we have in our fork, which can now boot Android to GUI while
remaining at around 4% CPU when idle.

I'm not set up to boot a full Linux distribution at the moment so I
tested it on upstream QEMU by running a recent mainline Linux kernel
with a rootfs containing an init program that just does sleep(5)
and verified that the qemu process remains at low CPU usage during
the sleep. This was on top of your v2 plus the last patch of your v1
since it doesn't look like you have a replacement for that logic yet.

 accel/hvf/hvf-cpus.c     |  5 +--
 include/sysemu/hvf_int.h |  3 +-
 target/arm/hvf/hvf.c     | 94 +++++++++++-----------------------------
 3 files changed, 28 insertions(+), 74 deletions(-)

diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
index 4360f64671..b2c8fb57f6 100644
--- a/accel/hvf/hvf-cpus.c
+++ b/accel/hvf/hvf-cpus.c
@@ -344,9 +344,8 @@ static int hvf_init_vcpu(CPUState *cpu)
     sigact.sa_handler = dummy_signal;
     sigaction(SIG_IPI, &sigact, NULL);
 
-    pthread_sigmask(SIG_BLOCK, NULL, &set);
-    sigdelset(&set, SIG_IPI);
-    pthread_sigmask(SIG_SETMASK, &set, NULL);
+    pthread_sigmask(SIG_BLOCK, NULL, &cpu->hvf->unblock_ipi_mask);
+    sigdelset(&cpu->hvf->unblock_ipi_mask, SIG_IPI);
 
 #ifdef __aarch64__
     r = hv_vcpu_create(&cpu->hvf->fd, (hv_vcpu_exit_t **)&cpu->hvf->exit, NULL);
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index c56baa3ae8..13adf6ea77 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -62,8 +62,7 @@ extern HVFState *hvf_state;
 struct hvf_vcpu_state {
     uint64_t fd;
     void *exit;
-    struct timespec ts;
-    bool sleeping;
+    sigset_t unblock_ipi_mask;
 };
 
 void assert_hvf_ok(hv_return_t ret);
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 8fe10966d2..60a361ff38 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2,6 +2,7 @@
  * QEMU Hypervisor.framework support for Apple Silicon
 
  * Copyright 2020 Alexander Graf <agraf@csgraf.de>
+ * Copyright 2020 Google LLC
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
@@ -18,6 +19,7 @@
 #include "sysemu/hw_accel.h"
 
 #include <Hypervisor/Hypervisor.h>
+#include <mach/mach_time.h>
 
 #include "exec/address-spaces.h"
 #include "hw/irq.h"
@@ -320,18 +322,8 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
 void hvf_kick_vcpu_thread(CPUState *cpu)
 {
-    if (cpu->hvf->sleeping) {
-        /*
-         * When sleeping, make sure we always send signals. Also, clear the
-         * timespec, so that an IPI that arrives between setting hvf->sleeping
-         * and the nanosleep syscall still aborts the sleep.
-         */
-        cpu->thread_kicked = false;
-        cpu->hvf->ts = (struct timespec){ };
-        cpus_kick_thread(cpu);
-    } else {
-        hv_vcpus_exit(&cpu->hvf->fd, 1);
-    }
+    cpus_kick_thread(cpu);
+    hv_vcpus_exit(&cpu->hvf->fd, 1);
 }
 
 static int hvf_inject_interrupts(CPUState *cpu)
@@ -385,18 +377,19 @@ int hvf_vcpu_exec(CPUState *cpu)
         uint64_t syndrome = hvf_exit->exception.syndrome;
         uint32_t ec = syn_get_ec(syndrome);
 
+        qemu_mutex_lock_iothread();
         switch (exit_reason) {
         case HV_EXIT_REASON_EXCEPTION:
             /* This is the main one, handle below. */
             break;
         case HV_EXIT_REASON_VTIMER_ACTIVATED:
-            qemu_mutex_lock_iothread();
             current_cpu = cpu;
             qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 1);
             qemu_mutex_unlock_iothread();
             continue;
         case HV_EXIT_REASON_CANCELED:
             /* we got kicked, no exit to process */
+            qemu_mutex_unlock_iothread();
             continue;
         default:
             assert(0);
@@ -413,7 +406,6 @@ int hvf_vcpu_exec(CPUState *cpu)
             uint32_t srt = (syndrome >> 16) & 0x1f;
             uint64_t val = 0;
 
-            qemu_mutex_lock_iothread();
             current_cpu = cpu;
 
             DPRINTF("data abort: [pc=0x%llx va=0x%016llx pa=0x%016llx isv=%x "
@@ -446,8 +438,6 @@ int hvf_vcpu_exec(CPUState *cpu)
                 hvf_set_reg(cpu, srt, val);
             }
 
-            qemu_mutex_unlock_iothread();
-
             advance_pc = true;
             break;
         }
@@ -493,68 +483,36 @@ int hvf_vcpu_exec(CPUState *cpu)
         case EC_WFX_TRAP:
             if (!(syndrome & WFX_IS_WFE) && !(cpu->interrupt_request &
                 (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
-                uint64_t cval, ctl, val, diff, now;
+                uint64_t cval;
 
-                /* Set up a local timer for vtimer if necessary ... */
-                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0, &ctl);
-                assert_hvf_ok(r);
                 r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CVAL_EL0, &cval);
                 assert_hvf_ok(r);
 
-                asm volatile("mrs %0, cntvct_el0" : "=r"(val));
-                diff = cval - val;
-
-                now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) /
-                      gt_cntfrq_period_ns(arm_cpu);
-
-                /* Timer disabled or masked, just wait for long */
-                if (!(ctl & 1) || (ctl & 2)) {
-                    diff = (120 * NANOSECONDS_PER_SECOND) /
-                           gt_cntfrq_period_ns(arm_cpu);
+                int64_t ticks_to_sleep = cval - mach_absolute_time();
+                if (ticks_to_sleep < 0) {
+                    break;
                 }
 
-                if (diff < INT64_MAX) {
-                    uint64_t ns = diff * gt_cntfrq_period_ns(arm_cpu);
-                    struct timespec *ts = &cpu->hvf->ts;
-
-                    *ts = (struct timespec){
-                        .tv_sec = ns / NANOSECONDS_PER_SECOND,
-                        .tv_nsec = ns % NANOSECONDS_PER_SECOND,
-                    };
-
-                    /*
-                     * Waking up easily takes 1ms, don't go to sleep for smaller
-                     * time periods than 2ms.
-                     */
-                    if (!ts->tv_sec && (ts->tv_nsec < (SCALE_MS * 2))) {
-                        advance_pc = true;
-                        break;
-                    }
-
-                    /* Set cpu->hvf->sleeping so that we get a SIG_IPI signal. */
-                    cpu->hvf->sleeping = true;
-                    smp_mb();
-
-                    /* Bail out if we received an IRQ meanwhile */
-                    if (cpu->thread_kicked || (cpu->interrupt_request &
-                        (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
-                        cpu->hvf->sleeping = false;
-                        break;
-                    }
-
-                    /* nanosleep returns on signal, so we wake up on kick. */
-                    nanosleep(ts, NULL);
-
-                    /* Out of sleep - either naturally or because of a kick */
-                    cpu->hvf->sleeping = false;
-                }
+                uint64_t seconds = ticks_to_sleep / arm_cpu->gt_cntfrq_hz;
+                uint64_t nanos =
+                    (ticks_to_sleep - arm_cpu->gt_cntfrq_hz * seconds) *
+                    1000000000 / arm_cpu->gt_cntfrq_hz;
+                struct timespec ts = { seconds, nanos };
+
+                /*
+                 * Use pselect to sleep so that other threads can IPI us while
+                 * we're sleeping.
+                 */
+                qatomic_mb_set(&cpu->thread_kicked, false);
+                qemu_mutex_unlock_iothread();
+                pselect(0, 0, 0, 0, &ts, &cpu->hvf->unblock_ipi_mask);
+                qemu_mutex_lock_iothread();
 
                 advance_pc = true;
             }
             break;
         case EC_AA64_HVC:
             cpu_synchronize_state(cpu);
-            qemu_mutex_lock_iothread();
             current_cpu = cpu;
             if (arm_is_psci_call(arm_cpu, EXCP_HVC)) {
                 arm_handle_psci_call(arm_cpu);
@@ -562,11 +520,9 @@ int hvf_vcpu_exec(CPUState *cpu)
                 DPRINTF("unknown HVC! %016llx", env->xregs[0]);
                 env->xregs[0] = -1;
             }
-            qemu_mutex_unlock_iothread();
             break;
         case EC_AA64_SMC:
             cpu_synchronize_state(cpu);
-            qemu_mutex_lock_iothread();
             current_cpu = cpu;
             if (arm_is_psci_call(arm_cpu, EXCP_SMC)) {
                 arm_handle_psci_call(arm_cpu);
@@ -575,7 +531,6 @@ int hvf_vcpu_exec(CPUState *cpu)
                 env->xregs[0] = -1;
                 env->pc += 4;
             }
-            qemu_mutex_unlock_iothread();
             break;
         default:
             cpu_synchronize_state(cpu);
@@ -594,6 +549,7 @@ int hvf_vcpu_exec(CPUState *cpu)
             r = hv_vcpu_set_reg(cpu->hvf->fd, HV_REG_PC, pc);
             assert_hvf_ok(r);
         }
+        qemu_mutex_unlock_iothread();
     } while (ret == 0);
 
     qemu_mutex_lock_iothread();
-- 
2.29.2.454.gaff20da3a2-goog

