Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd594707sm143333805e9.33.2025.05.19.06.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 06:43:50 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A51D75F87C;
	Mon, 19 May 2025 14:43:49 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
  qemu-devel@nongnu.org,
  thuth@redhat.com,  berrange@redhat.com,  eric.auger@redhat.com,
  peter.maydell@linaro.org,  qemu-arm@nongnu.org
Subject: Re: [PATCH v4] tests/functional: Add PCI hotplug test for aarch64
In-Reply-To: <85f13ff0-80c5-4a62-8b33-ff35911866a5@linaro.org> (Gustavo
	Romero's message of "Sun, 18 May 2025 10:26:21 +0100")
References: <20250512144629.182340-1-gustavo.romero@linaro.org>
	<002caade-699e-4128-ac08-7797b83b3cc8@linaro.org>
	<85f13ff0-80c5-4a62-8b33-ff35911866a5@linaro.org>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Mon, 19 May 2025 14:43:49 +0100
Message-ID: <878qmssokq.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: wMHf9qnBa8gF

Gustavo Romero <gustavo.romero@linaro.org> writes:

> Hi Phil,
>
> On 5/16/25 15:47, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 12/5/25 16:45, Gustavo Romero wrote:
>>> Add a functional test, aarch64_hotplug_pci, to exercise PCI hotplug and
>>> hot-unplug on arm64.
>>>
>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>>> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>>> ---
>>> =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 5 ++
>>> =C2=A0 tests/functional/meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>> =C2=A0 tests/functional/test_aarch64_hotplug_pci.py | 74 ++++++++++++++=
++++++
>>> =C2=A0 3 files changed, 80 insertions(+)
>>> =C2=A0 create mode 100755 tests/functional/test_aarch64_hotplug_pci.py
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 23174b4ca7..9ebb768214 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -2065,6 +2065,11 @@ S: Supported
>>> =C2=A0 F: include/hw/pci/pcie_doe.h
>>> =C2=A0 F: hw/pci/pcie_doe.c
>>> +ARM PCI Hotplug
>>> +M: Gustavo Romero <gustavo.romero@linaro.org>
>> As mentioned in v2, since this might interest ARM contributors:
>>  =C2=A0=C2=A0 L: qemu-arm@nongnu.org
>
> I thought you're saying "include qemu-arm@nongnu.org" when sending the
> patch, not "add the email into a L: section in the MAINTAINERS".
>
> The test is now queued in Alex's branch. What's best: send a patch
> now; or wait for it to land in the master branch and then send the
> patch?

I've fixed it up.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
