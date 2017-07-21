Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id j28sm7990576wrb.9.2017.07.21.02.32.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jul 2017 02:32:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 13B3C3E0127;
	Fri, 21 Jul 2017 10:32:49 +0100 (BST)
References: <20170720150426.12393-1-alex.bennee@linaro.org> <20170720150426.12393-6-alex.bennee@linaro.org> <71a11f23-39e7-d89a-36d5-2870ed76d940@twiddle.net>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <rth@twiddle.net>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [RFC PATCH for 2.11 05/23] softfloat3c: initial build machinery
In-reply-to: <71a11f23-39e7-d89a-36d5-2870ed76d940@twiddle.net>
Date: Fri, 21 Jul 2017 10:32:49 +0100
Message-ID: <87y3ri6sou.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: uu7wdYzx+98c


Richard Henderson <rth@twiddle.net> writes:

> On 07/20/2017 05:04 AM, Alex Bennée wrote:
>> +# so they can still be linked when needed. We build these files surpressing so of the normal CFLAGS.
>
> "surpressing so" -> "suppressing some"
>
> Do we gain any confidence for our still supported but less tested
> 32-bit hosts (all of which do support a 64-bit type) by dropping the
> FAST_INT64 distinction?

I guess so. Certainly I can cross-compile aarch64-softmmu on armhf
defining all the:

  softfloat3_fastint64="yes"
  softfloat3_fastdiv32to16="yes"
  softfloat3_fastdiv64to32="yes"

without any issue. I guess it might mean our 32 bit guests might run
slightly slower but none of our FP is fast anyway.

There is also a slight intermingling in the build setup between the
FASTINT64 and the specialisation even though there are for different
things.

The 8086 code basically makes NaN propagation match old x86 whereas SSE
is the more recent and more IEEE like SSE behaviour. See section 5 of:

  http://www.jhauser.us/arithmetic/SoftFloat-3c/doc/SoftFloat-source.html

I suspect what we should have here are specialisation for each of our
guests. We do something similar in the softfloat2a code in it's
specialise header. Maybe we should rename 8086-SSE to default and then
create a specialisation for each guest that needs it?

>
>> -#ifdef __GNUC_STDC_INLINE__
>> -#define INLINE inline
>> -#else
>> -#define INLINE extern inline
>
> Why are you removing this?

I was having compile issues I think because it was defaulting to extern
inline which was breaking given all the inline functions are defined in
the header. Having re-read the docs for __GNUC_STDC_INLINE__ though it
must have been for one of the more esoteric compile targets as that
should be defined for our default C99 compile?

--
Alex Bennée
