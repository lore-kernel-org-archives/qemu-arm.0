Received: by 10.25.205.13 with SMTP id d13csp1109732lfg;
        Wed, 11 Jan 2017 23:04:42 -0800 (PST)
X-Received: by 10.55.174.195 with SMTP id x186mr11975014qke.87.1484204682843;
        Wed, 11 Jan 2017 23:04:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 8si5492365qtg.308.2017.01.11.23.04.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Jan 2017 23:04:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60103 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cRZRC-0001bM-Ba
	for alex.bennee@linaro.org; Thu, 12 Jan 2017 02:04:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1cRZQw-0001UX-PH
	for qemu-arm@nongnu.org; Thu, 12 Jan 2017 02:04:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1cRZQr-0005tt-Tb
	for qemu-arm@nongnu.org; Thu, 12 Jan 2017 02:04:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46312)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1cRZQr-0005s8-On; Thu, 12 Jan 2017 02:04:21 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7759EC04B926;
	Thu, 12 Jan 2017 07:04:21 +0000 (UTC)
Received: from apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com [10.16.184.124])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0C74JTH008641; Thu, 12 Jan 2017 02:04:21 -0500
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Jan 2017 02:04:15 -0500
Message-Id: <1484204658-28058-2-git-send-email-wei@redhat.com>
In-Reply-To: <1484204658-28058-1-git-send-email-wei@redhat.com>
References: <1484204658-28058-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 12 Jan 2017 07:04:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH V1 1/4] target-arm: Add support for PMU register
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
X-TUID: edBQsX05PoNa

This patch adds support for AArch64 register PMSELR_EL0. The existing
PMSELR definition is revised accordingly.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 target/arm/cpu.h    |  1 +
 target/arm/helper.c | 24 +++++++++++++++++++-----
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ab119e6..bd80658 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -307,6 +307,7 @@ typedef struct CPUARMState {
         uint32_t c9_pmovsr; /* perf monitor overflow status */
         uint32_t c9_pmxevtyper; /* perf monitor event type */
         uint32_t c9_pmuserenr; /* perf monitor user enable */
+        uint32_t c9_pmselr; /* perf monitor counter selection register */
         uint32_t c9_pminten; /* perf monitor interrupt enables */
         union { /* Memory attribute redirection */
             struct {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8dcabbf..71adb0f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -975,6 +975,15 @@ static uint64_t pmccntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return total_ticks - env->cp15.c15_ccnt;
 }
 
+static void pmselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                         uint64_t value)
+{
+    /* only cycle counter selection is supported */
+    if (value == 0x1f) {
+        env->cp15.c9_pmselr = value;
+    }
+}
+
 static void pmccntr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
@@ -1194,12 +1203,17 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
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
+      .fieldoffset = offsetof(CPUARMState, cp15.c9_pmselr),
+      .accessfn = pmreg_access, .writefn = pmselr_write,
+      .raw_writefn = raw_write},
+    { .name = "PMSELR_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 5,
+      .access = PL0_RW, .accessfn = pmreg_access,
+      .type = ARM_CP_IO,
+      .fieldoffset = offsetof(CPUARMState, cp15.c9_pmselr),
+      .writefn = pmselr_write, .raw_writefn = raw_write, },
 #ifndef CONFIG_USER_ONLY
     { .name = "PMCCNTR", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 0,
       .access = PL0_RW, .resetvalue = 0, .type = ARM_CP_IO,
-- 
1.8.3.1

