Received: by 10.223.197.9 with SMTP id q9csp1229421wrf;
        Fri, 29 Sep 2017 19:12:49 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QD4G9ZMef2DVcVEctRfrbtAJFTOyyCOElEzCfrb7YTlReZOD3VPfwzsbPGbar7E9wkDYktA
X-Received: by 10.55.157.87 with SMTP id g84mr6162714qke.70.1506737569065;
        Fri, 29 Sep 2017 19:12:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506737569; cv=none;
        d=google.com; s=arc-20160816;
        b=fy3b8PJHsY0qO7SfD0Yxnyik5vbJnDRbC0vRztV1vHkV5Tokrx68kz3jB6DnQlVqzi
         ZOymtzGfzZz+D5txrrvuDTLdwZzigtt0advg584KfqIXPx4z8ORukVsIeFG0PoHKoeP4
         DkR3L04mGVJZr7e8uL5mLoyrGvTTF3AZ6BI9YjitQi++JXn+vzAun+hQjnOhfuyU9WtY
         LhyNUg0xFxUpvQYiM2753xA6s3INniRAcokWio20/hY7nEmrPlu5P3StRRaN7+La0HeW
         51bGI4HW6VvLIMMxhcmJ1QfAFOoq0DtEkGH+G+fUaj51sStftbAEuTjf4Z3NJXH72Ntp
         I91A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=D/6zq2eqkKpfkXc357t88MYKcNAnB3TA+/e+sIRUEGs=;
        b=VkJLccm8pej+UlOX/LTUfczzZJp8ayViKnYqIpW49thsdNV0iK75PsfnaChi/7Fqsl
         MkMJ/vnfpqLN2Var+W3E2h5BSpxJMh07KWCkEoflX03+XGFUWewwRaeSV0Y7aH810/Uv
         iKfsbjgNGoguM1PR+2w1v9CHtavTKf2TTXKdypUiGCtWLv4sy0yfJizNq4uerSMaKGa5
         Lu4MTM9O4gUF5KnVEsMn6LGQ2g4wna+/qnHqZOfgF6LcliP1h8N9gvLqWYLBMcQ+6Urd
         1MCpNEllc6B7bCdnNEYdcvdaxSdKHzOLAQVaP1W7dieJ/H0Hvv+wXO4LherSx6RpfQFx
         mepA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=kA6TpKxI;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=fUszYaTv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n143si2313933qke.245.2017.09.29.19.12.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Sep 2017 19:12:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=kA6TpKxI;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=fUszYaTv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Received: from localhost ([::1]:37804 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dy7Go-0005Dr-NG
	for alex.bennee@linaro.org; Fri, 29 Sep 2017 22:12:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7Dk-0002cT-Ls
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 22:09:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7Dh-0005Is-8M
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 22:09:36 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35602)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1dy7Dg-0005HY-Vn; Fri, 29 Sep 2017 22:09:33 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 26B3360D3A; Sat, 30 Sep 2017 02:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737372;
	bh=K7PF4SHm5s+dQoirrfKK1cPORp2ywukUDZoXDga4jyA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kA6TpKxIl9kbxHKkNG9c7fN0ZfCzh2eQ0vdgJpOzen17Q1frL1FTpdXePhDbhhVto
	Cbymm8vCg0w1V7YThSNejsfa9a0769rGjp4MOUMxyHpcQfVZe1UAxspMnLuukDeAH1
	5KbYeafsoKWjYSaDCO0lyjr+vMVgWM0oi5HeaOI8=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 032A660D06;
	Sat, 30 Sep 2017 02:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737371;
	bh=K7PF4SHm5s+dQoirrfKK1cPORp2ywukUDZoXDga4jyA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fUszYaTvYaZEka4KSax6VYjCG9dZMegqeBRansDnmJoA0CVI6q0TuP/2DTMPlL0xJ
	4mudZOtlt6eeE2Huv+yV3Haqf4+/rxIeWH0Wr+NG1FOLMnAfNHCQvilV/zZY4AzlGE
	nIOL67aiGRZgbmqUM9riug6+lLN8nQ9otaEVEwa0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 032A660D06
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Wei Huang <wei@redhat.com>
Date: Fri, 29 Sep 2017 22:08:28 -0400
Message-Id: <1506737310-21880-12-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH 11/13] target/arm: PMU: Add instruction and cycle
 events
X-BeenThere: qemu-arm@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@gnu.org>
List-Help: <mailto:qemu-arm-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=subscribe>
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
X-TUID: a2nnE5UbMygf

The instruction event is only enabled when icount is used, cycles are
always supported.

Note: Setting can_do_io=1 should not be done here. It is ugly and wrong,
but I am not sure of the proper way to handle this (See 'target/arm:
Filter cycle counter based on PMCCFILTR_EL0')

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 75 ++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 54 insertions(+), 21 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f183199..e48bb67 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -14,6 +14,7 @@
 #include "arm_ldst.h"
 #include <zlib.h> /* For crc32 */
 #include "exec/semihost.h"
+#include "sysemu/cpus.h"
 #include "sysemu/kvm.h"
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
@@ -901,8 +902,57 @@ typedef struct pm_event {
     uint64_t (*get_count)(CPUARMState *);
 } pm_event;
 
+static bool event_always_supported(CPUARMState *env)
+{
+    return true;
+}
+
+#ifndef CONFIG_USER_ONLY
+static uint64_t cycles_get_count(CPUARMState *env)
+{
+    uint64_t ret;
+    CPUState *cpu = ENV_GET_CPU(env);
+    uint32_t saved_can_do_io = cpu->can_do_io;
+    cpu->can_do_io = 1;
+
+    ret = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                   ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
+
+    cpu->can_do_io = saved_can_do_io;
+    return ret;
+}
+
+static bool instructions_supported(CPUARMState *env)
+{
+    return use_icount == 1 /* Precise instruction counting */;
+}
+
+static uint64_t instructions_get_count(CPUARMState *env)
+{
+    uint64_t ret;
+    CPUState *cpu = ENV_GET_CPU(env);
+    uint32_t saved_can_do_io = cpu->can_do_io;
+    cpu->can_do_io = 1;
+
+    ret = (uint64_t)cpu_get_icount_raw();
+
+    cpu->can_do_io = saved_can_do_io;
+    return ret;
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
@@ -982,8 +1032,6 @@ static CPAccessResult pmreg_access_swinc(CPUARMState *env,
     return pmreg_access(env, ri, isread);
 }
 
-#ifndef CONFIG_USER_ONLY
-
 static CPAccessResult pmreg_access_selr(CPUARMState *env,
                                         const ARMCPRegInfo *ri,
                                         bool isread)
@@ -1085,10 +1133,11 @@ void pmccntr_sync(CPUARMState *env)
 {
     if (arm_ccnt_enabled(env) &&
           !pmu_counter_filtered(env, env->cp15.pmccfiltr_el0)) {
-        uint64_t temp_ticks;
+        uint64_t temp_ticks = 0;
 
-        temp_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-                              ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
+#ifndef CONFIG_USER_ONLY
+        temp_ticks = cycles_get_count(env);
+#endif
 
         if (env->cp15.c9_pmcr & PMCRD) {
             /* Increment once every 64 processor clock cycles */
@@ -1181,18 +1230,6 @@ static void pmccntr_write32(CPUARMState *env, const ARMCPRegInfo *ri,
     pmccntr_write(env, ri, deposit64(cur_val, 0, 32, value));
 }
 
-#else /* CONFIG_USER_ONLY */
-
-void pmccntr_sync(CPUARMState *env)
-{
-}
-
-void pmu_sync(CPUARMState *env)
-{
-}
-
-#endif
-
 static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
@@ -1517,7 +1554,6 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
     /* Unimplemented so WI. */
     { .name = "PMSWINC", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 4,
       .access = PL0_W, .accessfn = pmreg_access_swinc, .type = ARM_CP_NOP },
-#ifndef CONFIG_USER_ONLY
     { .name = "PMSELR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 5,
       .access = PL0_RW, .type = ARM_CP_ALIAS,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmselr),
@@ -1537,7 +1573,6 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .access = PL0_RW, .accessfn = pmreg_access_ccntr,
       .type = ARM_CP_IO,
       .readfn = pmccntr_read, .writefn = pmccntr_write, },
-#endif
     { .name = "PMCCFILTR", .cp = 15, .opc1 = 0, .crn = 14, .crm = 15, .opc2 = 7,
       .writefn = pmccfiltr_write_a32, .readfn = pmccfiltr_read_a32,
       .access = PL0_RW, .accessfn = pmreg_access,
@@ -4877,7 +4912,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
          * field as main ID register, and we implement only the cycle
          * count register.
          */
-#ifndef CONFIG_USER_ONLY
         ARMCPRegInfo pmcr = {
             .name = "PMCR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 0,
             .access = PL0_RW,
@@ -4931,7 +4965,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             g_free(pmevtyper_name);
             g_free(pmevtyper_el0_name);
         }
-#endif
         ARMCPRegInfo clidr = {
             .name = "CLIDR", .state = ARM_CP_STATE_BOTH,
             .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 1, .opc2 = 1,
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.\nQualcomm Technologies, Inc. is a member of the\nCode Aurora Forum, a Linux Foundation Collaborative Project.

