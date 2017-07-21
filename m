Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id a3sm9701349wra.17.2017.07.21.02.58.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jul 2017 02:58:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 4B6933E0127;
	Fri, 21 Jul 2017 10:58:00 +0100 (BST)
References: <20170720150426.12393-1-alex.bennee@linaro.org> <20170720150426.12393-15-alex.bennee@linaro.org> <eb3454ed-4a7c-180b-a005-00557031cf60@twiddle.net>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <rth@twiddle.net>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH for 2.11 14/23] target/arm/translate-a64.c: add ARMv8.2 fadd scalar half-precision
In-reply-to: <eb3454ed-4a7c-180b-a005-00557031cf60@twiddle.net>
Date: Fri, 21 Jul 2017 10:58:00 +0100
Message-ID: <87r2xa6riv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: JKx38bTsVni0


Richard Henderson <rth@twiddle.net> writes:

> On 07/20/2017 05:04 AM, Alex Bennée wrote:
>> This brings in the initial decode skeleton and the helpers for a
>> scalar half-precision fadd using SoftFloat3c.
>>
>> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
>> ---
>>   target/arm/advsimd_helper.c | 15 ++++++++++++
>>   target/arm/translate-a64.c  | 60 +++++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 75 insertions(+)
>
> ... and there it is.  Squash this with previous?  Anyway, do something
> so that they're bisectable.

Yeah a re-basing failure on my part as I cleaned up the tree. It was
fairly messy by the time I got everything working ;-)

--
Alex Bennée
