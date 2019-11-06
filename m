Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z13sm26455626wrm.64.2019.11.06.06.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 06:16:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CD5491FF87;
	Wed,  6 Nov 2019 14:16:25 +0000 (GMT)
References: <CAA8B=UR4KOcSeYv2sKsf8mbbvjuZ_Eqiupk=H0JW6+SQ4uE=mA@mail.gmail.com>
 <CAFEAcA8=yvd_OadDZaa3Um2K4RTrrJ34ZdTXokEDfYk08F1Wqg@mail.gmail.com>
 <CAA8B=UTMXMOKsMjDQ3oCP1J8QdL+UXLM3Paf81w=E5sV=RDg=Q@mail.gmail.com>
 <CAFEAcA9w5be6HO+ghPHrJsy4KxhBZ1MNLdPOQ4kE4nHqFKneUg@mail.gmail.com>
 <CAA8B=URoKnQTZdQar_D-xrid-JoaF_mz-EYr0SasprPpvXznoQ@mail.gmail.com>
 <CAFEAcA9WYCmD+oGHtM=g8pxyCmYt=12NchojdtgPufQUwWFRpg@mail.gmail.com>
 <CAA8B=UTcsW7R6hskd312cH5=M6hqfWXrVKLW+WkVXvn5KsLoOg@mail.gmail.com>
 <CAFEAcA-jOxu1eZ1b47F5NtOouX0dPPWhb7zGLg25+SqM4wkjxQ@mail.gmail.com>
 <CAA8B=UQN_cYkij5eYwhbefF0om08R+BO2Zvj0bT3Kex_Sx79ww@mail.gmail.com>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Aarch64-qemu
In-reply-to: <CAA8B=UQN_cYkij5eYwhbefF0om08R+BO2Zvj0bT3Kex_Sx79ww@mail.gmail.com>
Date: Wed, 06 Nov 2019 14:16:25 +0000
Message-ID: <87o8xphyyu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 3ga5D24TtUn3


Wissem Yahiaoui <wissem.yahiaouii@gmail.com> writes:

> Hi Peter & Qemu Team,
>
>
> Actually, I also tried it after you send me the documentation. but it will
> be also an segmentation fault. Here, it a screenshot on how I did use
> it.

Please just use inline text. Screenshots for text output or test cases
is just a pain to copy/transcribe.

>
>
> Thanks,
>
> On Wed, 6 Nov 2019 at 12:55, Peter Maydell <peter.maydell@linaro.org> wro=
te:
>
>> On Wed, 6 Nov 2019 at 11:44, Wissem Yahiaoui <wissem.yahiaouii@gmail.com>
>> wrote:
>> >
>> > Hi Qemu team,
>> >
>> > As I sent you in the first email, that the SVE specific registers in
>> aarch64-qemu results an core dumped/segmentation fault. I Tried the
>> ZCR_EL1, ZCR_EL2 and ZCR_EL12, it compiles fine with the gnu toolchain, =
but
>> it doesn't run in qemu. I need to simulate the length check at run-time,=
 I
>> am using Qemu but apparently I am missing some step/s.
>>
>> You need to use the prctl() that I suggested, you cannot directly
>> access any of those registers from userspace. If you have a
>> simple test program which tries to use the prctl() but does not
>> work then I can have a look at what is going wrong.
>>
>> thanks
>> -- PMM
>>


--
Alex Benn=C3=A9e
