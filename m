Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id az16sm7959496wmb.15.2022.02.03.12.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 12:01:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A50D51FFB7;
	Thu,  3 Feb 2022 20:01:52 +0000 (GMT)
References: <20220202191242.652607-1-alex.bennee@linaro.org>
 <87k0ecvoxu.fsf@linaro.org>
 <SN4PR0201MB8808B91BF0F27E376C1872AEDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <SN4PR0201MB88089C0A52C660DC7A6D71E6DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <87pmo3sut4.fsf@linaro.org>
 <SN4PR0201MB8808A6436C987408C04CED6BDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <87leyrst2m.fsf@linaro.org>
 <SN4PR0201MB8808C67FF92D6656EB9DD5B0DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
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
Date: Thu, 03 Feb 2022 20:00:27 +0000
In-reply-to: <SN4PR0201MB8808C67FF92D6656EB9DD5B0DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
Message-ID: <87h79fsor3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: QO/leQLzLD5I


Taylor Simpson <tsimpson@quicinc.com> writes:

>> -----Original Message-----
>> From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Sent: Thursday, February 3, 2022 12:26 PM
>> To: Taylor Simpson <tsimpson@quicinc.com>
>> Cc: richard.henderson@linaro.org; qemu-devel@nongnu.org; qemu-
>> arm@nongnu.org; fam@euphon.net; berrange@redhat.com;
>> f4bug@amsat.org; aurelien@aurel32.net; pbonzini@redhat.com;
>> stefanha@redhat.com; crosa@redhat.com
>> Subject: Re: [RFC PATCH 0/4] improve coverage of vector backend
>>=20
>> > Any chance the problem is in the test itself (e.g., some sort of
>> > undefined behavior or a 64-bit vs 32-bit difference)?
>>=20
>> It does have a 64 bit byteswap in - it's possible I broke it copying fro=
m the
>> upstream:
>>=20
>>   https://ccodearchive.net/info/crypto/sha512.html
>>=20
>> but it does pass on *all* the other architectures which is a mix of 32 a=
nd 64
>> bit code. I did have to hack the endian detection code though.
>> Does:
>>=20
>>   #if BYTE_ORDER =3D=3D BIG_ENDIAN
>>=20
>> work for your compiler?
>
> No, but this does
> #if __BYTE_ORDER__ =3D=3D __ORDER_BIG_ENDIAN__
>
> With that change in the source, the tests passes.  Will that work for
> other targets?

At least not hppa-linux-user. The joy of having no standard compile time
way to report byte order in the C standard despite most things needing
to know one way or another.

Richard,

Any ideas?

>
> Taylor


--=20
Alex Benn=C3=A9e
