Received: by 10.25.0.144 with SMTP id 138csp379823lfa;
        Wed, 19 Apr 2017 10:47:14 -0700 (PDT)
X-Received: by 10.237.40.2 with SMTP id r2mr4207334qtd.173.1492624034826;
        Wed, 19 Apr 2017 10:47:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m25si1518449qkh.133.2017.04.19.10.47.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Apr 2017 10:47:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org;
       dkim=fail header.i=@codeaurora.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49639 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0thC-0004U6-5O
	for alex.bennee@linaro.org; Wed, 19 Apr 2017 13:47:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1d0tc6-0008Ee-Ah
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 13:41:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1d0tc4-0004PT-Vp
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 13:41:58 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37842)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1d0tc4-0004P3-Np; Wed, 19 Apr 2017 13:41:56 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id DD146610DB; Wed, 19 Apr 2017 17:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1492623715;
	bh=OTbX9A7wytE4wdwL05+NR5tWAO1elhLdDEHA/I2z1y4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ogwq6Rwm5mDk3OujlwrieV4/DkAgGKOyGVumWPL0FUC/ipvu3XJ80ehthDaXySP3C
	WR9mS/9WDAddk+AZhhsEIPJi3ID7Uj5VZK0cW6rBxtKHpf2ktVPxLzbYI/SY+fA5QF
	3t++b1ThfpMoUT7TB5rb60XlHT4R03ih9tJGb5SE=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id D2C9D610D4;
	Wed, 19 Apr 2017 17:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1492623715;
	bh=OTbX9A7wytE4wdwL05+NR5tWAO1elhLdDEHA/I2z1y4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ogwq6Rwm5mDk3OujlwrieV4/DkAgGKOyGVumWPL0FUC/ipvu3XJ80ehthDaXySP3C
	WR9mS/9WDAddk+AZhhsEIPJi3ID7Uj5VZK0cW6rBxtKHpf2ktVPxLzbYI/SY+fA5QF
	3t++b1ThfpMoUT7TB5rb60XlHT4R03ih9tJGb5SE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D2C9D610D4
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Date: Wed, 19 Apr 2017 13:41:20 -0400
Message-Id: <1492623684-25799-10-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
References: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH 09/13] target/arm: Add array for supported PMU
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>, mspradli@codeaurora.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: shb4yRzAhe08

This commit doesn't add any supported events, but provides the framework
for adding them. We store the pm_event structs in a simple array, and
provide the mapping from the event numbers to array indexes in
the supported_event_map array.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.c    |  4 ++++
 target/arm/cpu.h    | 10 ++++++++++
 target/arm/helper.c | 37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 44c965c..d61ea12 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -788,6 +788,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     if (!cpu->has_pmu) {
         cpu->has_pmu = false;
         unset_feature(env, ARM_FEATURE_PMU);
+    } else {
+        uint64_t pmceid = get_pmceid(&cpu->env);
+        cpu->pmceid0 = pmceid & 0xffffffff;
+        cpu->pmceid1 = (pmceid >> 32) & 0xffffffff;
     }
 
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f3524f6..57ca684 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -780,6 +780,16 @@ void pmccntr_sync(CPUARMState *env);
  */
 void pmu_sync(CPUARMState *env);
 
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
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5d07f72..a0ae201 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -891,6 +891,43 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
 /* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
 #define PMU_COUNTER_MASK(env) ((1 << 31) | ((1 << PMU_NUM_COUNTERS(env)) - 1))
 
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

