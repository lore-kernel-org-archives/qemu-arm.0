Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id j6sm124406675wjk.25.2017.01.09.07.05.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Jan 2017 07:05:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 910983E008E;
	Mon,  9 Jan 2017 15:05:11 +0000 (GMT)
References: <20161215123656.27985-1-alex.bennee@linaro.org> <20161215123656.27985-2-alex.bennee@linaro.org> <20161218204624.GA3808@thinpad.lan.raisama.net>
User-agent: mu4e 0.9.19; emacs 25.1.91.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: rth@twiddle.net, qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Michael Walle <michael@walle.cc>, Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>, Yongbok Kim <yongbok.kim@imgtec.com>, Anthony Green <green@moxielogic.com>, Jia Liu <proljc@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, "open list\:ARM" <qemu-arm@nongnu.org>, "open list\:PowerPC" <qemu-ppc@nongnu.org>
Subject: Re: [PATCH v2 1/2] qom/cpu: move tlb_flush to cpu_common_reset
In-reply-to: <20161218204624.GA3808@thinpad.lan.raisama.net>
Date: Mon, 09 Jan 2017 15:05:11 +0000
Message-ID: <87tw98mfyw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: WK77i5ZsERy4


Eduardo Habkost <ehabkost@redhat.com> writes:

> On Thu, Dec 15, 2016 at 12:36:55PM +0000, Alex Bennée wrote:
>> It is a common thing amongst the various cpu reset functions want to
>> flush the SoftMMU's TLB entries. This is done either by calling
>> tlb_flush directly or by way of a general memset of the CPU
>> structure (sometimes both).
>>
>> This moves the tlb_flush call to the common reset function and
>> additionally ensures it is only done for the CONFIG_SOFTMMU case and
>> when tcg is enabled.
>>
>> In some target cases we add an empty end_of_reset_fields structure to the
>> target vCPU structure so have a clear end point for any memset which
>> is resetting value in the structure before CPU_COMMON (where the TLB
>> structures are).
>>
>> While this is a nice clean-up in general it is also a precursor for
>> changes coming to cputlb for MTTCG where the clearing of entries
>> can't be done arbitrarily across vCPUs. Currently the cpu_reset
>> function is usually called from the context of another vCPU as the
>> architectural power up sequence is run. By using the cputlb API
>> functions we can ensure the right behaviour in the future.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Reviewed-by: Richard Henderson <rth@twiddle.net>
>> ---
>>  qom/cpu.c                   | 10 ++++++++--
>>  target-arm/cpu.c            |  5 ++---
>>  target-arm/cpu.h            |  5 ++++-
>>  target-cris/cpu.c           |  3 +--
>>  target-cris/cpu.h           |  9 ++++++---
>>  target-i386/cpu.c           |  2 --
>>  target-i386/cpu.h           |  6 ++++--
>>  target-lm32/cpu.c           |  3 +--
>>  target-lm32/cpu.h           |  3 +++
>>  target-m68k/cpu.c           |  3 +--
>>  target-m68k/cpu.h           |  3 +++
>>  target-microblaze/cpu.c     |  3 +--
>>  target-microblaze/cpu.h     |  3 +++
>>  target-mips/cpu.c           |  3 +--
>>  target-mips/cpu.h           |  3 +++
>>  target-moxie/cpu.c          |  4 +---
>>  target-moxie/cpu.h          |  3 +++
>>  target-openrisc/cpu.c       |  9 +--------
>>  target-openrisc/cpu.h       |  3 +++
>>  target-ppc/translate_init.c |  3 ---
>>  target-s390x/cpu.c          |  7 ++-----
>>  target-s390x/cpu.h          |  5 +++--
>>  target-sh4/cpu.c            |  3 +--
>>  target-sh4/cpu.h            |  3 +++
>>  target-sparc/cpu.c          |  3 +--
>>  target-sparc/cpu.h          |  3 +++
>>  target-tilegx/cpu.c         |  3 +--
>>  target-tilegx/cpu.h         |  3 +++
>>  target-tricore/cpu.c        |  2 --
>>  29 files changed, 66 insertions(+), 52 deletions(-)
>>
>> diff --git a/qom/cpu.c b/qom/cpu.c
>> index 03d9190f8c..61ee0cb88c 100644
>> --- a/qom/cpu.c
>> +++ b/qom/cpu.c
>> @@ -270,8 +270,14 @@ static void cpu_common_reset(CPUState *cpu)
>>      cpu->exception_index = -1;
>>      cpu->crash_occurred = false;
>>
>> -    for (i = 0; i < TB_JMP_CACHE_SIZE; ++i) {
>> -        atomic_set(&cpu->tb_jmp_cache[i], NULL);
>> +    if (tcg_enabled()) {
>> +        for (i = 0; i < TB_JMP_CACHE_SIZE; ++i) {
>> +            atomic_set(&cpu->tb_jmp_cache[i], NULL);
>> +        }
>> +
>> +#ifdef CONFIG_SOFTMMU
>> +        tlb_flush(cpu, 0);
>> +#endif
>
> The patch is changing 3 things at the same time:
>
> 1) Moving the tb_jmp_cache reset inside if (tcg_enabled())

The tb_jump_cache only ever contains TranslationBlocks which are TCG
only. Any access outside of TCG would be confusing stuff.

> 2) Moving the tlb_flush() call to cpu_common_reset()

This is the main purpose of the patch.

> 3) Moving the tlb_flush() call inside if (tcg_enabled())
>
> Are we 100% sure there's no non-TCG looking looking at tlb_*
> fields or calling tlb_*() functions anywhere? Isn't it better to
> add the tcg_enabled() check in a separate patch?

The tlb_* functions are NOP in-lines for linux-user mode. Otherwise the
table is only accessed by generated SoftMMU code and the associated
helpers. AFAICT the KVM migration code uses the memory sub-system to
track the dirty state of pages so shouldn't be looking at those fields.

I seemed sensible to clean it up all in one patch, however I could split
it into two:

  1) move tlb_flush (with CONFIG_SOFTMMU) to qom/cpu.c
  2) wrap whole thing in tcg_enabled()

Would that be OK?

--
Alex Bennée
