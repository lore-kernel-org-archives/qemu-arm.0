Received: by 10.103.86.17 with SMTP id k17csp457503vsb;
        Tue, 20 Dec 2016 14:48:16 -0800 (PST)
X-Received: by 10.55.182.4 with SMTP id g4mr1759372qkf.19.1482274096158;
        Tue, 20 Dec 2016 14:48:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z59si13461210qtc.77.2016.12.20.14.48.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Dec 2016 14:48:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53817 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cJTCf-0000L7-RB
	for alex.bennee@linaro.org; Tue, 20 Dec 2016 17:48:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cJT8m-0004ne-C5
	for qemu-arm@nongnu.org; Tue, 20 Dec 2016 17:44:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cJT8l-000466-75
	for qemu-arm@nongnu.org; Tue, 20 Dec 2016 17:44:12 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:33053)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cJT8i-000431-Am; Tue, 20 Dec 2016 17:44:08 -0500
Received: by mail-oi0-x241.google.com with SMTP id f201so25994504oib.0;
	Tue, 20 Dec 2016 14:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=H/Lck/4i82chWB3We+nQSRxXQrJ1T/U6DLiz1VjOZNo=;
	b=U5t7K3NbeRQC9RsloNHXbkD6cpilPyL5fhusCbZC6JaCMpLJOgpXEJHcscYruda769
	c43LORDey0iYgzDQBQ7e9Ya4QFQVtSzMSp9uGlnVGVXMAuzaWnc36azrZPH/dMd+BEeN
	e/zYjbF+7OzfUwHB4fIPDkAIUENHV1nhAovaOIWZBzX6iKUfpF9Gp59aUtLD+zx2ueT5
	9NNbpz012M4ICQzuED7chglEGzKhFnIpIZCeFT+7bFgHzqANl7QH5mdS1Uqrrb5IGlle
	ALeGAMcsLIZ+ZSYpLtfiLCDf0YKG79iGTS6Hxsm4lrghm14rw8g7I2cGShtsmj2kjpRx
	rPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=H/Lck/4i82chWB3We+nQSRxXQrJ1T/U6DLiz1VjOZNo=;
	b=kZ6mf2xqKbNJDvKE4jgYA0MkGek9UXmNG2yvt7SHKVMCmXXLuIuJ0VUqLhuB5RR/Cp
	fVEUZH3halFyYiyg9a/46LO5ECsiZ4QDw20grddEHGXNIJzRWk4vUiLhFTnWDC+a/cDH
	4ioQFVBLW/XeBuCSejYTyUvYD3lWBVkGArJa1L6tLAYMMXS9puKwzoK6+Lc8h4gQEp3b
	79sGcEgJT1ZMP5e9A3ZcvUMDcV+vTMd2eG8iqgSOZ0SEVJdmvElwQ6ftsAwzYgKLBgcq
	2Hfm08NrHX2vbZpoBQsYedACnXbIEv9dqF1Al7WUyVVF0ijNSQlkx4VW5/pBbkLauAIP
	RyVQ==
X-Gm-Message-State: AIkVDXLyB524wcvakuLfQFS3xitBDGHRbFdW1+huY8Oq5bW5MYqQi/gtl4iGBuvyM4VYGHVhykWEDXXCQEp2UQ==
X-Received: by 10.202.84.65 with SMTP id i62mr935803oib.68.1482273845774; Tue,
	20 Dec 2016 14:44:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.96.6 with HTTP; Tue, 20 Dec 2016 14:43:35 -0800 (PST)
In-Reply-To: <CAKmqyKOY4ZZrRDcp29QWszAJw-pTrasFUq94Xbm5YqrxFgfCaw@mail.gmail.com>
References: <cover.1478566669.git.alistair.francis@xilinx.com>
	<71bc12badf4f3125765146c21b4976b1d07dce46.1478566669.git.alistair.francis@xilinx.com>
	<CAFEAcA9vrhPyHbpWqxjS167f_aG-NRf7EVms=dg6ULah_fwmgw@mail.gmail.com>
	<CAKmqyKOY4ZZrRDcp29QWszAJw-pTrasFUq94Xbm5YqrxFgfCaw@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 20 Dec 2016 14:43:35 -0800
X-Google-Sender-Auth: I6EJJnrUl1XBRE03nWiNlBjdRQo
Message-ID: <CAKmqyKMPV8JsTRf4qDV0JisbeqV2YSN4Qx7EgDREmwmq8jns_Q@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v2 1/2] arm_generic_timer: Add the ARM
 Generic Timer
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7pNq46kDGOrV

On Fri, Dec 16, 2016 at 1:03 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Tue, Dec 13, 2016 at 5:11 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 8 November 2016 at 00:58, Alistair Francis
>> <alistair.francis@xilinx.com> wrote:
>>> Add the ARM generic timer. This allows the guest to poll the timer for
>>> values and also supports secure writes only.
>>>
>>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>>> ---
>>> V2:
>>>  - Fix couter/counter typo
>>>
>>>  hw/timer/Makefile.objs               |   1 +
>>>  hw/timer/arm_generic_timer.c         | 216 +++++++++++++++++++++++++++++++++++
>>>  include/hw/timer/arm_generic_timer.h |  60 ++++++++++
>>>  3 files changed, 277 insertions(+)
>>>  create mode 100644 hw/timer/arm_generic_timer.c
>>>  create mode 100644 include/hw/timer/arm_generic_timer.h
>>
>> I can't quite seem to make this line up with the spec in the v8
>> ARM ARM (chapter 11 "System Level Implementation of the Generic
>> Timer"). The generic timer documented there looks quite like this,
>> but has extra ID registers at 0xFD0..0xFFC which this code doesn't
>> implement, and also has the "CNTReadBase" memory map (which
>> exposes just the count value and ID registers) as well as the
>> "CNTControlBase" map that looks like what you have here.
>> (The register names here differ from the conventions in the
>> ARM ARM too.)
>
> Of course they don't line up :(
>
> I wrote it based off the Xilinx documentation, I (wrongly) assumed
> that we would follow the normal convention but apparently not.
>
>>
>> Is this code trying to implement that Generic Timer, or something
>> else with a similar name?
>
> I'm not sure now which one it is.
>
> I will dig into this and hopefully can respin this based on what is in
> the ARM ARM.

It turns out it is pretty close.

I have fixed up the names to be more like the ARM ARM. I have added
some comments about the implementation specific registers and I have
added the read base registers as well.

Sending out a V3.

Thanks,

Alistair

>
>>
>>> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
>>> index 7ba8c23..f88c468 100644
>>> --- a/hw/timer/Makefile.objs
>>> +++ b/hw/timer/Makefile.objs
>>> @@ -17,6 +17,7 @@ common-obj-$(CONFIG_IMX) += imx_epit.o
>>>  common-obj-$(CONFIG_IMX) += imx_gpt.o
>>>  common-obj-$(CONFIG_LM32) += lm32_timer.o
>>>  common-obj-$(CONFIG_MILKYMIST) += milkymist-sysctl.o
>>> +common-obj-$(CONFIG_XLNX_ZYNQMP) += arm_generic_timer.o
>>
>> If this is really generic I think it ought to have its own
>> CONFIG_foo rather than using the XLNX_ZYNQMP symbol.
>
> Yes, Fred pointed that out as well. I will fix that up in the next version.
>
>>
>>>
>>>  obj-$(CONFIG_EXYNOS4) += exynos4210_mct.o
>>>  obj-$(CONFIG_EXYNOS4) += exynos4210_pwm.o
>>
>>> +static uint64_t counter_low_value_postr(RegisterInfo *reg, uint64_t val64)
>>> +{
>>> +    ARMGenTimer *s = ARM_GEN_TIMER(reg->opaque);
>>> +    uint64_t current_ticks, total_ticks;
>>> +    uint32_t low_ticks;
>>> +
>>> +    if (s->enabled) {
>>> +        current_ticks = muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL),
>>> +                                 NANOSECONDS_PER_SECOND, 1000000);
>>> +        total_ticks = current_ticks - s->tick_offset;
>>> +        low_ticks = (uint32_t) total_ticks;
>>> +    } else {
>>> +        /* Timer is disabled, return the time when it was disabled */
>>> +        low_ticks = (uint32_t) s->tick_offset;
>>> +    }
>>> +
>>> +    return low_ticks;
>>> +}
>>> +
>>> +static uint64_t counter_high_value_postr(RegisterInfo *reg, uint64_t val64)
>>> +{
>>> +    ARMGenTimer *s = ARM_GEN_TIMER(reg->opaque);
>>> +    uint64_t current_ticks, total_ticks;
>>> +    uint32_t high_ticks;
>>> +
>>> +    if (s->enabled) {
>>> +        current_ticks = muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL),
>>> +                                 NANOSECONDS_PER_SECOND, 1000000);
>>> +        total_ticks = current_ticks - s->tick_offset;
>>> +        high_ticks = (uint32_t) (total_ticks >> 32);
>>> +    } else {
>>> +        /* Timer is disabled, return the time when it was disabled */
>>> +        high_ticks = (uint32_t) (s->tick_offset >> 32);
>>> +    }
>>> +
>>> +    return high_ticks;
>>
>> These two functions are very similar and would benefit from
>> being refactored to call a utility function that just returned
>> the 64-bit count.
>
> Good point.
>
> Thanks,
>
> Alistair
>
>>
>> thanks
>> -- PMM
