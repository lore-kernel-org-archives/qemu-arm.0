Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id e5-20020a05600c4e4500b003a32251c3f9sm3471816wmq.5.2022.08.10.11.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 11:46:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0AB3A1FFB7;
	Wed, 10 Aug 2022 19:46:48 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-23-richard.henderson@linaro.org>
 <87fsi4kzkz.fsf@linaro.org>
 <3128223b-56d9-8efd-05c0-f1f2a30dfd99@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 22/62] target/arm: Add secure parameter to
 get_phys_addr_pmsav8
Date: Wed, 10 Aug 2022 19:46:28 +0100
In-reply-to: <3128223b-56d9-8efd-05c0-f1f2a30dfd99@linaro.org>
Message-ID: <87czd8j5rc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Uqv56sbpyoZT


Richard Henderson <richard.henderson@linaro.org> writes:

> On 8/10/22 06:16, Alex Benn=C3=A9e wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> Remove the use of regime_is_secure from get_phys_addr_pmsav8.
>>> Since we already had a local variable named secure, use that.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   target/arm/ptw.c | 5 ++---
>>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
>>> index d424dec729..f7892a0c48 100644
>>> --- a/target/arm/ptw.c
>>> +++ b/target/arm/ptw.c
>>> @@ -1960,10 +1960,9 @@ void v8m_security_lookup(CPUARMState *env, uint3=
2_t address,
>>>     static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t
>>> address,
>>>                                    MMUAccessType access_type, ARMMMUIdx=
 mmu_idx,
>>> -                                 GetPhysAddrResult *result,
>>> +                                 bool secure, GetPhysAddrResult
>>>   *result,
>> NIT: why not use is_secure like all the other functions (and
>> reformat
>> the commit subject to match too).
>
> It's right there in the commit message -- there was an existing local
> variable.

doh - sorry so focused on the mechanics I missed the explanation!
>
>
> r~
>
>> Otherwise:
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>=20


--=20
Alex Benn=C3=A9e
