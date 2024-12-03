Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c1408sm622166466b.15.2024.12.03.07.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 07:31:21 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 827EA5F89C;
	Tue,  3 Dec 2024 15:31:20 +0000 (GMT)
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
In-Reply-To: <b9e375ad-2b71-48a4-8e97-2cdced17ea79@linaro.org> (Gustavo
	Romero's message of "Tue, 3 Dec 2024 12:02:03 -0300")
References: <20241128213729.1021961-1-pierrick.bouvier@linaro.org>
	<4b3180bd-8054-4431-a594-0445ce4837aa@linaro.org>
	<5620efa2-98c6-4613-b866-67e91ac6acf8@linaro.org>
	<CAFEAcA-xa1AKf2GAv7go5wdu+Td=4jf7Nriin-Oe3S6qEV6X0g@mail.gmail.com>
	<fd7ad48e-1e72-4735-8064-7039eedc00ae@linaro.org>
	<87ser6c5be.fsf@draig.linaro.org>
	<b9e375ad-2b71-48a4-8e97-2cdced17ea79@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 03 Dec 2024 15:31:20 +0000
Message-ID: <87bjxsdbqv.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: GuAusZbFVBeV

Gustavo Romero <gustavo.romero@linaro.org> writes:

> Hi Alex,
>
> On 12/2/24 15:23, Alex Benn=C3=A9e wrote:
>> Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:
>>=20
>>> On 12/2/24 02:57, Peter Maydell wrote:
>>>> On Sun, 1 Dec 2024 at 18:09, Pierrick Bouvier
>>>> <pierrick.bouvier@linaro.org> wrote:
>>>>>
>>>>> Hi Marcin,
>>>>>
>>>>> On 12/1/24 05:34, Marcin Juszkiewicz wrote:
>>>>>> W dniu 28.11.2024 o 22:37, Pierrick Bouvier pisze:
>>>>>>> This boot an OP-TEE environment, and launch a nested guest VM insid=
e it
>>>>>>> using the Realms feature. We do it for virt and sbsa-ref platforms.
>>>>>>>
>>>>>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>>>>
>>>>>>> diff --git a/tests/functional/meson.build b/tests/functional/meson.=
build
>>>>>>> index 5c048cfac6d..b975a1560df 100644
>>>>>>> --- a/tests/functional/meson.build
>>>>>>> +++ b/tests/functional/meson.build
>>>>>>> @@ -13,6 +13,8 @@ endif
>>>>>>>      test_timeouts =3D {
>>>>>>>        'aarch64_aspeed' : 600,
>>>>>>>        'aarch64_raspi4' : 480,
>>>>>>
>>>>>>> +  'aarch64_rme_virt' : 720,
>>>>>>
>>>>>> Took 2974.95s on M1 Pro macbook.
>>>>>>
>>>>>>> +  'aarch64_rme_sbsaref' : 720,
>>>>>>
>>>>>> This one needed 2288.29s.
>>>>>>
>>>>>>>        'aarch64_sbsaref_alpine' : 720,
>>>>>>
>>>>>> Have to check cause timed out.
>>>>>>
>>>>>>>        'aarch64_sbsaref_freebsd' : 720,
>>>>>>
>>>>>> 331.65s
>>>>>>
>>>>>> So RME tests probably need longer timeouts or would not run at all.
>>>>>>
>>>>>
>>>>> By any chance, are you running those tests in debug mode?
>>>>> It seems to me that CI is running functional tests with optimized
>>>>> builds, so I'm not sure we want to support debug "times" here.
>>>> We do need to support debug times, because a common developer
>>>> use case is "doing a debug build, run 'make check-functional'
>>>> to check whether anything is broken. The debug times also
>>>> are useful because the CI runners can have highly variable
>>>> performance -- if a test is slow enough to hit the timeout
>>>> for a debug build locally, it's probably going to also hit
>>>> the timeout at least sometimes in CI.
>>>>
>>>
>>> I understand the scenario, but given how slow debug builds are, it
>>> would probably be faster to advise developer to recompile in release
>>> mode.
>>> The overall time of compile + test is slower than waiting for debug.
>>>
>>> Beyond using a debugger, what is the advantage to compile with -O0?
>> --enable-debug
>>    - enables -00 with -g3 for symbols
>>    - and enables additional checks to validate TCG
>
> hm, do we ever used -g3 for --enable-debug?
>
> https://gitlab.com/qemu-project/qemu/-/blob/master/configure?ref_type=3Dh=
eads#L749
>
> I'd love to use -g3 instead of only -g for having the macro symbols.

Hmm yeah, I tend to use extra-cflags with it as well.

>
> In my builds I use --extra-cflags=3D"-g3" to have it but would like to dr=
op it.
>
> unless I'm missing some other change in the flags down the lane...
>
>
> Cheers,
> Gustavo
>
>> You can use --enable-debug-info for just debug info without the overhead.
>>=20
>>>
>>>> thanks
>>>> -- PMM
>>=20

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
