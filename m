Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c5sm17052762ejz.88.2022.02.03.10.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 10:28:33 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 64A8B1FFB7;
	Thu,  3 Feb 2022 18:28:33 +0000 (GMT)
References: <20220202191242.652607-1-alex.bennee@linaro.org>
 <87k0ecvoxu.fsf@linaro.org>
 <SN4PR0201MB8808B91BF0F27E376C1872AEDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <SN4PR0201MB88089C0A52C660DC7A6D71E6DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <87pmo3sut4.fsf@linaro.org>
 <SN4PR0201MB8808A6436C987408C04CED6BDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
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
Date: Thu, 03 Feb 2022 18:26:08 +0000
In-reply-to: <SN4PR0201MB8808A6436C987408C04CED6BDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
Message-ID: <87leyrst2m.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 54Q9HO49qb2S


Taylor Simpson <tsimpson@quicinc.com> writes:

>> -----Original Message-----
>> From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Sent: Thursday, February 3, 2022 11:50 AM
>> To: Taylor Simpson <tsimpson@quicinc.com>
>> Cc: richard.henderson@linaro.org; qemu-devel@nongnu.org; qemu-
>> arm@nongnu.org; fam@euphon.net; berrange@redhat.com;
>> f4bug@amsat.org; aurelien@aurel32.net; pbonzini@redhat.com;
>> stefanha@redhat.com; crosa@redhat.com
>> Subject: Re: [RFC PATCH 0/4] improve coverage of vector backend
>>=20
>> Taylor Simpson <tsimpson@quicinc.com> writes:
>>=20
>> > Quick update - I ran the test on the hardware and have the same error
>> messages.
>> >
>> > So, it doesn't look like a QEMU problem.  I'll investigate if the
>> > problem is due to something in the toolchain.
>>=20
>> That reminds me what is the status of the binary toolchain. The last att=
empt
>> had some issues so we are still using the hand-built one upstream.
>
> No progress on that.  The team hasn't had the bandwidth to work on it.
>
> However, I'm less suspicious of the toolchain now. I built with a
> couple of different compiler options and a couple of different
> versions of the toolchain, including the C library that runs in
> production. In all cases, I see the same result.
>
> Any chance the problem is in the test itself (e.g., some sort of
> undefined behavior or a 64-bit vs 32-bit difference)?

It does have a 64 bit byteswap in - it's possible I broke it copying
from the upstream:

  https://ccodearchive.net/info/crypto/sha512.html

but it does pass on *all* the other architectures which is a mix of 32
and 64 bit code. I did have to hack the endian detection code though.
Does:

  #if BYTE_ORDER =3D=3D BIG_ENDIAN

work for your compiler?


>
> Thanks,
> Taylor


--=20
Alex Benn=C3=A9e
