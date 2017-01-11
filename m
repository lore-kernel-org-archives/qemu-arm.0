Received: by 10.25.205.13 with SMTP id d13csp490784lfg;
        Tue, 10 Jan 2017 16:03:25 -0800 (PST)
X-Received: by 10.55.190.6 with SMTP id o6mr5253042qkf.124.1484093005097;
        Tue, 10 Jan 2017 16:03:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v189si2492996qkd.214.2017.01.10.16.03.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jan 2017 16:03:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cR6Nw-0006Kd-Jk
	for alex.bennee@linaro.org; Tue, 10 Jan 2017 19:03:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cR6Ns-0006KW-A3
	for qemu-arm@nongnu.org; Tue, 10 Jan 2017 19:03:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cR6Nr-0001Ee-5n
	for qemu-arm@nongnu.org; Tue, 10 Jan 2017 19:03:20 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:33323)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cR6Nr-0001EB-04; Tue, 10 Jan 2017 19:03:19 -0500
Received: by mail-oi0-x242.google.com with SMTP id j15so19410639oih.0;
	Tue, 10 Jan 2017 16:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=VD4L6D3HUsWAZC/jUWbhbYIS4ANa2pnYiybHXdeNwQo=;
	b=uloT2f/IFg4X5l3rOyBvYSE2L7jkh5rojCTfYKKPj3HE1VAkXq3mJQDrQERrIHCB1y
	h7+lxGegSbgrl/zR9TJLF33LVQW4X8FMr0mOBNeRVUNwmOCXget+ZgQl1dlZa9oiAjJv
	nzi/Jxa1QX8l+pu+63pJiRFs5htCzDLgTVKnsPIWicWQ0rFNO8CIkhIrZAa3xqzmOwvc
	gvA/4l4osV9fMbmCvnDezuZg5ifRm5rU4zY8MBZElnkilO0QWEGEknOMLvhAWwYgRiCf
	U7EPTCQ7fTifH+KSST1ssggUOZ2xIPFoyASrkCCsfHyKoyl4yYILX/TKPo2cTk18VxPc
	izzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=VD4L6D3HUsWAZC/jUWbhbYIS4ANa2pnYiybHXdeNwQo=;
	b=IzP3SNKpl3BO6ipA0tp7mdpRT9MHKhhNyFsXqTa97i+PiEWmDQ/gcJRWAJ+LvwoO7o
	MqRVtvfZ6abD9JaTQnFdiuO3RkUi1XXlLzapJK7h+SkNPphNZd2BvihxTQYiHE3LXZe3
	+Ib43iKpumFyoRwthDeyJ6GV6C7KYKRLKLlLoUe2Murz9I/J2vWyV1APoxBcdCqCDyzU
	+p+0ocz+TaNGbEvX4/UYtMkpm4GQfa9g/c7FGy1Gdn7f/B8m3wfPc5FUWMpu9DdbyR7m
	ARjCwuTypKF/Jto7dfzMxLrqn3WHOZi4hOUvi6EwN0xjm955wKZJvZt+f8y+HnAjL/LX
	eOlA==
X-Gm-Message-State: AIkVDXJa+Ht9mGAzU4QMFSyYG/AX34oGXzPaWju3R7+8Z64GXJsBxmx61Hjy9ZTe6nlA1XYq8sRb1X4t6fWW7A==
X-Received: by 10.157.22.193 with SMTP id s1mr2723049ots.130.1484092997921;
	Tue, 10 Jan 2017 16:03:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.96.6 with HTTP; Tue, 10 Jan 2017 16:02:47 -0800 (PST)
In-Reply-To: <CAFEAcA8FFHuHTWZ6xteWN+s34g62=W7ukqhCotBKi9shuYt0nQ@mail.gmail.com>
References: <cover.1482265908.git.alistair.francis@xilinx.com>
	<b985247bfcb7375de984e801c4145fde931360bb.1482265908.git.alistair.francis@xilinx.com>
	<CAFEAcA88=_J3==CJ3fy+jurM9APvRErYFhopuz-bJeML5mPSvw@mail.gmail.com>
	<CAKmqyKM74PWeQZZcM_TKwdCfvOz+RAWa3Y2V7favwCiPT0U4rw@mail.gmail.com>
	<CAFEAcA8FFHuHTWZ6xteWN+s34g62=W7ukqhCotBKi9shuYt0nQ@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 10 Jan 2017 16:02:47 -0800
X-Google-Sender-Auth: 0HAQK2-pPk98e9jt4yCRHex59aM
Message-ID: <CAKmqyKNbeHY8v8i4wAKYwwEzoLvSniCyNT-sZrWz2Dyi3hcEGA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 1/3] arm_generic_timer: Add
 the ARM Generic Timer
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
Cc: =?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FZvG0KNGxBh8

On Tue, Jan 10, 2017 at 1:42 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 10 January 2017 at 01:41, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>> On Fri, Jan 6, 2017 at 3:57 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On 20 December 2016 at 22:42, Alistair Francis
>>> <alistair.francis@xilinx.com> wrote:
>
>>>> +    },{ .name = "CNTCV_LOWER",
>>>> +        .addr = A_CNTCV_LOWER,
>>>> +        .post_read = counter_low_value_postr,
>>>> +    },{ .name = "CNTCV_UPPER",
>>>> +        .addr = A_CNTCV_UPPER,
>>>> +        .post_read = counter_high_value_postr,
>>>
>>> Spec says that you should also be able to access the whole
>>> 64-bit counter value with a 64-bit access -- is this reginfo
>>> sufficient to make that work?
>>
>> How do you know, all I see if that it is a 64-bit register. All the
>> documentation about accesses specifies only 32-bit accesses.
>
> v8 ARM ARM DDI0487A.k, I3.5.3 (CNTCV register description):
> "In an implementation that supports 64-bit atomic memory accesses,
> this register must be accessible using a 64-bit atomic access."

Ok, I don't even have that section. I'm going to try to find an updated ARM ARM.

>
>
>>> This means you can't use this device in a system which
>>> doesn't implement TrustZone. I think this would be better
>>> handled by just having the board map the memory region
>>> in to only the Secure address space if it is a TZ-aware board.
>>
>> How can I map something into the secure address space? Is there an
>> example of this? The only think I can find is in the arm/virt.c
>> machine with the secure_sysmem MemoryRegion.
>
> Yeah, virt.c is the place to look -- for instance we put one
> of the UARTs in the secure address space only.
> Basically to support separate address spaces:
>  * create a MemoryRegion to be the secure view of the world
>  * add the NS MemoryRegion to it as a subregion with low
>    priority (so S sees all the NS devices -- this isn't
>    required but that's usually how h/w is set up)
>  * use object_property_set_link() to connect the S memory
>    region to each CPU's secure-memory property
>  * add any S-only devices to the S MemoryRegion

Ok, sounds easy enough.

>
>>>> +REG32(CNTCR, 0x00)
>>>> +    FIELD(CNTCR, EN, 0, 1)
>>>> +    FIELD(CNTCR, HDBG, 1, 1)
>>>> +REG32(CNTSR, 0x04)
>>>> +    FIELD(CNTSR, DBGH, 1, 1)
>>>> +REG32(CNTCV_LOWER, 0x08)
>>>> +REG32(CNTCV_UPPER, 0x0C)
>>>> +REG32(CNTFID0, 0x20)
>>>> +/* We don't model CNTFIDn */
>>>> +/* We don't model the CounterID registers either */
>>>
>>> Does the Xilinx h/w not implement them at all?
>>> (ie do we need a property for "device has the ID regs" if we add them
>>> later?)
>>
>> There is nothing in the register spec describing registers being here.
>>
>> The last register I see is called: (IOU_SCNTRS)
>> base_frequency_ID_register at address 0xFF260020.
>
> I suspect there's an implicit reads-as-zero after that.
> (The frequency table has to have at least one real entry
> plus the zero terminator -- see I3.5.5 (CNTFID0).)
>
> QEMU's implementation will only support one frequency so
> we only need one table entry too (for the moment, anyway).
>
>>> The spec says it's mandatory to have at least the entry for
>>> the counter base frequency plus end-of-table marker.
>>> I would expect EL3 firmware to want to read this table in order
>>> to write the correct values to CNTFRQ_EL0 for each CPU.
>>
>> I don't see anything like that in section I3.5.21 in the ARM ARM,
>> where are you looking?
>
> There's no I3.5.21 in my copy of the spec (rev A.k), I suspect
> you have an older rev. I think the generic timer docs got
> revamped at some point, so you might want to grab the latest rev.
>
> Anyway, it looks like you have got CNTFIDn (that's CNTFID0)
> and an implicit undocumented zero-terminator.
>
> The spec says CounterIDn are IMPDEF, which I guess is why
> your implementation doesn't bother to implement them.

I do have an out of date version. I'll find a newer one and update the
registers to follow that.

Thanks,

Alistair

>
> thanks
> -- PMM
>
