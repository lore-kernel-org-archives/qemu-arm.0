Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id ya1sm36244087wjb.23.2016.10.15.02.55.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Oct 2016 02:55:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id E47A43E005D;
	Sat, 15 Oct 2016 10:55:16 +0100 (BST)
References: <20161014151336.31418-1-alex.bennee@linaro.org> <CAFEAcA8UQjMtfhV7i1kRQxF5vj-=pinJXX8CbHMrwTCdZrWJ=g@mail.gmail.com>
User-agent: mu4e 0.9.17; emacs 25.1.50.7
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [PATCH] target-arm/translate.c: fix movs pc,lr exception return on ARMv7
In-reply-to: <CAFEAcA8UQjMtfhV7i1kRQxF5vj-=pinJXX8CbHMrwTCdZrWJ=g@mail.gmail.com>
Date: Sat, 15 Oct 2016 10:55:16 +0100
Message-ID: <87mvi6ey2j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: cXfm7TGd/y3A


Peter Maydell <peter.maydell@linaro.org> writes:

> On 14 October 2016 at 16:13, Alex Bennée <alex.bennee@linaro.org> wrote:
>> This was broken by the fix for 9b6a3ea7a699594162ed3d11e4e04b98568dc5c0.
>> Specifically a movs pc,lr in the kernels ret_fast_syscall returning to
>> some thumb mode user space code but store_reg unconditionally aligned
>> the return PC instead of treating the return as an "interworking"
>> branch.
>>
>> I suspect we need to audit all calls to store_reg that might involve the
>> PC to ensure "interworking" branches are correctly handled. Also I'm not
>> quite sure how the code worked before 9b6a3e as the store_reg path
>> wouldn't have triggered the store_cpu_field(var, thumb) to set the
>> processor mode back to thumb.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>
> I think this is the wrong fix to the problem -- see the
> patch I sent a few days back.

Well at least my analysis of the problem was correct even if the
solution was too hacky. Your patch is obviously the better solution ;-)

For ref:

  [PATCH] Fix masking of PC lower bits when doing exception returns

>
> thanks
> -- PMM


--
Alex Bennée
