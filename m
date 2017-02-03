Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id q1sm2716627wmd.6.2017.02.03.04.07.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Feb 2017 04:07:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 50DE43E0126;
	Fri,  3 Feb 2017 12:07:39 +0000 (GMT)
References: <20170201150553.9381-1-alex.bennee@linaro.org> <20170201150553.9381-26-alex.bennee@linaro.org> <CAFEAcA8nAQy4NNZ0RG0wOJ6rQoKz54UN22Z9LL2o2EgMdtpObQ@mail.gmail.com>
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
 <bamvor.zhangjian@linaro.org>, Peter Crosthwaite
 <crosthwaite.peter@gmail.com>, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v9 25/25] tcg: enable MTTCG by default for ARM on x86 hosts
In-reply-to: <CAFEAcA8nAQy4NNZ0RG0wOJ6rQoKz54UN22Z9LL2o2EgMdtpObQ@mail.gmail.com>
Date: Fri, 03 Feb 2017 12:07:39 +0000
Message-ID: <87r33ffpf8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: zNdvmxtXSM4a


Peter Maydell <peter.maydell@linaro.org> writes:

> On 1 February 2017 at 15:05, Alex Bennée <alex.bennee@linaro.org> wrote:
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
>
>> diff --git a/cpus.c b/cpus.c
>> index e3d9f3fe21..e1b82bcd49 100644
>> --- a/cpus.c
>> +++ b/cpus.c
>> @@ -176,8 +176,8 @@ bool mttcg_enabled;
>>
>>  static bool check_tcg_memory_orders_compatible(void)
>>  {
>> -#if defined(TCG_DEFAULT_MO) && defined(TCG_TARGET_DEFAULT_MO)
>> -    return (TCG_DEFAULT_MO & ~TCG_TARGET_DEFAULT_MO) == 0;
>> +#if defined(TCG_GUEST_DEFAULT_MO) && defined(TCG_TARGET_DEFAULT_MO)
>> +    return (TCG_GUEST_DEFAULT_MO & ~TCG_TARGET_DEFAULT_MO) == 0;
>
> This looks like maybe something that should have been squashed
> into an earlier part of the patchset?

Good catch. I shall fix that up.

>
>>  #else
>>      return false;
>>  #endif
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index a3c4d07817..0ef31db3e0 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -30,6 +30,9 @@
>>  #  define TARGET_LONG_BITS 32
>>  #endif
>>
>> +/* ARM processors have a weak memory model */
>> +#define TCG_GUEST_DEFAULT_MO      (0)
>
> Do you need the () ?
>
>
> That said, if Richard is happy with turning this on then
> I'm happy to do so.
>
> Acked-by: Peter Maydell <peter.maydell@linaro.org>
>
> thanks
> -- PMM


--
Alex Bennée
