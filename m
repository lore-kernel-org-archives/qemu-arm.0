Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp531005lfb;
        Tue, 1 Dec 2020 13:01:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3Q5Pgh0HXhu/NpIeJbICm0giwnAA43wTdEp+5S/+2Mt3zXX3wF5J4u/vTt+fe9uu2hQSx
X-Received: by 2002:a67:ec3:: with SMTP id 186mr5042821vso.14.1606856480317;
        Tue, 01 Dec 2020 13:01:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606856480; cv=none;
        d=google.com; s=arc-20160816;
        b=DEBMGMEUOyI8Mc4jOtJMpIpC1cUX6EIQvXq07UyVabP8eTO12hAByvAhoaI06wLgGd
         AzBsoFd3YV6U12h5OxpeJ7rHTkElkojF54rTihjlBmu05o5w8Cr6zIaF8QNqWu1EGvYJ
         99aUH8vVekeZ4r5W35hYHQpQk9qaVOLdp7XLdnam1X4NVANgCNxx5OkOVAvtsybqCxDt
         yO7R/aAIJSO2uzEoJ5TywRuHKz9P6UnHOZ2XHSKlKLu6uLgH1lZW/FwqyVCBVZuYxlpa
         ZAlLht8cThcYIKtU8PbvdKnNVbbEsgd1ztDe5uI7hQrmRoj98BHV7SVjj8idpzZVVrXU
         yD3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:cc:to:subject
         :mime-version:message-id:date:dkim-signature;
        bh=m/b66XcoyR4DMRJjee6T2gFM3Kgc48oUqGuw9K2vdK4=;
        b=LDJwtOgbnnEGSIJqbc/8b0S+xqi7UZoZtf2PU4wSdBEUBFYdf3KBY1HaCcVlxBNyhs
         nikBqOmYIo5HZLK2i+XUtrHZoHvBt29LV7c50wshHs9SQxH3dxw1T/Yf4UGKnxhR948R
         vS+XfwGXuwB7mOSI1hBYS54EK2Vb76+MKbwjoHeJZ+76vM3arGMb5mTxg97LzJeMicHO
         9TRb4IcKXQtLgfnOXqTWAED5Ojk3GLrL6RDLY4ahmTecCE4oUHRkSUgeZLKF4kan1fEg
         iZH889GFcwMk0cjCY8KVJqS0ZI9p2sgOW6Ej+nQfUTYsr1vIzCiv8SAwPvGloZBKAD5B
         QOzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=mxo5tbsS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15si307770vkc.5.2020.12.01.13.01.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 13:01:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=mxo5tbsS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:42824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkClz-0000Uy-Gk
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 16:01:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3-67GXwMKCHglYYckkcha.Ykimaiq-Wnijkjcjq.knc@flex--pcc.bounces.google.com>)
 id 1kkClX-0000Ud-5o
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 16:00:51 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:42019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3-67GXwMKCHglYYckkcha.Ykimaiq-Wnijkjcjq.knc@flex--pcc.bounces.google.com>)
 id 1kkClU-0005jJ-1p
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 16:00:50 -0500
Received: by mail-yb1-xb49.google.com with SMTP id k196so3917657ybf.9
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 13:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=m/b66XcoyR4DMRJjee6T2gFM3Kgc48oUqGuw9K2vdK4=;
 b=mxo5tbsS2ZP0pKOdkkdTIIk0BiE4TbJNQqn3l5a+aq+maSAaE0LZrSjZkOxS12o9sB
 y9jlQBAN8NesUgqwXZ8kkNxunXqV8hQ+mChKyhCB/+utDf+pnsItdJN7Hgyjt0vJy+N/
 rkiz+fF6pFUontaN/DuOnRTTrcs8rPctGn+i4fDOYsEOlYda6C09VqvuKawTTQ/hq7Zf
 W75k6Qt/6up4p6vZ/MVatJTDm3f4d5K7JRjiNjrOKOrTa8k6lUoXy3pMGcw4fH/weUG1
 5fQA88cv8YGkfVHrEIEFK9LIk03XiH7E/40V8VMCiPnLxm3HaxiCznNUY4HgF+o/IYJq
 2LiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=m/b66XcoyR4DMRJjee6T2gFM3Kgc48oUqGuw9K2vdK4=;
 b=s0lKt1XU4CsBL6NENWALNk9BW2N2IO06Avln9VfR/pxO3wRL9BBchjfewCq8Q86HTR
 HlRmVBjhE4qN4tSgnUWs/0kRV9pBxReD+3w6Re3iL3QYRUvHmK/8EwzPkNFSPqxY98CQ
 K0rIkvmJ2/25QQpPGUVKHz3e916j1hqkknGflKPZDRcWE9h1NPyowtafb3ZE+8aFOSRm
 3+mpZTm58qJabKYB+SlzF+0MuCeiVsCCDqZYXJset+NOKXVs4cBLAU4qGzqbzqt+09U5
 LX7YLcQcpWu4giG3kssZCfNKhmCDI9vxltKEQHdvryIfeL0r+pHydGgekyo7zwuaW8H3
 eXbg==
X-Gm-Message-State: AOAM5307Z+mrcHMTKjPh0o1uYKiHrLeNytXig6Q9oycqsVI2wh1JiN6L
 v1cJC0J4cLelj/7O9eDDW76xla8=
X-Received: from pcc-desktop.svl.corp.google.com
 ([2620:15c:2ce:0:7220:84ff:fe09:385a])
 (user=pcc job=sendgmr) by 2002:a25:9746:: with SMTP id
 h6mr5548382ybo.222.1606856443029; 
 Tue, 01 Dec 2020 13:00:43 -0800 (PST)
Date: Tue,  1 Dec 2020 13:00:36 -0800
Message-Id: <4a2d15d01087207e2fba1f55ad312727dbfc782e.1606856104.git.pcc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v2 1/2] arm/hvf: Optimize and simplify WFI handling
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3-67GXwMKCHglYYckkcha.Ykimaiq-Wnijkjcjq.knc@flex--pcc.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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
X-TUID: jaC6eOnomICV

Sleep on WFx until the VTIMER is due but allow ourselves to be woken
up on IPI.

Signed-off-by: Peter Collingbourne <pcc@google.com>
---
v2:
- simplify locking further
- wait indefinitely on disabled or masked timers

 accel/hvf/hvf-cpus.c     |   5 +-
 include/sysemu/hvf_int.h |   3 +-
 target/arm/hvf/hvf.c     | 116 ++++++++++++++-------------------------
 3 files changed, 43 insertions(+), 81 deletions(-)

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
index 8fe10966d2..3321d48aa2 100644
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
@@ -349,6 +341,18 @@ static int hvf_inject_interrupts(CPUState *cpu)
     return 0;
 }
 
+static void hvf_wait_for_ipi(CPUState *cpu, struct timespec *ts)
+{
+    /*
+     * Use pselect to sleep so that other threads can IPI us while we're
+     * sleeping.
+     */
+    qatomic_mb_set(&cpu->thread_kicked, false);
+    qemu_mutex_unlock_iothread();
+    pselect(0, 0, 0, 0, ts, &cpu->hvf->unblock_ipi_mask);
+    qemu_mutex_lock_iothread();
+}
+
 int hvf_vcpu_exec(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -357,15 +361,11 @@ int hvf_vcpu_exec(CPUState *cpu)
     hv_return_t r;
     int ret = 0;
 
-    qemu_mutex_unlock_iothread();
-
     do {
         bool advance_pc = false;
 
-        qemu_mutex_lock_iothread();
         current_cpu = cpu;
         qemu_wait_io_event_common(cpu);
-        qemu_mutex_unlock_iothread();
 
         flush_cpu_state(cpu);
 
@@ -374,10 +374,10 @@ int hvf_vcpu_exec(CPUState *cpu)
         }
 
         if (cpu->halted) {
-            qemu_mutex_lock_iothread();
             return EXCP_HLT;
         }
 
+        qemu_mutex_unlock_iothread();
         assert_hvf_ok(hv_vcpu_run(cpu->hvf->fd));
 
         /* handle VMEXIT */
@@ -385,15 +385,14 @@ int hvf_vcpu_exec(CPUState *cpu)
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
-            qemu_mutex_unlock_iothread();
             continue;
         case HV_EXIT_REASON_CANCELED:
             /* we got kicked, no exit to process */
@@ -413,7 +412,6 @@ int hvf_vcpu_exec(CPUState *cpu)
             uint32_t srt = (syndrome >> 16) & 0x1f;
             uint64_t val = 0;
 
-            qemu_mutex_lock_iothread();
             current_cpu = cpu;
 
             DPRINTF("data abort: [pc=0x%llx va=0x%016llx pa=0x%016llx isv=%x "
@@ -446,8 +444,6 @@ int hvf_vcpu_exec(CPUState *cpu)
                 hvf_set_reg(cpu, srt, val);
             }
 
-            qemu_mutex_unlock_iothread();
-
             advance_pc = true;
             break;
         }
@@ -493,68 +489,40 @@ int hvf_vcpu_exec(CPUState *cpu)
         case EC_WFX_TRAP:
             if (!(syndrome & WFX_IS_WFE) && !(cpu->interrupt_request &
                 (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
-                uint64_t cval, ctl, val, diff, now;
+                advance_pc = true;
 
-                /* Set up a local timer for vtimer if necessary ... */
-                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0, &ctl);
-                assert_hvf_ok(r);
-                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CVAL_EL0, &cval);
+                uint64_t ctl;
+                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0,
+                                        &ctl);
                 assert_hvf_ok(r);
 
-                asm volatile("mrs %0, cntvct_el0" : "=r"(val));
-                diff = cval - val;
-
-                now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) /
-                      gt_cntfrq_period_ns(arm_cpu);
-
-                /* Timer disabled or masked, just wait for long */
                 if (!(ctl & 1) || (ctl & 2)) {
-                    diff = (120 * NANOSECONDS_PER_SECOND) /
-                           gt_cntfrq_period_ns(arm_cpu);
+                    /* Timer disabled or masked, just wait for an IPI. */
+                    hvf_wait_for_ipi(cpu, NULL);
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
+                uint64_t cval;
+                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CVAL_EL0,
+                                        &cval);
+                assert_hvf_ok(r);
+
+                int64_t ticks_to_sleep = cval - mach_absolute_time();
+                if (ticks_to_sleep < 0) {
+                    break;
                 }
 
-                advance_pc = true;
+                uint64_t seconds = ticks_to_sleep / arm_cpu->gt_cntfrq_hz;
+                uint64_t nanos =
+                    (ticks_to_sleep - arm_cpu->gt_cntfrq_hz * seconds) *
+                    1000000000 / arm_cpu->gt_cntfrq_hz;
+                struct timespec ts = { seconds, nanos };
+
+                hvf_wait_for_ipi(cpu, &ts);
             }
             break;
         case EC_AA64_HVC:
             cpu_synchronize_state(cpu);
-            qemu_mutex_lock_iothread();
             current_cpu = cpu;
             if (arm_is_psci_call(arm_cpu, EXCP_HVC)) {
                 arm_handle_psci_call(arm_cpu);
@@ -562,11 +530,9 @@ int hvf_vcpu_exec(CPUState *cpu)
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
@@ -575,7 +541,6 @@ int hvf_vcpu_exec(CPUState *cpu)
                 env->xregs[0] = -1;
                 env->pc += 4;
             }
-            qemu_mutex_unlock_iothread();
             break;
         default:
             cpu_synchronize_state(cpu);
@@ -596,7 +561,6 @@ int hvf_vcpu_exec(CPUState *cpu)
         }
     } while (ret == 0);
 
-    qemu_mutex_lock_iothread();
     current_cpu = cpu;
 
     return ret;
-- 
2.29.2.454.gaff20da3a2-goog

