Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1252514wrq;
        Fri, 22 Jun 2018 13:37:56 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf1c16rYS0aXWd4VYQvsEv26bSOb6tFo14fQG3LCNJt7xCwt628kPTXAeVTrDhK3P1wJ5Tw
X-Received: by 2002:a37:7886:: with SMTP id t128-v6mr2714176qkc.367.1529699876612;
        Fri, 22 Jun 2018 13:37:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529699876; cv=none;
        d=google.com; s=arc-20160816;
        b=Ctux+ICpgh/Dlv/0gQ53e9mp2iofDZuUihqOSGpVzlNcu06a6dzKeCNn92hji5Ed3B
         6MCi/xJokW8ce4G0Big+XqKKXAPr/QsOgM30GLSfNQIr7qcO/b2IbInrZ0S1Z2SD58B8
         Vi4ja82yCrWm3pbya6Z4Mj1xPCBfuRdUWHXg5ysSgYySbLYIu6VuORlm9XbB4c8VhCJM
         zWn9gekAZVLH9phtU/uhRETX6MQZG6zRFAeVWNrc9WomWUj7MQzz/9TSBjNGKu3g3KOm
         RMfX0IVyPxo56YhrWeI8pbOb/PYxafWvoYUDVqFGGjtJDtUef0LHio9KZncRpPSm5QAi
         cr8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=fycPr+xdH652n/xVT8HmwFVOsZOMevSr4Yfg4J9jk9M=;
        b=D+qAcr5Uq6cKFQS3J9Rz6mAOGZzmDcQ3ifyPVDkmWDqGysF4VvxGCQ+A3JBEVE8Cl+
         XXFW/ozYRalUFBuqIh9S4qW3y+g9LBNoW2KIz87EC+W73G6RkZr40yeMDe1dFjY9HqXW
         DyLSMc3V5mHtqbM7W8pK1CvwznaqDgEuZUGiUobw8wneCSD1iyXM0lTzRfDSdY8FdU+/
         Kn9RDzzciUC98TAmuv8loLIEiyjLM0llN8jHd51bvQ4RWC4eBmcHUeni47sx1noJTv7q
         7KOEu6cF5VreKu41vsB06xmlblS6Zz7tJQSWg5HRYR3QKOtQLfv7btNYrjbGUm+1+AVU
         wgDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=F1fM8qNx;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=m7XTMDyR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q8-v6si329755qve.143.2018.06.22.13.37.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 13:37:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=F1fM8qNx;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=m7XTMDyR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36101 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWSoe-00063q-44
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 16:37:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSji-0002GW-0o
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 16:32:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSjg-0005Ui-NM
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 16:32:49 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45596)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1fWSjc-0005SM-I7; Fri, 22 Jun 2018 16:32:44 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id A73F7606FA; Fri, 22 Jun 2018 20:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699563;
	bh=FXb5Dui6GrdQJvFiV6FFqxpbehVwS4Gp9/FKTinrZuA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F1fM8qNxxjOwYLO34TySbUboQE4eW/Y86kvYomgagoZ17lT76fsWAdu1njOGvxJij
	Nyg5ucYgknXzQnKr52rXqrXTNOVEyrnlVJRuVwCIjzcVc56YMT9X4mlucDtnhN8bKj
	mQfqy8KEsqiU+xx9P69cUWkYHtLFdQtbqNbOVTtY=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id CB09F60B18;
	Fri, 22 Jun 2018 20:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699562;
	bh=FXb5Dui6GrdQJvFiV6FFqxpbehVwS4Gp9/FKTinrZuA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m7XTMDyRFUY88IfJr8/G2hF+6wY9ogX7WnwhT0CJzHojoNKgFRNnTR+9xkEs9xZaB
	gKWgbQpBwZyJfaxY2rqRBuvGJhDhOagV2dqE1B7WJ9TRSc/7CFXgq05RcVuNwLs74s
	hftEqRNlojQRKzyUfYSE5c6WM/txVW2GGhnUTnRY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CB09F60B18
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 22 Jun 2018 16:32:21 -0400
Message-Id: <1529699547-17044-8-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-devel] [PATCH v5 07/13] target/arm: Add array for supported
 PMU events, generate PMCEID[01]
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aaron Lindsay <aclindsa@gmail.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IdnxlhrfVtJn

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
index 98790b1..2f5b16a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -927,9 +927,19 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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
@@ -1538,8 +1548,6 @@ static void cortex_a7_initfn(Object *obj)
     cpu->id_pfr0 = 0x00001131;
     cpu->id_pfr1 = 0x00011011;
     cpu->id_dfr0 = 0x02010555;
-    cpu->pmceid0 = 0x00000000;
-    cpu->pmceid1 = 0x00000000;
     cpu->id_afr0 = 0x00000000;
     cpu->id_mmfr0 = 0x10101105;
     cpu->id_mmfr1 = 0x40000000;
@@ -1581,8 +1589,6 @@ static void cortex_a15_initfn(Object *obj)
     cpu->id_pfr0 = 0x00001131;
     cpu->id_pfr1 = 0x00011011;
     cpu->id_dfr0 = 0x02010555;
-    cpu->pmceid0 = 0x0000000;
-    cpu->pmceid1 = 0x00000000;
     cpu->id_afr0 = 0x00000000;
     cpu->id_mmfr0 = 0x10201105;
     cpu->id_mmfr1 = 0x20000000;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 852743b..430b8d5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -964,6 +964,16 @@ void pmu_op_finish(CPUARMState *env);
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
index c50dcd4..28482a0 100644
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
index 5d83446..9f81747 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -964,6 +964,43 @@ static inline uint64_t pmu_counter_mask(CPUARMState *env)
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

