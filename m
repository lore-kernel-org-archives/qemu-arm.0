Received: by 10.223.197.9 with SMTP id q9csp1229338wrf;
        Fri, 29 Sep 2017 19:12:41 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAFKl7t2+gwzNtt5KI/79Cfin8mJgLVxVewjY5duPJVm/kKKd0Vqp1tz19YbErY10GTXJS4
X-Received: by 10.233.232.8 with SMTP id a8mr5558406qkg.265.1506737561555;
        Fri, 29 Sep 2017 19:12:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506737561; cv=none;
        d=google.com; s=arc-20160816;
        b=xpMduCcufcp/qN0wzRBqNPovvFbVX0nJWp09ADIbWpWPaR01ZpcZVY44gx+nT7yyQm
         Kkp8rUR9KPIanzg5oF3TMwsIU/osfnooinmzFTnkVF8qhnIYjyh7446/qLM0zUmfa3mg
         w/tqNtFAo2ojWQLWDjqzPHk/vSs0QVKh+uUXWSkkFYYkgUzZe5q00QbOwEpI/dYu4xcZ
         4VmsSPUAJl67QXA89gv6nJ2NAAH4/8Jk9Q2/U9OFuFpJJbnO/gO+VL3bPtjC4jDrFWMi
         TyT972ZHI5qge3pY1OD2e3bOjkSofkHCtLROF/aDqv39Z5BQPWP448Oiyqr3uD0bUdo0
         Hicg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=4JKUYgHnGNblMo1myNOO3vEPkP552ISPDQkH5gd2X/k=;
        b=dHGfuzdtGctOLK311v0+yvc+OKikwLLUkMuKryYluUio6LPnyvYAlMbOQvPWelj/oU
         KWosF5pc3Z1Mq68SP3crL5o204c9g0xQ0m6yULu1ZvkphfLIv9bt4UCpnByB0JEWPWfa
         DsNBjNPB3Xn52cRIsM+9BWNi/l6rEd5sjeRkNl43Mmu1ybyNfGfMWkCBhSCXj+a0UvoL
         z8p+VSW0Jtwi7+/kHn0gClcXyJcr8fZM3xtyUxRYBwlDCN5YT53psC3o7BB3qYwJkQL8
         0+eitLPN3z+XSgslljPhSi+QKAvxuNrsRU3XP6xiCbkyrdki//4ALUB4GhyD+F1UPz7V
         AF7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=X0hoDtlK;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=X0hoDtlK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j8si338918qth.184.2017.09.29.19.12.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Sep 2017 19:12:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=X0hoDtlK;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=X0hoDtlK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Received: from localhost ([::1]:37803 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dy7Gh-00055q-BU
	for alex.bennee@linaro.org; Fri, 29 Sep 2017 22:12:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7Dc-0002Sq-Sv
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 22:09:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7Db-0005AR-Qr
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 22:09:28 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35316)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1dy7Db-000585-IS; Fri, 29 Sep 2017 22:09:27 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id B91DB609C2; Sat, 30 Sep 2017 02:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737366;
	bh=idbZWQPFWZm0kt+KjJHbAMKeRQdpvc2AeQr5kfQb5Bc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X0hoDtlKfWCqM8WHxzCGZ3A+r9JK97NNvjJMRuIWZ+m81a5YAn9hdOe+yyIKEArLC
	qEhPiMIgbZsvrrD6pvsJFVSpyZHdXYrCwreP7rTOD33vByXg5jYiKFF+t8FcVRaL16
	/+besj7WzkAfuuWMmuLJUhO3HHO7X50Fq8C/FrPg=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 44CA460C68;
	Sat, 30 Sep 2017 02:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737366;
	bh=idbZWQPFWZm0kt+KjJHbAMKeRQdpvc2AeQr5kfQb5Bc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X0hoDtlKfWCqM8WHxzCGZ3A+r9JK97NNvjJMRuIWZ+m81a5YAn9hdOe+yyIKEArLC
	qEhPiMIgbZsvrrD6pvsJFVSpyZHdXYrCwreP7rTOD33vByXg5jYiKFF+t8FcVRaL16
	/+besj7WzkAfuuWMmuLJUhO3HHO7X50Fq8C/FrPg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 44CA460C68
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Wei Huang <wei@redhat.com>
Date: Fri, 29 Sep 2017 22:08:24 -0400
Message-Id: <1506737310-21880-8-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH 07/13] target/arm: Implement PMOVSSET
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
X-TUID: UO+zoWzlT/de

Also modify it to be stored as a uint64_t

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.h    |  2 +-
 target/arm/helper.c | 27 ++++++++++++++++++++++++---
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 811b1fe..365a809 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -325,7 +325,7 @@ typedef struct CPUARMState {
         uint32_t c9_data;
         uint64_t c9_pmcr; /* performance monitor control register */
         uint64_t c9_pmcnten; /* perf monitor counter enables */
-        uint32_t c9_pmovsr; /* perf monitor overflow status */
+        uint64_t c9_pmovsr; /* perf monitor overflow status */
         uint32_t c9_pmuserenr; /* perf monitor user enable */
         uint64_t c9_pmselr; /* perf monitor counter selection register */
         uint64_t c9_pminten; /* perf monitor interrupt enables */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 74e90c5..3932ac0 100644
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
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.\nQualcomm Technologies, Inc. is a member of the\nCode Aurora Forum, a Linux Foundation Collaborative Project.

