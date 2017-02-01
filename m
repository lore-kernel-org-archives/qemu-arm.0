Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x135sm28049401wme.23.2017.01.31.23.44.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Jan 2017 23:44:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 468CD3E0192;
	Wed,  1 Feb 2017 07:44:23 +0000 (GMT)
References: <20170127103922.19658-1-alex.bennee@linaro.org> <20170127103922.19658-26-alex.bennee@linaro.org> <f15d91cd-e5b9-3dda-7afa-5b2a91b9e9d0@twiddle.net>
User-agent: mu4e 0.9.19; emacs 25.1.91.6
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <rth@twiddle.net>
Cc: mttcg@greensocs.com, qemu-devel@nongnu.org, fred.konrad@greensocs.com, a.rigo@virtualopensystems.com, cota@braap.org, bobby.prani@gmail.com, nikunj@linux.vnet.ibm.com, mark.burton@greensocs.com, pbonzini@redhat.com, jan.kiszka@siemens.com, serge.fdrv@gmail.com, peter.maydell@linaro.org, claudio.fontana@huawei.com, bamvor.zhangjian@linaro.org, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v8 25/25] tcg: enable MTTCG by default for ARM on x86 hosts
In-reply-to: <f15d91cd-e5b9-3dda-7afa-5b2a91b9e9d0@twiddle.net>
Date: Wed, 01 Feb 2017 07:44:23 +0000
Message-ID: <87h94e4ap4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: ++puL10Ge/7h


Richard Henderson <rth@twiddle.net> writes:

> On 01/27/2017 02:39 AM, Alex Bennée wrote:
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
>> +#define TCG_TARGET_DEFAULT_MO get_tcg_target_mo()
>> +
>
> Why the inline function?  The expression in the define would seem sufficient.
> Otherwise,

Good point. It was just to get around the definition at pre-processor and
compile time.

>
> Reviewed-by: Richard Henderson <rth@twiddle.net>
>
>
> r~


--
Alex Bennée
