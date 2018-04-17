Received: by 10.28.4.212 with SMTP id 203csp4255089wme;
        Tue, 17 Apr 2018 13:45:25 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZruS+cqMc4NszR0d2h87PB5y55sBo0fhxKJP6YiALYETRkuSnGF8gIJv13O721jVI3ObK8V
X-Received: by 10.55.17.224 with SMTP id 93mr859505qkr.370.1523997925415;
        Tue, 17 Apr 2018 13:45:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523997925; cv=none;
        d=google.com; s=arc-20160816;
        b=iLtxrM5qlXajb2DJN27VIF7KU3kJKZyeD/t68/b3yD+/JHqc2dufqFYb06HWE7Y37O
         NXKv4mgmFUXWE1Y0aOJkn5KUu7xAqZFy0Fru/FaYz61QBpvTs3vS5l1zPkib7+QzVkbl
         T2OvsZqUj3ID43wFGx8otxZt201wUYQMf+0/AlWaUJMbBm/KqMRudrsQTZ3blQ3cNObF
         rUy89xZXiclo7AEOFuqBUEQ8VMrIWbIEy8TAeEo0jFaqr3R35XOax/3V68RlTbjpuAkM
         0u/mzojbwMMf+WtFDPNyXR+KAUdDo1zzt8aGuRHE9NUt+kkm6PQV+NV2G+kooFtmgTqM
         GSCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=nPHS6OBwOkRCoSz0AwGEkUiCxbAe7EXE1xcmAi9hf3w=;
        b=nXECr/PWuo3zFVR7Qtrd+KuHPYkp/4WIJyl98Y7pMKQstiyWn2RIzgrcoHOjZczpWZ
         2KSTY8Avhnfq7dYbdyCbjeOQRbuZr7qEPO+1yVgtZqqTN+LFu1sj3qLo2T/lFWhptxxx
         AgTl6ewkjBv/lbMoLX3XJCDr7pkiaX0mCYwv4sbkrMXOYID2eR1Id56wE+QMhM1CDjeA
         8KKzpDpRKdo37oaZ+mZLhpD9BAFHCFDrPM5bhMZhUEDeb+lfgC7mn5o7U1O4EsKF8YhE
         7B6WjoECvJZdhmV0g55e22bHb7pVI/SwKpJp+vbnYYFoiHQufukYS2GIhSu9bFJr0hVA
         d5jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=f1HxpRAH;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=XluGRwIK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e56si6975945qtk.39.2018.04.17.13.45.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 13:45:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=f1HxpRAH;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=XluGRwIK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33380 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8XTg-0008Jh-TP
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 16:45:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNs-0003HS-Ju
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNn-0007dX-Eo
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:24 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:40552)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8XNm-0007UN-Uz; Tue, 17 Apr 2018 16:39:19 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id D3D5660FEB; Tue, 17 Apr 2018 20:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997557;
	bh=MUWYYNEBr4xr26S4ORDQGw64gncS8a9bjpGpjoSG0UE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f1HxpRAHlavn73pjooWrmJ0jhAUOSmWWaW2K49xuct0XDF3N05k5vAnu2/3Il1IG/
	n9wysfally+C/Ba9NszBtEn3ZQsh3t8pEVce4Mz2KJCL8QUWx0cRnSyWGXSe0PVp6N
	ndIDsgT8tXOgp8U+zC0jg7Av1tnyxapGV27hC8n4=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 647C2610D5;
	Tue, 17 Apr 2018 20:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997549;
	bh=MUWYYNEBr4xr26S4ORDQGw64gncS8a9bjpGpjoSG0UE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XluGRwIKhKvVTktK1wzEWaZGXzhpjnp+mNJpgud6YTdMjODcR/viS3ZVEprb2r03f
	vhLb2kqx4EyJvuLVMg1Sk81h2T6iaQRe7wZYNob0FYMQwPXGhvB6gSrj6VbYddIyPe
	ggjGt42yO8r6XqWJtN1j1LEE++r55ZGEhWbLYSzU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 647C2610D5
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 17 Apr 2018 16:38:03 -0400
Message-Id: <1523997485-1905-20-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v4 19/21] target/arm: Implement PMSWINC
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
X-TUID: azqSxvMumPvs

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7970129..3902719 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -949,6 +949,15 @@ static bool event_always_supported(CPUARMState *env)
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
@@ -977,6 +986,10 @@ static uint64_t instructions_get_count(CPUARMState *env)
 
 #define SUPPORTED_EVENT_SENTINEL UINT16_MAX
 static const pm_event pm_events[] = {
+    { .number = 0x000, /* SW_INCR */
+      .supported = event_always_supported,
+      .get_count = swinc_get_count
+    },
 #ifndef CONFIG_USER_ONLY
     { .number = 0x008, /* INST_RETIRED, Instruction architecturally executed */
       .supported = instructions_supported,
@@ -1287,6 +1300,24 @@ static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -1632,9 +1663,13 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
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

