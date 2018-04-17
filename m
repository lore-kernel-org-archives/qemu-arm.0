Received: by 10.28.4.212 with SMTP id 203csp4249986wme;
        Tue, 17 Apr 2018 13:38:46 -0700 (PDT)
X-Google-Smtp-Source: AIpwx483XDzm9FlFGepRfzu0MdPcioIDFvCLrXcg6HBJOqUz80cLakz1w9SqsKcPMZJ5SId4KG+v
X-Received: by 10.200.35.197 with SMTP id r5mr1340478qtr.337.1523997526024;
        Tue, 17 Apr 2018 13:38:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523997526; cv=none;
        d=google.com; s=arc-20160816;
        b=d/O/Mwhmopst3qBlZIaUBdbAeoVjoLzTC5hDToQsNjCH4Q3P9RHtUA69pdxGqt7u8+
         +3alsVSB8uJlDuQUiGsXmdZ4S2L6S2yeq0pwUEr9k/FRwAsv0cy7lKnMEx3KyFOKmJcx
         8qnb8mt2SxyLP07rWdhKCmrzJ9cOv8Ntz1dK2Dt3ncKjfdIRWiBMyk89Qmq9rhXg3hSI
         FaNj4ymK/iS4dY4H7ianVmP+PuCY0rUwzCR7YTqaBLlXE2LXQy2bZDFob56eUePyoC3C
         fdQCl3maGf1CUnzJi2zkwj14Eszv5KuVH9+RpX6doYzaMbUQMU+krmyv9CDslfGdnUZm
         AIkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=5oAJmOiO457WcraagGQ89+P9mvtUKxlZ2goT8r6TR+0=;
        b=goVfkEea8sXO+q92ATIcQpmNcmOlr7/L9xVzBjXDlUjLPXVg60SH1D50jJcNWG69OT
         r1MRBBCyVOJpaawULsW3r7H6QPRsVWpW+fb1sG3UlL9KHvEo5e396yw7YFVrFLFYezl8
         Q4rrRADcasq0MN4LG0CIBQI5W4j3OtQdGIFf5RmStmwexF1+r6/lb0gBB4IXslCTbo01
         rjenq8+xBqPtZvAoxZJDF/8s3gYPkH7qBeNmZnXlihlx4d9Df9KsJkFJVnn2xhEUGUkt
         EvMPpAjr6i1LLGBFjlwjM0HrS69LMDgeoM6yJGk2S2xaBy+upUDGF1ArmKGphN3yBaQd
         SHtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=OyHeHESF;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=AWb807r/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z66si8847847qkg.263.2018.04.17.13.38.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 13:38:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=OyHeHESF;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=AWb807r/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33260 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8XNF-0002bp-Ia
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 16:38:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XN6-0002b7-7x
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:38:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XN1-0001lu-61
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:38:36 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39000)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8XN0-0001Zd-P9; Tue, 17 Apr 2018 16:38:31 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 51F206081C; Tue, 17 Apr 2018 20:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997509;
	bh=KsG29gC/tAo/ys1SasvwkrpHimdy5VtICX/xlqQ+4+g=;
	h=From:To:Cc:Subject:Date:From;
	b=OyHeHESFZL/2B1ZDeFkD21xCmRUb8VCY6qDWkNhzwy2KrxPDTvI01+r0NDpJta146
	+nvTvzFg57hDSuCuWItcuVb/UNI7TJRpULlKIsznG6leDj9+t9hS5ehFoU+eB9zGiM
	x6YTqKewG8WneXhldAeAjsQS3MT57O74gHRtyQYM=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 9EB4760385;
	Tue, 17 Apr 2018 20:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997508;
	bh=KsG29gC/tAo/ys1SasvwkrpHimdy5VtICX/xlqQ+4+g=;
	h=From:To:Cc:Subject:Date:From;
	b=AWb807r/kWB2MsrcAN68O/A2ptiLU7IT6i074grZtWuxMsR/k+mwAbcWhyJdcmH0I
	j6BAg214ihQd0iZkgAZUFJfBXiiCQVeIOWoL3ckoJfFFJEt/fCYrlmVc+fhFaF6r1/
	3xxnpeUaRcCAY7BGLmkyL9Xkn89xAMEBzU9/naRc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9EB4760385
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 17 Apr 2018 16:37:44 -0400
Message-Id: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v4 00/21] More fully implement ARM PMUv3
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0wUq+q8gXolh

The ARM PMU implementation currently contains a basic cycle counter, but =
it is
often useful to gather counts of other events and filter them based on
execution mode. These patches flesh out the implementations of various PM=
U
registers including PM[X]EVCNTR and PM[X]EVTYPER, add a struct definition=
 to
represent arbitrary counter types, implement mode filtering, send interru=
pts on
counter overflow, and add instruction, cycle, and software increment even=
ts.

Notable changes since v3:

* Detect counter overflow and send interrupts accordingly (adds a 'shadow=
' copy
  of both PMCCNTR and general-purpose counters, possibly/probably Doing I=
t
  Wrong)
* Update counter filtering code to more closely resemble the ARM document=
ation
  in form and functionality=20
* Don't mix EL change hooks and KVM
* Don't call gen_io_start/end if not actually using icount
* Reorganized a few of the patches to more logically group changes
* Clarify and otherwise improve a few comments
* There are also a number of less significant changes scattered around

Thanks,
Aaron

Aaron Lindsay (21):
  target/arm: Check PMCNTEN for whether PMCCNTR is enabled
  target/arm: Treat PMCCNTR as alias of PMCCNTR_EL0
  target/arm: Reorganize PMCCNTR accesses
  target/arm: Mask PMU register writes based on PMCR_EL0.N
  target/arm: Fetch GICv3 state directly from CPUARMState
  target/arm: Support multiple EL change hooks
  target/arm: Add pre-EL change hooks
  target/arm: Allow EL change hooks to do IO
  target/arm: Fix bitmask for PMCCFILTR writes
  target/arm: Filter cycle counter based on PMCCFILTR_EL0
  target/arm: Allow AArch32 access for PMCCFILTR
  target/arm: Make PMOVSCLR and PMUSERENR 64 bits wide
  target/arm: Add ARM_FEATURE_V7VE for v7 Virtualization Extensions
  target/arm: Implement PMOVSSET
  target/arm: Add array for supported PMU events, generate PMCEID[01]
  target/arm: Finish implementation of PM[X]EVCNTR and PM[X]EVTYPER
  target/arm: PMU: Add instruction and cycle events
  target/arm: PMU: Set PMCR.N to 4
  target/arm: Implement PMSWINC
  target/arm: Mark PMINTENSET accesses as possibly doing IO
  target/arm: Send interrupts on PMU counter overflow

 hw/intc/arm_gicv3_cpuif.c  |  10 +-
 target/arm/cpu.c           |  68 +++-
 target/arm/cpu.h           | 119 +++++--
 target/arm/cpu64.c         |   2 -
 target/arm/helper.c        | 752 ++++++++++++++++++++++++++++++++++++++-=
------
 target/arm/internals.h     |  14 +-
 target/arm/op_helper.c     |   8 +
 target/arm/translate-a64.c |   6 +
 target/arm/translate.c     |  12 +
 9 files changed, 834 insertions(+), 157 deletions(-)

--=20
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies=
, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

