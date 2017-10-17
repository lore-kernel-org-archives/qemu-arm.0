Received: by 10.223.197.9 with SMTP id q9csp4736060wrf;
        Tue, 17 Oct 2017 08:43:02 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SkIwH2E9U5OiJgVevIeFH0rwTbGXj7YkroHdCsYCJkTJJuB0vWZSc+VYraS+u0mQUnJfjY
X-Received: by 10.55.149.70 with SMTP id x67mr19343451qkd.62.1508254982885;
        Tue, 17 Oct 2017 08:43:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508254982; cv=none;
        d=google.com; s=arc-20160816;
        b=dOCu3U4b4XHQrScS67MeXPrgNFOCTM28PaWHJ7iJsrs5J4wud7OEfZPpOy1TVR07VX
         hw92BlxVlYMs0vRLw8IiWpbCRz1KQT0uxeRYsQMA5qxMfKd9Ym3Hx1AAZeFKteMjFa6g
         aKimHlnqB2LUQn2IHrT+WlGh+hyB47UaU7W8vvyGWEpArFfcHqyr9FGlsMWRlK6170Hj
         D2WfvPUkUlo0VE7UQ0RCVxRiYGijAf8n0SLu9hUDovM/MqOJTAl9igDg1Bv+OLz2WsTO
         jPinvkuEeG3fMmMwl89R/qLrSO8w4ScgjSost22o8wkg1/uXe5wbqyYRthIctAj3EkoG
         QphQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=+ri9JyPtjea3yg/Zr9aAwHj7V5cQYqHwSfYu878D358=;
        b=cg83dYOUsMbeKATr5yi6zYA6Flo9ESYEENSp23a8eXEg+rNiqbMC2uKsID0X3W1aXy
         xu4ZLdH/f4I3P+TjwYU8kG1f5/dUk37mKrXXX8iKJmqRhp71SNY7NHXwXWpHKwna8t+I
         tHA/Gzg1sQGoCudZ3Yg2VjjRYsRbuZYdTj+m6SQ60BlzD2MY9SK8hxMErECZktxyXn/I
         ZB+cXE8k1G7bwbk++uQ9btqjFvhO+ZmOxk8UOTSwA0tJ+FkOEdeKSQW2XQccgwkj1svW
         85vcWNRymiGg+a8ir7SxmucKS13BCkU9fhDqQbQM2zTyGleHmdlrC2MoLuhc2nczuZS8
         xWuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=VonthBb+;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=Nb1dAta+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n16si8933694qtb.48.2017.10.17.08.43.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 08:43:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=VonthBb+;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=Nb1dAta+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40111 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4U1E-0008N1-LQ
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 11:43:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1e4U12-0008KZ-8G
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 11:42:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1e4U0z-0008Vc-J8
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 11:42:48 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:33860)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1e4U0z-0008TE-8W; Tue, 17 Oct 2017 11:42:45 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 0E13A607BA; Tue, 17 Oct 2017 15:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1508254964;
	bh=D3dD0iXAccrAO62Fgsbd3HhdPWupHyT0UpqNOKzK0oM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VonthBb+MUnqGEmHWvHrqbRGZ+mSJ6TM0pIG9SAIskDtTs4gfqpiKMkVFtL88nSN6
	4qONiCd8jlFyWdlbRk1NGOGKBIWScnbXmh8x8dMbjZROmKZj6kL/JkagzyJDFXiAIR
	lQEs6c8Bablf/5COl0bqYk9jutFERGvxL4pnfm24=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id D4DE3607B3;
	Tue, 17 Oct 2017 15:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1508254963;
	bh=D3dD0iXAccrAO62Fgsbd3HhdPWupHyT0UpqNOKzK0oM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nb1dAta+W0BkPrrMtf8AoUzkvmCG0rGYdvBP80cNx4e8WquMwR+J+j12NxD1OxdNx
	90e6LgplddQ4oJH+11r9riJLGu/+MCIAXA/x1SLr6x2zr4l4IWRPUfH0NWpRMVQrt7
	f0SsICa+7gxTsK/H5lA2puglIlZGKLqAqiGzBt3s=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D4DE3607B3
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Tue, 17 Oct 2017 11:42:41 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20171017154240.GF3676@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
	<1506737310-21880-5-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA94pxKuPZZgKOMXyW8xteHTBWz-JM6mGOX-ot6OeBt-tw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA94pxKuPZZgKOMXyW8xteHTBWz-JM6mGOX-ot6OeBt-tw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [PATCH 04/13] target/arm: Mask PMU register writes
 based on PMCR_EL0.N
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
X-TUID: KAoSGpYM7QF6

On Oct 17 14:41, Peter Maydell wrote:
> On 30 September 2017 at 03:08, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > This is in preparation for enabling counters other than PMCCNTR
> >
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > ---
> >  target/arm/helper.c | 24 +++++++++++++++---------
> >  1 file changed, 15 insertions(+), 9 deletions(-)
> >
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index ecf8c55..54070a3 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -30,11 +30,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
> >                                 hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
> >                                 target_ulong *page_size_ptr, uint32_t *fsr,
> >                                 ARMMMUFaultInfo *fi);
> > -
> > -/* Definitions for the PMCCNTR and PMCR registers */
> > -#define PMCRD   0x8
> > -#define PMCRC   0x4
> > -#define PMCRE   0x1
> >  #endif
> >
> >  static int vfp_gdb_get_reg(CPUARMState *env, uint8_t *buf, int reg)
> > @@ -876,6 +871,17 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
> >      REGINFO_SENTINEL
> >  };
> >
> > +/* Definitions for the PMU registers */
> > +#define PMCRN   0xf800
> 
> We usually name this kind of whole-field mask value something like PMCRN_MASK.
> 
> (We also have a FIELD() macro in hw/registerfields.h for defining
> mask/length/shift constants; though it can be a bit verbose in
> the length of the names it uses, so I don't insist on its use
> if you don't like the results. I'm on the fence myself about it.)

Will do.

> > +#define PMCRN_SHIFT 11
> > +#define PMCRD   0x8
> > +#define PMCRC   0x4
> > +#define PMCRE   0x1
> > +
> > +#define PMU_NUM_COUNTERS(env) ((env->cp15.c9_pmcr & PMCRN) >> PMCRN_SHIFT)
> > +/* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
> > +#define PMU_COUNTER_MASK(env) ((1 << 31) | ((1 << PMU_NUM_COUNTERS(env)) - 1))
> > +
> >  static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *ri,
> >                                     bool isread)
> >  {
> > @@ -1060,14 +1066,14 @@ static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >  static void pmcntenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >                              uint64_t value)
> >  {
> > -    value &= (1 << 31);
> > +    value &= (PMU_COUNTER_MASK(env) | (1 << 31));
> 
> PMU_COUNTER_MASK always contains bit 31, so why do we manually OR it in
> again here?

I forgot I'd also included the cycle counter in PMU_COUNTER_MASK... I'll
remove the duplication here and in pmcntenclr_write below.

> >      env->cp15.c9_pmcnten |= value;
> >  }
> >
> >  static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >                               uint64_t value)
> >  {
> > -    value &= (1 << 31);
> > +    value &= (PMU_COUNTER_MASK(env) | (1 << 31));
> >      env->cp15.c9_pmcnten &= ~value;
> >  }
> >
> > @@ -1115,14 +1121,14 @@ static void pmintenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >                               uint64_t value)
> >  {
> >      /* We have no event counters so only the C bit can be changed */
> > -    value &= (1 << 31);
> > +    value &= PMU_COUNTER_MASK(env);
> >      env->cp15.c9_pminten |= value;
> >  }
> >
> >  static void pmintenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >                               uint64_t value)
> >  {
> > -    value &= (1 << 31);
> > +    value &= PMU_COUNTER_MASK(env);
> >      env->cp15.c9_pminten &= ~value;
> >  }
> >
> > --
> > Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.\nQualcomm Technologies, Inc. is a member of the\nCode Aurora Forum, a Linux Foundation Collaborative Project.
> 
> Shouldn't these '\n' in your sig be literal line breaks? :-)

Yes :( ...apparently `git config` doesn't interpret them as I expected.

> thanks
> -- PMM

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
