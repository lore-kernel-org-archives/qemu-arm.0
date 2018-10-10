Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1483975wrt;
        Wed, 10 Oct 2018 13:44:20 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63WuRhIHYMflam+XX/ToImxLsq0H1EG+FQwL3iTDnbxLxeZVe0Rzvd/A85MkzOaV+CLhEmp
X-Received: by 2002:a37:f8f:: with SMTP id 15-v6mr28289526qkp.300.1539204259985;
        Wed, 10 Oct 2018 13:44:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539204259; cv=none;
        d=google.com; s=arc-20160816;
        b=vONQSfWIK/RwQkk4/+oAPheSH+K/ROkegdVp8KCpzcjBE4hZVn49nW+tiigZilRqX/
         QWUrGxKkUfHmNMeOV4WLP95atgONSjxvBZES3tvOfqmvIj+JaqYZSTNBFh59B0jDFmGs
         0ORbUl3qqy0F97xEvI2MGzEWBrdPHBrwAb+gnm0/hp6H+wYNAIJLkSl6IZlo007dazIl
         L7Ur4nsM2HUXWlb7jzirc2OgNWT8GftsSvJiUFQfe+8XVeehu8amLavoHz9G9cwDX2Zc
         YzhILjbayU1tMTS0Kw/yLZooofLVmq2ZCvRWBL+aZ7YK8YHOzZ8wXeNzdsE0SQrthkCK
         VD4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=XSKOUQl9vmYg3HcpyWFwjAi/QFJzce6gGYliyVcFznE=;
        b=VR+zzxxB9Q2Njqc+QIUhbU3/UVJq1E+JqUQXjAN0t6ArQhCwVm7JW9KDG8SzvMO0pZ
         Rq1+ZzDamJ/LTiicBgNrNPy8QNqMyuO+R7oaFp97M4cjoA+cqPIgDoq+9SXQa7wUAEeB
         w7HjCbeWH7zV7hZIVxUU39yPhfVKnL12yaDPlsG09Zi5n837laXtwRazsRy0rmlGrHJl
         O8WKSnHOe8dxvnmvgJLwN1pykTugwFpSa1D2UTG4n5u/a3W4F0oGkksZxbDOJiltOfTl
         e1qrbNIxQ2lkp3xQoqCK8YD/hbA1AFo9SX/p/KCBsHBEicQEWaVaHQQreza819sjHn6u
         Z9Rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=g16reVRe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i10-v6si8292881qvq.155.2018.10.10.13.44.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 13:44:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=g16reVRe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59059 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gALL9-0006st-GG
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 16:44:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFi-0002wL-Gl
	for qemu-devel@nongnu.org; Wed, 10 Oct 2018 16:38:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFh-0002ju-CK
	for qemu-devel@nongnu.org; Wed, 10 Oct 2018 16:38:42 -0400
Received: from mail-yw1-xc44.google.com ([2607:f8b0:4864:20::c44]:43621)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1gALFa-0002Uj-Oe; Wed, 10 Oct 2018 16:38:34 -0400
Received: by mail-yw1-xc44.google.com with SMTP id j75-v6so2716112ywj.10;
	Wed, 10 Oct 2018 13:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=XSKOUQl9vmYg3HcpyWFwjAi/QFJzce6gGYliyVcFznE=;
	b=g16reVReXoKePBaxx+eU7KRtyu7j7tIvNe9sZVAWJD65TWxmtiVkmekQlZfEBlQgv+
	NERx8GQ0o3ka3OOKzPoOPVaOT7yEbnBVMMc/UTZkopOgUodely24jsr8YHgbhEcVoC6m
	CQJdsEeICVHP+Lz8nhdsQfse8cfM/corRdfSDCktaITtP9zQaXM8X262NrEbkLn335Ch
	UwQAk7gx3/1b8xzgGp8kCNqzjvfg0KuP44d6LtzXroG0gEXfZBzqJHeHb69GG9xdJ3u8
	kO0ida5gyuCiaee1UlCIvTweUoDqEMfBUtBGWmS01Dnml1hteCW3ydKwpDCfIobCuf69
	VGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XSKOUQl9vmYg3HcpyWFwjAi/QFJzce6gGYliyVcFznE=;
	b=fwnyyBXBl1W/iyF/Ofm3F/D48+a0iMsSEiZlv0f/OQAWg8IkmOdcHo3Svk+cftXOEq
	8WDlSLsddE8pnioL4YgGHAe0eLIG2CKg0UBzzg9abwb/0YmVP7DBgHYb7qE0t0xG0tSv
	NPPK546A+j9ae0Nxsus9JupPeaKigkjBSgBJBHqWa2E1S3D37F4H0J0n4pTW9F2QBYWS
	AF0KPeeR6Ra34Z4L7sEPU6QxJJYa0d1aFiWG6NBgyxAFAO4crPP3h5WaZ4pkwNJiZ2/y
	cQLDlKWm5D2jXsCOxhfngdNwOEq8ngaPAQAuSdM2y6aWKmuCd5GUZiacUVYtIIv1cfaz
	I1jA==
X-Gm-Message-State: ABuFfohbvsGrTS+lPFqJFiaRI/A/toD//c//r5D35kvTsJUx0pyXq6NF
	SbmzDSK9LbfNjJwapSYNviPaNhVB
X-Received: by 2002:a81:7a93:: with SMTP id
	v141-v6mr19516278ywc.100.1539203914004; 
	Wed, 10 Oct 2018 13:38:34 -0700 (PDT)
Received: from quinoa.localdomain ([216.85.170.153])
	by smtp.gmail.com with ESMTPSA id
	u131-v6sm15170728ywf.13.2018.10.10.13.38.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 13:38:33 -0700 (PDT)
From: Aaron Lindsay <aclindsa@gmail.com>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 10 Oct 2018 16:37:32 -0400
Message-Id: <20181010203735.27918-12-aclindsa@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181010203735.27918-1-aclindsa@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c44
Subject: [Qemu-devel] [PATCH v6 11/14] target/arm: PMU: Add instruction and
 cycle events
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
X-TUID: Ae0gKa15HFjf

The instruction event is only enabled when icount is used, cycles are
always supported. Always defining get_cycle_count (but altering its
behavior depending on CONFIG_USER_ONLY) allows us to remove some
CONFIG_USER_ONLY #defines throughout the rest of the code.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 90 ++++++++++++++++++++++-----------------------
 1 file changed, 44 insertions(+), 46 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f0798f7a8c..d6501de1ba 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -15,6 +15,7 @@
 #include "arm_ldst.h"
 #include <zlib.h> /* For crc32 */
 #include "exec/semihost.h"
+#include "sysemu/cpus.h"
 #include "sysemu/kvm.h"
 #include "fpu/softfloat.h"
 #include "qemu/range.h"
@@ -988,9 +989,50 @@ typedef struct pm_event {
     uint64_t (*get_count)(CPUARMState *);
 } pm_event;
 
+static bool event_always_supported(CPUARMState *env)
+{
+    return true;
+}
+
+/*
+ * Return the underlying cycle count for the PMU cycle counters. If we're in
+ * usermode, simply return 0.
+ */
+static uint64_t cycles_get_count(CPUARMState *env)
+{
+#ifndef CONFIG_USER_ONLY
+    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                   ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
+#else
+    return 0;
+#endif
+}
+
+#ifndef CONFIG_USER_ONLY
+static bool instructions_supported(CPUARMState *env)
+{
+    return use_icount == 1 /* Precise instruction counting */;
+}
+
+static uint64_t instructions_get_count(CPUARMState *env)
+{
+    return (uint64_t)cpu_get_icount_raw();
+}
+#endif
+
 static const pm_event pm_events[] = {
+#ifndef CONFIG_USER_ONLY
+    { .number = 0x008, /* INST_RETIRED, Instruction architecturally executed */
+      .supported = instructions_supported,
+      .get_count = instructions_get_count,
+    },
+    { .number = 0x011, /* CPU_CYCLES, Cycle */
+      .supported = event_always_supported,
+      .get_count = cycles_get_count,
+    }
+#endif
 };
-#define MAX_EVENT_ID 0x0
+#define MAX_EVENT_ID 0x11
 #define UNSUPPORTED_EVENT UINT16_MAX
 static uint16_t supported_event_map[MAX_EVENT_ID + 1];
 
@@ -1083,8 +1125,6 @@ static CPAccessResult pmreg_access_swinc(CPUARMState *env,
     return pmreg_access(env, ri, isread);
 }
 
-#ifndef CONFIG_USER_ONLY
-
 static CPAccessResult pmreg_access_selr(CPUARMState *env,
                                         const ARMCPRegInfo *ri,
                                         bool isread)
@@ -1195,9 +1235,7 @@ static inline bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
  */
 void pmccntr_op_start(CPUARMState *env)
 {
-    uint64_t cycles = 0;
-    cycles = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-                          ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
+    uint64_t cycles = cycles_get_count(env);
 
     if (pmu_counter_enabled(env, 31)) {
         uint64_t eff_cycles = cycles;
@@ -1343,42 +1381,6 @@ static void pmccntr_write32(CPUARMState *env, const ARMCPRegInfo *ri,
     pmccntr_write(env, ri, deposit64(cur_val, 0, 32, value));
 }
 
-#else /* CONFIG_USER_ONLY */
-
-void pmccntr_op_start(CPUARMState *env)
-{
-}
-
-void pmccntr_op_finish(CPUARMState *env)
-{
-}
-
-void pmevcntr_op_start(CPUARMState *env, uint8_t i)
-{
-}
-
-void pmevcntr_op_finish(CPUARMState *env, uint8_t i)
-{
-}
-
-void pmu_op_start(CPUARMState *env)
-{
-}
-
-void pmu_op_finish(CPUARMState *env)
-{
-}
-
-void pmu_pre_el_change(ARMCPU *cpu, void *ignored)
-{
-}
-
-void pmu_post_el_change(ARMCPU *cpu, void *ignored)
-{
-}
-
-#endif
-
 static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
@@ -1752,7 +1754,6 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
     /* Unimplemented so WI. */
     { .name = "PMSWINC", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 4,
       .access = PL0_W, .accessfn = pmreg_access_swinc, .type = ARM_CP_NOP },
-#ifndef CONFIG_USER_ONLY
     { .name = "PMSELR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 5,
       .access = PL0_RW, .type = ARM_CP_ALIAS,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmselr),
@@ -1774,7 +1775,6 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.c15_ccnt),
       .readfn = pmccntr_read, .writefn = pmccntr_write,
       .raw_readfn = raw_read, .raw_writefn = raw_write, },
-#endif
     { .name = "PMCCFILTR", .cp = 15, .opc1 = 0, .crn = 14, .crm = 15, .opc2 = 7,
       .writefn = pmccfiltr_write_a32, .readfn = pmccfiltr_read_a32,
       .access = PL0_RW, .accessfn = pmreg_access,
@@ -5416,7 +5416,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
          * count register.
          */
         unsigned int i, pmcrn = 4;
-#ifndef CONFIG_USER_ONLY
         ARMCPRegInfo pmcr = {
             .name = "PMCR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 0,
             .access = PL0_RW,
@@ -5473,7 +5472,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             g_free(pmevtyper_name);
             g_free(pmevtyper_el0_name);
         }
-#endif
         ARMCPRegInfo clidr = {
             .name = "CLIDR", .state = ARM_CP_STATE_BOTH,
             .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 1, .opc2 = 1,
-- 
2.19.1

