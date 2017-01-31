Received: by 10.25.77.65 with SMTP id a62csp1966749lfb;
        Tue, 31 Jan 2017 07:15:56 -0800 (PST)
X-Received: by 10.200.51.199 with SMTP id d7mr28106545qtb.67.1485875756545;
        Tue, 31 Jan 2017 07:15:56 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m86si12123816qkl.237.2017.01.31.07.15.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Jan 2017 07:15:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38924 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cYa9z-0007ZK-QI
	for alex.bennee@linaro.org; Tue, 31 Jan 2017 10:15:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1cYa9u-0007XW-9K
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 10:15:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1cYa9r-00017i-Eu
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 10:15:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50108)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1cYa9r-00016D-5j; Tue, 31 Jan 2017 10:15:47 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B28186330D;
	Tue, 31 Jan 2017 15:15:46 +0000 (UTC)
Received: from apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com [10.16.184.124])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0VFFjuX017317; Tue, 31 Jan 2017 10:15:46 -0500
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 31 Jan 2017 10:15:41 -0500
Message-Id: <1485875745-27741-2-git-send-email-wei@redhat.com>
In-Reply-To: <1485875745-27741-1-git-send-email-wei@redhat.com>
References: <1485875745-27741-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 31 Jan 2017 15:15:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH V2 1/5] target-arm: Add support for PMU register
 PMSELR_EL0
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
X-TUID: CUmkjvk4gkFy

This patch adds support for AArch64 register PMSELR_EL0. The existing
PMSELR definition is revised accordingly.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 target/arm/cpu.h    |  1 +
 target/arm/helper.c | 25 ++++++++++++++++++++-----
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 39bff86..8a82c73 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -309,6 +309,7 @@ typedef struct CPUARMState {
         uint32_t c9_pmovsr; /* perf monitor overflow status */
         uint32_t c9_pmxevtyper; /* perf monitor event type */
         uint32_t c9_pmuserenr; /* perf monitor user enable */
+        uint64_t c9_pmselr; /* perf monitor counter selection register */
         uint32_t c9_pminten; /* perf monitor interrupt enables */
         union { /* Memory attribute redirection */
             struct {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c23df1b..67520ea 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -975,6 +975,17 @@ static uint64_t pmccntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return total_ticks - env->cp15.c15_ccnt;
 }
 
+static void pmselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                         uint64_t value)
+{
+    /* The value of PMSELR.SEL affects the behavior of PMXEVTYPER and
+     * PMXEVCNTR. We allow [0..31] to be written to PMSELR here; in the
+     * meanwhile, we check PMSELR.SEL when PMXEVTYPER and PMXEVCNTR are
+     * accessed.
+     */
+    env->cp15.c9_pmselr = value & 0x1f;
+}
+
 static void pmccntr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
@@ -1194,12 +1205,16 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
     /* Unimplemented so WI. */
     { .name = "PMSWINC", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 4,
       .access = PL0_W, .accessfn = pmreg_access, .type = ARM_CP_NOP },
-    /* Since we don't implement any events, writing to PMSELR is UNPREDICTABLE.
-     * We choose to RAZ/WI.
-     */
     { .name = "PMSELR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 5,
-      .access = PL0_RW, .type = ARM_CP_CONST, .resetvalue = 0,
-      .accessfn = pmreg_access },
+      .access = PL0_RW, .type = ARM_CP_ALIAS,
+      .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmselr),
+      .accessfn = pmreg_access, .writefn = pmselr_write,
+      .raw_writefn = raw_write},
+    { .name = "PMSELR_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 5,
+      .access = PL0_RW, .accessfn = pmreg_access,
+      .fieldoffset = offsetof(CPUARMState, cp15.c9_pmselr),
+      .writefn = pmselr_write, .raw_writefn = raw_write, },
 #ifndef CONFIG_USER_ONLY
     { .name = "PMCCNTR", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 0,
       .access = PL0_RW, .resetvalue = 0, .type = ARM_CP_IO,
-- 
1.8.3.1

