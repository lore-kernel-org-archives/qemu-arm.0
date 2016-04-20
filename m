Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id q77sm9994676wmd.12.2016.04.20.07.40.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Apr 2016 07:40:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 590C23E0323;
	Wed, 20 Apr 2016 15:40:16 +0100 (BST)
References: <1460044433-19282-1-git-send-email-sergey.fedorov@linaro.org> <1460044433-19282-8-git-send-email-sergey.fedorov@linaro.org> <87lh48v203.fsf@linaro.org> <57179253.9040505@gmail.com>
User-agent: mu4e 0.9.17; emacs 25.0.92.6
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Cc: Sergey Fedorov <sergey.fedorov@linaro.org>, qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Peter Crosthwaite <crosthwaite.peter@gmail.com>, Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH 07/11] tcg/arm: Make direct jump patching thread-safe
In-reply-to: <57179253.9040505@gmail.com>
Date: Wed, 20 Apr 2016 15:40:16 +0100
Message-ID: <87fuuguywf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: cX1z+scrg2Q2


Sergey Fedorov <serge.fdrv@gmail.com> writes:

> On 20/04/16 16:33, Alex Bennée wrote:
>> Sergey Fedorov <sergey.fedorov@linaro.org> writes:
>>> diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c
>>> index 3edf6a6f971c..5c69de20bc69 100644
>>> --- a/tcg/arm/tcg-target.inc.c
>>> +++ b/tcg/arm/tcg-target.inc.c
>>> @@ -121,6 +121,13 @@ static inline void reloc_pc24(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
>>>      *code_ptr = (*code_ptr & ~0xffffff) | (offset & 0xffffff);
>>>  }
>>>
>>> +static inline void reloc_pc24_atomic(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
>>> +{
>>> +    ptrdiff_t offset = (tcg_ptr_byte_diff(target, code_ptr) - 8) >>
>>> 2;
>> This seems like something a tcg_debug_assert should be ensuring we don't overflow.
>
> Then we should probably put the same assert into reloc_pc24() as well.
>
>>
>>> +    tcg_insn_unit insn = atomic_read(code_ptr);
>> Don't we already know what the instruction should be or could there be
>> multiple ones?
>
> Actually, it is always what tcg_out_b_noaddr() generates. I'm not sure
> it's worthwhile to introduce tcg_out_b_atomic() or something similar
> here.

No I don't think so. It depends if the branch instruction is going to
have multiple potential conditions (so requiring the read) or always be
the same.

>
>>
>>> +    atomic_set(code_ptr, (insn & ~0xffffff) | (offset & 0xffffff));
>> Please use deposit32 to set the offset like the aarch64 code.
>
> Will do.
>
>>
>>> +}
>>> +
>>>  static void patch_reloc(tcg_insn_unit *code_ptr, int type,
>>>                          intptr_t value, intptr_t addend)
>>>  {
>>> @@ -1038,6 +1045,16 @@ static void tcg_out_call(TCGContext *s, tcg_insn_unit *addr)
>>>      }
>>>  }
>>>
>>> +void arm_tb_set_jmp_target(uintptr_t jmp_addr, uintptr_t addr)
>>> +{
>>> +    tcg_insn_unit *code_ptr = (tcg_insn_unit *)jmp_addr;
>>> +    tcg_insn_unit *target = (tcg_insn_unit *)addr;
>>> +
>>> +    /* we could use a ldr pc, [pc, #-4] kind of branch and avoid the
>>> flush */
>> So why don't we?
>
> I think because it's a bit more expensive to take this kind of branch.
> If we assume direct jumps are taken much more times than TB patching
> then it's preferable to optimize for direct jumps instead of for
> patching.

Looking again I see the comment came from code motion so I'm not overly
fussed its just comments like that always leave me hanging. "We could
...." and I want to know why we don't then ;-)

>
> Kind regards,
> Sergey
>
>>
>>> +    reloc_pc24_atomic(code_ptr, target);
>>> +    flush_icache_range(jmp_addr, jmp_addr + 4);
>>> +}
>>> +
>>>  static inline void tcg_out_goto_label(TCGContext *s, int cond, TCGLabel *l)
>>>  {
>>>      if (l->has_value) {
>>>


--
Alex Bennée
