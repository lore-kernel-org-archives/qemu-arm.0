Received: by 10.223.197.9 with SMTP id q9csp4691074wrf;
        Tue, 17 Oct 2017 08:00:24 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QD1DRNVDImy+xOmEbjDSI2S+VHU9DG7fjfRDYu++W9Ui4umkCthnw6Zjy9Kk7JEDdYG4y2T
X-Received: by 10.200.53.34 with SMTP id y31mr20449838qtb.206.1508252424666;
        Tue, 17 Oct 2017 08:00:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508252424; cv=none;
        d=google.com; s=arc-20160816;
        b=dCfxck4Rug0Jz8Wev9k7bzKGUpx6pb5FyIlNXqkt50iae+EYcNpLdOWeelsAgcCPZu
         CQEe9v9v/9J5jVc3oPMAXNttHfAdQG8WDDvBg28WfgGWbSyIbW2BcODPZQSL7Rxpey0A
         dsd1GwxZT73L0rR/RZTdi1D7YbWrCzEZ1bO1bagP2u2Tw7Yqizt1DkNyvSJ+f+YbvmpK
         /0YL6bnZDKp5vBEPsBb82VJI7z+ZSrhvWg2j2RHSb5suk98UFe96i0K8l+SxdDdbygEi
         YCacas/HqiiLnVpY3xP0Z+CnL+0di6EAaHNhEVrWyHvzUrbJ6SYkKBPa+x17sZl4dFOU
         N86g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=HO4nz2VoatEpYjSZig/VzVa6aQXnUWRCdoJfrpV5kVY=;
        b=R0h6UFObI09qmMcw1xhXdQgNaPW62MbugcUOQGdUGZGSIeviViTsISuskxcRCqL9WM
         hSgAwK0fkgw0bPqzr+XfcV+/MT9zLK0I382WEpD2HJ+raj9oyW64T+YI/VToAd1qErq5
         QnxuYCseX6Zg23dV3+H0QbPL/8fZrpXBG7IkrMdp0BSCioKqKnDmvK7RKc6lPAsAgEYz
         TlPABnUaYAJTF9QSqiM5h1h+VsT+xqAdUTO1na4Omt6QdAOWs4YUxZfnW7b9hHeIFjrE
         +qESqmA3E3P5K9ambT73k8uShjt0tgcVwnA8mm77cHqO2J4X8cYQ06nUVIAYfrqHpx/t
         KgUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=KDbw4072;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=Tnx+FUwC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 54si1287053qto.365.2017.10.17.08.00.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 08:00:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=KDbw4072;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=Tnx+FUwC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39964 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4TLy-0004JE-CV
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 11:00:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44539)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1e4TLT-0003vr-L4
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 10:59:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1e4TLO-0000w9-Pb
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 10:59:51 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48758)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1e4TLO-0000v2-FN; Tue, 17 Oct 2017 10:59:46 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 7C907608CC; Tue, 17 Oct 2017 14:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1508252383;
	bh=sHuasZUIcruc4G46gtF8zm2HLqlPChD5Fgy99gOl1O0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KDbw40721veOFDjmVjWkrujjlvMragmndebc+1c5Le0YsZZq71UWujycWlpVpqqEi
	RS08yx+uv8kqLT9PmiRNJ8/6MtstRONE1nwS3ZV5Cuo2U97Lb5wqeA8Od4wHRmWxtL
	7uI+L9rb55nVIVdTnmoEgDzi1b57rs4dnAU5u2YQ=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 0B99E6087A;
	Tue, 17 Oct 2017 14:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1508252382;
	bh=sHuasZUIcruc4G46gtF8zm2HLqlPChD5Fgy99gOl1O0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tnx+FUwC+r/rdYWgSiT39PQMPCeXFwY3eJVHrM2kRe4o5o2D/ZI+BSTuWuXa32yow
	lSW0pgsavcW3d+4QaZ3z9Kb4hCT8z34ZncXaYNdu3DnXl20qgenegupu4D48f+LkwJ
	FGtPTumIGmYlQ/0k+No5zwYWLsQAMldjzVVG7Awg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0B99E6087A
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Tue, 17 Oct 2017 10:59:40 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20171017145940.GD3676@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
	<1506737310-21880-3-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA_zwAu4Zt0-2Qy9euBzYQgD19EnnoWwa+ZNzidWwkmEcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_zwAu4Zt0-2Qy9euBzYQgD19EnnoWwa+ZNzidWwkmEcA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [PATCH 02/13] target/arm: Check PMCNTEN for whether
 PMCCNTR is enabled
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
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PWsBU9C0Y59G

On Oct 17 13:49, Peter Maydell wrote:
> On 30 September 2017 at 03:08, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > ---
> >  target/arm/helper.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index 8be78ea..40c9273 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -964,7 +964,7 @@ static inline bool arm_ccnt_enabled(CPUARMState *env)
> >  {
> >      /* This does not support checking PMCCFILTR_EL0 register */
> >
> > -    if (!(env->cp15.c9_pmcr & PMCRE)) {
> > +    if (!(env->cp15.c9_pmcr & PMCRE) || !(env->cp15.c9_pmcnten & (1 << 31))) {
> >          return false;
> >      }
> >
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> I keep replying to your v1 patchset by mistake -- can you use
> the git format-patch options to put make the subject prefix
> be "[PATCH v3]" for the next round in all the patchmails to
> help keep the versions distinct, please?

Yes, and I apologize for the nuisance. Also, thanks - I didn't know
about the `-v, --reroll-count` option and must have gotten distracted
between updating the subject to be 'v2' for the cover letter and the patches.

-Aaron

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
