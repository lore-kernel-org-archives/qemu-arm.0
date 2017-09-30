Received: by 10.223.197.9 with SMTP id q9csp1227405wrf;
        Fri, 29 Sep 2017 19:09:33 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDeHeN3IN1GYStg5nnKU0bvpH+03CWctagKXCCmCajDGEKh6pYLdOob0lfWwPscIK+NoLsW
X-Received: by 10.237.42.35 with SMTP id c32mr9186843qtd.171.1506737373230;
        Fri, 29 Sep 2017 19:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506737373; cv=none;
        d=google.com; s=arc-20160816;
        b=K636VtLZhtvowCMcy15oGIqJwvKrgDW8XLGOwZxpT4DMkNGdwMcbsdNFmDhYwVoI3z
         fN4iXlu70XUG/KurWMOTqGJ3l1NVBPWgi/5mz7Qg0/wXcjR87FdtbLlOrzhjZ2FATMka
         S7SGMEanEeI2j8j/2eKh9sdSDVBOvfVl6km2UJqqfl5POziFbrIQzBopwUDWbNCJAGrK
         OQ6Gf2s817hj5qiaXyQpoA/ggG2KBXe3hERz7H4nz8+gxsnjWefJR+pOKulUyxOFy4dM
         O1ITESXnMMZN3RNIfu7yd684l8a3CXoZaApky/StBftdogUficCq6JI3Y6B663BfHpBm
         RBEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=2OhBOLH3utHlbpqFBZFDBNcKpXkjUSBEUR8KOpzdmjM=;
        b=s6+tMoQAfMuiKZJwW+i0vvi4sJZA4XTCyLIPfVpA76g0Ax0w/NKYLrg1S7bdN3nUAR
         268scPHoXIbsTkfvI5U9AYrjfIL6FQQTC105ACPntYc8egauFcU38l9O4P44Ir2VeukQ
         Zm5UqbcLozNdyqGnHpGbrqnXYpdEKZCMC7fTSt8G/qL7CH7XiI+PMFHMgEgr7hO/J2Ut
         RtHC5dsHfDBWuKgSadJxJOr6HQ0d1yuT78N7IndylLGi44btG1HJrJzYpcbL47a9o1BE
         lrSZLaEifnQojQCpSge0XzDMue0XEYj4F4x+nUYZoIhdqKP557AMKcB9rPFN8Im+iloD
         FPKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=hdsmkwx8;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=IzVkCBKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c75si3841985qkg.209.2017.09.29.19.09.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Sep 2017 19:09:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=hdsmkwx8;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=IzVkCBKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Received: from localhost ([::1]:37780 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dy7De-0002O8-QL
	for alex.bennee@linaro.org; Fri, 29 Sep 2017 22:09:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49333)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7DT-0002Np-13
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 22:09:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7DP-0004r1-Oo
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 22:09:18 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:34896)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1dy7DP-0004pc-Gd; Fri, 29 Sep 2017 22:09:15 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 5C9A96081E; Sat, 30 Sep 2017 02:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737353;
	bh=WOUoxHcW40OhQVlGXbSRB3+aFRZiyqxcGypfwHvRO2g=;
	h=From:To:Cc:Subject:Date:From;
	b=hdsmkwx8/xiZnhD76cEZYPJrot3J+lk5vZ1C+Z9tgiH4iN44CZ4Ydq94uGAS2Iruo
	JNx6aR3qJfniULEJ6X+qXCcRCEpCugbJ72f2bx0rEftY6Y1VzHZSM/gliVIq0cQgzx
	qpo5tLdC9odemRjENrnOqL2EFOm1RROJbsBFua4k=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id D27236081E;
	Sat, 30 Sep 2017 02:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737352;
	bh=WOUoxHcW40OhQVlGXbSRB3+aFRZiyqxcGypfwHvRO2g=;
	h=From:To:Cc:Subject:Date:From;
	b=IzVkCBKUN3btba6BjU6UljEJjoz/9VlURNt/QV3Xy2xyRRG4KhVBp8f8qTLf989/U
	ecrrjElI3Pb3puIlm5EIigRzPYrI4EMv7FwROexih6ylSCPG35Kof6ejeeylqiaj9+
	cAxdWNpkFbxwbTDo+F63j17B5DWIy7BXxZAp54XI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D27236081E
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Wei Huang <wei@redhat.com>
Date: Fri, 29 Sep 2017 22:08:17 -0400
Message-Id: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v2 00/13] More fully implement ARM PMUv3
X-BeenThere: qemu-arm@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@gnu.org>
List-Help: <mailto:qemu-arm-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=subscribe>
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
X-TUID: Epoyv0edXLHF

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
 target/arm/helper.c    | 535 +++++++++++++++++++++++++++++++++++++++++--------
 target/arm/kvm64.c     |   2 +
 target/arm/machine.c   |   2 +
 target/arm/op_helper.c |   4 +
 7 files changed, 500 insertions(+), 89 deletions(-)

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

