Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3875992wrt;
        Tue, 18 Dec 2018 07:41:56 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WwJj0NEjjRGkAmiOA0vhM0N8qjflPyta/b+IpJLUjYoDx2ReKPbsmeFVcEYPJ3vmj0N66n
X-Received: by 2002:a37:4a87:: with SMTP id x129mr16257393qka.142.1545147716416;
        Tue, 18 Dec 2018 07:41:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545147716; cv=none;
        d=google.com; s=arc-20160816;
        b=P/ynb5MSUgxB/51PMJbwsofZ+0i7YqRD0E6gYaMl40VD2t2qx+aL6CB8KnGa7bySgS
         FBU3OyxGEMl/4DqJV6aJhDUeQg0XBQ9tBd0I6TljJCCPgrVkp3GSS0JusCAtts7z+rPC
         Jm4bv3ob0ToNWqhE56nSyefX+H8hRVtKCLh8+NHQZY6gWX0TX29tDMIR1vcxyTIvFn10
         Z8gGpvxvteOsa378AWROjxQh+P0klUQBcO3IQo/v1QTPkglUX5TCDKJl85nIvb3iHsn3
         f0Ni2JP6+KkMIMLGTmDH88WJz1ZlRqv1QTXwTpu/Q3m1k61DcUYJjUcc3VSZ1gv913LL
         hW9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :dkim-signature:dkim-signature;
        bh=DfqpDRkOhibvrUr7+tzgwtd31vlDN/bJZVy49zB0ano=;
        b=MtUvbvwRLrgbzJF4FwBCyUcEwDVXMUoN2KyFQ9V7tAEeBplIVGEES8Ak9CVFb+l1xQ
         Hi8o+e+uQHLR67rpchDjYw6DlZ6zbnI+mIjST4pRzC1w3/rSxpjkFKEjrKsALWjX//iq
         ww6ANE2jdLUZSlrsBWyXq/7FscmF4wfXbjzPQmpHQvUPaq8TmcmUjCgDrIiB0/u7bsja
         6LWWB/vSKzC8fsmJ+9p1zDNSQgBUKRhvu/xiBqyDPYtGAur9Fh5XECmxmUEPLDwwaLvZ
         CCqdldc46qCTy9qB3+oqP2kp7iBn4xV1HHbfITJM7L6HrxvAn3iGK1iPsGpNRlIxGpCu
         wbFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=GFNzdP+v;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=jO6nGONG;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=D0Iuyj9P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m96si143133qkh.158.2018.12.18.07.41.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Dec 2018 07:41:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=GFNzdP+v;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=jO6nGONG;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=D0Iuyj9P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54574 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gZHVL-00038v-VF
	for alex.bennee@linaro.org; Tue, 18 Dec 2018 10:41:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1gZHFD-0006qn-5M
	for qemu-arm@nongnu.org; Tue, 18 Dec 2018 10:25:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1gZHF7-0004jY-3S
	for qemu-arm@nongnu.org; Tue, 18 Dec 2018 10:25:15 -0500
Received: from greensocs.com ([193.104.36.180]:36089)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1gZHF6-0004ig-4l; Tue, 18 Dec 2018 10:25:09 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 0566B5DB9F2;
	Tue, 18 Dec 2018 16:24:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1545146697;
	bh=I/GeEisdZ5yeUfFK3V5+LeNmaolyKhAyt5HGXuHEZ2w=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=GFNzdP+vtT5X36DYcTH5JMeg8KBMbFlJ+w2Gs2uiJS7V6c3/DDG0Ou+xAhz27Jmye
	hOBEwBKDz8lmnOW5EyUDsyK2Y/swwJ/S7dBxqZpgrO5oQltxw85+kHZ+dkyrOPxhcQ
	Y8sKBRVJyrZ6+j8074BZFV/lBJaz/KGA6iCBbwRA=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=jO6nGONG;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=D0Iuyj9P
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3DwhDFob11ki; Tue, 18 Dec 2018 16:24:56 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 05CF55DB9E7; Tue, 18 Dec 2018 16:24:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1545146696;
	bh=I/GeEisdZ5yeUfFK3V5+LeNmaolyKhAyt5HGXuHEZ2w=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=jO6nGONGLd3blMdEOVrKwAG34VOxhI3Qm7YYmSL1IwcA0OCRQM4mtoRqvMaWI07aN
	Oi7JbF4RbZNJ3apjw735Tln1d3KMCR5igP4WPDZP/UqL2MZcuwgUWgyZsMaHto3ySr
	z69CHXATwVmEr0U0wEaOP8zZNlm5kZoDYgBPbncE=
Received: from [172.16.10.145] (antfield.tima.u-ga.fr [147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 6E54E5DB9E7;
	Tue, 18 Dec 2018 16:24:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1545146695;
	bh=I/GeEisdZ5yeUfFK3V5+LeNmaolyKhAyt5HGXuHEZ2w=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=D0Iuyj9PBpOb0Lu1ZF7n2W9YaiXjBtXeciBqzWvusCtossn26u0BtLdv10QluPLfD
	o7Ny4A8TVModuxo7G1/E3uzp21MRFdpYLRZcRUHtXo+kTe9sAH9IQhkH1QH/x47PiZ
	eAK9A6c3/mN6VaFmML8fp9OAYb/395Un+qUuWaJc=
To: Peter Maydell <peter.maydell@linaro.org>
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
	<09e1483c-298e-d41a-f9c9-4f186f530dcb@greensocs.com>
	<CAFEAcA9cNMiB01hSerawnfZsyXbJsrJYs_vFfWMi294XYeV8Zw@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <bb9c73c9-68e8-42f4-1e5f-f476b447db06@greensocs.com>
Date: Tue, 18 Dec 2018 16:24:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9cNMiB01hSerawnfZsyXbJsrJYs_vFfWMi294XYeV8Zw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH v5 0/9] Clock framework API.
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y1I4MtWCxS0o



On 10/16/18 5:48 PM, Peter Maydell wrote:
> On 12 October 2018 at 16:26, Damien Hedde <damien.hedde@greensocs.com> wrote:
>> Hi Peter,
>>
>> Sorry to bother you with this, but you said some time ago you would
>> write something about reset.
> 
> Yeah, sorry about that. I haven't found (made) the time to think
> the issues through yet. Let me just dump to email the notes I had.
> This is a very "raw" set of notes, so it's not very organised and
> has a lot of 'todo' bits in it...
> 
> 
> Overall question -- does anybody know of other device modelling
> systems that do a good job of modelling reset, and how they do it?
> If we can borrow a proven design that might be better tha
> thrashing one out ourseles...
> 
> 
> My idea was roughly that we need a multi-phase reset, something like:
> 
>  PHASE 1:
>    Devices reset internal state. No calls out to other devices
>    (ie no setting IRQ line state, etc)
>    Some common bit of code (dev base class?) marks the device
>    reset as being in-progress by setting dev->resetting = true.
> 
>  PHASE 2:
>    Devices update their output lines (calls to irq line setting
>    functions, clock setting, etc)
>    In this phase devices may be the recipients of callbacks for
>    IRQ line level changes, etc, and must cope with this. A
>    callback can tell it's being called for a level change during
>    reset because dev->resetting will be true.
>    (They can update their own outputs in response to input changes.)
> 
>  PHASE 3:
>    Common code (dev base class) sets dev->resetting = false.
>    (Individual devices don't get to do anything here, unless
>    there's some painful case that requires it.)
> 
> The theory is that by decoupling reset into multiple phases
> we can avoid most of the reset order issues, by having the
> two ends do things in the right phase and/or by having
> the destination end be able to identify when a change is
> happening in the middle of reset.

This strategy seems fine to me.

> 
> Compatibility with existing device reset methods:
> essentially the current rules are the same as the "phase 1"
> rules, so we can just say that the current reset code in
> all devices is phase 1 reset. Then we can adjust anything
> that needs a phase 2 (which is probably not all that many
> devices).
> 
> Places where reset order currently matters:
> (this is just a list of things we should make sure our design
> copes with)
>  * wired-high IRQ lines, and device outputs that are asserted
>    as the device comes out of reset
>  * setting PC in the generic-loader device vs CPU reset
>  * image load (rom image reset) vs Arm M-profile reset wanting
>    to read the reset PC/SP from memory
>  * Arm M-profile CPUs should have INITVTOR as a config signal input
>  * x86 CPU vs APIC reset order ??
>  * anything else?
> 
> We should have some sort of "reset domain" object which can
> contain devices and also other reset domains. A reset domain's
> reset is simple: its phase 1 reset is "for each child, do
> phase 1 reset for that child", similarly for phases 2 and 3.
> A reset domain has an overall "reset" method that says
> "do phase 1 for all children, then phase 2, then phase 3".
> This allows things like "this SoC has a reset line which
> resets all its internal devices". (Do we want to give
> reset domains input gpio lines to trigger reset, or is
> being able to call a method on it sufficient?)

Consider the following use case: a platform with a controller that holds
a reset line on another device (starting with reset held).
At the beginning, the main (cold) reset will be triggered to start the
platform. During phase 2, the controller will set the reset line of the
other device (a gpio). Then we have phase 3. How do we handle this ?
Do we need to "delay" the phase 3 of the device until the controller
releases its reset line or do we consider the internal gpio reset line
to be outside of this reset scope ?

If we do that, we have 2 reset "sources": the main reset and the
internal gpio and there is some kind of OR operation to do between these
2 sources.

> 
> At the moment we have reset methods on devices:
>  * each bus handles reset for the things on the bus
>  * the (one and only) sysbus resets all the sysbus devices
>  * devices on no bus don't get reset at all unless something
>    takes special measures! (notably the CPUs are reset in
>    a very ad-hoc way at the moment)
> I guess this should be cleaned up by making each bus be
> a 'reset domain', and having a "system" reset domain which gets
> anything which doesn't have a parent reset domain (and which
> we then use for whole-board power-on reset). Calling the
> system reset domain's overall reset method will then do
> the 3-phase reset for everything>
> How would direct qemu_register_reset() calls fit into this
> scheme? (Some of them are devices that could get QOM reset
> methods instead. Perhaps we could get away with dumping the
> rest into the 'master reset' domain, or leaving them as-is?
> Some are for CPU reset which we definitely should clean up.)
> 
> We need to handle different types of reset somehow, in
> particular "cold/power on reset" versus "warm reset".
> Can we do this just with reset domain objects, or do we
> need/want to pass each device's reset method a "type" argument?

Maybe phase 1 only needs the type, phase 2 and 3 can only depends on the
device state.

Anyway, this reset problem seems outside of the scope of this patch set.
I think I'll do a reroll with the remark I've got so far, but it will
still miss the reset part to be well integrated. I can also propose
something in another rfc about the 3-phase reset to advance on that part.

--
Damien
