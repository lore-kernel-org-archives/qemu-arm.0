Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v143sm10346286wmv.4.2016.04.21.08.45.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Apr 2016 08:45:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 0F3863E00A6;
	Thu, 21 Apr 2016 16:45:47 +0100 (BST)
References: <1461186921-14977-1-git-send-email-sergey.fedorov@linaro.org> <1461186921-14977-10-git-send-email-sergey.fedorov@linaro.org> <87y487t80x.fsf@linaro.org> <5718ED04.5080403@gmail.com>
User-agent: mu4e 0.9.17; emacs 25.0.92.6
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Cc: Sergey Fedorov <sergey.fedorov@linaro.org>, qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Peter Crosthwaite <crosthwaite.peter@gmail.com>, Richard Henderson <rth@twiddle.net>, Peter Maydell <peter.maydell@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@suse.de>, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 09/10] tcg: Clean up direct block chaining safety checks
In-reply-to: <5718ED04.5080403@gmail.com>
Date: Thu, 21 Apr 2016 16:45:47 +0100
Message-ID: <87vb3bt178.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: Xk4lGiOoT+aI


Sergey Fedorov <serge.fdrv@gmail.com> writes:

> On 21/04/16 16:18, Alex Bennée wrote:
>> Sergey Fedorov <sergey.fedorov@linaro.org> writes:
>>> diff --git a/cpu-exec.c b/cpu-exec.c
>>> index bbfcbfb54385..065cc9159477 100644
>>> --- a/cpu-exec.c
>>> +++ b/cpu-exec.c
>>> @@ -508,11 +508,8 @@ int cpu_exec(CPUState *cpu)
>>>                      next_tb = 0;
>>>                      tcg_ctx.tb_ctx.tb_invalidated_flag = 0;
>>>                  }
>>> -                /* see if we can patch the calling TB. When the TB
>>> -                   spans two pages, we cannot safely do a direct
>>> -                   jump. */
>>> -                if (next_tb != 0 && tb->page_addr[1] == -1
>>> -                    && !qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
>>> +                /* See if we can patch the calling TB. */
>>> +                if (next_tb != 0 &&
>>> !qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
>> A pointer to the definitive comment helps ;-)
>>
>>                 /* See if we can patch the calling TB, see tcg_gen_goto_tb */
>
> I'm not so sure that the comment for tcg_gen_goto_tb() would be of much
> use here. Actually, what we check here is if we know the calling TB
> (what is called 'next_tb' here so far) and if logging settings don't
> forbid us to chain TBs. The note in the comment for tcg_gen_goto_tb() is
> all about when goto_tb TCG ops can be emitted by the target translation
> code, not so relevant here, I suppose.

True, it makes more sense on the following patches. It's not a major
thing.

>
> Kind regards,
> Sergey
>
>>
>>>                      tb_add_jump((TranslationBlock *)(next_tb & ~TB_EXIT_MASK),
>>>                                  next_tb & TB_EXIT_MASK, tb);
>>>                  }
> (snip)
>>> diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
>>> index c446d3dc7293..ace39619ef89 100644
>>> --- a/tcg/tcg-op.h
>>> +++ b/tcg/tcg-op.h
>>> @@ -753,6 +753,16 @@ static inline void tcg_gen_exit_tb(uintptr_t val)
>>>      tcg_gen_op1i(INDEX_op_exit_tb, val);
>>>  }
>>>
>>> +/**
>>> + * tcg_gen_goto_tb() - output goto_tb TCG operation
>>> + * @idx: Direct jump slot index (0 or 1)
>>> + *
>>> + * See tcg/README for more info about this TCG operation.
>>> + *
>>> + * NOTE: Direct jumps with goto_tb are only safe within the pages this TB
>>> + * resides in because we don't take care of direct jumps when address mapping
>>> + * changes, e.g. in tlb_flush().
>>> + */
>>>  void tcg_gen_goto_tb(unsigned idx);
>>>
>>>  #if TARGET_LONG_BITS == 32


--
Alex Bennée
