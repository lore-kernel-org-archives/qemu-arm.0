Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id t132-v6sm41399wme.40.2018.05.03.12.41.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 May 2018 12:41:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id D8DD13E00FC;
	Thu,  3 May 2018 20:41:29 +0100 (BST)
References: <20180502154344.10585-1-alex.bennee@linaro.org> <20180502154344.10585-3-alex.bennee@linaro.org> <CAFEAcA80vTz25WHGKteTU3nxSi2fUHN8dp+z8paNP03conAghQ@mail.gmail.com>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v2 2/3] fpu/softfloat: support ARM Alternative half-precision
In-reply-to: <CAFEAcA80vTz25WHGKteTU3nxSi2fUHN8dp+z8paNP03conAghQ@mail.gmail.com>
Date: Thu, 03 May 2018 20:41:29 +0100
Message-ID: <871sesa5na.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: CIvnVfCToNEq


Peter Maydell <peter.maydell@linaro.org> writes:

> On 2 May 2018 at 16:43, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>> For float16 ARM supports an alternative half-precision format which
>> sacrifices the ability to represent NaN/Inf in return for a higher
>> dynamic range. To support this I've added an additional
>> FloatFmt (float16_params_ahp).
>>
>> The new FloatFmt flag (arm_althp) is then used to modify the behaviour
>> of canonicalize and round_canonical with respect to representation and
>> exception raising.
>>
>> Finally the float16_to_floatN and floatN_to_float16 conversion
>> routines select the new alternative FloatFmt when !ieee.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  fpu/softfloat.c | 97 +++++++++++++++++++++++++++++++++++++------------
>>  1 file changed, 74 insertions(+), 23 deletions(-)
>
> I found some corner cases where this patchset introduces
> regressions; details below... They're not all althp related
> but I started composing this email in reply to patch 2/3 and
> don't want to try to move it to replying to the cover letter now :-)
>
>
> (1) Here's an example of a wrong 32->16 conversion in alt-hp mode:
> for FCVT h5, s0 where s0 is an SNaN, then your code gives 0x7E00
> when it should give 0x0, because float16a_round_pack_canonical()
> tries to return a NaN, which doesn't exist in alt-HP.
>
> In the Arm ARM pseudocode this case is handled by the
> FPConvert pseudocode, which treats alt_hp specially
> when the input is a NaN. On that analogy I put this into
> float_to_float(), which seems to have the desired effect:
>
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 25a331158f..1cc368175d 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -1256,6 +1256,17 @@ static FloatParts float_to_float(FloatParts a,
>              s->float_exception_flags |=3D float_flag_invalid;
>          }
>
> +        if (dstf->arm_althp) {
> +            /* There is no NaN in the destination format: raise Invalid
> +             * and return a zero with the sign of the input NaN.
> +             */
> +            s->float_exception_flags |=3D float_flag_invalid;
> +            a.cls =3D float_class_zero;
> +            a.frac =3D 0;
> +            a.exp =3D 0;
> +            return a;
> +        }
> +

Doh. The previous version had handling for this in float_to_float but it
was clear on my test case and I thought I'd handled it all in the
unpack/canonicalize step.

>          if (s->default_nan_mode) {
>              a.cls =3D float_class_dnan;
>              return a;
>
> (2) You're also failing to set the Inexact flag for cases like
>  fcvt h1, s0     where s0 is 0x33000000
> which should return result of 0, flags Inexact | Underflow,
> but is after this patchset returning just Underflow.

More cases for the test case ;-)

>
> I think this is because you're not dealing with the
> odd handling of flush-to-zero for half-precision:
> in the v8A Arm ARM pseudocode, float-to-float conversion
> uses the FPRoundCV() function, which squashes FZ16 to 0,
> and FPRoundBase() looks at fpcr.FZ for 32 and 64 bit floats
> but fpcr.FZ16 for 16 bit floats. (FZ16 exists only with the
> halfprec extension, and effectively applies only for the
> data processing and int<->fp conversions -- see FPRound().)
>
> In our old code we handled this implicitly by having
> roundAndPackFloat16() not check status->flush_to_zero the way
> that roundAndPackFloat32/64 did. Now you've combined them all
> into one code path you need to do some special casing, I think.
> This change fixes things for the fcvt case, but (a) is a
> dubious hack and (b) you'll want to do something different
> to handle FZ16 for actual arithmetic operations on halfprec.

We handle FZ16 by passing a different float_status for halfprec. But I
guess the fcvt helpers can do the save/squash/restore dance.

> If architectures other than Arm use halfprec (MIPS seems to)
> then we should check what their semantics are to see if they
> match Arm.

There are helpers but I couldn't see them actually being called. I was
half tempted to delete the helpers and rationalise the softfloat API
convention but decided against it to avoid churn.

>
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -453,7 +453,7 @@ static FloatParts round_canonical(FloatParts p,
> float_status *s,
>                      flags |=3D float_flag_inexact;
>                  }
>              }
> -        } else if (s->flush_to_zero) {
> +        } else if (s->flush_to_zero && parm->exp_size !=3D 5) {
>              flags |=3D float_flag_output_denormal;
>              p.cls =3D float_class_zero;
>              goto do_zero;
>
> (3) Here's a NaN case we get wrong now: 64 to IEEE-16 conversion,
> input is 0x7ff0000000000001 (an SNaN), we produce
> 0x7c00 (infinity) but should produce 0x7e00 (a QNaN).

OK.

>
> This is because this code in float16a_round_pack_canonical():
>
>     case float_class_msnan:
>         return float16_maybe_silence_nan(float16_pack_raw(p), s);
>
> doesn't consider the possibility that float16_pack_raw()
> ends up with something that's not a NaN. In this case
> because the float-to-float conversion has thrown away the
> bottom bits of the double's mantissa, we have p.frac =3D=3D 0,
> and float16_pack_raw() gives 0x7c00, which is an infinity,
> not a NaN. So when float16_maybe_silence_nan() calls
> float16_is_signaling_nan() on it it returns false and then
> we don't change the SNaN bit.
>
> The code as of this patch seems to be a bit confused:
> it does part of the conversion of NaNs from one format
> to the other in float_to_float() (which is where it's
> fiddling with the frac bits) and part of it in
> the round_canonical() case (where it then messes
> about with quietening the NaN). In an ideal world
> this would all be punted out to the softfloat-specialize
> code to convert with access to the full details of the
> input number, because it's impdef how NaN conversion handles
> the fraction bits. Arm happens to choose to use the
> most significant bits of the fraction field, but there's
> no theoretical reason why you couldn't have an
> implementation that wanted to preserve the least
> significant bits, for instance.
>
> Note also that we currently have workarounds at the target/arm
> level for the softfloat code not quietening input NaNs for
> fp-to-fp conversion: see the uses of float*_maybe_silence_nan()
> after float*_to_float* calls in target/arm/helper.c.
> If the softfloat code is now going to get these correct then
> we can drop those. HPPA, MIPS, RISCV and S390x have similar
> workarounds also. Overall, the maybe_silence_nan function
> was a dubious workaround for not having been able to do
> the NaN handling when we had a fully unpacked value, and
> perhaps we can minimise its use or even get rid of it...
> (target/i386 notably does not do this, we should check how
> SSE and x87 handle NaNs in fp conversions first.)

I guess it is time to expose some of the details for the unpacked float
handling to specialize so its not an after the fact hack.

>
> thanks
> -- PMM


--
Alex Benn=C3=A9e
