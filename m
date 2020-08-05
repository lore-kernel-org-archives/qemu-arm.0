Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id i4sm3396892wrw.26.2020.08.05.09.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 09:45:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id F02B41FF7E;
	Wed,  5 Aug 2020 17:45:01 +0100 (BST)
References: <CAFEAcA_6zbOfdVi+Tp18seaEy4don1GurVya+E+QXRGrZ_WVLg@mail.gmail.com>
 <2c5ed9d8-6d79-1b53-5588-8fb9efebf0fa@linaro.org>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, QEMU Developers
 <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: v8.1M cpu emulation and target-arm feature-identification strategy
In-reply-to: <2c5ed9d8-6d79-1b53-5588-8fb9efebf0fa@linaro.org>
Date: Wed, 05 Aug 2020 17:45:01 +0100
Message-ID: <87tuxhkpo2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ESXh6KQNnB2k


Richard Henderson <richard.henderson@linaro.org> writes:

> On 8/5/20 4:08 AM, Peter Maydell wrote:
>> Mostly recently we've been aiming for QEMU emulation code in
>> target/arm to use ID register fields to determine whether a
>> feature is present or not (the isar_feature_* functions) rather
>> than the old style of defining ARM_FEATURE_* flags. This seems to
>> be working out well for A-profile. However, for v8.1M there are
>> a small handful of minor behaviour differences which don't have an
>> associated ID register field, but which are instead in the spec
>> and pseudocode just called out as "if this is a v8.1M CPU".
>> (The major v8.1M new features do have ID register fields.)
>>=20
>> I can think of two ways to handle this:
>>  (1) define an ARM_FEATURE_V81M flag
>>  (2) define an isar_feature_aa32_v81m() function which under the
>>      hood is actually testing for a specific feature which happens
>>      to be known to be always present in v8.1M, like low-overhead-branch=
es
>>      (ie ID_ISAR0.CmpBranch >=3D3)
>
> I think (2) has the potential to be confusing in odd ways.  If there real=
ly is
> no official flag for this, I think we should use (1).

I wouldn't test other feature bits but what stopping us adding:

    struct ARMISARegisters {
        uint32_t id_isar0;
        ...
        uint64_t id_aa64dfr1;
        /*
         * The following are synthetic flags for features not exposed to
         * the directly exposed to the guest but needed by QEMU's
         * feature detection.
         */
        bool v81m_lob;
    } isar;
=20=20

And having the normal:

    static inline bool isar_feature_aa32_v81m_lob(const ARMISARegisters *id)
    {
        return id->v81m_lob;
    }

That said we still seem to have a number of ARM_FEATURE flags, are we
hoping they all go away eventually?

>
>
> r~


--=20
Alex Benn=C3=A9e
