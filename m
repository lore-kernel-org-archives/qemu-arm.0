Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab960062a4sm415565866b.32.2024.12.16.23.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 23:40:38 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 94A2D5F891;
	Tue, 17 Dec 2024 07:40:37 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
  qemu-devel@nongnu.org,  Laurent Vivier <lvivier@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Fabiano Rosas <farosas@suse.de>,
  qemu-arm@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/2] Change default pointer authentication algorithm on
 aarch64 to impdef
In-Reply-To: <19df9957-6653-4086-aa1f-07263efcddde@linaro.org> (Pierrick
	Bouvier's message of "Mon, 16 Dec 2024 17:37:17 -0800")
References: <20241204211234.3077434-1-pierrick.bouvier@linaro.org>
	<7cd98960-0c0d-481f-96ea-08e0578d5cad@linaro.org>
	<b0962854-65c3-47d0-8f0a-072fdf51e7b6@linaro.org>
	<6e29d9cb-1c67-4fdc-97f1-32c90bed1048@linaro.org>
	<19df9957-6653-4086-aa1f-07263efcddde@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 17 Dec 2024 07:40:37 +0000
Message-ID: <87pllq69l6.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: RrNw0iyTz9ve

Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:

> On 12/16/24 11:50, Richard Henderson wrote:
>> On 12/16/24 13:26, Pierrick Bouvier wrote:
>>> On 12/16/24 11:10, Richard Henderson wrote:
>>>> On 12/4/24 15:12, Pierrick Bouvier wrote:
>>>>> qemu-system-aarch64 default pointer authentication (QARMA5) is expens=
ive, we
>>>>> spent up to 50% of the emulation time running it (when using TCG).
>>>>>
>>>>> Switching to pauth-impdef=3Don is often given as a solution to speed =
up execution.
>>>>> Thus we talked about making it the new default.
>>>>>
>>>>> The first patch introduce a new property (pauth-qarma5) to allow to s=
elect
>>>>> current default algorithm.
>>>>> The second one change the default.
>>>>>
>>>>> Pierrick Bouvier (2):
>>>>>  =C2=A0=C2=A0=C2=A0 target/arm: add new property to select pauth-qarm=
a5
>>>>>  =C2=A0=C2=A0=C2=A0 target/arm: change default pauth algorithm to imp=
def
>>>>>
>>>>>  =C2=A0=C2=A0 docs/system/arm/cpu-features.rst |=C2=A0 7 +++++--
>>>>>  =C2=A0=C2=A0 docs/system/introduction.rst=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +-
>>>>>  =C2=A0=C2=A0 target/arm/cpu.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>>>>  =C2=A0=C2=A0 target/arm/arm-qmp-cmds.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 2 +-
>>>>>  =C2=A0=C2=A0 target/arm/cpu64.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 30 +++++++++++++++++++--=
---------
>>>>>  =C2=A0=C2=A0 tests/qtest/arm-cpu-features.c=C2=A0=C2=A0 | 15 +++++++=
++++----
>>>>>  =C2=A0=C2=A0 6 files changed, 38 insertions(+), 19 deletions(-)
>>>>>
>>>>
>>>> I understand the motivation, but as-is this will break migration.
>>>>
>>>> I think this will need to be versioned somehow, but the only thing tha=
t really gets
>>>> versioned are the boards, and I'm not sure how to link that to the ins=
tantiated cpu.
>>>>
>>>
>>>   From what I understood, and I may be wrong, the use case to migrate (=
tcg) vm with cpu max
>>> between QEMU versions is *not* supported, as we can't guarantee which f=
eatures are present
>>> or not.
>> This doesn't affect only -cpu max, but anything using aarch64_add_pauth_=
properties():
>> neoverse-n1, neoverse-n2, cortex-a710.
>>=20
>
> I think this is still a change worth to do, because people can get a
> 100% speedup with this simple change, and it's a better default than
> the previous value.
> In more, in case of this migration scenario, QEMU will immediately
> abort upon accessing memory through a pointer.
>
> I'm not sure about what would be the best way to make this change as
> smooth as possible for QEMU users.

Surely we can only honour and apply the new default to -cpu max?

>
> Peter, Alex, do you have any suggestion on this topic?
>
> Thanks,
> Pierrick
>
>> r~

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
