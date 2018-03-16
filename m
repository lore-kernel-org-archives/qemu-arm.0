Received: by 10.28.91.67 with SMTP id p64csp1273017wmb;
        Fri, 16 Mar 2018 13:32:07 -0700 (PDT)
X-Google-Smtp-Source: AG47ELu0FgUPBZWo9KfhD6naUJFssHvu3XeLFiHQJxbTsQ/2hQGV3Kv+RgzoCdw0LruwLWagKAD6
X-Received: by 10.237.62.55 with SMTP id l52mr4770791qtf.143.1521232327235;
        Fri, 16 Mar 2018 13:32:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521232327; cv=none;
        d=google.com; s=arc-20160816;
        b=mpYyYVTRQ8UtL8nRRMKrZ8KU3WHm7iZVJeaTeOrqvCOHKoNtf+hTKqOBCUxZ+9OV2R
         SndGlwYW2TjK8rNFPq7V7IdO2mzM7naWVwdnRRXjAePJPkau8yG0qmANUMO8Mu7WCR3v
         4L7hYkxpm2StO+R0qnVQiA1JlP+NwvRD+eEFABVSdfNEu6h/JNjw1ZAd7vuDzZO0hZmf
         246wrqbqI5+Ekq16KYWQNfFSrTf1ILS2SDvN+K7lfjsRbvrSeGTrL/zFrKlSxDJBJHET
         nFMSIcHBbtebQ9KrW5ErkhGfccedRISG69oJOpTmvThrP0+im5cEXWH51Eb6hZSh0CAe
         HljQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=92KS5dXFO7pvqld5wny5cvrH4dE6ZCaNuoUuP579GjM=;
        b=s4F+7qZO/aDh52TOUhBwTkrt2sN7gtfxHkQ3OE+VVdGRioKAzwtz7KlUp1EK3lfQP5
         qz+b9XT46eVlcVe/RoPl+lQTpEEOJQ6gR6o9gJo2SUK/VsxMeSmdFnzSGPW2UGBZvcMT
         wdBgiCrn11MyB9ERFJ5ym9dtsNFNRCjIraeUqxwVS53Cz8lwZgX3QlTX5gdH6dogNv/I
         XpM3cSvgz+wUhqa8OTcxvalW7bkdrgnJ8WL5+drVnbfeTlNz4axFzfyUg6ujgzJpyTsV
         c5SoacduB/nmLbfOBQrMRkvp7BIeiLMjk3TB2wvl+XFf20R7jgVOsIdpkntQoPIgYCDX
         FL8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=nA+UJpH0;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=H4qLJTqJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d48si5727980qtc.291.2018.03.16.13.32.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Mar 2018 13:32:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=nA+UJpH0;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=H4qLJTqJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59426 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eww1G-0005Yd-IK
	for alex.bennee@linaro.org; Fri, 16 Mar 2018 16:32:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43566)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww10-0005YD-U2
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:31:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww0w-0002nT-NF
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:31:50 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55174)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1eww0w-0002mb-F2; Fri, 16 Mar 2018 16:31:46 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 1671B60C4F; Fri, 16 Mar 2018 20:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232304;
	bh=NskwyAkcRnWZhf2LO3GEqV4hfsGBSbYDG+wH4YarWd4=;
	h=From:To:Cc:Subject:Date:From;
	b=nA+UJpH0oCTXGxsseiafC/m5yu645LoMWCVA2tpIamYRJBiZ/AHua+wTBuFSqI/YB
	lVSmdjW29nc186Y42+05pHWMHAejiZaxmJ1Fq2Qvtir7JF0WVgEVrorOkvywpO5KFj
	PhK9BXfN3ec65NUq7ONwEXGKRVIXXyrJkKvKaN+U=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 79BA060591;
	Fri, 16 Mar 2018 20:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232303;
	bh=NskwyAkcRnWZhf2LO3GEqV4hfsGBSbYDG+wH4YarWd4=;
	h=From:To:Cc:Subject:Date:From;
	b=H4qLJTqJQ6j39R+brV7yGitNrkwFJl9xkpUj2hEPlHYyGWFm0ak4jbYMZj49RCxs/
	Lq5gn8SeWWehiquzW/zh+UE9gbVWnCSgG/hIMQrlCkfxUBcLLjIHtkodqHgAMLrEDR
	bMoTzSxoY1zUTm7mkpQi2zvCkycu93WVeTechU18=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 79BA060591
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 16 Mar 2018 16:30:58 -0400
Message-Id: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v3 00/22] More fully implement ARM PMUv3
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
X-TUID: uCDFlRy3WRZh

The ARM PMU implementation currently contains a basic cycle counter, but it is
often useful to gather counts of other events and filter them based on
execution mode. These patches flesh out the implementations of various PMU
registers including PM[X]EVCNTR and PM[X]EVTYPER, add a struct definition to
represent arbitrary counter types, implement mode filtering, and add
instruction, cycle, and software increment events.

I aim to eventually add raising interrupts on counter overflow, but that is not
covered by this patchset. I think I have a reasonable grasp of the mechanics of
*how* to raise them, but am curious if anyone has thoughts on how to determine
*when* to raise them - we don't want to call into PMU code every time an
instruction is executed to check if any instruction counters have overflowed,
etc. The main candidate I've seen for doing this so far would be to set up a
QEMUTimer, but I haven't fully explored it. Does that seem plausible? Any
other/better ideas?


Changes from v2:

* Many minor fixups (splitting patches, style/comment fixes, etc.)
* Save off current cycle count during operations which may change whether a
  counter is enabled, ensuring time isn't lost (update to patch 5)
* Added the ability to have more than one el_change_hook, added hooks before EL
  changes (patches 7-9)
* Added proper handling of can_do_io during code-gen before and after the
  el_change_hooks (patch 8)
* Split off PMOVSSET register definitions so they are only enabled for v7ve+
  (added patch 15, update to 16)

Thanks for any feedback,
Aaron
 

Aaron Lindsay (22):
  target/arm: A53: Initialize PMCEID[01]
  target/arm: A15 PMCEID0 initialization style nit
  target/arm: Check PMCNTEN for whether PMCCNTR is enabled
  target/arm: Treat PMCCNTR as alias of PMCCNTR_EL0
  target/arm: Reorganize PMCCNTR read, write, sync
  target/arm: Mask PMU register writes based on PMCR_EL0.N
  target/arm: Fetch GICv3 state directly from CPUARMState
  target/arm: Support multiple EL change hooks
  target/arm: Add pre-EL change hooks
  target/arm: Allow EL change hooks to do IO
  target/arm: Fix bitmask for PMCCFILTR writes
  target/arm: Filter cycle counter based on PMCCFILTR_EL0
  target/arm: Allow AArch32 access for PMCCFILTR
  target/arm: Make PMOVSCLR 64 bits wide
  target/arm: Add ARM_FEATURE_V7VE for v7 Virtualization Extensions
  target/arm: Implement PMOVSSET
  target/arm: Split arm_ccnt_enabled into generic pmu_counter_enabled
  target/arm: Add array for supported PMU events, generate PMCEID[01]
  target/arm: Finish implementation of PM[X]EVCNTR and PM[X]EVTYPER
  target/arm: PMU: Add instruction and cycle events
  target/arm: PMU: Set PMCR.N to 4
  target/arm: Implement PMSWINC

 hw/intc/arm_gicv3_cpuif.c  |  10 +-
 target/arm/cpu.c           |  40 ++-
 target/arm/cpu.h           | 102 +++++---
 target/arm/cpu64.c         |   2 +
 target/arm/helper.c        | 616 ++++++++++++++++++++++++++++++++++++++-------
 target/arm/internals.h     |  14 +-
 target/arm/op_helper.c     |   8 +
 target/arm/translate-a64.c |   2 +
 target/arm/translate.c     |   4 +
 9 files changed, 651 insertions(+), 147 deletions(-)

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

