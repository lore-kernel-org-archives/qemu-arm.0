Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id hq2sm3114242wjb.36.2016.06.06.10.28.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jun 2016 10:28:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id D6B593E02BF;
	Mon,  6 Jun 2016 18:28:57 +0100 (BST)
User-agent: mu4e 0.9.17; emacs 25.0.94.5
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Andrew Jones <drjones@redhat.com>, kvm@vger.kernel.org, marc.zyngier@arm.com, andre.przywara@arm.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com, kvmarm@lists.cs.columbia.edu
Subject: Re: [kvm-unit-tests PATCH v2 03/10] arm/arm64: smp: support more than 8 cpus
In-reply-to: <20160606163238.GB23505@leverpostej>
Date: Mon, 06 Jun 2016 18:28:57 +0100
Message-ID: <87ziqygrae.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: oKIqTDPqHHz3


Mark Rutland <mark.rutland@arm.com> writes:

> On Mon, Jun 06, 2016 at 05:22:49PM +0100, Alex Bennée wrote:
>> Andrew Jones <drjones@redhat.com> writes:
>> > +#define MPIDR_LEVEL_SHIFT(level) \
>> > +	(((1 << level) >> 1) << 3)
>> > +#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
>> > +	((mpidr >> MPIDR_LEVEL_SHIFT(level)) & 0xff)
>>
>> Doesn't Aff3 break this little macro? It sits at 32:39 with a gap for
>> MT, RES0, U, RES1 for bits 25:31
>
> It works, it's just a little bit magic:

Ahh the magic was too subtle for my eyes, perhaps a comment for the
wary.

>
> (gdb) p (((1 << 0) >> 1) << 3)
> $1 = 0
> (gdb) p (((1 << 1) >> 1) << 3)
> $2 = 8
> (gdb) p (((1 << 2) >> 1) << 3)
> $3 = 16
> (gdb) p (((1 << 3) >> 1) << 3)
> $4 = 32
> (gdb)
>
> We do the same in arch/arm64/include/asm/cputype.h since b058450f38c337d1
> ("arm64: kernel: add MPIDR_EL1 accessors macros").

I see the truth of it ;-)
>
> Thanks,
> Mark.


--
Alex Bennée
