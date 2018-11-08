Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x18-v6sm6749853wrs.50.2018.11.08.09.30.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Nov 2018 09:30:38 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id A55723E031B;
	Thu,  8 Nov 2018 17:30:37 +0000 (GMT)
References: <20181108163329.19940-1-alex.bennee@linaro.org> <20181108163329.19940-2-alex.bennee@linaro.org> <3027e46a-42b2-4c5c-eaec-ce9caa64ecc0@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [Qemu-devel] [PATCH v2 1/6] target/arm64: properly handle DBGVR RESS bits
In-reply-to: <3027e46a-42b2-4c5c-eaec-ce9caa64ecc0@linaro.org>
Date: Thu, 08 Nov 2018 17:30:37 +0000
Message-ID: <87o9az5veq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 4qwzUOqqEe4C


Richard Henderson <richard.henderson@linaro.org> writes:

> On 11/8/18 5:33 PM, Alex Benn=C3=A9e wrote:
>> -        .bvr =3D addr
>> +        .bvr =3D sextract64(addr, 52, 53)
>
> I think you meant sextract64(addr, 0, 53).
> What you wrote *should* have asserted, since 52+53 > 64.

Dam, I did fix that. I must have failed to propagate the fix from where
I was hacking :-/

>
>
> r~


--
Alex Benn=C3=A9e
