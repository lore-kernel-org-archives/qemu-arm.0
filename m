Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id v6sm4037244wma.24.2019.09.13.06.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 06:28:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DF8B11FF87;
	Fri, 13 Sep 2019 14:28:46 +0100 (BST)
References: <20190911164959.11003-1-alex.bennee@linaro.org>
 <20190911164959.11003-3-alex.bennee@linaro.org>
 <CAFEAcA8NsdpEMOH1MFDta0LUswyqSDHCgtOh6g5k3+EU0FVuHA@mail.gmail.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 2/5] target/arm: handle M-profile semihosting at
 translate time
In-reply-to: <CAFEAcA8NsdpEMOH1MFDta0LUswyqSDHCgtOh6g5k3+EU0FVuHA@mail.gmail.com>
Date: Fri, 13 Sep 2019 14:28:46 +0100
Message-ID: <875zlwz5o1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: TkHYUXk94PtT


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 11 Sep 2019 at 17:50, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> We do this for other semihosting calls so we might as well do it for
>> M-profile as well.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> ---
>> v2
>>   - update for change to gen_exception_internal_insn API
>> v3
>>   - update for decode tree
>> v4
>>   - use !IS_USER
>> ---
>
>> diff --git a/target/arm/translate.c b/target/arm/translate.c
>> index 34bb280e3da..6689acc911e 100644
>> --- a/target/arm/translate.c
>> +++ b/target/arm/translate.c
>> @@ -8424,7 +8424,13 @@ static bool trans_BKPT(DisasContext *s, arg_BKPT =
*a)
>>      if (!ENABLE_ARCH_5) {
>>          return false;
>>      }
>> -    gen_exception_bkpt_insn(s, syn_aa32_bkpt(a->imm, false));
>> +    if (arm_dc_feature(s, ARM_FEATURE_M) &&
>> +        semihosting_enabled() && !IS_USER(s) &&
>> +        (a->imm =3D=3D 0xab)) {
>> +        gen_exception_internal_insn(s, s->base.pc_next, EXCP_SEMIHOST);
>> +    } else {
>> +        gen_exception_bkpt_insn(s, syn_aa32_bkpt(a->imm, false));
>> +    }
>>      return true;
>>  }
>
> This is still disabling semihosting for the linux-user-mode
> build for M-profile, isn't it ?

Sure - as rth suggested. But m-profile doesn't run Linux so why would we
support it in linux-user?

>
> thanks
> -- PMM


--
Alex Benn=C3=A9e
