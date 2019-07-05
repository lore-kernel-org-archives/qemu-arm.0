Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 32sm2557891wrh.76.2019.07.05.09.23.45
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 05 Jul 2019 09:23:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C98941FF87;
	Fri,  5 Jul 2019 17:23:44 +0100 (BST)
References: <20190703102208.10086-1-alex.bennee@linaro.org> <CAFEAcA-rT3B-1GvFY55Ete1cm8f+38AGFyzDcJxQsqM1c=D4sQ@mail.gmail.com> <87sgrkv5k3.fsf@zen.linaroharston> <CAFEAcA99=Kf7GoHaNfGu7qmyYUrxA7kK1p2jianj-4OTxFebvA@mail.gmail.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [RFC PATCH for semihosting-tests] semihosting tests: add v7m tests
In-reply-to: <CAFEAcA99=Kf7GoHaNfGu7qmyYUrxA7kK1p2jianj-4OTxFebvA@mail.gmail.com>
Date: Fri, 05 Jul 2019 17:23:44 +0100
Message-ID: <87pnmov4a7.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: DHIj+oCc3Spy


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 5 Jul 2019 at 16:56, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Wed, 3 Jul 2019 at 11:22, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>> >> diff --git a/microbit.lds b/microbit.lds
>> >> new file mode 100644
>> >> index 0000000..24840a3
>> >> --- /dev/null
>> >> +++ b/microbit.lds
>> >> @@ -0,0 +1,32 @@
>> >> +/*
>> >> + * microbit.lds : simple linker script for baremetal ARM-M test cases
>> >> + *
>> >> + * Copyright (C) 2019 Linaro Limited. All rights reserved.
>> >> + *
>> >> + * Memory layout is for the BBC Microbit board which puts RAM at 0x2=
0000000
>> >> + */
>> >
>> > I know this is just copied from the baremetal.lds, but we
>> > really should have a license statement in every source file
>> > (and I should fix the ones which don't have a license at the moment).
>> >
>> >> +
>> >> +RAMSTART =3D 0x20000000;
>> >> +STACKTOP =3D 0x20004000;
>> >
>> > That puts stacktop really close to the start of the heap --
>> > isn't there more space to give ourselves some safety margin?
>>
>> We could - do we actually use any heap in this - I thought it was all
>> static .data?
>
> By 'heap' here I mean everything that goes after RAMSTART,
> which is the whole of the .text, .data and .bss sections.
> Mostly I just think we should give ourselves a reasonable
> amount of elbow room so we don't find out the hard way
> that we've expanded the code/data to the point where it
> runs into the stack...
>
>> >
>> >> +
>> >> +ENTRY(exc_reset_thumb)
>> >> +
>> >> +SECTIONS
>> >> +{
>> >> +    . =3D 0x0;
>> >> +    .text : {
>> >> +        *(.text)
>> >> +    }
>> >> +    .data : {
>> >> +        *(.data)
>> >> +    }
>> >> +    .rodata : {
>> >> +        *(.rodata)
>> >> +    }
>> >> +    .bss : {
>> >> +        *(.bss)
>> >> +    }
>>
>> I wonder if there are runes for setting STACKTOP as end of .bss +
>> something? I guess it would help if we could tell the linker what the
>> top of microbit memory was.
>
> In the baremetal.lds and baremetal-a64.lds files I use
> ". =3D RAMSTART;" and ". =3D STACKTOP;" lines, which means that
> the linker will detect whether we've put too much stuff
> in and run past STACKTOP. Your file here seems to be missing those...
>
> (Also, why do you need a .rodata here when the other lds files don't?)

In case we add any? Also see the other reply after rth figured out what was
breaking due to attempts to write to the ROM.

>
>> >> +exc_reset:
>> >> +.equ exc_reset_thumb, exc_reset + 1
>> >> +.global exc_reset_thumb
>> >
>> > There must be a better way than this to declare an asm label
>> > for a thumb entrypoint...
>>
>> That may not be needed any more - I'll drop it and see.
>
> You do definitely need the vector table entry to have
> the low bit set. I just suspect there's a way to say
> "this label is a code entry point for Thumb mode" which
> avoids the need for the manual addition.

Ahh I misread - I added:

        .type __semi_call, function

to semi.s - maybe that would do as well?

>
> thanks
> -- PMM


--
Alex Benn=C3=A9e
