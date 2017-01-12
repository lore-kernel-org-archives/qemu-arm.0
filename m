Received: by 10.25.205.13 with SMTP id d13csp1109681lfg;
        Wed, 11 Jan 2017 23:04:33 -0800 (PST)
X-Received: by 10.237.60.101 with SMTP id u34mr12587643qte.53.1484204673489;
        Wed, 11 Jan 2017 23:04:33 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z5si5475002qkb.334.2017.01.11.23.04.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Jan 2017 23:04:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cRZR3-0001Us-1k
	for alex.bennee@linaro.org; Thu, 12 Jan 2017 02:04:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1cRZQw-0001UU-PH
	for qemu-arm@nongnu.org; Thu, 12 Jan 2017 02:04:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1cRZQs-0005uI-1g
	for qemu-arm@nongnu.org; Thu, 12 Jan 2017 02:04:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58322)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1cRZQr-0005sy-Sn; Thu, 12 Jan 2017 02:04:21 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0FECA21724;
	Thu, 12 Jan 2017 07:04:22 +0000 (UTC)
Received: from apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com [10.16.184.124])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0C74JTI008641; Thu, 12 Jan 2017 02:04:21 -0500
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Jan 2017 02:04:16 -0500
Message-Id: <1484204658-28058-3-git-send-email-wei@redhat.com>
In-Reply-To: <1484204658-28058-1-git-send-email-wei@redhat.com>
References: <1484204658-28058-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 12 Jan 2017 07:04:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH V1 2/4] target-arm: Add support for AArch64 PMU
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
X-TUID: Y/cCymjp+Xbx

In order to support Linux perf, which uses PMXEVTYPER register,
this patch adds access support for PMXEVTYPER_EL0.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 target/arm/helper.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 71adb0f..9044a33 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1233,10 +1233,17 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.pmccfiltr_el0),
       .resetvalue = 0, },
     { .name = "PMXEVTYPER", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 1,
-      .access = PL0_RW,
+      .access = PL0_RW, .type = ARM_CP_ALIAS,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmxevtyper),
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

