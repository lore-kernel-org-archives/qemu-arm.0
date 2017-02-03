Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id a13sm2539194wma.13.2017.02.03.03.30.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Feb 2017 03:30:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 25D683E00E9;
	Fri,  3 Feb 2017 11:30:12 +0000 (GMT)
References: <20170201150553.9381-1-alex.bennee@linaro.org> <20170201150553.9381-22-alex.bennee@linaro.org> <CAFEAcA_TviTHP-WkppW342wSHRMHX8P9wqGd1UA6bdLG6n8_oQ@mail.gmail.com>
User-agent: mu4e 0.9.19; emacs 25.1.91.7
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: MTTCG Devel <mttcg@listserver.greensocs.com>, QEMU Developers
 <qemu-devel@nongnu.org>, KONRAD =?utf-8?B?RnLDqWTDqXJpYw==?=
 <fred.konrad@greensocs.com>, Alvise Rigo <a.rigo@virtualopensystems.com>,
 "Emilio G. Cota" <cota@braap.org>, Pranith Kumar <bobby.prani@gmail.com>,
 Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, Mark Burton
 <mark.burton@greensocs.com>, Paolo Bonzini <pbonzini@redhat.com>, Jan
 Kiszka <jan.kiszka@siemens.com>, Fedorov Sergey <serge.fdrv@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Bamvor Zhang Jian
 <bamvor.zhangjian@linaro.org>, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v9 21/25] target-arm: don't generate WFE/YIELD calls for MTTCG
In-reply-to: <CAFEAcA_TviTHP-WkppW342wSHRMHX8P9wqGd1UA6bdLG6n8_oQ@mail.gmail.com>
Date: Fri, 03 Feb 2017 11:30:12 +0000
Message-ID: <87tw8bfr5n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: 8HA6aNENxDYM


Peter Maydell <peter.maydell@linaro.org> writes:

> On 1 February 2017 at 15:05, Alex Bennée <alex.bennee@linaro.org> wrote:
>> The WFE and YIELD instructions are really only hints and in TCG's case
>> they were useful to move the scheduling on from one vCPU to the next. In
>> the parallel context (MTTCG) this just causes an unnecessary cpu_exit
>> and contention of the BQL.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Reviewed-by: Richard Henderson <rth@twiddle.net>
>> ---
>>  target/arm/op_helper.c     |  7 +++++++
>>  target/arm/translate-a64.c |  8 ++++++--
>>  target/arm/translate.c     | 20 ++++++++++++++++----
>>  3 files changed, 29 insertions(+), 6 deletions(-)
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> though I'm not much of a fan of yet another global variable :-(

It's unfortunate but I think justified in the case. parallel_cpus is a
global state that controls the emission of barriers and generation of
atomics. It does sometime get turned off for the EXCP_ATOMIC processing
(but only in a temporary exclusive region).

>
> thanks
> -- PMM


--
Alex Bennée
