Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l5sm3080420wml.27.2020.05.27.09.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 09:14:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 430821FF7E;
	Wed, 27 May 2020 17:14:43 +0100 (BST)
References: <20200527100546.29297-1-alex.bennee@linaro.org>
 <20200527100546.29297-3-alex.bennee@linaro.org>
 <CAHiYmc7EJVxKXZ4G96cL-Bm3tT8UR_dgr7y3oisUMnuJ0u3zaw@mail.gmail.com>
 <CAHiYmc7TYHMcitiG9ELxfz-EC8DSG1b7FeFsxXxTbu-7FSih=Q@mail.gmail.com>
User-agent: mu4e 1.5.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Bug 1880225 <1880225@bugs.launchpad.net>, Riku
 Voipio <riku.voipio@iki.fi>, Richard Henderson
 <richard.henderson@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v1 2/3] linux-user: deal with address wrap for
 ARM_COMMPAGE on 32 bit
In-reply-to: <CAHiYmc7TYHMcitiG9ELxfz-EC8DSG1b7FeFsxXxTbu-7FSih=Q@mail.gmail.com>
Date: Wed, 27 May 2020 17:14:43 +0100
Message-ID: <87pnap5p8s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: XFfPjCijaQj6


Aleksandar Markovic <aleksandar.qemu.devel@gmail.com> writes:

> =D1=81=D1=80=D0=B5, 27. =D0=BC=D0=B0=D1=98 2020. =D1=83 14:05 Aleksandar =
Markovic
> <aleksandar.qemu.devel@gmail.com> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=
=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>>
>> =D1=81=D1=80=D0=B5, 27. =D0=BC=D0=B0=D1=98 2020. =D1=83 12:07 Alex Benn=
=C3=A9e <alex.bennee@linaro.org> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=
=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>> >
>> > We rely on the pointer to wrap when accessing the high address of the
>> > COMMPAGE so it lands somewhere reasonable. However on 32 bit hosts we
>> > cannot afford just to map the entire 4gb address range. The old mmap
>> > trial and error code handled this by just checking we could map both
>> > the guest_base and the computed COMMPAGE address.
>> >
>> > We can't just manipulate loadaddr to get what we want so we introduce
>> > an offset which pgb_find_hole can apply when looking for a gap for
>> > guest_base that ensures there is space left to map the COMMPAGE
>> > afterwards.
>> >
>> > This is arguably a little inefficient for the one 32 bit
>> > value (kuser_helper_version) we need to keep there given all the
>> > actual code entries are picked up during the translation phase.
>> >
>> > Fixes: ee94743034b
>> > Bug: https://bugs.launchpad.net/qemu/+bug/1880225
>>
>> For the scenario in this bug report, for today's master, before and after
>> applying this patch:
>>
>
> I am not sure how significant is this info, but I executed the test
> without applying patch 1/3, so only 2/3 was applied in the case
> "AFTER".

That is expected. The other fix only affects binaries run inside a
/proc-less chroot and the final patch is a test case for COMMPAGE
support.

--=20
Alex Benn=C3=A9e
