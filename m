Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp552594njc;
        Thu, 14 Nov 2024 13:05:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW6wklOrKManybzH3eMBntL56HLvNCGkDlIoxtEkkdUz9BaBBqJBsDZfTbPDg1W4Ua4NneagaF5WFKACg==@linaro.org
X-Received: by 2002:a2e:a901:0:b0:2f7:6653:8053 with SMTP id 38308e7fff4ca-2ff6066180cmr4162651fa.18.1731618337664;
        Thu, 14 Nov 2024 13:05:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731618337; cv=none;
        d=google.com; s=arc-20240605;
        b=SIWDjBlBkGjPMIXHYM1YvPH8+/JrRo5P7bGlsHhTrO6rlMDMTvQwFCWk4Peg8+NtvH
         hubSD1CsCxBn7dEkkLYWWwHUfIb1TIqHM/Fr7CRdBig4Kc918o27Ga7EfzqIsUsHRGZW
         RTR9z2oJK194rrNQQDEGmQbNLideUhOJIsJN8JdZmpIdT2t5R7LMgoI9KKwkbqhuOJL0
         JvIkV+2cRNImBNqwgYxc692dI+g6iMAfwNQWxXVJELLdmPJsXKLHiMe09kQpoLU5RMce
         mSxO1e/Q1DfnQYi71VjfNfKbzQFeO8oycZPiX5Tejnv2csg0tKuaoK2yLCbqS4WEGGE6
         1IfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pWlnoTNls266dh3rTxML6If/W5HjOvej1W8Ls+0tjpA=;
        fh=M9RFE9Kc3lL8I1ezjwNnC9Z0Fp3YQ56nQ/lZpjL908s=;
        b=UWWzuAUI404OGjMN9Px6fCEK1iip/bc0Cinhos6I3ZWBIzJ6U8SBJGUqoiyf4/RdBF
         xnJ5D8YqzHLQFXdYwimlR5B2fc9Fw/oK6Z+X5cRzAtsPU4i67ICDlPPoo22wEs1h5mOE
         Tqxem0Sv3OKDnps4FFobtv+JLbWjm1z2zuV1OOjjbwGjaH21ectzulyrolhTCXd6Dm80
         pVTGfKzDFYLquxps9X+14G7KkDQ2UZtyrzbrv3EM+OP4X+uYRETadqVdbG+OuQlt1w1g
         r5V2HiTS8jJF8QMZimM5eRTQUykneUi6CQ7+ewldn87zZS3oUicuNj4UV0m8mGaqvBXS
         ca5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ysi6/jU4";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2ff59779f51sor8282601fa.4.2024.11.14.13.05.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2024 13:05:37 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ysi6/jU4";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731618337; x=1732223137; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pWlnoTNls266dh3rTxML6If/W5HjOvej1W8Ls+0tjpA=;
        b=Ysi6/jU4BgL/M7n3UjnV4RUBoLCNPnlZD0VEDRvyJo238o1E51qwgM7vBzumV8tbu3
         d+jZD04vXXNRb3vZbFgf9GpPlD7DoPyjPuUIRA1c4Irwfx3yQQyEJtkHCW40+luALP/I
         ExL4LdNa1wiE7gMz1l7eIT/eB21l346rjARys2weaDuIACy6LdBRTNy+VIIkFqbIqdgi
         KgbEytYgCXXWvx3hC+ua81Qz1KVqicsIkPsKi65B1M45bYPaLypx1tmkR0f6XmGhzSXh
         t4XywmuCKJjQgi2uN3Mi3oE+wzBlm0Hu5phVtARLg3tNmN3XqC0eMPHJ1OX22VdPa7Dv
         7jKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731618337; x=1732223137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pWlnoTNls266dh3rTxML6If/W5HjOvej1W8Ls+0tjpA=;
        b=Ph4wKgcsRDqecqaWTP/9wxZeFfwWQ9h/3r1Ykif24LuwyV/0wYGuPUY4cZqY3N9/6l
         RYocPmDuLttQNJUbW8BDiONQZZEiBTmXnf5a30IFfbMaYIJk9yKt4aR6giBTLDhvQxwB
         RU9aC+UB8QYNxt8JGXi4UWuURZGgWe0Sv/OledpEFjHij08MDQnZUojhRhgVDhjQnrpL
         a0o6CKjAu0E4YVdUW/YfthbhyXPlLg8ucI4pyc0bsEdKya+Lg8fiqpoYXSWHthXohO54
         4xnS6UqG8MEr0YfJIKXnPT2bDOTqLgE0KGpWNGpzl2vgzrimP9gYVtkTm8gzgBZEe7eY
         Cexw==
X-Forwarded-Encrypted: i=1; AJvYcCVceEQndmkOtO25nQ8hvUxSZ+5o6wwuh7UkdkD85/geV4bxX38aB9yqM75feFfrQ6qHgcgH6EMg/1c8IQ==@linaro.org
X-Gm-Message-State: AOJu0YxfioOY4D1tOyderj1Nh+aiIZ1fFmIFE3QnUQ2TBBIAOGLX1iAD
	XIxAKx7DzdvPS/tWezPlJH6H00Da+14FZq1QZDFVfAU74X0/0iC6gjLo6fqiPpCbag==
X-Google-Smtp-Source: AGHT+IF/+vE2NIeTr2lZCJQFM30ZJCtPOWIen71zHtBQd5fnu7UeuvR9wsTaDjhfo7F8SNDvRzsw1Q==
X-Received: by 2002:a05:651c:160e:b0:2fb:510c:7237 with SMTP id 38308e7fff4ca-2ff60715466mr3722871fa.41.1731618336989;
        Thu, 14 Nov 2024 13:05:36 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.126] ([176.187.209.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e045438sm102112866b.158.2024.11.14.13.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 13:05:36 -0800 (PST)
Message-ID: <c072c343-c90c-49f4-9657-3f946a02f92e@linaro.org>
Date: Thu, 14 Nov 2024 22:05:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/24] exec: Declare tlb_reset_dirty*() in 'exec/cputlb.h'
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-14-philmd@linaro.org>
 <1c700309-abc5-4b5d-9a40-d00b7a7a13a2@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <1c700309-abc5-4b5d-9a40-d00b7a7a13a2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: RiZNVPlQSOUw

On 14/11/24 19:19, Richard Henderson wrote:
> On 11/13/24 17:12, Philippe Mathieu-Daudé wrote:
>> Move CPU TLB related methods to "exec/cputlb.h".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/exec/cputlb.h   | 7 +++++++
>>   include/exec/exec-all.h | 3 ---
>>   include/exec/ram_addr.h | 1 +
>>   system/physmem.c        | 1 +
>>   4 files changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
>> index ef18642a32..6cac7d530f 100644
>> --- a/include/exec/cputlb.h
>> +++ b/include/exec/cputlb.h
>> @@ -32,4 +32,11 @@ void tlb_unprotect_code(ram_addr_t ram_addr);
>>   #endif /* CONFIG_TCG */
>> +#ifndef CONFIG_USER_ONLY
>> +
>> +void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t 
>> length);
>> +void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length);
>> +
>> +#endif
>> +
>>   #endif
> 
> This can join the existing CONFIG_TCG, !CONFIG_USER_ONLY block above.

Actually they are used by all accelerators (thus prototype required),
but elided at build time:

static inline
void cpu_physical_memory_dirty_bits_cleared(ram_addr_t start,
                                             ram_addr_t length)
{
     if (tcg_enabled()) {
         tlb_reset_dirty_range_all(start, length);
     }

}

That said, we can probably to smth to improve that. I'll have
a look.
