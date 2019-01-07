Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x10sm59419185wrn.29.2019.01.07.00.49.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jan 2019 00:49:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id D8D573E0220;
	Mon,  7 Jan 2019 08:49:24 +0000 (GMT)
References: <20181213115503.24188-1-alex.bennee@linaro.org> <20181213115503.24188-3-alex.bennee@linaro.org> <CAFEAcA_7OgJXKb2YwF9qMwf1J2+hkYwft1us4+yMJ_OeUiJ-jQ@mail.gmail.com>
User-agent: mu4e 1.1.0; emacs 26.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Omair Javaid <omair.javaid@linaro.org>
Subject: Re: [PATCH v1 2/2] target/arm: defer setting up of aarch64 gdb until arm_cpu_realize
In-reply-to: <CAFEAcA_7OgJXKb2YwF9qMwf1J2+hkYwft1us4+yMJ_OeUiJ-jQ@mail.gmail.com>
Date: Mon, 07 Jan 2019 08:49:24 +0000
Message-ID: <87r2dovomj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: XoW6gL4LvU2O


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 13 Dec 2018 at 11:55, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> If we setup earlier we miss the parsing of the aarch64 state of the
>> CPU. If the user has booted up with:
>>
>>   qemu-system-aarch64 -cpu host,aarch64=3Doff -enable-kvm
>>
>> we end up presenting an aarch64 view of the world via the gdbstub and
>> hilarity ensues.
>>
>> Reported-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Omair Javaid <omair.javaid@linaro.org>
>> ---
>>  include/hw/arm/arm.h |  2 ++
>>  target/arm/cpu.c     |  4 ++++
>>  target/arm/cpu64.c   | 20 +++++++++++++++-----
>>  3 files changed, 21 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
>> index ffed39252d..f9a7a6e2fb 100644
>> --- a/include/hw/arm/arm.h
>> +++ b/include/hw/arm/arm.h
>> @@ -171,4 +171,6 @@ void arm_write_secure_board_setup_dummy_smc(ARMCPU *=
cpu,
>>     ticks.  */
>>  extern int system_clock_scale;
>>
>> +void arm_cpu_enable_aarch64_gdbstub(CPUClass *cc);
>> +
>>  #endif /* HW_ARM_H */
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 60411f6bfe..100a72ff81 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -890,9 +890,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>>       * queries ID_ISAR0_EL1 on such a host, the value is UNKNOWN.
>>       * Similarly, we cannot check ID_AA64PFR0 without AArch64 support.
>>       */
>> +#ifdef TARGET_AARCH64
>>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>> +        CPUClass *cc =3D CPU_GET_CLASS(cs);
>>          no_aa32 =3D !cpu_isar_feature(aa64_aa32, cpu);
>> +        arm_cpu_enable_aarch64_gdbstub(cc);
>>      }
>> +#endif
>
> This seems weird, because the fields in cc are common
> to all CPUs in the class, and so setting them on
> realize of a specific instance based on properties of
> the instance looks wrong... At least in theory there's
> no reason we couldn't have one -cpu host CPU with
> aarch64=3Doff and one with aarch64=3Don, though I'm not
> sure our UI allows the user to actually set the
> properties per-cpu like that.

So we should really move these to be object instance methods? Or
possibly have object instance methods that override the class methods if
they are not NULL?

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
