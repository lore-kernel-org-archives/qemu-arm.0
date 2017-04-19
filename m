Received: by 10.25.0.144 with SMTP id 138csp380221lfa;
        Wed, 19 Apr 2017 10:48:28 -0700 (PDT)
X-Received: by 10.200.35.73 with SMTP id b9mr3727460qtb.268.1492624108793;
        Wed, 19 Apr 2017 10:48:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t86si3065248qkt.136.2017.04.19.10.48.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Apr 2017 10:48:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org;
       dkim=fail header.i=@codeaurora.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49650 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0tiO-0005Vl-7i
	for alex.bennee@linaro.org; Wed, 19 Apr 2017 13:48:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1d0tcA-0008Jt-28
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 13:42:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1d0tc7-0004R8-CM
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 13:42:02 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:38004)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1d0tc7-0004QR-6h; Wed, 19 Apr 2017 13:41:59 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 5CFCB61110; Wed, 19 Apr 2017 17:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1492623718;
	bh=DOEQgCYbmRI4K8pa91Bo4IMqRSp5D9GTpc5ABPezHuE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WEAZJFZxb7KoRav55OfYeuyksFSn8e0w4qlhOOFfHUuZ3I4mR6o1w0pC3gqWHhJYH
	ihxg3h6Y4mklypJOlwjgLyHIaUNPFKw6RXY4xSlP5XdoqnPuWNSJ5IDj+CF0tqSmUH
	HdpqD4fgbXccrcVizKaF9vqEgBLidJRl1onU1xA4=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 6A4A96110D;
	Wed, 19 Apr 2017 17:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1492623718;
	bh=DOEQgCYbmRI4K8pa91Bo4IMqRSp5D9GTpc5ABPezHuE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WEAZJFZxb7KoRav55OfYeuyksFSn8e0w4qlhOOFfHUuZ3I4mR6o1w0pC3gqWHhJYH
	ihxg3h6Y4mklypJOlwjgLyHIaUNPFKw6RXY4xSlP5XdoqnPuWNSJ5IDj+CF0tqSmUH
	HdpqD4fgbXccrcVizKaF9vqEgBLidJRl1onU1xA4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6A4A96110D
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Date: Wed, 19 Apr 2017 13:41:23 -0400
Message-Id: <1492623684-25799-13-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
References: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH 12/13] target/arm: PMU: Set PMCR.N to 4
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
X-TUID: pKHjrbHSiAex

This both advertises that we support four counters and adds them to the
implementation because the PMU_NUM_COUNTERS macro reads this value from
the PMCR.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5972984..a15b932 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4936,7 +4936,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             .access = PL0_RW, .accessfn = pmreg_access,
             .type = ARM_CP_IO,
             .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcr),
-            .resetvalue = cpu->midr & 0xff000000,
+            /* 4 counters enabled */
+            .resetvalue = (cpu->midr & 0xff000000) | (0x4 << PMCRN_SHIFT),
             .writefn = pmcr_write, .raw_writefn = raw_write,
         };
         define_one_arm_cp_reg(cpu, &pmcr);
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

