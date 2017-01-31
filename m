Received: by 10.25.77.65 with SMTP id a62csp1966857lfb;
        Tue, 31 Jan 2017 07:16:11 -0800 (PST)
X-Received: by 10.55.16.214 with SMTP id 83mr26124920qkq.192.1485875771371;
        Tue, 31 Jan 2017 07:16:11 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g9si12151173qte.195.2017.01.31.07.16.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Jan 2017 07:16:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38926 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cYaAE-0007mP-PH
	for alex.bennee@linaro.org; Tue, 31 Jan 2017 10:16:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1cYa9u-0007XR-7p
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 10:15:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1cYa9r-00017w-Ub
	for qemu-arm@nongnu.org; Tue, 31 Jan 2017 10:15:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50268)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1cYa9r-000171-Nu; Tue, 31 Jan 2017 10:15:47 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D8F6B3D95C;
	Tue, 31 Jan 2017 15:15:47 +0000 (UTC)
Received: from apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com [10.16.184.124])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0VFFjuZ017317; Tue, 31 Jan 2017 10:15:47 -0500
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 31 Jan 2017 10:15:43 -0500
Message-Id: <1485875745-27741-4-git-send-email-wei@redhat.com>
In-Reply-To: <1485875745-27741-1-git-send-email-wei@redhat.com>
References: <1485875745-27741-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 31 Jan 2017 15:15:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH V2 3/5] target-arm: Add support for PMU register
 PMXEVCNTR_EL0
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
X-TUID: CikQVv53bxtP

To make PMU register support complete, this patch adds support for
PMXEVCNTR_EL0.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 target/arm/helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c8620d9..6b8460a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1255,6 +1255,10 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
     { .name = "PMXEVCNTR", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 2,
       .access = PL0_RW, .type = ARM_CP_CONST, .resetvalue = 0,
       .accessfn = pmreg_access },
+    { .name = "PMXEVCNTR_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 13, .opc2 = 2,
+      .access = PL0_RW, .type = ARM_CP_CONST, .resetvalue = 0,
+      .accessfn = pmreg_access },
     { .name = "PMUSERENR", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 0,
       .access = PL0_R | PL1_RW, .accessfn = access_tpm,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmuserenr),
-- 
1.8.3.1

