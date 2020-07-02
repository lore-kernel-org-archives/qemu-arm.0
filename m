Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u65sm9571534wmg.5.2020.07.02.00.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 00:54:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 63F4E1FF7E;
	Thu,  2 Jul 2020 08:54:49 +0100 (BST)
References: <20200701200848.26746-1-agraf@csgraf.de>
 <CAFEAcA9S5v0LHMNc4fu9JGUzecbg8DsogZuCEv_aGNqVxRAcDQ@mail.gmail.com>
 <60440cb5-bd18-2928-afcf-974766222dd7@csgraf.de>
User-agent: mu4e 1.5.3; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alexander Graf <agraf@csgraf.de>
Cc: Peter Maydell <peter.maydell@linaro.org>, QEMU Developers
 <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH] target/arm: Treat unknown SMC calls as NOP
In-reply-to: <60440cb5-bd18-2928-afcf-974766222dd7@csgraf.de>
Date: Thu, 02 Jul 2020 08:54:49 +0100
Message-ID: <878sg2qrli.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ZVIF8P+lA78S


Alexander Graf <agraf@csgraf.de> writes:

> On 01.07.20 22:47, Peter Maydell wrote:
>> On Wed, 1 Jul 2020 at 21:08, Alexander Graf <agraf@csgraf.de> wrote:
>>> We currently treat unknown SMC calls as UNDEF. This behavior is differe=
nt
>>> from KVM, which treats them as NOP.
>>>
>>> Unfortunately, the UNDEF exception breaks running Windows for ARM in QE=
MU,
>>> as that probes an OEM SMCCC call on boot, but does not expect to receive
>>> an UNDEF exception as response.
>>>
>>> So instead, let's follow the KVM path and ignore SMC calls that we don't
>>> handle. This fixes booting the Windows 10 for ARM preview in TCG for me.
>>>
>>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>>> +    if (cs->exception_index =3D=3D EXCP_SMC &&
>>> +        !arm_feature(env, ARM_FEATURE_EL3) &&
>>> +        cpu->psci_conduit !=3D QEMU_PSCI_CONDUIT_SMC) {
>> This condition says: "we got an SMC, and this CPU doesn't
>> have EL3, and we're not imitating real EL3 firmware".
>
>
> I like to think of it as "This CPU exposes an environment that looks
> like KVM, so it implements HVC calls (EL2) and is responsible for
> handling SMC calls as well.

That is a very KVM centric view of the world ;-)

I thought the aim was always to behave as the real processor would.

> The main difference between the two semantics is that in yours, you
> don't have EL3. In mine, there is an EL3, but it's virtualized by the
> same layer that implements EL2.

If you boot up with secure firmware + EL2 aware KVM kernel I assume
everything behaves as expected?

>
>
>> The architecturally correct behaviour here (since we don't
>> implement nested-virt yet, which might allow it to trap
>> to guest EL2) is to UNDEF, as far as I can see from a quick
>> look at the AArch64.CheckForSMCUndefOrTrap().
>>
>> I'm not sure why KVM makes these NOP; if I'm right about the
>> architectural behaviour then making them NOP would be a KVM bug.
>>
>> If Windows makes an SMC call on boot that seems like a guest
>> bug: it would crash on a real CPU without EL2/EL3 as well.
>
>
> I don't think there can be a real SBBR compatible CPU without EL2/EL3,
> because PSCI is a base requirement. That means either SMC calls succeed
> (Windows running in EL2) or SMC calls are trapped into EL2 and it's up
> to the hypervisor to decide what to do with them.
>
>
>>
>>       *  Conduit SMC, valid call  Trap to EL2         PSCI Call
>>       *  Conduit SMC, inval call  Trap to EL2         Undef insn
>> -     *  Conduit not SMC          Undef insn          Undef insn
>> +     *  Conduit not SMC          nop                 nop
>>
>> The line in this table that your commit message says you're
>> fixing is "Conduit SMC, inval call"; the line your code
>> change affects is "Conduit not SMC", which is not the same
>> thing. (I'd have to look at the PSCI spec to see what it
>> requires for SMCs that aren't valid PSCI calls.)
>
>
> The patch fixes the default environment, which is "Conduit HVC, PSCI
> over HVC implemented by QEMU". If the patch description wasn't clear,
> I'm happy to reword it :).
>
>
> Alex


--=20
Alex Benn=C3=A9e
