Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u21sm3027148wmu.27.2019.11.06.04.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 04:06:02 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B64D91FF87;
	Wed,  6 Nov 2019 12:06:01 +0000 (GMT)
References: <CAA8B=UR4KOcSeYv2sKsf8mbbvjuZ_Eqiupk=H0JW6+SQ4uE=mA@mail.gmail.com>
 <CAFEAcA8=yvd_OadDZaa3Um2K4RTrrJ34ZdTXokEDfYk08F1Wqg@mail.gmail.com>
 <CAA8B=UTMXMOKsMjDQ3oCP1J8QdL+UXLM3Paf81w=E5sV=RDg=Q@mail.gmail.com>
 <CAFEAcA9w5be6HO+ghPHrJsy4KxhBZ1MNLdPOQ4kE4nHqFKneUg@mail.gmail.com>
 <CAA8B=URoKnQTZdQar_D-xrid-JoaF_mz-EYr0SasprPpvXznoQ@mail.gmail.com>
 <CAFEAcA9WYCmD+oGHtM=g8pxyCmYt=12NchojdtgPufQUwWFRpg@mail.gmail.com>
 <CAA8B=UTcsW7R6hskd312cH5=M6hqfWXrVKLW+WkVXvn5KsLoOg@mail.gmail.com>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Aarch64-qemu
In-reply-to: <CAA8B=UTcsW7R6hskd312cH5=M6hqfWXrVKLW+WkVXvn5KsLoOg@mail.gmail.com>
Date: Wed, 06 Nov 2019 12:06:01 +0000
Message-ID: <87r22li506.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 69NKKDo796Y8


Wissem Yahiaoui <wissem.yahiaouii@gmail.com> writes:

> Hi Qemu team,
>
> As I sent you in the first email, that the SVE specific registers in
> aarch64-qemu results an core dumped/segmentation fault. I Tried the
> ZCR_EL1, ZCR_EL2 and ZCR_EL12, it compiles fine with the gnu toolchain, b=
ut
> it doesn't run in qemu. I need to simulate the length check at run-time, I
> am using Qemu but apparently I am missing some step/s.

Peter's already responded - you can't access ZCR_EL1 from userspace. You
need to use the ioctl to query the kernel for the vector length.

>
> Can u please help me to achieve this task?
>
> Regards,
> Wissem Yahiaoui
> Student at Technical University,
>
>
>
>
> On Wed, 6 Nov 2019 at 10:59, Peter Maydell <peter.maydell@linaro.org> wro=
te:
>
>> On Tue, 5 Nov 2019 at 21:39, Wissem Yahiaoui <wissem.yahiaouii@gmail.com>
>> wrote:
>> >
>> > Sure, I will do that. Actually it was my intention but i didn't find t=
he
>> link and it idn't possible to raise an issue in github. Can u please
>> provide me a link?
>>
>> I'm confused, this is email, there are no links. Just
>> use reply-to-all rather than reply so your replies go
>> to both the person whose email you're replying to
>> and also to the mailing list. (You'll have to go back
>> and redo a reply to my original email which went to
>> both the list and to you.)
>>
>> thanks
>> - PMM
>>


--
Alex Benn=C3=A9e
