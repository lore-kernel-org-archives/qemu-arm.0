Received: by 10.28.91.67 with SMTP id p64csp1283526wmb;
        Fri, 16 Mar 2018 13:44:33 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvnxTg9BuDMdLKyGSqFHWpIyOBmngUFKrViD9qSHMr8IMfbsXNM7yVRHJBdQ5hl0COGMrqP
X-Received: by 10.55.214.25 with SMTP id t25mr4891310qki.233.1521233073349;
        Fri, 16 Mar 2018 13:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521233073; cv=none;
        d=google.com; s=arc-20160816;
        b=cBzEt4a9nhYBgmL12b5TpgZM4Ue1OqG/Ml/4eT/mxQondWWCpx2g2NnckyK2YE+W25
         gAbSx7AMc2J/GALfCJZQmskMe58cqcMSm1B0hdvL6mSFxyStdlyrLw7ByZoPm6IJo/d8
         4AaLMxVmAeOvPgjZyApWvywZI/5kOeEMdZFA/IzTzQxWja4xdf6fYEkFNr4H3Yt+lj3M
         HaAWzO4exAQE+AHz9j/yCCFgtKaxmSF9Z0e+ZybA7Yk0pPBKMkENLjjPDZ0Z2SbNZLP3
         435JXILvqVhE8VybAwb9hE+qGyOMk1U/w/nfrO5KgbIIwWfeJjbXMphlrW8s318M2yAZ
         vsvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=wnNF1lSss4GPnOW6p9zXJwKrKJeiA6EwnODqs5RCD3w=;
        b=Pp0xKM4B5T331++gvj6JbWFvcjNQd6dfVt1lYniiouuo2n8lmRCXezwOrZsmiHbJJ+
         hkZsA2W80YNGDfQxrnwucynP+pBMHilRcUjDcNBbK8NWXiInvg3Cq++5rLZLNvLBbRg1
         DPhX9DmCzuN9v61nupQ8iEKM7KCe/TVyqJh0DUU5W5dKOtZGqXZEmEqDtDT6HibA0j6C
         zdwmn/Z0SqBQiriw7Exqvkw4svSF2ZuyyGuQ7fBGsVEelOB39moJiUzHJKPT9FJbSKHU
         StGz6RVybXpGIFtN5z5/QBWKuK5tW4WvkREzynTangYmVpC1geZ5efWx6+20BDr8Z1Cn
         a59A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=M/YJFfkR;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=TqgqGHkx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o37si8336171qte.88.2018.03.16.13.44.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Mar 2018 13:44:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=M/YJFfkR;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=TqgqGHkx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59521 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ewwDI-0008Dd-O6
	for alex.bennee@linaro.org; Fri, 16 Mar 2018 16:44:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1i-00068u-I9
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1h-0003h2-4m
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:34 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56804)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1eww1g-0003fs-R4; Fri, 16 Mar 2018 16:32:33 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 6976860C66; Fri, 16 Mar 2018 20:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232351;
	bh=hD2JAL+smX2M7pgyuu36QrwMtC3z+hPAeONI/PxEw7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M/YJFfkRizn++NBZA7mxxf84TXHc7CJ97rkfiEGovO540TvcI5SNb27P8/BYEh8nL
	1V16q6nmGXQCyMt3VeQJr7nC375+uqSXuiECUrPq6O46oXIUVNEWdsL+ybDi2w08Vk
	p/xR1LDAUdOqt6W3BfZeSh91EDcAyYxXHL7HI7go=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 6C64860FED;
	Fri, 16 Mar 2018 20:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232343;
	bh=hD2JAL+smX2M7pgyuu36QrwMtC3z+hPAeONI/PxEw7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TqgqGHkxlsiPquEdHzQyN6aexi9IARSqFzGzgDPJXZavnz/g/EpKOK0rgdywGXlLb
	5RyhvDLz0YuF13MHfvt+wkahGOcro1GdfuvCU8Cr2hhThsykvW/u5k8rElX0Rst7MV
	OK4pa/+HScmtNuPaIZtPFcCmYL50c25MUWHjPnSo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6C64860FED
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 16 Mar 2018 16:31:18 -0400
Message-Id: <1521232280-13089-21-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v3 20/22] target/arm: PMU: Add instruction and
 cycle events
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
X-TUID: H2KMK87D9OQL

The instruction event is only enabled when icount is used, cycles are
always supported. Always defining get_cycle_count (but altering its
behavior depending on CONFIG_USER_ONLY) allows us to remove some
CONFIG_USER_ONLY #defines throughout the rest of the code.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 99 ++++++++++++++++++++++++++++-------------------------
 1 file changed, 52 insertions(+), 47 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2fa8308..679897a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -15,6 +15,7 @@
 #include "arm_ldst.h"
 #include <zlib.h> /* For crc32 */
 #include "exec/semihost.h"
+#include "sysemu/cpus.h"
 #include "sysemu/kvm.h"
 #include "fpu/softfloat.h"
 
@@ -935,8 +936,54 @@ typedef struct pm_event {
     uint64_t (*get_count)(CPUARMState *, uint64_t cycles);
 } pm_event;
 
+/*
+ * Return the underlying cycle count for the PMU cycle counters. If we're in
+ * usermode, simply return 0.
+ */
+static uint64_t get_cycle_count(CPUARMState *env)
+{
+#ifndef CONFIG_USER_ONLY
+    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                   ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
+#else
+    return 0;
+#endif
+}
+
+static bool event_always_supported(CPUARMState *env)
+{
+    return true;
+}
+
+#ifndef CONFIG_USER_ONLY
+static uint64_t cycles_get_count(CPUARMState *env, uint64_t cycles)
+{
+    return cycles;
+}
+
+static bool instructions_supported(CPUARMState *env)
+{
+    return use_icount == 1 /* Precise instruction counting */;
+}
+
+static uint64_t instructions_get_count(CPUARMState *env, uint64_t cycles)
+{
+    return (uint64_t)cpu_get_icount_raw();
+}
+#endif
+
 #define SUPPORTED_EVENT_SENTINEL UINT16_MAX
 static const pm_event pm_events[] = {
+#ifndef CONFIG_USER_ONLY
+    { .number = 0x008, /* INST_RETIRED */
+      .supported = instructions_supported,
+      .get_count = instructions_get_count
+    },
+    { .number = 0x011, /* CPU_CYCLES */
+      .supported = event_always_supported,
+      .get_count = cycles_get_count
+    },
+#endif
     { .number = SUPPORTED_EVENT_SENTINEL }
 };
 static uint16_t supported_event_map[0x3f];
@@ -1016,8 +1063,6 @@ static CPAccessResult pmreg_access_swinc(CPUARMState *env,
     return pmreg_access(env, ri, isread);
 }
 
-#ifndef CONFIG_USER_ONLY
-
 static CPAccessResult pmreg_access_selr(CPUARMState *env,
                                         const ARMCPRegInfo *ri,
                                         bool isread)
@@ -1126,11 +1171,7 @@ static inline bool pmu_counter_filtered(CPUARMState *env, uint64_t pmxevtyper)
  */
 uint64_t pmccntr_op_start(CPUARMState *env)
 {
-    uint64_t cycles = 0;
-#ifndef CONFIG_USER_ONLY
-    cycles = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-                          ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
-#endif
+    uint64_t cycles = get_cycle_count(env);
 
     if (arm_ccnt_enabled(env) &&
           !pmu_counter_filtered(env, env->cp15.pmccfiltr_el0)) {
@@ -1268,26 +1309,6 @@ static void pmccntr_write32(CPUARMState *env, const ARMCPRegInfo *ri,
     pmccntr_write(env, ri, deposit64(cur_val, 0, 32, value));
 }
 
-#else /* CONFIG_USER_ONLY */
-
-uint64_t pmccntr_op_start(CPUARMState *env)
-{
-}
-
-void pmccntr_op_finish(CPUARMState *env, uint64_t prev_cycles)
-{
-}
-
-uint64_t pmu_op_start(CPUARMState *env)
-{
-}
-
-void pmu_op_finish(CPUARMState *env, uint64_t prev_cycles)
-{
-}
-
-#endif
-
 static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
@@ -1346,11 +1367,7 @@ static void pmevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if (counter == 0x1f) {
         pmccfiltr_write(env, ri, value);
     } else if (counter < PMU_NUM_COUNTERS(env)) {
-        uint64_t cycles = 0;
-#ifndef CONFIG_USER_ONLY
-        cycles = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-                          ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
-#endif
+        uint64_t cycles = get_cycle_count(env);
         pmu_sync_counter(env, counter, cycles);
         env->cp15.c14_pmevtyper[counter] = value & 0xfe0003ff;
         pmu_sync_counter(env, counter, cycles);
@@ -1404,11 +1421,7 @@ static void pmevcntr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value, uint8_t counter)
 {
     if (counter < PMU_NUM_COUNTERS(env)) {
-        uint64_t cycles = 0;
-#ifndef CONFIG_USER_ONLY
-        cycles = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-                          ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
-#endif
+        uint64_t cycles = get_cycle_count(env);
         env->cp15.c14_pmevcntr[counter] = value;
         pmu_sync_counter(env, counter, cycles);
     }
@@ -1420,12 +1433,8 @@ static uint64_t pmevcntr_read(CPUARMState *env, const ARMCPRegInfo *ri,
                               uint8_t counter)
 {
     if (counter < PMU_NUM_COUNTERS(env)) {
-        uint64_t ret;
-        uint64_t cycles = 0;
-#ifndef CONFIG_USER_ONLY
-        cycles = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-                          ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
-#endif
+        uint64_t ret, cycles;
+        cycles = get_cycle_count(env);
         pmu_sync_counter(env, counter, cycles);
         ret = env->cp15.c14_pmevcntr[counter];
         pmu_sync_counter(env, counter, cycles);
@@ -1613,7 +1622,6 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
     /* Unimplemented so WI. */
     { .name = "PMSWINC", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 4,
       .access = PL0_W, .accessfn = pmreg_access_swinc, .type = ARM_CP_NOP },
-#ifndef CONFIG_USER_ONLY
     { .name = "PMSELR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 5,
       .access = PL0_RW, .type = ARM_CP_ALIAS,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmselr),
@@ -1633,7 +1641,6 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .access = PL0_RW, .accessfn = pmreg_access_ccntr,
       .type = ARM_CP_IO,
       .readfn = pmccntr_read, .writefn = pmccntr_write, },
-#endif
     { .name = "PMCCFILTR", .cp = 15, .opc1 = 0, .crn = 14, .crm = 15, .opc2 = 7,
       .writefn = pmccfiltr_write_a32, .readfn = pmccfiltr_read_a32,
       .access = PL0_RW, .accessfn = pmreg_access,
@@ -5171,7 +5178,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
          * field as main ID register, and we implement only the cycle
          * count register.
          */
-#ifndef CONFIG_USER_ONLY
         ARMCPRegInfo pmcr = {
             .name = "PMCR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 0,
             .access = PL0_RW,
@@ -5225,7 +5231,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             g_free(pmevtyper_name);
             g_free(pmevtyper_el0_name);
         }
-#endif
         ARMCPRegInfo clidr = {
             .name = "CLIDR", .state = ARM_CP_STATE_BOTH,
             .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 1, .opc2 = 1,
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

