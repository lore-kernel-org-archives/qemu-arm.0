Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp6793432wrd;
        Tue, 28 Aug 2018 13:04:15 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdY5MptpYGRU9AwXbJ/WCeTj0QnOc/Bx4edIPLedrgBwYST9/sy5KLfICzyADGkXF5Ybqqwn
X-Received: by 2002:a0c:ecc2:: with SMTP id o2-v6mr3272981qvq.148.1535486655521;
        Tue, 28 Aug 2018 13:04:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535486655; cv=none;
        d=google.com; s=arc-20160816;
        b=nI3nAaFDNQ9R7LdXLumcwCv4WwdgXF31cx87q/yO39OOCNn2Dl7BFmm7IJazoQ0AwZ
         /c4Y08w8dWNfp5SWxC5ms1nUi6tgFFyBeRobpD0GFOzVxK8XN3i9XnRfrY71MyaIiWfF
         Vcz5adtW01kHyOSmJYUuqHwEeO5HKlAf2ZLhtlqB5UmvisZTPq/0+pKoqknLe3Y+lWxT
         VxPWCVPtYvgUh0eT6ud8dgFHkw12of2mV1yAAvdPKSFiWkC6SNovciScV69+5H3FzSBN
         9efcVvNpm5Sd1M99/47i/B1ILN1PLRxs3rSByqTll1iUr9htslO6zLfmxJP+lfKhIoA0
         A5+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=BLL7C2fhvZtg5v/6xSdwX5YQkgMxfPo0JjMOo7EMfaI=;
        b=ejJ7hFmy2r38EjhaaXCMAzRZ0fHkkNZYyz+OKVWj0CGZKMprGqTqyH2V3GjPFC2D55
         vKwJrzhAsEescHhKtt/2Q5aGBHL5LxhTHytJKZfOBEy9HsNDKwXAULHeC0B5hUnlh6RW
         2FTZ1a70gD+yVernaW9CFoOpYfxRFrEx2xu7TCHL4DkpD320pP6qx836Sqr7wW8caBan
         6xpC1wFi5sUMotUBQdt8LGUKHLz4Zeih0x2ULeZOhndy7aBrt584dGs4K0Mul6P6v6t1
         OY2e1mTf4yzGmR1gxl0r1Vq8PmO4EWttSeNM3P2VRbG38HZhQe6UAwz+4LbVWHRGMasH
         QOUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hxIDdxRg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y12-v6si1828382qti.27.2018.08.28.13.04.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Aug 2018 13:04:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hxIDdxRg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39622 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fukDm-0004eS-SN
	for alex.bennee@linaro.org; Tue, 28 Aug 2018 16:04:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1fukDR-0004WB-Ap
	for qemu-arm@nongnu.org; Tue, 28 Aug 2018 16:03:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1fukDP-0006Kh-TT
	for qemu-arm@nongnu.org; Tue, 28 Aug 2018 16:03:53 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35393)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1fukDP-0006Jn-Fw; Tue, 28 Aug 2018 16:03:51 -0400
Received: by mail-qt0-x243.google.com with SMTP id j7-v6so3234855qtp.2;
	Tue, 28 Aug 2018 13:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=BLL7C2fhvZtg5v/6xSdwX5YQkgMxfPo0JjMOo7EMfaI=;
	b=hxIDdxRgzxZHxlwEpjgOALsZrNMNZdfo7drjyAvQxxjgaQzEWa7vjRKg61O2K9re8x
	Xk4qLjn6KqxgiHG4n4ILr3WY7YHTLi3SBArJ34CX35+0wTkHz+MMa13gejfTRjm5mLHa
	G99lTc7ln+774sJ3jbMl7BL2x2pyzYUtEusrIJW60ya+r77U3nhzKDqi8B2YGjjrRWns
	MbGr4wD5wJ6XvzQ4CFhDDg8BdSVaIGyHxh6eJAeAtFgRnV0Y9uiczzH9TZPbb86a/vj7
	NCc4pR3o9Ztbk7Z3lwDEl8vpO2TQdix7a/tvGddzO6MBus7uyJefwDmfCrglR1Y0cLFb
	4P/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=BLL7C2fhvZtg5v/6xSdwX5YQkgMxfPo0JjMOo7EMfaI=;
	b=qEK9swXhlEkwVgUBLkI9jix/SWF5W4l3J5ujwPsGBCvH3pfgmwNKU3eqYCQGQgGyD4
	TqnrKJUKYLkqig1/4ezKBuqFzNmJ+ndMLEYDNBUYS7AC9UsrwTp90f/uiAlJHsvG2NkK
	55J4o6d2mIZ2/CTWU8s2wPQoAX8oy8ROVLKzbCBPzOR9eD6lTfpgDtzpRL9dXayRyNvZ
	LJEbmDh1PNsUiJRIr+vWI7TR0oAHthM+9FVRdNvyt/skOHeMG8jCob07CN7GGtph5LZc
	qe2iBTfDVXWSsqsmTklE/QZmzjoJ4ZEL5CJH1MEjbSXL5a1nlIND3H06Yw3bM62TRkxA
	/WmQ==
X-Gm-Message-State: APzg51BcaEMw2QWuyIuxtqmgOLdEHErpkqwmJxLaNZddv6PttYVqFRaI
	88Ohr4ofaBnA7PYQa2ffULY=
X-Received: by 2002:ac8:5159:: with SMTP id
	h25-v6mr3450119qtn.290.1535486630739; 
	Tue, 28 Aug 2018 13:03:50 -0700 (PDT)
Received: from okra.localdomain ([2600:3c03::f03c:91ff:febb:cdda])
	by smtp.gmail.com with ESMTPSA id
	x189-v6sm1201579qkd.44.2018.08.28.13.03.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 Aug 2018 13:03:50 -0700 (PDT)
Date: Tue, 28 Aug 2018 16:03:49 -0400
From: Aaron Lindsay <aclindsa@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180828200348.GB3671@okra.localdomain>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
	<1529699547-17044-2-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA8601LbuOOARb0KoNLjJep3-ND=Kf44OqW6NXdVtnNocw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8601LbuOOARb0KoNLjJep3-ND=Kf44OqW6NXdVtnNocw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [PATCH v5 01/13] target/arm: Reorganize PMCCNTR
 accesses
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
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H1AZYpgkIELk

On Jun 28 17:40, Peter Maydell wrote:
> On 22 June 2018 at 21:32, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 8488273..ba2c876 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -467,10 +467,20 @@ typedef struct CPUARMState {
> >          uint64_t oslsr_el1; /* OS Lock Status */
> >          uint64_t mdcr_el2;
> >          uint64_t mdcr_el3;
> > -        /* If the counter is enabled, this stores the last time the counter
> > -         * was reset. Otherwise it stores the counter value
> > +        /* Stores the architectural value of the counter *the last time it was
> > +         * updated* by pmccntr_op_start. Accesses should always be surrounded
> > +         * by pmccntr_op_start/pmccntr_op_finish to guarantee the latest
> > +         * architecturally-corect value is being read/set.
> 
> "correct"

Thanks - fixed for v6.

> >           */
> >          uint64_t c15_ccnt;
> > +        /* Stores the delta between the architectural value and the underlying
> > +         * cycle count during normal operation. It is used to update c15_ccnt
> > +         * to be the correct architectural value before accesses. During
> > +         * accesses, c15_ccnt_delta contains the underlying count being used
> > +         * for the access, after which it reverts to the delta value in
> > +         * pmccntr_op_finish.
> > +         */
> > +        uint64_t c15_ccnt_delta;
> 
> I had a look through the patchset, and I still can't see
> anything here which indicates how we're handling migration.

I'll admit that I had not previously thought through everything
exhaustively, but I think I've convinced myself that *almost* everything
is already handled by calling .readfn/writefn on the registers for
migration... more below.

> If this field is only ever used as a temporary while we're
> between op_start and op_finish, then we can just return it from
> start and take it as an argument to finish, and we're fine
> (migration of the PMCCNTR_EL0 register will be done by calling
> its readfn on the source and its writefn on the destination).
> 
> If there's a reason for having this be a field in the state struct
> (I think you said counter overflow)? then we need to be sure that
> migration is going to do the right thing and that we don't for instance
> lose overflow indications during a migration.

I think we do need additional state for supporting counter overflow
during normal operation (more than just between op_start and op_finish),
but I don't think sending additional state over the wire is necessary
for migration. Let me lay out my reasoning to see if you think it makes
sense:

I observe that we seem to deal mostly with the following values with
respect to PMU counters, and I think it might be easier to discuss this
in terms of values rather than variables:

	AC = current architectural value of PMCCNTR
	AL = architectural value of PMCCNTR when last observed/updated by
	     the OS
	UC = current underlying counter value
	UL = underlying counter value when PMCCNTR last observed/updated by
	     OS
	D = difference between underlying counter value and architectural
	    value

At any given point in time, the following should then be true during
normal execution (i.e. between OS accesses to the counter):
	UL - AL == D == UC - AC

The approach taken previous to my patchset was to store D in
cp15.c15_ccnt most of the time, updating that variable to hold AC when
read (by doing `c15_ccnt = UC - c15_ccnt`... an implementation using `AC
= UC - D`, which is a different way to write `D = UC - AC` from above).
This operation was reversed after a write completes, so that c15_ccnt
again holds a value corresponding to D.

Only storing D works well and minimizes memory usage if you don't care
about detecting overflows. However, without some frame of reference for
what the last observed architectural value was relative to its current
value, we have no way to know if the counter has overflowed in the
intervening time. In other words, we need to know both AC and AL to know
if the counter has overflowed. Assuming we store D and can obtain UC we
can calculate AC, but we need to store at least one additional piece of
information to obtain AL (either AL itself or UL).

In my patchset so far, I'm storing AL in c15_ccnt and D in
c15_ccnt_delta during normal operation and AL/AC in c15_ccnt, UL/UC in
c15_ccnt_delta between op_start and op_finish (note that AL == AC, UL ==
UC, and D == 0 during this time). Also note that UL/UC are only stored
between op_start and op_finish calls to avoid losing time, and are not
needed to maintain architectural state across migrations.

Now for migration - The read/writefn's already marshal/unmarshal both
the counter value and overflow state to their architectural values in
PMCCNTR and PMOVSCLR. I think this would work on its own if we made
two big (and wrong) assumptions:
	1. PMOVSCLR is read after PMCCNTR on save (ensures all overflows
	   which have occurred are recorded in PMOVSCLR) and written before
	   it on load (ensures any overflow bits in PMOVSCLR cause the
	   interrupt line to be raised)
	2. Time (as measured by `qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)`) does
	   not change during the process of saving or loading CP registers
	   (ensures PMCCNTR can't have overflowed between when it was saved
	   and when PMOVSCLR was later saved).

One possible solution for this is to add calls to op_start in both
cpu_pre_load and cpu_pre_save, add calls to op_finish in cpu_post_load
and cpu_post_save, and ensure that all CP registers which would call
op_start/finish on their own have raw_read/writefn's which assume
they're between calls to op_start and op_finish.

Thoughts? (and I apologize for the wall of text)

-Aaron
