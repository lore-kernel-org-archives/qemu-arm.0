Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1252215wrq;
        Fri, 22 Jun 2018 13:37:31 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL+qVDFqUv5ryy0ouH3p3QAAavEZ1DRVyCN214ThMPDYpuq0eiRYKmV4jW/zUau8lOAgggL
X-Received: by 2002:ac8:2ee9:: with SMTP id i38-v6mr2738648qta.159.1529699851381;
        Fri, 22 Jun 2018 13:37:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529699851; cv=none;
        d=google.com; s=arc-20160816;
        b=N0z2SYbdMJE4RxzZbz5eo5DxNoClBmUCKe4q1HeBbk9gHfE/ZZh1+sAans4AoPySxB
         E9Qn81PHcEgKpdZoSLhz6+WFQJhgjNGgQ93lHovLFNtUcNXQhFSrQpFkXc38tLbOH0Ml
         DSPcGR8WlWFCVCjbmEqorZDGF6DSVjXX+mjzI3RkL2tmNdZBXMFixVXKHxQMA8jhcsGp
         KVwiViVIWuLcgkpk9BwsFg3ZrKrrgs07ltFWEC13RsmHJM+sERidbfUZeuCatg9gVXkv
         yPPKX97gvPUMFP5jVDfUJyyacpBhNny0zssL1DrWsDq7BpowEIesHQXPiWezcI2JhC+5
         W/+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=oT4q7PquR5I7+g74KahK90OJbuGEuGpyA/tmdSvMb4s=;
        b=GhDFsRr3pgxd4RpweLHcocn/3lYjpyKpK0ZYbXbkdw81uBBOJma/ztqk+dx9ZUF2XZ
         s5Eolsl5y466hV8WVCE8nw1naL4Ec5kry40h6j1RMwqiIx9JqLpLPVI4qJLG7tRNzIVS
         XlhhfhofoD3wvQ33GZZWYYl2qo68gkUPXBUQZlatrj89uBcxidPAbi+ZBzEMtWySMWFR
         w4aV16TY6q2sd4WZwDqfX9iZfngJzaWmiz17z7yobRMAjRhD61g+XEbEeRDTWBfW8Wxa
         4ukvOe6GoYVoPpeRiAhYdIYoUlYnsIcuvFF72P03hGWvC+vdrdxCrZonJDjk9RG37/n5
         m1BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=irHPA5wX;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=mmphuGvw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o187-v6si31158qkf.285.2018.06.22.13.37.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 13:37:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=irHPA5wX;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=mmphuGvw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36100 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWSoE-0005vG-Sm
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 16:37:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSjh-0002F7-Iq
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:32:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSjg-0005US-Hk
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:32:49 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45846)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1fWSjg-0005UG-8J; Fri, 22 Jun 2018 16:32:48 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 30FEC60B1A; Fri, 22 Jun 2018 20:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699567;
	bh=8hIkBpvHzjiGfA5zv7NQ2//Yuxlrlreakg9D0D0zv+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=irHPA5wXa/boTuujz0Qhfz/lJjvsI5ifNdX480uCun63uKOyfUaVBZ7ZUa/njmCZS
	P9to+EeugYMuUhmoov6G+ElOgcghL6f/pxPPqnMHQHs3XUxNqu4OdwVV8zwfdKRyXn
	S4/GIAKcbiTuCaYf+NIRhPmecnZuMFj1yBQzmgAg=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 512A060B14;
	Fri, 22 Jun 2018 20:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699566;
	bh=8hIkBpvHzjiGfA5zv7NQ2//Yuxlrlreakg9D0D0zv+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mmphuGvw0ACr9juwVgr50lDLUppE4voJVJ3b8bBILOEcB0hLh7u9Nsvh15PTU/jIq
	n2Hy1OohJ6Ci5ZjMIHVRx/ijZ1YGPlq3w0zQylaeae/yaieJqZs6BUFVUKbRuTylg+
	8vTdigMUDanS3EgXDO70KFE0C1q0Qyb9LThMaQDc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 512A060B14
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 22 Jun 2018 16:32:24 -0400
Message-Id: <1529699547-17044-11-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v5 10/13] target/arm: PMU: Set PMCR.N to 4
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
X-TUID: R3UEKv1TFJCl

This both advertises that we support four counters and adds them to the
implementation because the PMU_NUM_COUNTERS macro reads this value from
the PMCR.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 92ebd21..3720239 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1618,7 +1618,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .access = PL1_W, .type = ARM_CP_NOP },
     /* Performance monitors are implementation defined in v7,
      * but with an ARM recommended set of registers, which we
-     * follow (although we don't actually implement any counters)
+     * follow.
      *
      * Performance registers fall into three categories:
      *  (a) always UNDEF in PL0, RW in PL1 (PMINTENSET, PMINTENCLR)
@@ -5234,7 +5234,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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

