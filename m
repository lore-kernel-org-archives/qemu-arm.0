Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z127sm5230763wme.44.2020.07.28.09.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 09:11:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0111F1FF7E;
	Tue, 28 Jul 2020 17:11:14 +0100 (BST)
References: <20200728141005.28664-1-alex.bennee@linaro.org>
 <20200728141005.28664-3-alex.bennee@linaro.org>
 <CAFEAcA_MT8U6uUYhNVDc1-AkxPPL22pBevNDSbB2ZwQQ94OPmw@mail.gmail.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Victor CLEMENT
 <victor.clement@openwide.fr>, Paolo Bonzini <pbonzini@redhat.com>, Igor R
 <boost.lists@gmail.com>, Pavel Dovgaluk <pavel.dovgaluk@ispras.ru>, "open
 list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v1 2/2] target/arm: only set the nexttick timer if !ISTATUS
In-reply-to: <CAFEAcA_MT8U6uUYhNVDc1-AkxPPL22pBevNDSbB2ZwQQ94OPmw@mail.gmail.com>
Date: Tue, 28 Jul 2020 17:11:14 +0100
Message-ID: <87lfj339i5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: mtg7lywyTakc


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 28 Jul 2020 at 15:10, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> Otherwise we have an unfortunate interaction with -count sleep=3Doff
>> which means we fast forward time when we don't need to. The easiest
>> way to trigger it was to attach to the gdbstub and place a break point
>> at the timers IRQ routine. Once the timer fired setting the next event
>> at INT_MAX then qemu_start_warp_timer would skip to the end.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  target/arm/helper.c | 35 ++++++++++++++++++++++-------------
>>  1 file changed, 22 insertions(+), 13 deletions(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index c69a2baf1d3..ec1b84cf0fd 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -2683,7 +2683,7 @@ static void gt_recalc_timer(ARMCPU *cpu, int timer=
idx)
>>          uint64_t count =3D gt_get_countervalue(&cpu->env);
>>          /* Note that this must be unsigned 64 bit arithmetic: */
>>          int istatus =3D count - offset >=3D gt->cval;
>> -        uint64_t nexttick;
>> +        uint64_t nexttick =3D 0;
>>          int irqstate;
>>
>>          gt->ctl =3D deposit32(gt->ctl, 2, 1, istatus);
>> @@ -2692,21 +2692,30 @@ static void gt_recalc_timer(ARMCPU *cpu, int tim=
eridx)
>>          qemu_set_irq(cpu->gt_timer_outputs[timeridx], irqstate);
>>
>>          if (istatus) {
>> -            /* Next transition is when count rolls back over to zero */
>> -            nexttick =3D UINT64_MAX;
>> +            /*
>> +             * The IRQ status of the timer will persist until:
>> +             *   - CVAL is changed or
>> +             *   - ENABLE is changed
>> +             *
>> +             * There is no point re-arming the timer for some far
>> +             * flung future - currently it just is.
>> +             */
>> +            timer_del(cpu->gt_timer[timeridx]);
>
> Why do we delete the timer for this case of "next time we need to
> know is massively in the future"...

It's not really - it's happening now and it will continue to happen
until the IRQ is serviced or we change the CVAL at which point we can
calculate the next time we need it.

>
>>          } else {
>>              /* Next transition is when we hit cval */
>>              nexttick =3D gt->cval + offset;
>> -        }
>> -        /* Note that the desired next expiry time might be beyond the
>> -         * signed-64-bit range of a QEMUTimer -- in this case we just
>> -         * set the timer for as far in the future as possible. When the
>> -         * timer expires we will reset the timer for any remaining peri=
od.
>> -         */
>> -        if (nexttick > INT64_MAX / gt_cntfrq_period_ns(cpu)) {
>> -            timer_mod_ns(cpu->gt_timer[timeridx], INT64_MAX);
>> -        } else {
>> -            timer_mod(cpu->gt_timer[timeridx], nexttick);
>> +
>> +            /*
>> +             * It is possible the next tick is beyond the
>> +             * signed-64-bit range of a QEMUTimer but currently the
>> +             * timer system doesn't support a run time of more the 292
>> +             * odd years so we set it to INT_MAX in this case.
>> +             */
>> +            if (nexttick > INT64_MAX / gt_cntfrq_period_ns(cpu)) {
>> +                timer_mod_ns(cpu->gt_timer[timeridx], INT64_MAX);
>
> ...but here we handle the similar case by "set a timeout for
> INT64_MAX" ?

Yeah we could just swallow it up and report something to say it's not
going to happen because it's beyond the horizon of what QEMUTimer can
deal with.

>
>> +            } else {
>> +                timer_mod(cpu->gt_timer[timeridx], nexttick);
>> +            }
>>          }
>>          trace_arm_gt_recalc(timeridx, irqstate, nexttick);
>>      } else {
>> --
>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
