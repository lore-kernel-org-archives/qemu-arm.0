Received: by 10.28.71.155 with SMTP id m27csp2139172wmi;
        Thu, 12 Apr 2018 10:02:02 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/+HyzhSZNZMW16bv2gXp58TgYGnVVmzsTG+lvPEF7JU2s1grW7VVrIgQpn4UhprJ5zUQ5a
X-Received: by 10.55.73.138 with SMTP id w132mr2300223qka.62.1523552522864;
        Thu, 12 Apr 2018 10:02:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523552522; cv=none;
        d=google.com; s=arc-20160816;
        b=iMTxXz05WutwZrwY6Ji4q6MsGsDXIspbQM79VJvCTZAhyeJFug647sFdvme/gAjNfn
         5pu55EWLdAEyiFnAroN9lMf6leBTPvDPjR/8CyFHsOjdrPUQyocqtVAnQw1hCzCbdEFk
         b0oelilzOsk7sPnIx82xIGtMgflXk5YGEp3PhfUcLxqoyOnCZ83h0KRH5Qrp/wAPfL2G
         EYsllpxLfQDdnGNEARyI7RRs1coRUlpz5WM7fhUolqUJgQkpD7oqMNX7USSbYQX8jElB
         xqSc68UVQaQNojgHNV1MktCIkLduNFyffwGA9x/7rwwfnP8kID1ma/crr72OLhnxZEHM
         io3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=TwOuFR3+2lL4WHYaHMPGr0g6oNBEMWQdMx1IgWQ6Ywg=;
        b=B2T4hfJC0fPAwp6n/+ghVgJYCkj18GlX6s5s86xqDlv2Fti2yjLs4tSyyvjE9uZbV6
         iaKlxdMmaIjFBipnceGOF/jjDQTl/v0ZGq0P+GjfGYeydjmLZWb7nHc9ve9NBgS+po8O
         qsXP+VeXzAOz/QMXSVQbTzlgsBzEJLvWsgsyZrcE/wcCAdq4vJjUc6oiGEEupWcsR0ng
         2SQ7rk3fRP0p2Tik1iaUOxIuEfo6iZ17w7wbT6gZNkt315g8LdUBcg3Yj/3LGQ98Roth
         YsWeNmodNGLcZfTQwJi8gDfAcBSMXtcUfAjjBrDuy+RpJVmaJiNUepVGBmJIbjZ8tye+
         RaTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=DWpnSkPs;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=Y6kOGBX0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v187si173430qkd.302.2018.04.12.10.02.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 10:02:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=DWpnSkPs;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=Y6kOGBX0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55117 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6fbm-0004kO-Ed
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 13:02:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f6fba-0004iL-FQ
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:01:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f6fbV-0006Yl-Gx
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:01:50 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35112)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f6fbV-0006Y1-84; Thu, 12 Apr 2018 13:01:45 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id D5CBB60AFB; Thu, 12 Apr 2018 17:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523552503;
	bh=SgvLiq12UE6ZmCZ1kcPA6+pgxr/hCIAfNPWpCSWaJCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DWpnSkPsUPRAWtT8E/IsWKAYjZbS1eWkAU3ewS+KMOX5p+npDv6ifOwvYqnZoVVFI
	w6jryuj++xruQH9wAwZNuZbfTXfBX33xdrRhV2oRQ1e0PloiEniqmLEcfXwYxQ6skT
	zdpM3nzACw8M+/itmV4CjgkQR02vIUacPUE+FOzM=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id AF49E607A2;
	Thu, 12 Apr 2018 17:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523552502;
	bh=SgvLiq12UE6ZmCZ1kcPA6+pgxr/hCIAfNPWpCSWaJCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y6kOGBX0kf0pGiDeq/6LtThQr6UehLxvl1h7NlSpbtZDZMH2Imxx7XkmAm4ac6+mp
	Hkk0gfmaXplV79Om5u1ekJEbjQFxP6uwlHufPHUgoTPZmr8eiG11wV6YaB+t3gvk/O
	x37W+dNEMlhtXBxBOXyMfnRJXE3q+h8tEa2Ki568=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AF49E607A2
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Thu, 12 Apr 2018 13:01:39 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180412170139.GH24561@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-10-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA9UpNW8q+vBKDskhAMVxHh4QUOJ5diP8AR6mpMRk+enBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9UpNW8q+vBKDskhAMVxHh4QUOJ5diP8AR6mpMRk+enBQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [PATCH v3 09/22] target/arm: Add pre-EL change hooks
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
X-TUID: H3skjI2vRelG

On Apr 12 17:49, Peter Maydell wrote:
> On 16 March 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > Because the design of the PMU requires that the counter values be
> > converted between their delta and guest-visible forms for mode
> > filtering, an additional hook which occurs before the EL is changed is
> > necessary.
> >
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > ---
> >  target/arm/cpu.c       | 13 +++++++++++++
> >  target/arm/cpu.h       | 12 ++++++++----
> >  target/arm/helper.c    | 14 ++++++++------
> >  target/arm/internals.h |  7 +++++++
> >  target/arm/op_helper.c |  8 ++++++++
> >  5 files changed, 44 insertions(+), 10 deletions(-)
> >
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 5f782bf..a2cb21e 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -55,6 +55,18 @@ static bool arm_cpu_has_work(CPUState *cs)
> >           | CPU_INTERRUPT_EXITTB);
> >  }
> >
> > +void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
> > +                                 void *opaque)
> > +{
> > +    ARMELChangeHook *entry;
> > +    entry = g_malloc0(sizeof (*entry));
> 
> g_new0().
> 
> > +
> > +    entry->hook = hook;
> > +    entry->opaque = opaque;
> > +
> > +    QLIST_INSERT_HEAD(&cpu->pre_el_change_hooks, entry, node);
> > +}
> > +
> >  void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
> >                                   void *opaque)
> >  {
> > @@ -747,6 +759,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
> >          return;
> >      }
> >
> > +    QLIST_INIT(&cpu->pre_el_change_hooks);
> >      QLIST_INIT(&cpu->el_change_hooks);
> >
> >      /* Some features automatically imply others: */
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 3b45d3d..b0ef727 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -832,6 +832,7 @@ struct ARMCPU {
> >       */
> >      bool cfgend;
> >
> > +    QLIST_HEAD(, ARMELChangeHook) pre_el_change_hooks;
> >      QLIST_HEAD(, ARMELChangeHook) el_change_hooks;
> >
> >      int32_t node_id; /* NUMA node this CPU belongs to */
> > @@ -2895,12 +2896,15 @@ static inline AddressSpace *arm_addressspace(CPUState *cs, MemTxAttrs attrs)
> >  #endif
> >
> >  /**
> > + * arm_register_pre_el_change_hook:
> >   * arm_register_el_change_hook:
> > - * Register a hook function which will be called back whenever this
> > - * CPU changes exception level or mode. The hook function will be
> > - * passed a pointer to the ARMCPU and the opaque data pointer passed
> > - * to this function when the hook was registered.
> > + * Register a hook function which will be called back before or after this CPU
> > + * changes exception level or mode. The hook function will be passed a pointer
> > + * to the ARMCPU and the opaque data pointer passed to this function when the
> > + * hook was registered.
> >   */
> 
> I would just have one doc comment for each function, rather than
> trying to share. (Some day we may actually autogenerate HTML docs
> from these comments...)
> 
> Do we make the guarantee that if we call the pre-change hook
> then we will definitely subsequently call the post-change hook?
> (ie does the PMU hook rely on that?)

Yes, the PMU relies on the pre- and post- hooks being called in pairs
since they drive the state machine of sorts that exists in the variables
holding the counter values/deltas. And unless I've really screwed up the
implementation, I believe the change hooks in my patchset make that
guarantee.

-Aaron

> 
> Otherwise looks OK.
> 
> thanks
> -- PMM

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
