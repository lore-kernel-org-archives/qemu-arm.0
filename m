Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id n8sm8949007wrn.59.2017.07.21.06.50.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jul 2017 06:50:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 8A8D43E0127;
	Fri, 21 Jul 2017 14:50:33 +0100 (BST)
References: <20170720150426.12393-1-alex.bennee@linaro.org> <20170720150426.12393-13-alex.bennee@linaro.org> <4d6ac494-d606-ebaf-6498-7c526467ac62@twiddle.net> <87tw266rm3.fsf@linaro.org> <20170721132140.xy2uqronprhzjiga@aurel32.net>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: Richard Henderson <rth@twiddle.net>, peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [RFC PATCH for 2.11 12/23] target/arm/translate-a64.c: add FP16 FAGCT to AdvSIMD 3 Same
In-reply-to: <20170721132140.xy2uqronprhzjiga@aurel32.net>
Date: Fri, 21 Jul 2017 14:50:33 +0100
Message-ID: <87mv7x7vbq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: MpLDwlAcK4It


Aurelien Jarno <aurelien@aurel32.net> writes:

> On 2017-07-21 10:56, Alex Bennée wrote:
>>
>> Richard Henderson <rth@twiddle.net> writes:
>>
>> > On 07/20/2017 05:04 AM, Alex Bennée wrote:
>> >> +static softfloat_flags softfloat_mapping_table[] = {
>> >> +    { float_flag_inexact  , softfloat_flag_inexact },
>> >> +    { float_flag_underflow, softfloat_flag_underflow },
>> >> +    { float_flag_overflow , softfloat_flag_overflow },
>> >> +    { float_flag_invalid  , softfloat_flag_invalid },
>> >> +};
>> >> +/* FIXME: 2a has no infinite flag */
>> >> +
>> >> +static uint8_t sync_softfloat_flags_from_2a(float_status *flags2a)
>> >> +{
>> >> +    uint8_t flags = flags2a->float_exception_flags;
>> >> +    int i;
>> >> +    if (flags) {
>> >> +        for (i = 0; i < ARRAY_SIZE(softfloat_mapping_table); i++) {
>> >> +            struct softfloat_flags *map = &softfloat_mapping_table[i];
>> >> +            if (flags & map->float2a_flag) {
>> >> +                softfloat_raiseFlags(map->float3c_flag);
>> >> +            }
>> >> +        }
>> >> +    } else {
>> >> +        softfloat_exceptionFlags = 0;
>> >> +    }
>> >> +
>> >> +    return softfloat_exceptionFlags;
>> >> +}
>> >> +
>> >
>> > For conversions like this IMO it's better to make the compiler do the
>> > work. C.f. target/alpha/fpu_helper.c and CONVERT_BIT.
>>
>> Cool, I'll look at that.
>>
>> > BTW, I think these TLS variables that softfloat3a are using are going
>> > to be a real problem.  It's one thing to do it temporarily like you
>> > are here, coordinating between 2a and 3c, but later, when the front
>> > end is fully converted?  That's just nonsense.
>>
>> Wouldn't the other option to be to drop float_status out of the guests
>> CPUEnv and grab it from the TLS variable instead? Of course all guests
>> would need to be MTTCG enabled for that to work.
>
> As said in another email, some architectures actually use more than one
> float_status. We therefore need to implement a solution like the one
> proposed by Richard.

Ahh you mean more than one float_status for a given vCPU context?

--
Alex Bennée
