Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1251509wrq;
        Fri, 22 Jun 2018 13:36:29 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdSAlaKrBqUxDvaOR5Vhp6ZRvYJp0u87Fyu1OQ96oDZaEVHrTTHgLcW4RmvD6LbfbemGFX7
X-Received: by 2002:a37:dce:: with SMTP id 197-v6mr2668082qkn.220.1529699789794;
        Fri, 22 Jun 2018 13:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529699789; cv=none;
        d=google.com; s=arc-20160816;
        b=0k0Y9stffn7Eqp9Ye+EPTyY11Gc8TM4jl4dLXyfsRjCPrcxqbsXcPfv0OQD/elo67p
         r8bXPAp7GOjQeUJDSemWiZdVorIl6g9pBPx1m1fb+ZDeowEdfaL8dkFKud8uipsp09/h
         D7xXeJVpbUaekLNeQrLrqr58yAKtJw4Exu8ZytEXEIjqG9ORj0L1RAUe6CTi57jk3r+5
         iRj/s2yl3qaiyP7Zq2UCbn9Rj49aovP/o0jwrpKPhAP97VMHWhI0nNvep3nIIGt+ADx4
         ZeJKQUyu74Cqhz1murDAbh/MU0tKi9AJs2ZGuA19tmNzkZTd40+E5GFyZwyqHUpyFgMh
         SD1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=4RDY4jt3tWyJvQaeq9Xl/kb27vZcbI3kcjjAEadPflE=;
        b=fuHMwiUzlmKNeX2L7OfxezbsTK8pqPo1c7Bhfp8u8UwkVmx/hmmgiu76PqC2F4H7AW
         0duz9WM2hEyiwO1S9d00GAcY1bAMLJuAx0n1/cqgf0GS5ftn2XZsOkDiJAzcigJnD5QP
         LBrRa3uOMvFcITYTH2h9lV0JX2MlvreReig/gi7ylOXhL/rpdj35hXTBOdQBwYL+uWBd
         taQJdGhJK9KmVSyazBhW+PiFPVlcdarEePhtCXdMAh14OF64HQB0qckqTQxfmULlYsqX
         0Oc/5f9CxIi9H3YVTiOaO8f0nbEEzYb9KH/6Z0i9b+Zy2qydjxnI9XKhErM8oNc96VXo
         qukQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=jHKXkbBh;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=dAImkJBS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j3-v6si1519394qtp.72.2018.06.22.13.36.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 13:36:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=jHKXkbBh;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=dAImkJBS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36091 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWSnF-00057W-7e
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 16:36:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSjc-00028M-JJ
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:32:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSjb-0005RX-IX
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:32:44 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45514)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1fWSjb-0005Qq-A8; Fri, 22 Jun 2018 16:32:43 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 69B2D6063F; Fri, 22 Jun 2018 20:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699562;
	bh=V7ns7mI23uSH/jVaM05kg4BJ8DBXvvN00zcOc/fZ85k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jHKXkbBh6N/qPek1xImZ373H2wDYddF3EuvIW3eR8PNOgPD5YXHXuXiC7n+Mskj/W
	a59IWWRwW5Y4jxgoEoxuNM10SM5ZY23Y0GLmkygQREa7BhLqbBiK1j02l78Wu3vG6H
	gZazstUq2tJfEWaNCS6iJDW7DxLpU/sin1v5Y6S4=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id A21A96063F;
	Fri, 22 Jun 2018 20:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699561;
	bh=V7ns7mI23uSH/jVaM05kg4BJ8DBXvvN00zcOc/fZ85k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dAImkJBSJFPCxJiR3ai8DHb3ZE0bBcHAbxp8kA15z0G2AwLuqOLY5AlAaMUUJAYkV
	DWuFkMkoSDrYCFnCrVyA2NQdjYoLgv42Tcfhw/nFl0xN+bHdGKCYwlPUspP56XuP06
	KXzgjcVTMu1HvdUnTVSR0h0YppQ+y6z67is1HU84=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A21A96063F
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 22 Jun 2018 16:32:20 -0400
Message-Id: <1529699547-17044-7-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v5 06/13] target/arm: Implement PMOVSSET
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
X-TUID: 3mi7XyIpc/p0

Add an array for PMOVSSET so we only define it for v7ve+ platforms

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7d63bb2..5d83446 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1293,9 +1293,17 @@ static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void pmovsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                          uint64_t value)
 {
+    value &= pmu_counter_mask(env);
     env->cp15.c9_pmovsr &= ~value;
 }
 
+static void pmovsset_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                         uint64_t value)
+{
+    value &= pmu_counter_mask(env);
+    env->cp15.c9_pmovsr |= value;
+}
+
 static void pmxevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
@@ -1645,6 +1653,23 @@ static const ARMCPRegInfo v7mp_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+static const ARMCPRegInfo pmovsset_cp_reginfo[] = {
+    /* PMOVSSET is not implemented in v7 before v7ve */
+    { .name = "PMOVSSET", .cp = 15, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 3,
+      .access = PL0_RW, .accessfn = pmreg_access,
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
+    REGINFO_SENTINEL
+};
+
 static void teecr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
@@ -4996,6 +5021,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         !arm_feature(env, ARM_FEATURE_PMSA)) {
         define_arm_cp_regs(cpu, v7mp_cp_reginfo);
     }
+    if (arm_feature(env, ARM_FEATURE_V7VE)) {
+        define_arm_cp_regs(cpu, pmovsset_cp_reginfo);
+    }
     if (arm_feature(env, ARM_FEATURE_V7)) {
         /* v7 performance monitor control register: same implementor
          * field as main ID register, and we implement only the cycle
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

