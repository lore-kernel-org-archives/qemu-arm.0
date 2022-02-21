Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 8-20020a05600c26c800b0037bec3c03c9sm480469wmv.2.2022.02.21.09.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 09:06:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 906E61FFB7;
	Mon, 21 Feb 2022 17:05:59 +0000 (GMT)
References: <20220210113021.3799514-1-alex.bennee@linaro.org>
 <20220210113021.3799514-2-alex.bennee@linaro.org>
 <CAFEAcA8852qLhKhKT9rnr00CG38i97gSnhoh_A0BoEp_xhe_vg@mail.gmail.com>
User-agent: mu4e 1.7.8; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Andrew Strauss
 <astrauss11@gmail.com>, Keith Packard <keithp@keithp.com>
Subject: Re: [PATCH v5 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
Date: Mon, 21 Feb 2022 17:03:14 +0000
In-reply-to: <CAFEAcA8852qLhKhKT9rnr00CG38i97gSnhoh_A0BoEp_xhe_vg@mail.gmail.com>
Message-ID: <87h78sm9oo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: nvMOyFFdLVs8


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 10 Feb 2022 at 11:30, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
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
>>
>
>
>> +/*
>> + * Sort into address order. We break ties between rom-startpoints
>> + * and rom-endpoints in favour of the startpoint, by sorting the 0->1
>> + * transition before the 1->0 transition. Either way round would
>> + * work, but this way saves a little work later by avoiding
>> + * dealing with "gaps" of 0 length.
>> + */
>> +static gint sort_secs(gconstpointer a, gconstpointer b)
>> +{
>> +    RomSec *ra =3D (RomSec *) a;
>> +    RomSec *rb =3D (RomSec *) b;
>> +
>> +    if (ra->base =3D=3D rb->base) {
>> +        return ra->se - rb->se;
>> +    }
>> +    return ra->base > rb->base ? 1 : -1;
>> +}
>
> This sort comparator still doesn't report the equality
> case as actually equal.

When ra->se and rb->se are the same it returns 0. Is that not what you want?

>
>>      /*
>> -     * Find the chunk of R/W memory containing the address.  This is
>> -     * used for the SYS_HEAPINFO semihosting call, which should
>> -     * probably be using information from the loaded application.
>> +     * If we have found the RAM lets iterate through the ROM blobs to
>> +     * workout the best place for the remainder of RAM and split it
>
> "work out"
>
>> +     * equally between stack and heap.
>>       */
>
>> @@ -1201,12 +1205,15 @@ target_ulong do_common_semihosting(CPUState *cs)
>>              retvals[2] =3D ts->stack_base;
>>              retvals[3] =3D 0; /* Stack limit.  */
>>  #else
>> -            limit =3D current_machine->ram_size;
>> -            /* TODO: Make this use the limit of the loaded application.=
  */
>> -            retvals[0] =3D rambase + limit / 2;
>> -            retvals[1] =3D rambase + limit;
>> -            retvals[2] =3D rambase + limit; /* Stack base */
>> -            retvals[3] =3D rambase; /* Stack limit.  */
>> +            /*
>> +             * Reporting 0 indicates we couldn't calculate the real
>> +             * values which should force most software to fall back to
>> +             * using information it has.
>> +             */
>
> What is this comment referring to? We aren't obviously
> reporting 0 here...

Stale comment, deleted.

>
>> +            retvals[0] =3D info.heapbase;  /* Heap Base */
>> +            retvals[1] =3D info.heaplimit; /* Heap Limit */
>> +            retvals[2] =3D info.heaplimit; /* Stack base */
>> +            retvals[3] =3D info.heapbase;  /* Stack limit.  */
>>  #endif
>>
>>              for (i =3D 0; i < ARRAY_SIZE(retvals); i++) {
>
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> -- PMM


--=20
Alex Benn=C3=A9e
