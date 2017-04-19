Received: by 10.25.0.144 with SMTP id 138csp380090lfa;
        Wed, 19 Apr 2017 10:48:05 -0700 (PDT)
X-Received: by 10.55.97.67 with SMTP id v64mr3545422qkb.241.1492624085891;
        Wed, 19 Apr 2017 10:48:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j14si3072923qtj.57.2017.04.19.10.48.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Apr 2017 10:48:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org;
       dkim=fail header.i=@codeaurora.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49645 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0ti1-0005Bw-9s
	for alex.bennee@linaro.org; Wed, 19 Apr 2017 13:48:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1d0tcA-0008Jr-1Z
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 13:42:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1d0tc6-0004Qp-VB
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 13:42:02 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37964)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1d0tc6-0004Q9-NL; Wed, 19 Apr 2017 13:41:58 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id D86A6610DB; Wed, 19 Apr 2017 17:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1492623717;
	bh=qzlOI4KsqbIoOUzvLEVRckt/vWdX5oUMMBZks/dg04o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bos8ZdxU/7uw6+nP6LpXysDnLInvoaf7pAbOlOFw1bRCQKphd8v8MpXRxjcjPwqe+
	x9Y/rUDmuPlHrhocQWxHCHpAK3rAMhbTpakG2DQ22Qti7/hppmsz2JUz7+xwAgOcJZ
	8yKnpzJ2yXaj+FhklG5ToYwd2aPc+UJWKvnHJ2Cs=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 8DE1F6110B;
	Wed, 19 Apr 2017 17:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1492623717;
	bh=qzlOI4KsqbIoOUzvLEVRckt/vWdX5oUMMBZks/dg04o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bos8ZdxU/7uw6+nP6LpXysDnLInvoaf7pAbOlOFw1bRCQKphd8v8MpXRxjcjPwqe+
	x9Y/rUDmuPlHrhocQWxHCHpAK3rAMhbTpakG2DQ22Qti7/hppmsz2JUz7+xwAgOcJZ
	8yKnpzJ2yXaj+FhklG5ToYwd2aPc+UJWKvnHJ2Cs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8DE1F6110B
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Date: Wed, 19 Apr 2017 13:41:22 -0400
Message-Id: <1492623684-25799-12-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
References: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH 11/13] target/arm: PMU: Add instruction and cycle
 events
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
X-TUID: BmqIVPXiuq7K

The instruction event is only enabled when icount is used, cycles are
always supported.

Note: Setting can_do_io=1 should not be done here. It is ugly and wrong,
but I am not sure of the proper way to handle this (See 'target/arm:
Filter cycle counter based on PMCCFILTR_EL0')

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 66e576a..5972984 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -14,6 +14,7 @@
 #include "arm_ldst.h"
 #include <zlib.h> /* For crc32 */
 #include "exec/semihost.h"
+#include "sysemu/cpus.h"
 #include "sysemu/kvm.h"
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
@@ -901,8 +902,53 @@ typedef struct pm_event {
     uint64_t (*get_count)(CPUARMState *);
 } pm_event;
 
+static bool event_always_supported(CPUARMState *env)
+{
+    return true;
+}
+
+static uint64_t cycles_get_count(CPUARMState *env)
+{
+    uint64_t ret;
+    CPUState *cpu = ENV_GET_CPU(env);
+    uint32_t saved_can_do_io = cpu->can_do_io;
+    cpu->can_do_io = 1;
+
+    ret = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                   ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
+
+    cpu->can_do_io = saved_can_do_io;
+    return ret;
+}
+
+static bool instructions_supported(CPUARMState *env)
+{
+    return use_icount == 1 /* Precise instruction counting */;
+}
+
+static uint64_t instructions_get_count(CPUARMState *env)
+{
+    uint64_t ret;
+    CPUState *cpu = ENV_GET_CPU(env);
+    uint32_t saved_can_do_io = cpu->can_do_io;
+    cpu->can_do_io = 1;
+
+    ret = (uint64_t)cpu_get_icount_raw();
+
+    cpu->can_do_io = saved_can_do_io;
+    return ret;
+}
+
 #define SUPPORTED_EVENT_SENTINEL UINT16_MAX
 static const pm_event pm_events[] = {
+    { .number = 0x008, /* INST_RETIRED */
+      .supported = instructions_supported,
+      .get_count = instructions_get_count
+    },
+    { .number = 0x011, /* CPU_CYCLES */
+      .supported = event_always_supported,
+      .get_count = cycles_get_count
+    },
     { .number = SUPPORTED_EVENT_SENTINEL }
 };
 static uint16_t supported_event_map[0x3f];
@@ -1087,8 +1133,7 @@ void pmccntr_sync(CPUARMState *env)
           !pmu_counter_filtered(env, env->cp15.pmccfiltr_el0)) {
         uint64_t temp_ticks;
 
-        temp_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-                              ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
+        temp_ticks = cycles_get_count(env);
 
         if (env->cp15.c9_pmcr & PMCRD) {
             /* Increment once every 64 processor clock cycles */
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

