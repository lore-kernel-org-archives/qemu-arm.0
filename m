Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id bj1-20020a0560001e0100b0022b0214cfa6sm17840508wrb.45.2022.09.26.08.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 08:42:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 617BE1FFB7;
	Mon, 26 Sep 2022 16:42:44 +0100 (BST)
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-6-alex.bennee@linaro.org>
 <CAFEAcA_u8TQW5EoX5bBZGKhhaS6PYaYZGyqMrhB1Tsa6eTXCyQ@mail.gmail.com>
 <87leq641id.fsf@linaro.org>
 <CAFEAcA8D_SzU35DB-RvaegYkwkJHD0Y3stx7P=Jh=QC6LOqDZA@mail.gmail.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 05/11] hw/intc/gic: use MxTxAttrs to divine accessing
 CPU
Date: Mon, 26 Sep 2022 16:41:55 +0100
In-reply-to: <CAFEAcA8D_SzU35DB-RvaegYkwkJHD0Y3stx7P=Jh=QC6LOqDZA@mail.gmail.com>
Message-ID: <874jwu3zwr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: SWO4YJJbLY2g


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 26 Sept 2022 at 16:08, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>> > On Mon, 26 Sept 2022 at 14:39, Alex Benn=C3=A9e <alex.bennee@linaro.or=
g> wrote:
>> >> -static inline int gic_get_current_cpu(GICState *s)
>> >> +static inline int gic_get_current_cpu(GICState *s, MemTxAttrs attrs)
>> >>  {
>> >> -    if (!qtest_enabled() && s->num_cpu > 1) {
>> >> -        return current_cpu->cpu_index;
>> >> -    }
>> >> -    return 0;
>> >> +    /*
>> >> +     * Something other than a CPU accessing the GIC would be a bug as
>> >> +     * would a CPU index higher than the GICState expects to be
>> >> +     * handling
>> >> +     */
>> >> +    g_assert(attrs.requester_type =3D=3D MEMTXATTRS_CPU);
>> >> +    g_assert(attrs.requester_id < s->num_cpu);
>> >
>> > Would it be a QEMU bug, or a guest code bug ? If it's possible
>> > for the guest to mis-program a DMA controller to do a read that
>> > goes through this function, we shouldn't assert. (Whether that
>> > can happen will depend on how the board/SoC code puts together
>> > the MemoryRegion hierarchy, I think.)
>>
>> Most likely a QEMU bug - how would a DMA master even access the GIC?
>
> If it's mapped into the system address space, the same way
> as it does any memory access. For instance on the virt board
> we just map the distributor MemoryRegion straight into the
> system address space, and any DMA master can talk to it.
> This is of course not how the hardware really works (where
> the GIC is part of the CPU itself), but, as noted in previous
> threads, up-ending the MemoryRegion handling in order to be
> able to put the GIC only in the address space(s) that the CPU
> sees would be a lot of work, which is why we didn't try to
> solve the "how do you figure out which CPU is writing to the
> GIC" problem that way.

So hw_error?

I don't think there is a way we can safely continue unless we just want
to fallback to "it was vCPU 0 what did it".

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
