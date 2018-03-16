Received: by 10.28.91.67 with SMTP id p64csp1280670wmb;
        Fri, 16 Mar 2018 13:40:51 -0700 (PDT)
X-Google-Smtp-Source: AG47ELs6WDTWA6GJ1oTuE+NJgXGyAKvCEgoaeKO6smq+Anme8xPmSNAmVO8cOCqewpxoy8QQFR91
X-Received: by 10.55.146.6 with SMTP id u6mr4830525qkd.327.1521232851258;
        Fri, 16 Mar 2018 13:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521232851; cv=none;
        d=google.com; s=arc-20160816;
        b=nQkYHU1pVVOgbckOVXvyFVO/PGYpEClpRcjAeXiHgydvfS5fzkoygCxnIK6Twbj5iL
         SqL6/m6h2lxOzom1hqmfC4GjjP5aLyDc16PAhMhHbD7EtSBj2D6mx2YkYHFK+AJMhqMd
         3xURDlSSteiltRQPBN/6IcedjvugUv5k+aEwBmJYxHkaY1XWRWs98msIrrYR/HvBUF1s
         lw9lWZuNh3163OAmpTjk+p0fNVA6kG+hB1hAZcVvU+VRaIf2hnK8zB7BpEE20GkmszJW
         c3AwkjRRpRaTEzIJOsMrnfrtBV//BUYcWJsbYagxyU3m79kIgYYXEBKbFL3oSX8zDHdt
         JgNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=zvkG8jaEjiBBtv0D7P6DFd+aaCRhu6xzDg0Cnua8Ic8=;
        b=FwG8mmwzxWeYHXzPmBZS6G9zmfTdE20bdjWlcQvx3nkOxLGKMnABJSVpVAkNt8gS7A
         sX7GA5/t9pBh941m58XtRiLfVbOTPalR2kH5eB4niWGf0glvSFc9rlSHRO5IT3HCBDuM
         ubp8W/mESPyyvGTCmHIkewb/KR6kTcv+x2QgV8ydjPv2nD+4afBRYOnu/6XCbGlOCb/5
         FOb9AGZmrJov+uCcRwywMKL1zDqiCTeK43WSrVwer2JAXRL6um54OUE1YzKei/GZbiL2
         eWY52J1a14/eiHSB5IF1k2DfaG4YOMNBGbkKRkwxx7y1Pxt9f1YitPWl9BoyePCasyaK
         UICA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=L7W9+iEG;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=RFtqw9F7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 75si8718661qkc.107.2018.03.16.13.40.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Mar 2018 13:40:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=L7W9+iEG;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=RFtqw9F7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59487 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eww9i-0004jb-O7
	for alex.bennee@linaro.org; Fri, 16 Mar 2018 16:40:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1l-0006BE-DE
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1j-0003kn-7x
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:37 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56880)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1eww1i-0003ip-Vl; Fri, 16 Mar 2018 16:32:35 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id D064F60F6E; Fri, 16 Mar 2018 20:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232354;
	bh=bDOC/lX/98tdhEA9hw6VJ3HJJAPQSysJ6XMIwyMzcho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L7W9+iEGiLXeZupZLyTiWyjiQ94mQdTLkGBj9A6ghpa3HmONzwswC6KiG8CnsLVeI
	BrrwyCCp7oEuGpfjCvsdu/5u3mAy8aYy4/SjKkPus2qFQcT8C9D/Sfs6YnQmtM1sUP
	w9GTs7ocG6UQEH1pq+hi6Yn72xN98Fyjf18yWKaU=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 1BBE960FAA;
	Fri, 16 Mar 2018 20:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232342;
	bh=bDOC/lX/98tdhEA9hw6VJ3HJJAPQSysJ6XMIwyMzcho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RFtqw9F76pedz7J2PivrVNuJ7M+qswcZBgGbc7j5GZX+WMOgAaX8frqZ8TgE0mVW6
	HwtLybUaCkU9Xw7Cn62YaW6KnEnjZl3FS5UbXPrLjfhRveoDfyI3S2J/XmMsr+Bi/T
	sVxKva2vQqI5zEg4nv751DlakKec3mWzG1ha1jdw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1BBE960FAA
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 16 Mar 2018 16:31:17 -0400
Message-Id: <1521232280-13089-20-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v3 19/22] target/arm: Finish implementation of
 PM[X]EVCNTR and PM[X]EVTYPER
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2UjOdN2CvKfx

Add arrays to hold the registers, the definitions themselves, access
functions, and add logic to reset counters when PMCR.P is set.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.h    |   7 +-
 target/arm/helper.c | 219 ++++++++++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 207 insertions(+), 19 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 19f005d..7a74966 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -454,8 +454,9 @@ typedef struct CPUARMState {
         uint64_t oslsr_el1; /* OS Lock Status */
         uint64_t mdcr_el2;
         uint64_t mdcr_el3;
-        /* If the counter is enabled, this stores the last time the counter
-         * was reset. Otherwise it stores the counter value
+        /* If the pmccntr and pmevcntr counters are enabled, they store the
+         * offset the last time the counter was reset. Otherwise they store the
+         * counter value.
          */
         uint64_t c15_ccnt;
         /* ccnt_cached_cycles is used to hold the last cycle count when
@@ -463,6 +464,8 @@ typedef struct CPUARMState {
          * PMU operations which require this.
          */
         uint64_t ccnt_cached_cycles;
+        uint64_t c14_pmevcntr[31];
+        uint64_t c14_pmevtyper[31];
         uint64_t pmccfiltr_el0; /* Performance Monitor Filter Register */
         uint64_t vpidr_el2; /* Virtualization Processor ID Register */
         uint64_t vmpidr_el2; /* Virtualization Multiprocessor ID Register */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6a4f900..2fa8308 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -906,6 +906,7 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
 #define PMCRN_SHIFT 11
 #define PMCRD   0x8
 #define PMCRC   0x4
+#define PMCRP   0x2
 #define PMCRE   0x1
 
 #define PMXEVTYPER_P          0x80000000
@@ -931,7 +932,7 @@ typedef struct pm_event {
     bool (*supported)(CPUARMState *);
     /* Retrieve the current count of the underlying event. The programmed
      * counters hold a difference from the return value from this function */
-    uint64_t (*get_count)(CPUARMState *);
+    uint64_t (*get_count)(CPUARMState *, uint64_t cycles);
 } pm_event;
 
 #define SUPPORTED_EVENT_SENTINEL UINT16_MAX
@@ -1054,6 +1055,21 @@ static inline bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
         return false;
     }
 
+    if (counter != 31) {
+        /* If not checking PMCCNTR, ensure the counter is setup to an event we
+         * support */
+        uint16_t event = env->cp15.c14_pmevtyper[counter] & PMXEVTYPER_EVTCOUNT;
+        if (event > 0x3f) {
+            return false; /* We only support common architectural and
+                             microarchitectural events */
+        }
+
+        uint16_t event_idx = supported_event_map[event];
+        if (event_idx == SUPPORTED_EVENT_SENTINEL) {
+            return false;
+        }
+    }
+
     return true;
 }
 
@@ -1149,14 +1165,37 @@ void pmccntr_op_finish(CPUARMState *env, uint64_t prev_cycles)
     }
 }
 
+static void pmu_sync_counter(CPUARMState *env, uint8_t counter, uint64_t cycles)
+{
+    if (pmu_counter_enabled(env, counter) &&
+        !pmu_counter_filtered(env, env->cp15.c14_pmevtyper[counter])) {
+
+        uint16_t event = env->cp15.c14_pmevtyper[counter] & PMXEVTYPER_EVTCOUNT;
+        uint16_t event_idx = supported_event_map[event];
+
+        uint64_t count = pm_events[event_idx].get_count(env, cycles);
+        env->cp15.c14_pmevcntr[counter] =
+            count - env->cp15.c14_pmevcntr[counter];
+    }
+}
+
 uint64_t pmu_op_start(CPUARMState *env)
 {
-    return pmccntr_op_start(env);
+    uint64_t saved_cycles = pmccntr_op_start(env);
+    unsigned int i;
+    for (i = 0; i < PMU_NUM_COUNTERS(env); i++) {
+        pmu_sync_counter(env, i, saved_cycles);
+    }
+    return saved_cycles;
 }
 
 void pmu_op_finish(CPUARMState *env, uint64_t prev_cycles)
 {
     pmccntr_op_finish(env, prev_cycles);
+    unsigned int i;
+    for (i = 0; i < PMU_NUM_COUNTERS(env); i++) {
+        pmu_sync_counter(env, i, prev_cycles);
+    }
 }
 
 void pmu_pre_el_change(ARMCPU *cpu, void *ignored)
@@ -1179,6 +1218,13 @@ static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
         env->cp15.c15_ccnt = 0;
     }
 
+    if (value & PMCRP) {
+        unsigned int i;
+        for (i = 0; i < PMU_NUM_COUNTERS(env); i++) {
+            env->cp15.c14_pmevcntr[i] = 0;
+        }
+    }
+
     /* only the DP, X, D and E bits are writable */
     env->cp15.c9_pmcr &= ~0x39;
     env->cp15.c9_pmcr |= (value & 0x39);
@@ -1294,30 +1340,127 @@ static void pmovsset_write(CPUARMState *env, const ARMCPRegInfo *ri,
     env->cp15.c9_pmovsr |= value;
 }
 
-static void pmxevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                             uint64_t value)
+static void pmevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value, const uint8_t counter)
 {
+    if (counter == 0x1f) {
+        pmccfiltr_write(env, ri, value);
+    } else if (counter < PMU_NUM_COUNTERS(env)) {
+        uint64_t cycles = 0;
+#ifndef CONFIG_USER_ONLY
+        cycles = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                          ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
+#endif
+        pmu_sync_counter(env, counter, cycles);
+        env->cp15.c14_pmevtyper[counter] = value & 0xfe0003ff;
+        pmu_sync_counter(env, counter, cycles);
+    }
     /* Attempts to access PMXEVTYPER are CONSTRAINED UNPREDICTABLE when
      * PMSELR value is equal to or greater than the number of implemented
      * counters, but not equal to 0x1f. We opt to behave as a RAZ/WI.
      */
-    if (env->cp15.c9_pmselr == 0x1f) {
-        pmccfiltr_write(env, ri, value);
+}
+
+static uint64_t pmevtyper_read(CPUARMState *env, const ARMCPRegInfo *ri,
+                               const uint8_t counter)
+{
+    if (counter == 0x1f) {
+        return env->cp15.pmccfiltr_el0;
+    } else if (counter < PMU_NUM_COUNTERS(env)) {
+        return env->cp15.c14_pmevtyper[counter];
+    } else {
+      /* We opt to behave as a RAZ/WI when attempts to access PMXEVTYPER
+       * are CONSTRAINED UNPREDICTABLE. See comments in pmevtyper_write().
+       */
+        return 0;
     }
 }
 
+static void pmevtyper_writefn(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    uint8_t counter = ((ri->crm & 3) << 3) | (ri->opc2 & 7);
+    pmevtyper_write(env, ri, value, counter);
+}
+
+static uint64_t pmevtyper_readfn(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    uint8_t counter = ((ri->crm & 3) << 3) | (ri->opc2 & 7);
+    return pmevtyper_read(env, ri, counter);
+}
+
+static void pmxevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value)
+{
+    pmevtyper_write(env, ri, value, env->cp15.c9_pmselr & 31);
+}
+
 static uint64_t pmxevtyper_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-    /* We opt to behave as a RAZ/WI when attempts to access PMXEVTYPER
-     * are CONSTRAINED UNPREDICTABLE. See comments in pmxevtyper_write().
-     */
-    if (env->cp15.c9_pmselr == 0x1f) {
-        return env->cp15.pmccfiltr_el0;
+    return pmevtyper_read(env, ri, env->cp15.c9_pmselr & 31);
+}
+
+static void pmevcntr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value, uint8_t counter)
+{
+    if (counter < PMU_NUM_COUNTERS(env)) {
+        uint64_t cycles = 0;
+#ifndef CONFIG_USER_ONLY
+        cycles = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                          ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
+#endif
+        env->cp15.c14_pmevcntr[counter] = value;
+        pmu_sync_counter(env, counter, cycles);
+    }
+    /* We opt to behave as a RAZ/WI when attempts to access PM[X]EVCNTR
+     * are CONSTRAINED UNPREDICTABLE. */
+}
+
+static uint64_t pmevcntr_read(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint8_t counter)
+{
+    if (counter < PMU_NUM_COUNTERS(env)) {
+        uint64_t ret;
+        uint64_t cycles = 0;
+#ifndef CONFIG_USER_ONLY
+        cycles = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                          ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
+#endif
+        pmu_sync_counter(env, counter, cycles);
+        ret = env->cp15.c14_pmevcntr[counter];
+        pmu_sync_counter(env, counter, cycles);
+        return ret;
     } else {
+      /* We opt to behave as a RAZ/WI when attempts to access PM[X]EVCNTR
+       * are CONSTRAINED UNPREDICTABLE. */
         return 0;
     }
 }
 
+static void pmevcntr_writefn(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value)
+{
+    uint8_t counter = ((ri->crm & 3) << 3) | (ri->opc2 & 7);
+    pmevcntr_write(env, ri, value, counter);
+}
+
+static uint64_t pmevcntr_readfn(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    uint8_t counter = ((ri->crm & 3) << 3) | (ri->opc2 & 7);
+    return pmevcntr_read(env, ri, counter);
+}
+
+static void pmxevcntr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value)
+{
+    pmevcntr_write(env, ri, value, env->cp15.c9_pmselr & 31);
+}
+
+static uint64_t pmxevcntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return pmevcntr_read(env, ri, env->cp15.c9_pmselr & 31);
+}
+
 static void pmuserenr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
@@ -1504,16 +1647,23 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.pmccfiltr_el0),
       .resetvalue = 0, },
     { .name = "PMXEVTYPER", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 1,
-      .access = PL0_RW, .type = ARM_CP_NO_RAW, .accessfn = pmreg_access,
+      .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+      .accessfn = pmreg_access,
       .writefn = pmxevtyper_write, .readfn = pmxevtyper_read },
     { .name = "PMXEVTYPER_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 13, .opc2 = 1,
-      .access = PL0_RW, .type = ARM_CP_NO_RAW, .accessfn = pmreg_access,
+      .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+      .accessfn = pmreg_access,
       .writefn = pmxevtyper_write, .readfn = pmxevtyper_read },
-    /* Unimplemented, RAZ/WI. */
     { .name = "PMXEVCNTR", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 2,
-      .access = PL0_RW, .type = ARM_CP_CONST, .resetvalue = 0,
-      .accessfn = pmreg_access_xevcntr },
+      .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+      .accessfn = pmreg_access_xevcntr,
+      .writefn = pmxevcntr_write, .readfn = pmxevcntr_read },
+    { .name = "PMXEVCNTR_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 13, .opc2 = 2,
+      .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+      .accessfn = pmreg_access_xevcntr,
+      .writefn = pmxevcntr_write, .readfn = pmxevcntr_read },
     { .name = "PMUSERENR", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 0,
       .access = PL0_R | PL1_RW, .accessfn = access_tpm,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmuserenr),
@@ -4204,7 +4354,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
 #endif
     /* The only field of MDCR_EL2 that has a defined architectural reset value
      * is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N; but we
-     * don't impelment any PMU event counters, so using zero as a reset
+     * don't implement any PMU event counters, so using zero as a reset
      * value for MDCR_EL2 is okay
      */
     { .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
@@ -5016,6 +5166,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, v7ve_cp_reginfo);
     }
     if (arm_feature(env, ARM_FEATURE_V7)) {
+        unsigned int i;
         /* v7 performance monitor control register: same implementor
          * field as main ID register, and we implement only the cycle
          * count register.
@@ -5040,6 +5191,40 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         };
         define_one_arm_cp_reg(cpu, &pmcr);
         define_one_arm_cp_reg(cpu, &pmcr64);
+        for (i = 0; i < 31; i++) {
+            char *pmevcntr_name = g_strdup_printf("PMEVCNTR%d", i);
+            char *pmevcntr_el0_name = g_strdup_printf("PMEVCNTR%d_EL0", i);
+            char *pmevtyper_name = g_strdup_printf("PMEVTYPER%d", i);
+            char *pmevtyper_el0_name = g_strdup_printf("PMEVTYPER%d_EL0", i);
+            ARMCPRegInfo pmev_regs[] = {
+                { .name = pmevcntr_name, .cp = 15, .crn = 15,
+                  .crm = 8 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
+                  .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+                  .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn,
+                  .accessfn = pmreg_access },
+                { .name = pmevcntr_el0_name, .state = ARM_CP_STATE_AA64,
+                  .opc0 = 3, .opc1 = 3, .crn = 15, .crm = 8 | (3 & (i >> 3)),
+                  .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access,
+                  .type = ARM_CP_NO_RAW | ARM_CP_IO,
+                  .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn },
+                { .name = pmevtyper_name, .cp = 15, .crn = 15,
+                  .crm = 12 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
+                  .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+                  .readfn = pmevtyper_readfn, .writefn = pmevtyper_writefn,
+                  .accessfn = pmreg_access },
+                { .name = pmevtyper_el0_name, .state = ARM_CP_STATE_AA64,
+                  .opc0 = 3, .opc1 = 3, .crn = 15, .crm = 12 | (3 & (i >> 3)),
+                  .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access,
+                  .type = ARM_CP_NO_RAW | ARM_CP_IO,
+                  .readfn = pmevtyper_readfn, .writefn = pmevtyper_writefn },
+                REGINFO_SENTINEL
+            };
+            define_arm_cp_regs(cpu, pmev_regs);
+            g_free(pmevcntr_name);
+            g_free(pmevcntr_el0_name);
+            g_free(pmevtyper_name);
+            g_free(pmevtyper_el0_name);
+        }
 #endif
         ARMCPRegInfo clidr = {
             .name = "CLIDR", .state = ARM_CP_STATE_BOTH,
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

