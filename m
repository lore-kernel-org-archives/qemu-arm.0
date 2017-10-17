Received: by 10.223.197.9 with SMTP id q9csp4760960wrf;
        Tue, 17 Oct 2017 09:06:38 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TJ/IQiAjhR+VHeWOlfOI7W2wB4Cj7R45RpBDicEPdcYuCF4xPkxF7MHk6IZz/PFwr7MMWz
X-Received: by 10.55.148.133 with SMTP id w127mr1599623qkd.354.1508256398638;
        Tue, 17 Oct 2017 09:06:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508256398; cv=none;
        d=google.com; s=arc-20160816;
        b=mEBCadnno7TnV5232EexvHEg0V3ty9KaUNtr1cgoORN8qbH40OF52XKdG6L01hXvvV
         8XkVf3cCiA/0QbvBrLypZ3COWcIuogOfT0WtBtcYXVqdygU4Tbb4bbVVZhyTBbBAwta7
         lvFo551oQq1On10+aJBWmwnLQIt+XxsdiP5R+99zMbGk53P8STUuw1BKJui5u3x39CGm
         FVuTW6siLIq0BOB6nTWP7DcZE5nu8pUHLeezgcxJa0uIDdStYHPfS8ilsQF6wRe6LIJd
         WXYKOoIW0AHQ+SFQDmqQf0eOfV3Yu0PPNZE1/fXMlwWCkEKpqcZjW7wq4jFFI69tLmXP
         Bq8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=wm3O3rDCvKRDm/ELNQwlB/lcXqWCpgtzm0GUSSs/C1w=;
        b=aqX8Fw/1ZQwurHPjDd+M3Cij2N2mdohL7h5UR1WcKIneZO78e1iSYPNz6QwugHXxyj
         Qyy1XScQee/9l0N5//wSr7wCs8fnYU/7nFxzghQBz20rKWSMilIgJFaLci3m0dLObg9A
         cwzsBmpqHH5QU9VeL9ywpOS8cQNDgxTutwDVvutWtHjxxYzVaOTag05QmjISUN9wr30E
         c6Nrbn53ajqn9++HEcDPAruCpdNCoxPwIv5y/c55v56kWj1oMfeNCGcH2QURK/bLFQoU
         GDxZL1MhydNzSsM4VKdPBVczITKkDT7QmDHRZ3aV6kS889m0EWY2qD5aatQeNvLAe9jy
         61Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=JVvAjgWo;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=JVvAjgWo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f7si1339528qte.316.2017.10.17.09.06.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 09:06:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=JVvAjgWo;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=JVvAjgWo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4UO3-00060d-S9
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 12:06:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1e4UJy-00037b-Lf
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 12:02:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1e4UJs-0002Oa-Ew
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 12:02:22 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:44322)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1e4UJs-0002Mz-5X; Tue, 17 Oct 2017 12:02:16 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id E5A5D607EA; Tue, 17 Oct 2017 16:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1508256134;
	bh=7HUVKm6CmHk3al+um7DAMzn7Est3fHHAVC4Pu3bMzqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JVvAjgWoKmQ/eIlJHl2GsMElFrAime6+IZpo2SCIO22kTXAE0fK2QYfmAi0kpxLz3
	0Y8igzeCZDjxfJ+Hj3qxOtKiSWhmGcLisTP0jPodmbRQP/17dmaYGxFqYCgMv+FaYc
	9vE1P7lTtyOiRVuiN+SWEU6/B+NVUs8CQjORYuu0=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 559536025D;
	Tue, 17 Oct 2017 16:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1508256134;
	bh=7HUVKm6CmHk3al+um7DAMzn7Est3fHHAVC4Pu3bMzqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JVvAjgWoKmQ/eIlJHl2GsMElFrAime6+IZpo2SCIO22kTXAE0fK2QYfmAi0kpxLz3
	0Y8igzeCZDjxfJ+Hj3qxOtKiSWhmGcLisTP0jPodmbRQP/17dmaYGxFqYCgMv+FaYc
	9vE1P7lTtyOiRVuiN+SWEU6/B+NVUs8CQjORYuu0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 559536025D
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Tue, 17 Oct 2017 12:02:06 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20171017160206.GA22177@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
	<1506737310-21880-8-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA_1J2xZpnv9dNBeSH5ZvMvBujp3XHPK1SfypjFMU1OBSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_1J2xZpnv9dNBeSH5ZvMvBujp3XHPK1SfypjFMU1OBSg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [PATCH 07/13] target/arm: Implement PMOVSSET
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
X-TUID: ujsRuRN7NqWc

On Oct 17 15:19, Peter Maydell wrote:
> On 30 September 2017 at 03:08, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > Also modify it to be stored as a uint64_t
> >
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > ---
> >  target/arm/cpu.h    |  2 +-
> >  target/arm/helper.c | 27 ++++++++++++++++++++++++---
> >  2 files changed, 25 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 811b1fe..365a809 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -325,7 +325,7 @@ typedef struct CPUARMState {
> >          uint32_t c9_data;
> >          uint64_t c9_pmcr; /* performance monitor control register */
> >          uint64_t c9_pmcnten; /* perf monitor counter enables */
> > -        uint32_t c9_pmovsr; /* perf monitor overflow status */
> > +        uint64_t c9_pmovsr; /* perf monitor overflow status */
> 
> This is a bug fix, so it should go in its own patch. Specifically,
> we already have an AArch64 sysreg PMOVSCLR_EL0 which has
>       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
> so we should have made the CPUARMState field 64 bits when we
> added it. (I think without this bugfix reads of the AArch64
> reg will return data from the adjoining field in the struct.)

Okay, I'll split it off in v3.

> 
> >          uint32_t c9_pmuserenr; /* perf monitor user enable */
> >          uint64_t c9_pmselr; /* perf monitor counter selection register */
> >          uint64_t c9_pminten; /* perf monitor interrupt enables */
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index 74e90c5..3932ac0 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -1150,9 +1150,17 @@ static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >  static void pmovsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >                           uint64_t value)
> >  {
> > +    value &= PMU_COUNTER_MASK(env);
> >      env->cp15.c9_pmovsr &= ~value;
> >  }
> >
> > +static void pmovsset_write(CPUARMState *env, const ARMCPRegInfo *ri,
> > +                         uint64_t value)
> > +{
> > +    value &= PMU_COUNTER_MASK(env);
> > +    env->cp15.c9_pmovsr |= value;
> > +}
> > +
> >  static void pmxevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >                               uint64_t value)
> >  {
> > @@ -1317,10 +1325,10 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
> >        .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcnten),
> >        .writefn = pmcntenclr_write },
> >      { .name = "PMOVSR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 3,
> > -      .access = PL0_RW, .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
> > -      .accessfn = pmreg_access,
> > +      .access = PL0_RW, .accessfn = pmreg_access,
> > +      .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmovsr),
> 
> Is this just reshuffling the order of .field initializers?

Also updated offsetof -> offsetoflow32. IIRC, I shuffled the order to
match that of the surrounding registers and to appease my sense of
order. Would you prefer that I don't shuffle them, or split that off as
a separate patch?

> >        .writefn = pmovsr_write,
> > -      .raw_writefn = raw_write },
> > +      .raw_writefn = raw_write, .resetvalue = 0 },
> 
> .resetvalue 0 is the default, but it doesn't hurt to specify it
> explicitly I guess.
> 
> >      { .name = "PMOVSCLR_EL0", .state = ARM_CP_STATE_AA64,
> >        .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 3,
> >        .access = PL0_RW, .accessfn = pmreg_access,
> > @@ -1328,6 +1336,19 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
> >        .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
> >        .writefn = pmovsr_write,
> >        .raw_writefn = raw_write },
> > +    { .name = "PMOVSSET", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 3,
> > +      .access = PL0_RW, .accessfn = pmreg_access,
> > +      .type = ARM_CP_ALIAS,
> > +      .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmovsr),
> > +      .writefn = pmovsset_write,
> > +      .raw_writefn = raw_write },
> > +    { .name = "PMOVSSET_EL0", .state = ARM_CP_STATE_AA64,
> > +      .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 14, .opc2 = 3,
> > +      .access = PL0_RW, .accessfn = pmreg_access,
> > +      .type = ARM_CP_ALIAS,
> > +      .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
> > +      .writefn = pmovsset_write,
> > +      .raw_writefn = raw_write },
> 
> You can implement these using a single STATE_BOTH regdef, I think.
> Also, there's a standard order for the fields which goes
> .cp .opc0 .opc1 .crn .crm .opc2
> (you can often omit the .cp as the default is 15).
> 
> We need to be a bit careful here, because the AArch32 PMMOVSET
> register isn't implemented in ARMv7 until v7VE. So we need to
> put the regdef somewhere else...

Hmmm, what does it need to be protected by? I assume ARM_FEATURE_V8 ||
(ARM_FEATURE_V7 && something), but I'm not familiar enough with v7 that
it's immediately obvious from looking around what 'something' is.

-Aaron

> 
> 
> thanks
> -- PMM

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
