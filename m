Received: by 10.25.208.211 with SMTP id h202csp3274763lfg;
        Fri, 26 Feb 2016 02:20:30 -0800 (PST)
X-Received: by 10.140.95.117 with SMTP id h108mr762660qge.65.1456482029978;
        Fri, 26 Feb 2016 02:20:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 39si12554085qkp.31.2016.02.26.02.20.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Feb 2016 02:20:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:48588 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZFVd-0004YG-F6
	for alex.bennee@linaro.org; Fri, 26 Feb 2016 05:20:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZFVa-0004Xz-GZ
	for qemu-arm@nongnu.org; Fri, 26 Feb 2016 05:20:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZFVZ-0001UV-Eb
	for qemu-arm@nongnu.org; Fri, 26 Feb 2016 05:20:26 -0500
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:34441)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aZFVY-0001Tx-6g
	for qemu-arm@nongnu.org; Fri, 26 Feb 2016 05:20:25 -0500
Received: by mail-vk0-x229.google.com with SMTP id e185so73132444vkb.1
	for <qemu-arm@nongnu.org>; Fri, 26 Feb 2016 02:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2oxqIUPaS8z5PsBLSVZy6pkZXouaFJJZHAQhr0KtNdg=;
	b=dP+Eq/BVSoJ00P1LNnIzsawg7xBOzVQDw29tQdK8C1yavdtm9V6atdVxaxa06nOkS4
	X/M62cRE50D34Ic4JCtTMP1uBHLgMjzn+PmzBOuSPysZr+h5jdLNr1k8HrF1b2Gf8EbM
	XlRPUj4ZVhOeSZ8lFfYLhOpHrfTLTiUXahTJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2oxqIUPaS8z5PsBLSVZy6pkZXouaFJJZHAQhr0KtNdg=;
	b=bLvLZr0Nwei1dtOf4CE9wmOvG82DKDm39OmpL3HQv5XqZjr70tSwmLmkkdadbJrbUq
	jnLEj0uNNR7F90PtU8qPu6Sqe3aI4EO1yTE/EMkuqSxkCy3ofbLhMws03s+n5jdzLwVB
	YPl/NXAy0vctaqn2Qk/ikbkAbmHmWLm4zgKNAD07yCu8QaoThTS6QwIAJgf/67m6uefM
	Xykeobpi0j//niKwpLiF0ierm247cBmtKywC9+mESDPW2QQb4qMisZhX+KAw9qA/V5/4
	jV74aqZTaqmR1q/7rB85+Zr7tuARQ6xQZYN6T1bbe/PbfOjvgDtFjvmzWC3znFG2OFkl
	oEzA==
X-Gm-Message-State: AD7BkJKYAxyEj6+AKApf98kiDirZpnx6j86klRAVYSEvRmxdghscpvLgcgaG9zuydTtJoH6UwSH50HcV25C6rZPB
X-Received: by 10.31.141.2 with SMTP id p2mr475420vkd.37.1456482023539; Fri,
	26 Feb 2016 02:20:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 26 Feb 2016 02:20:04 -0800 (PST)
In-Reply-To: <1456456460.27420.147.camel@aj.id.au>
References: <1455622497-25966-1-git-send-email-andrew@aj.id.au>
	<1455622497-25966-2-git-send-email-andrew@aj.id.au>
	<CAFEAcA9MJtKbNR+XvqgU_c6SJc0QWg7VGMknWmrr3qiDL6aeng@mail.gmail.com>
	<1456456460.27420.147.camel@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Feb 2016 10:20:04 +0000
Message-ID: <CAFEAcA8vH6vOMi88DLOxe8Z8XC+dECytsVth2zsToBd_9MH3SQ@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: openbmc@lists.ozlabs.org, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2 1/3] hw/timer: Add ASPEED AST2400 timer
 device model
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JggZ1QWDLZ3o

On 26 February 2016 at 03:14, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hi Peter,
>
> On Thu, 2016-02-25 at 16:11 +0000, Peter Maydell wrote:
>> On 16 February 2016 at 11:34, Andrew Jeffery <andrew@aj.id.au> wrote:
>> > Implement basic AST2400 timer functionality: Timers can be configured,
>> > enabled, reset and disabled.
>> >
>> > A number of hardware features are not implemented:
>> >
>> > * Timer Overflow interrupts
>> > * Clock value matching
>> > * Pulse generation
>> >
>> > The implementation is enough to boot the Linux kernel configured with
>> > aspeed_defconfig.
>>
>> Thanks; this mostly looks in reasonable shape; I have some comments below.
>>
>> Do we have a datasheet for this chip ?
>
> Unfortunately I don't know of a publicly available datasheet. What's
> the best way to proceed in this case?

We have devices in the tree that are either based on non-public datasheets
or occasionally reverse engineered from Linux kernel drivers. That's OK,
but it's nice to be clear in a comment at the top what the source is,
so people maintaining it later know how much to trust the current code
and (if possible) where to look for clarification.

>> All source files need to #include "qemu/osdep.h" as their first
>> include. That then means you don't need to include assert.h or
>> stdio.h yourself.
>>
>> What do we need from qemu/main-loop.h?
>
> I'm using it for qemu_bh_new() which is required by ptimer, who registers
> the aspeed_timer_tick() callback into the main loop timer handling.

OK, no problem.

>> > +static void aspeed_timer_irq_update(AspeedTimer *t)
>> > +{
>> > +    qemu_set_irq(t->irq, t->enabled);
>>
>> Surely the timer doesn't assert its IRQ line all
>> the time it's enabled? This doesn't look like the right condition.
>
> So I think this is correct despite how it looks. There's some cruft
> from modelling the implementation off of another timer that's probably
> obscuring things, which should be fixed. aspeed_timer_irq_update()
> is only called from aspeed_timer_tick(), so I'll just merge the two.
> Then by renaming aspeed_timer_tick() to aspeed_timer_expire() as
> mentioned above, this won't look so strange? I've read through the
> timer handling code (the processing loop in timerlist_run_timers())
> and my understanding is it has the behaviour we want - callback on
> expiry, not on ticks - which is not how it reads as above.

Usually functions in QEMU called thingy_irq_update() are the ones
that do "look at current state of device and assert IRQ as
necessary"; often this is "mask irq raw state against some
irq-masking bit". Merging this into the timer expire function will
probably help. (Is there no register bit that the guest can query
that indicates "timer expired" or "raw interrupt state" ?)

>> You should implement a VMState struct for device migration,
>> and wire it up here via dc->vmsd.
>
> I'll look into it. I started experimenting with a VMState struct
> early on in the implementation but threw it away as it wasn't my
> primary focus at the time.

We insist on vmstate structs for all new devices, because
they're fairly easy to implement, and if the original
submitter doesn't implement one then the device becomes
a landmine for any user trying migration or vmstate snapshots,
because it will silently misbehave.

thanks
-- PMM
