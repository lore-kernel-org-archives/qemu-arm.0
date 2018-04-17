Received: by 10.28.4.212 with SMTP id 203csp4252470wme;
        Tue, 17 Apr 2018 13:42:01 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48nz+T3RAzm9VIlxqtAb58g5MRF0iDmXA/CVB+fXpNX8TyGdBZ/N0gC0PU0UwIXPyPT9oZ4
X-Received: by 10.129.114.87 with SMTP id n84mr2591998ywc.348.1523997721711;
        Tue, 17 Apr 2018 13:42:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523997721; cv=none;
        d=google.com; s=arc-20160816;
        b=J3k+t5x4t6G3dxpZL18JbZqbUrU4fPzdEuWkmc+MIoOhA+lb+eZPsMg/hB+Rl5OtH2
         IAXBNtmmGZOdUKqOPde7HIOvEe7zyrcH1wH5bTz/IUqAxK3kPHR4EcGjMa0yHI/fF1Go
         A9SSW3pj+96hRg/CmjZSVlWiOErTxfUGPYxEDRNQO7R5zsL3v0ott0s1kahEc1cQ2GQK
         tZ8ScE9IkKt4Dp+XXYjTQNrPpdfSNNK099SXI4GO0ihrfF2nZyLyCQeNtWG8mBy/uwT+
         89XUp2skoRBdT3A9zCRjavE49VbyIfprP7ixcRc6w/4VS7VzuzBFj8mfhrucgWlgKt1a
         fxFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=uyoa5yCOmHGgwZjgpssWWA32YbuNBPpH15pE96ZgaW8=;
        b=ADGUw4AAeqFvJqL5j0M6UciaSkmty3aqDCuUN7ptQw8shkEWCI/C+wEhSd2pk11dbQ
         qQXV/5WLsyH3XAE4lmYbof/TbkOh53WTqp8qOwReo+ieTkqcwKzw2M5EcH9zr+4weaxj
         SR4jitVZvt3jOEbigsqxZSMPU3l3aQ/N8CwEXAsqPPyf6onP4jXC0GVSpsG/8nj4r7nB
         UFfemrMOEXCpUX7YmiO2VLoLxLdkRIrZLHxUfvAIeLbozSwFWVRIKmClx4DLIqLijUnZ
         Bvt1cTqclZnN9WItd97+e1YdiX8A7uUBCrPOK+JvxuteT0xPTTINRWOzDBmP2al08mj2
         Ejiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=lf68Hf9I;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=ENMDr/kJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e7si3183621qkc.73.2018.04.17.13.42.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 13:42:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=lf68Hf9I;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=ENMDr/kJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8XQP-0005LN-4T
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 16:42:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNO-0002mm-2D
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:38:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNL-0004Pg-Gm
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:38:53 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39284)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8XNL-0004Gw-6V; Tue, 17 Apr 2018 16:38:51 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 44C1B60F8E; Tue, 17 Apr 2018 20:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997530;
	bh=0edjnVVvLJ8khr8Ny4HvhkS9SZgXmu9zNR/5y/fdxBw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lf68Hf9Ivc/in+CXg0jXycW4DQe9JJ3++1JA3wDJZTGhsJuL/5bOFLNlTCPIMZnww
	FdIrvrhdbhArdo8KbSS/uNr4/QM0Ox45/5okt81Ojez4Gj5vfAnAzDm+OIpMYVf53P
	QGE3xIj6/St9ugD3OnHAgUXvHHMVrNtDNKsjBeJs=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 438DE606AC;
	Tue, 17 Apr 2018 20:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997529;
	bh=0edjnVVvLJ8khr8Ny4HvhkS9SZgXmu9zNR/5y/fdxBw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ENMDr/kJI/c2JONxMsRFcU6IckEtabm6oRQEq/eO6gW991XvAn9Ag3S2qPkB7qGtq
	Y01vniVOgfOrDR0b8BHsfDoBwGAV8T6fAztd14TQfP6H3vxFlujMSlIDIBtSuLr9E5
	OjSJ9M+p9AJsyMScCGQ1phtWldxFZsIEaLbeu+I8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 438DE606AC
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 17 Apr 2018 16:37:47 -0400
Message-Id: <1523997485-1905-4-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v4 03/21] target/arm: Reorganize PMCCNTR accesses
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
X-TUID: i0eb3YQyZaxB

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
index 19a0c03..04041db 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -454,10 +454,20 @@ typedef struct CPUARMState {
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
@@ -890,15 +900,17 @@ int cpu_arm_signal_handler(int host_signum, void *pinfo,
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
index 83ea8f4..f6269a2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1000,28 +1000,53 @@ static inline bool arm_ccnt_enabled(CPUARMState *env)
 
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
@@ -1032,26 +1057,16 @@ static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -1068,22 +1083,9 @@ static void pmselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -1096,7 +1098,11 @@ static void pmccntr_write32(CPUARMState *env, const ARMCPRegInfo *ri,
 
 #else /* CONFIG_USER_ONLY */
 
-void pmccntr_sync(CPUARMState *env)
+void pmccntr_op_start(CPUARMState *env)
+{
+}
+
+void pmccntr_op_finish(CPUARMState *env)
 {
 }
 
@@ -1105,9 +1111,9 @@ void pmccntr_sync(CPUARMState *env)
 static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
-    pmccntr_sync(env);
+    pmccntr_op_start(env);
     env->cp15.pmccfiltr_el0 = value & 0x7E000000;
-    pmccntr_sync(env);
+    pmccntr_op_finish(env);
 }
 
 static void pmcntenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

