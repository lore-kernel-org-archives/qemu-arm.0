Received: by 10.223.197.9 with SMTP id q9csp1230452wrf;
        Fri, 29 Sep 2017 19:14:34 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAkPAslIXzYLCYPKKtSbfZzAUIWps64v/m77nJJf26AoSSOvEEWHbvSDORlJi7y0V5GSlZO
X-Received: by 10.55.99.88 with SMTP id x85mr6213274qkb.258.1506737674260;
        Fri, 29 Sep 2017 19:14:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506737674; cv=none;
        d=google.com; s=arc-20160816;
        b=YlM2qJiQAv63PgvF+w53XP4eatMFuBm/a+MQ4cZPX2Vkf258fcwK0926IqHFHo4CY8
         lrdmo5rHCiWwTuxOxo8PEGXTW5dQNWUURL1X7okQzxoRwHOikHMemyrcETrMnJaVoPUp
         ZBw+bA0pF5ZIbaetXErMZPl9hnsaRRvLKb9iJQfztDponSVmBsUP376nMVr5Nsf4gS/e
         gExIrscGGrGRg4+ApLGGEkkw+0FoPmUXYrqOSHc6+B/5E+b4NwbUG0s98ghS+PjnNDgZ
         ylzgsg21EPQcBwpEhH/5CduvUdrcf/6txovaGDIvk81PppEgbeDRjCf0kmE93wnYU7g6
         dpIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=qOsgKCDETRMlpVQZTqc1+Yz76S4PAV5CY3zh2ARIi78=;
        b=yP9Ro2Or6U7iYXJ34z6PIZg+ZfF80KUJC1CvIRLTVD/A0SqxsEneEwtyXKgekxXFB8
         j+0chVM6+qbcsvhM66J2S0KH7ergdvv+rD4X3Jo3HPjzmuyM24TxNO8jg/PAT0Arv/YY
         NJyTqd/ieZR2fdAZsgPaU4xtLd7p2D6ZaEBYyUKMIwk4Yv9ynegs+0o8qlojsx//5rol
         mrNytdEWYrJYIrHqxbqniNfW4/8BlLGyvyDBnXcU+Te78JXWFh1vwbvkWacfJpeiFELm
         AftNT8tVQIVE775oK5zHu+guLYKOVkxwsCc79A1KHb6jUwfHXtlVHlg6YaOpsszQkrKi
         H4yA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=C5InAgrV;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=nSWJPszD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@gnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v24si211514qta.190.2017.09.29.19.14.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Sep 2017 19:14:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=C5InAgrV;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=nSWJPszD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@gnu.org
Received: from localhost ([::1]:37811 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dy7IV-0006n2-RE
	for alex.bennee@linaro.org; Fri, 29 Sep 2017 22:14:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7Dh-0002Yo-NX
	for qemu-devel@nongnu.org; Fri, 29 Sep 2017 22:09:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7Dg-0005IE-OV
	for qemu-devel@nongnu.org; Fri, 29 Sep 2017 22:09:33 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35452)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1dy7De-0005ES-70; Fri, 29 Sep 2017 22:09:30 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 7623D60CF5; Sat, 30 Sep 2017 02:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737369;
	bh=q1keS8gMefD3Ejl0xVqjTj1sJ+VxXFegI2OrKyReRCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C5InAgrVXnrv4zMrIDuBkKhS8uAAl8n7OP8Btp/OPm847c7v4iKIHrN73+mVbVrDb
	GHaW89a90Zyi/6ax0AXmAKj7jyDrd14FG5aRUg4EADea3l7dwEnRB7nT0HP/PAmdXk
	eeHDghDz1yiM2KlQJgTQcIjggjGXkPLZuiZys7ic=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 992BF6095F;
	Sat, 30 Sep 2017 02:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737368;
	bh=q1keS8gMefD3Ejl0xVqjTj1sJ+VxXFegI2OrKyReRCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nSWJPszDX8Q0vURMQP5bFHekZbnZXMZqS5Sy09vGRgGZjvCX+0jzS96WdtMrLbIA8
	zqiofrC7LRWul7MbH23aQYfdMg5h8ujit4cTXJK3WNfZRZs6NNlUzp0JtTMqBgs1k4
	33mqV42Ow8WtNJFNfWlQ+0s2/sYj8yNTj5jTJugY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 992BF6095F
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Wei Huang <wei@redhat.com>
Date: Fri, 29 Sep 2017 22:08:26 -0400
Message-Id: <1506737310-21880-10-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-devel] [PATCH 09/13] target/arm: Add array for supported PMU
 events, generate PMCEID[01]
X-BeenThere: qemu-devel@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@gnu.org>
List-Help: <mailto:qemu-devel-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@gnu.org?subject=subscribe>
Cc: Michael Spradling <mspradli@codeaurora.org>, qemu-devel@nongnu.org,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@gnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@gnu.org>
X-TUID: f76hSQh7zBA2

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
index dfadaad..da14864 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -830,6 +830,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     if (!cpu->has_pmu) {
         unset_feature(env, ARM_FEATURE_PMU);
         cpu->id_aa64dfr0 &= ~0xf00;
+    } else {
+        uint64_t pmceid = get_pmceid(&cpu->env);
+        cpu->pmceid0 = pmceid & 0xffffffff;
+        cpu->pmceid1 = (pmceid >> 32) & 0xffffffff;
     }
 
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 365a809..9feb45a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -835,6 +835,16 @@ void pmccntr_sync(CPUARMState *env);
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
index c0ef367..a56e7b4 100644
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
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.\nQualcomm Technologies, Inc. is a member of the\nCode Aurora Forum, a Linux Foundation Collaborative Project.

