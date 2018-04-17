Received: by 10.28.4.212 with SMTP id 203csp4263000wme;
        Tue, 17 Apr 2018 13:55:51 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48y4cDwTVwQhIxzV8E0CqaYt7i2vpWqGDdBGvStML6lZo1BgV+p+Nc+0HsD0g/av/E9ogBA
X-Received: by 10.55.102.75 with SMTP id a72mr3585263qkc.218.1523998550948;
        Tue, 17 Apr 2018 13:55:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523998550; cv=none;
        d=google.com; s=arc-20160816;
        b=I+ojjo85M8lBkixJvApvo2M49u4pl0hSFQsERN8cgrGyN3qpuzuJV9hw4t247uspJV
         dnfTCD0RS8JhK1FPFBszJpWGhe7zpN3q2N/BwugfdMXbPBHuUa84Ep68BN2DEtQJXeA8
         ws4qkLMLP63f1qbRLYH2yRk5N8sIJwVKb8T8O6zly5N/+llng6sTmRZC2IFRX1fe2QS6
         xNG9Mv1EBk8+97zfC7UTnVwxcEN7CG2Ru/APXQdqDpkOKXX8lSSPHLXfylxcL1CA+bzf
         pAHUdH+Cx5oMGIE8fzisCWoIASPXixGuVVbtwKWbFCdd6MbLVM8ohpcSZbaCoAW1xCt2
         /zYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=jEkDpaz5/DwJWjRODPNCWzDJn2ttG++wh6AZW/F4L6c=;
        b=p5c1h19SL4Wr05Dj+W9qzaizuiohCvuf71icRgL/FZ8quTQKFPphShYh7tbbrBZ5GK
         rz/jRQf9pDK0USegLaFHVC/vp8r3Uh7A2JSy3nMZels1RBTcVgMYvRY8+PdQHskb4Cm0
         InbbstP4VzTP9lCXlM7Z7177YaQgEMweG2pv1mSEYMfEBB/AG+e2E8zn6BIuz3mYEbYb
         4H0WIOuBxGBG0AJBZa+pZ/4uFno3/xsZDBWz77WO5W+qWdQxwIB3vOdqPAlmER1RQVwk
         Ri1/QChGKMaIljoEm0TeZdraFCK2eYx73u84d99aRM0NJhZRRs0db7xjSE6mWZz44n+U
         LYSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=PwnmfpKI;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=aHt/9584;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q30si6364365qtg.61.2018.04.17.13.55.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 13:55:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=PwnmfpKI;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=aHt/9584;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33540 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8Xdm-0008TW-Ca
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 16:55:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNj-00038h-Ay
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNh-00071p-Hi
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:15 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:40352)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8XNh-0006rJ-1z; Tue, 17 Apr 2018 16:39:13 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 9CF3060FFA; Tue, 17 Apr 2018 20:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997551;
	bh=Nv7Qybaw0WMEg3i8AzOdmQOOF/a6g/QmST/S3HGUFus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PwnmfpKImNMb/1dTBVEZG9F4ae0HMKrC87DfbGbcSZRR5Avyzik9whTXlIqSRziM1
	zFjL3ldohHAkIAux+Ziy2PKoOass+88vlbI3N6Lh4+L04AMtSldSSJAqbxBaKo6ykX
	qKF24Ga47ywGHvXeW4Wpy3mx2VTXMrEorZolWSP0=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 125E061137;
	Tue, 17 Apr 2018 20:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997548;
	bh=Nv7Qybaw0WMEg3i8AzOdmQOOF/a6g/QmST/S3HGUFus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aHt/9584RDM93j1x3gpxwIawRe1K8u7S69Bu1jUuEnh72XTWpr1EShkGOc2iQXoYS
	Yr6gol0VufPnIQ7m95+HvqPWZRiYUVdfEOeQsWMzQ81EdfSMzVCpWE4jGprkR78lR3
	zv2lmzTFAYBtMkVM4clqpd4vykCgMgiVrNUiBSys=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 125E061137
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 17 Apr 2018 16:38:02 -0400
Message-Id: <1523997485-1905-19-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v4 18/21] target/arm: PMU: Set PMCR.N to 4
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
X-TUID: ithN0J7tB//9

This both advertises that we support four counters and adds them to the
implementation because the PMU_NUM_COUNTERS macro reads this value from
the PMCR.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b91f022..7970129 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1587,7 +1587,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .access = PL1_W, .type = ARM_CP_NOP },
     /* Performance monitors are implementation defined in v7,
      * but with an ARM recommended set of registers, which we
-     * follow (although we don't actually implement any counters)
+     * follow.
      *
      * Performance registers fall into three categories:
      *  (a) always UNDEF in PL0, RW in PL1 (PMINTENSET, PMINTENCLR)
@@ -5205,7 +5205,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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

