Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g10-20020a5d46ca000000b00203fd86e198sm4653261wrs.96.2022.03.25.03.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 03:39:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C57721FFB7;
	Fri, 25 Mar 2022 10:39:46 +0000 (GMT)
References: <YjzR3erB5ZhkAI2A@strawberry.localdomain>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, robhenry@microsoft.com
Subject: Re: Plugins Not Reporting AArch64 SVE Memory Operations
Date: Fri, 25 Mar 2022 10:19:59 +0000
In-reply-to: <YjzR3erB5ZhkAI2A@strawberry.localdomain>
Message-ID: <874k3m2u4t.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: kIC6cm2IIxRv


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> Hi folks,
>
> I see there has been some previous discussion [1] about 1.5 years ago
> around the fact that AArch64 SVE instructions do not emit any memory
> operations via the plugin interface, as one might expect them to.
>
> I am interested in being able to more accurately trace the memory
> operations of SVE instructions using the plugin interface - has there
> been any further discussion or work on this topic off-list (or that
> escaped my searching)?
>
> In the previous discussion [1], Richard raised some interesting
> questions:
>
>> The plugin interface needs extension for this.  How should I signal that=
 256
>> consecutive byte loads have occurred?  How should I signal that the cont=
rolling
>> predicate was not all true, so only 250 of those 256 were actually activ=
e?  How
>> should I signal 59 non-consecutive (gather) loads have occurred?
>>=20
>> If the answer is simply that you want 256 or 250 or 59 plugin callbacks
>> respectively, then we might be able to force the memory operations into =
the
>> slow path, and hook the operation there.  As if it were an i/o operation.
>
> My initial reaction is that simply sending individual callbacks for each
> access (only the ones which were active, in the case of predication)
> seems to fit reasonably well with the existing plugin interface. For
> instance, I think we already receive two callbacks for each AArch64
> `LDP` instruction, right?

This seems the simplest solution. I think what you need to look at is
how the sve_ldst1_host_fn and sve_ldst1_tlb_fn functions eventually
emerge out of the macro expansion (having a -E copy of the compiled
source might be helpful here).

That said I'm confused that softmmu isn't already hooked into by virtue
of using the softmmu slowpath (cpu_[ld|st]_*). However user space
emulation which typically directly accesses a final host address will
need to be fixed.

> If this is an agreeable solution that wouldn't take too much effort to
> implement (and no one else is doing it), would someone mind pointing me
> in the right direction to get started?

Richard, anything to add?

>
> Thanks!
>
> -Aaron
>
> [1] https://lists.nongnu.org/archive/html/qemu-discuss/2020-12/msg00015.h=
tml


--=20
Alex Benn=C3=A9e
