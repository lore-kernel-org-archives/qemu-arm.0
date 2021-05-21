Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id r5sm2084211wrw.96.2021.05.21.06.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 06:06:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5D1941FF7E;
	Fri, 21 May 2021 14:06:08 +0100 (BST)
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
 <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
 <82f5ed3f-3047-bfa3-c7b2-d91300f393f8@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Willian Rampazzo <wrampazz@redhat.com>, Philippe =?utf-8?Q?Mathieu-Dau?=
 =?utf-8?Q?d=C3=A9?=
 <philmd@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Niek Linnenbank
 <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>, Michael Rolnik
 <mrolnik@gmail.com>, Cleber Rosa <crosa@redhat.com>
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
Date: Fri, 21 May 2021 14:05:35 +0100
In-reply-to: <82f5ed3f-3047-bfa3-c7b2-d91300f393f8@redhat.com>
Message-ID: <87pmxkb5j3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ws/YlK2y3QhA


Thomas Huth <thuth@redhat.com> writes:

> On 21/05/2021 14.28, Willian Rampazzo wrote:
>> On Fri, May 21, 2021 at 4:16 AM Thomas Huth <thuth@redhat.com> wrote:
> [...]
>>> Alternatively, what about renaming the "acceptance" tests to "validatio=
n"
>>> instead? That word does not have a duplicated definition in the context=
 of
>>> QEMU yet, so I think it would be less confusing.
>> While at the beginning of your reply, I started thinking if
>> "validation" would cause less confusion for the QEMU project. Although
>> validation testing is a broader concept inside the Verification &
>> Validation process, encompassing unit testing, functional testing,
>> integration testing, system testing, and acceptance testing, it may be
>> an option for the QEMU project.
>> While system testing would be the correct terminology to use, if it
>> causes more confusion, using a less strict terminology, like
>> validation testing, is valid, in my opinion.
>
> <semi-homorous-friday-bikeshedding>
> Or we could come up with a new, artificial name instead (like
> "qtests"). It certainly need a "q" in the name. For example what
> about:
>
> - avoqado
> - valiqation
> - aqueptance
> - inteqration

make check-quixotic?

>
> ?
> </semi-homorous-friday-bikeshedding>
>
>  Thomas


--=20
Alex Benn=C3=A9e
