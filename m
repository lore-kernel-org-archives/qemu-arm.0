Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id p62sm226289wmp.10.2021.12.01.08.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 08:16:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9FCAD1FF96;
	Wed,  1 Dec 2021 16:16:08 +0000 (GMT)
References: <CA+4MfEJhOsmUWmifkzJ7jSw8B0q7X2mJe=jist4AiTwhYd8Wug@mail.gmail.com>
 <87fsrtv13t.fsf@linaro.org>
 <CA+4MfE+gT-CGEVZot=26DqwCRY+F-xZhTRSOsKKBVb29Un46Dw@mail.gmail.com>
 <CA+4MfEKrrsACvQKBimpkQt6r0H2cbJ9EaYCSFgZcx1Bqr20=Sg@mail.gmail.com>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Idan Horowitz <idan.horowitz@gmail.com>
Cc: qemu-arm@nongnu.org
Subject: Re: DSB does not seem to wait for TLBI completion
Date: Wed, 01 Dec 2021 16:13:38 +0000
In-reply-to: <CA+4MfEKrrsACvQKBimpkQt6r0H2cbJ9EaYCSFgZcx1Bqr20=Sg@mail.gmail.com>
Message-ID: <87sfvcxpvb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /bjwi4kfBhoH


Idan Horowitz <idan.horowitz@gmail.com> writes:

> Idan Horowitz <idan.horowitz@gmail.com> wrote:
>>
>> I am actually running in icount mode (-icount shift=3D10 specifically),
>> and adding the translation block exit or just using ISB directly does
>> not seem to affect it unfortunately.
>>
>> Idan Horowitz
>
> After a lot of testing I had the thought of trying this without
> icount, and it seems to work fine without it, so the issue is somehow
> related to icount being enabled.

That's is weird because icount basically ensures round robin scheduling
of each vCPU in turn. I wonder if there is a pending flush when the vCPU
switches?

We really need a reliable reproducer for this to investigate further.

>
> Idan Horowitz


--=20
Alex Benn=C3=A9e
