Received: by 10.25.0.144 with SMTP id 138csp379024lfa;
        Wed, 19 Apr 2017 10:44:53 -0700 (PDT)
X-Received: by 10.55.17.32 with SMTP id b32mr3100420qkh.5.1492623893422;
        Wed, 19 Apr 2017 10:44:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s14si3065787qtb.69.2017.04.19.10.44.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Apr 2017 10:44:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org;
       dkim=fail header.i=@codeaurora.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49622 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0teu-0002SO-Rv
	for alex.bennee@linaro.org; Wed, 19 Apr 2017 13:44:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1d0tc4-0008CI-AO
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 13:41:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1d0tc3-0004Nw-2W
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 13:41:56 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37742)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1d0tc2-0004N0-RF; Wed, 19 Apr 2017 13:41:55 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id F05F06110B; Wed, 19 Apr 2017 17:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1492623713;
	bh=SYvhmXNAF+u4UpJJjfyqp0VmdXLyoSLyrYAq4hhJq7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eRwx//DdskgrzCuTjyG8RM+AlmMXKHnmMnqwqdUzHKcY809trJKsurJ1BRS28lU3P
	KwypF9dc3w3LmMBmYeSPD3BLMnIXMM38+7gVIfntahrmXW9cRPK3PLf8QnW2AWJSJa
	bk5l4i9ZiG+JrHeg9Rj4qwzCh9C2XUFbjdvHgKEw=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id E3F8A610D4;
	Wed, 19 Apr 2017 17:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1492623713;
	bh=SYvhmXNAF+u4UpJJjfyqp0VmdXLyoSLyrYAq4hhJq7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eRwx//DdskgrzCuTjyG8RM+AlmMXKHnmMnqwqdUzHKcY809trJKsurJ1BRS28lU3P
	KwypF9dc3w3LmMBmYeSPD3BLMnIXMM38+7gVIfntahrmXW9cRPK3PLf8QnW2AWJSJa
	bk5l4i9ZiG+JrHeg9Rj4qwzCh9C2XUFbjdvHgKEw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E3F8A610D4
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Date: Wed, 19 Apr 2017 13:41:18 -0400
Message-Id: <1492623684-25799-8-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
References: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH 07/13] target/arm: Implement PMOVSSET
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
X-TUID: wcEvRFKYTGOO

Also modify it to be stored as a uint64_t

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.h    |  2 +-
 target/arm/helper.c | 27 ++++++++++++++++++++++++---
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ae2a294..f3524f6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -310,7 +310,7 @@ typedef struct CPUARMState {
         uint32_t c9_data;
         uint64_t c9_pmcr; /* performance monitor control register */
         uint64_t c9_pmcnten; /* perf monitor counter enables */
-        uint32_t c9_pmovsr; /* perf monitor overflow status */
+        uint64_t c9_pmovsr; /* perf monitor overflow status */
         uint32_t c9_pmuserenr; /* perf monitor user enable */
         uint64_t c9_pmselr; /* perf monitor counter selection register */
         uint64_t c9_pminten; /* perf monitor interrupt enables */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index bf9f164..9c01269 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1150,9 +1150,17 @@ static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void pmovsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                          uint64_t value)
 {
+    value &= PMU_COUNTER_MASK(env);
     env->cp15.c9_pmovsr &= ~value;
 }
 
+static void pmovsset_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                         uint64_t value)
+{
+    value &= PMU_COUNTER_MASK(env);
+    env->cp15.c9_pmovsr |= value;
+}
+
 static void pmxevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
@@ -1317,10 +1325,10 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcnten),
       .writefn = pmcntenclr_write },
     { .name = "PMOVSR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 3,
-      .access = PL0_RW, .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
-      .accessfn = pmreg_access,
+      .access = PL0_RW, .accessfn = pmreg_access,
+      .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmovsr),
       .writefn = pmovsr_write,
-      .raw_writefn = raw_write },
+      .raw_writefn = raw_write, .resetvalue = 0 },
     { .name = "PMOVSCLR_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 3,
       .access = PL0_RW, .accessfn = pmreg_access,
@@ -1328,6 +1336,19 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
       .writefn = pmovsr_write,
       .raw_writefn = raw_write },
+    { .name = "PMOVSSET", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 3,
+      .access = PL0_RW, .accessfn = pmreg_access,
+      .type = ARM_CP_ALIAS,
+      .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmovsr),
+      .writefn = pmovsset_write,
+      .raw_writefn = raw_write },
+    { .name = "PMOVSSET_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 14, .opc2 = 3,
+      .access = PL0_RW, .accessfn = pmreg_access,
+      .type = ARM_CP_ALIAS,
+      .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
+      .writefn = pmovsset_write,
+      .raw_writefn = raw_write },
     /* Unimplemented so WI. */
     { .name = "PMSWINC", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 4,
       .access = PL0_W, .accessfn = pmreg_access_swinc, .type = ARM_CP_NOP },
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

