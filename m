Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id lh1sm5546886wjb.20.2016.01.22.03.45.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Jan 2016 03:45:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 94CFE3E01C9;
	Fri, 22 Jan 2016 11:45:57 +0000 (GMT)
References: <1453375108-25229-1-git-send-email-edgar.iglesias@gmail.com> <1453375108-25229-4-git-send-email-edgar.iglesias@gmail.com> <8737tpj4bo.fsf@linaro.org> <20160122111601.GD25287@toto>
User-agent: mu4e 0.9.16; emacs 25.0.50.5
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org, edgar.iglesias@xilinx.com
Subject: Re: [PATCH v2 3/3] target-arm: Implement the S2 MMU inputsize > pamax check
In-reply-to: <20160122111601.GD25287@toto>
Date: Fri, 22 Jan 2016 11:45:57 +0000
Message-ID: <87y4bhhm6i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: CPKdBprIRvMI


Edgar E. Iglesias <edgar.iglesias@gmail.com> writes:

> On Fri, Jan 22, 2016 at 10:28:43AM +0000, Alex Bennée wrote:
>>
>> Edgar E. Iglesias <edgar.iglesias@gmail.com> writes:
>>
>> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>> >
>> > Implement the inputsize > pamax check for Stage 2 translations.
>> > We have multiple choices for how to respond to errors and
>> > choose to fault.
>> >
>> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>> > ---
>> >  target-arm/helper.c | 16 ++++++++++++----
>> >  1 file changed, 12 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/target-arm/helper.c b/target-arm/helper.c
>> > index 4abeb4d..9a7ff5e 100644
>> > --- a/target-arm/helper.c
>> > +++ b/target-arm/helper.c
>> > @@ -6808,7 +6808,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>> >           */
>> >          int startlevel = extract32(tcr->raw_tcr, 6, 2);
>> >          unsigned int pamax = arm_pamax(cpu);
>> > -        bool ok;
>> > +        bool ok = true;
>> >
>> >          if (va_size == 32 || stride == 9) {
>> >              /* AArch32 or 4KB pages */
>> > @@ -6818,9 +6818,17 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>> >              level = 3 - startlevel;
>> >          }
>> >
>> > -        /* Check that the starting level is valid. */
>> > -        ok = check_s2_startlevel(cpu, va_size == 64, level,
>> > -                                 inputsize, stride, pamax);
>> > +        if (va_size == 64 &&
>> > +            inputsize > pamax &&
>> > +            (arm_el_is_aa64(env, 1) || inputsize > 40)) {
>>
>> If va_size == 64 doesn't that imply arm_el_is_aa64(env, 1)? Looking
>> further up the function it seems that is what sets va_size in the first
>> place. I think that makes the inputsize > 40 check redundant.
>
> va_size == 64 is true if the EL corresponding to the translation _regime_
> is in 64 bit mode (in this case EL2).
>
> EL1 may very well be in 32bit mode.

Ahh yes, I missed that on the first reading. I think it might be clearer
when reading the code to have the:

    bool is_aarch64_regime = (va_size == 64);

And use that to make it clear. And then comment on later check that it's
incompatible with EL1 being aarch32.

>
>>
>> > +            /* We have multiple choices but choose to fault.  */
>> > +            ok = false;
>> > +        }
>> > +        if (ok) {
>> > +            /* Check that the starting level is valid. */
>> > +            ok = check_s2_startlevel(cpu, va_size == 64, level,
>> > +                                     inputsize, stride, pamax);
>> > +        }
>> >          if (!ok) {
>> >              /* AArch64 reports these as level 0 faults.
>> >               * AArch32 reports these as level 1 faults.
>>
>> I'm not a fan of the ok = true / ok = false / ok =
>> check_s2_start_level() / if (!ok) ping-pong here as it is hard to
>> follow. I'm not sure how you could make it cleaner to follow though.
>> Maybe something like:
>>
>>         /* For stage 2 translations the starting level is specified by the
>>          * VTCR_EL2.SL0 field (whose interpretation depends on the page size)
>>          */
>>         int startlevel = extract32(tcr->raw_tcr, 6, 2);
>>         unsigned int pamax = arm_pamax(cpu);
>>         bool is_aarch64_regime = (va_size == 64);
>>         bool ok;
>>
>>         if (va_size == 32 || stride == 9) {
>>             /* AArch32 or 4KB pages */
>>             level = 2 - startlevel;
>>         } else {
>>             /* 16KB or 64KB pages */
>>             level = 3 - startlevel;
>>         }
>>
>>         if (is_aarch64_regime &&
>>             inputsize > pamax) {
>>             /* We have multiple choices but choose to fault.  */
>>             ok = false;
>>         } else {
>>             /* Check that the starting level is valid. */
>>             ok = check_s2_startlevel(cpu, is_aarch64_regime, level,
>>                                      inputsize, stride, pamax);
>>         }
>>         if (!ok) {
>>             /* AArch64 reports these as level 0 faults.
>>              * AArch32 reports these as level 1 faults.
>>              */
>>             level = is_aarch64_regime ? 0 : 1;
>>             fault_type = translation_fault;
>>             goto do_fault;
>>         }
>>
>> But I'm wondering if it just makes more sense to push the:
>>
>>     is_aarch64_regime && inputsize > pamax
>>
>> Check into check_s2_startlevel? Then you could just have a simple call
>> which succeeds or falls through to a fault?
>
> Yeah, I guess we could rename check_s2_startlevel to something more generic
> and move all the checks there. I don't feel very strongly about either way...

I think it would be cleaner to follow. get_phys_addr_lpae is already a
bit of a monster so the less conditions to keep track of while reading
it the better IMHO.

> Thanks,
> Edgar
>
>
>
>>
>>         /* Check that the starting level is valid. */
>>         if (!check_s2_startlevel(cpu, is_aarch64_regime, level,
>>                                      inputsize, stride, pamax) ){
>>             /* AArch64 reports these as level 0 faults.
>>              * AArch32 reports these as level 1 faults.
>>              */
>>             level = is_aarch64_regime ? 0 : 1;
>>             fault_type = translation_fault;
>>             goto do_fault;
>>         }
>>
>> --
>> Alex Bennée


--
Alex Bennée
