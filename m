Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1479896wrt;
        Wed, 10 Oct 2018 13:40:03 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61vCoOgeFAeXteFSQz5Y1+HlavM8vJE70N/CvFGatAzYlJ4YVz/tiZFuPujPoMedQnvinsC
X-Received: by 2002:a05:6214:18d:: with SMTP id q13mr29598255qvr.51.1539204003214;
        Wed, 10 Oct 2018 13:40:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539204003; cv=none;
        d=google.com; s=arc-20160816;
        b=0vvcN1MBJwwKHWjGZSh3LWyMJeji3d9m1BbLDr8o2c6Ngn0b6sRwN/Pl3TtI0etRGy
         xouK3OKK5p6ZrE49ZJuDEyhWpBfm107YSbXj5QJjtAmDoETjCUWpfo55OlsweCSUvdYt
         EDHWn+MYa4smWVPKW+kVPYBy5tPnO5hv4RQ2IFhmmBc9ZVOLcSgAAnPp55NF2TFbNO6f
         Kl6rUg+aagSzyS4D/K59a93rFLXYFEaTW7rgV5Ua70QhERtMDubFxn2ZeOM1oxLT9FNS
         f/lPi6g1K15rpldRKGIy0v4gpCKKR2G9p6XXEqdDdBwdyyYHcvHxYSMkpxlcPG9oMhMz
         nLkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=C7A3VwZB/W6ludp/DL8ckfBITEtl4C3TThed+08i4Qg=;
        b=s3B8Opn+GWE2/Y8/6LI0nW35NfK9Va+y78fEVwTgepGAwBhdlSf+5Bx4vdd+Bs00bY
         g7ruT4w8lwQGaoHLKwuTwqR/KDJOBFjFeZTtS9jMi9irSiYq/OT++74K+k5iTS+iayFT
         CwwcNsIHk70xKrQAllijQ3BmOPLjMlxlEd3CmtGn6GSWXfKF3i4Y1Y/FPGISvg2btLB5
         iS19t+YBvT7JpiP2R3PA/pJ5f6PrCag4ZlCBLx2svCXlJ82Q4U0id3M0E7EzmcH/Mtf+
         bsoZjXaFhv6y4mgqPGmRmQK6djKC7robhaYqavugn80h8+W2AUGOc0NrEtwnK60CgiCl
         lFYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WA75ZxfG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k89-v6si5155057qva.134.2018.10.10.13.40.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 13:40:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WA75ZxfG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59033 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gALH0-0003n0-N2
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 16:40:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFZ-0002or-5H
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 16:38:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFW-0002Pw-9H
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 16:38:33 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:36847)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1gALFW-0002P8-0X; Wed, 10 Oct 2018 16:38:30 -0400
Received: by mail-yb1-xb44.google.com with SMTP id 5-v6so2765714ybf.3;
	Wed, 10 Oct 2018 13:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=C7A3VwZB/W6ludp/DL8ckfBITEtl4C3TThed+08i4Qg=;
	b=WA75ZxfGmBBd5VaK6KskJGwZnlByO0TlUTIiUolAZE+DvZ+Ijsr/yxTOIpbs3Wc5HQ
	3CKLnr5k+55FLKXpzXOF+MSonIK8HWmnGhXCaeYsMr2wci1yYU/dwwZswhsrD8rSluhF
	NcCTx5XqtZurcVujXqRAY3XRTDgLK4JZIkZNK6Od4mLt06wYgQmevN1W4zzqgP5PlpkX
	ClywRIdzOElJviiuwKP+EiA53V9Ds2Dwe6WRtNUNpCmqvAQrGU7U/MXT/+kWAXCK91Vr
	3YFQhnv9kD/4M2JNzUwy/+e8X9nJpgkEMTgVpEgucv5zTpZYPTQwsXm4Nh38lr0JXMO+
	8eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=C7A3VwZB/W6ludp/DL8ckfBITEtl4C3TThed+08i4Qg=;
	b=Qh8QIa0AHmzU+SU78o3USBX7tJclVdpvrwLsCAhPgv1L2rcMko9UxEoFvJUMpwzjT0
	3iJjtKCmHbpPm72sxjXxX2/RBIXB4CDpI2p0JRZRCh1u5rV4XUD9v1RZJGRp349KECM3
	LnzJjWcNBeIyCVQY5hDk+JQDr2oM2NNbMhsmHmBf3QR+14MQydqywT3Re6zbnEplff5h
	hSSPTnO7pj8n+AjFAIxaJP4AJjLi7uUBfu9pZdTqm0DYIyf14eMOxtM50IetB9t4v192
	CQc2E5MKj68FrO6ZyemA628fYeFK97ROeZ0e4ZhnTAxsT0xk3gByqH7dMLFImCnrRRFY
	WKtw==
X-Gm-Message-State: ABuFfoipEi/PwX2lvwl2h0HcaPe8L2WN86DUrJWtkbDg6BrNraWLnBJ/
	f9X6PzngH/S0l0KQgK+gdMBEd2wE
X-Received: by 2002:a25:6d55:: with SMTP id
	i82-v6mr19314287ybc.419.1539203909092; 
	Wed, 10 Oct 2018 13:38:29 -0700 (PDT)
Received: from quinoa.localdomain ([216.85.170.153])
	by smtp.gmail.com with ESMTPSA id
	u131-v6sm15170728ywf.13.2018.10.10.13.38.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 13:38:28 -0700 (PDT)
From: Aaron Lindsay <aclindsa@gmail.com>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 10 Oct 2018 16:37:27 -0400
Message-Id: <20181010203735.27918-7-aclindsa@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181010203735.27918-1-aclindsa@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::b44
Subject: [Qemu-arm] [PATCH v6 06/14] target/arm: Filter cycle counter based
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>, Aaron Lindsay <aclindsa@gmail.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /y9OAPOXil6W

The pmu_counter_enabled and pmu_op_start/finish functions are generic
(as opposed to PMCCNTR-specific) to allow for the implementation of
other events.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c     |   3 ++
 target/arm/cpu.h     |  22 +++++++-
 target/arm/helper.c  | 118 +++++++++++++++++++++++++++++++++++++++----
 target/arm/machine.c |   8 +--
 4 files changed, 137 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b5e61cc177..f69addb961 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -948,6 +948,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     if (!cpu->has_pmu) {
         unset_feature(env, ARM_FEATURE_PMU);
         cpu->id_aa64dfr0 &= ~0xf00;
+    } else if (!kvm_enabled()) {
+        arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
+        arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
     }
 
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index fdf672ca22..d9cd8dd92c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -957,6 +957,24 @@ int cpu_arm_signal_handler(int host_signum, void *pinfo,
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
@@ -1018,7 +1036,8 @@ void pmccntr_op_finish(CPUARMState *env);
 
 #define MDCR_EPMAD    (1U << 21)
 #define MDCR_EDAD     (1U << 20)
-#define MDCR_SPME     (1U << 17)
+#define MDCR_SPME     (1U << 17)  /* MDCR_EL3 */
+#define MDCR_HPMD     (1U << 17)  /* MDCR_EL2 */
 #define MDCR_SDD      (1U << 16)
 #define MDCR_SPD      (3U << 14)
 #define MDCR_TDRA     (1U << 11)
@@ -1028,6 +1047,7 @@ void pmccntr_op_finish(CPUARMState *env);
 #define MDCR_HPME     (1U << 7)
 #define MDCR_TPM      (1U << 6)
 #define MDCR_TPMCR    (1U << 5)
+#define MDCR_HPMN     (0x1fU)
 
 /* Not all of the MDCR_EL3 bits are present in the 32-bit SDCR */
 #define SDCR_VALID_MASK (MDCR_EPMAD | MDCR_EDAD | MDCR_SPME | MDCR_SPD)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 91e4e4170b..52bd13fdde 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -943,10 +943,24 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
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
+#define PMXEVTYPER_EVTCOUNT   0x0000ffff
+#define PMXEVTYPER_MASK       (PMXEVTYPER_P | PMXEVTYPER_U | PMXEVTYPER_NSK | \
+                               PMXEVTYPER_NSU | PMXEVTYPER_NSH | \
+                               PMXEVTYPER_M | PMXEVTYPER_MT | \
+                               PMXEVTYPER_EVTCOUNT)
+
 static inline uint32_t pmu_num_counters(CPUARMState *env)
 {
   return (env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT;
@@ -1042,16 +1056,66 @@ static CPAccessResult pmreg_access_ccntr(CPUARMState *env,
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
     }
+    enabled = e && (env->cp15.c9_pmcnten & (1 << counter));
 
-    return true;
+    if (!secure) {
+        if (el == 2 && (counter < hpmn || counter == 31)) {
+            prohibited = env->cp15.mdcr_el2 & MDCR_HPMD;
+        } else {
+            prohibited = false;
+        }
+    } else {
+        prohibited = arm_feature(env, ARM_FEATURE_EL3) &&
+           (env->cp15.mdcr_el3 & MDCR_SPME);
+    }
+
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
@@ -1064,7 +1128,7 @@ void pmccntr_op_start(CPUARMState *env)
     cycles = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
                           ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
 
-    if (arm_ccnt_enabled(env)) {
+    if (pmu_counter_enabled(env, 31)) {
         uint64_t eff_cycles = cycles;
         if (env->cp15.c9_pmcr & PMCRD) {
             /* Increment once every 64 processor clock cycles */
@@ -1083,7 +1147,7 @@ void pmccntr_op_start(CPUARMState *env)
  */
 void pmccntr_op_finish(CPUARMState *env)
 {
-    if (arm_ccnt_enabled(env)) {
+    if (pmu_counter_enabled(env, 31)) {
         uint64_t prev_cycles = env->cp15.c15_ccnt_delta;
 
         if (env->cp15.c9_pmcr & PMCRD) {
@@ -1095,10 +1159,30 @@ void pmccntr_op_finish(CPUARMState *env)
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
@@ -1109,7 +1193,7 @@ static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     env->cp15.c9_pmcr &= ~0x39;
     env->cp15.c9_pmcr |= (value & 0x39);
 
-    pmccntr_op_finish(env);
+    pmu_op_finish(env);
 }
 
 static uint64_t pmccntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -1158,6 +1242,22 @@ void pmccntr_op_finish(CPUARMState *env)
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
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 581c44cf08..bb9e47f602 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -584,7 +584,7 @@ static int cpu_pre_save(void *opaque)
 {
     ARMCPU *cpu = opaque;
 
-    pmccntr_op_start(&cpu->env);
+    pmu_op_start(&cpu->env);
 
     if (kvm_enabled()) {
         if (!write_kvmstate_to_list(cpu)) {
@@ -610,13 +610,13 @@ static int cpu_pre_save(void *opaque)
 static void cpu_post_save(void *opaque)
 {
     ARMCPU *cpu = opaque;
-    pmccntr_op_finish(&cpu->env);
+    pmu_op_finish(&cpu->env);
 }
 
 static int cpu_pre_load(void *opaque)
 {
     ARMCPU *cpu = opaque;
-    pmccntr_op_start(&cpu->env);
+    pmu_op_start(&cpu->env);
     return 0;
 }
 
@@ -667,7 +667,7 @@ static int cpu_post_load(void *opaque, int version_id)
     hw_breakpoint_update_all(cpu);
     hw_watchpoint_update_all(cpu);
 
-    pmccntr_op_finish(&cpu->env);
+    pmu_op_finish(&cpu->env);
 
     return 0;
 }
-- 
2.19.1

