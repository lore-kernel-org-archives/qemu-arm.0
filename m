Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id s1sm2137328wro.9.2018.12.13.06.55.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Dec 2018 06:55:10 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 83A6C3E035F;
	Thu, 13 Dec 2018 14:55:10 +0000 (GMT)
References: <20181213115503.24188-1-alex.bennee@linaro.org> <20181213115503.24188-2-alex.bennee@linaro.org> <CAKv+Gu_C78f-a1MdsdXHi6u_gyhRh3djbzM3_vZ3K=AtWzqXGg@mail.gmail.com>
User-agent: mu4e 1.1.0; emacs 26.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, Mark Rutland <mark.rutland@arm.com>, omair.javaid@linaro.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v1 1/2] target/arm: kvm64 make guest debug AA32 break point aware
In-reply-to: <CAKv+Gu_C78f-a1MdsdXHi6u_gyhRh3djbzM3_vZ3K=AtWzqXGg@mail.gmail.com>
Date: Thu, 13 Dec 2018 14:55:10 +0000
Message-ID: <87mup91nox.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: FU4kltCM/H8x


Ard Biesheuvel <ard.biesheuvel@linaro.org> writes:

> Hi Alex,
>
> Thanks again for looking into this.
>
> On Thu, 13 Dec 2018 at 12:55, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
<snip>
>
>>
>>  int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoin=
t *bp)
>>  {
>> +    CPUARMState *env =3D &ARM_CPU(cs)->env;
>> +    int el =3D arm_current_el(env);
>> +    bool is_aa64 =3D arm_el_is_aa64(env, el);
>> +    const uint32_t *bpi =3D is_aa64 ? &brk_insn : &bkpt_insn;
>> +
>>      if (have_guest_debug) {
>>          if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn,=
 4, 0) ||
>> -            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk_insn, 4, 1)=
) {
>> +            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)bpi, 4, 1)) {
>
> Should we be dealing with endianness here?
>
<snip>

I don't think so - everything eventually ends up (ld|st)n_p which deals
with the endianness details.

--
Alex Benn=C3=A9e
