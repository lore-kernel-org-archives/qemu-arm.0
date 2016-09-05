Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id u124sm21448173wmu.10.2016.09.05.08.45.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Sep 2016 08:45:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id F26693E0648;
	Mon,  5 Sep 2016 16:45:20 +0100 (BST)
References: <20160905140944.5379-1-alex.bennee@linaro.org> <CAFEAcA-k0js=eZa4NkoAh5Gwz0cDAwDLWXG7NBzLAeYAT7QO5A@mail.gmail.com>
User-agent: mu4e 0.9.17; emacs 25.1.11
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, "open list\:ARM cores" <qemu-arm@nongnu.org>
Subject: Re: [RFC PATCH] hw/intc/arm_gic: handle Set-Active/Clear-Active registers
In-reply-to: <CAFEAcA-k0js=eZa4NkoAh5Gwz0cDAwDLWXG7NBzLAeYAT7QO5A@mail.gmail.com>
Date: Mon, 05 Sep 2016 16:45:20 +0100
Message-ID: <87lgz6z6y7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: oKw7/1X9w7I2


Peter Maydell <peter.maydell@linaro.org> writes:

> On 5 September 2016 at 15:09, Alex Bennée <alex.bennee@linaro.org> wrote:
>> I noticed while testing with modern kernels and -d guest_errors warnings
>> about invalid writes to the GIC. For GICv2 these registers certainly
>> should work so I've implemented both. As the code is common between all
>> the various GICs writes to GICD_ISACTIVERn is checked to ensure it is
>> not a RO register for v1 GICs.
>
> This is definitely a bug, and also the right way to fix it, so you
> don't need to mark your patch 'RFC' :-)
>
> Some minor review issues below.
>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>  hw/intc/arm_gic.c | 33 +++++++++++++++++++++++++++++++--
>>  1 file changed, 31 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
>> index b30cc91..423a4ae 100644
>> --- a/hw/intc/arm_gic.c
>> +++ b/hw/intc/arm_gic.c
>> @@ -972,9 +972,38 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>>                  GIC_CLEAR_PENDING(irq + i, ALL_CPU_MASK);
>>              }
>>          }
>> +    } else if (offset < 0x380) {
>> +        /* Interrupt Set-Active */
>> +        irq = (offset - 0x300) * 8 + GIC_BASE_IRQ;
>> +        if (irq >= s->num_irq || s->revision < 2)
>
> Better to check "s->revision != 2" -- we still have the NVIC
> code tangled up with the GIC, and on the NVIC these are R/O.
>
>> +            goto bad_reg;
>> +
>> +        for (i = 0; i < 8; i++) {
>> +            if (s->security_extn && !attrs.secure &&
>> +                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
>> +                continue; /* Ignore Non-secure access of Group0 IRQ */
>> +            }
>> +
>> +            if (value & (1 << i)) {
>> +                GIC_SET_ACTIVE(irq + i, 1 << cpu);
>
> The mask parameter to GIC_SET_ACTIVE/GIC_CLEAR_ACTIVE should be
> calculated like
>                 int cm = (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
>
> -- compare the set-enable, clear-enable, etc write code.
>
> I'm fairly sure that just setting the active bit (ie not also
> trying to update the active-priority registers) is the correct
> behaviour here, though the GIC spec is not clear to me on this point.
>
>> +            }
>> +        }
>>      } else if (offset < 0x400) {
>> -        /* Interrupt Active.  */
>> -        goto bad_reg;
>> +        /* Interrupt Clear-Active  */
>> +        irq = (offset - 0x380) * 8 + GIC_BASE_IRQ;
>> +        if (irq >= s->num_irq)
>> +            goto bad_reg;
>
> This is missing the check against s->revision.

This was deliberate as the GICv1 reference was only mentioned in the
GICD_ISACTIVERn description. Unfortunately the only documentation for
GICs on silver.arm.com are for v2 and v3 so I had to guess what v1 had :-/

>
>> +
>> +        for (i = 0; i < 8; i++) {
>> +            if (s->security_extn && !attrs.secure &&
>> +                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
>> +                continue; /* Ignore Non-secure access of Group0 IRQ */
>> +            }
>> +
>> +            if (value & (1 << i)) {
>> +                GIC_CLEAR_ACTIVE(irq + i, 1 << cpu);
>> +            }
>> +        }
>>      } else if (offset < 0x800) {
>>          /* Interrupt Priority.  */
>>          irq = (offset - 0x400) + GIC_BASE_IRQ;
>> --
>> 2.9.3
>
> It looks like we don't implement reads of clear-active correctly
> either.

I'll have a look at that. I'll see if Drew's kvm-unit-tests for the GIC
exercise any of this code ;-)

Thanks for the review.

--
Alex Bennée
