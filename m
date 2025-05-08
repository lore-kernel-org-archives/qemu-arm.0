Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa7781b1d2sm11139496a12.39.2025.05.08.06.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:37:28 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 0A8E45F767;
	Thu,  8 May 2025 14:37:27 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  Julian Armistead <julian.armistead@linaro.org>,
  "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [RFC PATCH] target/arm: allow gdb to read ARM_CP_NORAW regs
In-Reply-To: <CAFEAcA80-CWEQYwTQPziUxm5V1K93VZstLh2r9mTGkD5QueKoA@mail.gmail.com>
	(Peter Maydell's message of "Thu, 8 May 2025 13:07:40 +0100")
References: <20250507165840.401623-1-alex.bennee@linaro.org>
	<CAFEAcA_0cf=XEbH9VQdTHqu1wekSmFDLdqnnzpcwnshCT-UUCg@mail.gmail.com>
	<87zffnmidy.fsf@draig.linaro.org>
	<CAFEAcA80-CWEQYwTQPziUxm5V1K93VZstLh2r9mTGkD5QueKoA@mail.gmail.com>
User-Agent: mu4e 1.12.10; emacs 30.1
Date: Thu, 08 May 2025 14:37:26 +0100
Message-ID: <87o6w3mdex.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: mW3Kjl0hFxQH

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 8 May 2025 at 12:50, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Wed, 7 May 2025 at 17:58, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>> >>
>> >> Before this we suppress all ARM_CP_NORAW registers being listed under
>> >> GDB. This includes useful registers like CurrentEL which gets tagged
>> >> as ARM_CP_NO_RAW because it is one of the ARM_CP_SPECIAL_MASK
>> >> registers. These are registers TCG can directly compute because we
>> >> have the information at compile time but until now with no readfn.
>> >>
>> >> Add a .readfn to return the CurrentEL and then loosen the restrictions
>> >> in arm_register_sysreg_for_feature to allow ARM_CP_NORAW registers to
>> >> be read if there is a readfn available.
>> >
>> > The primary use case for NO_RAW is "system instructions" like
>> > the TLB maintenance insns. These don't make sense to expose
>> > to a debugger.
>>
>> I think we could re-think the logic:
>>
>>     /*
>>      * By convention, for wildcarded registers only the first
>>      * entry is used for migration; the others are marked as
>>      * ALIAS so we don't try to transfer the register
>>      * multiple times. Special registers (ie NOP/WFI) are
>>      * never migratable and not even raw-accessible.
>>      */
>>     if (r2->type & ARM_CP_SPECIAL_MASK) {
>>         r2->type |=3D ARM_CP_NO_RAW;
>>     }
>
> Well, we definitely don't want WFI or the DC ZVA etc
> "registers" to be exposed to GDB or for us to try to handle
> them in KVM state sync or migration... ARM_CP_NOP is less
> clear because we use it pretty widely for more than one
> purpose. The main one is "system instruction that we don't
> need to implement". (CP_NOP + a readable register is a
> questionable combination since the guest will expect it to
> update the general-purpose destreg, not leave it untouched,
> but we do have some.)
>
>> > If we want the gdbstub access to system registers to be
>> > more than our current "we provide the ones that are easy",
>> > then I think I'd like to see a bit more up-front analysis of
>> > what the gdbstub needs and whether we've got into a bit of
>> > a mess with our ARM_CP_* flags that we could straighten out.
>>
>> Yeah - hence the RFC. CurrentEL is a super useful one to expose though
>> when you are debugging complex hypervisor setups.
>
> One problem with this patch is the one that the reporter of
> https://gitlab.com/qemu-project/qemu/-/issues/2760 noted
> in the conversation there: it will allow the debugger to
> read registers which have a side-effect on read, like
> ICC_IAR1_EL1: we almost certainly do not want to allow
> the debugger to acknowledge an interrupt by doing a sysreg
> read.

Doesn't raw_readfn offer these semantics?

    /*
     * Function for doing a "raw" read; used when we need to copy
     * coprocessor state to the kernel for KVM or out for
     * migration. This only needs to be provided if there is also a
     * readfn and it has side effects (for instance clear-on-read bits).
     */
    CPReadFn *raw_readfn;

So maybe:

        /* We can only read ARM_CP_NO_RAW regs without side effects */
        if ((ri->type & ARM_CP_NO_RAW) && !ri->raw_readfn) {
            return;
        }

And I guess we can strengthen the gdb helper to NOP any writes to such
registers.

>
> thanks
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
