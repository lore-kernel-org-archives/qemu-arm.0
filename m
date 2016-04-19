Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id u16sm4770521wmd.5.2016.04.19.07.53.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Apr 2016 07:53:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 454823E0312;
	Tue, 19 Apr 2016 15:53:17 +0100 (BST)
References: <1460324732-30330-1-git-send-email-sergey.fedorov@linaro.org> <1460324732-30330-10-git-send-email-sergey.fedorov@linaro.org> <878u09x21s.fsf@linaro.org> <57162C50.2000508@gmail.com>
User-agent: mu4e 0.9.17; emacs 25.0.92.6
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Cc: Sergey Fedorov <sergey.fedorov@linaro.org>, qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Peter Crosthwaite <crosthwaite.peter@gmail.com>, Richard Henderson <rth@twiddle.net>, Peter Maydell <peter.maydell@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>, Michael Walle <michael@walle.cc>, Aurelien Jarno <aurelien@aurel32.net>, Leon Alrae <leon.alrae@imgtec.com>, Anthony Green <green@moxielogic.com>, Jia Liu <proljc@gmail.com>, Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v3 09/10] tcg: Clean up direct block chaining safety checks
In-reply-to: <57162C50.2000508@gmail.com>
Date: Tue, 19 Apr 2016 15:53:17 +0100
Message-ID: <874maxwsyq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: euDkk0+X6B5q


Sergey Fedorov <serge.fdrv@gmail.com> writes:

> On 19/04/16 14:37, Alex Bennée wrote:
>> Sergey Fedorov <sergey.fedorov@linaro.org> writes:
> (snip)
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
>>> +                if (next_tb != 0 && !qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
>>>                      tb_add_jump((TranslationBlock *)(next_tb & ~TB_EXIT_MASK),
>>>                                  next_tb & TB_EXIT_MASK, tb);
>>>                  }
>> We've already discussed on IRC the confusion of next_tb ;-)
>
> Yes, I'd rather add a patch to clean up 'next_tb' naming to "tcg: Misc
> clean-up patches" series. This series is to deal with direct block
> chaining only.

Yeah that makes sense.

>
>>> diff --git a/target-alpha/translate.c b/target-alpha/translate.c
>>> index 5b86992dd367..5fa66309ce2e 100644
>>> --- a/target-alpha/translate.c
>>> +++ b/target-alpha/translate.c
>>> @@ -464,7 +464,10 @@ static bool use_goto_tb(DisasContext *ctx, uint64_t dest)
>>>      if (in_superpage(ctx, dest)) {
>>>          return true;
>>>      }
>>> -    /* Check for the dest on the same page as the start of the TB.  */
>>> +    /* Direct jumps with goto_tb are only safe within the page this TB resides
>>> +     * in because we don't take care of direct jumps when address mapping
>>> +     * changes.
>>> +     */
>> I'm all for harmonising the comments but I think for the common case we
>> could refer to a central location for the page linking rules and only
>> expand the comment for subtle differences between the front ends.
>
> You mean, it'd be better to put a detailed explanation in a comment for
> e.g. tlb_flush() and refer to it in every place like this?

Yes.

>
>
>>>      return ((ctx->tb->pc ^ dest) & TARGET_PAGE_MASK) == 0;
>>>  }
> (snip)
>>> diff --git a/target-arm/translate.c b/target-arm/translate.c
>>> index 940ec8d981d1..aeb3e84e8d40 100644
>>> --- a/target-arm/translate.c
>>> +++ b/target-arm/translate.c
>>> @@ -4054,7 +4054,12 @@ static inline void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
>>>      TranslationBlock *tb;
>>>
>>>      tb = s->tb;
>>> -    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
>>> +    /* Direct jumps with goto_tb are only safe within the pages this TB resides
>>> +     * in because we don't take care of direct jumps when address mapping
>>> +     * changes.
>>> +     */
>>> +    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
>>> +        ((s->pc - 1) & TARGET_PAGE_MASK) == (dest &
>>> TARGET_PAGE_MASK)) {
>> Isn't this check avoided by the fact the translate loop bails on end_of_page?
>
> A TB can straddle a page boundary in Thumb mode. A TB can begin with an
> T32 instruction straddling a page boundary, thus this check should be
> useful :)

OK.

>
> Kind regards,
> Sergey


--
Alex Bennée
