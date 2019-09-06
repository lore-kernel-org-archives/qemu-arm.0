Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id x6sm9987801wmf.38.2019.09.06.08.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 08:52:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9C1FF1FF87;
	Fri,  6 Sep 2019 16:52:23 +0100 (BST)
References: <20190820210720.18976-1-richard.henderson@linaro.org>
 <20190820210720.18976-3-richard.henderson@linaro.org>
 <875zm692za.fsf@linaro.org>
 <f8112d1c-49f4-9e90-bbc2-280d91e8d8fc@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v5 02/17] target/arm: Split out
 rebuild_hflags_a64
In-reply-to: <f8112d1c-49f4-9e90-bbc2-280d91e8d8fc@linaro.org>
Date: Fri, 06 Sep 2019 16:52:23 +0100
Message-ID: <878sr1zako.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: eSgSswhSl/1E


Richard Henderson <richard.henderson@linaro.org> writes:

> On 9/5/19 11:28 AM, Alex Benn=C3=A9e wrote:
>>> -
>>> -        if (cpu_isar_feature(aa64_bti, cpu)) {
>>> -            /* Note that SCTLR_EL[23].BT =3D=3D SCTLR_BT1.  */
>>> -            if (sctlr & (current_el =3D=3D 0 ? SCTLR_BT0 : SCTLR_BT1))=
 {
>>> -                flags =3D FIELD_DP32(flags, TBFLAG_A64, BT, 1);
>>> -            }
>>> +        flags =3D rebuild_hflags_a64(env, current_el, fp_el, mmu_idx);
>>> +        if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
>>>              flags =3D FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype);
>>
>> It seems off to only hoist part of the BTI flag check into the helper,
>> was it just missed or is there a reason? If so it could probably do with
>> an additional comment.
>
> The part of the bti stuff that is hoisted is solely based on system regis=
ters.
>  The BTYPE field is in PSTATE and is a very different kind of animal -- in
> particular, it is not set by MSR.
>
> But also, comments in cpu.h say which fields are (not) cached in hflags, =
and
> BTYPE is so documented.
>
> Is your proposed comment really helpful here going forward, or do you just
> think it's weird reviewing this patch, since not all BTI is treated the s=
ame
> after the patch?

It was just weird seeing the isar_feature test twice. A mention in the
commit "not all bti related flags will be cached so we have to test the
feature twice" or something like that will suffice.

>
>
> r~


--
Alex Benn=C3=A9e
