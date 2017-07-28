Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v8sm23603483wrd.28.2017.07.28.06.00.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jul 2017 06:00:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id A70EA3E009E;
	Fri, 28 Jul 2017 14:00:13 +0100 (BST)
References: <20170720150426.12393-1-alex.bennee@linaro.org> <20170720150426.12393-13-alex.bennee@linaro.org> <4d6ac494-d606-ebaf-6498-7c526467ac62@twiddle.net>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <rth@twiddle.net>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH for 2.11 12/23] target/arm/translate-a64.c: add FP16 FAGCT to AdvSIMD 3 Same
In-reply-to: <4d6ac494-d606-ebaf-6498-7c526467ac62@twiddle.net>
Date: Fri, 28 Jul 2017 14:00:13 +0100
Message-ID: <87y3r8d8de.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: knjOXD58jGzF


Richard Henderson <rth@twiddle.net> writes:

> On 07/20/2017 05:04 AM, Alex Bennée wrote:
>> +static softfloat_flags softfloat_mapping_table[] = {
>> +    { float_flag_inexact  , softfloat_flag_inexact },
>> +    { float_flag_underflow, softfloat_flag_underflow },
>> +    { float_flag_overflow , softfloat_flag_overflow },
>> +    { float_flag_invalid  , softfloat_flag_invalid },
>> +};
>> +/* FIXME: 2a has no infinite flag */
>> +
>> +static uint8_t sync_softfloat_flags_from_2a(float_status *flags2a)
>> +{
>> +    uint8_t flags = flags2a->float_exception_flags;
>> +    int i;
>> +    if (flags) {
>> +        for (i = 0; i < ARRAY_SIZE(softfloat_mapping_table); i++) {
>> +            struct softfloat_flags *map = &softfloat_mapping_table[i];
>> +            if (flags & map->float2a_flag) {
>> +                softfloat_raiseFlags(map->float3c_flag);
>> +            }
>> +        }
>> +    } else {
>> +        softfloat_exceptionFlags = 0;
>> +    }
>> +
>> +    return softfloat_exceptionFlags;
>> +}
>> +
>
> For conversions like this IMO it's better to make the compiler do the
> work. C.f. target/alpha/fpu_helper.c and CONVERT_BIT.
>
> BTW, I think these TLS variables that softfloat3a are using are going
> to be a real problem.  It's one thing to do it temporarily like you
> are here, coordinating between 2a and 3c, but later, when the front
> end is fully converted?  That's just nonsense.
>
> Is it going to be worthwhile to significantly hack up the incoming sources?
>
> If so, then we might do something like this:  Given a 3c function foo,
>
>   T foo_st(T, T, float3a_status *) { ... }
>   T foo(T x, T y) { return foo_st(x, y, &tls_status); }
>
> And of course pack all of the relevant state into a struct then
>
>   #define softfloat_exceptionFlags tls_status.exceptionflags
>
> etc, instead of having individual tls variables.  This feels like
> something that we could push back upstream, assuming that upstream is
> active.

Another option which might be less invasive to the API (although
arguably a bit side-effecty) would be to make:

THREAD_LOCAL uint_fast8_t *softfloat_exceptionFlags;

And add a helper to de-reference softfloat_exceptionFlags when setting
them so that all the:

  softfloat_exceptionFlags |= softfloat_flag_inexact;

Become:

  softfloat_raiseException(softfloat_flag_inexect);

With something like:

void softfloat_raiseException(uint_fast8_t new)
{
        assert(softfloat_exceptionFlags);
        *softfloat_exceptionFlags |= new;
}

So new helpers could just do:

uint32_t HELPER(advsimd_foo)(uint32_t a, uint32_t b, void *fpstp)
{
    uint_fast8_t *old_fpst = softfloat_exceptionFlags;
    softfloat_exceptionFlags = (uint_fast8t *) fpstp;

    /* Do stuff */

    softfloat_exceptionFlags = old_fpst;
}

Unless there is code that directly fiddles the fpst bits in TCG I think
that should work well enough as any vCPU can only be doing one sort of
float at a time.

Anyway I guess this is all moot until we get an answer as to there being
an active upstream to push stuff back up to. I reached out yesterday
(https://github.com/ucb-bar/berkeley-softfloat-3/issues/5) so we'll see
if we get any feedback. Otherwise I'm minded to stick with 2a and just
implement the half-precision stuff there.


--
Alex Bennée
