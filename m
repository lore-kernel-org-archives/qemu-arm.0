Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d14sm28999234wmd.19.2017.02.01.03.03.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Feb 2017 03:03:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 00E353E07AE;
	Wed,  1 Feb 2017 11:03:20 +0000 (GMT)
References: <20170127103922.19658-1-alex.bennee@linaro.org> <20170127103922.19658-17-alex.bennee@linaro.org> <70fe24bb-c8f1-43c4-010f-a682bdd507ef@twiddle.net>
User-agent: mu4e 0.9.19; emacs 25.1.91.6
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <rth@twiddle.net>
Cc: mttcg@greensocs.com, qemu-devel@nongnu.org, fred.konrad@greensocs.com, a.rigo@virtualopensystems.com, cota@braap.org, bobby.prani@gmail.com, nikunj@linux.vnet.ibm.com, mark.burton@greensocs.com, pbonzini@redhat.com, jan.kiszka@siemens.com, serge.fdrv@gmail.com, peter.maydell@linaro.org, claudio.fontana@huawei.com, bamvor.zhangjian@linaro.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v8 16/25] cputlb and arm/sparc targets: convert mmuidx flushes from varg to bitmap
In-reply-to: <70fe24bb-c8f1-43c4-010f-a682bdd507ef@twiddle.net>
Date: Wed, 01 Feb 2017 11:03:19 +0000
Message-ID: <87efzi41hk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: zjcNsjE9eQ4i


Richard Henderson <rth@twiddle.net> writes:

> On 01/27/2017 02:39 AM, Alex Bennée wrote:
>> +    for (mmu_idx = 0; mmu_idx < NB_MMU_MODES; mmu_idx++) {
>>
>> -        tlb_debug("%d\n", mmu_idx);
>> +        if (test_bit(mmu_idx, &mmu_idx_bitmask)) {
>> +            tlb_debug("%d\n", mmu_idx);
>>
>> -        memset(env->tlb_table[mmu_idx], -1, sizeof(env->tlb_table[0]));
>> -        memset(env->tlb_v_table[mmu_idx], -1, sizeof(env->tlb_v_table[0]));
>> +            memset(env->tlb_table[mmu_idx], -1, sizeof(env->tlb_table[0]));
>> +            memset(env->tlb_v_table[mmu_idx], -1, sizeof(env->tlb_v_table[0]));
>> +        }
>
> Perhaps it doesn't matter since NB_MMU_MODES is so small but
>
>    for (; idxmap != 0; idxmap &= idxmap - 1) {
>      int mmu_idx = ctz32(idxmap);
>      ...
>    }

Perhaps but if it is OK with you I'll skip this optimisation for now? We
are basically in the slow path by this point and for clarity I'd prefer
to keep it as is.

--
Alex Bennée
