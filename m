Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp815693lfb;
        Tue, 1 Dec 2020 20:45:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOq7w5lmoN190OyjEJYhXlxWGifJaE2RMjvu99GV1p0N6iAIlZgwfgwsireGZKBmHAx3E8
X-Received: by 2002:a25:9746:: with SMTP id h6mr927975ybo.222.1606884356251;
        Tue, 01 Dec 2020 20:45:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606884356; cv=none;
        d=google.com; s=arc-20160816;
        b=PKnuUW2RRv6c8bMwcDUDCgIdGvk12sKSasR8ylIAJ5inxWkKQ80zWSA7SuUi8Fy9CU
         KovFSQwfzjkmYa2Nqr+38sq6IPDcxoKYi6Cbl2zhmho+kuSZ0EjItHSsfbxahf4A4+Uj
         yFmAWe72x6LL6P4HH6QbhPj0M7q2VbhubYY3MK2Q2YC0LPbtAe7OqM91tfLHchHDOaOA
         M5qvto297emQHvSzMC/5L9zGLwCbWnwGX7jZ8hR7H6KXvM+L/RHWeMyWtMWk0g9kFeG4
         /WmPW+RV/D7fyKt2ASAvmLQHBGMR1h/+dvsq7vj2ZHQY8Ajk3508VJlZlvJ772M+2T4P
         uVfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:cc:to:subject
         :references:mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=OCUgc82PjNaoaS1mUNsu4PKH/CZc2u9fmD6iGYRDX4I=;
        b=YmGAVHoXRPH5HwkS059p9QG0LUG9lBTB4JeoPs8LEBDihTodjG2z9RDhrz2wEovQUM
         lJwegv2u1AXH6g4B/ie/5mh0mZQzfk4LbpiKgfNNalaFd0uVbbXeRtc3x293ml8CiSX0
         +gp4Rn1zou/fsGwXFZA2uNMJXsSDfojbRZ5I/23aNo+VWLnc2eEdNr1WaOdY6rNe1ibU
         o8LmQYUZOhhZqk9EuYBuHhO6im/YPE8WwJlSRAdYjVPyAdtS86Wodt+SWXWa7wmH0irk
         PCbw1Lk57pwxzmLbvAj/USMYxThTabn3PuvoraPIf0Q/Yiikclxs+XzAuOczvKDtqN92
         D7Mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=vMZ2DuXU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c129si732357yba.8.2020.12.01.20.45.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 20:45:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=vMZ2DuXU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:35144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkK1b-0002cd-Jl
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 23:45:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3nRvHXwMKCvQlYYckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--pcc.bounces.google.com>)
 id 1kkK00-00012j-TO
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 23:44:16 -0500
Received: from mail-qt1-x849.google.com ([2607:f8b0:4864:20::849]:50213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3nRvHXwMKCvQlYYckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--pcc.bounces.google.com>)
 id 1kkJzy-0003OU-Vv
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 23:44:16 -0500
Received: by mail-qt1-x849.google.com with SMTP id z8so368634qti.17
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 20:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=OCUgc82PjNaoaS1mUNsu4PKH/CZc2u9fmD6iGYRDX4I=;
 b=vMZ2DuXUX/pb8bHJ8Biyp3b5H0bG77WtDgCpxXG79JiPobDYXLQOs3pdfiUqrtGNpO
 83IZ840VPUCUEgOVD+kmAuSf9aqtsOfmhH1Qzz5imuVVWqKkznFO5PFvfrUFV8ASjKXy
 HiU0b5+C1XOt3WLQbSkFC65YuUa9gk9EYlTbJ4DYonBrXENFa3QxBMlOI60LdRxsNHJE
 +2WXzTxDtynaY1Bo47eDtCGAJWu5+H0zHvqOlUHFWrpRyxDsBscC7beTs+n5/ato8Hzo
 OFpnJYfxa+njrDxV8syxBv9pYiWVTZCvS2XX5QsRqlETD4ztF0BhYWzQIAUS/EU4so61
 rOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=OCUgc82PjNaoaS1mUNsu4PKH/CZc2u9fmD6iGYRDX4I=;
 b=DLv67j/fYgdElZpKagvojBvEJvRXMPpSDvy7ZCYR4z0OG3cVL7MmHZCIALJm3GIa3K
 baAUoIvndQsil1Z+B03IVmQq/MGfEczHOUzz/osAgHptbtkkXYnVIVncTYdAkeLfm+16
 JTUNPWqzk3RXZuLfsJFR8i6oK+/BneceJo4bkD7Tv7lSYl1V9doEmQSbPcl4ldZtdX+w
 cGFQL9xlFWC9UfEZN4GJqd4omttKSlqqOrqJUjQ7dEz4MZu45bGG39+WU9t60LhQrr2O
 cQmZXn2geSxqeVQzTE7dP9sniH9BIPW2CAX3cQHciwNpJF5K2wbcsueKQV4cPzQxvEZG
 sGCg==
X-Gm-Message-State: AOAM532MTdrdsRSWWFROuSRT4JIBstCdYAJI+jgUgDW2I6Gv+AIoBV2E
 k6zPnR8v2MlxtwjWK1q8x6NdGGU=
X-Received: from pcc-desktop.svl.corp.google.com
 ([2620:15c:2ce:0:7220:84ff:fe09:385a])
 (user=pcc job=sendgmr) by 2002:ad4:5041:: with SMTP id
 m1mr877431qvq.33.1606884253256; 
 Tue, 01 Dec 2020 20:44:13 -0800 (PST)
Date: Tue,  1 Dec 2020 20:44:06 -0800
In-Reply-To: <27f51056925889c41b763b71c992f04d935157c4.1606884132.git.pcc@google.com>
Message-Id: <36b02af02eae015e35fe03ce9ebb73e2015dc4c8.1606884132.git.pcc@google.com>
Mime-Version: 1.0
References: <27f51056925889c41b763b71c992f04d935157c4.1606884132.git.pcc@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v3 2/3] arm/hvf: Do some cleanups
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::849;
 envelope-from=3nRvHXwMKCvQlYYckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--pcc.bounces.google.com;
 helo=mail-qt1-x849.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to: Peter Collingbourne <pcc@google.com>
From: Peter Collingbourne via <qemu-devel@nongnu.org>
X-TUID: SG0TccOv3PY5

- Stop setting current_cpu
- Remove the previous WFx handler
- Simplify locking
- Remove the unused ret variable in hvf_vcpu_exec

Signed-off-by: Peter Collingbourne <pcc@google.com>
---
 include/sysemu/hvf_int.h |   2 -
 target/arm/hvf/hvf.c     | 106 ++-------------------------------------
 2 files changed, 5 insertions(+), 103 deletions(-)

diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index c56baa3ae8..5f15119184 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -62,8 +62,6 @@ extern HVFState *hvf_state;
 struct hvf_vcpu_state {
     uint64_t fd;
     void *exit;
-    struct timespec ts;
-    bool sleeping;
 };
 
 void assert_hvf_ok(hv_return_t ret);
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 8fe10966d2..31db6fca68 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -320,18 +320,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
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
+    hv_vcpus_exit(&cpu->hvf->fd, 1);
 }
 
 static int hvf_inject_interrupts(CPUState *cpu)
@@ -355,17 +344,11 @@ int hvf_vcpu_exec(CPUState *cpu)
     CPUARMState *env = &arm_cpu->env;
     hv_vcpu_exit_t *hvf_exit = cpu->hvf->exit;
     hv_return_t r;
-    int ret = 0;
-
-    qemu_mutex_unlock_iothread();
 
-    do {
+    while (1) {
         bool advance_pc = false;
 
-        qemu_mutex_lock_iothread();
-        current_cpu = cpu;
         qemu_wait_io_event_common(cpu);
-        qemu_mutex_unlock_iothread();
 
         flush_cpu_state(cpu);
 
@@ -374,10 +357,10 @@ int hvf_vcpu_exec(CPUState *cpu)
         }
 
         if (cpu->halted) {
-            qemu_mutex_lock_iothread();
             return EXCP_HLT;
         }
 
+        qemu_mutex_unlock_iothread();
         assert_hvf_ok(hv_vcpu_run(cpu->hvf->fd));
 
         /* handle VMEXIT */
@@ -385,15 +368,13 @@ int hvf_vcpu_exec(CPUState *cpu)
         uint64_t syndrome = hvf_exit->exception.syndrome;
         uint32_t ec = syn_get_ec(syndrome);
 
+        qemu_mutex_lock_iothread();
         switch (exit_reason) {
         case HV_EXIT_REASON_EXCEPTION:
             /* This is the main one, handle below. */
             break;
         case HV_EXIT_REASON_VTIMER_ACTIVATED:
-            qemu_mutex_lock_iothread();
-            current_cpu = cpu;
             qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 1);
-            qemu_mutex_unlock_iothread();
             continue;
         case HV_EXIT_REASON_CANCELED:
             /* we got kicked, no exit to process */
@@ -402,7 +383,6 @@ int hvf_vcpu_exec(CPUState *cpu)
             assert(0);
         }
 
-        ret = 0;
         switch (ec) {
         case EC_DATAABORT: {
             bool isv = syndrome & ARM_EL_ISV;
@@ -413,9 +393,6 @@ int hvf_vcpu_exec(CPUState *cpu)
             uint32_t srt = (syndrome >> 16) & 0x1f;
             uint64_t val = 0;
 
-            qemu_mutex_lock_iothread();
-            current_cpu = cpu;
-
             DPRINTF("data abort: [pc=0x%llx va=0x%016llx pa=0x%016llx isv=%x "
                     "iswrite=%x s1ptw=%x len=%d srt=%d]\n",
                     env->pc, hvf_exit->exception.virtual_address,
@@ -446,8 +423,6 @@ int hvf_vcpu_exec(CPUState *cpu)
                 hvf_set_reg(cpu, srt, val);
             }
 
-            qemu_mutex_unlock_iothread();
-
             advance_pc = true;
             break;
         }
@@ -491,83 +466,18 @@ int hvf_vcpu_exec(CPUState *cpu)
             break;
         }
         case EC_WFX_TRAP:
-            if (!(syndrome & WFX_IS_WFE) && !(cpu->interrupt_request &
-                (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
-                uint64_t cval, ctl, val, diff, now;
-
-                /* Set up a local timer for vtimer if necessary ... */
-                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0, &ctl);
-                assert_hvf_ok(r);
-                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CVAL_EL0, &cval);
-                assert_hvf_ok(r);
-
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
-                }
-
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
-
-                advance_pc = true;
-            }
             break;
         case EC_AA64_HVC:
             cpu_synchronize_state(cpu);
-            qemu_mutex_lock_iothread();
-            current_cpu = cpu;
             if (arm_is_psci_call(arm_cpu, EXCP_HVC)) {
                 arm_handle_psci_call(arm_cpu);
             } else {
                 DPRINTF("unknown HVC! %016llx", env->xregs[0]);
                 env->xregs[0] = -1;
             }
-            qemu_mutex_unlock_iothread();
             break;
         case EC_AA64_SMC:
             cpu_synchronize_state(cpu);
-            qemu_mutex_lock_iothread();
-            current_cpu = cpu;
             if (arm_is_psci_call(arm_cpu, EXCP_SMC)) {
                 arm_handle_psci_call(arm_cpu);
             } else {
@@ -575,7 +485,6 @@ int hvf_vcpu_exec(CPUState *cpu)
                 env->xregs[0] = -1;
                 env->pc += 4;
             }
-            qemu_mutex_unlock_iothread();
             break;
         default:
             cpu_synchronize_state(cpu);
@@ -594,10 +503,5 @@ int hvf_vcpu_exec(CPUState *cpu)
             r = hv_vcpu_set_reg(cpu->hvf->fd, HV_REG_PC, pc);
             assert_hvf_ok(r);
         }
-    } while (ret == 0);
-
-    qemu_mutex_lock_iothread();
-    current_cpu = cpu;
-
-    return ret;
+    }
 }
-- 
2.29.2.454.gaff20da3a2-goog

