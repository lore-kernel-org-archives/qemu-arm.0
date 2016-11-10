Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 71sm14237392wmo.7.2016.11.10.10.08.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Nov 2016 10:08:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 6E5783E0060;
	Thu, 10 Nov 2016 18:08:41 +0000 (GMT)
References: <20161109145748.27282-1-alex.bennee@linaro.org> <20161109145748.27282-16-alex.bennee@linaro.org> <23bbb76b-3009-373e-273e-b22e5a37a19b@twiddle.net>
User-agent: mu4e 0.9.17; emacs 25.1.50.16
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <rth@twiddle.net>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, mttcg@greensocs.com, fred.konrad@greensocs.com, a.rigo@virtualopensystems.com, cota@braap.org, bobby.prani@gmail.com, nikunj@linux.vnet.ibm.com, mark.burton@greensocs.com, jan.kiszka@siemens.com, serge.fdrv@gmail.com, peter.maydell@linaro.org, claudio.fontana@huawei.com, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v6 15/19] target-arm/cpu: don't reset TLB structures, use cputlb to do it
In-reply-to: <23bbb76b-3009-373e-273e-b22e5a37a19b@twiddle.net>
Date: Thu, 10 Nov 2016 18:08:41 +0000
Message-ID: <877f8b8axi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: awIDdJy2bwoa


Richard Henderson <rth@twiddle.net> writes:

> On 11/09/2016 03:57 PM, Alex Bennée wrote:
>> +#ifdef CONFIG_SOFTMMU
>> +    memset(env, 0, offsetof(CPUARMState, tlb_table));
>> +    tlb_flush(s, 0);
>> +#else
>>      memset(env, 0, offsetof(CPUARMState, features));
>> +#endif
>
> I'd really prefer to see the tlb_flush be moved into parent_reset, so that we
> handle it identically for all targets.

Yeah I'll prepare a series to do that separate from MTTCG.

>
> As for the memset, do we really need to distinguish softmmu?  I don't like you
> picking out a variable name within CPU_COMMON.  Better to use empty struct
> markers, like the
>
>        struct {} start_init_save;
>
> that x86 uses.

OK fair enough.

--
Alex Bennée
