Received: by 10.28.91.67 with SMTP id p64csp1282351wmb;
        Fri, 16 Mar 2018 13:43:03 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtPoAIXesvR96NDxQ5g/x/qf2Hk6Z1ykozFVRwMkgHpQkrM8BOEe/HgD88xW9eEemKn6bo9
X-Received: by 10.55.168.206 with SMTP id r197mr4695940qke.311.1521232983672;
        Fri, 16 Mar 2018 13:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521232983; cv=none;
        d=google.com; s=arc-20160816;
        b=zEO6deo0jE4rGoCiP4yXvIwjRJfZaiK2zy9dp1+XlqXtUqJCl3XVixmVsc1xHBhVg9
         qliVqzdrDat0fRTrzn8gJ+rYxZ2aMwfm9byi7y6oRzfQgbD00ZEMp2WpGyAtIJU8HFmJ
         /TG4sr4ZFw4cW/Xra98R15uscOVDXcnrBRMmQJNwN1OuzH2WC21kHgF2OI+bm9IviRsp
         5uZj0Ox7nbLHpzXbEn03VUoZkEO/UmaW55woCj/8x0xtmAY/WMAobs782IcctOKl4q0C
         9F5g3N3uyOzF9z4nU6U3smOwH99mqWpVUkniFKP7DjH76sf45yNzTsBkxY+vLTs62w6n
         OgiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=bkSuI58qwKfkCFhX1rp8R8mjqo38YOLtUXNQbWIbVOA=;
        b=ygjFd33zZvj0vtfV4j83aJLxRlf7kMty4DjxLUH6xGF1USU03BXO+Seq35tXgR/D5E
         vGRFFKDVOIr7BKtRui96Zw1EC/T+QRjaujEsd8EPLVdovfY11btEBH9+78fW+F65s04m
         ECuwT9hyydM0OOgv+EtNh1f8zAtxJxxckWYlOcGqhiT6E8aSOiL2dWdOL+RInP/0lZAN
         De3CsINMGtqUMudiQvV7a03PLBlGrn+v8GtaKQjh7f6zjUqAAZeVp46N/GJ+c++AFhgU
         lX+TBk5ifyIkDCRe7TfD1sT6FGwlls+P23FZ9cHDQSpv/QU/75f0jE3Lt1K8foC7M2vQ
         aOkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=BwNiXTN0;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=m+OWEsfl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y28si7727313qtm.465.2018.03.16.13.43.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Mar 2018 13:43:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=BwNiXTN0;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=m+OWEsfl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59504 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ewwBr-0006jF-2p
	for alex.bennee@linaro.org; Fri, 16 Mar 2018 16:43:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1a-000625-Qs
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1Z-0003X3-Hh
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:26 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56492)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1eww1Z-0003Vf-6v; Fri, 16 Mar 2018 16:32:25 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id E4C9F60FF0; Fri, 16 Mar 2018 20:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232344;
	bh=yzoqbs4P5Iex9Ul3iVM12jHg/u0/AhPoLIV/ZWAuxic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BwNiXTN0bCsoqBnIxVkzJZSAKHFMHnTe/faaxGHciRFHUZcRk5IWL2KXLZ7IiLHtO
	oYgww4y/fxb1XR0GrPSUJUXI6G/Ae9/NClOkYY+euVbmh2wnYpywpLpmgSnSdnP1ba
	w6inr5VC95iGbQVXuR49crZ5KRQWp+3MALtOk6hA=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 9DE33607A2;
	Fri, 16 Mar 2018 20:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232340;
	bh=yzoqbs4P5Iex9Ul3iVM12jHg/u0/AhPoLIV/ZWAuxic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m+OWEsflL6/xK7AcOWqFvBi8I/5Zlst6Au/4joPOdXzz/wOVmg7De60JAT0UL99y6
	4o1P8YmOXNaqk0biGYegmNpeiaiHIY7ZsuT7FW+NetmMMJGvzGdSklHF61sC2Qv/Ob
	I/Tu9QcC+3FnKn8lPbcpw2GrQ7qVCu9M/qCOw1K4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9DE33607A2
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 16 Mar 2018 16:31:16 -0400
Message-Id: <1521232280-13089-19-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v3 18/22] target/arm: Add array for supported PMU
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
X-TUID: 9FZXvqS4QDik

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
index e544f1d..69d6a80 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -889,6 +889,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         unset_feature(env, ARM_FEATURE_PMU);
         cpu->id_aa64dfr0 &= ~0xf00;
     } else {
+        uint64_t pmceid = get_pmceid(&cpu->env);
+        cpu->pmceid0 = pmceid & 0xffffffff;
+        cpu->pmceid1 = (pmceid >> 32) & 0xffffffff;
+
         arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
         arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
     }
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index cc1e2fb..19f005d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -931,6 +931,16 @@ void pmu_op_finish(CPUARMState *env, uint64_t prev_cycles);
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
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2073d56..6a4f900 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -925,6 +925,43 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
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

