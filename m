Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 185sm2558708wmj.33.2017.11.07.10.45.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Nov 2017 10:45:10 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 16D4E3E03B5;
	Tue,  7 Nov 2017 18:45:10 +0000 (GMT)
References: <20171107165226.22546-1-alex.bennee@linaro.org> <CAFEAcA-E4Tq0gi3q5z+_5JOy0-j0=59p5WiKNFP9qmKG8=r4bg@mail.gmail.com>
User-agent: mu4e 1.0-alpha0; emacs 26.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>, Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [PATCH] accel/tcg/translate-all: expand cpu_restore_state retaddr check
In-reply-to: <CAFEAcA-E4Tq0gi3q5z+_5JOy0-j0=59p5WiKNFP9qmKG8=r4bg@mail.gmail.com>
Date: Tue, 07 Nov 2017 18:45:10 +0000
Message-ID: <87r2taq66h.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: dyS/A7QQqSAl


Peter Maydell <peter.maydell@linaro.org> writes:

> On 7 November 2017 at 16:52, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>> We are still seeing signals during translation time when we walk over
>> a page protection boundary. This expands the check to ensure the
>> retaddr is inside the code generation buffer. The original suggestion
>> was to check versus tcg_ctx.code_gen_ptr but as we now segment the
>> translation buffer we have to settle for just a general check for
>> being inside.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Richard Henderson <rth@twiddle.net>
>> ---
>>  accel/tcg/translate-all.c | 20 ++++++++++++--------
>>  1 file changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
>> index 34c5e28d07..eb255af402 100644
>> --- a/accel/tcg/translate-all.c
>> +++ b/accel/tcg/translate-all.c
>> @@ -357,16 +357,20 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t re=
taddr)
>>      TranslationBlock *tb;
>>      bool r =3D false;
>>
>> -    /* A retaddr of zero is invalid so we really shouldn't have ended
>> -     * up here. The target code has likely forgotten to check retaddr
>> -     * !=3D 0 before attempting to restore state. We return early to
>> -     * avoid blowing up on a recursive tb_lock(). The target must have
>> -     * previously survived a failed cpu_restore_state because
>> -     * tb_find_pc(0) would have failed anyway. It still should be
>> -     * fixed though.
>> +    /* The retaddr has to be in the region of current code buffer. If
>> +     * it's not we will not be able to resolve it here. If it is zero
>> +     * the calling code has likely forgotten to check retaddr before
>> +     * calling here.
>
> This part of the comment isn't correct -- it's entirely expected
> that we will get here with a zero retaddr, because that is
> how the rest of the code tells this function "no state restoration
> required".

Then why call cpu_restore_state at all? We should be consistent as there
are plenty of places that do things like:

    if (pc) {
        /* now we have a real cpu fault */
        cpu_restore_state(cs, pc);
    }

I'm happy to make a 0 retaddr officially valid and actually document it
in exec-all.h. It's not like most callers even bother checking the
return code.

>
>> If it is not in the translated code we could be
>> +     * faulting during translation itself.
>> +     *
>> +     * Either way we need return early to avoid blowing up on a
>> +     * recursive tb_lock() as we can't resolve it here.
>>       */
>>
>> -    if (!retaddr) {
>> +    if (!retaddr ||
>> +        (retaddr < (uintptr_t) tcg_init_ctx.code_gen_buffer) ||
>> +        (retaddr > (uintptr_t) (tcg_init_ctx.code_gen_buffer +
>> +                                tcg_init_ctx.code_gen_buffer_size))) {
>>          return r;
>>      }
>
> thanks
> -- PMM


--
Alex Benn=C3=A9e
