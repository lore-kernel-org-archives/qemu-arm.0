Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1251674wrq;
        Fri, 22 Jun 2018 13:36:47 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKI9kL5uVVKi3VVqhWh5Q6DnnbLb/YErv6isxGv/M1GRmcRROe/mO4Myzz7uR8q99Ixy9C5p
X-Received: by 2002:a37:a8d6:: with SMTP id r205-v6mr2656081qke.93.1529699807149;
        Fri, 22 Jun 2018 13:36:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529699807; cv=none;
        d=google.com; s=arc-20160816;
        b=nD9xS02SaZrTtCpUCK3cNrYVEdSkHnlMsx+k5zJ4KxpYStX28bke74qjKZOVEw6Nmj
         prc6IhekjmduBMSLu0ee0OK+7YGwmlUrNoLt1dfYm1UO3O8/pTk7+t1nRgMWI8fbDlAj
         q2K9GoG6fESXuXCQDgO3wW88OQFfqMp5F9rt73sCXQbO/gAsmx6ljal9z6VCuDr3LrwK
         TiVcPCqRGc66Pbru+aGXIahu+NSmAhSJzzmu9Ljc66b+iozjokjh460ETfmkZXnddjIC
         0B9buFri3G/0mKHCdzKwa/CoUrTGremnZx6UiKByxkinLOY5x3eRI3Ken7/VMxVXL5Jm
         2zgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=OTwN9NPRNCU2YQluyuqcoz8ACJRMgzo/0P7DAgUqBS8=;
        b=sBCgDThKka53JazqBYNm5Bp1OA2tU74iccTDzAT/ovf8mGLc7hhhGuAbDpU3Un0lGK
         ZCeo4isNSUJGdn8AKOGFQsAfyg/Sy8FHA9BJDSm0zS8Ud791+UOLdM5AIb2CaWqiJUbw
         dlx6G58pcAdLzYGmsqsv7YlTxZr9P2wcKUaI+sK3BG2lFXp7Fh63gFAPdRiTs5aNryy5
         6GqnhHnBmDFRq2CWDQ28xm1ssbgWPghUZtjyauCYvaDeMzXUvUm2ifP3/WsrGmqzpfSs
         gSBIiLyQtfieK+bJSr53StDFDlVFfEd9S7rNYkPxlFWq05ly31g7wkUXumzHEIC6cpNJ
         Avjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=T5n5Fd8c;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=JOSlAEib;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c55-v6si649193qtb.379.2018.06.22.13.36.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 13:36:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=T5n5Fd8c;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=JOSlAEib;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36093 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWSnW-0005IF-LU
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 16:36:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSji-0002Gn-Qs
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:32:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSjh-0005VK-U1
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:32:50 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45920)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1fWSjh-0005Un-L0; Fri, 22 Jun 2018 16:32:49 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 8D69F606FA; Fri, 22 Jun 2018 20:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699568;
	bh=Z15p35WcXOWx43Sn/Hdq2etongdkPFFKKf+6JVt3BVs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T5n5Fd8ckpWsl2cPelk20IE6J02xhDLmZd0YGyuAZNtePRfF7kI2mxbOSPvIUEQjn
	oejhLjFsgxXW+Dmv8vzUH4b79rcyfJlTmg6PfL015IIaRnN29Fhczzn0ebH58H9iwg
	qKg8v0RVs7xHOE9jaW6FJtLd+IKybev0VuCqN6hQ=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 921A560B19;
	Fri, 22 Jun 2018 20:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699567;
	bh=Z15p35WcXOWx43Sn/Hdq2etongdkPFFKKf+6JVt3BVs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JOSlAEibwcGO5BY4UTLMz7kTc4ZsMaSl8vHLjX34Yf0FIkj4GCFcSHryJC265RhEs
	woQ0u6DoMJ2VUo3xphlzcY4nkRk3Tz/2mBi29lh/7J+Ei94sj6LMinCRBuXWGel8EX
	sX2B6tLGi97Lyz5pJ0ODo3oBx7vtl0KvNFVLcNEo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 921A560B19
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 22 Jun 2018 16:32:25 -0400
Message-Id: <1529699547-17044-12-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v5 11/13] target/arm: Implement PMSWINC
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
X-TUID: oxQcizZh3zNa

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3720239..96667e6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -980,6 +980,15 @@ static bool event_always_supported(CPUARMState *env)
     return true;
 }
 
+static uint64_t swinc_get_count(CPUARMState *env)
+{
+    /*
+     * SW_INCR events are written directly to the pmevcntr's by writes to
+     * PMSWINC, so there is no underlying count maintained by the PMU itself
+     */
+    return 0;
+}
+
 /*
  * Return the underlying cycle count for the PMU cycle counters. If we're in
  * usermode, simply return 0.
@@ -1008,6 +1017,10 @@ static uint64_t instructions_get_count(CPUARMState *env)
 
 #define SUPPORTED_EVENT_SENTINEL UINT16_MAX
 static const pm_event pm_events[] = {
+    { .number = 0x000, /* SW_INCR */
+      .supported = event_always_supported,
+      .get_count = swinc_get_count
+    },
 #ifndef CONFIG_USER_ONLY
     { .number = 0x008, /* INST_RETIRED, Instruction architecturally executed */
       .supported = instructions_supported,
@@ -1318,6 +1331,24 @@ static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     pmu_op_finish(env);
 }
 
+static void pmswinc_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    unsigned int i;
+    for (i = 0; i < pmu_num_counters(env); i++) {
+        /* Increment a counter's count iff: */
+        if ((value & (1 << i)) && /* counter's bit is set */
+                /* counter is enabled and not filtered */
+                pmu_counter_enabled(env, i) &&
+                /* counter is SW_INCR */
+                (env->cp15.c14_pmevtyper[i] & PMXEVTYPER_EVTCOUNT) == 0x0) {
+            pmevcntr_op_start(env, i);
+            env->cp15.c14_pmevcntr[i]++;
+            pmevcntr_op_finish(env, i);
+        }
+    }
+}
+
 static uint64_t pmccntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     uint64_t ret;
@@ -1663,9 +1694,13 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
       .writefn = pmovsr_write,
       .raw_writefn = raw_write },
-    /* Unimplemented so WI. */
     { .name = "PMSWINC", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 4,
-      .access = PL0_W, .accessfn = pmreg_access_swinc, .type = ARM_CP_NOP },
+      .access = PL0_W, .accessfn = pmreg_access_swinc, .type = ARM_CP_NO_RAW,
+      .writefn = pmswinc_write },
+    { .name = "PMSWINC_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 4,
+      .access = PL0_W, .accessfn = pmreg_access_swinc, .type = ARM_CP_NO_RAW,
+      .writefn = pmswinc_write },
     { .name = "PMSELR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 5,
       .access = PL0_RW, .type = ARM_CP_ALIAS,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmselr),
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

