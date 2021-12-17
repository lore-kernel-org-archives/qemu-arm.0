Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id d9sm7649315wre.52.2021.12.17.10.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 10:13:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4A98F1FF96;
	Fri, 17 Dec 2021 18:13:29 +0000 (GMT)
References: <20211213182449.7068-1-bslathi19@gmail.com>
 <87wnk8i4x7.fsf@linaro.org>
 <d0f649f7-4d5d-9b15-829c-d5cef2137797@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Byron Lathi <bslathi19@gmail.com>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] Target/arm: Implement Cortex-A5
Date: Fri, 17 Dec 2021 18:12:12 +0000
In-reply-to: <d0f649f7-4d5d-9b15-829c-d5cef2137797@linaro.org>
Message-ID: <8735mrdrqu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: aOHPH5KXGmAi


Richard Henderson <richard.henderson@linaro.org> writes:

> On 12/13/21 1:02 PM, Alex Benn=C3=A9e wrote:
>>> +    cpu->midr =3D 0x410fc0f1;
>> hmm wikipedia lists the part number as 0xc05 (and the a15 as 0xc0f)
>> but
>> I can't find the actual value in the TRM.
>
> https://developer.arm.com/documentation/ddi0434/c
>
> has exactly this value at the top of table 4-9.

Ahh good find - 0x410FC051 it is.

>
>>> +    cpu->reset_fpsid =3D 0x41023051;
>> I think for the a5 the FPU is optional so maybe we need a cpu option
>> here? Or maybe just assume it's enabled on QEMUs version?
>
> Yeah, there's no entry for fpsid in the above manual.
>
>>> +    cpu->isar.id_mmfr0 =3D 0x00100103;
>> the TRM says [11:8] Outermost shareability 0x0 L1 cache coherency
>> not supported.
>
> Again, this does match table 4-9.

0x00100003

>
>
> r~


--=20
Alex Benn=C3=A9e
