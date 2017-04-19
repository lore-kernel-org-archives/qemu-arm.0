Received: by 10.25.0.144 with SMTP id 138csp379943lfa;
        Wed, 19 Apr 2017 10:47:36 -0700 (PDT)
X-Received: by 10.237.53.71 with SMTP id b7mr4119771qte.143.1492624056783;
        Wed, 19 Apr 2017 10:47:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d56si3068429qta.117.2017.04.19.10.47.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Apr 2017 10:47:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org;
       dkim=fail header.i=@codeaurora.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49643 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0thY-0004pn-5d
	for alex.bennee@linaro.org; Wed, 19 Apr 2017 13:47:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44110)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1d0tcA-0008Jx-2j
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 13:42:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1d0tc8-0004Ro-K2
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 13:42:02 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:38046)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1d0tc8-0004RO-Bg; Wed, 19 Apr 2017 13:42:00 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 4544B610DB; Wed, 19 Apr 2017 17:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1492623719;
	bh=ZreWRgDXqjKokq9Izys1qzIE8Ql8xnbSoFMZ4gvfcdA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DLfubCkVvfhH0mw+EATtb1MkZPpU9oPztPpR1BGR4LaNNk0Bs24RErmVLInCy4dqS
	WtXlSuga3C3Kct3yzJzyjfjad2HbWyDkEo41I7Hds7d3FZv58BgpA4kpVSP9hZowUS
	bwwmUw/AH7HdzHwwl/ezwQtkTkzobYh+3klrWe8E=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 46EAD6110B;
	Wed, 19 Apr 2017 17:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1492623718;
	bh=ZreWRgDXqjKokq9Izys1qzIE8Ql8xnbSoFMZ4gvfcdA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VuB/oZNO/0uPhc1gEQmGLTk9vEDQvh1ra5bCH0YEl7iTxeei2KRSpjPbQ1CeFr4wv
	sQX+OFNigap3wgWZ4h5rzAK6bWGP2n8Zv/+yS3C7MJwtCUkgmET1uxeTCURQ7w+FbN
	lSKSFDXWTjEMkjVvopLem9kvlRMII5QgNzqJCx40=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 46EAD6110B
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Date: Wed, 19 Apr 2017 13:41:24 -0400
Message-Id: <1492623684-25799-14-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
References: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH 13/13] target/arm: Implement PMSWINC
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>, mspradli@codeaurora.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vfa6pB8fFHYo

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 40 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a15b932..2c51f92 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -907,6 +907,15 @@ static bool event_always_supported(CPUARMState *env)
     return true;
 }
 
+static uint64_t swinc_get_count(CPUARMState *env)
+{
+    /*
+     * SW_INCR events are written directly to the pmevcntr's by writes to
+     * PMSWINC, so don't do anything here...
+     */
+    return 0;
+}
+
 static uint64_t cycles_get_count(CPUARMState *env)
 {
     uint64_t ret;
@@ -941,6 +950,10 @@ static uint64_t instructions_get_count(CPUARMState *env)
 
 #define SUPPORTED_EVENT_SENTINEL UINT16_MAX
 static const pm_event pm_events[] = {
+    { .number = 0x000, /* SW_INCR */
+      .supported = event_always_supported,
+      .get_count = swinc_get_count
+    },
     { .number = 0x008, /* INST_RETIRED */
       .supported = instructions_supported,
       .get_count = instructions_get_count
@@ -1191,6 +1204,25 @@ static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     pmu_sync(env);
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
+            pmu_sync_counter(env, i);
+            env->cp15.c14_pmevcntr[i]++;
+            pmu_sync_counter(env, i);
+        }
+    }
+}
+
 static uint64_t pmccntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     uint64_t ret;
@@ -1559,9 +1591,13 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
       .writefn = pmovsset_write,
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
 #ifndef CONFIG_USER_ONLY
     { .name = "PMSELR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 5,
       .access = PL0_RW, .type = ARM_CP_ALIAS,
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

