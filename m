Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u4sm11422002wmb.48.2020.06.05.03.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 03:24:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 155BD1FF7E;
	Fri,  5 Jun 2020 11:24:59 +0100 (BST)
References: <20200527100546.29297-1-alex.bennee@linaro.org>
 <20200527100546.29297-3-alex.bennee@linaro.org>
 <355ff6ba-ed8a-bc1e-4b74-c87a532e47bd@linaro.org>
 <87tuzp4zhx.fsf@linaro.org>
User-agent: mu4e 1.5.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Bug 1880225
 <1880225@bugs.launchpad.net>, Peter Maydell <peter.maydell@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v1 2/3] linux-user: deal with address wrap for
 ARM_COMMPAGE on 32 bit
In-reply-to: <87tuzp4zhx.fsf@linaro.org>
Date: Fri, 05 Jun 2020 11:24:59 +0100
Message-ID: <87k10l4xok.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: yT/7Hp65KPtc


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Richard Henderson <richard.henderson@linaro.org> writes:
>
>> On 5/27/20 3:05 AM, Alex Benn=C3=A9e wrote:
>>> @@ -2145,7 +2145,7 @@ static uintptr_t pgd_find_hole_fallback(uintptr_t=
 guest_size, uintptr_t brk, lon
>>>=20=20
>>>  /* Return value for guest_base, or -1 if no hole found. */
>>>  static uintptr_t pgb_find_hole(uintptr_t guest_loaddr, uintptr_t guest=
_size,
>>> -                               long align)
>>> +                               long align, uintptr_t offset)
>>>  {
>>>      GSList *maps, *iter;
>>>      uintptr_t this_start, this_end, next_start, brk;
>>> @@ -2171,7 +2171,7 @@ static uintptr_t pgb_find_hole(uintptr_t guest_lo=
addr, uintptr_t guest_size,
>>>=20=20
>>>          this_end =3D ((MapInfo *)iter->data)->start;
>>>          next_start =3D ((MapInfo *)iter->data)->end;
>>> -        align_start =3D ROUND_UP(this_start, align);
>>> +        align_start =3D ROUND_UP(this_start + offset, align);
>>>=20=20
>>>          /* Skip holes that are too small. */
>>
>> I suppose offset is supposed to mean we start from -offset?
>
> Well guest_base will start higher meaning we have space for the
> commpage beneath it.
>
>> You didn't update
>> pgb_find_hole_fallback.
>
> Fixed.
>
>>
>>> -            loaddr =3D ARM_COMMPAGE & -align;
>>> +            offset =3D (128 * KiB);
>>
>> Why 128K?  Surely this should be an expression against ARM_COMMPAGE.
>
> In theory:
>
>             offset =3D -(ARM_COMMPAGE & -align);
>
> should do the trick but I found it failed every now and again.
> Frustratingly putting printfs in made it go away so in frustration I
> just upped the offset until it stopped happening.
>
> I do kinda wish rr worked on i386 :-/

Ahh all I needed was a MAP_FIXED for init_commpage

--=20
Alex Benn=C3=A9e
