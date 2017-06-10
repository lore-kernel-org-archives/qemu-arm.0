Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id e73sm2288763wmd.1.2017.06.10.01.50.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 10 Jun 2017 01:50:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id ED9D13E01DF;
	Sat, 10 Jun 2017 09:51:26 +0100 (BST)
References: <20170609170100.3599-1-alex.bennee@linaro.org> <20170609170100.3599-4-alex.bennee@linaro.org> <fc351edb-7c08-c341-d8ee-85f6768e4931@twiddle.net>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <rth@twiddle.net>
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, edgar.iglesias@xilinx.com, cota@braap.org, qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [RFC DEBUG PATCH 3/3] translate-a64: fix lookup_tb_ptr hang (DEBUG!)
In-reply-to: <fc351edb-7c08-c341-d8ee-85f6768e4931@twiddle.net>
Date: Sat, 10 Jun 2017 09:51:26 +0100
Message-ID: <87vao4b4z5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: KDqQPpW2mZcR


Richard Henderson <rth@twiddle.net> writes:

> On 06/09/2017 10:01 AM, Alex Bennée wrote:
>> THIS IS A DEBUG PATCH DO NOT MERGE
>>
>> I include all the comments to show my working. I was trying to
>> isolate which instructions cause the problem. It turns out it is the
>> RET instruction. I don't understand why because AFAICT it is a
>> pretty much a BR instruction.
>
> Yeah, same thing for Alpha.
>
> It has been my guess that not chaining through RET means that we get
> back to the main loop regularly and often, letting interrupts be
> recognized in a timely manner.
>
> I can't figure out why that would be, however, since interrupts
> *ought* to be setting icount_decr, and the TB to which we chain *is*
> checking that to return to the main loop.

Indeed - if that was broken a lot more stuff wouldn't work.

> Since changing the timing affects the outcome (e.g. -d exec), it
> follows that this *must* be some sort of race condition.  But since
> this still happens with single-threaded mode, I can't imagine what
> sort of race condition it might be.

Apart from timer expiry I can't think what other interactions the other
threads have on the main TCG thread. I guess there is IO but my test
hangs way before the kernel starts poking the disk. Is there an
interaction between IRQs and QEMU's serial driver?

>
> More data points.  I removed the tb_htable_lookup, and that by itself
> is enough to fix Alpha booting.  But it doesn't help the aarch64
> kernel+image that I have.  Which does still boot with -d nochain
> (which, along with disabling goto_tb chaining, also disables all
> goto_ptr).

I wonder what is different about your aarch64 image and mine then?
Because mine works just with suppressing the chaining for RET.

>
> Not really sure where to go from here.

I would agree with Emilio that we revert but I can't quite shake the
feeling we are missing an underlying problem. Would just skipping the
htable lookup (but keeping the tb_jmp_cache) be an OK fix for now? Have
we just been lucky that whatever mechanism causes the "hang" wasn't due
to?

>
>
> r~


--
Alex Bennée
