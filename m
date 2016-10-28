Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id q134sm7729275wme.3.2016.10.28.01.38.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Oct 2016 01:38:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 368F53E01C6;
	Fri, 28 Oct 2016 09:38:59 +0100 (BST)
References: <20161027151030.20863-1-alex.bennee@linaro.org> <20161027151030.20863-31-alex.bennee@linaro.org> <fa288bec-8178-590a-db42-abb4c6986db4@twiddle.net>
User-agent: mu4e 0.9.17; emacs 25.1.50.12
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <rth@twiddle.net>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, mttcg@greensocs.com, fred.konrad@greensocs.com, a.rigo@virtualopensystems.com, cota@braap.org, bobby.prani@gmail.com, nikunj@linux.vnet.ibm.com, mark.burton@greensocs.com, jan.kiszka@siemens.com, serge.fdrv@gmail.com, peter.maydell@linaro.org, claudio.fontana@huawei.com, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v5 30/33] target-arm/cpu: don't reset TLB structures, use cputlb to do it
In-reply-to: <fa288bec-8178-590a-db42-abb4c6986db4@twiddle.net>
Date: Fri, 28 Oct 2016 09:38:59 +0100
Message-ID: <87bmy498bg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: 0V09guAev4nL


Richard Henderson <rth@twiddle.net> writes:

> On 10/27/2016 08:10 AM, Alex Bennée wrote:
>> cputlb owns the TLB entries and knows how to safely update them in
>> MTTCG.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>  target-arm/cpu.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
>> index 1b9540e..ff8c594 100644
>> --- a/target-arm/cpu.c
>> +++ b/target-arm/cpu.c
>> @@ -121,7 +121,13 @@ static void arm_cpu_reset(CPUState *s)
>>
>>      acc->parent_reset(s);
>>
>> +#ifdef CONFIG_SOFTMMU
>> +    memset(env, 0, offsetof(CPUARMState, tlb_table));
>> +    tlb_flush(s, 0);
>> +#else
>>      memset(env, 0, offsetof(CPUARMState, features));
>> +#endif
>> +
>
> Why special case this for softmmu?

I didn't want to move cpu->features to the other side of CPU_COMMON in
cpu.h as there is an explicit statement about being reset. Adding
another variable just to be an endpoint of a memset also seemed
sub-optimal.

> And don't we (or if not, shouldn't we)
> handle the tlb_flush generically for reset?

Probably. tlb_flush seems to be one of those things liberally sprinkled
in the arch code for all sorts of things but certainly cpu_reset is one
we could make the call from generic code.

>
>
> r~


--
Alex Bennée
