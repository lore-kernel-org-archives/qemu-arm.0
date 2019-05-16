Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp586707wrg;
        Thu, 16 May 2019 05:42:10 -0700 (PDT)
X-Received: by 2002:a9d:4b17:: with SMTP id q23mr6253920otf.130.1558010530740;
        Thu, 16 May 2019 05:42:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558010530; cv=none;
        d=google.com; s=arc-20160816;
        b=yMdTd60Qvno9ooGaG6gp9tWnsmmxQ7jewvAJBLUHJsjji3zGqGLcEZLvJVD7RGxC5N
         q86OTcQRxfTVrH0DfBog9vcJ16pSUH7R5r+t13K03pJcSvzIL6L7MZv2itfBv91IZM27
         4mly/CSFl/amHJ2a1qs32wmUJfovnY+h1am1JTCX8NynbPkEJb9+2P/rzn2HMFv6JT0L
         MnKDDtev3ANvdoqyf0Qp2LRCfSh8jIVsq7u48ucSEErMh5M+gScNdj8kpyUcGrkXUqsh
         DLybPLpXBDPiCuWFh5d74Hhx5LAj9qO7SvSXNXOVPvLCxGCLtNiZexMmvv7FQFsERUfg
         7jOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Mu+5BpM2hOtGtd/f/dn1CGFFMve5wBCOhTGy3vRJJRM=;
        b=PWCZ2YNhMfX/jT9MMAYsx0+pYQGI9B2Ugpc01c1gU4eVxtl5OUyq3ZItcjSgXpDy0y
         2XE4AZArI+8UI1ZLQqVTJbebF9Ndfq+g2aS6ZRJbHfs+1u8nzbuljTC9196DpTlJJv6b
         yl+SmU4G3A7B2B3zI3oNmx7Pth1hw7wxg0uTtDH/srnCR66DbxcjViP1EAiMq+nFQQJN
         oarAp0wqFuypTRyYelDgRlkOoIQ9tgAOhvIbY7olSXHVe1U24NCfw9OFgIgYYPY6+PEZ
         zxShFOTCjatSFqRdUUsCuyyFVVuAEls4zzMK9u+JJjcHj92cuzoy14k6RKS0iPNVEvzm
         nlVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YpEuoXq1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v129sor2331806oig.36.2019.05.16.05.42.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 May 2019 05:42:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YpEuoXq1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mu+5BpM2hOtGtd/f/dn1CGFFMve5wBCOhTGy3vRJJRM=;
        b=YpEuoXq18fl6WyjFA0C8qRb2qdzVqe35xizuilWGkl5H/kN9eBAqejuSUaUdvnCOgq
         ND4F2C5Aw7eozSL1k/6sjuZNxBqZNPUDbO+AYjGcgpoTCmgYswYaY7nbzM8Ee1hde7QW
         KZecfVJ6lhGrw4awhIKgEkHw2uFe2GXyXXmbKMVek0RtzAiYmEiF/nmUq43OucipcPc4
         0MoetXD67AdAZ9g6+f0IpFGn7MRdncI/Fi3OVUbYavIGbVOOlaKcQ4C+Up8zb8mhuJgk
         yQ1X/yzAYHxQigKfp0UrN2D1D7mAMNZX0jBYlWOQBrWHR5O57vo2kEirHkP0FE8mBH1l
         c/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mu+5BpM2hOtGtd/f/dn1CGFFMve5wBCOhTGy3vRJJRM=;
        b=CShdq//HpyfgRwn8F/QJI+TSb2AyfXf1iaoxoVs190ySqpgDMS0zsR5L9mTY3s2YXr
         WeDPdts3mFD+HhrzM4VTsHfXM10JMwOAfXcfTmd1SwWlCsJGCNLKYY1FMFVBJlm8h5H5
         G9y8TBaDTT0Q45FBGHetJktZ/ru9WA32LRYUTy9U0VwPJGSVGoUuJU6KuEiFk+R0Kwja
         1eIn845eUU/WlMrMiM1Vxms5US9wdGvj/6HkuJDyxwN3o4HrtqNvGkVJAGwq4Cdz/f9U
         pxQZoCUbpP72mZmHXqsv1vYbqB7cVIbtQ3T/PWd7bW+UpsNks3Hir0BYmLlJPWnexm8h
         xHrQ==
X-Gm-Message-State: APjAAAXzKgW7moZl5J+IfKr2zrp0nVscSyt4IQq6m9T0Gmhfokg3fa+8
	Uk1XKBBhvm5HNXIUvRp3FaQK1++jQI+TGuO97nGeQ6ZXqk25rQ==
X-Google-Smtp-Source: APXvYqxxia1y0LA+nmPcez615hPQ+Vuwl6lmuaHQR9Dtb7O/chx0c8uu6vtZF1QegpprISskB/xz4ohmtNABhzfALUM=
X-Received: by 2002:aca:4e42:: with SMTP id c63mr10313014oib.170.1558010530123;
 Thu, 16 May 2019 05:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553510737.git.damien.hedde@greensocs.com>
In-Reply-To: <cover.1553510737.git.damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 May 2019 13:41:59 +0100
Message-ID: <CAFEAcA-84KBmZhRqugQzmEkWVcFBuSAdLtp_HGjRxLeVj1SLXA@mail.gmail.com>
Subject: Re: [RFC 00/17] multi-phase reset mechanism
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Mark Burton <mark.burton@greensocs.com>, 
	Luc Michel <luc.michel@greensocs.com>, Edgar Iglesias <edgar.iglesias@xilinx.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Alistair Francis <alistair.francis@wdc.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 0oyPc6rLCCQ1

On Mon, 25 Mar 2019 at 11:02, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Hi all,
>
> This series is a proposal to implement the multi-phase reset we've discussed
> here (https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg00310.html) and
> more recently there
> (https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg00081.html).
>
> To summarize, we need a multi-phase reset to allow for a more complex
> initialization of a platform. In particular we need to "propagate" a clock
> tree, but we have to ensure that every device is initialized first.

Hi; I finally managed to get my thoughts about reset coherent
enough to write down in an email.


OVERVIEW

I had a read through the patchset and spent a while trying to
understand what we currently have.

Our current (device) reset model is:
 * single-phase
    -- there is only one 'reset' method
 * implicit
    -- devices don't need to be explicitly registered anywhere
       in a "reset hierarchy"; instead they are reset by virtue
       of being in the bus heirarchy they are already in
 * bus-based
    -- sysbus reset is registered in vl.c; free-floating other buses[*]
       (ie those with a NULL parent) have a reset registered in qbus_realize;
       buses with parents (ie anything with a non-NULL parent passed to
       qbus_create() or qbus_create_inplace()) will get traversed by
       the recursive traversal of whatever bus their parent is on.
 * not exhaustive
    -- any devices not put on a bus, or put on a bus whose parent device
       is not on a bus, will not get reset
 * not modelling GPIO reset signal lines

[*] It turns out we actually don't have any of these any more, so
we can remove the code that deals with them. The only parentless bus
is the main system bus, which is the root of the "reset hierarchy".

This patchset is trying to address:
 * changing to multi-phase
 * modelling of GPIO reset signal lines

It leaves reset as bus-based: currently we do this via qbus_walk_children/
qdev_walk_children, which traverse the bus->children and dev->child_bus
lists, and in the patchset's implementation of Resettable for qdev/qbus
the methods iterate through those.

I think this is reasonable -- we don't want to try to tackle every
reset related problem at once. The two issues the patchset is looking
at fit well together, because the GPIO-reset-lines are a motivation
for switching to multiphase (you need to handle both entering and
leaving reset).

("not exhaustive" is the thing we should really try to
fix at some point, but I have no good ideas for how to do this.)

API DESIGN

On what the right APIs should be: I think we should separate
"the API that's nice for devices to implement" from "the API that's
nice for callers wanting to reset a device". Here's my suggestion
for doing that:


Have the Resettable interface be:
 * init
 * hold
 * exit
 * get_reset_count
 * increment_reset_count (returns previous count)
 * decrement_reset_count (returns new count)
 * some method for "iterate over any Resettable child objects"
   (probably a "call this callback for each child" type API)

Individual devices implement init/hold/exit
Device base class implements the reset_count methods
Device base class implements a default 'init' method that calls dc->reset
  and default hold/exit that are no-ops
Device base class has a new vmstate subsection which migrates the
  reset count, subsection's needed function says "only send
  if reset count is non-zero". Back-compat here should be fine
  as current machines don't implement any way that a device in
  the system can be being held in reset at the point where a
  migration happens. If future changes add features to a
  machine model that permit that, the migration is forwards-compatible.
Device base class implements the iterate-over-children method to
 iterate over the dev->child_bus buses
Bus base class implements reset_count methods
Bus base class implements default no-op init/hold/exit
Bus base class implements the iterate-over-children method to
 iterate over the bus->children devices
Handling migration of the bus base class reset count is a little
 awkward -- we'll need to put it in a vmstate subsection which
 is part of the vmstate of the device which owns the bus.
 (I talked to David Gilbert on IRC about this and have some
 possibilities for how to do it, but will postpone writing them
 out until we've decided whether we like the APIs.)

The "API for devices to implement" is then the init/hold/exit
methods of the Resettable interface -- they don't need to worry
about these methods possibly being called multiple times, and
they don't need to handle the reference count or passing on
the calling of the phase methods to their children. They
just need to implement the correct behaviour for their device
for this phase.

The "API for callers wanting to reset a device" is a set of
helper functions that take a pointer to a Resettable object.
It's these that deal with the reset count and children:

resettable_assert_reset(Resettable *r)
{
   if (r->increment_reset_count() == 0) {
       r->init();
       r->foreach_child(do_call_init);
       r->hold();
       r->foreach_child(do_call_hold);
   }
}

resettable_deassert_reset(Resettable *r)
{
   if (r->decrement_reset_count() == 0) {
      r->foreach_child(do_call_exit);
      r->exit();
   }
}

plus a utility function for "call assert then deassert",
and maybe one that wraps the get_reset_count method.
So callers that want to reset devices (or buses) don't need
to care about phases, they just assert and then deassert reset.

Do you think that works ?


API TRANSITIONS

The other issue here is API transitions: the patchset essentially
obsoletes the old DeviceClass::reset function, for instance. I think
we should be clear about what the old and new APIs here are, and
what our plans for transitioning to the new ones are. In some cases
there are really very few users of the old API -- for instance the
patchset makes qbus_reset_all(bus) a synonym for qbus_reset(bus, false),
but there are only a dozen or so users of qbus_reset_all(). I think
we should just go ahead and convert them all. (For purposes of
structuring the patchset starting with a patch that says "reimplement
qbus_reset_all() in terms of qbus_reset()" is OK, but then we should
fix up the callers afterwards.) There are of course a lot more
implementations of DeviceState::reset so transitioning away from
that is a lot trickier, but we could look at a coccinelle script
that could automate it.

If you could describe in the cover letter of the next version of
the patchseries all the old APIs being deprecated and the new
ones that replace them, I think that would be very helpful.


MISCELLANEOUS MINOR POINTS

I know I suggested the idea of a ResetDomain object, but in the
series as it stands I'm not sure it's serving very much purpose;
perhaps we should drop it for the moment (just leaving the legacy
reset handlers and sysbus reset the way they are) ? We can come back
to it later as a concept.

The "support reset via GPIO line" patch looks generally OK, but
you can't just add fields to the DeviceState vmstate struct -- you'll
break migration from older QEMU versions. The new fields need to
go in a vmstate subsection with an appropriate 'needed' function.

We should definitely make sure we have good documentation for
what device authors should do to implement reset.

thanks
-- PMM
