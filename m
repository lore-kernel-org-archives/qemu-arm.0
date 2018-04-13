Received: by 10.28.71.155 with SMTP id m27csp782180wmi;
        Fri, 13 Apr 2018 06:52:16 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48JHja+M8vab4Tbjzde4VUlGKi2XkR5IRqIQkGeD70IkSFf2LeAoyIy3oO7I8ffGCX/CbGi
X-Received: by 10.200.8.89 with SMTP id x25mr3313250qth.48.1523627536289;
        Fri, 13 Apr 2018 06:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523627536; cv=none;
        d=google.com; s=arc-20160816;
        b=GGWTBifqtClINRIH5EsSpBsRL8qRdqeHWQMVSr1FG6+HzSizuFJwmpTXI6k7UyRrm9
         2dIpHp/r+6omh8N66Evq9yIsOSlkFgXM4y7aHb3EpfuosO0ai/plEW+rFo6BwudoGfUH
         Uv8F4GByDnJnDY8OmbJJzptwL7OCSS5YYW6tb6sIvkXo12ivJ4kopINF85EWIE2oePQQ
         uDN1Sbg7bL88khcobkDo0mzyjWVw75kZCQeYwEsL6EJjIsS6plDD7yQGlDOxCkwbtH4R
         jwwxgeETGadqizvFwKpGrRtDtCJ1+Tr5TkDNUdYHNFTHx35BAf6vefuj46SNr7z/nsCk
         h1rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=aNBVJJWVpFE04Zt3mYfiVCq9exabTouYMCwhexdmjjU=;
        b=fnOAxp62kl7275YPJE86oIQ/erYsgwG6QelkDq0yhYzGITdi3ZvQhMmFwJ7BgTze5l
         +IyJqkNM5l5binnjKJuCxKOzaVOw2rN7tx4hjBKyBGl1FX84JiTz1HXQ/suhrOta9Cqb
         eQHFil+DLM378el+fHUifFyc70jviSNFh9vH6lkgX/WGuKcF5kGdgwnxb0K3D7OAdhGC
         IcoFhcIU6nNstlnzSv2ifNJuPIQhQ1LYe+QN67trRwwO3cbcmHJOMUYj1axLu9HGQ0H5
         mIDF7DbXhmj+H4o3jKpjsYLdPpm19CEGm/lyUdKpBNiZ8FkGvLJ4bITFueCcX0zzZ/QF
         HEYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=DESwvJd/;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=AhdBdX5N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z14si932145qtg.89.2018.04.13.06.52.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 06:52:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=DESwvJd/;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=AhdBdX5N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55220 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6z7f-0003Zh-RZ
	for alex.bennee@linaro.org; Fri, 13 Apr 2018 09:52:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37799)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f6z7Y-0003YR-0W
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:52:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f6z7S-0001XQ-SU
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:52:08 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:44920)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f6z7S-0001Wx-Ht; Fri, 13 Apr 2018 09:52:02 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 29B2A60807; Fri, 13 Apr 2018 13:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523627521;
	bh=bIUtZkFHWXHiBm8+jXeusjvJ+tbCeb+z8X5vFB+aKDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DESwvJd/ELhOsVqKoRh516KYhfdsbYJDFUGRgPFgX04h6Y3oE7oWulW7EHQAKS9S7
	NXxTThCqtQ6Lr1TTBwsZtkj563jrGzRbeyM2KgIikXhr/r5kTyGqdNEbNsN4pVt/r+
	uWFS6MlbcBYSa0xrAgTtqqsgIqmDBhjqIY6N0Xnk=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id D97A4600ED;
	Fri, 13 Apr 2018 13:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523627520;
	bh=bIUtZkFHWXHiBm8+jXeusjvJ+tbCeb+z8X5vFB+aKDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AhdBdX5N89zWBWXxXqlOS1+HLTz/WYO+z5iJ8pHcsUjg2s9/Uz9wEqm2I8p9Il7oG
	63rHeCmRCVObIUxjJaP7i2HzqggJ/ZIt35F27I+SSo1nhCJ80wSsCFbkzfaup99uFO
	JBmmncNpony7nfZsYwLALY5n/R9q2WPK4qo2eyIQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D97A4600ED
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Fri, 13 Apr 2018 09:51:58 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180413135157.GM24561@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-6-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA9Hd5dsfPM=ggepk2MxFJdxHB1uiJzwpDy5628D7JF5ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9Hd5dsfPM=ggepk2MxFJdxHB1uiJzwpDy5628D7JF5ow@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [PATCH v3 05/22] target/arm: Reorganize PMCCNTR read, write,
 sync
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2Ej0UCvnsb95

On Apr 12 17:18, Peter Maydell wrote:
> On 16 March 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > pmccntr_read and pmccntr_write contained duplicate code that was already
> > being handled by pmccntr_sync. Split pmccntr_sync into pmccntr_op_start
> > and pmccntr_op_finish, passing the clock value between the two, to avoid
> > losing time between the two calls.
> >
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > ---
> >  target/arm/helper.c | 101 +++++++++++++++++++++++++++++-----------------------
> >  1 file changed, 56 insertions(+), 45 deletions(-)
> >
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index 5634561..6480b80 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -1000,28 +1000,58 @@ static inline bool arm_ccnt_enabled(CPUARMState *env)
> >
> >      return true;
> >  }
> > -
> > -void pmccntr_sync(CPUARMState *env)
> 
> If you configure your git to use the 'histogram' diff algorithm
> ("git config --global diff.algorithm histogram", or edit ~/.gitconfig
> equivalently), does it make git format-patch make less of a mess
> of this commit ?

No, it doesn't seem to make much of a difference.

> > +/*
> > + * Ensure c15_ccnt is the guest-visible count so that operations such as
> > + * enabling/disabling the counter or filtering, modifying the count itself,
> > + * etc. can be done logically. This is essentially a no-op if the counter is
> > + * not enabled at the time of the call.
> > + *
> > + * The current cycle count is returned so that it can be passed into the paired
> > + * pmccntr_op_finish() call which must follow each call to pmccntr_op_start().
> > + */
> > +uint64_t pmccntr_op_start(CPUARMState *env)
> >  {
> > -    uint64_t temp_ticks;
> > -
> > -    temp_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> > +    uint64_t cycles = 0;
> > +#ifndef CONFIG_USER_ONLY
> > +    cycles = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> >                            ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
> > +#endif
> 
> Is this ifdef necessary? You have a do-nothing version of
> pmccntr_op_start() for CONFIG_USER_ONLY later on, so presumably
> this one is already inside a suitable ifndef.

You're right that it is unnecessary as of this patch. A later patch
removes the surrounding `#ifndef CONFIG_USER_ONLY` when it is no longer
necessary at that level. It would be cleaner to add the #ifndef with
smaller scope at the same time - I'll make that change.  

> Otherwise
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Because I've modified how pmccntr_op_start/finish keep track of the
cycles so that they store the counter values differently for v4, I don't
feel comfortable adding your Reviewed-by. I apologize for the churn.

-Aaron

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
