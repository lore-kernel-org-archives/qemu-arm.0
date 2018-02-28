Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d63sm2151122wmh.16.2018.02.28.05.32.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Feb 2018 05:32:44 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id D9FA63E00A6;
	Wed, 28 Feb 2018 13:32:43 +0000 (GMT)
References: <20180227143852.11175-1-alex.bennee@linaro.org> <CAFEAcA8LEG=bzXrj3etTdf_q3-AcMVfCCqSGQ2OkXUPGBHkMBQ@mail.gmail.com>
User-agent: mu4e 1.1.0; emacs 26.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v4 00/31] Add ARMv8.2 half-precision functions
In-reply-to: <CAFEAcA8LEG=bzXrj3etTdf_q3-AcMVfCCqSGQ2OkXUPGBHkMBQ@mail.gmail.com>
Date: Wed, 28 Feb 2018 13:32:43 +0000
Message-ID: <87woyxutms.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: OUHg/MiPijOv


Peter Maydell <peter.maydell@linaro.org> writes:

> On 27 February 2018 at 14:38, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>> A few minor fixes and a chunk of Richard's r-b tags. Now all that is
>> left is:
>>
>>   patch 0014/arm translate a64 add FP16 FMULX MLS FMLA to simd.patch nee=
ds review
>>
>> Otherwise see comments bellow --- for other changes
>>
>
> Thanks -- applied to target-arm.next. Some caveats:
>
> (1) we can fix the nit RTH noted about FMULX later
>
> (2) I notice that there's no patch here that adds the linux-user/elfload.c
> code to set a hwcap for the guest program to indicate FP16 presence.
> Presumably there is such a hwcap?

I'd missed it as risu doesn't need it. I see rth has sent a patch so
I'll read up on it and see if I can extend vector-benchmark to use it to
detect FP16.

>
> (3) Is this complete fp16 support or are there still more pieces to come?
> I'm assuming it's all done...

All AArch64 is done. I'm not sure how much AArch32 is needed for SVE
support. The ARM ARM says "When this feature is implemented it is
implemented in both Advanced SIMD and floating-point, and in AArch64 and
AArch32 states." but I think it is legal to have a 64 bit only CPU
without AArch32?

Unfortunately the magic I used to extract all the AArch64 HP
instructions from the ASL doesn't work on the AArch32 definitions which
put important differentiating notes in different places.

Once I've got the list I'll document it so we don't forget...

>
> (4) I've split the "add new ARM_V8_FP16 feature bit to the enum"
> and "enable the feature on the 'any' CPU" parts of patch 2, so
> we can do the latter at the end. If there is still missing parts
> to fp16 then we can drop the enable-feature half of that
> for the moment.

I guess that depends on if we model any AArch64 only CPUs?

>
> thanks
> -- PMM


--
Alex Benn=C3=A9e
