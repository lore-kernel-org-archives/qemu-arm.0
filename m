Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id o12sm15678020wmq.12.2021.11.15.04.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 04:10:56 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7A1611FF96;
	Mon, 15 Nov 2021 12:10:55 +0000 (GMT)
References: <CAFEAcA8vRNC8RTAAxgYzZsGdqGfzDSr3m0UXmeZoF115z=6N3Q@mail.gmail.com>
 <8639608F-1685-48B8-B965-255D30B213F8@csgraf.de>
 <CAFEAcA_SzCtyDJfnJLLT57Xuf-TdJHRLEW00E7tQkdresxokMg@mail.gmail.com>
 <67c00a6a-e50a-3ea6-ef1d-98494fdbd729@csgraf.de>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alexander Graf <agraf@csgraf.de>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Andrei Warkentin <andrey.warkentin@gmail.com>
Subject: Re: [PATCH] arm: Don't remove EL3 exposure for SMC conduit
Date: Mon, 15 Nov 2021 12:08:29 +0000
In-reply-to: <67c00a6a-e50a-3ea6-ef1d-98494fdbd729@csgraf.de>
Message-ID: <875ysty5yo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: bUrJcgzXzvXq


Alexander Graf <agraf@csgraf.de> writes:

> On 15.11.21 11:46, Peter Maydell wrote:
>> On Sun, 14 Nov 2021 at 17:41, Alexander Graf <agraf@csgraf.de> wrote:
>>>
>>>
>>>> Am 14.11.2021 um 18:20 schrieb Peter Maydell <peter.maydell@linaro.org=
>:
>>>> This is tricky, because we use the cpu->isar values to determine wheth=
er
>>>> we should be emulating things. So this change means we now create an
>>>> inconsistent CPU which in some ways claims to have EL3 (the ISAR ID
>>>> bits say so) and in some ways does not (the ARM_FEATURE_EL3 flag is
>>>> unset), and depending on which of the two "do we have EL3?" methods
>>>> any bit of the TCG code is using will give different results...
>>> Do you think it would be sufficient to go through all readers of
>>> the isar bits and guard them behind an ARM_FEATURE_EL3 check in
>>> addition? I'll be happy to do so then! :)
>> That would be a big reverse-course on a design choice we made that
>> the preference is to look at the ID registers and phase out the
>> use of ARM_FEATURE bits where possible.
>
>
> I'm open to alternatives. As it stands, we're lying to the guest
> because we tell it "SMC is not available" but ask it to call SMC for
> PSCI, which is bad too.

Is testing the ISAR bits actually telling a guest that SMC exists or
just the CPU is capable of handling it? I guess -kernel only is a weird
case because otherwise if EL3 is available some sort of firmware has to
have gotten the CPU into a state a kernel can boot. It doesn't imply
that firmware knows how to do a PSCI call though - surely there is some
firmware configuration/probing mechanism you need to rely on for that?

--=20
Alex Benn=C3=A9e
