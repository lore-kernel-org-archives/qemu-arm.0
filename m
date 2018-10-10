Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1478486wrt;
        Wed, 10 Oct 2018 13:38:34 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62mhWTGKmHGvtOMUFAr6uFBqRzJOevv17cj7c8REJRkFuHttT9lzSB3JAwNQL6UsdsxrO1Z
X-Received: by 2002:a37:2f01:: with SMTP id v1-v6mr26238446qkh.278.1539203914598;
        Wed, 10 Oct 2018 13:38:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539203914; cv=none;
        d=google.com; s=arc-20160816;
        b=N6gN7QV+npO4nfdgMf3VN3jHIHTyzyHIC5P+mUJ/rJMtUw1a7elfZLDur3jtmgCmRC
         QW3uPSBUiHEDpusPNRvq7Nyr81hEgxzdrNGOtemz3pgC4DUT3lCriPBm2ZXj0DbYKU/A
         8zPt2QnweFGD/2QJoLRag3lqfx/PsUQFCHwQVgBWDVU8bYVESZ2kPqOSLzqHNgabIASA
         P5BjE8if89iQkrvQ1foLfDfJ3wTWK/l4CdTJ74jP+hSZ3Ce7cQz4Fpn3ByWynxkZhDLc
         mxWOFog3z2IErv4DfStwSfnqBXL0/VgfIYhwbkwzfAnrybMSChdUejs7JgAfSx0i7h3r
         egdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=Gj1Wz3YTSMIBnewLGtsEovmWfmex6XgUSSKzzs6EYLI=;
        b=yl+HfHpW3m7DDmD9E5lpCqf8af96i7y0EMI8Wee8xC9n/eaHPvBrBBu02yw4x1DNHY
         DTTmlJigBEkB3H6k/tab7GnwxhXBy0e++6aMfwNNHqFIQ9s0BBIZ4nwvXO7VmyhqX5ij
         hWLIg9v+nYrdyuyUdhaAYPM6fqaWhgKe29bPjszFfSwl2456K+Kt9qFwONVnsVEQSwK2
         cDDPh5UCYlTMsfOU2R/EFVqOZT2AU7FJtO8TPtJJxlXwSV+toizTAnGQUKro9FmTAJwc
         ShAIVfXbWUSwnPtqnqss6WnCPtLn4CUDvC2jz+joF5B9mvIM9Rvo4/rVclBpWGaD4caa
         tCOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XCUEHesE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k30-v6si643428qtd.180.2018.10.10.13.38.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 13:38:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XCUEHesE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59020 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gALFa-0002mf-65
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 16:38:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFQ-0002mO-0O
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 16:38:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFM-0002LG-Nf
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 16:38:23 -0400
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:34683)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1gALFJ-0002J3-Ev; Wed, 10 Oct 2018 16:38:18 -0400
Received: by mail-yw1-xc43.google.com with SMTP id m129-v6so2730744ywc.1;
	Wed, 10 Oct 2018 13:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Gj1Wz3YTSMIBnewLGtsEovmWfmex6XgUSSKzzs6EYLI=;
	b=XCUEHesE34ATCmtapNB1v4JEDXDBOasRVTqhi0zmoGgdju86QvZFcqvxZ4DWUdkk3l
	Pn2N7uNuog5RMCH15L9YbHGmc5VpEz44wmW7RPPEsvgVRu+mnyuyQDMRlLYBXzxLNu5l
	sq7aduCulrsnOKBbEk0Sz1sUu/MNXp2w2FXnwGjdrPFPfcn/SQvPhBdODSEBe49oeiNp
	G7i/CxhwzZEvsnej/KDiRNx8DdrREdE4EMxVdN9wWEJGw6c9MKGhsvQ/IpXPTE2WozRK
	HtPLP3WIsJfh7pBRHvtkfDVf4+WjqT1xCKq4F0vaEpXOrG77AvlFtCUsPQN2PnA82Nae
	diBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Gj1Wz3YTSMIBnewLGtsEovmWfmex6XgUSSKzzs6EYLI=;
	b=HP6MMtg4WRAVpN6bjgImKKW2GA20dHIMSGayAsnHG9Y/YiQvAO30OSCVfSbkCRulW2
	bLhFAnibmzo0vQVtALsoNGef6QFLQN2yHtRHQ0xtf/LRcnIWp2DDvu4Fr1JUMQdu/ByA
	c6ioQEyEc0fTcJS8GbReos5MTDrrtrLJmZNmqi1rtKYCILe+vlICPFR432bNdEcvptiN
	p5kLmrsk9bHU4dpza/r3QFKbNCnKuZZrl/9Or9cSShG0HB+DVHoNHOAmFLG0dYrUWJXr
	UAXGGZlCUSYeKHnSaQUlO1jdvukUKnJl4f6SQkxXNATKk+zQG2ytNdldILbbVlpj487S
	OHhw==
X-Gm-Message-State: ABuFfoj4cJ4xFrdXHhLCEs5csqB6SM3xhni3xQvzIjBTwmacoXRQe0dS
	aWs0w6vNhH/B4c7uNkkXD2ue62S7
X-Received: by 2002:a81:6657:: with SMTP id
	a84-v6mr19047852ywc.311.1539203894523; 
	Wed, 10 Oct 2018 13:38:14 -0700 (PDT)
Received: from quinoa.localdomain ([216.85.170.153])
	by smtp.gmail.com with ESMTPSA id
	u131-v6sm15170728ywf.13.2018.10.10.13.38.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 13:38:13 -0700 (PDT)
From: Aaron Lindsay <aclindsa@gmail.com>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 10 Oct 2018 16:37:21 -0400
Message-Id: <20181010203735.27918-1-aclindsa@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c43
Subject: [Qemu-arm] [PATCH v6 00/14] More fully implement ARM PMUv3
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
Cc: Aaron Lindsay <aclindsa@gmail.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0bX9sjzW/FEO

The ARM PMU implementation currently contains a basic cycle counter, but
it is often useful to gather counts of other events, filter them based
on execution mode, and/or be notified on counter overflow. These patches
flesh out the implementations of various PMU registers including
PM[X]EVCNTR and PM[X]EVTYPER, add a struct definition to represent
arbitrary counter types, implement mode filtering, send interrupts on
counter overflow, and add instruction, cycle, and software increment
events.

Since v5 [1] I have:
* Taken a first pass at addressing migration
* Restructured the list of supported events, and ensured they're all
  initialized 
* Fixed aliasing for PMOVSSET
* Added ARM_CP_IO for PMINTENCLR and PMINTENCLR_EL1
* Addressed a few non-code issues (comment style, patch staging,
  spelling, etc.)

[1] - https://lists.gnu.org/archive/html/qemu-devel/2018-06/msg06830.html

Aaron Lindsay (14):
  target/arm: Mark PMINTENCLR and PMINTENCLR_EL1 accesses as possibly
    doing IO
  target/arm: Mask PMOVSR writes based on supported counters
  migration: Add post_save function to VMStateDescription
  target/arm: Swap PMU values before/after migrations
  target/arm: Reorganize PMCCNTR accesses
  target/arm: Filter cycle counter based on PMCCFILTR_EL0
  target/arm: Allow AArch32 access for PMCCFILTR
  target/arm: Implement PMOVSSET
  target/arm: Add array for supported PMU events, generate PMCEID[01]
  target/arm: Finish implementation of PM[X]EVCNTR and PM[X]EVTYPER
  target/arm: PMU: Add instruction and cycle events
  target/arm: PMU: Set PMCR.N to 4
  target/arm: Implement PMSWINC
  target/arm: Send interrupts on PMU counter overflow

 docs/devel/migration.rst    |   9 +-
 include/migration/vmstate.h |   1 +
 migration/vmstate.c         |  10 +-
 target/arm/cpu.c            |  28 +-
 target/arm/cpu.h            |  68 +++-
 target/arm/cpu64.c          |   2 -
 target/arm/helper.c         | 781 ++++++++++++++++++++++++++++++++----
 target/arm/machine.c        |  19 +
 8 files changed, 817 insertions(+), 101 deletions(-)

-- 
2.19.1

