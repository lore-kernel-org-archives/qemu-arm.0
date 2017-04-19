Received: by 10.25.0.144 with SMTP id 138csp378195lfa;
        Wed, 19 Apr 2017 10:42:29 -0700 (PDT)
X-Received: by 10.55.115.65 with SMTP id o62mr3609977qkc.26.1492623749710;
        Wed, 19 Apr 2017 10:42:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e123si3025343qkc.327.2017.04.19.10.42.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Apr 2017 10:42:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org;
       dkim=fail header.i=@codeaurora.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49612 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0tcb-0000G7-4i
	for alex.bennee@linaro.org; Wed, 19 Apr 2017 13:42:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1d0tc1-0008Ar-KT
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 13:41:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1d0tc0-0004M1-Bu
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 13:41:53 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37610)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1d0tc0-0004Lb-4D; Wed, 19 Apr 2017 13:41:52 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 46BBE61110; Wed, 19 Apr 2017 17:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1492623711;
	bh=pTviHaNxRVJxdcicrJaFqrYjBDQXskoMzosvch7wb2o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MD5my3lZK2Jlo0t1Sq6ZrfXEDq03uWmOxjthFa4T4G0nvNkrdrWzJcpcWAbXnRkWE
	81wPqqxZ6TjUUS4b7VIy5CSnbji04rTdQ1vcpbweN4zARLdJ8VJ7vFAnC8KLr8f6HK
	6/PT72O8m6rIwj8zmuZgbbFmukervHUWLITppSzE=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 4FC85610DA;
	Wed, 19 Apr 2017 17:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1492623711;
	bh=pTviHaNxRVJxdcicrJaFqrYjBDQXskoMzosvch7wb2o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MD5my3lZK2Jlo0t1Sq6ZrfXEDq03uWmOxjthFa4T4G0nvNkrdrWzJcpcWAbXnRkWE
	81wPqqxZ6TjUUS4b7VIy5CSnbji04rTdQ1vcpbweN4zARLdJ8VJ7vFAnC8KLr8f6HK
	6/PT72O8m6rIwj8zmuZgbbFmukervHUWLITppSzE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4FC85610DA
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Date: Wed, 19 Apr 2017 13:41:15 -0400
Message-Id: <1492623684-25799-5-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
References: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH 04/13] target/arm: Mask PMU register writes based
 on PMCR_EL0.N
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
X-TUID: WDfQuQnU0GFg

This is in preparation for enabling counters other than PMCCNTR

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 390256b..e8189b8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -30,11 +30,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
                                hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
                                target_ulong *page_size_ptr, uint32_t *fsr,
                                ARMMMUFaultInfo *fi);
-
-/* Definitions for the PMCCNTR and PMCR registers */
-#define PMCRD   0x8
-#define PMCRC   0x4
-#define PMCRE   0x1
 #endif
 
 static int vfp_gdb_get_reg(CPUARMState *env, uint8_t *buf, int reg)
@@ -876,6 +871,17 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+/* Definitions for the PMU registers */
+#define PMCRN   0xf800
+#define PMCRN_SHIFT 11
+#define PMCRD   0x8
+#define PMCRC   0x4
+#define PMCRE   0x1
+
+#define PMU_NUM_COUNTERS(env) ((env->cp15.c9_pmcr & PMCRN) >> PMCRN_SHIFT)
+/* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
+#define PMU_COUNTER_MASK(env) ((1 << 31) | ((1 << PMU_NUM_COUNTERS(env)) - 1))
+
 static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
@@ -1060,14 +1066,14 @@ static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void pmcntenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
-    value &= (1 << 31);
+    value &= (PMU_COUNTER_MASK(env) | (1 << 31));
     env->cp15.c9_pmcnten |= value;
 }
 
 static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
-    value &= (1 << 31);
+    value &= (PMU_COUNTER_MASK(env) | (1 << 31));
     env->cp15.c9_pmcnten &= ~value;
 }
 
@@ -1115,14 +1121,14 @@ static void pmintenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
     /* We have no event counters so only the C bit can be changed */
-    value &= (1 << 31);
+    value &= PMU_COUNTER_MASK(env);
     env->cp15.c9_pminten |= value;
 }
 
 static void pmintenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
-    value &= (1 << 31);
+    value &= PMU_COUNTER_MASK(env);
     env->cp15.c9_pminten &= ~value;
 }
 
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

