Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1252029wrq;
        Fri, 22 Jun 2018 13:37:17 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJbGTQAfF/TdCH1z2IQaCHeupMDtM1LK0xIoGCWSCQB9skQZnQwfSGx0QWLyoUTZDBYftK7
X-Received: by 2002:ac8:3358:: with SMTP id u24-v6mr2778368qta.31.1529699837236;
        Fri, 22 Jun 2018 13:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529699837; cv=none;
        d=google.com; s=arc-20160816;
        b=Ze4Mqf005SN4LyiMs69NWXrhWhcGJxus1xI1XStmZXqhW6PiOEGt4coHeAxnt3zUX4
         BY6iF7O+yWhgpykegkQDrbiKXym71yDcPEKtvDDXQWhZJNgTeseFLi365/DDPCcj5t1E
         8tkEMI1A8NT2evx0FuH16FUlmxzjcGxEGAvQu/9n2gpyvhRAaSyvniY9xaNuMOtGEPQg
         +BqnV5XqcErtiLNHPQkQXSyTNlIB2u99ch6Qeusnfb4FthNITX6ynnwHBYJvS+FVn64L
         6s2rl0fyC2HYfMJAmt49yqcnmMFdPTw4ntFvFVuorRXFvSrKW4vTfn0qeazL4jUfuiZz
         ZdKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=ksdAm7yXL8g/oPQJi7o4uTgFxelM2TIR1JInZGlGFCY=;
        b=AzfMWCHhwFFPphulGGlvwFurEl7l6MPHHFY2H00bmLqkhHzWPQwxHZZEUa7tQYWq2g
         Hk096IxuzhzIBQzSQ0hq77JZvbVN9x+LpOuxpMd14WBScJOcoOdBwPwSK8IXe1MCq6VV
         BCkS0LVAzfSnUuGu9zu7LNN/D5zPOS3iQ/kbQSZ3hnuaN59DaKc5bALeGeTdkM6zYPpZ
         nmT/oE346qtLWeRnHo6qPismvRgDds1VcN0UN+s9xQMExKH0vxrzZA2Ac40+ny1Qdz/F
         MiQWBbvklja2HvnM8ZdpLAO973DgnR1W9s2w9LvNJQk0qdNS6XVxTBXDZsMgnCd2y+FF
         vftw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=iG4fsrHJ;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=iG4fsrHJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z141-v6si1701398qka.347.2018.06.22.13.37.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 13:37:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=iG4fsrHJ;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=iG4fsrHJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36098 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWSo0-0005mT-NH
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 16:37:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSjg-0002Cw-Fb
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:32:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSjf-0005UB-4S
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:32:48 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45738)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1fWSje-0005Ty-RM; Fri, 22 Jun 2018 16:32:47 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id EC26760B18; Fri, 22 Jun 2018 20:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699565;
	bh=kxTqBTIOZkPpnahXDZ6jA0/DUump16SXXMQLnyE9kUE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iG4fsrHJAmGPrA3N13IsrelhhjYWencFGC6pRz8vkSUf+ipLc6dU1V3frqE2EaDyp
	lx7szk3arnNCwvtvtn1y9Skrt4CtktEcBOCzi7kIT7sQUr2IStixSgtAhmdWVm9add
	bwW3oXbWiURO7pKX2RCCWcL9SOq0ZZXkEKjLXdbE=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 2804860B18;
	Fri, 22 Jun 2018 20:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699565;
	bh=kxTqBTIOZkPpnahXDZ6jA0/DUump16SXXMQLnyE9kUE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iG4fsrHJAmGPrA3N13IsrelhhjYWencFGC6pRz8vkSUf+ipLc6dU1V3frqE2EaDyp
	lx7szk3arnNCwvtvtn1y9Skrt4CtktEcBOCzi7kIT7sQUr2IStixSgtAhmdWVm9add
	bwW3oXbWiURO7pKX2RCCWcL9SOq0ZZXkEKjLXdbE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2804860B18
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 22 Jun 2018 16:32:23 -0400
Message-Id: <1529699547-17044-10-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v5 09/13] target/arm: PMU: Add instruction and
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>, Aaron Lindsay <aclindsa@gmail.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b5CRZ4zwMcqY

The instruction event is only enabled when icount is used, cycles are
always supported. Always defining get_cycle_count (but altering its
behavior depending on CONFIG_USER_ONLY) allows us to remove some
CONFIG_USER_ONLY #defines throughout the rest of the code.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 88 ++++++++++++++++++++++++++---------------------------
 1 file changed, 43 insertions(+), 45 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f1fd21c..92ebd21 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -15,6 +15,7 @@
 #include "arm_ldst.h"
 #include <zlib.h> /* For crc32 */
 #include "exec/semihost.h"
+#include "sysemu/cpus.h"
 #include "sysemu/kvm.h"
 #include "fpu/softfloat.h"
 
@@ -974,8 +975,49 @@ typedef struct pm_event {
     uint64_t (*get_count)(CPUARMState *);
 } pm_event;
 
+static bool event_always_supported(CPUARMState *env)
+{
+    return true;
+}
+
+/*
+ * Return the underlying cycle count for the PMU cycle counters. If we're in
+ * usermode, simply return 0.
+ */
+static uint64_t cycles_get_count(CPUARMState *env)
+{
+#ifndef CONFIG_USER_ONLY
+    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                   ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
+#else
+    return 0;
+#endif
+}
+
+#ifndef CONFIG_USER_ONLY
+static bool instructions_supported(CPUARMState *env)
+{
+    return use_icount == 1 /* Precise instruction counting */;
+}
+
+static uint64_t instructions_get_count(CPUARMState *env)
+{
+    return (uint64_t)cpu_get_icount_raw();
+}
+#endif
+
 #define SUPPORTED_EVENT_SENTINEL UINT16_MAX
 static const pm_event pm_events[] = {
+#ifndef CONFIG_USER_ONLY
+    { .number = 0x008, /* INST_RETIRED, Instruction architecturally executed */
+      .supported = instructions_supported,
+      .get_count = instructions_get_count
+    },
+    { .number = 0x011, /* CPU_CYCLES, Cycle */
+      .supported = event_always_supported,
+      .get_count = cycles_get_count
+    },
+#endif
     { .number = SUPPORTED_EVENT_SENTINEL }
 };
 static uint16_t supported_event_map[0x3f];
@@ -1055,8 +1097,6 @@ static CPAccessResult pmreg_access_swinc(CPUARMState *env,
     return pmreg_access(env, ri, isread);
 }
 
-#ifndef CONFIG_USER_ONLY
-
 static CPAccessResult pmreg_access_selr(CPUARMState *env,
                                         const ARMCPRegInfo *ri,
                                         bool isread)
@@ -1171,9 +1211,7 @@ static inline bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
  */
 void pmccntr_op_start(CPUARMState *env)
 {
-    uint64_t cycles = 0;
-    cycles = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-                          ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
+    uint64_t cycles = cycles_get_count(env);
 
     if (pmu_counter_enabled(env, 31)) {
         uint64_t eff_cycles = cycles;
@@ -1316,42 +1354,6 @@ static void pmccntr_write32(CPUARMState *env, const ARMCPRegInfo *ri,
     pmccntr_write(env, ri, deposit64(cur_val, 0, 32, value));
 }
 
-#else /* CONFIG_USER_ONLY */
-
-void pmccntr_op_start(CPUARMState *env)
-{
-}
-
-void pmccntr_op_finish(CPUARMState *env)
-{
-}
-
-void pmevcntr_op_start(CPUARMState *env, uint8_t i)
-{
-}
-
-void pmevcntr_op_finish(CPUARMState *env, uint8_t i)
-{
-}
-
-void pmu_op_start(CPUARMState *env)
-{
-}
-
-void pmu_op_finish(CPUARMState *env)
-{
-}
-
-void pmu_pre_el_change(ARMCPU *cpu, void *ignored)
-{
-}
-
-void pmu_post_el_change(ARMCPU *cpu, void *ignored)
-{
-}
-
-#endif
-
 static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
@@ -1664,7 +1666,6 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
     /* Unimplemented so WI. */
     { .name = "PMSWINC", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 4,
       .access = PL0_W, .accessfn = pmreg_access_swinc, .type = ARM_CP_NOP },
-#ifndef CONFIG_USER_ONLY
     { .name = "PMSELR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 5,
       .access = PL0_RW, .type = ARM_CP_ALIAS,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmselr),
@@ -1684,7 +1685,6 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .access = PL0_RW, .accessfn = pmreg_access_ccntr,
       .type = ARM_CP_IO,
       .readfn = pmccntr_read, .writefn = pmccntr_write, },
-#endif
     { .name = "PMCCFILTR", .cp = 15, .opc1 = 0, .crn = 14, .crm = 15, .opc2 = 7,
       .writefn = pmccfiltr_write_a32, .readfn = pmccfiltr_read_a32,
       .access = PL0_RW, .accessfn = pmreg_access,
@@ -5220,7 +5220,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
          * field as main ID register, and we implement only the cycle
          * count register.
          */
-#ifndef CONFIG_USER_ONLY
         ARMCPRegInfo pmcr = {
             .name = "PMCR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 0,
             .access = PL0_RW,
@@ -5274,7 +5273,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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

