Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id n22sm3000611wra.30.2017.07.26.00.59.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jul 2017 00:59:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id B2F5C3E00A6;
	Wed, 26 Jul 2017 08:59:40 +0100 (BST)
References: <DM2PR21MB0060EFC1F6B9F0883A1792369EBB0@DM2PR21MB0060.namprd21.prod.outlook.com> <20170724212327.GA24963@flamenco> <fda73f35-098f-c190-4d15-4363e28872f1@twiddle.net> <DM2PR21MB00602DE4F811D886C5E5C75C9EB80@DM2PR21MB0060.namprd21.prod.outlook.com>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: Richard Henderson <rth@twiddle.net>, "Emilio G. Cota" <cota@braap.org>, "qemu-devel\@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm\@nongnu.org" <qemu-arm@nongnu.org>, Andrey Shedel <ashedel@microsoft.com>, Pranith Kumar <bobby.prani@gmail.com>
Subject: Re: [Qemu-devel] Torn read/write possible on aarch64/x86-64 MTTCG?
In-reply-to: <DM2PR21MB00602DE4F811D886C5E5C75C9EB80@DM2PR21MB0060.namprd21.prod.outlook.com>
Date: Wed, 26 Jul 2017 08:59:40 +0100
Message-ID: <87bmo7eihf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: WgWeWOQI7Ers


Andrew Baumann <Andrew.Baumann@microsoft.com> writes:

>> From: Richard Henderson [mailto:rth7680@gmail.com] On Behalf Of Richard
>> Henderson
>> Sent: Monday, 24 July 2017 15:03
>>
>> On 07/24/2017 02:23 PM, Emilio G. Cota wrote:
>> > (Adding some Cc's)
>> >
>> > On Mon, Jul 24, 2017 at 19:05:33 +0000, Andrew Baumann via Qemu-devel
>> wrote:
>> >> Hi all,
>> >>
>> >> I'm trying to track down what appears to be a translation bug in either
>> >> the aarch64 target or x86_64 TCG (in multithreaded mode). The
>> symptoms
>>
>> I assume this is really x86_64 and not i686 as host.
>
> Yes.
>
>> >> are entirely consistent with a torn read/write -- that is, a 64-bit
>> >> load or store that was translated to two 32-bit loads and stores --
>> >> but that's obviously not what happens in the common path through the
>> >> translation for this code, so I'm wondering: are there any cases in
>> >> which qemu will split a 64-bit memory access into two 32-bit accesses?
>> >
>> > That would be a bug in MTTCG.
>> >
>> >> The code: Guest CPU A writes a 64-bit value to an aligned memory
>> >> location that was previously 0, using a regular store; e.g.:
>> >> 	f9000034 str	     x20,[x1]
>> >>
>> >> Guest CPU B (who is busy-waiting) reads a value from the same location:
>> >> 	f9400280 ldr	     x0,[x20]
>> >>
>> >> The symptom: CPU B loads a value that is neither NULL nor the value
>> >> written. Instead, x0 gets only the low 32-bits of the value written
>> >> (high bits are all zero). By the time this value is dereferenced (a
>> >> few instructions later) and the exception handlers run, the memory
>> >> location from which it was loaded has the correct 64-bit value with
>> >> a non-zero upper half.
>> >>
>> >> Obviously on a real ARM memory barriers are critical, and indeed
>> >> the code has such barriers in it, but I'm assuming that any possible
>> >> mistranslation of the barriers is irrelevant because for a 64-bit load
>> >> and a 64-bit store you should get all or nothing. Other clues that may
>> >> be relevant: the code is _near_ a LDREX/STREX pair (the busy-waiting
>> >> is used to resolve a race when updating another variable), and the
>> >> busy-wait loop has a yield instruction in it (although those appear
>> >> to be no-ops with MTTCG).
>> >
>> > This might have to do with how ldrex/strex is emulated; are you relying
>> > on the exclusive pair detecting ABA? If so, your code won't work in
>> > QEMU since it uses cmpxchg to emulate ldrex/strex.
>>
>> ABA problem is nothing to do with tearing.  And cmpxchg will definitely not
>> create tearing problems.
>
> In fact, the ldrex/strex are there implementing a cmpxchg. :)
>
>> I don't know how we would manage 64-bit tearing on a 64-bit host, at least
>> for
>> the aarch64 guest, for which I believe we have a good emulation.
>>
>> > - Pin the QEMU-MTTCG process to a single CPU. Can you repro then?
>>
>> A good suggestion.
>
> Thanks for the suggestions. I've been running this configuration all day, and haven't seen a repro yet in hundreds of attempts. I'll report if that changes.
>
> The problem is that this test isn't very conclusive... I don't know
> how often the VCPU threads will context switch, but I suspect it's
> pretty rare relative to the ability to expose races when they run
> directly on different host cores. And if the race really doesn't exist
> when running on a single core, that to me suggests a hardware problem,
> which is even less likely.

They will likely context switch as they drop/clear locks coming out of
the translated code

>
>> > - Force the emulation of cmpxchg via EXCP_ATOMIC with:
>> >
>> > diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
>> > index 87f673e..771effe5 100644
>> > --- a/tcg/tcg-op.c
>> > +++ b/tcg/tcg-op.c
>> > @@ -2856,7 +2856,7 @@ void tcg_gen_atomic_cmpxchg_i64(TCGv_i64
>> retv, TCGv addr, TCGv_i64 cmpv,
>> >           }
>> >           tcg_temp_free_i64(t1);
>> >       } else if ((memop & MO_SIZE) == MO_64) {
>> > -#ifdef CONFIG_ATOMIC64
>> > +#if 0
>>
>> I suspect this will simply alter the timing.  However, give it a go by all means.
>
> I haven't tried this yet. If it behaves as you describe, it seems likely to make the race harder to hit.
>
>> If there's a test case that you can share, that would be awesome.
>
> I wish we could :(
>
>> Especially if you can prod it to happen with a standalone minimal binary.  With
>> luck you can reproduce via aarch64-linux-user too, and simply signal an error
>> via branch to __builtin_trap.
>
> Initial attempts to repro this with a tight loop failed, but I'll take
> another stab at producing a standalone test program that we can share.

You could try using the counter value as a way to synchronise threads if
there is a certain race you are trying to engineer. I did something
similar in the barrier tests I wrote while doing the MTTCG work:

  https://github.com/stsquad/kvm-unit-tests/blob/mttcg/current-tests-v8/arm/barrier-litmus-test.c#L61

>
> Andrew


--
Alex Bennée
