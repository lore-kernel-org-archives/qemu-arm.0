Received: by 10.28.4.212 with SMTP id 203csp4254646wme;
        Tue, 17 Apr 2018 13:44:55 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49NvjKlNru3gewfAyfKMVBpgBZ8pcLULfqddJFCmpo+/ql/lGdPcq/7dHmUXEoAlCWER5kC
X-Received: by 10.55.20.36 with SMTP id e36mr3587363qkh.315.1523997895285;
        Tue, 17 Apr 2018 13:44:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523997895; cv=none;
        d=google.com; s=arc-20160816;
        b=eiRV+NdeM2L8FfeC1UWVlmSgKUU2g4shIWvq01LvmC2C2pEDqQdqEg9teeavpwPp+u
         pYlvt3CytgF/130cXKz+rpdxI/sB72Seu6/aOG2u/ZRfDFnyP+APNeLuR9LdpyG8llIt
         VMXZ1RP4OTNmVLwMXu/wGoPBeA1+UGvDRRjnghUkltOaNrbtrZ7BlNo0X2mACNKIaP8f
         X1TBQNeHbW1rn16umV2EP/qqSxe3byGz6mAEkDv1Z6+aCBXu5/fG5QJKPiXKaCcensDw
         6N0jTroy9Up2bT2P92jZX/vI0XANHH5WjwlLTQDEolp58dJf+g9KuEOk+3+DElZmS1Wl
         bp0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=xAzv3LgbIDZvp5tntBDxNb+jJ/fQoEeCrBzfNK9TWj4=;
        b=CVnk8cnVJHqfkLdYFd4sUfl4rqdeTwcnkDmaixPPXzyN2+jbOBEEkMR0OcfaDtnTi8
         ytN/MHq5tBl8K99U33/k2Bpg+k+/yue3M9okmtDmU31OKJXpUIvevHY15yEr/Fpmp+E9
         azfmi/5fZQ90b4EuSGCjeFEuMmrY1qFlV8QZTGa6eFar1KhO0Zs4TDWaMUbSYHdqkcMs
         Q8Qw06PPfj2AmSeUzHIZiqqkJUw9VX0iqnee2Mwqm/lW5wivSAKndFlgFFHfL43ZeM2J
         XxgHJE0DeH20vlVrV3UqLdGIpE1h4WMI0k4W45Z1eMtPnoyFW/V4W+gpTArbsFPPkN6j
         BDnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=A5zyQzm2;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=iX4aIJGv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y24si3650385qtm.252.2018.04.17.13.44.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 13:44:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=A5zyQzm2;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=iX4aIJGv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33350 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8XTC-0007mi-NG
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 16:44:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNj-000397-NC
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNg-0006vz-Qx
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:15 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:40318)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8XNg-0006lH-DQ; Tue, 17 Apr 2018 16:39:12 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id D066760FF7; Tue, 17 Apr 2018 20:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997551;
	bh=eQywwxTT5EzOjtfw9UAXBucHrz+66tDEx61Jdc+4vqI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A5zyQzm2gQ6jlMqO1sB2kRmnebmBc4dtpU9Dl4+EOKRUAs1h5+RpFUKZCUzPJ89ap
	NtU8Nw4lm5Eic97I1g8PBgfT4DzXv+4UBKZZaU9YYMYAFmymL3yB2CTSwqlceiMXYD
	8Ojn5jOQwILdhSxx8wN99BBFXTMnzgNNQlbEnE68=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 18AFF60F74;
	Tue, 17 Apr 2018 20:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997544;
	bh=eQywwxTT5EzOjtfw9UAXBucHrz+66tDEx61Jdc+4vqI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iX4aIJGv1dQ6AeKpHwTCPomEs18aObx1VvsR56GJR1er7KFhe//im1Sgj6aJUMMP5
	09X3olYsy9bL0IQIy/JnlefYg+ff19oqcro9qfeJ61qJlU4sMKwZwfIn/wlAEG1UMU
	0kYB+M0Mi4ZkbMV5cMH4BmApWOTe3OtcrwZhxo8w=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 18AFF60F74
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 17 Apr 2018 16:37:59 -0400
Message-Id: <1523997485-1905-16-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v4 15/21] target/arm: Add array for supported PMU
 events, generate PMCEID[01]
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
X-TUID: z9d8alLZI6fy

This commit doesn't add any supported events, but provides the framework
for adding them. We store the pm_event structs in a simple array, and
provide the mapping from the event numbers to array indexes in the
supported_event_map array. Because the value of PMCEID[01] depends upon
which events are supported at runtime, generate it dynamically.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.c    | 20 +++++++++++++-------
 target/arm/cpu.h    | 10 ++++++++++
 target/arm/cpu64.c  |  2 --
 target/arm/helper.c | 37 +++++++++++++++++++++++++++++++++++++
 4 files changed, 60 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9d27ffc..22063ca 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -897,9 +897,19 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     if (!cpu->has_pmu) {
         unset_feature(env, ARM_FEATURE_PMU);
         cpu->id_aa64dfr0 &= ~0xf00;
-    } else if (!kvm_enabled()) {
-        arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
-        arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
+    }
+    if (arm_feature(env, ARM_FEATURE_PMU)) {
+        uint64_t pmceid = get_pmceid(&cpu->env);
+        cpu->pmceid0 = pmceid & 0xffffffff;
+        cpu->pmceid1 = (pmceid >> 32) & 0xffffffff;
+
+        if (!kvm_enabled()) {
+            arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
+            arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
+        }
+    } else {
+        cpu->pmceid0 = 0x00000000;
+        cpu->pmceid1 = 0x00000000;
     }
 
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
@@ -1511,8 +1521,6 @@ static void cortex_a7_initfn(Object *obj)
     cpu->id_pfr0 = 0x00001131;
     cpu->id_pfr1 = 0x00011011;
     cpu->id_dfr0 = 0x02010555;
-    cpu->pmceid0 = 0x00000000;
-    cpu->pmceid1 = 0x00000000;
     cpu->id_afr0 = 0x00000000;
     cpu->id_mmfr0 = 0x10101105;
     cpu->id_mmfr1 = 0x40000000;
@@ -1557,8 +1565,6 @@ static void cortex_a15_initfn(Object *obj)
     cpu->id_pfr0 = 0x00001131;
     cpu->id_pfr1 = 0x00011011;
     cpu->id_dfr0 = 0x02010555;
-    cpu->pmceid0 = 0x0000000;
-    cpu->pmceid1 = 0x00000000;
     cpu->id_afr0 = 0x00000000;
     cpu->id_mmfr0 = 0x10201105;
     cpu->id_mmfr1 = 0x20000000;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 132e08d..f058f5c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -935,6 +935,16 @@ void pmu_op_finish(CPUARMState *env);
 void pmu_pre_el_change(ARMCPU *cpu, void *ignored);
 void pmu_post_el_change(ARMCPU *cpu, void *ignored);
 
+/*
+ * get_pmceid
+ * @env: CPUARMState
+ *
+ * Return the PMCEID[01] register values corresponding to the counters which
+ * are supported given the current configuration (0 is low 32, 1 is high 32
+ * bits)
+ */
+uint64_t get_pmceid(CPUARMState *env);
+
 /* SCTLR bit meanings. Several bits have been reused in newer
  * versions of the architecture; in that case we define constants
  * for both old and new bit meanings. Code which tests against those
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 991d764..7da0ea4 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -141,8 +141,6 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->id_isar5 = 0x00011121;
     cpu->id_aa64pfr0 = 0x00002222;
     cpu->id_aa64dfr0 = 0x10305106;
-    cpu->pmceid0 = 0x00000000;
-    cpu->pmceid1 = 0x00000000;
     cpu->id_aa64isar0 = 0x00011120;
     cpu->id_aa64mmfr0 = 0x00001124;
     cpu->dbgdidr = 0x3516d000;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 572709e..7a715a6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -933,6 +933,43 @@ static inline uint64_t pmu_counter_mask(CPUARMState *env)
   return (1 << 31) | ((1 << pmu_num_counters(env)) - 1);
 }
 
+typedef struct pm_event {
+    uint16_t number; /* PMEVTYPER.evtCount is 10 bits wide */
+    /* If the event is supported on this CPU (used to generate PMCEID[01]) */
+    bool (*supported)(CPUARMState *);
+    /* Retrieve the current count of the underlying event. The programmed
+     * counters hold a difference from the return value from this function */
+    uint64_t (*get_count)(CPUARMState *);
+} pm_event;
+
+#define SUPPORTED_EVENT_SENTINEL UINT16_MAX
+static const pm_event pm_events[] = {
+    { .number = SUPPORTED_EVENT_SENTINEL }
+};
+static uint16_t supported_event_map[0x3f];
+
+/*
+ * Called upon initialization to build PMCEID0 (low 32 bits) and PMCEID1 (high
+ * 32). We also use it to build a map of ARM event numbers to indices in
+ * our pm_events array.
+ */
+uint64_t get_pmceid(CPUARMState *env)
+{
+    uint64_t pmceid = 0;
+    unsigned int i = 0;
+    while (pm_events[i].number != SUPPORTED_EVENT_SENTINEL) {
+        const pm_event *cnt = &pm_events[i];
+        if (cnt->number < 0x3f && cnt->supported(env)) {
+            pmceid |= (1 << cnt->number);
+            supported_event_map[cnt->number] = i;
+        } else {
+            supported_event_map[cnt->number] = SUPPORTED_EVENT_SENTINEL;
+        }
+        i++;
+    }
+    return pmceid;
+}
+
 static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

