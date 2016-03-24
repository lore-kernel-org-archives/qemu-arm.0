Received: by 10.25.208.211 with SMTP id h202csp703157lfg;
        Thu, 24 Mar 2016 08:10:35 -0700 (PDT)
X-Received: by 10.25.24.155 with SMTP id 27mr1812792lfy.112.1458832235140;
        Thu, 24 Mar 2016 08:10:35 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com. [2a00:1450:4010:c07::241])
        by mx.google.com with ESMTPS id y136si1505675lfd.193.2016.03.24.08.10.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Mar 2016 08:10:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::241 as permitted sender) client-ip=2a00:1450:4010:c07::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::241 as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lf0-x241.google.com with SMTP id i75so4064244lfb.1;
        Thu, 24 Mar 2016 08:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=fXDHIIzRz4dolTRngHwqeXIYtyhy9887dlP/vu6/1zk=;
        b=oUxg5CNKfu7oDk2ME4X9nj0mkiFQxgJHRPBYlSRUulvR9Jp4kEfK48llKvDtAmTs6t
         xOwIyxlXEYD9571U1qg0nLn8O6g4YMAPxfIgJXl32cMEf2bTojzlokwpGBW5ZV7QTtLX
         xoAdpvTrdqpOj/z0cNj9b2Wthb59NQ0NwbbsfG+S5osvxdlyvVFGqD5uZ639gY5l0GXX
         UxoO9t12Z9lhQzCqhtihzRSHpL+Jrs4Ov59YpG2SyjTKasxfnV5NOz00Z5WTRt8wdaEC
         Wbmh1TW5Bxz5pubuW8lvjSPX3OTC6tYE9w1XgBqy+en265NLr3tigicgKOpTtRIs4HJm
         Z6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=fXDHIIzRz4dolTRngHwqeXIYtyhy9887dlP/vu6/1zk=;
        b=bJ2VDRhxZeTu9PRqR/hukM3gxLokeTNEgt8MJReS1Js5NAP6edHdqBRLj0gOxZdWgr
         JKMGlIkEyo7hmXu8xgTknL0aTJ3sC0NaDXSzSyHDGURo0Epwnt/PyK/eqsmRJZJvj3F+
         VXVkUHib+V1dVaZcjHTPT9WShVRabD/WBqJKtHcsSIg9Xdox9brC0ra7FMYM2Kdy4vcH
         3PmIe7a8ksRrlExKjFirD7A6XUTiDFnhVHPZsjyILY4tXPPw8N5s9GgiSan/1Fr1unaY
         2YLj3lHodi6hIqCkNDMIP0+wOUJ90hjiFV4VGM7TQBBzdelcKzCb2Elngsyqmtcpa8OC
         qAzw==
X-Gm-Message-State: AD7BkJLbIDRgtEo9rYbZojdoBtEECBxUTf3o53CDkao4JrUQtVBvTQmTDvEkOww/nz/wRA==
X-Received: by 10.25.213.145 with SMTP id m139mr3798079lfg.96.1458832234876;
        Thu, 24 Mar 2016 08:10:34 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from [192.168.0.56] ([195.91.132.170])
        by smtp.gmail.com with ESMTPSA id p134sm1257785lfb.48.2016.03.24.08.10.33
        (version=TLSv1/SSLv3 cipher=OTHER);
        Thu, 24 Mar 2016 08:10:34 -0700 (PDT)
Subject: Re: [PATCH 1/8] tcg: Clean up direct block chaining data fields
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1458815961-31979-1-git-send-email-sergey.fedorov@linaro.org>
 <1458815961-31979-2-git-send-email-sergey.fedorov@linaro.org>
 <87poukq9fk.fsf@linaro.org> <56F3F377.4070809@gmail.com>
 <87mvpnrkby.fsf@linaro.org>
Cc: sergey.fedorov@linaro.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>, "Vassili Karpov (malc)" <av1474@comtv.ru>,
 Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-arm@nongnu.org
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56F40369.9000805@gmail.com>
Date: Thu, 24 Mar 2016 18:10:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <87mvpnrkby.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: Ju1xyRyPPQnV

On 24/03/16 18:01, Alex Bennée wrote:
> Sergey Fedorov <serge.fdrv@gmail.com> writes:
>
>> On 24/03/16 16:42, Alex Bennée wrote:
>>>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>>>>> index 05a151da4a54..cc3d2ca25917 100644
>>>>> --- a/include/exec/exec-all.h
>>>>> +++ b/include/exec/exec-all.h
>>>>> @@ -257,20 +257,32 @@ struct TranslationBlock {
>>>>>      struct TranslationBlock *page_next[2];
>>>>>      tb_page_addr_t page_addr[2];
>>>>>
>>>>> -    /* the following data are used to directly call another TB from
>>>>> -       the code of this one. */
>>>>> -    uint16_t tb_next_offset[2]; /* offset of original jump target */
>>>>> +    /* The following data are used to directly call another TB from
>>>>> +     * the code of this one. This can be done either by emitting direct or
>>>>> +     * indirect native jump instructions. These jumps are reset so that the TB
>>>>> +     * just continue its execution. The TB can be linked to another one by
>>>>> +     * setting one of the jump targets (or patching the jump instruction). Only
>>>>> +     * two of such jumps are supported.
>>>>> +     */
>>>>> +    uint16_t jmp_reset_offset[2]; /* offset of original jump target */
>>>>> +#define TB_JMP_RESET_OFFSET_INVALID 0xffff /* indicates no jump generated */
>>>>>  #ifdef USE_DIRECT_JUMP
>>>>> -    uint16_t tb_jmp_offset[2]; /* offset of jump instruction */
>>>>> +    uint16_t jmp_insn_offset[2]; /* offset of native jump instruction */
>>>>>  #else
>>>>> -    uintptr_t tb_next[2]; /* address of jump generated code */
>>>>> +    uintptr_t jmp_target_addr[2]; /* target address for indirect jump */
>>>>>  #endif
>>>>> -    /* list of TBs jumping to this one. This is a circular list using
>>>>> -       the two least significant bits of the pointers to tell what is
>>>>> -       the next pointer: 0 = jmp_next[0], 1 = jmp_next[1], 2 =
>>>>> -       jmp_first */
>>>>> -    struct TranslationBlock *jmp_next[2];
>>>>> -    struct TranslationBlock *jmp_first;
>>>>> +    /* Each TB has an assosiated circular list of TBs jumping to this one.
>>>>> +     * jmp_list_first points to the first TB jumping to this one.
>>>>> +     * jmp_list_next is used to point to the next TB in a list.
>>>>> +     * Since each TB can have two jumps, it can participate in two lists.
>>>>> +     * The two least significant bits of a pointer are used to choose which
>>>>> +     * data field holds a pointer to the next TB:
>>>>> +     * 0 => jmp_list_next[0], 1 => jmp_list_next[1], 2 => jmp_list_first.
>>>>> +     * In other words, 0/1 tells which jump is used in the pointed TB,
>>>>> +     * and 2 means that this is a pointer back to the target TB of this list.
>>>>> +     */
>>>>> +    struct TranslationBlock *jmp_list_next[2];
>>>>> +    struct TranslationBlock *jmp_list_first;
>>> OK I found that tricky to follow. Where does the value of the pointer
>>> come from that sets these bottom bits? The TB jumping to this TB sets it?
>> Yeah, that's not easy to describe. Initially, we set:
>>
>>     tb->jmp_list_first = tb | 2
>>
>> That makes an empty list: jmp_list_first just points to the this TB and
>> the low bits are 2.
>>
>> After that we can add a TB to the list in tb_add_jump():
>>
>>     tb->jmp_list_next[n] = tb_next->jmp_list_first;
>>     tb_next->jmp_list_first = tb | n;
>>
>> where 'tb' is going to jump to 'tb_next', 'n' (can be 0 or 1) is an
>> index of jump target of 'tb'.
> Where I get confused it what is the point of jmp_list_first? If these
> are two circular lists do we care which the first in the list is? The
> exit condition when coming out of searching seems when ntb with index =
> orig tb with index.

So 'tb->jmp_list_first' points to the first TB jumping to 'tb'. Then we
use 'jmp_list_next[n]' of that TB to traverse the list further.
Eventually, we get 'jmp_list_next[n] & 3 == 2' which means
jmp_list_next[n] points back to the target TB. Hope it helps :)

Kind regards,
Sergey
