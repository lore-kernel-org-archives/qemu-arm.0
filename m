Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097db0a6esm6204395a12.27.2024.12.03.07.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 07:30:24 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 26A745F89C;
	Tue,  3 Dec 2024 15:30:23 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>,  qemu-devel@nongnu.org,  =?utf-8?Q?C?=
 =?utf-8?Q?=C3=A9dric?= Le Goater
 <clg@kaod.org>,  Troy Lee <leetroy@gmail.com>,  Alistair Francis
 <alistair@alistair23.me>,  Andrew Jeffery <andrew@codeconstruct.com.au>,
  Jamin Lin <jamin_lin@aspeedtech.com>,  qemu-arm@nongnu.org,  Paolo
 Bonzini <pbonzini@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Steven Lee <steven_lee@aspeedtech.com>,
  Niek Linnenbank <nieklinnenbank@gmail.com>,  Joel Stanley
 <joel@jms.id.au>,  "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v2] tests/functional/aarch64: add tests for FEAT_RME
In-Reply-To: <f043b94a-278f-4009-87b9-9b2ba4b80c42@linaro.org> (Gustavo
	Romero's message of "Tue, 3 Dec 2024 11:55:59 -0300")
References: <20241128213729.1021961-1-pierrick.bouvier@linaro.org>
	<4b3180bd-8054-4431-a594-0445ce4837aa@linaro.org>
	<5620efa2-98c6-4613-b866-67e91ac6acf8@linaro.org>
	<21d8399a-91bf-4599-a73d-351f9f0c147c@linaro.org>
	<CAFEAcA-4_tnm9iPCf_3E4HKKXJ9h6w9oMiYaN0Y4s9wmpji3Jg@mail.gmail.com>
	<6cd6b3fd-8362-4fa8-b6e5-e0e3aded3215@linaro.org>
	<f043b94a-278f-4009-87b9-9b2ba4b80c42@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 03 Dec 2024 15:30:23 +0000
Message-ID: <87h67kdbsg.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: T/yKwEAzYPqK

Gustavo Romero <gustavo.romero@linaro.org> writes:

> Hi Pierrick,
>
> On 12/2/24 14:33, Pierrick Bouvier wrote:
>> On 12/2/24 03:04, Peter Maydell wrote:
>>> On Mon, 2 Dec 2024 at 10:58, Marcin Juszkiewicz
>>> <marcin.juszkiewicz@linaro.org> wrote:
>>>>
>>>> W dniu 1.12.2024 o 19:09, Pierrick Bouvier pisze:
>>>>> Hi Marcin,
>>>>>
>>>>> On 12/1/24 05:34, Marcin Juszkiewicz wrote:
>>>>
>>>>>> So RME tests probably need longer timeouts or would not run at all.
>>>>>>
>>>>>
>>>>> By any chance, are you running those tests in debug mode?
>>>>
>>>> zOMG, thanks! Turned out that I left "--enable-debug" in my local build
>>>> and forgot to remove it.
>>>>
>>>> 90s vs 2974s is a difference ;D
>>>
>>> That is a particularly awful debug-to-non-debug performance
>>> difference; it might be worth looking into what exactly
>>> is causing it.
>>>
>> Indeed.
>> This test boots a nested VM (using kvm, not tcg), do you any idea
>> why such use case could be so slow with QEMU?
>
> It's not "really" using kvm acceleration right?
>
> It's using kvm but the kvm module in the host kernel is actually running
> fully emulated in QEMU system mode (-accel tcg is being passed to it).
>
> So I understand it's "all TCG" in the end and no HW acceleration is
> ever used in the tests.

Right, but from the internal QEMU's point of view its just real hardware
so we don't have nested translation. All the overhead of that is in the
"host" QEMU.

In theory we could also use kvmtool to launch a realm but I doubt in
this case the internal QEMU is actually taking up that much of the
runtime.

>
>
> Cheers,
> Gustavo

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
