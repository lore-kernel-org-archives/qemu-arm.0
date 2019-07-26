Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id r12sm61078698wrt.95.2019.07.26.00.24.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 00:24:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C6ECD1FF87;
	Fri, 26 Jul 2019 08:24:04 +0100 (BST)
References: <20190723113301.16867-1-alex.bennee@linaro.org>
 <CAFEAcA9CP0cUkDR4qOKVgM1b2U1KNot=A-5OPEAOKu3=KpMyuw@mail.gmail.com>
User-agent: mu4e 1.3.3; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH for 4.2] target/arm: generate a custom MIDR for -cpu max
In-reply-to: <CAFEAcA9CP0cUkDR4qOKVgM1b2U1KNot=A-5OPEAOKu3=KpMyuw@mail.gmail.com>
Date: Fri, 26 Jul 2019 08:24:04 +0100
Message-ID: <8736iti7hn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: sXhuXEa4wPbo


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 23 Jul 2019 at 12:33, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> While most features are now detected by probing the ID_* registers
>> kernels can (and do) use MIDR_EL1 for working out of they have to
>> apply errata. This can trip up warnings in the kernel as it tries to
>> work out if it should apply workarounds to features that don't
>> actually exist in the reported CPU type.
>>
>> Avoid this problem by synthesising our own MIDR value using the
>> reserved value of 0 for the implementer and telling kernels the ID
>> registers should tell them everything they need to know.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>
>> ---
>> v2
>>   - don't leak QEMU version into ID reg
>> ---
>>  target/arm/cpu.h   | 6 ++++++
>>  target/arm/cpu64.c | 6 ++++++
>>  2 files changed, 12 insertions(+)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index 7efbb488d9d..61eaef924e4 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -1605,6 +1605,12 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
>>  /*
>>   * System register ID fields.
>>   */
>> +FIELD(MIDR_EL1, REVISION, 0, 4)
>> +FIELD(MIDR_EL1, PARTNUM, 4, 12)
>> +FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)
>> +FIELD(MIDR_EL1, VARIENT, 20, 4)
>
> "VARIANT".
>
>> +FIELD(MIDR_EL1, IMPLEMENTER, 24, 8)
>> +
>>  FIELD(ID_ISAR0, SWAP, 0, 4)
>>  FIELD(ID_ISAR0, BITCOUNT, 4, 4)
>>  FIELD(ID_ISAR0, BITFIELD, 8, 4)
>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>> index b1bb394c6dd..e88aadfd2fd 100644
>> --- a/target/arm/cpu64.c
>> +++ b/target/arm/cpu64.c
>> @@ -296,6 +296,12 @@ static void aarch64_max_initfn(Object *obj)
>>          uint32_t u;
>>          aarch64_a57_initfn(obj);
>>
>> +        /* reset MIDR so our franken-max-cpu type isn't mistaken for a =
real one */
>> +        t =3D FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0); /* Reserved for =
SW */
>> +        t =3D FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf); /* See ID_* f=
or details */
>> +        /* the rest is enigmatically empty lest kernels assume it means=
 something */
>> +        cpu->midr =3D t;
>
> I think this would be easier to read if you used one big block
> comment rather than being extremely terse so as to fit the
> comments on the end of the lines:
>
>  /*
>   * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
>   * one and try to apply errata workarounds or use impdef features we
>   * don't provide.
>   * An IMPLEMENTER field of 0 means "reserved for software use";
>   * ARCHITECTURE must be 0xf indicating "v7 or later, check ID registers
>   * to see which features are present";
>   * the VARIANT, PARTNUM and REVISION fields are all implementation
>   * defined and we choose to leave them all at zero.
>   */
>
> It's also a bit inconsistent to do an explicit deposit of 0
> for the IMPLEMENTER field but not for the VARIANT/PARTNUM/REVISION.
>
> I wonder if we should put 0x51 (ascii 'Q') in the PARTNUM field;
> then if somebody really needs to distinguish QEMU from random
> other software-models they have a way to do it.

Q is reserved for Qualcomm - It would be nice if ARM could assign QEMU a
code but I suspect that's not part of the business model.

>
> thanks
> -- PMM


--
Alex Benn=C3=A9e
