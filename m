Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g205sm9977602wme.6.2021.06.10.07.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 07:15:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CC3EF1FF7E;
	Thu, 10 Jun 2021 15:15:58 +0100 (BST)
References: <20210610102617.17281-1-alex.bennee@linaro.org>
 <CAFEAcA9yhRS_=zr+76HdDN=iYU=ghDjLPfSaFUA9fzmJ5p3vCA@mail.gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Andrew Strauss <astrauss11@gmail.com>
Subject: Re: [PATCH v2] semihosting/arm-compat: remove heuristic softmmu
 SYS_HEAPINFO
Date: Thu, 10 Jun 2021 15:12:21 +0100
In-reply-to: <CAFEAcA9yhRS_=zr+76HdDN=iYU=ghDjLPfSaFUA9fzmJ5p3vCA@mail.gmail.com>
Message-ID: <87im2liz4x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 7pLH3RSgJmAa


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 10 Jun 2021 at 11:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> The previous numbers were a guess at best. While we could extract the
>> information from a loaded ELF file via -kernel we could still get
>> tripped up by self decompressing or relocating code. Besides sane
>> library code like newlib will fall back to known symbols to determine
>> of the location of the heap. We can still report the limits though as
>> we are reasonably confident that busting out of RAM would be a bad
>> thing for either stack or heap.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Tested-by: Andrew Strauss <astrauss11@gmail.com>
>> Reviewed-by: Andrew Strauss <astrauss11@gmail.com>
>> Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>
>>
>> ---
>> v2
>>   - report some known information (limits)
>>   - reword the commit message
>> ---
>>  semihosting/arm-compat-semi.c | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi=
.c
>> index 1c29146dcf..8873486e8c 100644
>> --- a/semihosting/arm-compat-semi.c
>> +++ b/semihosting/arm-compat-semi.c
>> @@ -1202,10 +1202,14 @@ target_ulong do_common_semihosting(CPUState *cs)
>>              retvals[3] =3D 0; /* Stack limit.  */
>>  #else
>>              limit =3D current_machine->ram_size;
>> -            /* TODO: Make this use the limit of the loaded application.=
  */
>> -            retvals[0] =3D rambase + limit / 2;
>> -            retvals[1] =3D rambase + limit;
>> -            retvals[2] =3D rambase + limit; /* Stack base */
>> +            /*
>> +             * Reporting 0 indicates we couldn't calculate the real
>> +             * values which should force most software to fall back to
>> +             * using information it has.
>> +             */
>> +            retvals[0] =3D 0; /* Heap Base */
>> +            retvals[1] =3D rambase + limit; /* Heap Limit */
>> +            retvals[2] =3D 0; /* Stack base */
>>              retvals[3] =3D rambase; /* Stack limit.  */
>>  #endif
>
> I'm told that the Arm C compiler C library always assumes that
> the "stack base" value is what it should set SP to, so reporting 0
> for that will break binaries that were built with it.
>
> As the TODO comment notes, the "heap base" is a bit of a guess,
> but putting stackbase at top-of-RAM seems generally sensible.
>
> What bug are we trying to fix here?

Having newlib use a value that's wrong and therefor plant it's heap in
the middle of the loaded code.

> I think one possible implementation that might not be too
> hard to make work would be:
>
>  (1) find the guest physical address of the main machine
>      RAM (machine->ram). You can do this with flatview_for_each_range()
>      similar to what rom_ptr_for_as() does. (It might be mapped
>      more than once, we could just pick the first one.)

Currently this is done by common_semi_find_region_base which pokes
around get_system_memory()->subregions to find a region containing an
initialised register pointer.

>  (2) find the largest contiguous extent of that RAM which
>      is not covered by a ROM blob, by iterating through the
>      ROM blob data. (This sounds like one of those slightly
>      irritating but entirely tractable algorithms questions :-))

Does that assume that any rom blob (so anything from -kernel, -pflash or
-generic-loader?) will have also included space for guest data and bss?

>  (3) report the lowest address of that extent as the heap base
>      and the stack limit, and the highest address as the heap
>      limit and the stack base.
>
> This would work for all guest architectures and remove the need
> for that Arm-specific code...
>
> -- PMM


--=20
Alex Benn=C3=A9e
