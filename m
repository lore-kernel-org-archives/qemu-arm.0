Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id f45sm22837388wrf.2.2017.07.10.11.28.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 11:28:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 0B75E3E0157;
	Mon, 10 Jul 2017 19:28:34 +0100 (BST)
References: <20170710142850.10468-1-alex.bennee@linaro.org> <1e34d387-753b-14ff-dcc0-226515ff0124@twiddle.net>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <rth@twiddle.net>
Cc: peter.maydell@linaro.org, bobby.prani@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [RFC PATCH] include/exec/cpu-defs.h: try and make SoftMMU page size match target
In-reply-to: <1e34d387-753b-14ff-dcc0-226515ff0124@twiddle.net>
Date: Mon, 10 Jul 2017 19:28:34 +0100
Message-ID: <87o9ss9mel.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: hgGdljVqWuJz


Richard Henderson <rth@twiddle.net> writes:

> On 07/10/2017 04:28 AM, Alex Bennée wrote:
>> While the SoftMMU is not emulating the target MMU of a system there is
>> a relationship between its page size and that of the target. If the
>> target MMU is full featured the functions called to re-fill the
>> entries in the SoftMMU entries start moving up the perf profiles. If
>> we can we should try and prevent too much thrashing around by having
>> the page sizes the same.
>
> What you are changing has absolutely nothing to do with page size.
> Mentioning page sizes just confuses the issue.
>
> What you're changing is the number of entries in the TLB, and the
> mapping between pages and TLB entries.  And I'm quite certain that you
> saw a performance increase by increasing the size of the TLB.

You are quite right, I'm going to claim Monday brain on the commit text.

There is some relationship though as the index into the SoftMMU TLB is a
product of the target page number masked by the total number of SoftMMU
TLB entries we have. By increasing the SoftMMU TLB size we reduce the
number of aliased target pages for any given SoftMMU entry.

I guess to have a better understanding of the slow-path fill patterns we
would want to have an idea of which entries are getting re-filled more
often and if there is an even distribution over the TLB?

>
>
>>   #define CPU_TLB_BITS                                             \
>> -    MIN(8,                                                       \
>> +    MIN(10,                                                      \
>
> You will find this has broken tcg/arm, because the operand to an armv6
> AND (immediate) instruction is only 8 bits.
>
> I will grant you that we could do a better job of configuring this
> across the tcg backends.
>
> It also possibly warrants some work in the tcg/arm backend so that
> armv7 makes use of UBFX so that not-ancient arm is not so constrained.

I think Pranith is going to take this forward with a patch set to expand
the SoftMMU TLB to the maximum supported by whichever the backend can
do.

--
Alex Bennée
