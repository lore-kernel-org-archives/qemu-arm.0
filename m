Received: by 10.25.0.144 with SMTP id 138csp378078lfa;
        Wed, 19 Apr 2017 10:42:04 -0700 (PDT)
X-Received: by 10.237.45.194 with SMTP id i60mr3557933qtd.262.1492623724218;
        Wed, 19 Apr 2017 10:42:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l7si3028246qkb.314.2017.04.19.10.42.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Apr 2017 10:42:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org;
       dkim=fail header.i=@codeaurora.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49604 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0tcB-0008CE-Ka
	for alex.bennee@linaro.org; Wed, 19 Apr 2017 13:42:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43847)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1d0tc1-0008Ap-K7
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 13:41:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1d0tby-0004LC-IO
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 13:41:53 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37408)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1d0tby-0004KU-AS; Wed, 19 Apr 2017 13:41:50 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id E76D861110; Wed, 19 Apr 2017 17:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1492623707;
	bh=Gg0OcI37DXD4g8fAEDrPGQowtPED49DapWWghzo5aEw=;
	h=From:To:Cc:Subject:Date:From;
	b=BlyVcrABjgd+bIJgtQlsT6OUp9DbcYbvGaSl/LHFcWbgvjvdH3+9OeIJtCSuk4x5w
	M7B3eSBEAOywQ+8Q1DU55FkY1Y9lg6/+rShjk04pJ6qVeDt/VMOvj94JWqKGbCqdSk
	Jzr2BsUtAMBmc9f9YMSMOqcXkStSwVnZFq2rOEOA=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id D442C610D4;
	Wed, 19 Apr 2017 17:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1492623707;
	bh=Gg0OcI37DXD4g8fAEDrPGQowtPED49DapWWghzo5aEw=;
	h=From:To:Cc:Subject:Date:From;
	b=BlyVcrABjgd+bIJgtQlsT6OUp9DbcYbvGaSl/LHFcWbgvjvdH3+9OeIJtCSuk4x5w
	M7B3eSBEAOywQ+8Q1DU55FkY1Y9lg6/+rShjk04pJ6qVeDt/VMOvj94JWqKGbCqdSk
	Jzr2BsUtAMBmc9f9YMSMOqcXkStSwVnZFq2rOEOA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D442C610D4
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Date: Wed, 19 Apr 2017 13:41:11 -0400
Message-Id: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH 00/13] More fully implement ARM PMUv3
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
X-TUID: YPTG2j5JJ9Wl

The ARM PMU implementation currently contains a basic cycle counter, but it is
often useful to gather counts of other events and filter them based on
execution mode. These patches flesh out the implementations of various PMU
registers including PM[X]EVCNTR and PM[X]EVTYPER, add a struct definition to
represent arbitrary counter types, implement mode filtering, and add
instruction, cycle, and software increment events.

I am particularly interested in feedback on the following two patches because I
think I'm likely Doing It Wrong:
 [1] target/arm: Filter cycle counter based on PMCCFILTR_EL0
 [2] target/arm: PMU: Add instruction and cycle events

In order to implement mode filtering in an event-driven way, [1] adds a pair of
calls to pmu_sync() surrounding every update to a register/variable which may
affect whether any counter is currently filtered. These pmu_sync() calls
ultimately call cpu_get_icount_raw() for enabled instruction and cycle counters
when using icount. Unfortunately, cpu->can_do_io may otherwise be zero for
these calls so the current implementation in [2] temporarily sets can_do_io to
1. I haven't see any ill side effects from this in my testing, but it doesn't
seem like the right way to handle this.

I would like to eventually add sending interrupts on counter overflow.
Suggestions for the best direction to handle this are most welcome.  

Thanks for any feedback,
Aaron


Aaron Lindsay (13):
  target/arm: A53: Initialize PMCEID[0]
  target/arm: Check PMCNTEN for whether PMCCNTR is enabled
  target/arm: Reorganize PMCCNTR read, write, sync
  target/arm: Mask PMU register writes based on PMCR_EL0.N
  target/arm: Allow AArch32 access for PMCCFILTR
  target/arm: Filter cycle counter based on PMCCFILTR_EL0
  target/arm: Implement PMOVSSET
  target/arm: Split arm_ccnt_enabled into generic pmu_counter_enabled
  target/arm: Add array for supported PMU events, generate PMCEID[01]
  target/arm: Finish implementation of PM[X]EVCNTR and PM[X]EVTYPER
  target/arm: PMU: Add instruction and cycle events
  target/arm: PMU: Set PMCR.N to 4
  target/arm: Implement PMSWINC

 target/arm/cpu.c       |  10 +-
 target/arm/cpu.h       |  34 +++-
 target/arm/cpu64.c     |   2 +
 target/arm/helper.c    | 523 ++++++++++++++++++++++++++++++++++++++++++-------
 target/arm/kvm64.c     |   2 +
 target/arm/machine.c   |   2 +
 target/arm/op_helper.c |   4 +
 7 files changed, 500 insertions(+), 77 deletions(-)

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

