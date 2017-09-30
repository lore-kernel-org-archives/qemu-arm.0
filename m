Received: by 10.223.197.9 with SMTP id q9csp1230544wrf;
        Fri, 29 Sep 2017 19:14:42 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QA6YTbqJf/ziViHRgrX3IrVbuviXxkR4rgN5TbhDwmQP6xCQFmnLmzeDjUuxTXr4oWvimNx
X-Received: by 10.55.198.152 with SMTP id s24mr6267243qkl.3.1506737682736;
        Fri, 29 Sep 2017 19:14:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506737682; cv=none;
        d=google.com; s=arc-20160816;
        b=apiT/27U6WQ0mitLpwra9T7aJCTei8BS3IXT930acEpeNdyl7JrLGcCT1ONK7pzP6v
         50w4u3FR3AJo0/TTmaylYr0Z1PtPrbIfPDwJ7CJ12GT9lNpfmU2Q5FvIUqfBBD/EXOX1
         OG2b+dc3ILf6j9JVcHFLLyrJ3TLGITVl4ut2uIiKxd1LVuqeLLvnBLGsPlBj0md6+uke
         3uAOAGwh9h1gflzH52sibqjOCYjVvrbHPjjpkkg11DcYtbHBXiwZNocCROZ747opVSuZ
         gniADfWgMH+qHAi1+ZX6hPM8Krunzg/HZntyEwNh3fjJspPJO6UZjQH2YsyT6FF9V31E
         KRaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=h1jDMCO+M2jNRZouu/u4N8s+I4Y2AL7nBO4sHgkVe2Q=;
        b=e5ZdV8qiY693v0lqOCgFBszQxD/dA8d7wkdLpX0Cl16l8jU876NZE+LPUcChQB9W0f
         sO6/HS5PYn5YWHwFC+hLBbWjY8SXIHi5RE3hYsI4giC0jb7mRutsdOvPuDddvdYfXAzH
         jtOU2OVfCaQdXlsjjNQa9pxz7fd/QGIRZzceQhJJLOgBK8xSbNNZCC4rE5JU84KuAdBm
         QOj3xFxngERaVdy/P+ctqqbef1fuLFW7c4BiBOHygdyN2BYiMIqs3fE7Tz6mH+pffY43
         PZa4I71NUNbFhtEtG2w7Q1gpKhA85R0HCFHU8uvoujvRYpdUmfaHQR6WY04o8N8CwBl6
         7YpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=bwclLPmC;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=K2STphRn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@gnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q72si1528947qkq.26.2017.09.29.19.14.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Sep 2017 19:14:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=bwclLPmC;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=K2STphRn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@gnu.org
Received: from localhost ([::1]:37812 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dy7Ie-0006tm-8h
	for alex.bennee@linaro.org; Fri, 29 Sep 2017 22:14:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7Dn-0002fS-33
	for qemu-devel@nongnu.org; Fri, 29 Sep 2017 22:09:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7Dl-0005NT-VH
	for qemu-devel@nongnu.org; Fri, 29 Sep 2017 22:09:39 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35722)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1dy7Dj-0005Jz-0Y; Fri, 29 Sep 2017 22:09:35 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 323FD60B69; Sat, 30 Sep 2017 02:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737374;
	bh=YDaooyh54hAytdHBJkax82+neQwqdGsxyADv1QDKpCI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bwclLPmCTzkVEyolnveLEPCPx1RpbQTJCoitOMe2lOxBxN2tGdvVmxd34u/Dgeiud
	kusPflEvckfWe5GV6kiExDFyQh9fHFlmcrMSXBfejf5bTzR0juzDFdWDyYGMopL//u
	AVJKME91FVA9p5v+ObMo3L+hIKHjwsR9rpvEOFvY=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 877E460C16;
	Sat, 30 Sep 2017 02:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737373;
	bh=YDaooyh54hAytdHBJkax82+neQwqdGsxyADv1QDKpCI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K2STphRnT8btSJKyMUFZvl7LrBX52GXI/BlLeYYSs1gbIVqg663wG/rFxGKiVSopZ
	/bDLzNKDCg2P2wn/okKhXIKVGbI3dz0KnWH+0cdSIfh0CnrKOUjpPej6IqbtTFPlk6
	ckEmnxIM6U6I7Pk2IU7EL639qunIgMmCvzEoWtvM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 877E460C16
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Wei Huang <wei@redhat.com>
Date: Fri, 29 Sep 2017 22:08:30 -0400
Message-Id: <1506737310-21880-14-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-devel] [PATCH 13/13] target/arm: Implement PMSWINC
X-BeenThere: qemu-devel@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@gnu.org>
List-Help: <mailto:qemu-devel-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@gnu.org?subject=subscribe>
Cc: Michael Spradling <mspradli@codeaurora.org>, qemu-devel@nongnu.org,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@gnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@gnu.org>
X-TUID: OHJNfpmXiuGz

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 40 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 659b2b8..c688e56 100644
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
 #ifndef CONFIG_USER_ONLY
 static uint64_t cycles_get_count(CPUARMState *env)
 {
@@ -943,6 +952,10 @@ static uint64_t instructions_get_count(CPUARMState *env)
 
 #define SUPPORTED_EVENT_SENTINEL UINT16_MAX
 static const pm_event pm_events[] = {
+    { .number = 0x000, /* SW_INCR */
+      .supported = event_always_supported,
+      .get_count = swinc_get_count
+    },
 #ifndef CONFIG_USER_ONLY
     { .number = 0x008, /* INST_RETIRED */
       .supported = instructions_supported,
@@ -1195,6 +1208,25 @@ static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -1551,9 +1583,13 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
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
     { .name = "PMSELR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 5,
       .access = PL0_RW, .type = ARM_CP_ALIAS,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmselr),
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.\nQualcomm Technologies, Inc. is a member of the\nCode Aurora Forum, a Linux Foundation Collaborative Project.

