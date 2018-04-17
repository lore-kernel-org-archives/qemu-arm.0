Received: by 10.28.4.212 with SMTP id 203csp4258076wme;
        Tue, 17 Apr 2018 13:49:14 -0700 (PDT)
X-Google-Smtp-Source: AIpwx490RiU+7KxdjOeBrxlws4enA0UCeRTiDRcTJJP3tsVe9PXiP2FpdllzfTkrnrg+NKrkrYaI
X-Received: by 10.55.110.4 with SMTP id j4mr3767523qkc.272.1523998154891;
        Tue, 17 Apr 2018 13:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523998154; cv=none;
        d=google.com; s=arc-20160816;
        b=RRmOvU4ePWVkP1QOVnINS0jhZ/ADgAlJKNSR9ZaZLVv3kkMaRK1yhsaeMVsgyxWkW9
         UNdZieVbEi/H6eUdqwvIAD9B9WG/yuYJW17T+ekhUvPOYYKu2F7+Wnu6LCH9FNaHGgNP
         QhK35p4I7mebjAKbKxjCNlcqO3Ka7ZcUW6uvecaH5yfBbvrT8Nw+c5GfkwTHVq/npxxV
         nJXBLgTqS+ec68n1WP68uwwWcOdVWjBgDNRGkWK35aD+7Btm7jntUdkp7aa+0r3JWTp7
         icNBn9+7UNLep+Rf+mE5xdxdlJzcbQRTiWlgUYyDA8+ECbL9ws69kj39AMV5chEP0whc
         J5aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=d2fUiI7vqpRUJnd6ztLrQi8kstFNL8QhJfuPqAjJ+1E=;
        b=Y2oXWDfJfrW4dJDJc6ghEVBIpZ4r+whtdFjPCb4ua3qYwN7O5F6/IUU2u88HmBHePL
         JEX59WRv6zfKlW2SYCAm6+el4DycIwYO2JsnDFQjjwbmvk2MZxdHUt6aE/oih3v9PRJb
         Dv9ay/72Xicy3MW8MRkvAvq3c+Q1qaZHFLbf1P2bDYcoryIC5AI8wh13wcedx/EygDfN
         zmBn3flGKVacmVIwG46eyITJwXLrUeMDtlMnfvB1S7QaXAF/OB2Ol6uViOpvHRWbbfhq
         8og6UXnqLMhaBkYo2DAFBf/1I6HNx9G3HUHluqTZVlNu6z8PJhBl+5IBib/58asKttoo
         NXWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=YhvJ0khC;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=P4RLCbqM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m68si1572293qkd.298.2018.04.17.13.49.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 13:49:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=YhvJ0khC;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=P4RLCbqM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33400 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8XXO-0002uF-8w
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 16:49:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNe-00032k-AT
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNc-0006L8-8O
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:10 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:40112)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8XNb-0006CC-OI; Tue, 17 Apr 2018 16:39:08 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 12C3C60FB1; Tue, 17 Apr 2018 20:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997546;
	bh=oU7VGZkZTlzl2Jleg5SMD9XIAH3JOHaYtZV6624s5HI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YhvJ0khCaRiWr2jHakysEyel/PWckuPBD9kpoNbAhUfYB661b1q4SueWURpWnACEd
	KvqQaZi+XaZ8BCS7JA/h6j+A5gpxQRSygWJXmUFJrRJhRcUPmuwbLY+9xtjuYWkbeI
	jcoQ0QmjtRdTav/v8KQHiwYMpl/8EWWhLKepk+M4=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 9E84A60F8E;
	Tue, 17 Apr 2018 20:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997542;
	bh=oU7VGZkZTlzl2Jleg5SMD9XIAH3JOHaYtZV6624s5HI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P4RLCbqM9I6wskjcUAnNheuFOqKL3/1qfhxFtvfL3TYL3f3miysMwZdi1Cn3k63cL
	wsgUf5KU7/YkvaUkt9h284H17VxGbrkl3OFP/kIo+BwHrFSDmXq/1QGaXuZPwx5M19
	O+BmqHAQBlNt1U3MjUq+/BWcHkjEGmB0qGW7RAII=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9E84A60F8E
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 17 Apr 2018 16:37:58 -0400
Message-Id: <1523997485-1905-15-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v4 14/21] target/arm: Implement PMOVSSET
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
X-TUID: xjdUMy92xuaa

Adding an array for v7VE+ CP registers was necessary so that PMOVSSET
wasn't defined for all v7 processors.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 20b42b4..572709e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1262,9 +1262,17 @@ static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -1614,6 +1622,25 @@ static const ARMCPRegInfo v7mp_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+static const ARMCPRegInfo v7ve_cp_reginfo[] = {
+    /* Performance monitor registers which are not implemented in v7 before
+     * v7ve:
+     */
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
@@ -4965,6 +4992,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         !arm_feature(env, ARM_FEATURE_PMSA)) {
         define_arm_cp_regs(cpu, v7mp_cp_reginfo);
     }
+    if (arm_feature(env, ARM_FEATURE_V7VE)) {
+        define_arm_cp_regs(cpu, v7ve_cp_reginfo);
+    }
     if (arm_feature(env, ARM_FEATURE_V7)) {
         /* v7 performance monitor control register: same implementor
          * field as main ID register, and we implement only the cycle
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

