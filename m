Received: by 10.25.77.65 with SMTP id a62csp1966957lfb;
        Tue, 31 Jan 2017 07:16:22 -0800 (PST)
X-Received: by 10.237.59.19 with SMTP id p19mr25737530qte.90.1485875782519;
        Tue, 31 Jan 2017 07:16:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p33si12161885qtb.68.2017.01.31.07.16.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Jan 2017 07:16:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38930 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cYaAP-0007yY-TU
	for alex.bennee@linaro.org; Tue, 31 Jan 2017 10:16:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1cYa9v-0007YR-Dw
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 10:15:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1cYa9r-00017c-Cs
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 10:15:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34622)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1cYa9r-00016M-3Z; Tue, 31 Jan 2017 10:15:47 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 48EE880F6B;
	Tue, 31 Jan 2017 15:15:47 +0000 (UTC)
Received: from apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com [10.16.184.124])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0VFFjuY017317; Tue, 31 Jan 2017 10:15:46 -0500
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 31 Jan 2017 10:15:42 -0500
Message-Id: <1485875745-27741-3-git-send-email-wei@redhat.com>
In-Reply-To: <1485875745-27741-1-git-send-email-wei@redhat.com>
References: <1485875745-27741-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 31 Jan 2017 15:15:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH V2 2/5] target-arm: Add support for AArch64 PMU
 register PMXEVTYPER_EL0
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: heTHqcShQ90Z

In order to support Linux perf, which uses PMXEVTYPER register,
this patch adds access support for PMXEVTYPER_EL0.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 target/arm/cpu.h    |  2 +-
 target/arm/helper.c | 19 ++++++++++++++++---
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8a82c73..ce02044 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -307,7 +307,7 @@ typedef struct CPUARMState {
         uint64_t c9_pmcr; /* performance monitor control register */
         uint64_t c9_pmcnten; /* perf monitor counter enables */
         uint32_t c9_pmovsr; /* perf monitor overflow status */
-        uint32_t c9_pmxevtyper; /* perf monitor event type */
+        uint64_t c9_pmxevtyper; /* perf monitor event type */
         uint32_t c9_pmuserenr; /* perf monitor user enable */
         uint64_t c9_pmselr; /* perf monitor counter selection register */
         uint32_t c9_pminten; /* perf monitor interrupt enables */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 67520ea..c8620d9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1054,7 +1054,13 @@ static void pmovsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void pmxevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
-    env->cp15.c9_pmxevtyper = value & 0xff;
+    /* Attempts to access PMXEVTYPER are CONSTRAINED UNPREDICTABLE when
+     * PMSELR value is equal to or greater than the number of implemented
+     * counters, but not euqal to 0x1f. We opt to behave as a NOP.
+     */
+    if (env->cp15.c9_pmselr == 0x1f) {
+        pmccfiltr_write(env, ri, value);
+    }
 }
 
 static void pmuserenr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1234,10 +1240,17 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.pmccfiltr_el0),
       .resetvalue = 0, },
     { .name = "PMXEVTYPER", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 1,
-      .access = PL0_RW,
-      .fieldoffset = offsetof(CPUARMState, cp15.c9_pmxevtyper),
+      .access = PL0_RW, .type = ARM_CP_ALIAS,
+      .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmxevtyper),
       .accessfn = pmreg_access, .writefn = pmxevtyper_write,
       .raw_writefn = raw_write },
+    { .name = "PMXEVTYPER_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 13, .opc2 = 1,
+      .access = PL0_RW, .accessfn = pmreg_access,
+      .type = ARM_CP_IO,
+      .fieldoffset = offsetof(CPUARMState, cp15.c9_pmxevtyper),
+      .writefn = pmxevtyper_write, .raw_writefn = raw_write,
+      .resetvalue = 0x0 },
     /* Unimplemented, RAZ/WI. */
     { .name = "PMXEVCNTR", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 2,
       .access = PL0_RW, .type = ARM_CP_CONST, .resetvalue = 0,
-- 
1.8.3.1

