Received: by 10.25.77.65 with SMTP id a62csp2371167lfb;
        Tue, 7 Feb 2017 13:50:36 -0800 (PST)
X-Received: by 10.55.83.71 with SMTP id h68mr15789818qkb.259.1486504236770;
        Tue, 07 Feb 2017 13:50:36 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z22si3981757qtz.87.2017.02.07.13.50.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Feb 2017 13:50:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56523 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cbDej-000344-Vt
	for alex.bennee@linaro.org; Tue, 07 Feb 2017 16:50:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1cbDdp-0002z4-QO
	for qemu-devel@nongnu.org; Tue, 07 Feb 2017 16:49:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1cbDdo-0007cK-RA
	for qemu-devel@nongnu.org; Tue, 07 Feb 2017 16:49:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54308)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1cbDdl-0007Xm-Oz; Tue, 07 Feb 2017 16:49:33 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA56B3A76A7;
	Tue,  7 Feb 2017 21:49:33 +0000 (UTC)
Received: from apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com [10.16.184.124])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v17LnVCI006452; Tue, 7 Feb 2017 16:49:33 -0500
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 Feb 2017 16:49:30 -0500
Message-Id: <1486504171-26807-4-git-send-email-wei@redhat.com>
In-Reply-To: <1486504171-26807-1-git-send-email-wei@redhat.com>
References: <1486504171-26807-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 07 Feb 2017 21:49:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH V3 3/4] target-arm: Add support for PMU
 register PMINTENSET_EL1
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V/0SBE9DBhP+

This patch adds access support for PMINTENSET_EL1.

Signed-off-by: Wei Huang <wei@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    |  2 +-
 target/arm/helper.c | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f46607e..e28cd2e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -309,7 +309,7 @@ typedef struct CPUARMState {
         uint32_t c9_pmovsr; /* perf monitor overflow status */
         uint32_t c9_pmuserenr; /* perf monitor user enable */
         uint64_t c9_pmselr; /* perf monitor counter selection register */
-        uint32_t c9_pminten; /* perf monitor interrupt enables */
+        uint64_t c9_pminten; /* perf monitor interrupt enables */
         union { /* Memory attribute redirection */
             struct {
 #ifdef HOST_WORDS_BIGENDIAN
diff --git a/target/arm/helper.c b/target/arm/helper.c
index ec5cf1f..c4daa6e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1275,9 +1275,17 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .writefn = pmuserenr_write, .raw_writefn = raw_write },
     { .name = "PMINTENSET", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_tpm,
-      .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
+      .type = ARM_CP_ALIAS,
+      .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pminten),
       .resetvalue = 0,
       .writefn = pmintenset_write, .raw_writefn = raw_write },
+    { .name = "PMINTENSET_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 1,
+      .access = PL1_RW, .accessfn = access_tpm,
+      .type = ARM_CP_IO,
+      .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
+      .writefn = pmintenset_write, .raw_writefn = raw_write,
+      .resetvalue = 0x0 },
     { .name = "PMINTENCLR", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_tpm, .type = ARM_CP_ALIAS,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
-- 
1.8.3.1

