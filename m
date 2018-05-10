Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 44-v6sm1721990wrv.47.2018.05.10.06.03.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 May 2018 06:03:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 8505A3E03C0;
	Thu, 10 May 2018 14:03:13 +0100 (BST)
References: <20180510094206.15354-1-alex.bennee@linaro.org> <20180510094206.15354-3-alex.bennee@linaro.org> <CAFEAcA_8OCa_gCWzhTNhWAoabCVVNoNiN9H7zbJ1=6KJAFveSA@mail.gmail.com>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v3 2/5] fpu/softfloat: re-factor float to float conversions
In-reply-to: <CAFEAcA_8OCa_gCWzhTNhWAoabCVVNoNiN9H7zbJ1=6KJAFveSA@mail.gmail.com>
Date: Thu, 10 May 2018 14:03:13 +0100
Message-ID: <87mux7vf1q.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 1ogDk+05udFq


Peter Maydell <peter.maydell@linaro.org> writes:

> On 10 May 2018 at 10:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>> This allows us to delete a lot of additional boilerplate code which is
>> no longer needed. Currently the ieee flag is ignored (everything is
>> assumed to be ieee). Handling for ARM AHP will be in the next patch.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> ---
>> v2
>>   - pass FloatFmt to float_to_float instead of sizes
>>   - split AHP handling to another patch
>>   - use rth's suggested re-packing (+ setting .exp)
>> v3
>>   - also rm extractFloat16Sign
>> ---
>>  fpu/softfloat-specialize.h |  40 ----
>>  fpu/softfloat.c            | 452 +++++++------------------------------
>>  include/fpu/softfloat.h    |   8 +-
>>  3 files changed, 88 insertions(+), 412 deletions(-)
>
> This introduces a regression where we don't get tininess-before-rounding
> for double/single to halfprec conversions. This is because we're
> now using the fp_status_f16 status field, and it has not had
> the detect_tininess setting initialized. This fixes it:
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index d175c5e94f..7939c6b8ae 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -324,6 +324,8 @@ static void arm_cpu_reset(CPUState *s)
>                                &env->vfp.fp_status);
>      set_float_detect_tininess(float_tininess_before_rounding,
>                                &env->vfp.standard_fp_status);
> +    set_float_detect_tininess(float_tininess_before_rounding,
> +                              &env->vfp.fp_status_f16);

I'm now wondering if I should have tried harder to rationalise the
various float_status structures we've ended up with.

>  #ifndef CONFIG_USER_ONLY
>      if (kvm_enabled()) {
>          kvm_arm_reset_vcpu(cpu);
>
> (You can see this if you try something like fcvt h1, d0 where
> d0 =3D=3D 0x3f0f_ffff_ffff_ffff -- we get the right answer of 0x0400
> but fail to set Underflow as well as Inexact.)
>
> thanks
> -- PMM


--
Alex Benn=C3=A9e
