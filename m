Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id e50sm1710867wre.49.2018.03.09.08.59.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Mar 2018 08:59:24 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 718763E00DB;
	Fri,  9 Mar 2018 16:59:24 +0000 (GMT)
References: <20180308130626.12393-1-peter.maydell@linaro.org> <87zi3hjqzw.fsf@linaro.org> <CAFEAcA_Px3_dnoE3cgCPwRpv-9JzoHnGceDE66BvreHi1kxbbw@mail.gmail.com>
User-agent: mu4e 1.1.0; emacs 26.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "patches\@linaro.org" <patches@linaro.org>, Igor Mammedov
 <imammedo@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>
Subject: Re: [PATCH v3 0/6] arm: support -cpu max (and gic-version=max)
In-reply-to: <CAFEAcA_Px3_dnoE3cgCPwRpv-9JzoHnGceDE66BvreHi1kxbbw@mail.gmail.com>
Date: Fri, 09 Mar 2018 16:59:24 +0000
Message-ID: <87vae5jic3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 9oOECv26DuAf


Peter Maydell <peter.maydell@linaro.org> writes:

> On 9 March 2018 at 13:52, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>>> This patchset adds support for '-cpu max' to Arm, along the lines
>>> of the existing support we have for x86 targets:
>>>
>>>  * under KVM, -cpu max is the same as -cpu host
>>>  * under TCG, -cpu max means "emulate with as many features as
>>>    possible"
>> <snip>
>>
>> It all looks good to me. The only minor problem I ran into was setting
>> -M virt,gic-version=3Dmax silently hangs with the stock QEMU_EFI.fd on my
>> version of Ubuntu. It would be nice if there was better feedback we
>> could give to the user in this case.
>
> Presumably that also fails if you ask for gic-version=3D3 ?

Yes.

>
>> It works with the latest snapshot from:
>>
>>   http://snapshots.linaro.org/reference-platform/enterprise/firmware/15/=
release/qemu-aarch64/
>
> Sounds like "earlier firmware versions didn't have gicv3 support,
> later ones do" ?

According to the dpkg changelog it should have:

  Adds GICv3 support.  Closes: #810495

However it seems like it wasn't complete support.

--
Alex Benn=C3=A9e
