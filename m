Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id o4sm516544wry.80.2021.11.18.09.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 09:13:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B93821FF96;
	Thu, 18 Nov 2021 17:13:10 +0000 (GMT)
References: <CA+4MfEJhOsmUWmifkzJ7jSw8B0q7X2mJe=jist4AiTwhYd8Wug@mail.gmail.com>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Idan Horowitz <idan.horowitz@gmail.com>
Cc: qemu-arm@nongnu.org
Subject: Re: DSB does not seem to wait for TLBI completion
Date: Thu, 18 Nov 2021 17:01:45 +0000
In-reply-to: <CA+4MfEJhOsmUWmifkzJ7jSw8B0q7X2mJe=jist4AiTwhYd8Wug@mail.gmail.com>
Message-ID: <87fsrtv13t.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: cVYi3lPMS464


Idan Horowitz <idan.horowitz@gmail.com> writes:

> Hey, I'm running a bare-metal image on QEMU 6.1 and I've encountered the =
following scenario:
> After receiving a data abort and mapping in the correct page I try to inv=
alidate the corresponding TLB entry using the following assembly
> sequence:
>
> dsb ish
> tlbi vaae1is, x0
> dsb sy
>
> Unfortunately this does not seem to have any immediate effect, as upon re=
turning back to the source of the exception I immediately hit
> the same Data Abort. This cycle of receiving a Data Abort and then updati=
ng the mapping continues for 100s of times, until the TLB finally
> updates to the correct mapping.
>
> As part of my testing I also tried to replace the Inner Shareable tlbi I =
showed above with the base version that only invalidates the current
> PE's TLB entry (tlbi vaae1, x0) this seemed to fix the issue, which made =
me suspect something was up with QEMU itself, as the inner
> shareable version of the instruction is supposed to invalidate the curren=
t PE's TLB entry as well as the others', so if the non-shareable
> version works the inner-shareable one should work as well.
>
> After digging a bit through the code I saw that the non-shareable version=
 calls 'tlb_flush_page_bits_by_mmuidx' which eventually calls
> 'tlb_flush_range_by_mmuidx_async_0' synchronously, while the inner-sharea=
ble version calls
> 'tlb_flush_page_bits_by_mmuidx_all_cpus_synced' which also eventually cal=
ls 'tlb_flush_range_by_mmuidx_async_0', but asynchronously
> this time.
>
> Moving on to the implementation of the DSB instruction I saw that it is t=
ranslated into an 'INDEX_op_mb' operation, but looking at the
> interpreter handling of that instruction, it simply performs a memory bar=
rier, it does not handle any of the async tasks in the work queue
> (at least explicitly) so from my (admittedly basic) understanding of the =
code it looks like QEMU's implementation of the DSB instruction
> does not wait until the TLB flush has finished, as required.

If we exit the translation block like the code for ISB does then that
will give a chance for all the queued work to complete. If we have done
a _synced call this includes bringing all vCPUs to a halt before
flushing and restarting.

> If anyone can point me in the right direction it would be greatly
> appreciated.

Try:

modified   target/arm/translate-a64.c
@@ -1553,6 +1553,7 @@ static void handle_sync(DisasContext *s, uint32_t ins=
n,
             break;
         }
         tcg_gen_mb(bar);
+        gen_goto_tb(s, 0, s->base.pc_next);
         return;
     case 6: /* ISB */

and see if that helps. I suspect do be efficient we should probably do
some more decode on the instruction to make that decision as ending a
block for every DMB/DSB might be overkill and impact performance.=20

I don't think we have a way to track pending state awaiting a DSB
instruction in the translator but in theory we could. I thought
(ri->type & ARM_CP_IO) for system registers would ensure an end of block
but apparently that is only for icount.

>
> Thanks, Idan Horowitz.


--=20
Alex Benn=C3=A9e
