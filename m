Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g12sm22862851edv.89.2022.02.03.09.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 09:51:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 33F241FFB7;
	Thu,  3 Feb 2022 17:51:03 +0000 (GMT)
References: <20220202191242.652607-1-alex.bennee@linaro.org>
 <87k0ecvoxu.fsf@linaro.org>
 <SN4PR0201MB8808B91BF0F27E376C1872AEDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <SN4PR0201MB88089C0A52C660DC7A6D71E6DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "fam@euphon.net" <fam@euphon.net>,
 "berrange@redhat.com" <berrange@redhat.com>, "f4bug@amsat.org"
 <f4bug@amsat.org>, "aurelien@aurel32.net" <aurelien@aurel32.net>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "stefanha@redhat.com"
 <stefanha@redhat.com>, "crosa@redhat.com" <crosa@redhat.com>
Subject: Re: [RFC PATCH  0/4] improve coverage of vector backend
Date: Thu, 03 Feb 2022 17:50:12 +0000
In-reply-to: <SN4PR0201MB88089C0A52C660DC7A6D71E6DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
Message-ID: <87pmo3sut4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: f3QV7+exVXb0


Taylor Simpson <tsimpson@quicinc.com> writes:

>> -----Original Message-----
>> From: Taylor Simpson
>> Sent: Wednesday, February 2, 2022 7:45 PM
>> To: Alex Benn=C3=A9e <alex.bennee@linaro.org>; richard.henderson@linaro.=
org;
>> qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org; fam@euphon.net; berrange@redhat.com;
>> f4bug@amsat.org; aurelien@aurel32.net; pbonzini@redhat.com;
>> stefanha@redhat.com; crosa@redhat.com
>> Subject: RE: [RFC PATCH 0/4] improve coverage of vector backend
>>=20
>>=20
>> > -----Original Message-----
>> > From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> > Sent: Wednesday, February 2, 2022 5:16 PM
>> > To: richard.henderson@linaro.org; qemu-devel@nongnu.org
>> > Cc: qemu-arm@nongnu.org; fam@euphon.net; berrange@redhat.com;
>> > f4bug@amsat.org; aurelien@aurel32.net; pbonzini@redhat.com;
>> > stefanha@redhat.com; crosa@redhat.com; Alex Benn=C3=A9e
>> > <alex.bennee@linaro.org>; Taylor Simpson <tsimpson@quicinc.com>
>> > Subject: Re: [RFC PATCH 0/4] improve coverage of vector backend
>> >
>> > Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>> >
>> > > Hi Richard,
>> > >
>> > > While reviewing the TCG vector clean-ups I tried to improve the
>> > > range of instructions we tested. I couldn't get the existing hacky
>> > > sha1 test to vectorise nicely so I snarfed the sha512 algorithm from
>> > > CCAN. The sha512 test is good because it is all purely integer so we
>> > > should be able to use native code on the backend. The test also has
>> > > the nice property of validating behaviour.
>> >
>> > Hi Taylor,
>> >
>> > You might want to check this out:
>> >
>> > =E2=9C=97  ./qemu-hexagon ./tests/tcg/hexagon-linux-user/sha512
>> > 1..10
>> > not ok 1 - do_test(&tests[i])
>> > #     Failed test
>> > (/home/alex.bennee/lsrc/qemu.git/tests/tcg/multiarch/sha512.c:main()
>> > at line 986) not ok 2 - do_test(&tests[i])
>>=20
>> Thanks for the heads-up.  I'll take a look
>
> Quick update - I ran the test on the hardware and have the same error mes=
sages.
>
> So, it doesn't look like a QEMU problem.  I'll investigate if the
> problem is due to something in the toolchain.

That reminds me what is the status of the binary toolchain. The last
attempt had some issues so we are still using the hand-built one
upstream.


>
> Taylor


--=20
Alex Benn=C3=A9e
