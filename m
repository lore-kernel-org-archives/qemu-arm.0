Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id h14sm13072312wme.1.2016.06.06.01.55.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jun 2016 01:55:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 3F2533E0358;
	Mon,  6 Jun 2016 09:55:26 +0100 (BST)
User-agent: mu4e 0.9.17; emacs 25.0.94.5
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Cc: mttcg@listserver.greensocs.com, fred.konrad@greensocs.com, a.rigo@virtualopensystems.com, cota@braap.org, qemu-devel@nongnu.org, mark.burton@greensocs.com, pbonzini@redhat.com, jan.kiszka@siemens.com, rth@twiddle.net, peter.maydell@linaro.org, claudio.fontana@huawei.com, Peter Crosthwaite <crosthwaite.peter@gmail.com>, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [RFC v1 10/12] arm: use tlb_flush_page_all for tlbimva[a]
In-reply-to: <5754594A.10304@gmail.com>
Date: Mon, 06 Jun 2016 09:55:26 +0100
Message-ID: <87fusqitmp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: g+ca5NaSu785


Sergey Fedorov <serge.fdrv@gmail.com> writes:

> On 15/04/16 17:23, Alex Bennée wrote:
>> From: KONRAD Frederic <fred.konrad@greensocs.com>
>>
>> Instead of flushing each individual vCPU use the tlb_flush_page_all
>> functions which is async enabled for MTTCG.
>>
>> Signed-off-by: KONRAD Frederic <fred.konrad@greensocs.com>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>  include/exec/exec-all.h |  3 +++
>>  target-arm/helper.c     | 12 ++----------
>>  2 files changed, 5 insertions(+), 10 deletions(-)
>>
>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>> index 858055b..bc97683 100644
>> --- a/include/exec/exec-all.h
>> +++ b/include/exec/exec-all.h
>> @@ -208,6 +208,9 @@ static inline void tlb_flush_page_by_mmuidx(CPUState *cpu,
>>  static inline void tlb_flush_by_mmuidx(CPUState *cpu, ...)
>>  {
>>  }
>> +static inline void tlb_flush_page_all(target_ulong addr)
>> +{
>> +}
>
> This change belongs to the patch which introduced the function.

Thanks, will fix.

>
> Kind regards,
> Sergey
>
>>  #endif
>>
>>  #define CODE_GEN_ALIGN           16 /* must be >= of the size of a icache line */
>> diff --git a/target-arm/helper.c b/target-arm/helper.c
>> index 19d5d52..bc9fbda 100644
>> --- a/target-arm/helper.c
>> +++ b/target-arm/helper.c
>> @@ -554,21 +554,13 @@ static void tlbiasid_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>>  static void tlbimva_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>>                               uint64_t value)
>>  {
>> -    CPUState *other_cs;
>> -
>> -    CPU_FOREACH(other_cs) {
>> -        tlb_flush_page(other_cs, value & TARGET_PAGE_MASK);
>> -    }
>> +    tlb_flush_page_all(value & TARGET_PAGE_MASK);
>>  }
>>
>>  static void tlbimvaa_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>>                               uint64_t value)
>>  {
>> -    CPUState *other_cs;
>> -
>> -    CPU_FOREACH(other_cs) {
>> -        tlb_flush_page(other_cs, value & TARGET_PAGE_MASK);
>> -    }
>> +    tlb_flush_page_all(value & TARGET_PAGE_MASK);
>>  }
>>
>>  static const ARMCPRegInfo cp_reginfo[] = {


--
Alex Bennée
