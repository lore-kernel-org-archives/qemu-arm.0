Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id i64sm15472514wmd.33.2017.06.14.05.35.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Jun 2017 05:35:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id B231C3E009E;
	Wed, 14 Jun 2017 13:35:35 +0100 (BST)
References: <20170609170100.3599-1-alex.bennee@linaro.org> <20170609170100.3599-4-alex.bennee@linaro.org> <fc351edb-7c08-c341-d8ee-85f6768e4931@twiddle.net> <87vao4b4z5.fsf@linaro.org> <9776b437-90b4-f2c2-4a0c-c1c6585379bf@twiddle.net> <20170611050730.GA12317@flamenco> <20170613225352.GA26288@flamenco> <db800d74-7cfa-d9e3-60d7-3e7b19565b9b@twiddle.net> <5036e9ad-257a-b098-5093-050fca825627@redhat.com> <87r2ymiyht.fsf@linaro.org> <9c7ea148-2ca7-ec56-48ed-eabac0fe7896@redhat.com> <87poe6ix5u.fsf@linaro.org> <f185840b-5390-7df7-2450-f846f6af8a84@redhat.com>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>, "Emilio G. Cota" <cota@braap.org>, peter.maydell@linaro.org, edgar.iglesias@xilinx.com, qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH] target/aarch64: exit to main loop after handling MSR
In-reply-to: <f185840b-5390-7df7-2450-f846f6af8a84@redhat.com>
Date: Wed, 14 Jun 2017 13:35:35 +0100
Message-ID: <87o9tqiw6g.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: UyuKisNjt/G+


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 14/06/2017 14:14, Alex Bennée wrote:
>>> Then Emilio's patch, if a bit of a heavy hammer, is correct. After
>>> aa64_daif_write needs you need an exit_tb so that arm_cpu_exec_interrupt
>>> is executed again.
>>
>> This is a case of cpu->interrupt_request being pending but not having
>> set cpu->icount_decr yet to signal the exit.
>
> Rather than "yet", "anymore".  So far it has always been an invariant
> that anything that re-enabled an interrupt had to do exit_tb.
>
>> Wouldn't another approach
>> (that didn't involve futzing with each front-end) to be to check
>> cpu->interrupt_request and force the exit in lookup_tb_ptr?
>
> That would cause an unnecessary slowdown in code that runs with
> interrupts disabled but does a lot of indirect jumps...  ppc's SLOF
> firmware probably qualifies.

Really? I'd have to measure the change it makes. Is there a benchmark
stanza for measuring the PPC slof firmware time?

I have 3 patches now which all fix the same thing so we can pick and
choose which we should apply. Patches incoming...

--
Alex Bennée
