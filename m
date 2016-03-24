Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w184sm8135788wmb.1.2016.03.24.08.01.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Mar 2016 08:01:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id D5B653E018D;
	Thu, 24 Mar 2016 15:01:37 +0000 (GMT)
References: <1458815961-31979-1-git-send-email-sergey.fedorov@linaro.org> <1458815961-31979-2-git-send-email-sergey.fedorov@linaro.org> <87poukq9fk.fsf@linaro.org> <56F3F377.4070809@gmail.com>
User-agent: mu4e 0.9.17; emacs 25.0.92.7
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Cc: sergey.fedorov@linaro.org, qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Peter Crosthwaite <crosthwaite.peter@gmail.com>, Richard Henderson <rth@twiddle.net>, Claudio Fontana <claudio.fontana@huawei.com>, Andrzej Zaborowski <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>, "Vassili Karpov \(malc\)" <av1474@comtv.ru>, Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>, Stefan Weil <sw@weilnetz.de>, qemu-arm@nongnu.org
Subject: Re: [PATCH 1/8] tcg: Clean up direct block chaining data fields
In-reply-to: <56F3F377.4070809@gmail.com>
Date: Thu, 24 Mar 2016 15:01:37 +0000
Message-ID: <87mvpnrkby.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: SWtRuCcGSZgJ


Sergey Fedorov <serge.fdrv@gmail.com> writes:

> On 24/03/16 16:42, Alex Bennée wrote:
>>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>>> > index 05a151da4a54..cc3d2ca25917 100644
>>> > --- a/include/exec/exec-all.h
>>> > +++ b/include/exec/exec-all.h
>>> > @@ -257,20 +257,32 @@ struct TranslationBlock {
>>> >      struct TranslationBlock *page_next[2];
>>> >      tb_page_addr_t page_addr[2];
>>> >
>>> > -    /* the following data are used to directly call another TB from
>>> > -       the code of this one. */
>>> > -    uint16_t tb_next_offset[2]; /* offset of original jump target */
>>> > +    /* The following data are used to directly call another TB from
>>> > +     * the code of this one. This can be done either by emitting direct or
>>> > +     * indirect native jump instructions. These jumps are reset so that the TB
>>> > +     * just continue its execution. The TB can be linked to another one by
>>> > +     * setting one of the jump targets (or patching the jump instruction). Only
>>> > +     * two of such jumps are supported.
>>> > +     */
>>> > +    uint16_t jmp_reset_offset[2]; /* offset of original jump target */
>>> > +#define TB_JMP_RESET_OFFSET_INVALID 0xffff /* indicates no jump generated */
>>> >  #ifdef USE_DIRECT_JUMP
>>> > -    uint16_t tb_jmp_offset[2]; /* offset of jump instruction */
>>> > +    uint16_t jmp_insn_offset[2]; /* offset of native jump instruction */
>>> >  #else
>>> > -    uintptr_t tb_next[2]; /* address of jump generated code */
>>> > +    uintptr_t jmp_target_addr[2]; /* target address for indirect jump */
>>> >  #endif
>>> > -    /* list of TBs jumping to this one. This is a circular list using
>>> > -       the two least significant bits of the pointers to tell what is
>>> > -       the next pointer: 0 = jmp_next[0], 1 = jmp_next[1], 2 =
>>> > -       jmp_first */
>>> > -    struct TranslationBlock *jmp_next[2];
>>> > -    struct TranslationBlock *jmp_first;
>>> > +    /* Each TB has an assosiated circular list of TBs jumping to this one.
>>> > +     * jmp_list_first points to the first TB jumping to this one.
>>> > +     * jmp_list_next is used to point to the next TB in a list.
>>> > +     * Since each TB can have two jumps, it can participate in two lists.
>>> > +     * The two least significant bits of a pointer are used to choose which
>>> > +     * data field holds a pointer to the next TB:
>>> > +     * 0 => jmp_list_next[0], 1 => jmp_list_next[1], 2 => jmp_list_first.
>>> > +     * In other words, 0/1 tells which jump is used in the pointed TB,
>>> > +     * and 2 means that this is a pointer back to the target TB of this list.
>>> > +     */
>>> > +    struct TranslationBlock *jmp_list_next[2];
>>> > +    struct TranslationBlock *jmp_list_first;
>> OK I found that tricky to follow. Where does the value of the pointer
>> come from that sets these bottom bits? The TB jumping to this TB sets it?
>
> Yeah, that's not easy to describe. Initially, we set:
>
>     tb->jmp_list_first = tb | 2
>
> That makes an empty list: jmp_list_first just points to the this TB and
> the low bits are 2.
>
> After that we can add a TB to the list in tb_add_jump():
>
>     tb->jmp_list_next[n] = tb_next->jmp_list_first;
>     tb_next->jmp_list_first = tb | n;
>
> where 'tb' is going to jump to 'tb_next', 'n' (can be 0 or 1) is an
> index of jump target of 'tb'.

Where I get confused it what is the point of jmp_list_first? If these
are two circular lists do we care which the first in the list is? The
exit condition when coming out of searching seems when ntb with index =
orig tb with index.

>
> (I simplified the code here)
>
> Any ideas how to make it more clear in the comment?
>
> Kind regards,
> Sergey


--
Alex Bennée
