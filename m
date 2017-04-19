Received: by 10.25.0.144 with SMTP id 138csp379163lfa;
        Wed, 19 Apr 2017 10:45:16 -0700 (PDT)
X-Received: by 10.200.42.238 with SMTP id c43mr3849780qta.144.1492623916529;
        Wed, 19 Apr 2017 10:45:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i41si3063680qtc.113.2017.04.19.10.45.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Apr 2017 10:45:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org;
       dkim=fail header.i=@codeaurora.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49630 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0tfH-0002rt-T5
	for alex.bennee@linaro.org; Wed, 19 Apr 2017 13:45:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1d0tc4-0008Cu-Tf
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 13:41:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1d0tc3-0004Op-Vw
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 13:41:56 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37790)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1d0tc3-0004O8-PD; Wed, 19 Apr 2017 13:41:55 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id E3E01610DB; Wed, 19 Apr 2017 17:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1492623714;
	bh=G3xQpV6ot2prIAzHjIemeeOj5wOqK7Z+PT4TmM/rl+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LnhA+thEPUgdbPE+r90TSh5DFsBfYSB5Bkr6k2PMtEdi+yygG+Rwz39XOgfjtI1BN
	uFKF8SiwJdnM5IYvkmJkaXrbZa8SZcgJQCzzqwm79EfMERFxGQPpYtSbXEyHGTxxjZ
	XTBIgkTqQFOmENNghfvI29cFax+Mf60K+4AjixK0=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id F3D9561110;
	Wed, 19 Apr 2017 17:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1492623714;
	bh=G3xQpV6ot2prIAzHjIemeeOj5wOqK7Z+PT4TmM/rl+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LnhA+thEPUgdbPE+r90TSh5DFsBfYSB5Bkr6k2PMtEdi+yygG+Rwz39XOgfjtI1BN
	uFKF8SiwJdnM5IYvkmJkaXrbZa8SZcgJQCzzqwm79EfMERFxGQPpYtSbXEyHGTxxjZ
	XTBIgkTqQFOmENNghfvI29cFax+Mf60K+4AjixK0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F3D9561110
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Date: Wed, 19 Apr 2017 13:41:19 -0400
Message-Id: <1492623684-25799-9-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
References: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH 08/13] target/arm: Split arm_ccnt_enabled into
 generic pmu_counter_enabled
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
X-TUID: 8bzlc8kp2ND5

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9c01269..5d07f72 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -975,17 +975,22 @@ static CPAccessResult pmreg_access_ccntr(CPUARMState *env,
     return pmreg_access(env, ri, isread);
 }
 
-static inline bool arm_ccnt_enabled(CPUARMState *env)
+static inline bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
 {
     /* Does not check PMCCFILTR_EL0, which is handled by pmu_counter_filtered */
-
-    if (!(env->cp15.c9_pmcr & PMCRE) || !(env->cp15.c9_pmcnten & (1 << 31))) {
+    if (!(env->cp15.c9_pmcr & PMCRE) ||
+            !(env->cp15.c9_pmcnten & (1 << counter))) {
         return false;
     }
 
     return true;
 }
 
+static inline bool arm_ccnt_enabled(CPUARMState *env)
+{
+    return pmu_counter_enabled(env, 31);
+}
+
 /* Returns true if the counter corresponding to the passed-in pmevtyper or
  * pmccfiltr value is filtered using the current state */
 static inline bool pmu_counter_filtered(CPUARMState *env, uint64_t pmxevtyper)
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

