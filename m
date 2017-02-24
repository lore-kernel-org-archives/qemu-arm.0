Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local (host5-81-235-77.range5-81.btcentralplus.com. [5.81.235.77])
        by smtp.gmail.com with ESMTPSA id s17sm11133725wrc.6.2017.02.24.09.25.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Feb 2017 09:25:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 83DAB3E0198;
	Fri, 24 Feb 2017 17:25:04 +0000 (GMT)
References: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org> <1487262963-11519-4-git-send-email-peter.maydell@linaro.org> <CAFEAcA-JoKKkKtL=W0ecVQ=+wHbxe-gxKGho8GDm95YuyD7rWw@mail.gmail.com>
User-agent: mu4e 0.9.19; emacs 25.2.5
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, "patches\@linaro.org" <patches@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 03/13] armv7m: Rewrite NVIC to not use any GIC code
In-reply-to: <CAFEAcA-JoKKkKtL=W0ecVQ=+wHbxe-gxKGho8GDm95YuyD7rWw@mail.gmail.com>
Date: Fri, 24 Feb 2017 17:25:04 +0000
Message-ID: <87innzlcwf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: 8yJXbSBT4Dcl


Peter Maydell <peter.maydell@linaro.org> writes:

> On 16 February 2017 at 16:35, Peter Maydell <peter.maydell@linaro.org> wrote:
>> From: Michael Davidsaver <mdavidsaver@gmail.com>
>>
>> Despite some superficial similarities of register layout, the
>> M-profile NVIC is really very different from the A-profile GIC.
>> Our current attempt to reuse the GIC code means that we have
>> significant bugs in our NVIC.
>>
>> Implement the NVIC as an entirely separate device, to give
>> us somewhere we can get the behaviour correct.
>>
>> This initial commit does not attempt to implement exception
>> priority escalation, since the GIC-based code didn't either.
>> It does fix a few bugs in passing:
>>  * ICSR.RETTOBASE polarity was wrong and didn't account for
>>    internal exceptions
>>  * ICSR.VECTPENDING was 16 too high if the pending exception
>>    was for an external interrupt
>>  * UsageFault, BusFault and MemFault were not disabled on reset
>>    as they are supposed to be
>>
>> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
>> [PMM: reworked, various bugs and stylistic cleanups]
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
>> +    case 0x400 ... 0x5ef: /* NVIC Priority */
>> +        startvec = 8 * (offset - 0x400) + NVIC_FIRST_IRQ; /* vector # */
>> +
>> +        for (i = 0; i < size; i++) {
>
> Just noticed this line should be
> +        for (i = 0; i < size && startvec + i < s->num_irq; i++) {
>
> which brings it into line with the nvic_sysreg_read() code
> and prevents an assert() in set_prio() if the guest writes to
> registers beyond the end of the implemented IRQ range.
>
>> +            set_prio(s, startvec + i, (value >> (i * 8)) & 0xff);
>> +        }
>> +        nvic_irq_update(s);
>> +        return;
>
> Unless there's some other problem that means I need
> to respin anyway I propose to just squash in that fix.

With the squashed fix:

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

>
> thanks
> -- PMM


--
Alex Bennée
