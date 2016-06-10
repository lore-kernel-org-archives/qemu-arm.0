Received: by 10.25.27.66 with SMTP id b63csp219293lfb;
        Fri, 10 Jun 2016 03:44:03 -0700 (PDT)
X-Received: by 10.55.22.94 with SMTP id g91mr1082213qkh.101.1465555442942;
        Fri, 10 Jun 2016 03:44:02 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 91si5941716qga.89.2016.06.10.03.44.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 03:44:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39706 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBJv0-0003oH-BL
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 06:44:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bBJtj-0002pR-GS
	for qemu-devel@nongnu.org; Fri, 10 Jun 2016 06:42:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bBJtg-0000ff-Kg
	for qemu-devel@nongnu.org; Fri, 10 Jun 2016 06:42:41 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:33100)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bBJtg-0000ek-1X
	for qemu-devel@nongnu.org; Fri, 10 Jun 2016 06:42:40 -0400
Received: by mail-vk0-x22a.google.com with SMTP id d64so92120244vkb.0
	for <qemu-devel@nongnu.org>; Fri, 10 Jun 2016 03:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1y2nrLwo36D/UASBbXLJaldob0SRXWTm4ryfn8MejiY=;
	b=JslsoH2h1PNw08idCNjTSnUjXUvOhnNopdhSC2rWIrAEP22L4y3jr1C4T/EMQtJjiu
	6J0B7Gm2DWRZ/8uI8wxTr8pUnkQq9as4FSVUoHS6byaDQ2UZ/J+It+lcjRH4ULbpnPEZ
	yZVF+AV/b1VrH7gKDa4e8m/pFSPnt6akj/Sws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1y2nrLwo36D/UASBbXLJaldob0SRXWTm4ryfn8MejiY=;
	b=ijfpf9xwrHqW7AFFrPw/xem81us/5Oa6Jg9KTc/tN1effFrNdteuOqrl1Rk0p8Af/4
	2W8XXRa4mjbpdYmLKolCiX69H7nIrsLVVed04vZvBKkQvDva9dz2kNmGdRUyFmavkVtH
	Pb12+Qmn+OTdaLaxuEl9h/R2CW5K4ACw8fCCK7ff1usz0j3xyMYgqh1DRvKf89X+UVKG
	Gd0k36pNsxPR6QAjmU4MihoOH+kzqpSokt2k1O4Gf0zOxdu5AaOBgR2fXmIY4VHgPn5l
	YuOTZQpUnGPkN7doZW040HIcqYq4P9LrU6za26SYt/UFPOVTFWiaY3Mxua4Kj2FbzMJS
	s2hA==
X-Gm-Message-State: ALyK8tIZoFW/xWal8IT40XBOiWQVac+nEm6GZOQIRRPLMAcjIyoLU3AULSe1H4ue7oxtsZtzczBMHtTqU2hClC86
X-Received: by 10.176.64.69 with SMTP id h63mr494032uad.125.1465555359308;
	Fri, 10 Jun 2016 03:42:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Fri, 10 Jun 2016 03:42:19 -0700 (PDT)
In-Reply-To: <1465520347.16048.180.camel@aj.id.au>
References: <1464325706-11221-1-git-send-email-andrew@aj.id.au>
	<CAFEAcA8+3trGJ=6K8fFX4-2Z1N+ZUiBKUcSTR6fYnQtMfNs3rw@mail.gmail.com>
	<1465520347.16048.180.camel@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jun 2016 11:42:19 +0100
Message-ID: <CAFEAcA9OUKDmA_CHXXMOWJCMF+-DeQYvGTY29KRkNktB=nCb_g@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Subject: Re: [Qemu-devel] [PATCH] hw/timer: Add value matching support to
 aspeed_timer
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sULVR3yVWlSw

On 10 June 2016 at 01:59, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 2016-06-09 at 19:15 +0100, Peter Maydell wrote:
>> On 27 May 2016 at 06:08, Andrew Jeffery <andrew@aj.id.au> wrote:
>> >
>> > Value matching allows Linux to boot with CONFIG_NO_HZ_IDLE=y on the
>> > palmetto-bmc machine. Two match registers are provided for each timer.
>> >
>> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> > ---
>> >
>> > The change pulls out ptimer in favour of the regular timer infrastructure. As a
>> > consequence it implements the conversions between ticks and time which feels a
>> > little tedious. Any comments there would be appreciated.
>> Couple of minor comments below.
>>
>> >
>> >  hw/timer/aspeed_timer.c         | 135 ++++++++++++++++++++++++++++++----------
>> >  include/hw/timer/aspeed_timer.h |   6 +-
>> >  2 files changed, 105 insertions(+), 36 deletions(-)
>> >
>> > diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
>> > index 4b94808821b4..905de0f788b2 100644
>> > --- a/hw/timer/aspeed_timer.c
>> > +++ b/hw/timer/aspeed_timer.c
>> > @@ -9,13 +9,12 @@
>> >   * the COPYING file in the top-level directory.
>> >   */
>> >
>> > +#include
>> >  #include "qemu/osdep.h"
>> osdep.h must always be the first include.
>
> Thanks for picking that up.

If you like you can run scripts/clean-includes file ...
and it will automatically make any necessary changes like this to
your files.


>> > +static inline uint32_t calculate_ticks(struct AspeedTimer *t, uint64_t now_ns)
>> > +{
>> > +    uint64_t delta_ns = now_ns - MIN(now_ns, t->start);
>> > +    uint32_t ticks = (uint32_t) floor(delta_ns / calculate_period(t));
>> Do we really need to do this with floating point ?
>
> I went with floating point to avoid accumulating errors from truncation
> by integer division. At eg 24MHz truncation increases the tick rate by
> approximately 1 in 63. We're using floor() here, but that only
> truncates at the end of the calculation, so the fractional current
> tick.

Right, but you only have a risk of truncation because of the way
you've structured the calculation. You have

floor(delta_ns / calculate_period())
== floor(delta_ns / (calculate_rate() / NS_PER_SEC))
== floor((delta_ns * NS_PER_SEC) / calculate_rate())

and calculate_rate() returns either 1000000 or 24000000.

So you have a 64 bit delta_ns, a 32 bit NANOSECONDS_PER_SECOND
and a 32 bit frequency. We have a function for doing this
accurately with integer arithmetic: muldiv64() (which takes
a 64 bit a, 32 bit b and 32 bit c and returns (a*b)/c using
an intermediate 96 bit precision to avoid overflow).

Doing ticks-to-ns and ns-to-ticks with muldiv64() is pretty
standard (grep the codebase and you'll see a lot of it).

> Having said that, grep'ing around under {,include/}hw/ doesn't show a
> lot of use of floating point. It looks like we are explicitly avoiding
> it, however with a quick search I didn't find it mentioned in any of
> the docs. What's the reasoning? Should I use a fixed-point approach
> like ptimer?

My view is that hardware doesn't generally use floating point
so it's odd to see it in a software model of hardware. Double
doesn't actually get you any more bits than uint64_t anyway...

>> > +    return calculate_next(t);

>> Why is this recursing ?
>
> The common case is that we return during iterating over seq array i.e.
> we're anticipating another match event (either from the match values or
> the timer reaching zero). If not then we've overrun, so we reinitialise
> the timer by resetting the 'start' reference point then searching again
> for the next event (iterating over seq). As the search for the next
> event is encoded in the function, I've recursed to reuse it.
>
> Would you prefer a loop here?
>
> Considering the two approaches (recursion vs loop), if TCO doesn't
> apply we could blow the stack, and with loops or TCO it's possible we
> could spin here indefinitely if the timer period is shorter than the
> time it takes to recalculate. Arguably, not crashing is better so I'm
> happy to rework it.

Yes, I'd prefer a loop -- TCO is an optimization, not a guarantee
by the compiler.

> As an aside, the approach for reinitialising start skips countdown
> periods that were completely missed through high service latency, and
> there will be no interrupts issued for the missing events. Is that
> reasonable?

If the countdown period is so short that we can't service it
in time then the system is probably not going to be functional
anyway, so I don't think it matters very much. (In ptimer we
impose an artificial limit on the timeout rate for a periodic timer
and just refuse to fire any faster than that: see ptimer_reload().)

thanks
-- PMM
