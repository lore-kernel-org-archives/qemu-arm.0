Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n187sm23393313wme.28.2020.01.15.04.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 04:01:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 356D11FF87;
	Wed, 15 Jan 2020 12:01:12 +0000 (GMT)
References: <11d88b2741eac3f634d5aed9e3355c974b533f7b.camel@kernel.crashing.org>
 <AE7841A1-B4D6-4D6D-9AFD-01C4604D7BC4@livius.net>
 <cd9a2de94700a2781f176247131dceba690d8f31.camel@kernel.crashing.org>
 <87sgkimkma.fsf@linaro.org>
 <1309ca0ab6405d88cfd949c73130ad0f2af944a6.camel@kernel.crashing.org>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Liviu Ionescu <ilg@livius.net>, qemu-devel@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>, keithp@keithp.com, qemu-arm@nongnu.org
Subject: Re: Semihosting, arm, riscv, ppc and common code
In-reply-to: <1309ca0ab6405d88cfd949c73130ad0f2af944a6.camel@kernel.crashing.org>
Date: Wed, 15 Jan 2020 12:01:12 +0000
Message-ID: <87wo9tkjxz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ULg9gjEB48w3


Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:

> On Tue, 2020-01-14 at 09:51 +0000, Alex Benn=C3=A9e wrote:
>> > Well, one of the LCA talks wasn't that interesting so I started
>> > doing
>> > it and am almost done :-)
>> >=20
>> > I'll look at doing something for arm, riscv and ppc and send
>> > patches
>> > once I get it working.
>>=20
>> Cool. Are you considering linux-user as well or are these only things
>> that make sense for system emulation?
>
> There seem to be some linux-user stuff in there, I'm mostly considering
> whatever ARM does today but we can certainly extend later.

Depends on if it is to be used. AFAIK the main users of arm linux user
are compiler test cases for M-profile CPUs.=20

> The idea is to make sure ARM, RiscV and POWER use the same protocol and
> code base to make picolibc (and others) life easier. Bug compatible
> :-)

Hmm, I'm not so sure. QEMU tries to emulate real HW although I
appreciate that is a somewhat loose definition once you get to things
like -M virt and other such SW like abstractions. Is semihosting even
going to be a thing on real RiscV/Power silicon?

>
> Cheers,
> Ben.


--=20
Alex Benn=C3=A9e
