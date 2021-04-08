Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z15sm15222725wrw.38.2021.04.08.03.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 03:18:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 748681FF7E;
	Thu,  8 Apr 2021 11:18:37 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-4-richard.henderson@linaro.org>
 <877dleuds3.fsf@linaro.org>
 <CAFEAcA9Vc=w9d-3DkwuyY8Vzrj4d=f2zHn4OXauQRc-Vr=oQzQ@mail.gmail.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 1921948@bugs.launchpad.net, qemu-arm <qemu-arm@nongnu.org>, QEMU
 Developers <qemu-devel@nongnu.org>
Subject: Re: [PATCH v4 03/12] target/arm: Fix mte_checkN
Date: Thu, 08 Apr 2021 11:02:57 +0100
In-reply-to: <CAFEAcA9Vc=w9d-3DkwuyY8Vzrj4d=f2zHn4OXauQRc-Vr=oQzQ@mail.gmail.com>
Message-ID: <87k0pdt6yq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: AjP4zbtnqNtz


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 7 Apr 2021 at 19:54, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>>
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>
>> > We were incorrectly assuming that only the first byte of an MTE access
>> > is checked against the tags.  But per the ARM, unaligned accesses are
>> > pre-decomposed into single-byte accesses.  So by the time we reach the
>> > actual MTE check in the ARM pseudocode, all accesses are aligned.
>> >
>> > Therefore, the first failure is always either the first byte of the
>> > access, or the first byte of the granule.
>> >
>> > In addition, some of the arithmetic is off for last-first -> count.
>> > This does not become directly visible until a later patch that passes
>> > single bytes into this function, so ptr =3D=3D ptr_last.
>> >
>> > Buglink: https://bugs.launchpad.net/bugs/1921948
>>
>> Minor note: you can Cc: Bug 1921948 <1921948@bugs.launchpad.net> to
>> automatically copy patches to the appropriate bugs which is useful if
>> you don't have the Cc for the reporter.
>
> I'm not sure cc'ing bugs on patches is very useful, though (and especially
> not for big series). I usually prefer to just add a note to the bug with
> the URL of the series in patchew afterwards.

Ideally the tooling would pick up bug links in Patchew and automatically
update the relevant bugs when new series are posted. I only mentioned it
because the original bug reporters weren't Cc'ed on the patches and lo
now they know about the iteration they have tested it ;-)

--=20
Alex Benn=C3=A9e
