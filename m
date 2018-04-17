Received: by 10.28.4.212 with SMTP id 203csp4254481wme;
        Tue, 17 Apr 2018 13:44:41 -0700 (PDT)
X-Google-Smtp-Source: AIpwx494wOkYjAOnTv/yLnns6Fb6JRl4TOpcTbYeStBjUHbWkVLF/4F3lr2wkarO9RG8uhkup8NM
X-Received: by 10.55.93.65 with SMTP id r62mr3437184qkb.143.1523997881140;
        Tue, 17 Apr 2018 13:44:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523997881; cv=none;
        d=google.com; s=arc-20160816;
        b=b1DK3UCpzDQOlEoc2JXVfXHAsPw2W2PubAypZmRva6wnGV85Aw/oCgojWfE0axjUm9
         4QA+zQ0olPu5AeYzQonMtGTO4CtJtGqfawsbkmblQTRB1O2Qo8mJTKN/RiLNvDqKss6G
         3+gxwt59cJdxgGU4krHd3tgENjZk8bquOjWgMW1k5tv5/MBjmEbrPFs2wUX1y6uGlumm
         Q0iet21Hs+amxixanZVRFfnq6dljAOGbJXTovZXm1d1ZMQcCGcA0b8jEJow4tm6JxUXv
         sfe3sxbjxLyNZ5JEc/G216zTtiY80Ru29eO6us1bPd962sQtTzvInHryrcJuLxYZpmq3
         jS/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=J64GKgKbMbc8LYjkI59CzQfHR0LidOj97V+xwEoKe1E=;
        b=H7+apkehFcT8+MWL6WY5KVqeS4MsDhrqd25/cYrY1dqI7rSftZq9D8JJkWAeCIkvue
         pZnvAoDUNvwwjFP+Wtxo7CZXH3YdHhmilWXJzJFwqmhtRykjlhmjRb8vVJT3cwnIclwB
         yuYaqF/E9240wRkQIFpK32Afx6o5Pb0RfD4r0rfStw9CvN+pFyWYMDIkAiNsGX+KsvX8
         QtcJK5Q2hKBFwIiV0+9njRkUo/5IjrzRQoDNtz9a6U/8WKI7bzbNleh9gnxBOX/HpNH2
         wSJwsP0fHrhdmozZwbu/z9aZ+ehfeDVxD7ZfUp7Cekk80Y2KuNR/Zz7eIBTK4IbM/3DD
         41Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=T09JOAHm;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=l79b6FI5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x45si3027438qth.217.2018.04.17.13.44.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 13:44:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=T09JOAHm;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=l79b6FI5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33349 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8XSy-0007Zq-JG
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 16:44:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNi-000383-PN
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNg-0006pw-6Q
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:14 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:40276)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8XNf-0006fn-So; Tue, 17 Apr 2018 16:39:12 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 3723B6081C; Tue, 17 Apr 2018 20:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997550;
	bh=meTjskNCzVprdv1hIohzSs2e7p3QlAO+XWhT6wsYkVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T09JOAHm1uoGPI7FBI72/x/EzKqN6u6p4tghIlwhCsJxmbhhD0brnF1Ak0KwdhqG/
	32mQiT/IGZ8LzMWg4kZm/HWA6sojJBf3IXXjXQNE5rckw4EW1eB9s+uzhksur4wPYv
	E8A1G250k7b1T92d73BkjnmDvrRg7pt4cYqUMXlQ=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id B1B1D61133;
	Tue, 17 Apr 2018 20:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997546;
	bh=meTjskNCzVprdv1hIohzSs2e7p3QlAO+XWhT6wsYkVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l79b6FI5EXH8T4v1/8LIDZz6xOSWhjgIJK6wLJTSC6JocidL9iTO/5XbTrzl/C0ev
	Bhk5UYskfjRFm+vCvygt8LiSEkInBf/qXqPxzC5Ter6WYU3zkhDnx+ahWq/HfVWmnq
	7GVphcIm8dG1fAoGHTVmtMpwSPIxPzHyzcjbBCXY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B1B1D61133
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 17 Apr 2018 16:38:01 -0400
Message-Id: <1523997485-1905-18-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v4 17/21] target/arm: PMU: Add instruction and
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
X-TUID: qoLW1XEPFTzV

The instruction event is only enabled when icount is used, cycles are
always supported. Always defining get_cycle_count (but altering its
behavior depending on CONFIG_USER_ONLY) allows us to remove some
CONFIG_USER_ONLY #defines throughout the rest of the code.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 88 ++++++++++++++++++++++++++---------------------------
 1 file changed, 43 insertions(+), 45 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b36630f..b91f022 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -15,6 +15,7 @@
 #include "arm_ldst.h"
 #include <zlib.h> /* For crc32 */
 #include "exec/semihost.h"
+#include "sysemu/cpus.h"
 #include "sysemu/kvm.h"
 #include "fpu/softfloat.h"
 
@@ -943,8 +944,49 @@ typedef struct pm_event {
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
@@ -1024,8 +1066,6 @@ static CPAccessResult pmreg_access_swinc(CPUARMState *env,
     return pmreg_access(env, ri, isread);
 }
 
-#ifndef CONFIG_USER_ONLY
-
 static CPAccessResult pmreg_access_selr(CPUARMState *env,
                                         const ARMCPRegInfo *ri,
                                         bool isread)
@@ -1140,9 +1180,7 @@ static inline bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
  */
 void pmccntr_op_start(CPUARMState *env)
 {
-    uint64_t cycles = 0;
-    cycles = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-                          ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
+    uint64_t cycles = cycles_get_count(env);
 
     if (pmu_counter_enabled(env, 31)) {
         uint64_t eff_cycles = cycles;
@@ -1285,42 +1323,6 @@ static void pmccntr_write32(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -1633,7 +1635,6 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
     /* Unimplemented so WI. */
     { .name = "PMSWINC", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 4,
       .access = PL0_W, .accessfn = pmreg_access_swinc, .type = ARM_CP_NOP },
-#ifndef CONFIG_USER_ONLY
     { .name = "PMSELR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 5,
       .access = PL0_RW, .type = ARM_CP_ALIAS,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmselr),
@@ -1653,7 +1654,6 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .access = PL0_RW, .accessfn = pmreg_access_ccntr,
       .type = ARM_CP_IO,
       .readfn = pmccntr_read, .writefn = pmccntr_write, },
-#endif
     { .name = "PMCCFILTR", .cp = 15, .opc1 = 0, .crn = 14, .crm = 15, .opc2 = 7,
       .writefn = pmccfiltr_write_a32, .readfn = pmccfiltr_read_a32,
       .access = PL0_RW, .accessfn = pmreg_access,
@@ -5191,7 +5191,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
          * field as main ID register, and we implement only the cycle
          * count register.
          */
-#ifndef CONFIG_USER_ONLY
         ARMCPRegInfo pmcr = {
             .name = "PMCR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 0,
             .access = PL0_RW,
@@ -5245,7 +5244,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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

