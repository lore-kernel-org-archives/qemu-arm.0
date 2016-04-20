Received: by 10.25.208.194 with SMTP id h185csp2408641lfg;
        Wed, 20 Apr 2016 09:12:55 -0700 (PDT)
X-Received: by 10.25.1.196 with SMTP id 187mr4074641lfb.143.1461168775934;
        Wed, 20 Apr 2016 09:12:55 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lb0-x229.google.com (mail-lb0-x229.google.com. [2a00:1450:4010:c04::229])
        by mx.google.com with ESMTPS id i11si3883133lfe.139.2016.04.20.09.12.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Apr 2016 09:12:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c04::229 as permitted sender) client-ip=2a00:1450:4010:c04::229;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c04::229 as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lb0-x229.google.com with SMTP id b1so10718097lbi.1;
        Wed, 20 Apr 2016 09:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=4durj3DD0WUyefz5QCFkFl/DqSYIxkU3Xt3z2eOWLog=;
        b=Odae272MYrhbD02HqpB4r9eiQ7ilVRh8hT2B4Qd67wmciZ2K1zc8gg1xk5zIxUbBRm
         ZxDTn85DKeQT3iWxMJrycdYkBFKtCA+AzQY9NBWNZ7nIi9adVWQVw+FRscURLjtteCbf
         ONzNqEGDDn5am4ix2DQQ4f8tUfc7B0xVNiEaEuabPYtFbkgFCZRe/yhWiuJ9GWBCL9d1
         etZZOfWi9qP7Ou5GOxpFa6yHg2A4Kf3IisnpGJDQswH6vyqI5uSwsJZAvvXe+iMd75EH
         /pwHhd0npaZ4472xqHKz5HwyCx0YiMGpjPFZHGoByHypUrV2BBTiBIzzXlOoaPkZnkkI
         /rgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=4durj3DD0WUyefz5QCFkFl/DqSYIxkU3Xt3z2eOWLog=;
        b=iO69MBzZNRRsUgbAehDaDhX9BYEk7eK5vV/tGMxkV8lfwX5c4I0b0QM/BcLigDk1lG
         euxAvV62WhZUCAnoqkM5Df0i7eLq7apU35znj4OgKLC5r+XlJfpJeJTS6OpdqHJa2nNc
         lmuvnAz0GlBPGMJPdBWk3tXtzppqcOM8RfpYCOSLFtg0K3a2QEyKDzAWkRWyvkKM4MQ0
         5/x/PZ/fKgZCPD85Bf4KqtOCeubw7u+u0MG7RZQfaYPrlgJQyPuL6ie3b8tW6tI4/zB0
         LSEwAd4VDiFvwF3wsI4mONYSK4w0s5wLFqPLHa+ga6Hr3KBw/AOP471fLXu5l2r3axxl
         t2Vw==
X-Gm-Message-State: AOPr4FVdpuQX6HYbh7IDjPA4zjI8MqP0EJV8Ai3vhn1kvAZkDaWsJT1PxT/SYXrOSFeP/w==
X-Received: by 10.112.131.2 with SMTP id oi2mr4058865lbb.67.1461168775743;
        Wed, 20 Apr 2016 09:12:55 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from [192.168.0.65] (broadband-46-188-121-115.2com.net. [46.188.121.115])
        by smtp.gmail.com with ESMTPSA id f11sm1216344lfg.22.2016.04.20.09.12.54
        (version=TLSv1/SSLv3 cipher=OTHER);
        Wed, 20 Apr 2016 09:12:54 -0700 (PDT)
Subject: Re: [PATCH 07/11] tcg/arm: Make direct jump patching thread-safe
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1460044433-19282-1-git-send-email-sergey.fedorov@linaro.org>
 <1460044433-19282-8-git-send-email-sergey.fedorov@linaro.org>
 <87lh48v203.fsf@linaro.org> <57179253.9040505@gmail.com>
 <87fuuguywf.fsf@linaro.org>
Cc: Sergey Fedorov <sergey.fedorov@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>,
 qemu-arm@nongnu.org
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <5717AA85.1010109@gmail.com>
Date: Wed, 20 Apr 2016 19:12:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <87fuuguywf.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: 8smNJpRuQzKR

On 20/04/16 17:40, Alex Bennée wrote:
> Sergey Fedorov <serge.fdrv@gmail.com> writes:
>> On 20/04/16 16:33, Alex Bennée wrote:
>>> Sergey Fedorov <sergey.fedorov@linaro.org> writes:
>>>> diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c
>>>> index 3edf6a6f971c..5c69de20bc69 100644
>>>> --- a/tcg/arm/tcg-target.inc.c
>>>> +++ b/tcg/arm/tcg-target.inc.c
>>>> @@ -121,6 +121,13 @@ static inline void reloc_pc24(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
>>>>      *code_ptr = (*code_ptr & ~0xffffff) | (offset & 0xffffff);
>>>>  }
>>>>
>>>> +static inline void reloc_pc24_atomic(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
>>>> +{
>>>> +    ptrdiff_t offset = (tcg_ptr_byte_diff(target, code_ptr) - 8) >>
>>>> 2;
>>> This seems like something a tcg_debug_assert should be ensuring we don't overflow.
>> Then we should probably put the same assert into reloc_pc24() as well.
>>
>>>> +    tcg_insn_unit insn = atomic_read(code_ptr);
>>> Don't we already know what the instruction should be or could there be
>>> multiple ones?
>> Actually, it is always what tcg_out_b_noaddr() generates. I'm not sure
>> it's worthwhile to introduce tcg_out_b_atomic() or something similar
>> here.
> No I don't think so. It depends if the branch instruction is going to
> have multiple potential conditions (so requiring the read) or always be
> the same.

So I mean "regarding goto_tb, it's always branch immediate,
unconditional". But concerning the function name, it should only patch
the immediate offset of the instruction.

>
>>>> +    atomic_set(code_ptr, (insn & ~0xffffff) | (offset & 0xffffff));
>>> Please use deposit32 to set the offset like the aarch64 code.
>> Will do.
>>
>>>> +}
>>>> +
>>>>  static void patch_reloc(tcg_insn_unit *code_ptr, int type,
>>>>                          intptr_t value, intptr_t addend)
>>>>  {
>>>> @@ -1038,6 +1045,16 @@ static void tcg_out_call(TCGContext *s, tcg_insn_unit *addr)
>>>>      }
>>>>  }
>>>>
>>>> +void arm_tb_set_jmp_target(uintptr_t jmp_addr, uintptr_t addr)
>>>> +{
>>>> +    tcg_insn_unit *code_ptr = (tcg_insn_unit *)jmp_addr;
>>>> +    tcg_insn_unit *target = (tcg_insn_unit *)addr;
>>>> +
>>>> +    /* we could use a ldr pc, [pc, #-4] kind of branch and avoid the
>>>> flush */
>>> So why don't we?
>> I think because it's a bit more expensive to take this kind of branch.
>> If we assume direct jumps are taken much more times than TB patching
>> then it's preferable to optimize for direct jumps instead of for
>> patching.
> Looking again I see the comment came from code motion so I'm not overly
> fussed its just comments like that always leave me hanging. "We could
> ...." and I want to know why we don't then ;-)

So let's leave it as is?

Kind regards,
Sergey

>>>> +    reloc_pc24_atomic(code_ptr, target);
>>>> +    flush_icache_range(jmp_addr, jmp_addr + 4);
>>>> +}
>>>> +
>>>>  static inline void tcg_out_goto_label(TCGContext *s, int cond, TCGLabel *l)
>>>>  {
>>>>      if (l->has_value) {
