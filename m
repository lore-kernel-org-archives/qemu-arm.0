Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id y65sm4813305wmb.5.2017.01.27.09.07.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Jan 2017 09:07:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id A9E2A3E008E;
	Fri, 27 Jan 2017 17:07:33 +0000 (GMT)
References: <20170127103505.18606-1-alex.bennee@linaro.org> <20170127103505.18606-26-alex.bennee@linaro.org> <CAJhHMCDAf8UqjO6m5RM3Hasdsf4_1FPnqibtRwYkips48tQCvw@mail.gmail.com>
User-agent: mu4e 0.9.19; emacs 25.1.91.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pranith Kumar <bobby.prani+qemu@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, "open list\:ARM" <qemu-arm@nongnu.org>, "open list\:All patches CC here" <qemu-devel@nongnu.org>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [PATCH v8 25/25] tcg: enable MTTCG by default for ARM on x86 hosts
In-reply-to: <CAJhHMCDAf8UqjO6m5RM3Hasdsf4_1FPnqibtRwYkips48tQCvw@mail.gmail.com>
Date: Fri, 27 Jan 2017 17:07:33 +0000
Message-ID: <87k29g8m96.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: mkC3Bglnbxbw


Pranith Kumar <bobby.prani+qemu@gmail.com> writes:

> On Fri, Jan 27, 2017 at 5:35 AM, Alex Bennée <alex.bennee@linaro.org> wrote:
>
>> diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
>> index 21d96ec35c..536190f647 100644
>> --- a/tcg/i386/tcg-target.h
>> +++ b/tcg/i386/tcg-target.h
>> @@ -165,4 +165,20 @@ static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
>>  {
>>  }
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
> s/TCG_MO_LD_ST/TCG_MO_ST_LD/?

Doh - sorry I missed that. Will fix this time ;-)

>
> Thanks,


--
Alex Bennée
