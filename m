Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id b6sm8015275ejb.80.2022.02.11.05.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 05:23:32 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A2F731FFB7;
	Fri, 11 Feb 2022 13:23:31 +0000 (GMT)
References: <20220210113021.3799514-1-alex.bennee@linaro.org>
 <20220210113021.3799514-2-alex.bennee@linaro.org>
 <8b6fca38-8a4e-af35-f202-86a5a3f98e47@amsat.org>
 <CAFEAcA-2=TD9FeOn9ZJLBmJJBfQhOKSTRWpOXEw0AVktWmE6vA@mail.gmail.com>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Andrew
 Strauss <astrauss11@gmail.com>, Keith Packard <keithp@keithp.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
Date: Fri, 11 Feb 2022 13:22:43 +0000
In-reply-to: <CAFEAcA-2=TD9FeOn9ZJLBmJJBfQhOKSTRWpOXEw0AVktWmE6vA@mail.gmail.com>
Message-ID: <878ruhedv0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: froYcLuqzVZG


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 10 Feb 2022 at 11:48, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>>
>> Hi Alex,
>>
>> On 10/2/22 12:30, Alex Benn=C3=A9e wrote:
>> > The previous numbers were a guess at best and rather arbitrary without
>> > taking into account anything that might be loaded. Instead of using
>> > guesses based on the state of registers implement a new function that:
>> >
>> >   a) scans the MemoryRegions for the largest RAM block
>> >   b) iterates through all "ROM" blobs looking for the biggest gap
>> >
>> > The "ROM" blobs include all code loaded via -kernel and the various
>> > -device loader techniques.
>> >
>> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> > Cc: Andrew Strauss <astrauss11@gmail.com>
>> > Cc: Keith Packard <keithp@keithp.com>
>> > Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>
>>
>> > +static LayoutInfo common_semi_find_bases(CPUState *cs)
>> >   {
>> > -    MemoryRegion *subregion;
>> > +    FlatView *fv;
>> > +    LayoutInfo info =3D { 0, 0, 0, 0 };
>> > +
>> > +    RCU_READ_LOCK_GUARD();
>> > +
>> > +    fv =3D address_space_to_flatview(cs->as);
>>
>> Why are we using the CPU view and not address_space_memory?
>
> If you have a choice between "use the right view of an
> address space" and "use the global address_space_memory",
> it's better to prefer the former, I think. We use the
> latter in lots of places, but it's not conceptually the
> right way to think about how the memory system works IMHO.

In this case the addresses have to be as the CPU sees them because it's
between the CPU and the semihosting backend to share data.

--=20
Alex Benn=C3=A9e
