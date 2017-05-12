Received: by 10.25.0.6 with SMTP id 6csp62740lfa;
        Thu, 11 May 2017 21:38:37 -0700 (PDT)
X-Received: by 10.200.51.172 with SMTP id c41mr1990180qtb.71.1494563917582;
        Thu, 11 May 2017 21:38:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494563917; cv=none;
        d=google.com; s=arc-20160816;
        b=q9ttgwYgxaW5TYEapbigt+Hb4y6h1qmcBP9EC5Cd6tJ2oLZDqg+2OT9/5sJlnMMQjN
         7ns+wDbCjDfIGHcdEZ88KyYCdAlfFe9+Rhw1R/thmdt7mXSBMFfyPbXHO5gRJovajz7W
         T17NrSt9nWvVbfy8gv7QmfxcZD4ODYHuXzBpq9nS5bAvYr2XrMAuHDa2zEUj6DA3uxGR
         n9YgIvotpzVEZA0omEy83NGEwaVxUIirGTHptUKz7i9aPhGICzX3Es7gmgekflbfeBjj
         UWnPHms8Hyb2R1Qn8ozlGNlgEORM2DU41vhRLzLsBf6P7pyeKUSBKP3uSGLxx9fLe1GG
         POcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=eqPTHDLr3wFogrWd901z5lY3B0PUGPdelh3VdNSAxOk=;
        b=FVVtw8zu4Xqv9Qx9Pky/0HFmFbW45O+TuoLwV+6Vg1EOPuxB0tSN4On3KBu69HOH/P
         XBQZ7ve1akZ75uAXJ7we/UNu3NcRTTK+FClnece17f00ZZZkZAVRa2ZfVvi0sUpYuOgT
         8lfcHZUmqcz3AXtBG4UZsxdXffXdagHYjF3EG2rUUIF2W1PuRKtu3mE9qlhHuAGzKi/z
         xVV7C00cnHaxx1EysOJieuju4io4r63zQ8qoMfCKopxN4lpNtCmbQXf0qOxWK/ED7Gw4
         ePN+VcPpui5ihE0VCV2jzgQDny12Tlh4XNvkQNinAORQe6K2W3EWl2vcK/wV65y/xQaQ
         6p0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t37si2152061qtg.295.2017.05.11.21.38.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 May 2017 21:38:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51283 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d92Ld-0007hw-1A
	for alex.bennee@linaro.org; Fri, 12 May 2017 00:38:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d92LW-0007hf-Dt
	for qemu-arm@nongnu.org; Fri, 12 May 2017 00:38:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d92LT-00038z-AX
	for qemu-arm@nongnu.org; Fri, 12 May 2017 00:38:30 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:35796)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d92LT-00038q-2Y; Fri, 12 May 2017 00:38:27 -0400
Received: by mail-qt0-x241.google.com with SMTP id r58so5476854qtb.2;
	Thu, 11 May 2017 21:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=eqPTHDLr3wFogrWd901z5lY3B0PUGPdelh3VdNSAxOk=;
	b=bwQobgtlf7j7LfhtEqE7TFaLAil+zP8Ass961YJkrPpcg2qGlNrJtS3qyIXp/k1xs9
	uzTV0dAC44cL+UjlDEmJ/IujCX43jYFkWVYCkh3pVKYSTBWFQTQRZITsYubbgsmZodKD
	QB3lfAaxlkzlOWi+8wOnwpHYFD8IFhTY1zY4XtrsrNXtEPo6oGQdtT0Xkohd0yVzNNZR
	7Z2Y2wjfrHlwxaZuaYb9K7f4LQtU0ncRHMBinYoTg+VQUpNQHMspyFq18Q3vTarETwRo
	fBndUPuwr2Aye+w061kXlZshWSxpCn5KdDn6kYHfzVt42zqTUx/i0P3+aQMOsIVtduHx
	U0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=eqPTHDLr3wFogrWd901z5lY3B0PUGPdelh3VdNSAxOk=;
	b=DckuI9fTOfKy5nAdQCnq3yqAOM5CoyBSphEls9ttNuOXa7/gX1+KYCgW/TpcTJdhj9
	9Hyszwlu6/0P/V2rRn6icVIzFqn09n3ofQVwCgQDHkSTP7TL8k4oZw8mcXrI4QJYjocd
	9KX2CZw9mUTTfVvH07ErH1tdePJJeI9LjFLjUzBUOC3pF32n8+bLslPtZLPFQJrLClLH
	cEG8/KnLIqjRa0a4i1Vkt+3M3O9I+D7Pk3Hi/pDK7NtGidCGT8TQNZDV5iPbtD+VLoo2
	2UVg/K2iryO12pxMu7TiZUA7FvijbF4p4YfKwmtOAWk+EaWC6OHWiWAJqjU0504sLyNg
	e9hQ==
X-Gm-Message-State: AODbwcAUY7dYIouDUDaR9vxB504bJK2gpNUPxlMibw36oGMuSKHbpnk4
	z0lTNHsCsx7UoA==
X-Received: by 10.200.38.76 with SMTP id v12mr2095554qtv.257.1494563906304;
	Thu, 11 May 2017 21:38:26 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	r19sm1544867qkl.54.2017.05.11.21.38.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 May 2017 21:38:25 -0700 (PDT)
To: sundeep subbaraya <sundeep.lkml@gmail.com>
References: <1494348286-10253-1-git-send-email-sundeep.lkml@gmail.com>
	<1494348286-10253-2-git-send-email-sundeep.lkml@gmail.com>
	<e87597ba-4759-76a5-7b0d-3297d2eb8f79@amsat.org>
	<CALHRZuqfqjEWszkvVQSWAKR5zVbhD36=+Qt_DsVykk41cihO1Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1dc2ee8a-be60-c276-5529-a666223bfc2b@amsat.org>
Date: Fri, 12 May 2017 01:38:22 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CALHRZuqfqjEWszkvVQSWAKR5zVbhD36=+Qt_DsVykk41cihO1Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [Qemu-devel PATCH 1/5] msf2: Add Smartfusion2 System
 timer
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
	Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EMAf72KT+V1a

On 05/10/2017 09:37 AM, sundeep subbaraya wrote:
> Hi Phil,
>
> On Wed, May 10, 2017 at 3:11 PM, Philippe Mathieu-Daudé <f4bug@amsat.org
> <mailto:f4bug@amsat.org>> wrote:
>> Hi Subbaraya, nice work!
>>
>> The timer you are modeling is the mss_timer, which is in particular
> used in
>> the smartfusion2, I'd rather name it mss_timer.c so it can be reused by
>> other SoC models.
>>
> Ok I will change all other file names also to mss. Do I need to change
> type names
> also to mss?

As you wish :) Actel/Microsemi keep changing how they name it, MSS, 
M2S... What I mean is this timer is valid for a Actel SmartFusion and 
for the MicroSemi SmartFusion2, naming it "msf2-timer" seems to restrict 
it to the SF2 only.

>> I added few comments.
>>
>>
>> On 05/09/2017 01:44 PM, Subbaraya Sundeep wrote:
>>>
>>> Modelled System Timer in Microsemi's Smartfusion2 Soc.
>>> Timer has two 32bit down counters and two interrupts.
>>>
>>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com
> <mailto:sundeep.lkml@gmail.com>>
>>> ---
>>>  hw/timer/Makefile.objs        |   1 +
>>>  hw/timer/msf2-timer.c         | 252
>>> ++++++++++++++++++++++++++++++++++++++++++
>>>  include/hw/timer/msf2-timer.h |  85 ++++++++++++++
>>>  3 files changed, 338 insertions(+)
>>>  create mode 100644 hw/timer/msf2-timer.c
>>>  create mode 100644 include/hw/timer/msf2-timer.h
>>>
[...]
>>> +        if (addr < ARRAY_SIZE(st->regs)) {
>>> +            st->regs[addr] = value;
>>> +        } else {
>>> +            qemu_log_mask(LOG_GUEST_ERROR,
>>> +                         "%s: Bad offset 0x%" HWADDR_PRIx "\n",
> __func__,
>>> +                         addr * 4);
>>> +        }
>>> +        break;
>>> +    }
>>> +    timer_update_irq(st);
>>
>>
>> Here if addr >= (NUM_TIMERS * R_TIM1_MAX) you still update Timer1 IRQ,
> while
>> this is unharmful right now this is likely to be break later.
>>
> As long as Interrupt status register and Interrupt enable register are not
> modified calling timer_update_irq will not harm. Am I missing something
> here?

Indeed, this is unharmful. It just surprised me when I follow the 
control flow.

>>> +}
>>> +
>>> +static const MemoryRegionOps timer_ops = {
>>> +    .read = timer_read,
>>> +    .write = timer_write,
>>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>>> +    .valid = {
>>> +        .min_access_size = 4,
>>
>>
>> I believe min_access_size = 1 is valid for any APB device.
>>
>>
> Ok. I followed Xilinx soft IP models while writing this. I am really not
> sure it is mandatory to put access_size. Can i remove it?

checking the datasheet "UG0331: SmartFusion2 Microcontroller Subsystem":

'''
CMSIS Data types:

The [Cortex-M3] processor:
* supports the following data types:
- 32-bit words
- 16-bit halfwords
- 8-bit bytes.
* manages all data memory accesses as little-endian or big-endian. 
Instruction memory and Private Peripheral Bus (PPB) accesses are always 
performed as little-endian. The Cortex-M3 processor configured for 
SmartFusion2 SoC FPGA MSS uses only little-endian.
'''

So Yes, ".min_access_size = 1" is correct for this Cortex-M3.

If you remove it memory_region_access_valid() will do:

     access_size_min = mr->ops->valid.min_access_size;
     if (!mr->ops->valid.min_access_size) {
         access_size_min = 1;
     }

So that is the same, personally I prefer it to be explicit (not removed).

>>> +        .max_access_size = 4
>>> +    }
>>> +};
>>> +
>>> +static void timer_hit(void *opaque)
>>> +{
>>> +    struct Msf2Timer *st = opaque;
>>> +
>>> +    st->regs[R_TIM_RIS] |= TIMER_RIS_ACK;
>>> +
>>> +    if (!(st->regs[R_TIM_CTRL] & TIMER_CTRL_ONESHOT)) {
>>> +        timer_update(st);
>>> +    }
>>> +    timer_update_irq(st);
>>> +}
[...]
>>> +/*
>>> + * There are two 32-bit down counting timers.
>>> + * Timers 1 and 2 can be concatenated into a single 64-bit Timer
>>> + * that operates either in Periodic mode or in One-shot mode.
>>> + * Writing 1 to the TIM64_MODE register bit 0 sets the Timers in 64-bit
>>> mode.
>>> + * In 64-bit mode, writing to the 32-bit registers has no effect.
>>> + * Similarly, in 32-bit mode, writing to the 64-bit mode registers
>>> + * has no effect. Only two 32-bit timers are supported currently.
>>> + */
>>> +#define NUM_TIMERS        2
>>> +
>>> +#define MSF2_TIMER_FREQ   (83 * 1000000)
>>
>>
>> I can not find this value, can you point me to the datasheet? It seems SoC
>> specific to me.
>>
> It is configured in Microsemi Libero. The SOM kit from Emcraft comes
> with this default setting.
> I guess this property should be set and passed from board file and not
> from SoC.
> Am I correct?

It seems an option configurable in Libero before synthesizing, so that 
would be SoM/bitfile specific?

What I mean here is I don't think this is a fixed value for a mss_timer 
and I'd rather have it configurable (but ok to default 83MHz in your SoM).

 > Can I attach the datasheet to this thread?

Isn't this datasheet publicly available?

Eventually can you upload a binary (like your Linux patches) somewhere? 
So it would be easier to test this patchset.

> Thank you,
> Sundeep

Good luck!

Phil.
