Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1251854wrq;
        Fri, 22 Jun 2018 13:37:03 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdGpfgOcYh81P+g2C83FgmrCk2rGNZzGMTklG3AJBWx4PPhwOTUr4vuE1oLmo7d/j4ld8dp
X-Received: by 2002:a0c:e642:: with SMTP id c2-v6mr2983312qvn.56.1529699823437;
        Fri, 22 Jun 2018 13:37:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529699823; cv=none;
        d=google.com; s=arc-20160816;
        b=Wl+MmtfyHp7u0f7QAxfzAdVyMmIhA9ocN/k6WoCxREbV8CItjF1UY7I7C0chDEji3s
         dmBQVyDy3ItdGhEfOsvME240jW2yaHFaaS8cZUT5DQ/eChJ2c3jZlXhXu0mFWt+Lkgz3
         XnYbID/HEY3NY3s2WnSkgxDCghye0jiFaZXNsRYkkplHsA2qRfyVgN8i0/eee4zBQZ7v
         ll7/Xpw88oT07lBKecROHsFfJxLwgKEKm7asmqJxd8U/KMWzgfHSC3y0z/NzIarjTkZs
         i7vIzt4jM6q9DyC+uGoeJQUoazb5EFjH9vK2k/GEVjhWEtHmeArErkw+quqG0bCV7Wgh
         ntYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=GnlJrjcbMTNmVx/MWZwcXccXOFKMHmfE49YrJkFjwcw=;
        b=sXt6jsZ8QhZ1sNaMgIC1PQw/y1k+t/AY/MIK4KAsid2DfDfL1Ijn+UMwyvlGOjGJJd
         1kWr2EpuFRRoHmATeiybJLU//3JeASzzCOGMCwAC+SQV4I4OTEbY4DwlaG9oEBTubEA2
         XqIDRtfZPJjFzsPBOcNLDxIUlp2rN+NzJnAyE6tr5BTKr5EE8RD3m8LpRGzPmyN7vhqx
         8wbr82XlQzlBieYi6GiFYGCB88/OZ7EtHmQMkE8vNi3WMEObd9+PaoiZznUgUVgGXiPJ
         BWyl2Ju7em3QNDa1g9ejxErn762qBwNy4AKYPLqIsAPDPamwG2srUdgZrkFZtNUefXeW
         CBtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=KJMqIZmz;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=RQI8WoCW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w16-v6si423105qtw.391.2018.06.22.13.37.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 13:37:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=KJMqIZmz;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=RQI8WoCW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36096 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWSnm-0005Xu-RW
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 16:37:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSjn-0002MC-4y
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:32:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSjl-0005Wq-Bf
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:32:55 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46088)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1fWSjl-0005WM-0N; Fri, 22 Jun 2018 16:32:53 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 23C366063F; Fri, 22 Jun 2018 20:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699572;
	bh=Icc0RJC3Dj+RKYu06P7IwGINJF0w5NHLTcYP5dVj3e8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KJMqIZmzBl1isqf3Swje2zaDqgQgi2CEYp7BMZ1DtsC7VfcKkcL3XscJ9w912zTuu
	+HrIYdso9PzLwdEdWiV57hDTqey2NRo6M4K84WgpBkFh4+EjBazhCK5YWk0UMLly4B
	nEjXB/2Piqj6epskhbY8ieboIdhFAgCOA/3wD+g0=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 34B5160AFF;
	Fri, 22 Jun 2018 20:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699570;
	bh=Icc0RJC3Dj+RKYu06P7IwGINJF0w5NHLTcYP5dVj3e8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RQI8WoCW5BDg3JF8h+ByrJWTF7f1rAzh8cKxxIXFm0mBGXiO1JGW7IAh1kXMQQY+q
	5J34BXAumjrT4vAvK4RE4K1PDAziwQ7NRRiUUKzHoEE1aduGd+6JUidK7ittgDZRrP
	83kk9ukgBLC4LG0NXMeF22MYJU1gEDVLLJk36OCE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 34B5160AFF
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 22 Jun 2018 16:32:27 -0400
Message-Id: <1529699547-17044-14-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v5 13/13] target/arm: Send interrupts on PMU
 counter overflow
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>, Aaron Lindsay <aclindsa@gmail.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fhSUGD5hQQsY

Setup a QEMUTimer to get a callback when we expect counters to next
overflow and trigger an interrupt at that time.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.c    |  11 +++++
 target/arm/cpu.h    |   7 +++
 target/arm/helper.c | 132 ++++++++++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 141 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2f5b16a..7b3c137 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -743,6 +743,12 @@ static void arm_cpu_finalizefn(Object *obj)
         QLIST_REMOVE(hook, node);
         g_free(hook);
     }
+#ifndef CONFIG_USER_ONLY
+    if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
+        timer_deinit(cpu->pmu_timer);
+        timer_free(cpu->pmu_timer);
+    }
+#endif
 }
 
 static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
@@ -937,6 +943,11 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
             arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
             arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
         }
+
+#ifndef CONFIG_USER_ONLY
+        cpu->pmu_timer = timer_new(QEMU_CLOCK_VIRTUAL, 1, arm_pmu_timer_cb,
+                cpu);
+#endif
     } else {
         cpu->pmceid0 = 0x00000000;
         cpu->pmceid1 = 0x00000000;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c240b38..583b008 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -720,6 +720,8 @@ struct ARMCPU {
 
     /* Timers used by the generic (architected) timer */
     QEMUTimer *gt_timer[NUM_GTIMERS];
+    /* Timer used by the PMU */
+    QEMUTimer *pmu_timer;
     /* GPIO outputs for generic timer */
     qemu_irq gt_timer_outputs[NUM_GTIMERS];
     /* GPIO output for GICv3 maintenance interrupt signal */
@@ -962,6 +964,11 @@ void pmu_op_start(CPUARMState *env);
 void pmu_op_finish(CPUARMState *env);
 
 /**
+ * Called when a PMU counter is due to overflow
+ */
+void arm_pmu_timer_cb(void *opaque);
+
+/**
  * Functions to register as EL change hooks for PMU mode filtering
  */
 void pmu_pre_el_change(ARMCPU *cpu, void *ignored);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 38fb6a2..0ddbcac 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -936,6 +936,7 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
 /* Definitions for the PMU registers */
 #define PMCRN_MASK  0xf800
 #define PMCRN_SHIFT 11
+#define PMCRLC  0x40
 #define PMCRDP  0x10
 #define PMCRD   0x8
 #define PMCRC   0x4
@@ -951,6 +952,8 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
 #define PMXEVTYPER_MT         0x02000000
 #define PMXEVTYPER_EVTCOUNT   0x000003ff
 
+#define PMEVCNTR_OVERFLOW_MASK ((uint64_t)1 << 31)
+
 #define PMCCFILTR             0xf8000000
 #define PMCCFILTR_M           PMXEVTYPER_M
 #define PMCCFILTR_EL0         (PMCCFILTR | PMCCFILTR_M)
@@ -973,6 +976,11 @@ typedef struct pm_event {
     /* Retrieve the current count of the underlying event. The programmed
      * counters hold a difference from the return value from this function */
     uint64_t (*get_count)(CPUARMState *);
+    /* Return how many nanoseconds it will take (at a minimum) for count events
+     * to occur. A negative value indicates the counter will never overflow, or
+     * that the counter has otherwise arranged for the overflow bit to be set
+     * and the PMU interrupt to be raised on overflow. */
+    int64_t (*ns_per_count)(uint64_t);
 } pm_event;
 
 static bool event_always_supported(CPUARMState *env)
@@ -989,6 +997,11 @@ static uint64_t swinc_get_count(CPUARMState *env)
     return 0;
 }
 
+static int64_t swinc_ns_per(uint64_t ignored)
+{
+    return -1;
+}
+
 /*
  * Return the underlying cycle count for the PMU cycle counters. If we're in
  * usermode, simply return 0.
@@ -1004,6 +1017,11 @@ static uint64_t cycles_get_count(CPUARMState *env)
 }
 
 #ifndef CONFIG_USER_ONLY
+static int64_t cycles_ns_per(uint64_t cycles)
+{
+    return (ARM_CPU_FREQ / NANOSECONDS_PER_SECOND) * cycles;
+}
+
 static bool instructions_supported(CPUARMState *env)
 {
     return use_icount == 1 /* Precise instruction counting */;
@@ -1013,22 +1031,30 @@ static uint64_t instructions_get_count(CPUARMState *env)
 {
     return (uint64_t)cpu_get_icount_raw();
 }
+
+static int64_t instructions_ns_per(uint64_t icount)
+{
+    return cpu_icount_to_ns((int64_t)icount);
+}
 #endif
 
 #define SUPPORTED_EVENT_SENTINEL UINT16_MAX
 static const pm_event pm_events[] = {
     { .number = 0x000, /* SW_INCR */
       .supported = event_always_supported,
-      .get_count = swinc_get_count
+      .get_count = swinc_get_count,
+      .ns_per_count = swinc_ns_per
     },
 #ifndef CONFIG_USER_ONLY
     { .number = 0x008, /* INST_RETIRED, Instruction architecturally executed */
       .supported = instructions_supported,
-      .get_count = instructions_get_count
+      .get_count = instructions_get_count,
+      .ns_per_count = instructions_ns_per
     },
     { .number = 0x011, /* CPU_CYCLES, Cycle */
       .supported = event_always_supported,
-      .get_count = cycles_get_count
+      .get_count = cycles_get_count,
+      .ns_per_count = cycles_ns_per
     },
 #endif
     { .number = SUPPORTED_EVENT_SENTINEL }
@@ -1216,6 +1242,13 @@ static inline bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
     return enabled && !prohibited && !filtered;
 }
 
+static void pmu_update_irq(CPUARMState *env)
+{
+    ARMCPU *cpu = arm_env_get_cpu(env);
+    qemu_set_irq(cpu->pmu_interrupt, (env->cp15.c9_pmcr & PMCRE) &&
+            (env->cp15.c9_pminten & env->cp15.c9_pmovsr));
+}
+
 /*
  * Ensure c15_ccnt is the guest-visible count so that operations such as
  * enabling/disabling the counter or filtering, modifying the count itself,
@@ -1233,7 +1266,18 @@ void pmccntr_op_start(CPUARMState *env)
             eff_cycles /= 64;
         }
 
-        env->cp15.c15_ccnt = eff_cycles - env->cp15.c15_ccnt_delta;
+        uint64_t new_pmccntr = eff_cycles - env->cp15.c15_ccnt_delta;
+
+        unsigned int overflow_bit = (env->cp15.c9_pmcr & PMCRLC) ? 63 : 31;
+        uint64_t overflow_mask = (uint64_t)1 << overflow_bit;
+        if (!(new_pmccntr & overflow_mask) &&
+                (env->cp15.c15_ccnt & overflow_mask)) {
+            env->cp15.c9_pmovsr |= (1 << 31);
+            new_pmccntr &= ~overflow_mask;
+            pmu_update_irq(env);
+        }
+
+        env->cp15.c15_ccnt = new_pmccntr;
     }
     env->cp15.c15_ccnt_delta = cycles;
 }
@@ -1246,13 +1290,28 @@ void pmccntr_op_start(CPUARMState *env)
 void pmccntr_op_finish(CPUARMState *env)
 {
     if (pmu_counter_enabled(env, 31)) {
-        uint64_t prev_cycles = env->cp15.c15_ccnt_delta;
+#ifndef CONFIG_USER_ONLY
+        uint64_t delta;
+        if (env->cp15.c9_pmcr & PMCRLC) {
+            delta = UINT64_MAX - env->cp15.c15_ccnt + 1;
+        } else {
+            delta = UINT32_MAX - (uint32_t)env->cp15.c15_ccnt + 1;
+        }
+        int64_t overflow_in = cycles_ns_per(delta);
 
+        if (overflow_in > 0) {
+            int64_t overflow_at = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
+                overflow_in;
+            ARMCPU *cpu = arm_env_get_cpu(env);
+            timer_mod_anticipate_ns(cpu->pmu_timer, overflow_at);
+        }
+#endif
+
+        uint64_t prev_cycles = env->cp15.c15_ccnt_delta;
         if (env->cp15.c9_pmcr & PMCRD) {
             /* Increment once every 64 processor clock cycles */
             prev_cycles /= 64;
         }
-
         env->cp15.c15_ccnt_delta = prev_cycles - env->cp15.c15_ccnt;
     }
 }
@@ -1265,8 +1324,15 @@ static void pmevcntr_op_start(CPUARMState *env, uint8_t counter)
     uint64_t count = pm_events[event_idx].get_count(env);
 
     if (pmu_counter_enabled(env, counter)) {
-        env->cp15.c14_pmevcntr[counter] =
-            count - env->cp15.c14_pmevcntr_delta[counter];
+        uint64_t new_pmevcntr = count - env->cp15.c14_pmevcntr_delta[counter];
+
+        if (!(new_pmevcntr & PMEVCNTR_OVERFLOW_MASK) &&
+                (env->cp15.c14_pmevcntr[counter] & PMEVCNTR_OVERFLOW_MASK)) {
+            env->cp15.c9_pmovsr |= (1 << counter);
+            new_pmevcntr &= ~PMEVCNTR_OVERFLOW_MASK;
+            pmu_update_irq(env);
+        }
+        env->cp15.c14_pmevcntr[counter] = new_pmevcntr;
     }
     env->cp15.c14_pmevcntr_delta[counter] = count;
 }
@@ -1274,6 +1340,21 @@ static void pmevcntr_op_start(CPUARMState *env, uint8_t counter)
 static void pmevcntr_op_finish(CPUARMState *env, uint8_t counter)
 {
     if (pmu_counter_enabled(env, counter)) {
+#ifndef CONFIG_USER_ONLY
+        uint16_t event = env->cp15.c14_pmevtyper[counter] & PMXEVTYPER_EVTCOUNT;
+        uint16_t event_idx = supported_event_map[event];
+        uint64_t delta = UINT32_MAX -
+            (uint32_t)env->cp15.c14_pmevcntr[counter] + 1;
+        int64_t overflow_in = pm_events[event_idx].ns_per_count(delta);
+
+        if (overflow_in > 0) {
+            int64_t overflow_at = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
+                overflow_in;
+            ARMCPU *cpu = arm_env_get_cpu(env);
+            timer_mod_anticipate_ns(cpu->pmu_timer, overflow_at);
+        }
+#endif
+
         env->cp15.c14_pmevcntr_delta[counter] -=
             env->cp15.c14_pmevcntr[counter];
     }
@@ -1307,6 +1388,19 @@ void pmu_post_el_change(ARMCPU *cpu, void *ignored)
     pmu_op_finish(&cpu->env);
 }
 
+void arm_pmu_timer_cb(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+
+    /* Update all the counter values based on the current underlying counts,
+     * triggering interrupts to be raised, if necessary. pmu_op_finish() also
+     * has the effect of setting the cpu->pmu_timer to the next earliest time a
+     * counter may expire.
+     */
+    pmu_op_start(&cpu->env);
+    pmu_op_finish(&cpu->env);
+}
+
 static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
@@ -1343,7 +1437,21 @@ static void pmswinc_write(CPUARMState *env, const ARMCPRegInfo *ri,
                 /* counter is SW_INCR */
                 (env->cp15.c14_pmevtyper[i] & PMXEVTYPER_EVTCOUNT) == 0x0) {
             pmevcntr_op_start(env, i);
-            env->cp15.c14_pmevcntr[i]++;
+
+            /* Detect if this write causes an overflow since we can't predict
+             * PMSWINC overflows like we can for other events
+             */
+            uint64_t new_pmswinc = env->cp15.c14_pmevcntr[i] + 1;
+
+            if (!(new_pmswinc & PMEVCNTR_OVERFLOW_MASK) &&
+                    (env->cp15.c14_pmevcntr[i] & PMEVCNTR_OVERFLOW_MASK)) {
+                env->cp15.c9_pmovsr |= (1 << i);
+                new_pmswinc &= ~PMEVCNTR_OVERFLOW_MASK;
+                pmu_update_irq(env);
+            }
+
+            env->cp15.c14_pmevcntr[i] = new_pmswinc;
+
             pmevcntr_op_finish(env, i);
         }
     }
@@ -1414,6 +1522,7 @@ static void pmcntenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     value &= pmu_counter_mask(env);
     env->cp15.c9_pmcnten |= value;
+    pmu_update_irq(env);
 }
 
 static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1421,6 +1530,7 @@ static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     value &= pmu_counter_mask(env);
     env->cp15.c9_pmcnten &= ~value;
+    pmu_update_irq(env);
 }
 
 static void pmovsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1428,6 +1538,7 @@ static void pmovsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     value &= pmu_counter_mask(env);
     env->cp15.c9_pmovsr &= ~value;
+    pmu_update_irq(env);
 }
 
 static void pmovsset_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1435,6 +1546,7 @@ static void pmovsset_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     value &= pmu_counter_mask(env);
     env->cp15.c9_pmovsr |= value;
+    pmu_update_irq(env);
 }
 
 static void pmevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1560,6 +1672,7 @@ static void pmintenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
     /* We have no event counters so only the C bit can be changed */
     value &= pmu_counter_mask(env);
     env->cp15.c9_pminten |= value;
+    pmu_update_irq(env);
 }
 
 static void pmintenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1567,6 +1680,7 @@ static void pmintenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     value &= pmu_counter_mask(env);
     env->cp15.c9_pminten &= ~value;
+    pmu_update_irq(env);
 }
 
 static void vbar_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

