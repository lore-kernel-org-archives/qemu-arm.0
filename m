Received: by 10.25.77.65 with SMTP id a62csp1614881lfb;
        Tue, 14 Feb 2017 13:51:04 -0800 (PST)
X-Received: by 10.55.23.135 with SMTP id 7mr20625465qkx.125.1487109064542;
        Tue, 14 Feb 2017 13:51:04 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v3si1401956qtc.39.2017.02.14.13.51.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Feb 2017 13:51:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org;
       dkim=fail header.i=@codeaurora.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37363 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cdl01-0006Zz-Rb
	for alex.bennee@linaro.org; Tue, 14 Feb 2017 16:51:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1cdkyg-0005te-E1
	for qemu-devel@nongnu.org; Tue, 14 Feb 2017 16:49:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1cdkyf-0000EI-Dz
	for qemu-devel@nongnu.org; Tue, 14 Feb 2017 16:49:38 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:43866)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1cdkyY-00009R-WA; Tue, 14 Feb 2017 16:49:31 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 8FCCA60D6F; Tue, 14 Feb 2017 21:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1487108967;
	bh=+oKcA/dqX0NSffl86lD3aeqduBwE/Kyd73JdaieObpg=;
	h=Date:From:To:Cc:Subject:From;
	b=EAagXzLAm99FWno5MupHvBsaAQpMkafJp7pwOPZuaPorKisCv1x1FFdgahYKC/rma
	A4pHP7V/jDT47GODhIbdKx6J3E9qrqPrY3nmkTbPW7/d30I2jULlVAaGDzf10sbcJs
	HRJWf8ZkqOm5+RJz1jRYEl8nPMww6dVUjmZr0Ds4=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 8EA9360721;
	Tue, 14 Feb 2017 21:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1487108967;
	bh=+oKcA/dqX0NSffl86lD3aeqduBwE/Kyd73JdaieObpg=;
	h=Date:From:To:Cc:Subject:From;
	b=EAagXzLAm99FWno5MupHvBsaAQpMkafJp7pwOPZuaPorKisCv1x1FFdgahYKC/rma
	A4pHP7V/jDT47GODhIbdKx6J3E9qrqPrY3nmkTbPW7/d30I2jULlVAaGDzf10sbcJs
	HRJWf8ZkqOm5+RJz1jRYEl8nPMww6dVUjmZr0Ds4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8EA9360721
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Tue, 14 Feb 2017 16:49:21 -0500
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-devel@nongnu.org
Message-ID: <20170214214921.GA7958@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-devel] [RFC] Pointers for implementing AArch64 PMU
 instruction counter?
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
Cc: Wei Huang <wei@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, cov@codeaurora.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iW/gUp8e65Az

I am interested in implementing an instruction counter to augment the
ongoing (mostly cycle-counter) PMU work on AArch64. The icount
infrastructure seems like the logical source for the instruction counts,
but I have a couple of implementation-related questions:

1. It looks like cpu_get_icount_raw() can serve as a good source for
directly reading the current instruction count. Does it seem reasonable
to only enable the instruction counter in the PMU when icount is enabled
and are there any caveats I've missed with using icount for this
purpose?

2. Triggering interrupts on overflow seems like it will take more work.
Does it seem reasonable to add a QEMU_CLOCK_VIRTUAL for the PMU so that
tcg_get_icount_limit() will overflow at the appropriate time for the PMU
if an instruction counter overflow interrupt is set? TBH, I'm not sure
how well this would work since the timer code mostly seems to deal with
time (as you might expect), keeping the icount values somewhat hidden
away.

Thanks for any feedback!

-Aaron

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
