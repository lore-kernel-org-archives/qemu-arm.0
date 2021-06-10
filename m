Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id k8sm3720433wrp.3.2021.06.10.07.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 07:08:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 58A001FF7E;
	Thu, 10 Jun 2021 15:08:54 +0100 (BST)
References: <20210610102617.17281-1-alex.bennee@linaro.org>
 <CAFEAcA8O1Cca2BnNp5c=0yYbKExYH1sUYe68C_msG_oBSUGW3g@mail.gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Andrew Strauss <astrauss11@gmail.com>, Nick Clifton <nickc@redhat.com>
Subject: Re: [PATCH v2] semihosting/arm-compat: remove heuristic softmmu
 SYS_HEAPINFO
Date: Thu, 10 Jun 2021 14:55:24 +0100
In-reply-to: <CAFEAcA8O1Cca2BnNp5c=0yYbKExYH1sUYe68C_msG_oBSUGW3g@mail.gmail.com>
Message-ID: <87lf7hizgp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ItEZhVWPpCER


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
>
> The spec:
> https://github.com/ARM-software/abi-aa/blob/main/semihosting/semihosting.=
rst#sys-heapinfo-0x16
>
> doesn't document that 'return 0 for "I don't know"' is valid, so if we're
> going to do it we ought to at least note that we're deviating from the
> spec here.

That comes from newlib who state:

	/*  We skip setting SP/SL if 0 returned from semihosting.
	    - According to semihosting docs, if 0 returned from semihosting,
	      the system was unable to calculate the real value, so it's ok
	      to skip setting SP/SL to 0 here.
	    - Considering M-profile processors, We might want to initialize
	      SP by the first entry of vector table and return 0 to SYS_HEAPINFO
	      semihosting call, which will be skipped here.
	    - Considering R-profile processors there is no automatic SP init by ha=
rdware
	      so we need to initialize it by default value.  */

that doesn't come from the actual semihosting spec but the ARM Compiler
Development guide (ARM DUI0471M) which has a more detailed entry:

  7.13 SYS_HEAPINFO (0x16)
  Returns the system stack and heap parameters.

  The values returned are typically those used by the C library during
  initialization. For a debug hardwareunit, such as RVI or DSTREAM, the
  values returned are the image location and the top of memory.

  The C library can override these values.

  The host debugger determines the actual values to return by using the
  top_of_memory debugger variable.

  <snip>

  Note

  If word one of the data block has the value zero, the C library replaces
  the zero with Image$$ZI$$Limit.This value corresponds to the top of the
  data region in the memory map.

  Return

  On exit, R1 contains the address of the pointer to the structure.If one
  of the values in the structure is 0, the system was unable to calculate
  the real value.

which I think is the basis for the newlib fallback behaviour.

--=20
Alex Benn=C3=A9e
