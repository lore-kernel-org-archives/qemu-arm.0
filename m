Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n12sm2861236wrs.19.2021.06.01.03.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 03:07:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 041BE1FF7E;
	Tue,  1 Jun 2021 11:07:25 +0100 (BST)
References: <20210601090715.22330-1-alex.bennee@linaro.org>
 <CAFEAcA-zzg4Yh0pX2q-9OfFKEbX_uGkVb_8kZbQJJETLRo_zOQ@mail.gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Andrew <astrauss11@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [RFC PATCH] semihosting/arm-compat: remove heuristic softmmu
 SYS_HEAPINFO
Date: Tue, 01 Jun 2021 11:04:17 +0100
Message-ID: <87fsy1dhke.fsf@linaro.org>
In-reply-to: <CAFEAcA-zzg4Yh0pX2q-9OfFKEbX_uGkVb_8kZbQJJETLRo_zOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Yd9UepQobov/


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 1 Jun 2021 at 10:12, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> The previous numbers were a guess at best. While we could extract the
>> information from a loaded ELF file via -kernel we could still get
>> tripped up by self decompressing or relocating code. Besides sane
>> library code has access to the same symbols in run time to make a
>> determination of the location of the heap.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Andrew <astrauss11@gmail.com>
>> ---
>>  semihosting/arm-compat-semi.c | 19 ++++++++++---------
>>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> This seems like a pretty good candidate for breaking existing
> working binaries. How much testing against different varieties of
> guest-code-using-semihosting have you done ?

None, which is why it's an RFC - but at least one user reported newlib
attempts to use the numbers we gave it rather than falling back to
numbers it knew from the build and getting it wrong. I suspect any code
that doesn't have a fallback path is getting it right more by luck than
judgement though. I'd be curious to hear of code that relies on the
numbers it gets from QEMU.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
