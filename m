Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1628d6csm21691235e9.10.2025.07.04.02.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 02:30:41 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D87BB5F8AE;
	Fri, 04 Jul 2025 10:30:40 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  peter.maydell@linaro.org
Subject: Re: [PATCH v3 95/97] target/arm: Enable FEAT_SME2p1 on -cpu max
In-Reply-To: <65fc2bca-eba1-4736-96c6-59009d298476@linaro.org> (Richard
	Henderson's message of "Thu, 3 Jul 2025 21:12:10 -0600")
References: <20250702123410.761208-1-richard.henderson@linaro.org>
	<20250702123410.761208-96-richard.henderson@linaro.org>
	<87plehb3d6.fsf@draig.linaro.org>
	<65fc2bca-eba1-4736-96c6-59009d298476@linaro.org>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Fri, 04 Jul 2025 10:30:40 +0100
Message-ID: <87jz4ob8vz.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: tXPEl5vdwSnP

Richard Henderson <richard.henderson@linaro.org> writes:

> On 7/3/25 11:17, Alex Benn=C3=A9e wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   target/arm/tcg/cpu64.c        | 10 ++++++++--
>>>   docs/system/arm/emulation.rst |  6 ++++++
>>>   2 files changed, 14 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
>>> index 5d8ed2794d..f73729926b 100644
>>> --- a/target/arm/tcg/cpu64.c
>>> +++ b/target/arm/tcg/cpu64.c
>>> @@ -1194,7 +1194,7 @@ void aarch64_max_tcg_initfn(Object *obj)
>>>        */
>>>       t =3D FIELD_DP64(t, ID_AA64PFR1, MTE, 3);       /* FEAT_MTE3 */
>>>       t =3D FIELD_DP64(t, ID_AA64PFR1, RAS_FRAC, 0);  /* FEAT_RASv1p1 +=
 FEAT_DoubleFault */
>>> -    t =3D FIELD_DP64(t, ID_AA64PFR1, SME, 1);       /* FEAT_SME */
>>> +    t =3D FIELD_DP64(t, ID_AA64PFR1, SME, 2);       /* FEAT_SME2 */
>> With -cpu max moving to SME2 is there any way to test just plain SME
>> now?
>
> No.  What we'd want, I guess, is a real cpu model with just sme1.

I've had a bit of a look around and I think the only thing shipping SME
at the moment is the Apple M4 and I can't tell if that's 1 & 2 or just
1. Even then we'd need a full set of idregs for it from someone with
actual HW.

IOW I think we'll be fine for now.

>
>
> r~

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
