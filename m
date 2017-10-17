Received: by 10.223.197.9 with SMTP id q9csp4719632wrf;
        Tue, 17 Oct 2017 08:27:19 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBJ1jNOaTvCteAshzspVpAq2C5aRWajuLuejaBYm9cFMu3vwaau9NtWogUEg8zajP4y1GMF
X-Received: by 10.200.56.124 with SMTP id r57mr20283850qtb.310.1508254039230;
        Tue, 17 Oct 2017 08:27:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508254039; cv=none;
        d=google.com; s=arc-20160816;
        b=eBXPsKjLf5MpdX4Xjf4xeibnMHskS7LU872w4bVh9ufUpOwHmz3UP1L7mKf+wIrHlr
         1VaDJSlRZ1vPJ8Qo8Pky+FGb02jC15Q4kwOfngBwEGyXXr6WBZzH8DVmpxyweZXmPsMD
         IAqA9vvia4Il6lh7gbXd/abhaGR1f06fmZc6D0pGGNPtN0Th9bEKRK+orTNYmzxcf2zB
         L1fAnhrPaqWedA1e5VeU8NPDVQy8QhKce9ZxYnVND5HdvAHt/mdoCsV/1XvvyfFm6rjt
         2g8Y8vx6cIxK7US+syf6LPDcmXf3En9neRD6O+ipQK4b/GYbV8xBLLMLqcntKmbdEVrt
         GHsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=GrcVbWKiEAc0ZeSydKdciP6zKFpshYXu5zp54Btxf70=;
        b=lmYLy63CAs8rRfiwU6HwjAHbUuzSjmcK1VDO9nLW4dDyBGdVE4Mc9OwxpJyxtQfjYU
         uJxY7DmsDoecV0TOsbWaYIP0/zN0LWLgGY7zv4p/UbvJTF0sEZI3bSdJBL8PB/Fbk0oS
         4jUbXAmOxzonE5iT+Pvbo4WDh4hgEradPbKTqHKDXdNn+/L4qRlJ1jXeZAUgUn3X/Xkf
         wextRb8qC/R9CYtvEOA9AEvniirqYXpS1POZUG8Gn3NCMT63qG+HG6f6LX9bM33ol62f
         GSpgC+jDApUkCZYB57b0AZppb4/y2PP67B87wxCHbfpdl4bXR4SOF6MYgplK+HtV+Yi6
         uUKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=WIEVMFeC;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=nSME5RqV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i39si1460319qtb.445.2017.10.17.08.27.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 08:27:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=WIEVMFeC;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=nSME5RqV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40062 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4Tm1-00004r-1B
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 11:27:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1e4Tlo-0008Vi-0Q
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 11:27:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1e4Tlk-0000EW-Ba
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 11:27:03 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:51422)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1e4Tlk-0000E0-1E; Tue, 17 Oct 2017 11:27:00 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id D33416079C; Tue, 17 Oct 2017 15:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1508254018;
	bh=RyuBFpP6cWuhHUuMD2ZjWANjYNwZMqYFPoN4humTPcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WIEVMFeC6zDcQmJsYCjuaubeGMibqCwUoaeRQ23+hlffYJMUSK3lSFNoWPDH/HIog
	0Ico3pOEINTx8Ntgqu1h2OrDcILhZ0T2drxBuFQ7fO1pVEjPxmLEpyRd38C1OukhMq
	Xs4euAync55yb30My5oyyAgOHSOvUy6+xllz6Vsk=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id E3840607BD;
	Tue, 17 Oct 2017 15:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1508254017;
	bh=RyuBFpP6cWuhHUuMD2ZjWANjYNwZMqYFPoN4humTPcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nSME5RqVNUc/F2MEdp/WShoiKDthISmFCncH3VqY8Z/0n9vukKJwFEB/I07PgZRDW
	dtxzMYPU6SJBzAahnrBishpxqAm9ZzRVFVttY/avmvjDzPoViFEnCL+ateep4TK3gJ
	XBIjJdieSrWCS6cdFnxyHgYvK5LqUUZJPKa3+4Po=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E3840607BD
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Tue, 17 Oct 2017 11:26:55 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20171017152654.GE3676@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
	<1506737310-21880-4-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA-0_dD0aXM5kmDbhKC5zX2woeX4G_BJemr8EgbhGBbdFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-0_dD0aXM5kmDbhKC5zX2woeX4G_BJemr8EgbhGBbdFA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [PATCH 03/13] target/arm: Reorganize PMCCNTR read,
 write, sync
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
X-TUID: zEThmWERbnf3

On Oct 17 14:25, Peter Maydell wrote:
> On 30 September 2017 at 03:08, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > pmccntr_read and pmccntr_write contained duplicate code that was already
> > being handled by pmccntr_sync. This also moves the calls to get the
> > clock inside the 'if' statement so they are not executed if not needed.
> 
> It is duplicate code, yes, but I also find it a bit confusing,
> because it's the same code doing two different operations:
> 
> (1) if (as is usual when the counter is running) c15_ccnt
> contains a delta between the clock ticks and the register
> value, pmccntr_sync() sets c15_ccnt to the current
> guest-visible register value
> 
> (2) if c15_ccnt contains a guest-visible register value
> and the clock is running, pmccntr_sync() sets c15_ccnt
> to the ticks-to-value delta
> 
> and we use this in a couple of places like:
>    pmccntr_sync();
>    do stuff that operates on the guest register values,
>      or maybe turns off the counter, etc;
>    pmccntr_sync();
> 
> But that's wrong really -- we'll slightly lose time because
> the nanosecond clock advances between the two calls
> to qemu_clock_get_ns(). (It only works at all because
> it happens that f(x) = C - x  is a self-inverse function.)
> It's also a confusing API because it looks like something
> you only need to call once but actually in most cases
> you need to call it twice, before and after whatever it
> is you're doing with the counter.

Interesting, I hadn't thought about the loss of time issue.

> So I think we should refactor this so that we have a
> pair of functions, something like:
>     uint64_t clocknow = pmccntr_op_start(env);
>     /* Now c15_ccnt is the guest visible value, and
>      * we can do things like change PMCRD, enable bits, etc
>      */
>     [...]
>     /* convert c15_ccnt back to the clock-to-value delta,
>      * passing it the tick count we used when we did the
>      * delta-to-value conversion earlier.
>      */
>     pmccntr_op_finish(env, clocknow);
> 
> (clocknow here should be the output of the muldiv64(),
> not the divided-by-64 version.)
> 
> Some more specific review comments below, though the
> suggested refactoring above might render some of them moot.

I agree that what you describe would be cleaner. I'll work towards that
in v3.

> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > ---
> >  target/arm/helper.c | 55 ++++++++++++++++-------------------------------------
> >  1 file changed, 16 insertions(+), 39 deletions(-)
> >
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index 40c9273..ecf8c55 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -973,17 +973,18 @@ static inline bool arm_ccnt_enabled(CPUARMState *env)
> >
> >  void pmccntr_sync(CPUARMState *env)
> >  {
> > -    uint64_t temp_ticks;
> > +    if (arm_ccnt_enabled(env) &&
> > +          !pmu_counter_filtered(env, env->cp15.pmccfiltr_el0)) {
> 
> This seems to be adding an extra condition that the commit
> message doesn't mention.

Eek. This slipped the cracks through during a rebase and belongs in
'target/arm: Filter cycle counter based on PMCCFILTR_EL0'.

> > +        uint64_t temp_ticks;
> >
> > -    temp_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> > -                          ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
> > +        temp_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> > +                              ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
> >
> > -    if (env->cp15.c9_pmcr & PMCRD) {
> > -        /* Increment once every 64 processor clock cycles */
> > -        temp_ticks /= 64;
> > -    }
> > +        if (env->cp15.c9_pmcr & PMCRD) {
> > +            /* Increment once every 64 processor clock cycles */
> > +            temp_ticks /= 64;
> > +        }
> >
> > -    if (arm_ccnt_enabled(env)) {
> >          env->cp15.c15_ccnt = temp_ticks - env->cp15.c15_ccnt;
> >      }
> >  }
> > @@ -1007,21 +1008,11 @@ static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >
> >  static uint64_t pmccntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
> >  {
> > -    uint64_t total_ticks;
> > -
> > -    if (!arm_ccnt_enabled(env)) {
> > -        /* Counter is disabled, do not change value */
> > -        return env->cp15.c15_ccnt;
> > -    }
> > -
> > -    total_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> > -                           ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
> > -
> > -    if (env->cp15.c9_pmcr & PMCRD) {
> > -        /* Increment once every 64 processor clock cycles */
> > -        total_ticks /= 64;
> > -    }
> > -    return total_ticks - env->cp15.c15_ccnt;
> > +    uint64_t ret;
> > +    pmccntr_sync(env);
> > +    ret = env->cp15.c15_ccnt;
> > +    pmccntr_sync(env);
> > +    return ret;
> 
> This change means that as a result of this refactoring we
> now do the 'sync' operations (muldiv etc) twice, whereas
> previously we did them only once.
> 
> >  }
> >
> >  static void pmselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> > @@ -1038,22 +1029,8 @@ static void pmselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >  static void pmccntr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >                          uint64_t value)
> >  {
> > -    uint64_t total_ticks;
> > -
> > -    if (!arm_ccnt_enabled(env)) {
> > -        /* Counter is disabled, set the absolute value */
> > -        env->cp15.c15_ccnt = value;
> > -        return;
> > -    }
> > -
> > -    total_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> > -                           ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
> > -
> > -    if (env->cp15.c9_pmcr & PMCRD) {
> > -        /* Increment once every 64 processor clock cycles */
> > -        total_ticks /= 64;
> > -    }
> > -    env->cp15.c15_ccnt = total_ticks - value;
> > +    env->cp15.c15_ccnt = value;
> > +    pmccntr_sync(env);
> >  }
> 
> thanks
> -- PMM

-Aaron

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
