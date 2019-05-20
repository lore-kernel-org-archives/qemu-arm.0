Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp243350wrg;
        Mon, 20 May 2019 07:32:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx3rhqbj9GQI6azNNxQAA8ZMMRqV7sgT/2wy5WOzesymR3dz02N+N8zTnZ5LbJ/WnW5sJMe
X-Received: by 2002:adf:ec0b:: with SMTP id x11mr9417808wrn.88.1558362754555;
        Mon, 20 May 2019 07:32:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558362754; cv=pass;
        d=google.com; s=arc-20160816;
        b=uA6NQnGlK1B7oI10JYyPmG6dqYrnso171Qozp4oNZAz0q8Jjl773bD1YZE1P3zg1T5
         UqPFYTVDykR8f2r8BVe1reZkBwSd3vRV2CpQ78MeaS8m2ef+FaN6vwINR1+MtgmGpHyh
         UHRLqQqoCob/yiq8PxOHuxuA5anOiZVst3fp1G7MdHLkRT13UDYvnNdTE3nQHr0egF15
         0VaNinMgFy927IfbdQU9FfvEOPjagO9AK+vP9cb23BKQlwdYYQyVKC3w25WlWcrTYXbd
         q1oil141ABSBvI2VWCUGxR6nuVpKzuayYgulNYeZrgL1VwMxhx+O8IV68Vfa6msi20sS
         Li3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=UQYgxxekaeDJwFVWw6OnzMrR0hdYDfDRg/54Y/1pLiM=;
        b=TB1DtVjDClI+/pgqBeDBiLsMzCjgCHfi82SneEr/jXicPVigfEI/vOwjZ8jzZFPsxp
         4R8q8TMV8/oHLZHaUZg5jV/Wa96Fjc9YIyQQxOAip5wXfm48X047QtmG7738+3hWeYib
         jm6raRhwdXzgXRzhNHX94q79tYruFlPjnHXAdc2/8CFas4byrHwAcYznM/3d2FEgDKdk
         t/LQkNAE0kQifyIwDuEKZp29nZYSacD1OzE3TlP4DvOOCBcquiTYxRiC5ugs/CBfeGaC
         lCltwvYPr3Uu82EYChWaP3L4AocoI8W2bCvRGsAxnLwQUGEHX5eNUZ4J6ltImyTV1w8H
         I0Jw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=LvX0XbGQ;
       arc=pass (i=1);
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Return-Path: <damien.hedde@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id r12si13061637wrm.166.2019.05.20.07.32.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 07:32:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=LvX0XbGQ;
       arc=pass (i=1);
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Received: from [172.16.11.119] (unknown [172.16.11.119])
	by beetle.greensocs.com (Postfix) with ESMTPSA id 8AE3B96F50;
	Mon, 20 May 2019 14:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1558362753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UQYgxxekaeDJwFVWw6OnzMrR0hdYDfDRg/54Y/1pLiM=;
	b=LvX0XbGQqKK0TxrW8ye5WpOSzPWk0UuQVZaPXnfhP04VswKgn+8nZ8muXBvIH428BMx1Z9
	3Abhwce364k78rKv3dRgWzVR2U05K9MlySXsCQ/Y1DV3JM7N9C5f8VEX9UwOXHMNKnYAbd
	UR61UMjrMclapcUgmS3oA6GAoWh1Gc8=
Subject: Re: [RFC 00/17] multi-phase reset mechanism
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Mark Burton <mark.burton@greensocs.com>,
 Luc Michel <luc.michel@greensocs.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
References: <cover.1553510737.git.damien.hedde@greensocs.com>
 <CAFEAcA-84KBmZhRqugQzmEkWVcFBuSAdLtp_HGjRxLeVj1SLXA@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <dac12db2-9583-4a30-2188-e5b101e13ecf@greensocs.com>
Date: Mon, 20 May 2019 16:32:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-84KBmZhRqugQzmEkWVcFBuSAdLtp_HGjRxLeVj1SLXA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1558362753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UQYgxxekaeDJwFVWw6OnzMrR0hdYDfDRg/54Y/1pLiM=;
	b=i9CjjQkVkezIatChgGRfngeQ/PPN9d8+cZTPgTuYOhORSYqiqgGYspcAmXCadqvCSarkyY
	9dAGqOcBvWMglMAVsRfiGwWzAn0Xug8YUEsSVTKhBVXdUXnKDA/CquAdCVmuv6z+hF7YLB
	Iki4ANqSTi8RvOmDy3V8pzwLAUCxTyQ=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1558362753; a=rsa-sha256;
	cv=none;
	b=3JeVbGN1+bfumh6FaCGSfHmSVuA29z2zjLLHMaF0cxJWDRN8LU83VxDv5XEBPmBh/O+z8e
	kf179eAFLpRyS2Cm6h+huO46Q8nHIYE8TbLVbjOCkBpPkRAg6mk+QACA0dlscnDNm6fgVq
	DjdkfALCxgwBsa64fy83xrohGENaYFU=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-TUID: atCXL2TWktuu

Hi,

On 5/16/19 2:41 PM, Peter Maydell wrote:
> On Mon, 25 Mar 2019 at 11:02, Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>> Hi all,
>>
>> This series is a proposal to implement the multi-phase reset we've discussed
>> here (https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg00310.html) and
>> more recently there
>> (https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg00081.html).
>>
>> To summarize, we need a multi-phase reset to allow for a more complex
>> initialization of a platform. In particular we need to "propagate" a clock
>> tree, but we have to ensure that every device is initialized first.
> 
> Hi; I finally managed to get my thoughts about reset coherent
> enough to write down in an email.
> 
> 
> OVERVIEW
> 
> I had a read through the patchset and spent a while trying to
> understand what we currently have.
> 
> Our current (device) reset model is:
>  * single-phase
>     -- there is only one 'reset' method
>  * implicit
>     -- devices don't need to be explicitly registered anywhere
>        in a "reset hierarchy"; instead they are reset by virtue
>        of being in the bus heirarchy they are already in
>  * bus-based
>     -- sysbus reset is registered in vl.c; free-floating other buses[*]
>        (ie those with a NULL parent) have a reset registered in qbus_realize;
>        buses with parents (ie anything with a non-NULL parent passed to
>        qbus_create() or qbus_create_inplace()) will get traversed by
>        the recursive traversal of whatever bus their parent is on.
>  * not exhaustive
>     -- any devices not put on a bus, or put on a bus whose parent device
>        is not on a bus, will not get reset
>  * not modelling GPIO reset signal lines
> 
> [*] It turns out we actually don't have any of these any more, so
> we can remove the code that deals with them. The only parentless bus
> is the main system bus, which is the root of the "reset hierarchy".
> 
> This patchset is trying to address:
>  * changing to multi-phase
>  * modelling of GPIO reset signal lines
> 
> It leaves reset as bus-based: currently we do this via qbus_walk_children/
> qdev_walk_children, which traverse the bus->children and dev->child_bus
> lists, and in the patchset's implementation of Resettable for qdev/qbus
> the methods iterate through those.
> 
> I think this is reasonable -- we don't want to try to tackle every
> reset related problem at once. The two issues the patchset is looking
> at fit well together, because the GPIO-reset-lines are a motivation
> for switching to multiphase (you need to handle both entering and
> leaving reset).
> 
> ("not exhaustive" is the thing we should really try to
> fix at some point, but I have no good ideas for how to do this.)
> 
> API DESIGN
> 
> On what the right APIs should be: I think we should separate
> "the API that's nice for devices to implement" from "the API that's
> nice for callers wanting to reset a device". Here's my suggestion
> for doing that:
> 
> 
> Have the Resettable interface be:
>  * init
>  * hold
>  * exit
>  * get_reset_count
>  * increment_reset_count (returns previous count)
>  * decrement_reset_count (returns new count)
>  * some method for "iterate over any Resettable child objects"
>    (probably a "call this callback for each child" type API)
> 
> Individual devices implement init/hold/exit
> Device base class implements the reset_count methods
> Device base class implements a default 'init' method that calls dc->reset
>   and default hold/exit that are no-ops
> Device base class has a new vmstate subsection which migrates the
>   reset count, subsection's needed function says "only send
>   if reset count is non-zero". Back-compat here should be fine
>   as current machines don't implement any way that a device in
>   the system can be being held in reset at the point where a
>   migration happens. If future changes add features to a
>   machine model that permit that, the migration is forwards-compatible.
> Device base class implements the iterate-over-children method to
>  iterate over the dev->child_bus buses
> Bus base class implements reset_count methods
> Bus base class implements default no-op init/hold/exit
> Bus base class implements the iterate-over-children method to
>  iterate over the bus->children devices
> Handling migration of the bus base class reset count is a little
>  awkward -- we'll need to put it in a vmstate subsection which
>  is part of the vmstate of the device which owns the bus.
>  (I talked to David Gilbert on IRC about this and have some
>  possibilities for how to do it, but will postpone writing them
>  out until we've decided whether we like the APIs.)

If:
  1. we say we cannot use a Bus as holdable reset entry point (we can
reset it but not (de)assert_reset it without passing by its parent Device)
  2. if there is no additional reset dedicated state (right now a reset
on a bus mostly propagates it to sub-devices)
Then we have no state migration needed for buses and we can probably
find a way to use the parent Device's reset_count.

This is somewhat related to the API TRANSITION part below but I was
wondering if I should add some kind of flag in the interface class to
indicate the support of "migration-during-reset" functionality. It could
be used to at least warn when trying to hold the reset state in such an
class.
This flag will default to false and one would have to set it when
implementing the functionality for a given object class (like I did with
the cadence_uart device).
Maybe a similar flag can be used to allow/forbid using a class as an
holdable reset entry point.

> 
> The "API for devices to implement" is then the init/hold/exit
> methods of the Resettable interface -- they don't need to worry
> about these methods possibly being called multiple times, and
> they don't need to handle the reference count or passing on
> the calling of the phase methods to their children. They
> just need to implement the correct behaviour for their device
> for this phase.
> 
> The "API for callers wanting to reset a device" is a set of
> helper functions that take a pointer to a Resettable object.
> It's these that deal with the reset count and children:
> 
> resettable_assert_reset(Resettable *r)
> {
>    if (r->increment_reset_count() == 0) {
>        r->init();
>        r->foreach_child(do_call_init);
>        r->hold();
>        r->foreach_child(do_call_hold);
>    }
> }
> 
> resettable_deassert_reset(Resettable *r)
> {
>    if (r->decrement_reset_count() == 0) {
>       r->foreach_child(do_call_exit);
>       r->exit();
>    }
> }
> 
> plus a utility function for "call assert then deassert",
> and maybe one that wraps the get_reset_count method.
> So callers that want to reset devices (or buses) don't need
> to care about phases, they just assert and then deassert reset.
> 
> Do you think that works ?

I'll have to handle cold/warm cases but I think it will work.

> 
> 
> API TRANSITIONS
> 
> The other issue here is API transitions: the patchset essentially
> obsoletes the old DeviceClass::reset function, for instance. I think
> we should be clear about what the old and new APIs here are, and
> what our plans for transitioning to the new ones are. In some cases
> there are really very few users of the old API -- for instance the
> patchset makes qbus_reset_all(bus) a synonym for qbus_reset(bus, false),
> but there are only a dozen or so users of qbus_reset_all(). I think
> we should just go ahead and convert them all. (For purposes of
> structuring the patchset starting with a patch that says "reimplement
> qbus_reset_all() in terms of qbus_reset()" is OK, but then we should
> fix up the callers afterwards.) There are of course a lot more
> implementations of DeviceState::reset so transitioning away from
> that is a lot trickier, but we could look at a coccinelle script
> that could automate it.
> 
> If you could describe in the cover letter of the next version of
> the patchseries all the old APIs being deprecated and the new
> ones that replace them, I think that would be very helpful.>
> 
> MISCELLANEOUS MINOR POINTS
> 
> I know I suggested the idea of a ResetDomain object, but in the
> series as it stands I'm not sure it's serving very much purpose;
> perhaps we should drop it for the moment (just leaving the legacy
> reset handlers and sysbus reset the way they are) ? We can come back
> to it later as a concept.

I'm ok with that. It seems unnecessary at that point given that it was
not used by Device/Bus classes. It will make the series simplier.

> 
> The "support reset via GPIO line" patch looks generally OK, but
> you can't just add fields to the DeviceState vmstate struct -- you'll
> break migration from older QEMU versions. The new fields need to
> go in a vmstate subsection with an appropriate 'needed' function.
> 
> We should definitely make sure we have good documentation for
> what device authors should do to implement reset.

I agree, I did not want to commit too much into it before having a more
satisfying API. I'll work on it for the next version.

> 
> thanks
> -- PMM
> 

Thanks a lot for the review,
Damien
