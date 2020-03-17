Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id f12sm4070716wmh.4.2020.03.17.06.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 06:57:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 03B041FF7E;
	Tue, 17 Mar 2020 13:57:25 +0000 (GMT)
References: <20200316172155.971-1-alex.bennee@linaro.org>
 <20200316172155.971-25-alex.bennee@linaro.org>
 <3d01f357-eeb6-7fd7-1895-feae05beca99@redhat.com>
 <CAHiYmc5CtAH-zs38YmyLkrrp2DnxzLUWNKBTcL+oyFNEiCsV8A@mail.gmail.com>
 <CAFEAcA8FSwVeOVDWT8qRO_EL2OncxdgGZbNHH8VhaaoKuwS7_w@mail.gmail.com>
User-agent: mu4e 1.3.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, QEMU Developers
 <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH v1 24/28] tests/tcg/aarch64: add SVE iotcl test
In-reply-to: <CAFEAcA8FSwVeOVDWT8qRO_EL2OncxdgGZbNHH8VhaaoKuwS7_w@mail.gmail.com>
Date: Tue, 17 Mar 2020 13:57:24 +0000
Message-ID: <87imj3jd8b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: G/sP+1zPnWWQ


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 17 Mar 2020 at 10:45, Aleksandar Markovic
> <aleksandar.qemu.devel@gmail.com> wrote:
>> I think it is also a little problematic that tests like this reside
>> and belong in tests/tcg - since they deal more with elements
>> of kernel interface (system call prctl()), rather than TCG.
>> Still, I see there are many other similar cases in tests/tcg,
>> so probably (at this moment) one should't bother about it in
>> the context of this patch. However, in general, the location
>> /tests/tcg for all these cases seems wrong to me.
>
> Well, the only reason we have the test at all is for testing
> our TCG emulation. Generic tests of syscalls don't live
> in QEMU at all, the best place for those would be the
> Linux Test Project's test suite.

Yeah it's all for exercising the TCG. I have run tests/tcg/aaarch64
binaries on real hardware from time to time but it's not the focus of
anything in that directory.

--=20
Alex Benn=C3=A9e
