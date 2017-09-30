Received: by 10.223.197.9 with SMTP id q9csp1229112wrf;
        Fri, 29 Sep 2017 19:12:17 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QD46piF6WeIYVTcbeWIKc7zIe+1eaTAOdk9lyCneL4UTx26RSsMBvAfSH3Hm/eMabWXXPMv
X-Received: by 10.200.22.142 with SMTP id r14mr796480qtj.245.1506737537628;
        Fri, 29 Sep 2017 19:12:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506737537; cv=none;
        d=google.com; s=arc-20160816;
        b=LNZb2Q+vDoWxS9i1kaECrTYEw+I6YZCG17Md9dk4DH+5N29FjFT2tor1miZll3RPa2
         9z/XdZQ85fJ8gZde++tSCpaq6MLny4+tH/p1HmBeMf/3jE5E/GWU0UGGPHDXeJe0C/TV
         wdgU1HTAWlg4JJi7XCAX/vifBdC31fxASBtk6+PXOHXbkFvYFhcBXgQ3DFLQeVieDkvU
         uok60jYrYMhe9QbtcuBB7joXnbx4hFeeWJ+0kPIK7FcbBL8PDLPsFXJLs4DNTEiTutHR
         xTR+H99cneCycW62x6GAdJRjSU7S7E46Q2x36FoEhlje+UJe9pHL4v3zwf1wK1EdVLA7
         hCJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=VMfDCOrOYFdRWGobm7Zvfo3QDPC8ktP+8oSEiINr6dE=;
        b=HqaWrt2ATdDU7jDIkOUlk7oTWohehMfIHGF0p8nPrFqQXxxtOF9urzTJC2+FhepVGK
         1sdWFtYdNYMRnWEuaHaeWumxbUQLXEMZ1fjNrLrHSJcTlrY2mPMNiw6LpWi5bTHOyLBV
         +UmEXkGlf6jRmqIbwROXhfDY4mcfL/Li+0K7AtI7rjhlaogrj4or4yfeSB7vJ+44geSA
         nEI4ZjC7dvC0St5Xf5MRwmHCnw4zk1d8SrC83xIKnnU3PdOoEScqJjeE1PV2jMjnrgty
         /x7J57b2S/iji48na8Fj1iWQesvtMBFcwZ93+r4s90YcnURPVmTi0kfDqGxxLKS9iSs7
         5p3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=imiqy3hO;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=imiqy3hO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r36si4786933qtd.493.2017.09.29.19.12.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Sep 2017 19:12:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=imiqy3hO;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=imiqy3hO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Received: from localhost ([::1]:37798 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dy7GJ-0004n1-9K
	for alex.bennee@linaro.org; Fri, 29 Sep 2017 22:12:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7Dc-0002RE-E2
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 22:09:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7Da-000580-RL
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 22:09:28 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35240)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1dy7Da-00056F-Hf; Fri, 29 Sep 2017 22:09:26 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id B501860C6B; Sat, 30 Sep 2017 02:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737365;
	bh=WYZgexHMXcsEpgDgGQgCcAFhinyRpBO6m5MsQDr6lMA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=imiqy3hOQALRXbiBtXqKykxGrqBEZER2rXpjSWZnF5d5h2Iby3D7g9CbPsd6Cl5N6
	TshvK8/s5bWwpVM5U/7Ss0Cf89U9oOvFL3uSQ5aLA3JFpgUOdtS6JwV5824NPnDKzK
	6watt11TooF+239psU6gnEuLcn4SbYGgLzg/7f5I=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 2F4ED60C52;
	Sat, 30 Sep 2017 02:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737365;
	bh=WYZgexHMXcsEpgDgGQgCcAFhinyRpBO6m5MsQDr6lMA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=imiqy3hOQALRXbiBtXqKykxGrqBEZER2rXpjSWZnF5d5h2Iby3D7g9CbPsd6Cl5N6
	TshvK8/s5bWwpVM5U/7Ss0Cf89U9oOvFL3uSQ5aLA3JFpgUOdtS6JwV5824NPnDKzK
	6watt11TooF+239psU6gnEuLcn4SbYGgLzg/7f5I=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2F4ED60C52
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Wei Huang <wei@redhat.com>
Date: Fri, 29 Sep 2017 22:08:23 -0400
Message-Id: <1506737310-21880-7-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH 06/13] target/arm: Filter cycle counter based on
 PMCCFILTR_EL0
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
X-TUID: MLrcW2EceAfo

The pmu_counter_filtered and pmu_sync functions are generic (as opposed
to PMCCNTR-specific) to allow for the implementation of other events.

RFC: I know that many of the locations of the calls to pmu_sync are
problematic when icount is enabled because can_do_io will not be set.
The documentation says that for deterministic execution, IO must only be
performed by the last instruction of a thread block. Because
cpu_handle_interrupt() and cpu_handle_exception() are actually made
outside of a thread block, is it safe to set can_do_io=1 for them to
allow this to succeed? Is there a better mechanism for handling this?

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.c       |  4 +++
 target/arm/cpu.h       | 15 +++++++++++
 target/arm/helper.c    | 73 +++++++++++++++++++++++++++++++++++++++++++++++---
 target/arm/kvm64.c     |  2 ++
 target/arm/machine.c   |  2 ++
 target/arm/op_helper.c |  4 +++
 6 files changed, 97 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a6c29cf..dfadaad 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -139,6 +139,8 @@ static void arm_cpu_reset(CPUState *s)
         env->iwmmxt.cregs[ARM_IWMMXT_wCID] = 0x69051000 | 'Q';
     }
 
+    pmu_sync(env); /* Surround writes to uncached_cpsr, pstate, and aarch64 */
+
     if (arm_feature(env, ARM_FEATURE_AARCH64)) {
         /* 64 bit CPUs always start in 64 bit mode */
         env->aarch64 = 1;
@@ -180,6 +182,8 @@ static void arm_cpu_reset(CPUState *s)
     env->uncached_cpsr = ARM_CPU_MODE_SVC;
     env->daif = PSTATE_D | PSTATE_A | PSTATE_I | PSTATE_F;
 
+    pmu_sync(env); /* Surround writes to uncached_cpsr, pstate, and aarch64 */
+
     if (arm_feature(env, ARM_FEATURE_M)) {
         uint32_t initial_msp; /* Loaded from 0x0 */
         uint32_t initial_pc; /* Loaded from 0x4 */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8afceca..811b1fe 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -822,6 +822,19 @@ int cpu_arm_signal_handler(int host_signum, void *pinfo,
  */
 void pmccntr_sync(CPUARMState *env);
 
+/**
+ * pmu_sync
+ * @env: CPUARMState
+ *
+ * Synchronises all PMU counters. This must always be called twice, once before
+ * any action that might affect the filtering of all counters and again
+ * afterwards. The function is used to swap the state of the registers if
+ * required. This only happens when not in user mode (!CONFIG_USER_ONLY). Any
+ * writes to env's aarch64, pstate, uncached_cpsr, cp15.scr_el3, or
+ * cp15.hcr_el2 must be protected by calls to this function.
+ */
+void pmu_sync(CPUARMState *env);
+
 /* SCTLR bit meanings. Several bits have been reused in newer
  * versions of the architecture; in that case we define constants
  * for both old and new bit meanings. Code which tests against those
@@ -1018,7 +1031,9 @@ static inline void pstate_write(CPUARMState *env, uint32_t val)
     env->CF = (val >> 29) & 1;
     env->VF = (val << 3) & 0x80000000;
     env->daif = val & PSTATE_DAIF;
+    pmu_sync(env);
     env->pstate = val & ~CACHED_PSTATE_BITS;
+    pmu_sync(env);
 }
 
 /* Return the current CPSR value.  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index fcc2fcf..74e90c5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -878,6 +878,15 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
 #define PMCRC   0x4
 #define PMCRE   0x1
 
+#define PMXEVTYPER_P          0x80000000
+#define PMXEVTYPER_U          0x40000000
+#define PMXEVTYPER_NSK        0x20000000
+#define PMXEVTYPER_NSU        0x10000000
+#define PMXEVTYPER_NSH        0x08000000
+#define PMXEVTYPER_M          0x04000000
+#define PMXEVTYPER_MT         0x02000000
+#define PMXEVTYPER_EVTCOUNT   0x000003ff
+
 #define PMU_NUM_COUNTERS(env) ((env->cp15.c9_pmcr & PMCRN) >> PMCRN_SHIFT)
 /* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
 #define PMU_COUNTER_MASK(env) ((1 << 31) | ((1 << PMU_NUM_COUNTERS(env)) - 1))
@@ -968,7 +977,7 @@ static CPAccessResult pmreg_access_ccntr(CPUARMState *env,
 
 static inline bool arm_ccnt_enabled(CPUARMState *env)
 {
-    /* This does not support checking PMCCFILTR_EL0 register */
+    /* Does not check PMCCFILTR_EL0, which is handled by pmu_counter_filtered */
 
     if (!(env->cp15.c9_pmcr & PMCRE) || !(env->cp15.c9_pmcnten & (1 << 31))) {
         return false;
@@ -977,6 +986,43 @@ static inline bool arm_ccnt_enabled(CPUARMState *env)
     return true;
 }
 
+/* Returns true if the counter corresponding to the passed-in pmevtyper or
+ * pmccfiltr value is filtered using the current state */
+static inline bool pmu_counter_filtered(CPUARMState *env, uint64_t pmxevtyper)
+{
+    bool secure = arm_is_secure(env);
+    int el = arm_current_el(env);
+
+    bool P   = pmxevtyper & PMXEVTYPER_P;
+    bool U   = pmxevtyper & PMXEVTYPER_U;
+    bool NSK = pmxevtyper & PMXEVTYPER_NSK;
+    bool NSU = pmxevtyper & PMXEVTYPER_NSU;
+    bool NSH = pmxevtyper & PMXEVTYPER_NSH;
+    bool M   = pmxevtyper & PMXEVTYPER_M;
+
+    if (el == 1 && P) {
+        return true;
+    } else if (el == 0 && U) {
+        return true;
+    }
+
+    if (arm_feature(env, ARM_FEATURE_EL3)) {
+        if (el == 1 && !secure && NSK != P) {
+            return true;
+        } else if (el == 0 && !secure && NSU != U) {
+            return true;
+        } else if (el == 3 && secure && M != P) {
+            return true;
+        }
+    }
+
+    if (arm_feature(env, ARM_FEATURE_EL2) && el == 2 && !secure && !NSH) {
+        return true;
+    }
+
+    return false;
+}
+
 void pmccntr_sync(CPUARMState *env)
 {
     if (arm_ccnt_enabled(env) &&
@@ -995,10 +1041,15 @@ void pmccntr_sync(CPUARMState *env)
     }
 }
 
+void pmu_sync(CPUARMState *env)
+{
+    pmccntr_sync(env);
+}
+
 static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
-    pmccntr_sync(env);
+    pmu_sync(env);
 
     if (value & PMCRC) {
         /* The counter has been reset */
@@ -1009,7 +1060,7 @@ static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     env->cp15.c9_pmcr &= ~0x39;
     env->cp15.c9_pmcr |= (value & 0x39);
 
-    pmccntr_sync(env);
+    pmu_sync(env);
 }
 
 static uint64_t pmccntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -1053,6 +1104,10 @@ void pmccntr_sync(CPUARMState *env)
 {
 }
 
+void pmu_sync(CPUARMState *env)
+{
+}
+
 #endif
 
 static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1184,7 +1239,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 
     /* Clear all-context RES0 bits.  */
     value &= valid_mask;
+    pmu_sync(env);
     raw_write(env, ri, value);
+    pmu_sync(env);
 }
 
 static uint64_t ccsidr_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -3736,7 +3793,9 @@ static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     if ((raw_read(env, ri) ^ value) & (HCR_VM | HCR_PTW | HCR_DC)) {
         tlb_flush(CPU(cpu));
     }
+    pmu_sync(env);
     raw_write(env, ri, value);
+    pmu_sync(env);
 }
 
 static const ARMCPRegInfo el2_cp_reginfo[] = {
@@ -5815,7 +5874,9 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
         }
     }
     mask &= ~CACHED_CPSR_BITS;
+    pmu_sync(env);
     env->uncached_cpsr = (env->uncached_cpsr & ~mask) | (val & mask);
+    pmu_sync(env);
 }
 
 /* Sign/zero extend */
@@ -6864,6 +6925,8 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         addr += A32_BANKED_CURRENT_REG_GET(env, vbar);
     }
 
+    pmu_sync(env); /* Surrounds updates to scr_el3 and uncached_cpsr */
+
     if ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_MON) {
         env->cp15.scr_el3 &= ~SCR_NS;
     }
@@ -6891,6 +6954,8 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
     }
     env->regs[14] = env->regs[15] + offset;
     env->regs[15] = addr;
+
+    pmu_sync(env); /* Surrounds updates to scr_el3 and uncached_cpsr */
 }
 
 /* Handle exception entry to a target EL which is using AArch64 */
@@ -6980,7 +7045,9 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
                   env->elr_el[new_el]);
 
     pstate_write(env, PSTATE_DAIF | new_mode);
+    pmu_sync(env);
     env->aarch64 = 1;
+    pmu_sync(env);
     aarch64_restore_sp(env, new_el);
 
     env->pc = addr;
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 6554c30..55a4e04 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -783,7 +783,9 @@ int kvm_arch_get_registers(CPUState *cs)
         return ret;
     }
 
+    pmu_sync(env);
     env->aarch64 = ((val & PSTATE_nRW) == 0);
+    pmu_sync(env);
     if (is_a64(env)) {
         pstate_write(env, val);
     } else {
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 29df7ac..496b67c 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -325,7 +325,9 @@ static int get_cpsr(QEMUFile *f, void *opaque, size_t size,
         return 0;
     }
 
+    pmu_sync(env);
     env->aarch64 = ((val & PSTATE_nRW) == 0);
+    pmu_sync(env);
 
     if (is_a64(env)) {
         pstate_write(env, val);
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 6a60464..fa976a8 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -1063,7 +1063,9 @@ void HELPER(exception_return)(CPUARMState *env)
     }
 
     if (!return_to_aa64) {
+        pmu_sync(env);
         env->aarch64 = 0;
+        pmu_sync(env);
         /* We do a raw CPSR write because aarch64_sync_64_to_32()
          * will sort the register banks out for us, and we've already
          * caught all the bad-mode cases in el_from_spsr().
@@ -1083,7 +1085,9 @@ void HELPER(exception_return)(CPUARMState *env)
                       "AArch32 EL%d PC 0x%" PRIx32 "\n",
                       cur_el, new_el, env->regs[15]);
     } else {
+        pmu_sync(env);
         env->aarch64 = 1;
+        pmu_sync(env);
         pstate_write(env, spsr);
         if (!arm_singlestep_active(env)) {
             env->pstate &= ~PSTATE_SS;
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.\nQualcomm Technologies, Inc. is a member of the\nCode Aurora Forum, a Linux Foundation Collaborative Project.

