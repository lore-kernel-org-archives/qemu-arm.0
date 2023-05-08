Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp1932043ejq;
        Mon, 8 May 2023 03:03:03 -0700 (PDT)
X-Received: by 2002:a17:907:94d2:b0:94a:959f:6d58 with SMTP id dn18-20020a17090794d200b0094a959f6d58mr9845396ejc.18.1683540183596;
        Mon, 08 May 2023 03:03:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683540183; cv=none;
        d=google.com; s=arc-20160816;
        b=n5SqJeNPZZTMC1GTqDv781CwrnpRTu4vYAm9mZCaS0ILvQSL5GFML+hbqWKPw/rP1M
         urlY7+HOC1U5iNflFJwSTsntBrdZuJkOQbmLPr1Z5KHQpUAWzoLXF2H/TfAzex5DdFk/
         MkD0Oo5WX15HRqatrtSaXsJ1IgnzuosW78ZYEG8nkTIBGKgvZ7Dm81NkoVcjzHedKKQl
         z18pv6ILRP6bCmG2OVWNY0DwSL6rm36PYhK0i2OlYgGF6UkkuAs7TfqSZcqtH3aVyI+y
         BFrPwz6soOtKxZK+fxsaVZIn2dTQfn9g4argPcUzdwvBPI29PgQZdMricmdLDPGbmlxH
         R8cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VvWCQjr5tSxYzn7N8yKObQDzC0YUASVVBrI08afApL8=;
        b=Ty95QwGrlHhDq8zf2CPpzDC4PZl+LfwmWC6BXycX75vTA23Lx8+1wdVVZRpDttgvT3
         oXLNl+YF5pq6EmFG09RViH6+Rm9MvwhvN+9zaSkcvAcp6EvFDXbbOoL1jmyWXyLh2uLt
         V6v69wC+MfBNS+PDb/Tu8WqL6uiO+EbWVVoz/7r409LANrsSFTMtpfYmRX0HczkDQQEN
         95Q8bfmurKWLZP7yznuRoayBgytrh1AjGC8QtFd8I6kQpCNx5hRov8tPBymBYH8Fqbuv
         N+b7Qvc7VqqQ+yLWQPT1+ZzOY1c0BYrR41tKiQgPvlUatV5qnQR4uti0Y5hwMuypg1TV
         m7eQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mTYW+VT8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id my19-20020a1709065a5300b0095330e1983dsor3085746ejc.8.2023.05.08.03.03.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 08 May 2023 03:03:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mTYW+VT8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683540183; x=1686132183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VvWCQjr5tSxYzn7N8yKObQDzC0YUASVVBrI08afApL8=;
        b=mTYW+VT83B0sRHlwU6HxccgQipB5C5Wsb92yo6SxARgxTCFiIgQ1EMfg4kHggQL8Ey
         PCrNiRC/GTuA/vp5aSehfbew2Fkg4+XZX43igjjaYPTzh2wghl0+efQV1jWmXfz8Ro7U
         VCn4vlUccnxuhtlhkElBQdpuqEJ2zq6+qif3nZAtd6sYLdqCZbcXOm6xM/PdfkHReZPd
         6qeabiCMbK7iQuxCjq7DsRbIhRIiwtZLd+f6Pt+MtzARsrgTdbc1WKH5Xcy/MPXm1enP
         WyRTvcuNfdjZkj+uw1LYtKzKnheMloSZHkSLvEgE4nZ7AO17cPy0smMeUTPIZrsX+B90
         BqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683540183; x=1686132183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VvWCQjr5tSxYzn7N8yKObQDzC0YUASVVBrI08afApL8=;
        b=SgdZbU+IGlh0jUyHzyZGKxD7TggDufNL3ipeqK9aMb5NVqRPJvjWGHJ4LKOl2o055W
         Yxp0SxbUIc7GOafX1qFAIKj/Bev84TAbR536QgJc8OlsK8rOzPSUCjkXDsLNCJqVfv4H
         wyb7KW2mEKJ6zRFWUvSm4mXIRZ1NGAYcKUNw0106yCSiehw8G0R4VGibGXej3+cI+XbS
         qFf6L+jWPsrT7FAlWU0hN+6Bh75F1Naztkno4UxpE0GDOVSS3Iuy73PgdShwpRgZI9th
         Ywor2XKw09p8DQtddaRbezn6w4+u7bnIvFgccDuJdhzYog4qjq9jlOnLqTbOwZyQ9TXw
         gy7A==
X-Gm-Message-State: AC+VfDyxTiCUpvOHmbQ2zpliM51/kelaKYR/hVYdFq7wSXNLlMykSIp2
	e8OaHR58lYVh9n7zohMV+HGsa6RfQZWtwmTOCgla2x0Q
X-Google-Smtp-Source: ACHHUZ4We/DO5dEz8nw7UDQY74z3Pat8axMfjC+GOgg27vVpCz9zmmI2us8UCQExqThBT246qEv3HA==
X-Received: by 2002:a17:907:2684:b0:94e:75f8:668 with SMTP id bn4-20020a170907268400b0094e75f80668mr7815275ejc.56.1683540183151;
        Mon, 08 May 2023 03:03:03 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.110.227] ([91.223.100.33])
        by smtp.gmail.com with ESMTPSA id p24-20020a1709065dd800b0094f44bdf7acsm4766398ejv.57.2023.05.08.03.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 03:03:02 -0700 (PDT)
Message-ID: <bde2c98e-f087-44aa-4164-9a24d5d8e9c7@linaro.org>
Date: Mon, 8 May 2023 11:02:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 03/57] accel/tcg: Introduce tlb_read_idx
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-4-richard.henderson@linaro.org>
 <CAFEAcA858-D37=MrvYnGxBVkL1V14wZ_JLEzFahbweRUDvPmwg@mail.gmail.com>
 <45cba357-ba20-399a-27e6-5e99741179d0@linaro.org>
 <CAFEAcA9h6myNpkgmamxLHp_8We97eyGQpDb4PKPnwqL8rRzSTQ@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9h6myNpkgmamxLHp_8We97eyGQpDb4PKPnwqL8rRzSTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 0ltxPWGh5kOo

On 5/7/23 11:09, Peter Maydell wrote:
> On Fri, 5 May 2023 at 19:57, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 5/4/23 16:02, Peter Maydell wrote:
>>> On Wed, 3 May 2023 at 08:15, Richard Henderson
>>> <richard.henderson@linaro.org> wrote:
>>>>
>>>> Instead of playing with offsetof in various places, use
>>>> MMUAccessType to index an array.  This is easily defined
>>>> instead of the previous dummy padding array in the union.
>>>>
>>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>> ---
>>>
>>>> @@ -1802,7 +1763,8 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
>>>>        if (prot & PAGE_WRITE) {
>>>>            tlb_addr = tlb_addr_write(tlbe);
>>>>            if (!tlb_hit(tlb_addr, addr)) {
>>>> -            if (!VICTIM_TLB_HIT(addr_write, addr)) {
>>>> +            if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_STORE,
>>>> +                                addr & TARGET_PAGE_MASK)) {
>>>>                    tlb_fill(env_cpu(env), addr, size,
>>>>                             MMU_DATA_STORE, mmu_idx, retaddr);
>>>>                    index = tlb_index(env, mmu_idx, addr);
>>>> @@ -1835,7 +1797,8 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
>>>>        } else /* if (prot & PAGE_READ) */ {
>>>>            tlb_addr = tlbe->addr_read;
>>
>> read
>>
>>>>            if (!tlb_hit(tlb_addr, addr)) {
>>>> -            if (!VICTIM_TLB_HIT(addr_write, addr)) {
>>
>> write
>>
>>>> +            if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_LOAD,
>>>> +                                addr & TARGET_PAGE_MASK)) {
>>>
>>> This was previously looking at addr_write, but now we pass
>>> MMU_DATA_LOAD ?
>>
>> This is the read portion of the read+write check.  The write portion is above in the
>> previous hunk.  So this is an existing error, fixed here, and I hadn't noticed.
> 
> Yeah, I wondered if it was a pre-existing bug. We should split out
> the bug fix.

https://patchew.org/QEMU/20230505204049.352469-1-richard.henderson@linaro.org/

r~
