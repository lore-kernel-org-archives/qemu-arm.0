Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id y16sm9477116wrg.85.2019.07.11.03.32.57
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 03:32:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 298401FF87;
	Thu, 11 Jul 2019 11:32:57 +0100 (BST)
References: <20190710172437.628-1-alex.bennee@linaro.org> <f85b75f3-f903-7bad-d43e-a545cafdb57d@linaro.org>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 1836078@bugs.launchpad.net
Subject: Re: [Qemu-devel] [PATCH for 4.1] target/arm: report ARMv8.2 FP16 for ARM -cpu max
In-reply-to: <f85b75f3-f903-7bad-d43e-a545cafdb57d@linaro.org>
Date: Thu, 11 Jul 2019 11:32:57 +0100
Message-ID: <87ef2weu92.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: fwb3M+DKZwDH


Richard Henderson <richard.henderson@linaro.org> writes:

> On 7/10/19 7:24 PM, Alex Benn=C3=A9e wrote:
>> When we converted to using feature bits in 602f6e42cfbf we missed out
>> the fact (dp && arm_dc_feature(s, ARM_FEATURE_V8)) was supported for
>> -cpu max configurations. This caused a regression in the GCC test
>> suite. Fix this by setting the appropriate FP16 bits in mvfr1.FPHP.
>>
>> Fixes: https://bugs.launchpad.net/qemu/+bug/1836078
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  target/arm/cpu.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index e75a64a25a..0a0a202fe3 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -2452,6 +2452,10 @@ static void arm_max_initfn(Object *obj)
>>              t =3D FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
>>              cpu->isar.id_isar6 =3D t;
>>
>> +            t =3D cpu->isar.mvfr1;
>> +            t =3D FIELD_DP32(t, MVFR1, FPHP, 2);     /* v8.2 FP16 */
>
> The comment is wrong.  This is not full v8.2 FP16 support (which would be=
 value
> 3, plus a change to SIMDHP), but v8.0 support for double<->half
> conversions.

Good catch - will fix in v2.
>
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~


--
Alex Benn=C3=A9e
