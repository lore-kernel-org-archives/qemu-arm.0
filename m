Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u68sm42377wmu.12.2019.09.17.13.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 13:57:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2FE211FF87;
	Tue, 17 Sep 2019 21:57:20 +0100 (BST)
References: <20190917184109.12564-1-alex.bennee@linaro.org>
 <20190917184109.12564-9-alex.bennee@linaro.org>
 <73df6b9e-d096-f58f-dfeb-aad0c8e50d39@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [PATCH v1 8/9] tests/tcg: add generic version of
 float_convs
In-reply-to: <73df6b9e-d096-f58f-dfeb-aad0c8e50d39@linaro.org>
Date: Tue, 17 Sep 2019 21:57:20 +0100
Message-ID: <878sqm1w0f.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Ct68UA9UAjXk


Richard Henderson <richard.henderson@linaro.org> writes:

> On 9/17/19 2:41 PM, Alex Benn=C3=A9e wrote:
>> +    for (i =3D 0; i < ARRAY_SIZE(round_flags); ++i) {
>> +        fesetround(round_flags[i].flag);
>
> If we're going to make this a generic test, perhaps
> continue if fesetround fails?

I ifdef'ed the missing symbols? Can the symbol exits but not be settable?
>
>
> r~


--
Alex Benn=C3=A9e
