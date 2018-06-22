Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1248890wrq;
        Fri, 22 Jun 2018 13:32:48 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIaPSAz81Vka2bLpY/dJQmfRZOyUp+LvQ9IUZHhjsU3vVJZYEN22zIAx2ixxz+ic1SkmHys
X-Received: by 2002:aed:2a3a:: with SMTP id c55-v6mr2869531qtd.183.1529699568624;
        Fri, 22 Jun 2018 13:32:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529699568; cv=none;
        d=google.com; s=arc-20160816;
        b=VNgQS98xyr5i0VfjHefDHr+7dSHXA1jcw09DwxKcVzMHVAmweSLJjTLsLeuCe/g0P2
         4pamQSFrE3VDNQnuymf36X6O8FOwn3twVuUDCjoeeeTF2S7LfS3zsDvfBBlPE8/MBCQH
         qur3JIEOVzERCFVeex1G0VTUYhlM+4mjtdHTM5WB3qQ0r3+eCE31drZ8KhIxdkfrdCY5
         n6JbU6Xhtc3Zz3GEq6ih8w5pYyA303BdbPdL5WrKYRuxFuHH1GSAyhtmFUbUenvBRIrW
         1RKiv3KJEwvC/9MHknC+/Xv2uZK9yCDsU60F1YwJEBVyLEiW96kmY01t5SX/6bahhrMm
         kNDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=4ijJtVpbI2m1LXF6NnQeTOhx91gFovhIx2T7+G6StgY=;
        b=SzrLcdkTSoEA0MzLhJQ0CopAPoWfcP6MkG3azOYnea4HHUYg32PrGw8d4p3bZk7WaD
         64P/LoRjZ16KkDHp9Wxm5HXmBBqbt5RJ3Vd/R3roFmGPlVZQIpiq67/7DPK+FLk9ATyL
         KfamLkMfOCEvG+X9an6D/WZpQxK4kUJu4kzOTkDVR3ZXuAvxJlikEIo0clNw0yEk+RUa
         JPfc311Ok2UeYPr9mCtGNq87xZn5iuQr3bxL3hMBB1NyiqQeLf/TS1VBxDnCmE1veykH
         UTgoTMGTe2LvH3cVoUgi7wFwaEOGEwctPyZ5Mbb1rAFcMALGgtjuuGJV7D+2Hhh+a1Bt
         zEAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=CiFDi0sK;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=ThXVp9eM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x74-v6si2215447qkx.159.2018.06.22.13.32.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 13:32:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=CiFDi0sK;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=ThXVp9eM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36061 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWSjg-00024Z-2n
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 16:32:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSjX-00024R-OZ
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:32:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSjU-0005Oz-KG
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:32:39 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45068)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1fWSjU-0005Or-AW; Fri, 22 Jun 2018 16:32:36 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 1266860B10; Fri, 22 Jun 2018 20:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699555;
	bh=iBYBnwukDBENrYza4ghDRPqAV884e9ucgGQpRnrJE9s=;
	h=From:To:Cc:Subject:Date:From;
	b=CiFDi0sKDrJtliuNTySR/C5KNneNguQRWkqBzhKiE+eqkM8n5JIBKHTFt8IWb3eUV
	qNxx1LdQqj21H4Ag53FppQZDaTfM8FaIuYnDqcgNVq9Dj7tl5CWvymtPWSDILsGFLE
	SILTFcvV0/IPg5p3FlmKOnd2MvV6ejlVhOYlG/4o=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 6EC6160588;
	Fri, 22 Jun 2018 20:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699554;
	bh=iBYBnwukDBENrYza4ghDRPqAV884e9ucgGQpRnrJE9s=;
	h=From:To:Cc:Subject:Date:From;
	b=ThXVp9eMSZxWtjKD0xUBuwDYBlhDspTC4U1dkIm+MlyxPZHi4zfNJD1qoQHS5fxgy
	m8YfyWLTjBHZtWcKDvTKrE4957BgshpMIRigeNm+dTzlO6SPMuSG3AOTu5rbhSj6tI
	yMdse+Oec79LO42PIwZr1Sjg4jTDZoTBXGXs6uxc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6EC6160588
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 22 Jun 2018 16:32:14 -0400
Message-Id: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v5 00/13] More fully implement ARM PMUv3
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>, Aaron Lindsay <aclindsa@gmail.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yZ//yvf3uLBm

The ARM PMU implementation currently contains a basic cycle counter, but it is
often useful to gather counts of other events and filter them based on
execution mode. These patches flesh out the implementations of various PMU
registers including PM[X]EVCNTR and PM[X]EVTYPER, add a struct definition to
represent arbitrary counter types, implement mode filtering, send interrupts on
counter overflow, and add instruction, cycle, and software increment events.

Since v4 I've added improved V7VE handling with Peter's direction, fixed up a
few patch staging issues, and fixed a bug causing cycle counter overflow to be
checked every instruction.

-Aaron

Aaron Lindsay (13):
  target/arm: Reorganize PMCCNTR accesses
  target/arm: Filter cycle counter based on PMCCFILTR_EL0
  target/arm: Allow AArch32 access for PMCCFILTR
  target/arm: Add ARM_FEATURE_V7VE for v7 Virtualization Extensions
  target/arm: Remove redundant DIV detection for KVM
  target/arm: Implement PMOVSSET
  target/arm: Add array for supported PMU events, generate PMCEID[01]
  target/arm: Finish implementation of PM[X]EVCNTR and PM[X]EVTYPER
  target/arm: PMU: Add instruction and cycle events
  target/arm: PMU: Set PMCR.N to 4
  target/arm: Implement PMSWINC
  target/arm: Mark PMINTENSET accesses as possibly doing IO
  target/arm: Send interrupts on PMU counter overflow

 target/arm/cpu.c    |  49 +++-
 target/arm/cpu.h    |  71 +++++-
 target/arm/cpu64.c  |   2 -
 target/arm/helper.c | 702 +++++++++++++++++++++++++++++++++++++++++++++-------
 target/arm/kvm32.c  |  27 +-
 5 files changed, 720 insertions(+), 131 deletions(-)

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

