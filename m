Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id e73sm16359741wmd.1.2017.06.14.04.44.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Jun 2017 04:45:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 8D0823E009F;
	Wed, 14 Jun 2017 12:45:34 +0100 (BST)
References: <20170609170100.3599-1-alex.bennee@linaro.org> <20170609170100.3599-4-alex.bennee@linaro.org> <fc351edb-7c08-c341-d8ee-85f6768e4931@twiddle.net> <87vao4b4z5.fsf@linaro.org> <9776b437-90b4-f2c2-4a0c-c1c6585379bf@twiddle.net> <20170611050730.GA12317@flamenco> <20170613225352.GA26288@flamenco> <db800d74-7cfa-d9e3-60d7-3e7b19565b9b@twiddle.net> <5036e9ad-257a-b098-5093-050fca825627@redhat.com>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>, "Emilio G. Cota" <cota@braap.org>, peter.maydell@linaro.org, edgar.iglesias@xilinx.com, qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH] target/aarch64: exit to main loop after handling MSR
In-reply-to: <5036e9ad-257a-b098-5093-050fca825627@redhat.com>
Date: Wed, 14 Jun 2017 12:45:34 +0100
Message-ID: <87r2ymiyht.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: GQLurqxQFM07


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 14/06/2017 06:48, Richard Henderson wrote:
>>>
>>> Commit e75449a3 ("target/aarch64: optimize indirect branches") causes
>>> a regression by which aarch64 guests freeze under TCG with -smp > 1,
>>> even with `-accel accel=tcg,thread=single' (i.e. MTTCG disabled).
>>>
>>> I isolated the problem to the MSR handler. This patch forces an exit
>>> after the handler is executed, which fixes the regression.
>>
>> Why would that be?  The cpu_get_tb_cpu_state within helper_lookup_tb_ptr
>> is supposed to read the new state that the msr handler would have
>> installed.
>
> Could some of these cause an interrupt, or some other change in the
> cpu_exec flow?

Well what I was observing was the secondary_start_kernel stalling and
leaving the main cpu spinning. The msr is actually:

	local_irq_enable();
	local_fiq_enable();

Which I assume would re-enable IRQs if they are ready to go. However I
guess if we sink into our cpu_idle without exiting the main loop we
never set any pending IRQs?

>
> Thanks,
>
> Paolo


--
Alex Bennée
