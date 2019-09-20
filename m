Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id v64sm1609001wmf.12.2019.09.20.03.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2019 03:15:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 24AE51FF87;
	Fri, 20 Sep 2019 11:15:16 +0100 (BST)
References: <20190919171015.12681-1-alex.bennee@linaro.org>
 <20190919171015.12681-11-alex.bennee@linaro.org>
 <c6cd971c-e84c-c5c9-b313-2e454e02a1da@linaro.org>
 <87impnz568.fsf@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 10/16] tests/tcg: add generic version of float_convs
In-reply-to: <87impnz568.fsf@linaro.org>
Date: Fri, 20 Sep 2019 11:15:16 +0100
Message-ID: <87h857z32j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: jrmtK+Cqu3Tf


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Richard Henderson <richard.henderson@linaro.org> writes:
>
>> On 9/19/19 10:10 AM, Alex Benn=C3=A9e wrote:
>>> This is broadly similar to the existing fcvt test for ARM but using
>>> the generic float testing framework. We should be able to pare down
>>> the ARM fcvt test case to purely half-precision with or without the
>>> Alt HP provision.
>>>
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> ---
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> This test seems to be tripping up alpha-linux-user be generating FPU
> exceptions. AFAICT we are meant to start with software exceptions
> disabled but:
>
>   cpu_alpha_store_fpcr: enabled exceptions: 2000000
>
> from the get go is what causes the eventual trip up.

I can't figure out what is meant to be going on with CONVERT_BITS. It
seems to be implying there is a direct relationship between status flags
and the exception disable bits. But that is confusing because integer
overflow (IOV) and float overflow (OVF) are different flags bit I assume
both suppressed by Overflow Disable (OVFD).

Why are we doing this magic 32 bit shuffling anyway? Is it purely to
save 32 bits of a mostly empty lower half of the FPCR register?

>
>>
>>
>> r~


--
Alex Benn=C3=A9e
