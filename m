Bcc: qemu-ppc@nongnu.org
Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id n26sm3542490wmi.3.2016.07.14.06.15.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jul 2016 06:15:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id B23403E031D;
	Thu, 14 Jul 2016 14:15:57 +0100 (BST)
References: <1468354426-837-1-git-send-email-sergey.fedorov@linaro.org> <1468354426-837-7-git-send-email-sergey.fedorov@linaro.org> <87oa604bzf.fsf@linaro.org> <57878CFA.4060604@gmail.com>
User-agent: mu4e 0.9.17; emacs 25.0.95.9
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Cc: Sergey Fedorov <sergey.fedorov@linaro.org>, qemu-devel@nongnu.org, 
	mttcg@listserver.greensocs.com, fred.konrad@greensocs.com, 
	a.rigo@virtualopensystems.com, cota@braap.org, bobby.prani@gmail.com, 
	rth@twiddle.net, patches@linaro.org, mark.burton@greensocs.com, 
	pbonzini@redhat.com, jan.kiszka@siemens.com, peter.maydell@linaro.org, 
	claudio.fontana@huawei.com, Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>, 
	Michael Walle <michael@walle.cc>, Aurelien Jarno <aurelien@aurel32.net>, 
	Leon Alrae <leon.alrae@imgtec.com>, Anthony Green <green@moxielogic.com>, Jia Liu <proljc@gmail.com>, 
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Guan Xuetao <gxt@mprc.pku.edu.cn>, 
	Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, "u.org" <qemu-ppc@nongn>
Subject: Re: [PATCH v3 06/11] tcg: Introduce tb_mark_invalid() and tb_is_invalid()
In-reply-to: <57878CFA.4060604@gmail.com>
Date: Thu, 14 Jul 2016 14:15:57 +0100
Message-ID: <87furc4aya.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: puVVZZlWbXkX


Sergey Fedorov <serge.fdrv@gmail.com> writes:

> On 14/07/16 15:53, Alex Bennée wrote:
>> Sergey Fedorov <sergey.fedorov@linaro.org> writes:
>>
>>> From: Sergey Fedorov <serge.fdrv@gmail.com>
>>>
>>> These functions will be used to make translation block invalidation safe
>>> with concurrent lockless lookup in the global hash table.
>>>
>>> Most targets don't use 'cs_base'; so marking TB as invalid is as simple
>>> as assigning -1 to 'cs_base'. SPARC target stores the next program
>>> counter into 'cs_base', and -1 is a fine invalid value since PC must bet
>>> a multiple of 4 in SPARC. The only odd target is i386, for which a
>>> special flag is introduced in place of removed 'HF_SOFTMMU_MASK'.
>>>
>>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
>>> Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
>>> ---
>>>  include/exec/exec-all.h  | 10 ++++++++++
>>>  target-alpha/cpu.h       | 14 ++++++++++++++
>>>  target-arm/cpu.h         | 14 ++++++++++++++
>>>  target-cris/cpu.h        | 14 ++++++++++++++
>>>  target-i386/cpu.h        | 17 +++++++++++++++++
>>>  target-lm32/cpu.h        | 14 ++++++++++++++
>>>  target-m68k/cpu.h        | 14 ++++++++++++++
>>>  target-microblaze/cpu.h  | 14 ++++++++++++++
>>>  target-mips/cpu.h        | 14 ++++++++++++++
>>>  target-moxie/cpu.h       | 14 ++++++++++++++
>>>  target-openrisc/cpu.h    | 14 ++++++++++++++
>>>  target-ppc/cpu.h         | 14 ++++++++++++++
>>>  target-s390x/cpu.h       | 14 ++++++++++++++
>>>  target-sh4/cpu.h         | 14 ++++++++++++++
>>>  target-sparc/cpu.h       | 14 ++++++++++++++
>>>  target-sparc/translate.c |  1 +
>>>  target-tilegx/cpu.h      | 14 ++++++++++++++
>>>  target-tricore/cpu.h     | 14 ++++++++++++++
>>>  target-unicore32/cpu.h   | 14 ++++++++++++++
>>>  target-xtensa/cpu.h      | 14 ++++++++++++++
>>>  20 files changed, 266 insertions(+)
>>>
>>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>>> index db79ab65cebe..61cc3a1fb8f7 100644
>>> --- a/include/exec/exec-all.h
>>> +++ b/include/exec/exec-all.h
>>> @@ -256,6 +256,16 @@ void tb_free(TranslationBlock *tb);
>>>  void tb_flush(CPUState *cpu);
>>>  void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
>>>
>>> +static inline void tb_mark_invalid(TranslationBlock *tb)
>>> +{
>>> +    cpu_get_invalid_tb_cpu_state(&tb->pc, &tb->cs_base, &tb->flags);
>> Hmmm are we getting something here? Maybe cpu_tb_invalidate_cpu_state?
>
> Just to be similar to cpu_get_tb_cpu_state().

I guess if you squint just right. I'll drop the objection.

>
>>
>>> +}
>>> +
>>> +static inline bool tb_is_invalid(TranslationBlock *tb)
>>> +{
>>> +    return cpu_tb_cpu_state_is_invalidated(tb->pc, tb->cs_base, tb->flags);
>>> +}
>> Also why are we passing three pointers to parts of TranslationBlock? Why
>> not just pass tb directly and be done with it?
>
> I'm not sure we want to include exec/exec-all.h in target-*/cpu.h

Fair enough.

>
>>
>> I'm sure the compiler does something sensible but seems overly verbose
>> to me.
>>
>>> +
>>>  #if defined(USE_DIRECT_JUMP)
>>>
>>>  #if defined(CONFIG_TCG_INTERPRETER)
> (snip)
>> Otherwise:
>>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>
> Kind regards,
> Sergey


--
Alex Bennée
