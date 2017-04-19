Received: by 10.25.0.144 with SMTP id 138csp378096lfa;
        Wed, 19 Apr 2017 10:42:09 -0700 (PDT)
X-Received: by 10.237.59.89 with SMTP id q25mr4099585qte.121.1492623729517;
        Wed, 19 Apr 2017 10:42:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r4si3050704qkl.142.2017.04.19.10.42.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Apr 2017 10:42:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org;
       dkim=fail header.i=@codeaurora.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49609 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0tcG-0008NT-Rd
	for alex.bennee@linaro.org; Wed, 19 Apr 2017 13:42:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43851)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1d0tc1-0008As-Ko
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 13:41:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1d0tbz-0004Lf-MT
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 13:41:53 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37562)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1d0tbz-0004LQ-Dy; Wed, 19 Apr 2017 13:41:51 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 7F499610DB; Wed, 19 Apr 2017 17:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1492623710;
	bh=Ia3sU4E67QVZjgPv1oIPVXh5d7mskpcdU0b7G/qfj1s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QygXrUh3YOjPC3R/luXtW+VaGf6sazQGIHFkERUQbKj8oOPSTad39Ppyw/njFiu9H
	0yEn/MyEP7W+7FDwfpHBa27OVYR5c1lzztJ0Qk9QyoiBuw1r4gumPSLjqkufYw7/Q8
	J+ZKIdzTkS/nfTBfoZFs3ILRIB868cJPDW2jneIc=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 7411B61112;
	Wed, 19 Apr 2017 17:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1492623710;
	bh=Ia3sU4E67QVZjgPv1oIPVXh5d7mskpcdU0b7G/qfj1s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QygXrUh3YOjPC3R/luXtW+VaGf6sazQGIHFkERUQbKj8oOPSTad39Ppyw/njFiu9H
	0yEn/MyEP7W+7FDwfpHBa27OVYR5c1lzztJ0Qk9QyoiBuw1r4gumPSLjqkufYw7/Q8
	J+ZKIdzTkS/nfTBfoZFs3ILRIB868cJPDW2jneIc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7411B61112
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Date: Wed, 19 Apr 2017 13:41:14 -0400
Message-Id: <1492623684-25799-4-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
References: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH 03/13] target/arm: Reorganize PMCCNTR read, write,
 sync
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
X-TUID: 0VSSFHrEesWm

pmccntr_read and pmccntr_write contained duplicate code that was already
being handled by pmccntr_sync. This also moves the calls to get the
clock inside the 'if' statement so they are not executed if not needed.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 55 ++++++++++++++++-------------------------------------
 1 file changed, 16 insertions(+), 39 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8888391..390256b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -973,17 +973,18 @@ static inline bool arm_ccnt_enabled(CPUARMState *env)
 
 void pmccntr_sync(CPUARMState *env)
 {
-    uint64_t temp_ticks;
+    if (arm_ccnt_enabled(env) &&
+          !pmu_counter_filtered(env, env->cp15.pmccfiltr_el0)) {
+        uint64_t temp_ticks;
 
-    temp_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-                          ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
+        temp_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                              ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
 
-    if (env->cp15.c9_pmcr & PMCRD) {
-        /* Increment once every 64 processor clock cycles */
-        temp_ticks /= 64;
-    }
+        if (env->cp15.c9_pmcr & PMCRD) {
+            /* Increment once every 64 processor clock cycles */
+            temp_ticks /= 64;
+        }
 
-    if (arm_ccnt_enabled(env)) {
         env->cp15.c15_ccnt = temp_ticks - env->cp15.c15_ccnt;
     }
 }
@@ -1007,21 +1008,11 @@ static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
 static uint64_t pmccntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-    uint64_t total_ticks;
-
-    if (!arm_ccnt_enabled(env)) {
-        /* Counter is disabled, do not change value */
-        return env->cp15.c15_ccnt;
-    }
-
-    total_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-                           ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
-
-    if (env->cp15.c9_pmcr & PMCRD) {
-        /* Increment once every 64 processor clock cycles */
-        total_ticks /= 64;
-    }
-    return total_ticks - env->cp15.c15_ccnt;
+    uint64_t ret;
+    pmccntr_sync(env);
+    ret = env->cp15.c15_ccnt;
+    pmccntr_sync(env);
+    return ret;
 }
 
 static void pmselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1038,22 +1029,8 @@ static void pmselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void pmccntr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
-    uint64_t total_ticks;
-
-    if (!arm_ccnt_enabled(env)) {
-        /* Counter is disabled, set the absolute value */
-        env->cp15.c15_ccnt = value;
-        return;
-    }
-
-    total_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-                           ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
-
-    if (env->cp15.c9_pmcr & PMCRD) {
-        /* Increment once every 64 processor clock cycles */
-        total_ticks /= 64;
-    }
-    env->cp15.c15_ccnt = total_ticks - value;
+    env->cp15.c15_ccnt = value;
+    pmccntr_sync(env);
 }
 
 static void pmccntr_write32(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

