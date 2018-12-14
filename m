Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x76sm10946509wmd.27.2018.12.14.08.26.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Dec 2018 08:26:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 7F66D3E035E;
	Fri, 14 Dec 2018 16:26:08 +0000 (GMT)
References: <20181213115503.24188-1-alex.bennee@linaro.org> <20181213115503.24188-2-alex.bennee@linaro.org> <CAKv+Gu_C78f-a1MdsdXHi6u_gyhRh3djbzM3_vZ3K=AtWzqXGg@mail.gmail.com> <87mup91nox.fsf@linaro.org> <a78b697f-4bb8-f54e-28a9-34ecf6a40f29@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, omair.javaid@linaro.org
Subject: Re: [Qemu-devel] [PATCH v1 1/2] target/arm: kvm64 make guest debug AA32 break point aware
In-reply-to: <a78b697f-4bb8-f54e-28a9-34ecf6a40f29@linaro.org>
Date: Fri, 14 Dec 2018 16:26:08 +0000
Message-ID: <87ftv013dr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: t+jfJ7wQ/IVd


Richard Henderson <richard.henderson@linaro.org> writes:

> On 12/13/18 8:55 AM, Alex Benn=C3=A9e wrote:
>>
>> Ard Biesheuvel <ard.biesheuvel@linaro.org> writes:
>>
>>> Hi Alex,
>>>
>>> Thanks again for looking into this.
>>>
>>> On Thu, 13 Dec 2018 at 12:55, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>> <snip>
>>>
>>>>
>>>>  int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpo=
int *bp)
>>>>  {
>>>> +    CPUARMState *env =3D &ARM_CPU(cs)->env;
>>>> +    int el =3D arm_current_el(env);
>>>> +    bool is_aa64 =3D arm_el_is_aa64(env, el);
>>>> +    const uint32_t *bpi =3D is_aa64 ? &brk_insn : &bkpt_insn;
>>>> +
>>>>      if (have_guest_debug) {
>>>>          if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_ins=
n, 4, 0) ||
>>>> -            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk_insn, 4, =
1)) {
>>>> +            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)bpi, 4, 1)) {
>>>
>>> Should we be dealing with endianness here?
>>>
>> <snip>
>>
>> I don't think so - everything eventually ends up (ld|st)n_p which deals
>> with the endianness details.
>
> I think Ard is right.  You need to consider dynamic endianness with
>
>     bswap_code(arm_sctlr_b(env))

*sigh* I guess. It of course still a heuristic that can break because we
don't know if the system will have switched mode by the time it gets to
the breakpoint.

--
Alex Benn=C3=A9e
