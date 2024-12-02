Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385d7f103e0sm11608604f8f.19.2024.12.02.10.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 10:23:18 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id ED1A25F767;
	Mon,  2 Dec 2024 18:23:17 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,  Marcin Juszkiewicz
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
In-Reply-To: <fd7ad48e-1e72-4735-8064-7039eedc00ae@linaro.org> (Pierrick
	Bouvier's message of "Mon, 2 Dec 2024 09:31:24 -0800")
References: <20241128213729.1021961-1-pierrick.bouvier@linaro.org>
	<4b3180bd-8054-4431-a594-0445ce4837aa@linaro.org>
	<5620efa2-98c6-4613-b866-67e91ac6acf8@linaro.org>
	<CAFEAcA-xa1AKf2GAv7go5wdu+Td=4jf7Nriin-Oe3S6qEV6X0g@mail.gmail.com>
	<fd7ad48e-1e72-4735-8064-7039eedc00ae@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 02 Dec 2024 18:23:17 +0000
Message-ID: <87ser6c5be.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: YzwgR7Mvwz1q

Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:

> On 12/2/24 02:57, Peter Maydell wrote:
>> On Sun, 1 Dec 2024 at 18:09, Pierrick Bouvier
>> <pierrick.bouvier@linaro.org> wrote:
>>>
>>> Hi Marcin,
>>>
>>> On 12/1/24 05:34, Marcin Juszkiewicz wrote:
>>>> W dniu 28.11.2024 o 22:37, Pierrick Bouvier pisze:
>>>>> This boot an OP-TEE environment, and launch a nested guest VM inside =
it
>>>>> using the Realms feature. We do it for virt and sbsa-ref platforms.
>>>>>
>>>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>>
>>>>> diff --git a/tests/functional/meson.build b/tests/functional/meson.bu=
ild
>>>>> index 5c048cfac6d..b975a1560df 100644
>>>>> --- a/tests/functional/meson.build
>>>>> +++ b/tests/functional/meson.build
>>>>> @@ -13,6 +13,8 @@ endif
>>>>>     test_timeouts =3D {
>>>>>       'aarch64_aspeed' : 600,
>>>>>       'aarch64_raspi4' : 480,
>>>>
>>>>> +  'aarch64_rme_virt' : 720,
>>>>
>>>> Took 2974.95s on M1 Pro macbook.
>>>>
>>>>> +  'aarch64_rme_sbsaref' : 720,
>>>>
>>>> This one needed 2288.29s.
>>>>
>>>>>       'aarch64_sbsaref_alpine' : 720,
>>>>
>>>> Have to check cause timed out.
>>>>
>>>>>       'aarch64_sbsaref_freebsd' : 720,
>>>>
>>>> 331.65s
>>>>
>>>> So RME tests probably need longer timeouts or would not run at all.
>>>>
>>>
>>> By any chance, are you running those tests in debug mode?
>>> It seems to me that CI is running functional tests with optimized
>>> builds, so I'm not sure we want to support debug "times" here.
>> We do need to support debug times, because a common developer
>> use case is "doing a debug build, run 'make check-functional'
>> to check whether anything is broken. The debug times also
>> are useful because the CI runners can have highly variable
>> performance -- if a test is slow enough to hit the timeout
>> for a debug build locally, it's probably going to also hit
>> the timeout at least sometimes in CI.
>>=20
>
> I understand the scenario, but given how slow debug builds are, it
> would probably be faster to advise developer to recompile in release
> mode.
> The overall time of compile + test is slower than waiting for debug.
>
> Beyond using a debugger, what is the advantage to compile with -O0?

--enable-debug

  - enables -00 with -g3 for symbols
  - and enables additional checks to validate TCG

You can use --enable-debug-info for just debug info without the overhead.

>
>> thanks
>> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
