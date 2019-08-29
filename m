Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u6sm4887491wrr.26.2019.08.29.13.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 13:22:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3F56D1FF87;
	Thu, 29 Aug 2019 21:22:22 +0100 (BST)
References: <20190827121931.26836-1-peter.maydell@linaro.org>
 <CAL1e-=j_uoOcyxqv7CZv3V6FWaarBnS1wEnU4k1cAoc1_b5mMg@mail.gmail.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-stable@nongnu.org
Subject: Re: [Qemu-devel] [PATCH] target/arm: Free TCG temps in
 trans_VMOV_64_sp()
In-reply-to: <CAL1e-=j_uoOcyxqv7CZv3V6FWaarBnS1wEnU4k1cAoc1_b5mMg@mail.gmail.com>
Date: Thu, 29 Aug 2019 21:22:22 +0100
Message-ID: <87v9uf4t8h.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: I9t7KCvJ67fW


Aleksandar Markovic <aleksandar.m.mail@gmail.com> writes:

> 27.08.2019. 14.20, "Peter Maydell" <peter.maydell@linaro.org> =D1=98=D0=
=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>>
>> The function neon_store_reg32() doesn't free the TCG temp that it
>> is passed, so the caller must do that. We got this right in most
>> places but forgot to free the TCG temps in trans_VMOV_64_sp().
>>
>> Cc: qemu-stable@nongnu.org
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>
> Hello, Peter,
>
> I am just curious if you found this by manual code inspection, or perhaps
> using a tool?

I'm guessing that if you run code that exercises this while built with
--enable-tcg-debug then TCG's sanity checking complains about unfreed
temps.

>
> Yours,
> Aleksandar
>
>>  target/arm/translate-vfp.inc.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/target/arm/translate-vfp.inc.c
> b/target/arm/translate-vfp.inc.c
>> index 3e8ea80493b..9ae980bef63 100644
>> --- a/target/arm/translate-vfp.inc.c
>> +++ b/target/arm/translate-vfp.inc.c
>> @@ -880,8 +880,10 @@ static bool trans_VMOV_64_sp(DisasContext *s,
> arg_VMOV_64_sp *a)
>>          /* gpreg to fpreg */
>>          tmp =3D load_reg(s, a->rt);
>>          neon_store_reg32(tmp, a->vm);
>> +        tcg_temp_free_i32(tmp);
>>          tmp =3D load_reg(s, a->rt2);
>>          neon_store_reg32(tmp, a->vm + 1);
>> +        tcg_temp_free_i32(tmp);
>>      }
>>
>>      return true;
>> --
>> 2.20.1
>>
>>


--
Alex Benn=C3=A9e
