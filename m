Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 74sm2040925wmf.38.2018.02.23.03.59.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 03:59:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 4A3F03E0260;
	Fri, 23 Feb 2018 11:59:58 +0000 (GMT)
References: <20180208173157.24705-1-alex.bennee@linaro.org> <20180208173157.24705-12-alex.bennee@linaro.org> <da2bc012-1693-3335-eb5a-921d94e6015e@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [PATCH v2 11/32] arm/translate-a64: add FP16 F[A]C[EQ/GE/GT] to simd_three_reg_same_fp16
In-reply-to: <da2bc012-1693-3335-eb5a-921d94e6015e@linaro.org>
Date: Fri, 23 Feb 2018 11:59:58 +0000
Message-ID: <87d10vapc1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: vvbSapG9zhjC


Richard Henderson <richard.henderson@linaro.org> writes:

> On 02/08/2018 09:31 AM, Alex Benn=C3=A9e wrote:
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  target/arm/helper-a64.c    | 49 +++++++++++++++++++++++++++++++++++++++=
+++++++
>>  target/arm/helper-a64.h    |  5 +++++
>>  target/arm/translate-a64.c | 15 ++++++++++++++
>>  3 files changed, 69 insertions(+)
>>
>> diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
>> index 25e45121af..78eeda31d1 100644
>> --- a/target/arm/helper-a64.c
>> +++ b/target/arm/helper-a64.c
>> @@ -599,3 +599,52 @@ ADVSIMD_HALFOP(min)
>>  ADVSIMD_HALFOP(max)
>>  ADVSIMD_HALFOP(minnum)
>>  ADVSIMD_HALFOP(maxnum)
>> +
>> +/*
>> + * Floating point comparisons produce an integer result. Softfloat
>> + * routines return float_relation types which we convert to the 0/-1
>> + * Neon requires.
>> + */
>> +
>> +#define ADVSIMD_CMPRES(test) (test) ? 0xffff : 0
>> +
>> +uint32_t HELPER(advsimd_ceq_f16)(float16 a, float16 b, void *fpstp)
>> +{
>> +    float_status *fpst =3D fpstp;
>> +    int compare =3D float16_compare_quiet(a, b, fpst);
>> +    return ADVSIMD_CMPRES(compare =3D=3D float_relation_equal);
>
> Not using float16_eq etc?

These don't actually exist. But I guess we could make stubs for them
based on the generic float_compare support. But would it buy us much?

>
>> +}
>> +
>> +uint32_t HELPER(advsimd_cge_f16)(float16 a, float16 b, void *fpstp)
>> +{
>> +    float_status *fpst =3D fpstp;
>> +    int compare =3D float16_compare(a, b, fpst);
>> +    return ADVSIMD_CMPRES(compare =3D=3D float_relation_greater ||
>> +                          compare =3D=3D float_relation_equal);
>
> Especially float16_le(b, a, fpst).
>
> Otherwise,
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~


--
Alex Benn=C3=A9e
