Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q3sm17482019wmc.47.2020.01.14.01.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 01:51:27 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9FC501FF87;
	Tue, 14 Jan 2020 09:51:25 +0000 (GMT)
References: <11d88b2741eac3f634d5aed9e3355c974b533f7b.camel@kernel.crashing.org>
 <AE7841A1-B4D6-4D6D-9AFD-01C4604D7BC4@livius.net>
 <cd9a2de94700a2781f176247131dceba690d8f31.camel@kernel.crashing.org>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Liviu Ionescu <ilg@livius.net>, qemu-devel@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>, keithp@keithp.com, qemu-arm@nongnu.org
Subject: Re: Semihosting, arm, riscv, ppc and common code
In-reply-to: <cd9a2de94700a2781f176247131dceba690d8f31.camel@kernel.crashing.org>
Date: Tue, 14 Jan 2020 09:51:25 +0000
Message-ID: <87sgkimkma.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: IIHV+KPDfXnz


Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:

> On Tue, 2020-01-14 at 09:32 +0200, Liviu Ionescu wrote:
>> > On 14 Jan 2020, at 08:25, Benjamin Herrenschmidt <
>> > benh@kernel.crashing.org> wrote:
>> >=20
>> > I noticed that the bulk of arm-semi.c (or riscv-semi.c) is
>> > trivially
>> > made completely generic by doing a couple of changes:
>>=20
>> Last year I did a similar exercise in OpenOCD, where I took the Arm
>> semihosting code from the Arm specific location, extracted the common
>> part, updated it for latest Arm 64-bit specs, and then used the
>> common code for both Arm and RISC-V.
>>=20
>> If you think useful, you might take a look there too.
>
> Well, one of the LCA talks wasn't that interesting so I started doing
> it and am almost done :-)
>
> I'll look at doing something for arm, riscv and ppc and send patches
> once I get it working.

Cool. Are you considering linux-user as well or are these only things
that make sense for system emulation?

>
> Cheers,
> Ben.
>
>>=20
>> Regards,
>>=20
>> Liviu


--=20
Alex Benn=C3=A9e
