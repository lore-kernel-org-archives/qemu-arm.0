Received: by 10.28.91.67 with SMTP id p64csp1280423wmb;
        Fri, 16 Mar 2018 13:40:36 -0700 (PDT)
X-Google-Smtp-Source: AG47ELt3zDSzvLorKLuFD5kP4lXL2B74YkVAs3lJh75+xfUUHZWK5nsrMFFGD6TX5RxeqXYkgMf5
X-Received: by 10.55.217.145 with SMTP id q17mr4994278qkl.302.1521232836764;
        Fri, 16 Mar 2018 13:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521232836; cv=none;
        d=google.com; s=arc-20160816;
        b=HwbSyWOrg0lGl+SEtSBKPlegsP372C5K/UYvDIT1z7SlS2BZaklDotjj/9CLOwGa+F
         /vUMTJoid5fBhoImTB0P573Opr4D3HjBwfQVgQQcsir3paPa28bjGppxFoULog+5kizE
         KV1kflHY2YbFnZhxQcbqmc4BbTKsA8ilEfGa4nwOQ7jAwl5lrS6yCXgoTs+dVzhPfOlZ
         dC9t8/y8Tm+6Fl+xc7GA1pNGVld2ZCB/LbG6Ye6lLOKW1Nibj5yEZmvqI2BFLVZje7T3
         GIO1SQvRt4yGHlHjScVPQipaszl0OptGIsbD2NcVONydQqMGnC34lFIjV4la8KM+zqn1
         OzjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=nZP4KQTDLolUFmgLJ3efxGfZJD6I2/cXUcJ4CMlpVBc=;
        b=xQsmHpg/l5sLMNgAAG0qG5cs+2UEzzpvRxvsRgCm22x1KtumYERE98y9NBoRTj3Ovw
         +2JWJ5AHP7SmuY8J8+VuIWW3ehAdisKYxjBkAwpokoLrpbDLqPVvxuJtyXQIbDvjwxV3
         BsUHQXOef82Qp7hBBGGjUyGtIN0Lg9JN1DFTu4/yx1ghGPQb7GMOp7llCkWQPIFCGTy5
         QSxdDnYyB7cxZx7ml2TZyYv5nUJ/x6piUXorVNAmcT5IHSQ1PfG5J9Ow3Qez/qP+HR4v
         NlyHGe73tQ8of9Hm2DWaLv5CFzgJM6MbUEKdtjgOk9H2ywDxPrWQRX8nNTF/z7gt+7Z7
         M4TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=MINWby9c;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=cFVW4NNN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v74si362113qkb.426.2018.03.16.13.40.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Mar 2018 13:40:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=MINWby9c;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=cFVW4NNN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59486 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eww9U-0004YR-6P
	for alex.bennee@linaro.org; Fri, 16 Mar 2018 16:40:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1k-0006AO-LC
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1j-0003lV-MA
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:36 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56924)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1eww1j-0003k3-Dh; Fri, 16 Mar 2018 16:32:35 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 70D4B60F6C; Fri, 16 Mar 2018 20:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232354;
	bh=9LTE6PfL4i4flbMX3rBQNbDXF5grYD2ro0GRStztzlE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MINWby9cjlVGRU5wCLN9naDQAPLX7YxJIIOHJFQ241YJsdOttIkNQWGSp8a+qGVmO
	i8YiJcQ4KUAJLSVaTi+/xasLqOng0pDxcITdalQwzROzxBbsqyQB4SCPCivn7uxatP
	l3EBwBcqk9tEe5A8oJufZWMwklQDnZh4vDeuYJ10=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 7EDF060F6E;
	Fri, 16 Mar 2018 20:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232346;
	bh=9LTE6PfL4i4flbMX3rBQNbDXF5grYD2ro0GRStztzlE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cFVW4NNNTXdZSkoxve6Him64G0YpRENgz4weBnTVMtNmH+jD0qXDQISs7gXnQdnPj
	zTksqKGgOEZ6Honx6Rf/GDdVQnKsP2aKWuwYiRBJDyEQGVW3Pm9gaagVO2IMC5LCC5
	KpF8HTSnGyK1QRkrQ96pT5u5dlUli8T/l8DFkVoY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7EDF060F6E
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 16 Mar 2018 16:31:20 -0400
Message-Id: <1521232280-13089-23-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v3 22/22] target/arm: Implement PMSWINC
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
X-TUID: kOrh/O3E3LMM

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 44 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 06e2e2c..4f8d11c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -955,6 +955,15 @@ static bool event_always_supported(CPUARMState *env)
     return true;
 }
 
+static uint64_t swinc_get_count(CPUARMState *env, uint64_t cycles)
+{
+    /*
+     * SW_INCR events are written directly to the pmevcntr's by writes to
+     * PMSWINC, so there is no underlying count maintained by the PMU itself
+     */
+    return 0;
+}
+
 #ifndef CONFIG_USER_ONLY
 static uint64_t cycles_get_count(CPUARMState *env, uint64_t cycles)
 {
@@ -974,6 +983,10 @@ static uint64_t instructions_get_count(CPUARMState *env, uint64_t cycles)
 
 #define SUPPORTED_EVENT_SENTINEL UINT16_MAX
 static const pm_event pm_events[] = {
+    { .number = 0x000, /* SW_INCR */
+      .supported = event_always_supported,
+      .get_count = swinc_get_count
+    },
 #ifndef CONFIG_USER_ONLY
     { .number = 0x008, /* INST_RETIRED */
       .supported = instructions_supported,
@@ -1273,6 +1286,29 @@ static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     pmu_op_finish(env, saved_cycles);
 }
 
+static void pmswinc_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    unsigned int i;
+    for (i = 0; i < PMU_NUM_COUNTERS(env); i++) {
+        /* Increment a counter's count iff: */
+        if ((value & (1 << i)) && /* counter's bit is set */
+                /* counter is enabled and not filtered */
+                pmu_counter_enabled(env, i) &&
+                !pmu_counter_filtered(env, env->cp15.c14_pmevtyper[i]) &&
+                /* counter is SW_INCR */
+                (env->cp15.c14_pmevtyper[i] & PMXEVTYPER_EVTCOUNT) == 0x0) {
+            uint64_t cycles = 0;
+#ifndef CONFIG_USER_ONLY
+            cycles = get_cycle_count(env);
+#endif
+            pmu_sync_counter(env, i, cycles);
+            env->cp15.c14_pmevcntr[i]++;
+            pmu_sync_counter(env, i, cycles);
+        }
+    }
+}
+
 static uint64_t pmccntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     uint64_t ret;
@@ -1619,9 +1655,13 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
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

