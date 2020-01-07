Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id s3sm27196108wmh.25.2020.01.07.06.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 06:27:19 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2A4051FF87;
	Tue,  7 Jan 2020 14:27:19 +0000 (GMT)
References: <20191220132246.6759-1-alex.bennee@linaro.org>
 <20191220132246.6759-6-alex.bennee@linaro.org>
 <09322c6e-74d9-08d0-1138-f2d5581a7244@linaro.org>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 keithp@keithp.com, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v2 5/5] tests/tcg: add user version of dumb-as-bricks
 semiconsole test
In-reply-to: <09322c6e-74d9-08d0-1138-f2d5581a7244@linaro.org>
Date: Tue, 07 Jan 2020 14:27:19 +0000
Message-ID: <87d0bv4a0o.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: KEQZQbjj9Yzd


Richard Henderson <richard.henderson@linaro.org> writes:

> On 12/21/19 12:22 AM, Alex Benn=C3=A9e wrote:
>> +#if defined(__arm__)
>> +    register uintptr_t t asm("r0") =3D type;
>> +    register uintptr_t a0 asm("r1") =3D arg0;
>> +    asm("svc 0xab"
>> +        : "=3Dr" (t)
>> +        : "r" (t), "r" (a0));
>
> This is the #ifdef __thumb__ svc code.  Are you enforcing that with
> command-line arguments?

No it is dealing with aarch64 vs 32 bit and the __arm__ is a compiler
symbol.=20

>
> Might as well fix this, then test both arm and thumb.

I've enabled for Aarch64 just like the semihosting test.

>
>
> r~


--=20
Alex Benn=C3=A9e
