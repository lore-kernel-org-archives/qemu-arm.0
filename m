Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1248969wrq;
        Fri, 22 Jun 2018 13:32:53 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJ1ifhyRx7ElCzCzorxlCnY/uOpzfgbt4wbFHIEAcmaq3nwFYU8kq/M3Qa+dsL6EdT1ViLm
X-Received: by 2002:a37:faa:: with SMTP id 42-v6mr592231qkp.387.1529699573873;
        Fri, 22 Jun 2018 13:32:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529699573; cv=none;
        d=google.com; s=arc-20160816;
        b=Mg1IuoMCcv1wPYxlhyFFaGueQaUA+2IlvqocjXknQwuGzFIr2EZiTZX7xra365CJPc
         odMYLcB+4WSnbHwBeBYPLrS/yZBY8HcdUux2SGVQhojnNn4uJzSVTw2qryMItlvDHprG
         SRC+UAkCFcsUd6fKHtKBXgVYPtJHgdmP8JEy1O2EtnHH4PH3RYjI0QYAPHD+Hd6DOnZN
         WdvdawODpDFH9sAYR4t02B8w0vwFlTQS6zPJNUt8yUKjLwA9pA3i5BiC+jBHP67iounU
         v08asiYCeddEI+wBw4X2Ut1T3xr+buGKj7USHBUPgaz8+iLFpSUPRgU+nfhT51nULEmF
         bWag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=kKPojPl1nEbP8rmsHZMMnE84DGJDuRnah8GlKW6xmZQ=;
        b=CWeIVFfYy17m5I0av91mMpI73GtFmQHtQ3Y1+h7eB6U6+xzXvwq/cAXSjUSKJ9M1hr
         SR7Kduy+1tmbho6FJxtjw++z/ZlCTcEa7oWYpxTT97tcWtOdUWKe7XxukK79aLH/TKe/
         siq6MUzGw5Qgz5GzJHhwDH/qZyeDQ+lnSyr0c+kwDAtf2jMpMXBwsJzgCoSXK6frmi5s
         5my5ifYHCTYhnXHondER7eBK2OFdo8jDhsL1vBu+zUhFliaU7XukeCIIape2l7T5hZH3
         Hz+emqfiEBBajrU0oFbR/DcEaaDpc0B30w+YIE3LixIfGqruHKBsK2G+7+Kon67dYmIq
         wZag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=JH5uLBgx;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=NqBY7AZf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4-v6si1724143qkl.387.2018.06.22.13.32.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 13:32:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=JH5uLBgx;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=NqBY7AZf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36063 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWSjl-00026a-9t
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 16:32:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSjX-00024Q-OY
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:32:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSjV-0005P7-9o
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:32:39 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45100)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1fWSjV-0005Ou-0V; Fri, 22 Jun 2018 16:32:37 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 1B31060B13; Fri, 22 Jun 2018 20:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699556;
	bh=InCWDuIij7WtZxZkLbiWmWFvCgJSfZZgl3ZVKcb3qpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JH5uLBgxPclpcqCdK+u869EGUZOlDNtOUGlbVdiTZptDf3Wa6XcrWQLX4kq8Pc6Iv
	deodsSPbs7DObckvCT0aToq4/fruWN/et68/8LjvQeQTG7qimdpYxRKMITuyFIVux5
	PYRpQjfSu8AW0wbNRhsz2YF5vDvyJGAxHm7CpnqE=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id A16F76063F;
	Fri, 22 Jun 2018 20:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699555;
	bh=InCWDuIij7WtZxZkLbiWmWFvCgJSfZZgl3ZVKcb3qpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NqBY7AZf/vaRlo4E6mGxdz3vcrtwrb3FgE8XctZGxfKVNHbCA02NKJEspVAiNALMz
	oiGK7GtjSVWyRlXrMolTXYl7DVRO9RfRUkL+Y7adV3gnqiqbi3bTGcEaAfUdR3kpr4
	e4ssbzpIAYa5PwKwWK/2SsIDyMoY3ltA9MbQUdgE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A16F76063F
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 22 Jun 2018 16:32:15 -0400
Message-Id: <1529699547-17044-2-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v5 01/13] target/arm: Reorganize PMCCNTR accesses
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
X-TUID: nTXniymakzXp

pmccntr_read and pmccntr_write contained duplicate code that was already
being handled by pmccntr_sync. Consolidate the duplicated code into two
functions: pmccntr_op_start and pmccntr_op_finish. Add a companion to
c15_ccnt in CPUARMState so that we can simultaneously save both the
architectural register value and the last underlying cycle count - this
ensure time isn't lost and will also allow us to access the 'old'
architectural register value in order to detect overflows in later
patches.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.h    |  28 ++++++++++-----
 target/arm/helper.c | 100 ++++++++++++++++++++++++++++------------------------
 2 files changed, 73 insertions(+), 55 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8488273..ba2c876 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -467,10 +467,20 @@ typedef struct CPUARMState {
         uint64_t oslsr_el1; /* OS Lock Status */
         uint64_t mdcr_el2;
         uint64_t mdcr_el3;
-        /* If the counter is enabled, this stores the last time the counter
-         * was reset. Otherwise it stores the counter value
+        /* Stores the architectural value of the counter *the last time it was
+         * updated* by pmccntr_op_start. Accesses should always be surrounded
+         * by pmccntr_op_start/pmccntr_op_finish to guarantee the latest
+         * architecturally-corect value is being read/set.
          */
         uint64_t c15_ccnt;
+        /* Stores the delta between the architectural value and the underlying
+         * cycle count during normal operation. It is used to update c15_ccnt
+         * to be the correct architectural value before accesses. During
+         * accesses, c15_ccnt_delta contains the underlying count being used
+         * for the access, after which it reverts to the delta value in
+         * pmccntr_op_finish.
+         */
+        uint64_t c15_ccnt_delta;
         uint64_t pmccfiltr_el0; /* Performance Monitor Filter Register */
         uint64_t vpidr_el2; /* Virtualization Processor ID Register */
         uint64_t vmpidr_el2; /* Virtualization Multiprocessor ID Register */
@@ -924,15 +934,17 @@ int cpu_arm_signal_handler(int host_signum, void *pinfo,
                            void *puc);
 
 /**
- * pmccntr_sync
+ * pmccntr_op_start/finish
  * @env: CPUARMState
  *
- * Synchronises the counter in the PMCCNTR. This must always be called twice,
- * once before any action that might affect the timer and again afterwards.
- * The function is used to swap the state of the register if required.
- * This only happens when not in user mode (!CONFIG_USER_ONLY)
+ * Convert the counter in the PMCCNTR between its delta form (the typical mode
+ * when it's enabled) and the guest-visible value. These two calls must always
+ * surround any action which might affect the counter, and the return value
+ * from pmccntr_op_start must be supplied as the second argument to
+ * pmccntr_op_finish.
  */
-void pmccntr_sync(CPUARMState *env);
+void pmccntr_op_start(CPUARMState *env);
+void pmccntr_op_finish(CPUARMState *env);
 
 /* SCTLR bit meanings. Several bits have been reused in newer
  * versions of the architecture; in that case we define constants
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1248d84..23b3a16 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1044,28 +1044,53 @@ static inline bool arm_ccnt_enabled(CPUARMState *env)
 
     return true;
 }
-
-void pmccntr_sync(CPUARMState *env)
+/*
+ * Ensure c15_ccnt is the guest-visible count so that operations such as
+ * enabling/disabling the counter or filtering, modifying the count itself,
+ * etc. can be done logically. This is essentially a no-op if the counter is
+ * not enabled at the time of the call.
+ */
+void pmccntr_op_start(CPUARMState *env)
 {
-    uint64_t temp_ticks;
-
-    temp_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+    uint64_t cycles = 0;
+    cycles = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
                           ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
 
-    if (env->cp15.c9_pmcr & PMCRD) {
-        /* Increment once every 64 processor clock cycles */
-        temp_ticks /= 64;
-    }
-
     if (arm_ccnt_enabled(env)) {
-        env->cp15.c15_ccnt = temp_ticks - env->cp15.c15_ccnt;
+        uint64_t eff_cycles = cycles;
+        if (env->cp15.c9_pmcr & PMCRD) {
+            /* Increment once every 64 processor clock cycles */
+            eff_cycles /= 64;
+        }
+
+        env->cp15.c15_ccnt = eff_cycles - env->cp15.c15_ccnt_delta;
+    }
+    env->cp15.c15_ccnt_delta = cycles;
+}
+
+/*
+ * If PMCCNTR is enabled, recalculate the delta between the clock and the
+ * guest-visible count. A call to pmccntr_op_finish should follow every call to
+ * pmccntr_op_start.
+ */
+void pmccntr_op_finish(CPUARMState *env)
+{
+    if (arm_ccnt_enabled(env)) {
+        uint64_t prev_cycles = env->cp15.c15_ccnt_delta;
+
+        if (env->cp15.c9_pmcr & PMCRD) {
+            /* Increment once every 64 processor clock cycles */
+            prev_cycles /= 64;
+        }
+
+        env->cp15.c15_ccnt_delta = prev_cycles - env->cp15.c15_ccnt;
     }
 }
 
 static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
-    pmccntr_sync(env);
+    pmccntr_op_start(env);
 
     if (value & PMCRC) {
         /* The counter has been reset */
@@ -1076,26 +1101,16 @@ static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     env->cp15.c9_pmcr &= ~0x39;
     env->cp15.c9_pmcr |= (value & 0x39);
 
-    pmccntr_sync(env);
+    pmccntr_op_finish(env);
 }
 
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
+    pmccntr_op_start(env);
+    ret = env->cp15.c15_ccnt;
+    pmccntr_op_finish(env);
+    return ret;
 }
 
 static void pmselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1112,22 +1127,9 @@ static void pmselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
+    pmccntr_op_start(env);
+    env->cp15.c15_ccnt = value;
+    pmccntr_op_finish(env);
 }
 
 static void pmccntr_write32(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1140,7 +1142,11 @@ static void pmccntr_write32(CPUARMState *env, const ARMCPRegInfo *ri,
 
 #else /* CONFIG_USER_ONLY */
 
-void pmccntr_sync(CPUARMState *env)
+void pmccntr_op_start(CPUARMState *env)
+{
+}
+
+void pmccntr_op_finish(CPUARMState *env)
 {
 }
 
@@ -1149,9 +1155,9 @@ void pmccntr_sync(CPUARMState *env)
 static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
-    pmccntr_sync(env);
+    pmccntr_op_start(env);
     env->cp15.pmccfiltr_el0 = value & 0xfc000000;
-    pmccntr_sync(env);
+    pmccntr_op_finish(env);
 }
 
 static void pmcntenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

