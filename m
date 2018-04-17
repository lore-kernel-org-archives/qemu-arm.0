Received: by 10.28.4.212 with SMTP id 203csp4257870wme;
        Tue, 17 Apr 2018 13:48:58 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpExBeVGyVkbO6o5l2aA3Ep+SX5i6Gjlk1g8Qjk1gvLeskwDHbyYnvlTssL9sB5F4+wjnFU
X-Received: by 10.55.31.202 with SMTP id n71mr876122qkh.430.1523998138357;
        Tue, 17 Apr 2018 13:48:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523998138; cv=none;
        d=google.com; s=arc-20160816;
        b=N5uwgd7a6W6b2WHkeTKbHl6+vslabfA1W4zh39CReA0bq0bS3uOow14tGUUdzn3UkO
         xAE6GpgNpiY5TnuPQ1OVH4jzu2LKDKAVJrBOgqCwHivl2kFQVyn1uLoBMxBAteduGapU
         /aY+IMxm2HigFfE0i3qmz66p+J7Cmn58F5j2TFSeazrObxNHT4SPyJIel5jFIs8dxypE
         Ss2YC5BuvoPw9OTXa8DeyYzbL+/ujZ9QIdphwSi5i/7n6mkDILBI5bMjJIWWQFrCCfjf
         vxhfxtNaEPwT4I9EIx30xj3782bPwbhgzlk763bpimdL+gxPfDhUuBA6GZcubxzHLGVw
         WKsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=rwO0ftI7t8TwOKnIvnQNKegETSfImw9MZA6B5F4iBMA=;
        b=GpIUUGa3k9c09TmPieKWuJyev3tJaAUXrw1SBUWDrG2LB8wlZ8OHaL7ele/rwIPDI4
         h5WUQJKDageF8jZnRlJpcz/h39Vz6YYG0UriyJvbDgtvwRZaywf1LZcmxwpabQWlmR3j
         kiXxporPfgq0qr6nsyrNI4tFl3zsW48u6T0symQ/t8lCKqBYfROouWM9L+fKxIDE2LiE
         rUfyxtR00lHSAMvoxXZ9sGDsVn+IhgKVEfS+odjfnnw5XQLhD9/ZNv8KQP2z1+9aDoEV
         e/GQLwVv8i8JAg+ruv4TZqUJsmjIQBBR/0gyGokXiKcVHvyiJofQTOX+8ctqsjgdnqXv
         aRCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=ReSrme0Q;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=J95hSX9g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i62si3553468qkf.319.2018.04.17.13.48.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 13:48:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=ReSrme0Q;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=J95hSX9g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33397 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8XX7-0002do-ON
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 16:48:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50701)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNc-00030e-NS
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNY-0005u7-Mi
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:08 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39962)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8XNY-0005kQ-0i; Tue, 17 Apr 2018 16:39:04 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 5C0DE610DC; Tue, 17 Apr 2018 20:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997542;
	bh=VEZsIL0yK3isjKVhbPCxAFtYL1bpLWKRjtLRNSanDLQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ReSrme0QzXptcqXB1RsnJI96gsAlaE9x0FTLz7qnRFQsBZ4hiExNp9cKXc3H/gj4e
	CfBtSIFiPMuKE8LbqJIGZ902s414eOBDmvFjCwu64cI/Nc5/E2Qz6b8al6fA13Ammx
	IQ3UCgqlISzYAvKR9MT+s2RCoMr1Zu8oUZuO95BI=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 390A760385;
	Tue, 17 Apr 2018 20:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997537;
	bh=VEZsIL0yK3isjKVhbPCxAFtYL1bpLWKRjtLRNSanDLQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J95hSX9ggOYuqzhgcy1DQt3m7VaNs/o79ARq6dGF6sDEv7AGLJPp3BTtKw+C5LZIL
	KVSB3KIVFBY6JtkSOgkFLbyXiwzFOMkqdU6zn7Etu65YDrYQbh+ET+Y1G3x9tqvBkV
	ieZgO77L8lWeTMJiI5SRN9xPysur+0HxA03p5RZE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 390A760385
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 17 Apr 2018 16:37:54 -0400
Message-Id: <1523997485-1905-11-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v4 10/21] target/arm: Filter cycle counter based
 on PMCCFILTR_EL0
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
X-TUID: IvNWsrKV9YkQ

The pmu_counter_enabled and pmu_op_start/finish functions are generic
(as opposed to PMCCNTR-specific) to allow for the implementation of
other events.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.c    |   3 ++
 target/arm/cpu.h    |  22 +++++++++-
 target/arm/helper.c | 114 +++++++++++++++++++++++++++++++++++++++++++++++-----
 3 files changed, 129 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d175c5e..2228e4c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -896,6 +896,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     if (!cpu->has_pmu) {
         unset_feature(env, ARM_FEATURE_PMU);
         cpu->id_aa64dfr0 &= ~0xf00;
+    } else if (!kvm_enabled()) {
+        arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
+        arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
     }
 
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4f0d914..a56e9a0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -917,6 +917,24 @@ int cpu_arm_signal_handler(int host_signum, void *pinfo,
 void pmccntr_op_start(CPUARMState *env);
 void pmccntr_op_finish(CPUARMState *env);
 
+/**
+ * pmu_op_start/finish
+ * @env: CPUARMState
+ *
+ * Convert all PMU counters between their delta form (the typical mode when
+ * they are enabled) and the guest-visible values. These two calls must
+ * surround any action which might affect the counters, and the return value
+ * from pmu_op_start must be supplied as the second argument to pmu_op_finish.
+ */
+void pmu_op_start(CPUARMState *env);
+void pmu_op_finish(CPUARMState *env);
+
+/**
+ * Functions to register as EL change hooks for PMU mode filtering
+ */
+void pmu_pre_el_change(ARMCPU *cpu, void *ignored);
+void pmu_post_el_change(ARMCPU *cpu, void *ignored);
+
 /* SCTLR bit meanings. Several bits have been reused in newer
  * versions of the architecture; in that case we define constants
  * for both old and new bit meanings. Code which tests against those
@@ -978,7 +996,8 @@ void pmccntr_op_finish(CPUARMState *env);
 
 #define MDCR_EPMAD    (1U << 21)
 #define MDCR_EDAD     (1U << 20)
-#define MDCR_SPME     (1U << 17)
+#define MDCR_SPME     (1U << 17)  /* MDCR_EL3 */
+#define MDCR_HPMD     (1U << 17)  /* MDCR_EL2 */
 #define MDCR_SDD      (1U << 16)
 #define MDCR_SPD      (3U << 14)
 #define MDCR_TDRA     (1U << 11)
@@ -988,6 +1007,7 @@ void pmccntr_op_finish(CPUARMState *env);
 #define MDCR_HPME     (1U << 7)
 #define MDCR_TPM      (1U << 6)
 #define MDCR_TPMCR    (1U << 5)
+#define MDCR_HPMN     (0x1fU)
 
 /* Not all of the MDCR_EL3 bits are present in the 32-bit SDCR */
 #define SDCR_VALID_MASK (MDCR_EPMAD | MDCR_EDAD | MDCR_SPME | MDCR_SPD)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8158d33..5953980 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -904,10 +904,20 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
 /* Definitions for the PMU registers */
 #define PMCRN_MASK  0xf800
 #define PMCRN_SHIFT 11
+#define PMCRDP  0x10
 #define PMCRD   0x8
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
 static inline uint32_t pmu_num_counters(CPUARMState *env)
 {
   return (env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT;
@@ -1003,16 +1013,66 @@ static CPAccessResult pmreg_access_ccntr(CPUARMState *env,
     return pmreg_access(env, ri, isread);
 }
 
-static inline bool arm_ccnt_enabled(CPUARMState *env)
+/* Returns true if the counter (pass 31 for PMCCNTR) should count events using
+ * the current EL, security state, and register configuration.
+ */
+static inline bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
 {
-    /* This does not support checking PMCCFILTR_EL0 register */
+    uint64_t filter;
+    bool e, p, u, nsk, nsu, nsh, m;
+    bool enabled, prohibited, filtered;
+    bool secure = arm_is_secure(env);
+    int el = arm_current_el(env);
+    uint8_t hpmn = env->cp15.mdcr_el2 & MDCR_HPMN;
 
-    if (!(env->cp15.c9_pmcr & PMCRE) || !(env->cp15.c9_pmcnten & (1 << 31))) {
-        return false;
+    if (!arm_feature(env, ARM_FEATURE_EL2) ||
+            (counter < hpmn || counter == 31)) {
+        e = env->cp15.c9_pmcr & PMCRE;
+    } else {
+        e = env->cp15.mdcr_el2 & MDCR_HPME;
+    }
+    enabled = e && (env->cp15.c9_pmcnten & (1 << counter));
+
+    if (!secure) {
+        if (el == 2 && (counter < hpmn || counter == 31)) {
+            prohibited = env->cp15.mdcr_el2 & MDCR_HPMD;
+        } else {
+            prohibited = false;
+        }
+    } else {
+        prohibited = arm_feature(env, ARM_FEATURE_EL3) &&
+           (env->cp15.mdcr_el3 & MDCR_SPME);
     }
 
-    return true;
+    if (prohibited && counter == 31) {
+        prohibited = env->cp15.c9_pmcr & PMCRDP;
+    }
+
+    /* TODO Remove assert, set filter to correct PMEVTYPER */
+    assert(counter == 31);
+    filter = env->cp15.pmccfiltr_el0;
+
+    p   = filter & PMXEVTYPER_P;
+    u   = filter & PMXEVTYPER_U;
+    nsk = arm_feature(env, ARM_FEATURE_EL3) && (filter & PMXEVTYPER_NSK);
+    nsu = arm_feature(env, ARM_FEATURE_EL3) && (filter & PMXEVTYPER_NSU);
+    nsh = arm_feature(env, ARM_FEATURE_EL2) && (filter & PMXEVTYPER_NSH);
+    m   = arm_el_is_aa64(env, 1) &&
+              arm_feature(env, ARM_FEATURE_EL3) && (filter & PMXEVTYPER_M);
+
+    if (el == 0) {
+        filtered = secure ? u : u != nsu;
+    } else if (el == 1) {
+        filtered = secure ? p : p != nsk;
+    } else if (el == 2) {
+        filtered = !nsh;
+    } else { /* EL3 */
+        filtered = m != p;
+    }
+
+    return enabled && !prohibited && !filtered;
 }
+
 /*
  * Ensure c15_ccnt is the guest-visible count so that operations such as
  * enabling/disabling the counter or filtering, modifying the count itself,
@@ -1025,7 +1085,7 @@ void pmccntr_op_start(CPUARMState *env)
     cycles = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
                           ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
 
-    if (arm_ccnt_enabled(env)) {
+    if (pmu_counter_enabled(env, 31)) {
         uint64_t eff_cycles = cycles;
         if (env->cp15.c9_pmcr & PMCRD) {
             /* Increment once every 64 processor clock cycles */
@@ -1044,7 +1104,7 @@ void pmccntr_op_start(CPUARMState *env)
  */
 void pmccntr_op_finish(CPUARMState *env)
 {
-    if (arm_ccnt_enabled(env)) {
+    if (pmu_counter_enabled(env, 31)) {
         uint64_t prev_cycles = env->cp15.c15_ccnt_delta;
 
         if (env->cp15.c9_pmcr & PMCRD) {
@@ -1056,10 +1116,30 @@ void pmccntr_op_finish(CPUARMState *env)
     }
 }
 
+void pmu_op_start(CPUARMState *env)
+{
+    pmccntr_op_start(env);
+}
+
+void pmu_op_finish(CPUARMState *env)
+{
+    pmccntr_op_finish(env);
+}
+
+void pmu_pre_el_change(ARMCPU *cpu, void *ignored)
+{
+    pmu_op_start(&cpu->env);
+}
+
+void pmu_post_el_change(ARMCPU *cpu, void *ignored)
+{
+    pmu_op_finish(&cpu->env);
+}
+
 static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
-    pmccntr_op_start(env);
+    pmu_op_start(env);
 
     if (value & PMCRC) {
         /* The counter has been reset */
@@ -1070,7 +1150,7 @@ static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     env->cp15.c9_pmcr &= ~0x39;
     env->cp15.c9_pmcr |= (value & 0x39);
 
-    pmccntr_op_finish(env);
+    pmu_op_finish(env);
 }
 
 static uint64_t pmccntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -1119,6 +1199,22 @@ void pmccntr_op_finish(CPUARMState *env)
 {
 }
 
+void pmu_op_start(CPUARMState *env)
+{
+}
+
+void pmu_op_finish(CPUARMState *env)
+{
+}
+
+void pmu_pre_el_change(ARMCPU *cpu, void *ignored)
+{
+}
+
+void pmu_post_el_change(ARMCPU *cpu, void *ignored)
+{
+}
+
 #endif
 
 static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

