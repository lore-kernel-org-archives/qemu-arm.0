Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1895087d1sm1070134966b.128.2025.05.08.04.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 04:50:02 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 4D0465F767;
	Thu,  8 May 2025 12:50:01 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  Julian Armistead <julian.armistead@linaro.org>,
  "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [RFC PATCH] target/arm: allow gdb to read ARM_CP_NORAW regs
In-Reply-To: <CAFEAcA_0cf=XEbH9VQdTHqu1wekSmFDLdqnnzpcwnshCT-UUCg@mail.gmail.com>
	(Peter Maydell's message of "Thu, 8 May 2025 11:08:31 +0100")
References: <20250507165840.401623-1-alex.bennee@linaro.org>
	<CAFEAcA_0cf=XEbH9VQdTHqu1wekSmFDLdqnnzpcwnshCT-UUCg@mail.gmail.com>
User-Agent: mu4e 1.12.10; emacs 30.1
Date: Thu, 08 May 2025 12:50:01 +0100
Message-ID: <87zffnmidy.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: OCT5cXN42AeK

Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 7 May 2025 at 17:58, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> Before this we suppress all ARM_CP_NORAW registers being listed under
>> GDB. This includes useful registers like CurrentEL which gets tagged
>> as ARM_CP_NO_RAW because it is one of the ARM_CP_SPECIAL_MASK
>> registers. These are registers TCG can directly compute because we
>> have the information at compile time but until now with no readfn.
>>
>> Add a .readfn to return the CurrentEL and then loosen the restrictions
>> in arm_register_sysreg_for_feature to allow ARM_CP_NORAW registers to
>> be read if there is a readfn available.
>
> The primary use case for NO_RAW is "system instructions" like
> the TLB maintenance insns. These don't make sense to expose
> to a debugger.

I think we could re-think the logic:

    /*
     * By convention, for wildcarded registers only the first
     * entry is used for migration; the others are marked as
     * ALIAS so we don't try to transfer the register
     * multiple times. Special registers (ie NOP/WFI) are
     * never migratable and not even raw-accessible.
     */
    if (r2->type & ARM_CP_SPECIAL_MASK) {
        r2->type |=3D ARM_CP_NO_RAW;
    }

> If we want the gdbstub access to system registers to be
> more than our current "we provide the ones that are easy",
> then I think I'd like to see a bit more up-front analysis of
> what the gdbstub needs and whether we've got into a bit of
> a mess with our ARM_CP_* flags that we could straighten out.

Yeah - hence the RFC. CurrentEL is a super useful one to expose though
when you are debugging complex hypervisor setups.

>
> thanks
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
