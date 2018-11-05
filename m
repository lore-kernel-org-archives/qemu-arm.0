Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w17-v6sm12112962wmc.39.2018.11.05.08.50.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Nov 2018 08:50:02 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 2F0333E0245;
	Mon,  5 Nov 2018 16:50:01 +0000 (GMT)
References: <20181016093703.10637-1-peter.maydell@linaro.org> <20181016093703.10637-2-peter.maydell@linaro.org> <87tvkvebmd.fsf@linaro.org> <CAFEAcA8tPHFHFHeB5ty2x6GGgTs6aQG3ckD6NkzOR7OgAX-f9Q@mail.gmail.com>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, "patches\@linaro.org" <patches@linaro.org>
Subject: Re: [Qemu-arm] [PATCH 1/2] target/arm: Set S and PTW in 64-bit PAR format
In-reply-to: <CAFEAcA8tPHFHFHeB5ty2x6GGgTs6aQG3ckD6NkzOR7OgAX-f9Q@mail.gmail.com>
Date: Mon, 05 Nov 2018 16:50:01 +0000
Message-ID: <87r2fzeafa.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /6nqFEe+U2HI


Peter Maydell <peter.maydell@linaro.org> writes:

> On 5 November 2018 at 16:24, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>>> In do_ats_write() we construct a PAR value based on the result
>>> of the translation.  A comment says "S2WLK and FSTAGE are always
>>> zero, because we don't implement virtualization".
>>> Since we do in fact now implement virtualization, add the missing
>>> code that sets these bits based on the reported ARMMMUFaultInfo.
>>>
>>> (These bits are named PTW and S in ARMv8, so we follow that
>>> convention in the new comments in this patch.)
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>  target/arm/helper.c | 10 ++++++----
>>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>>> index 43afdd082e1..dc849b09893 100644
>>> --- a/target/arm/helper.c
>>> +++ b/target/arm/helper.c
>>> @@ -2344,10 +2344,12 @@ static uint64_t do_ats_write(CPUARMState *env, =
uint64_t value,
>>>
>>>              par64 |=3D 1; /* F */
>>
>> To aid readability, mainly for those not familiar like me, maybe:
>>
>>   par64 |=3D 1; /* PAR_EL1.F =3D=3D 1, failed translation */
>
> That's in the existing code...

I know, it was just a suggestion to help make it clearer there are two
forms when you are reading the register definition.

--
Alex Benn=C3=A9e
