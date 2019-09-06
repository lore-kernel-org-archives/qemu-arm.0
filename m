Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id i9sm1882843wmf.14.2019.09.06.06.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 06:16:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BE0911FF87;
	Fri,  6 Sep 2019 14:16:24 +0100 (BST)
References: <20190906124706.19145-1-alex.bennee@linaro.org>
 <20190906124706.19145-3-alex.bennee@linaro.org>
 <CAFEAcA84VXqw+ZGP9Nv=Wy069ZU_C0WkVdv0h28GVbnzyx6w6w@mail.gmail.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH v3 2/4] target/arm: handle A-profile semihosting at
 translate time
In-reply-to: <CAFEAcA84VXqw+ZGP9Nv=Wy069ZU_C0WkVdv0h28GVbnzyx6w6w@mail.gmail.com>
Date: Fri, 06 Sep 2019 14:16:24 +0100
Message-ID: <87a7bhzhsn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 7iQqwZvXt8jq


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 6 Sep 2019 at 13:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> As for the other semihosting calls we can resolve this at translate
>> time.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>
>> ---
>> v2
>>   - update for change to gen_exception_internal_insn API
>> v3
>>   - update for decode tree, merge T32 & A32 commits
>>   - dropped r-b due to changes
>> ---
>>  target/arm/translate.c | 19 +++++++++++++++----
>>  1 file changed, 15 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/arm/translate.c b/target/arm/translate.c
>> index 4cda7812bcb..ed4a97cfb44 100644
>> --- a/target/arm/translate.c
>> +++ b/target/arm/translate.c
>> @@ -10222,14 +10222,25 @@ static bool trans_CBZ(DisasContext *s, arg_CBZ=
 *a)
>>  }
>>
>>  /*
>> - * Supervisor call
>> + * Supervisor call - both T32 & A32 come here so we need to check
>> + * which mode we are in when checking for semihosting.
>>   */
>>
>>  static bool trans_SVC(DisasContext *s, arg_SVC *a)
>>  {
>> -    gen_set_pc_im(s, s->base.pc_next);
>> -    s->svc_imm =3D a->imm;
>> -    s->base.is_jmp =3D DISAS_SWI;
>> +    const uint32_t semihost_imm =3D s->thumb ? 0xab : 0x123456;
>> +
>> +    if (semihosting_enabled() &&
>> +#ifndef CONFIG_USER_ONLY
>> +        s->current_el !=3D 0 &&
>> +#endif
>> +        (a->imm =3D=3D semihost_imm)) {
>> +        gen_exception_internal_insn(s, s->base.pc_next, EXCP_SEMIHOST);
>> +    } else {
>> +        gen_set_pc_im(s, s->base.pc_next);
>> +        s->svc_imm =3D a->imm;
>> +        s->base.is_jmp =3D DISAS_SWI;
>> +    }
>>      return true;
>>  }
>
> Doesn't this accidentally enable semihosting via SVC for
> M-profile ?

We must have done that before then. Just gate it with &&
!arm_dc_feature(s, ARM_FEATURE_M) then?

>
> thanks
> -- PMM


--
Alex Benn=C3=A9e
