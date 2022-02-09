Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g9sm17106982wri.95.2022.02.09.08.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 08:31:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 278D31FFB7;
	Wed,  9 Feb 2022 16:31:36 +0000 (GMT)
References: <20210623134756.30930-1-alex.bennee@linaro.org>
 <20210623134756.30930-2-alex.bennee@linaro.org>
 <CAFEAcA8TCTEBnjibsUTyqRXL0tWXGUih-TATNLHuWW-5=VQHLA@mail.gmail.com>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Andrew Strauss <astrauss11@gmail.com>, Keith Packard <keithp@keithp.com>
Subject: Re: [PATCH v4 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
Date: Wed, 09 Feb 2022 16:29:32 +0000
In-reply-to: <CAFEAcA8TCTEBnjibsUTyqRXL0tWXGUih-TATNLHuWW-5=VQHLA@mail.gmail.com>
Message-ID: <87sfssdms7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: VBdiXwMb2jVj


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 23 Jun 2021 at 14:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> The previous numbers were a guess at best and rather arbitrary without
>> taking into account anything that might be loaded. Instead of using
>> guesses based on the state of registers implement a new function that:
>>
>>  a) scans the MemoryRegions for the largest RAM block
>>  b) iterates through all "ROM" blobs looking for the biggest gap
>>
>> The "ROM" blobs include all code loaded via -kernel and the various
>> -device loader techniques.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Andrew Strauss <astrauss11@gmail.com>
>> Cc: Keith Packard <keithp@keithp.com>
>> Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>
>
>> @@ -349,4 +349,20 @@ int rom_add_option(const char *file, int32_t bootin=
dex);
>>   * overflow on real hardware too. */
>>  #define UBOOT_MAX_GUNZIP_BYTES (64 << 20)
>>
<snip>
>> +static gint sort_secs(gconstpointer a, gconstpointer b)
>> +{
>> +    RomSec *ra =3D (RomSec *) a;
>> +    RomSec *rb =3D (RomSec *) b;
>
> /*
>  * Sort into address order. We break ties between rom-startpoints
>  * and rom-endpoints in favour of the startpoint, by sorting the 0->1
>  * transition before the 1->0 transition. Either way round would
>  * work, but this way saves a little work later by avoiding
>  * dealing with "gaps" of 0 length.
>  */
>
>> +
>> +    if (ra->base =3D=3D rb->base) {
>> +        return ra->se > rb->se ? -1 : 1;
>> +    }
>> +    return ra->base > rb->base ? 1 : -1;
>
> This has forgotten the "equality" case, which you will
> see if two blobs start at the same address (at least in
> theory; at the moment the rom blob loader will try to
> reject overlaps, though it might not do so forever).

I'm confused what you mean by equality case. If both RomSecs have the
same base and the same se flag we need to pick one of them. Are you
saying when ra->se =3D=3D ra->sb we should take ra?=20

--=20
Alex Benn=C3=A9e
