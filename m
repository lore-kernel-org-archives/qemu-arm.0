Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id fa10-20020a05600c518a00b00405442edc69sm9342448wmb.14.2023.12.01.07.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 07:16:17 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id AC9BF5FB5F;
	Fri,  1 Dec 2023 15:16:16 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
  qemu-devel@nongnu.org,  Eric Farman <farman@linux.ibm.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Leif Lindholm
 <quic_llindhol@quicinc.com>,  Beraldo Leal <bleal@redhat.com>,  Andrew
 Jeffery <andrew@codeconstruct.com.au>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>,  Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>,  Thomas Huth <thuth@redhat.com>,
  qemu-arm@nongnu.org,  Radoslaw Biernacki <rad@semihalf.com>,  Yoshinori
 Sato <ysato@users.sourceforge.jp>,  Eric Auger <eric.auger@redhat.com>,
  Halil Pasic <pasic@linux.ibm.com>,  qemu-s390x@nongnu.org,  Wainer dos
 Santos Moschetta <wainersm@redhat.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,
  Christian Borntraeger <borntraeger@linux.ibm.com>,  Aurelien Jarno
 <aurelien@aurel32.net>,  Cleber Rosa <crosa@redhat.com>,  Joel Stanley
 <joel@jms.id.au>
Subject: Re: [PATCH v2 4/7] tests/avocado: drop malta yamon tests
In-Reply-To: <f8738d36-2527-4620-9532-fca530ef8f0d@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 1 Dec 2023 15:05:02
 +0100")
References: <20231201093633.2551497-1-alex.bennee@linaro.org>
	<20231201093633.2551497-5-alex.bennee@linaro.org>
	<45077c53-ed18-4821-bfbe-6dba3ca994d4@linaro.org>
	<87ttp25bqh.fsf@draig.linaro.org>
	<f8738d36-2527-4620-9532-fca530ef8f0d@linaro.org>
User-Agent: mu4e 1.11.25; emacs 29.1
Date: Fri, 01 Dec 2023 15:16:16 +0000
Message-ID: <87il5i54xr.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: x8XphmyHOEgd

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 1/12/23 13:49, Alex Benn=C3=A9e wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>>=20
>>> Hi Alex,
>>>
>>> On 1/12/23 10:36, Alex Benn=C3=A9e wrote:
>>>> The assets are no longer available on the website so these are
>>>> blocking CI.
>>>>
>>>
>>> How are these "blocking CI"? Missing artifact wasn't be fatal,
>>> is it now? Also, did the artifact cache got flushed? These tests
>>> pass locally, I disagree with removing them.
>>>
>>> I can send a patch using YAMON_PATH like we have with RESCUE_YL_PATH,
>>> but I still consider missing artifact shouldn't be an issue. We are
>>> missing the point of the Avocado cache and the possibility to manually
>>> add artifacts.
>> Sure but in this case the binaries are gone, you can't share them
>> and no
>
> Per https://mips.com/develop/tools/boot-loaders/:
> "To support existing users of these, and the QEMU project, YAMON is
> now available under the GPL License."

Maybe we should build it like the other ROMs?

Anyway I've dropped this commit from the PR so I'll leave it to you to
fix up however you want.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
