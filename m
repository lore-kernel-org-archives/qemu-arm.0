Received: by 10.28.71.155 with SMTP id m27csp2155706wmi;
        Thu, 12 Apr 2018 10:18:00 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/Opp2+eaLqoJw4MToZmE7EVEgQZTchtnXmajM7pUS6yIQXYcb0byUulQOr6BveIlF7f9jg
X-Received: by 10.55.45.131 with SMTP id t125mr2312561qkh.10.1523553480118;
        Thu, 12 Apr 2018 10:18:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523553480; cv=none;
        d=google.com; s=arc-20160816;
        b=min6NDxtlye4hbo0ERTvPAv/d4H2nH6ZDxpMvAmxNzYhLCZubyzwXwCXtu8gqC1C8n
         btBWmL0HwvR6DIbFgmbAVq47TaFMXVQ8C19jCwGsisW2sWeW35/uGp9yWKeZu1O5tBSt
         cQG89YuB590rzUYZXeFvvGyRHKoTsgkS1vf6UalyIT9OTp/kkoRecocfyR3XxooMq4BW
         E2qqEGDQofLxyq/nHgNalzhkqQnLD9ioCGlCb9ICyFKszWv+ZuwUmaiw4pvuZoIy5oIc
         UQRRafmXA68b26LS4uQ8ag471h/MQy81OHrM5o+J3lj2548eNA2L2/v/dZUVc/tMZAGP
         iN/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=VHutpaNUK3TIFIL/naDxx3FjhThGXs0pkuR+XCRJDUs=;
        b=JSIg+ObiOayxWNxz0AwxkxdyL9QSqBH4gtSiQdAs2mrRTNK58cZL23C4aINT/DMs5+
         r5FUZ5RdzFADDmct2cPCNg+MghKQDcd8ane4tHdG1Feg9d1RtxGtuhZChloyRKKihB5q
         LoxJsWTMH8wFFeuvlST1o4MPcItxWRXT5yvTVFlN7+3X9ZrPXPf7U32cUbpkD7IWHLzh
         hRxpmnmvTuT6QeV6So7dL8i0bkUB2Rg/5xKFeE9uKvsP0DAYihPn32uebEgC0J4VDbec
         zdbqCucpeW0OA2XA4FU8YU8liRqQKdClEPSglPYQYV+7Vy4RcBprsdKsEEBfaHfV+L/g
         LEQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=UfOz2/1l;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=MWvd1PwL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d18si463090qkb.348.2018.04.12.10.17.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 10:18:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=UfOz2/1l;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=MWvd1PwL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56253 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6frD-0006AK-GN
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 13:17:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f6fqs-00061v-Ma
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:17:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f6fqo-00014V-Du
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:17:38 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:50788)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f6fqo-00013m-3n; Thu, 12 Apr 2018 13:17:34 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 0F5D360A00; Thu, 12 Apr 2018 17:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523553453;
	bh=ptRBGHgpJ4kBnxQy6lkP46myJe0a9kvLLPAZfIddep0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UfOz2/1lJ8kIRPtHVmBtUPhmDphp62oPmz87Oc1KpNreb5S+oslQexlZgynix1A5d
	UU7Zthmrw/UE72k/tHVIJldHM+IjOWwgd8PNDf0nqfnJ5Kf1dSwZ6V+boEsBhEBlkK
	PoAj92ZI7iEwPGLnsSQSht1AFTVNiGc9amjfJON0=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 9951F6072E;
	Thu, 12 Apr 2018 17:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523553451;
	bh=ptRBGHgpJ4kBnxQy6lkP46myJe0a9kvLLPAZfIddep0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MWvd1PwL2gap7QhmdjojoPj9GdsUOYUlxAS/MF1tsw7EroVVlij7XFwD0cJrkWUZ3
	TXTFAKp5RsXIWMD6hD8JRO9DmqXAZIMc8EP8JHtxgo2okHobuS72GC/js4QPGv+e9y
	3C9cNpHz76T5JQieFhQdRqGmQwCJ6Z1fXt8iBEsk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9951F6072E
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Thu, 12 Apr 2018 13:17:28 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Message-ID: <20180412171728.GJ24561@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v3] RFC: target/arm: Send interrupts on PMU
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
Cc: Michael Spradling <mspradli@codeaurora.org>, qemu-devel@nongnu.org,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qkma1hhk4c/0

On Mar 16 16:30, Aaron Lindsay wrote:
> I aim to eventually add raising interrupts on counter overflow, but that is not
> covered by this patchset. I think I have a reasonable grasp of the mechanics of
> *how* to raise them, but am curious if anyone has thoughts on how to determine
> *when* to raise them - we don't want to call into PMU code every time an
> instruction is executed to check if any instruction counters have overflowed,
> etc. The main candidate I've seen for doing this so far would be to set up a
> QEMUTimer, but I haven't fully explored it. Does that seem plausible? Any
> other/better ideas?

I'm planning to post a full v4 of this patchset soon, pending a few
review fixes, but I figured I'd throw out an early version of a patch to
add interrupts on overflow in case it obviously has major issues that
will need to be addressed.

This patch sets up a QEMUTimer to get a callback when we expect counters
to next overflow and triggers an interrupt at that time.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.c    |  11 +++++
 target/arm/cpu.h    |   7 +++
 target/arm/helper.c | 129 ++++++++++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 138 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index df27188..9108c6b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -740,6 +740,12 @@ static void arm_cpu_finalizefn(Object *obj)
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
@@ -907,6 +913,11 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 
         arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
         arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
+
+#ifndef CONFIG_USER_ONLY
+        cpu->pmu_timer = timer_new(QEMU_CLOCK_VIRTUAL, 1, arm_pmu_timer_cb,
+                cpu);
+#endif
     } else {
         cpu->pmceid0 = 0x00000000;
         cpu->pmceid1 = 0x00000000;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5e6bbd3..bc0867f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -703,6 +703,8 @@ struct ARMCPU {
 
     /* Timers used by the generic (architected) timer */
     QEMUTimer *gt_timer[NUM_GTIMERS];
+    /* Timer used by the PMU */
+    QEMUTimer *pmu_timer;
     /* GPIO outputs for generic timer */
     qemu_irq gt_timer_outputs[NUM_GTIMERS];
     /* GPIO output for GICv3 maintenance interrupt signal */
@@ -934,6 +936,11 @@ void pmu_op_start(CPUARMState *env);
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
index 2147678..abe24dc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -905,6 +905,7 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
 /* Definitions for the PMU registers */
 #define PMCRN_MASK  0xf800
 #define PMCRN_SHIFT 11
+#define PMCRLC  0x40
 #define PMCRD   0x8
 #define PMCRC   0x4
 #define PMCRP   0x2
@@ -919,6 +920,8 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
 #define PMXEVTYPER_MT         0x02000000
 #define PMXEVTYPER_EVTCOUNT   0x000003ff
 
+#define PMEVCNTR_OVERFLOW_MASK ((uint64_t)1 << 31)
+
 #define PMCCFILTR             0xf8000000
 #define PMCCFILTR_M           PMXEVTYPER_M
 #define PMCCFILTR_EL0         (PMCCFILTR | PMCCFILTR_M)
@@ -934,6 +937,11 @@ typedef struct pm_event {
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
@@ -950,6 +958,11 @@ static uint64_t swinc_get_count(CPUARMState *env)
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
@@ -965,6 +978,11 @@ static uint64_t cycles_get_count(CPUARMState *env)
 }
 
 #ifndef CONFIG_USER_ONLY
+static int64_t cycles_ns_per(uint64_t cycles)
+{
+    return ARM_CPU_FREQ/NANOSECONDS_PER_SECOND;
+}
+
 static bool instructions_supported(CPUARMState *env)
 {
     return use_icount == 1 /* Precise instruction counting */;
@@ -974,22 +992,30 @@ static uint64_t instructions_get_count(CPUARMState *env)
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
@@ -1168,6 +1194,13 @@ static inline bool pmu_counter_filtered(CPUARMState *env, uint64_t pmxevtyper)
     return false;
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
@@ -1186,7 +1219,18 @@ void pmccntr_op_start(CPUARMState *env)
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
@@ -1200,13 +1244,25 @@ void pmccntr_op_finish(CPUARMState *env)
 {
     if (arm_ccnt_enabled(env) &&
           !pmu_counter_filtered(env, env->cp15.pmccfiltr_el0)) {
-        uint64_t prev_cycles = env->cp15.c15_ccnt_delta;
+#ifndef CONFIG_USER_ONLY
+        uint64_t delta = ((env->cp15.c9_pmcr & PMCRLC) ?
+                UINT64_MAX : UINT32_MAX) - (uint32_t)env->cp15.c15_ccnt;
+        int64_t overflow_in = cycles_ns_per(delta);
 
+        if (overflow_in >= 0)
+        {
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
@@ -1220,8 +1276,16 @@ static void pmevcntr_op_start(CPUARMState *env, uint8_t counter)
 
     if (pmu_counter_enabled(env, counter) &&
             !pmu_counter_filtered(env, env->cp15.c14_pmevtyper[counter])) {
-        env->cp15.c14_pmevcntr[counter] =
-            count - env->cp15.c14_pmevcntr_delta[counter];
+
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
@@ -1230,6 +1294,21 @@ static void pmevcntr_op_finish(CPUARMState *env, uint8_t counter)
 {
     if (pmu_counter_enabled(env, counter) &&
             !pmu_counter_filtered(env, env->cp15.c14_pmevtyper[counter])) {
+#ifndef CONFIG_USER_ONLY
+        uint16_t event = env->cp15.c14_pmevtyper[counter] & PMXEVTYPER_EVTCOUNT;
+        uint16_t event_idx = supported_event_map[event];
+        uint64_t delta = UINT32_MAX - (uint32_t)env->cp15.c14_pmevcntr[counter];
+        int64_t overflow_in = pm_events[event_idx].ns_per_count(delta);
+
+        if (overflow_in >= 0)
+        {
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
@@ -1263,6 +1342,18 @@ void pmu_post_el_change(ARMCPU *cpu, void *ignored)
     pmu_op_finish(&cpu->env);
 }
 
+void arm_pmu_timer_cb(void *opaque) {
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
@@ -1300,7 +1391,21 @@ static void pmswinc_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -1371,6 +1476,7 @@ static void pmcntenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     value &= PMU_COUNTER_MASK(env);
     env->cp15.c9_pmcnten |= value;
+    pmu_update_irq(env);
 }
 
 static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1378,6 +1484,7 @@ static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     value &= PMU_COUNTER_MASK(env);
     env->cp15.c9_pmcnten &= ~value;
+    pmu_update_irq(env);
 }
 
 static void pmovsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1385,6 +1492,7 @@ static void pmovsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     value &= PMU_COUNTER_MASK(env);
     env->cp15.c9_pmovsr &= ~value;
+    pmu_update_irq(env);
 }
 
 static void pmovsset_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1392,6 +1500,7 @@ static void pmovsset_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     value &= PMU_COUNTER_MASK(env);
     env->cp15.c9_pmovsr |= value;
+    pmu_update_irq(env);
 }
 
 static void pmevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1517,6 +1626,7 @@ static void pmintenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
     /* We have no event counters so only the C bit can be changed */
     value &= PMU_COUNTER_MASK(env);
     env->cp15.c9_pminten |= value;
+    pmu_update_irq(env);
 }
 
 static void pmintenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1524,6 +1634,7 @@ static void pmintenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     value &= PMU_COUNTER_MASK(env);
     env->cp15.c9_pminten &= ~value;
+    pmu_update_irq(env);
 }
 
 static void vbar_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

