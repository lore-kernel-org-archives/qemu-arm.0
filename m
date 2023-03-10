Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id x6-20020adff646000000b002c5694aef92sm436473wrp.21.2023.03.10.10.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 10:20:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 20B8C1FFB7;
	Fri, 10 Mar 2023 18:20:07 +0000 (GMT)
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-10-alex.bennee@linaro.org>
 <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
 <87wn3ocwqz.fsf@suse.de>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Fabiano Rosas <farosas@suse.de>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, David
 Hildenbrand <david@redhat.com>, Wainer dos  Santos Moschetta
 <wainersm@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Peter Xu <peterx@redhat.com>, Philippe =?utf-8?Q?Mat?=
 =?utf-8?Q?hieu-Daud=C3=A9?=
 <philmd@linaro.org>, Cleber  Rosa <crosa@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, gdb <gdb@gnu.org>, Thiago Jung Bauermann
 <thiago.bauermann@linaro.org>, Omair Javaid <omair.javaid@linaro.org>
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
Date: Fri, 10 Mar 2023 18:14:12 +0000
In-reply-to: <87wn3ocwqz.fsf@suse.de>
Message-ID: <87sfeclb8o.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: STvsUkN7FaAX


(adding some more gdb types to CC)

Fabiano Rosas <farosas@suse.de> writes:

> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> On Fri, 10 Mar 2023 at 10:31, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>>
>>> You need a very new gdb to be able to run with pauth support otherwise
>>> your likely to hit asserts and aborts. Disable pauth for now until we
>>> can properly probe support in gdb.
>>>
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>
>> If it makes gdb fall over, then shouldn't we be disabling
>> the pauth gdbstub stuff entirely ? Otherwise even if our
>> tests are fine our users will not be...
>>
>
> Have you seem my message on IRC about changing the feature name in the
> XML? I think the issue is that we're putting the .xml in a "namespace"
> where GDB expects to only find stuff which it has code to
> support. Changing from "org.gnu.gdb.aarch64.pauth" to
> "org.qemu.aarch64.pauth" made it stop crashing and I can read the
> registers just fine.

That would work, although I would prefer to probe support so we can use
the official namespace. We went through something similar with SVE
until:

  797920b952 (target/arm: use official org.gnu.gdb.aarch64.sve layout for r=
egisters)

which required:

  b1863ccc95 (configure: gate our use of GDB to 8.3.1 or above)

Since then we've introduced:

 ./scripts/probe-gdb-support.py

which given the runes to check for pauth support in gdb could expose a
symbol and we get the best of both worlds. Of course if this keeps
happening we could throw up our hands and just use custom XML for all
the extra register sets.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
