Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l10sm4575125wrh.20.2019.09.26.08.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 08:31:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 400B91FF87;
	Thu, 26 Sep 2019 16:31:54 +0100 (BST)
References: <20190925233013.6449-1-alex.bennee@linaro.org>
 <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, "open list\:RISC-V"
 <qemu-riscv@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-discuss <qemu-discuss@nongnu.org>, qemu-s390x
 <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc@nongnnu.org
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
In-reply-to: <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
Date: Thu, 26 Sep 2019 16:31:54 +0100
Message-ID: <87blv79iqd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ZmySwzqUE4gm


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 26 Sep 2019 at 00:31, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> The 32 bit hosts are already a second class citizen especially with
>> support for running 64 bit guests under TCG. We are also limited by
>> testing as actual working 32 bit machines are getting quite rare in
>> developers personal menageries. For TCG supporting newer types like
>> Int128 is a lot harder with 32 bit calling conventions compared to
>> their larger bit sized cousins. Fundamentally address space is the
>> most useful thing for the translator to have even for a 32 bit guest a
>> 32 bit host is quite constrained.
>>
>> As far as I'm aware 32 bit KVM users are even less numerous. Even
>> ILP32 doesn't make much sense given the address space QEMU needs to
>> manage.
>
> For KVM we should wait until the kernel chooses to drop support,
> I think.

I can certainly do that - although I'd still like to know who actually
uses 32 bit kvm support these days.

>
>> @@ -745,19 +744,22 @@ case "$cpu" in
>>    ;;
>>    armv*b|armv*l|arm)
>>      cpu=3D"arm"
>> -    supported_cpu=3D"yes"
>>    ;;
>
> I'll leave others to voice opinions about their architectures,
> but I still have 32-bit arm in my test set for builds, and
> I'm pretty sure we have users (raspi users, for a start).

raspi is probably the most common one because of the 32 bit userspace
they use even though they are running on 64 bit chips.

>
>
> thanks
> -- PMM


--
Alex Benn=C3=A9e
