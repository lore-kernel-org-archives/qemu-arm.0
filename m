Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l140sm5294920wmg.12.2017.01.20.02.53.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jan 2017 02:53:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 30D353E0133;
	Fri, 20 Jan 2017 10:53:35 +0000 (GMT)
References: <20170119170507.16185-1-alex.bennee@linaro.org> <20170119170507.16185-27-alex.bennee@linaro.org> <87a8amr3sj.fsf@gmail.com>
User-agent: mu4e 0.9.19; emacs 25.1.91.2
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pranith Kumar <bobby.prani@gmail.com>
Cc: mttcg@listserver.greensocs.com, qemu-devel@nongnu.org, fred.konrad@greensocs.com, a.rigo@virtualopensystems.com, cota@braap.org, nikunj@linux.vnet.ibm.com, mark.burton@greensocs.com, pbonzini@redhat.com, jan.kiszka@siemens.com, serge.fdrv@gmail.com, rth@twiddle.net, peter.maydell@linaro.org, claudio.fontana@huawei.com, bamvor.zhangjian@linaro.org, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v7 26/27] tcg: enable MTTCG by default for ARM on x86 hosts
In-reply-to: <87a8amr3sj.fsf@gmail.com>
Date: Fri, 20 Jan 2017 10:53:35 +0000
Message-ID: <87r33ydmts.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: i9YTXQ6xBE2C


Pranith Kumar <bobby.prani@gmail.com> writes:

> Alex Bennée writes:
>
>> This enables the multi-threaded system emulation by default for ARMv7
>> and ARMv8 guests using the x86_64 TCG backend. This is because on the
>> guest side:
>>
>>   - The ARM translate.c/translate-64.c have been converted to
>>     - use MTTCG safe atomic primitives
>>     - emit the appropriate barrier ops
>>   - The ARM machine has been updated to
>>     - hold the BQL when modifying shared cross-vCPU state
>>     - defer cpu_reset to async safe work
>>
>> All the host backends support the barrier and atomic primitives but
>> need to provide same-or-better support for normal load/store
>> operations.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>
> <snip>
>
>>
>> +/* This defines the natural memory order supported by this
>> + * architecture before guarantees made by various barrier
>> + * instructions.
>> + *
>> + * The x86 has a pretty strong memory ordering which only really
>> + * allows for some stores to be re-ordered after loads.
>> + */
>> +#include "tcg-mo.h"
>> +
>> +static inline int get_tcg_target_mo(void)
>> +{
>> +    return TCG_MO_ALL & ~TCG_MO_LD_ST;
>> +}
>> +
>
> Shouldn't this be TCG_MO_ALL & ~TCG_MO_ST_LD?

The case that x86 doesn't handle normally is store-after-load which is
what I assumed TCG_MO_LD_ST was. Perhaps we need some better comments
for each of the enums?

>
> Thanks,


--
Alex Bennée
