Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id e19sm52289067wra.71.2019.07.22.04.57.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 04:57:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4D0321FF87;
	Mon, 22 Jul 2019 12:57:05 +0100 (BST)
References: <20190722111914.28574-1-alex.bennee@linaro.org>
 <CAFEAcA_uOX9qkrwRASAaxOfTms9SsQMEyhJ0XwYFiFPVtEnqkw@mail.gmail.com>
User-agent: mu4e 1.3.3; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [RFC PATCH for 4.2] target/arm: generate a custom MIDR for -cpu
 max
In-reply-to: <CAFEAcA_uOX9qkrwRASAaxOfTms9SsQMEyhJ0XwYFiFPVtEnqkw@mail.gmail.com>
Date: Mon, 22 Jul 2019 12:57:05 +0100
Message-ID: <87r26ijn8u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ma92HUtO+mNU


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 22 Jul 2019 at 12:19, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> While most features are now detected by probing the ID_* registers
>> kernels can (and do) use MIDR_EL1 for working out of they have to
>> apply errata. This can trip up warnings in the kernel as it tries to
>> work out if it should apply workarounds to features that don't
>> actually exist in the reported CPU type.
>>
>> Avoid this problem by synthesising our own MIDR value using the
>> reserved value of 0 for the implementer and encoding the moving feast
>> that is the QEMU version string into the other fields.
>
> Exposing the QEMU_VERSION_* information to the guest is
> usually not a good plan. For instance it means that the
> MIDR will mysteriously change if you save a VM on one
> version of QEMU and restore it on another.

Given the mutability of -cpu max that is probably a good thing?

> We went through
> a while back carefully removing places where we'd exposed
> the version number to the guest (have a look at the
> qemu_hw_version() stuff which has to jump through hoops
> so that old versioned machines like pc-1.5 report the
> old "1.5" version number, and any QEMU 2.5 and above
> now reports "2.5+"...)

Well I guess we could do:

  cpu->midr =3D FIELD_DP64(0, MIDR_EL1, ARCHITECTURE, 0xf)

but any kernel that attempts to apply fixups for a 0x0 implementer is
asking for trouble anyway. I assume it's unlikely ARM would assign QEMU
an implementer code!

>
> thanks
> -- PMM


--
Alex Benn=C3=A9e
