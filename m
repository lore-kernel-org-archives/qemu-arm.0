Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1116764njc;
        Sat, 22 Mar 2025 13:55:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWchSqcwJZBPDwixuvDEBGhx2GtAcmb/TqhbTOSbmkqsyX3FQLpFGfJVtiM4IcWiI95iPlsfHmrG1Xo+g==@linaro.org
X-Received: by 2002:a17:903:1ca:b0:21b:b3c9:38ff with SMTP id d9443c01a7336-22780e09470mr111830795ad.37.1742676941665;
        Sat, 22 Mar 2025 13:55:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742676941; cv=none;
        d=google.com; s=arc-20240605;
        b=gqRpUrhT8dU2IED0cOg3VOoyzuc7eQX3Wd/uKKNtpsTU3/Qc/1ieOuf2Bs8oPE2X5q
         SYKYwevBhBa+mggQ/qiXpUFQ8okMQ5GxT9IHK8LbN9TUuf71bCnqMFDo6ZZWaN+9Qsrq
         0/h12hFtFuJSbdFysCnhsun0ILNb52iRhuQ7AXfdD+f/Tkuypy3J5nol+doRREpWmmoh
         hIJnc1zdUfxkNzKE1C15Id7OdUHg6y95kbhRj0eGkQqiYOz44f1tWBcY2mqHQpQ095RU
         r6dw4jqx33TDXLVZ/LCUGqjUwJtg5Fs8V9LC7WU5iKz+44ppZG4cB1c0iRnHDxij0wqR
         06GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kgGmWC6PM5wLnaG1uyNrtF3HfvNjTFidfhpw5ptOU8I=;
        fh=yGzFyWL4XenedHwxeoPYbv06Qk5tZEWl3tqimet9aXc=;
        b=HyzwE/HhQXCCEEwYI1TNBNy+EeHbyMbeOYKWwDUHIUWRVxDUy9GvyN5GSWAviWWfeK
         cx9gw+xgF0WeY06YlHkYFe1gx0siSKRsTVhLrFScebo69gTbokSDrAj00iSi4A8j8VJ5
         fUltXEzDDzxfBgDw9ff+K0cwk8j/Cgmo4QjaigZ/CT7UJlhFwPrmnlw0DVGjYbACLdoM
         j43GrebwI+6/Ey8HtiUKG5F67AjdSt4Sk/9rlj6tVDB35RQyzUmJ29Y/dyvxHwy6td68
         AWybzGLqAYUhczHwD5zxL+CtZ3Gd3Sgahgg+cKYesE1YlFVOUeyHLcO736xIyVtjly7G
         89iA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iOS45MSi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f11ad3sor36548105ad.4.2025.03.22.13.55.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 22 Mar 2025 13:55:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iOS45MSi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742676941; x=1743281741; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kgGmWC6PM5wLnaG1uyNrtF3HfvNjTFidfhpw5ptOU8I=;
        b=iOS45MSizT4KhQOahGk83KGsvounkcn+In/LfG/4fzqqwrM4Buk5TznGXEcifuvw6F
         TH2KxMBP3btvlZiLjpQ54NIfyFfeXLG5ITIt5O8ZoTNcsfjkbl/VJrU1A0Ho9Awu4ASj
         Ifsij6hCkyIeudTzXIq9Eq3sLm5+CD9W4UQcebtfLGLEmYVLXbxguXD/Go+YsqVCqfKv
         Q49hdaIAmoo+/fmQL2hLOfbYK6ibVk0ZYlsoTxwtsdD+nss3PdTyiU2R09f/zRGt1k1A
         uTIb042HamB3IN3nWFvL96OUYb+/xx8HxkDLjhK41j4dwHO8rwicv+kYu+LvSISJ6Qx7
         sb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742676941; x=1743281741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kgGmWC6PM5wLnaG1uyNrtF3HfvNjTFidfhpw5ptOU8I=;
        b=vjRwuigR99oWfXcgeLm54g6cv3SPDbj6XiywqN4K+GbCETpjEWhjxHu5gail3N5mkm
         xarSSqeyZiQa1YDyUcYtWxaEAiPMkqSf+rPophOsuxn6/X1R8aTIQWc6k/OW9oPzzl+M
         oZK8fkgsoOohPjNOxyHu68wILGBv186kkfuUSLF6IXfhiDueTWdOuce7m5NeKHjY99cr
         71xJlxViXw5+rDY15TUTrF0HO4M//MFEdpEUW0Wjj8Wtu7Mbh9/evn0YgxTibLZrO3CJ
         KstNLAEpTtnjUKh1sUM9kt3mL0oMmTiIoMWmIi54AxWPCBsXXb7CS5EgRMwgIlEb62wM
         fVhw==
X-Forwarded-Encrypted: i=1; AJvYcCUwAYSrevB+s/X2mbtlVcMj/uaUkCOD8y2ZIPUZe9FwVLIogEnyKH2Fcx8O1n5N2gncrpC2Iv/RhSbkOw==@linaro.org
X-Gm-Message-State: AOJu0Yz+UopGZFfG1Xp0ueRgZiHWRiMQpMzclCzreMrzJtebuUK1JaSF
	vIKYs2cwqzYq1OZ5XEwxPd/WxnGHLQy8o8KVxeKm7g7BRI0jES+cFm4Rq4fS4+ZU1Q==
X-Gm-Gg: ASbGncuiHOwlvZzPBkDfuVdRzdK4MLyHvPFdL2jdOc8DW0zVw9pOcMsOUZ+sRyaP68d
	Un7KrY/AefyyCDsjPzUr+Hcj5Pxdugm4gAoducgsL3JfQsCqR2UftQAJb7fZKdn+F/QDxOnQrMl
	wOBBHnQvUdbntFnEI1/AtMvAzmwCRdSh3LNn3EeRd6MHTUZsQA+HkkhVScCFGgtPb8EtFzMzMoF
	sXwhOatu65hdpj2pbFx+Nbj93E45Q0hPKqM0Y1ynqEcSoq1QQQlBc7cx5dJHC2qFSOcsdqTtS++
	W695qwTOIv9Tlea8EzJg19Jjvh40bq56bovoqX9RmuFejEhE9uiTvuIt3NgepyLxNVRHuvZast8
	a5FMjPYAa
X-Google-Smtp-Source: AGHT+IF8bW/hQCXsQIR/yUOm9ZATK+QQ55egz4OhUwbr//UE3L/jkw+NaL2jvImzW0JB60ZAK94q9g==
X-Received: by 2002:a17:903:298b:b0:223:5a6e:b16 with SMTP id d9443c01a7336-22780c55886mr145113575ad.5.1742676941062;
        Sat, 22 Mar 2025 13:55:41 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f3b242sm40132835ad.41.2025.03.22.13.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Mar 2025 13:55:40 -0700 (PDT)
Message-ID: <392cd6e5-0c73-4702-8733-d3047db76f77@linaro.org>
Date: Sat, 22 Mar 2025 13:55:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/30] exec/target_page: runtime defintion for
 TARGET_PAGE_BITS_MIN
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-18-pierrick.bouvier@linaro.org>
 <2e667bb0-7357-4caf-ab60-4e57aabdceeb@linaro.org>
 <e738b8b8-e06f-48d0-845e-f263adb3dee5@linaro.org>
 <a67d17bb-e0dc-4767-8a43-8f057db70c71@linaro.org>
 <216a39c6-384d-4f9e-b615-05af18c6ef59@linaro.org>
 <c0e338f5-6592-4d83-9f17-120b9c4f039e@linaro.org>
 <ebd25730-1947-4360-af36-cf1131f4155c@linaro.org>
 <c1b7b73e-0a59-46cf-bf33-5712df5d9b75@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c1b7b73e-0a59-46cf-bf33-5712df5d9b75@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: uF12kVJr1oMk

On 3/21/25 17:20, Pierrick Bouvier wrote:
> On 3/21/25 17:01, Pierrick Bouvier wrote:
>> On 3/21/25 15:19, Richard Henderson wrote:
>>> On 3/21/25 13:11, Pierrick Bouvier wrote:
>>>> On 3/21/25 12:27, Richard Henderson wrote:
>>>>> On 3/21/25 11:09, Pierrick Bouvier wrote:
>>>>>>> Mmm, ok I guess.  Yesterday I would have suggested merging this with page-vary.h, but
>>>>>>> today I'm actively working on making TARGET_PAGE_BITS_MIN a global constant.
>>>>>>>
>>>>>>
>>>>>> When you mention this, do you mean "constant accross all architectures", or a global
>>>>>> (const) variable vs having a function call?
>>>>> The first -- constant across all architectures.
>>>>>
>>>>
>>>> That's great.
>>>> Does choosing the min(set_of(TARGET_PAGE_BITS_MIN)) is what we want there, or is the
>>>> answer more subtle than that?
>>>
>>> It will be, yes.
>>>
>>> This isn't as hard as it seems, because there are exactly two targets with
>>> TARGET_PAGE_BITS < 12: arm and avr.
>>>
>>> Because we still support armv4, TARGET_PAGE_BITS_MIN must be <= 10.
>>>
>>> AVR currently has TARGET_PAGE_BITS == 8, which is a bit of a problem.
>>> My first task is to allow avr to choose TARGET_PAGE_BITS_MIN >= 10.
>>>
>>> Which will leave us with TARGET_PAGE_BITS_MIN == 10.
>>>
>>
>> Ok.
>>
>>   From what I understand, we make sure tlb flags are stored in an
>> immutable position, within virtual addresses related to guest, by using
>> lower bits belonging to address range inside a given page, since page
>> addresses are aligned on page size, leaving those bits free.
>>
>> bits [0..2) are bswap, watchpoint and check_aligned.
>> bits [TARGET_PAGE_BITS_MIN - 5..TARGET_PAGE_BITS_MIN) are slow,
>> discard_write, mmio, notdirty, and invalid mask.
>> And the compile time check we have is to make sure we don't overlap
>> those sets (would happen in TARGET_PAGE_BITS_MIN <= 7).
>>
>> I wonder why we can't use bits [3..8) everywhere, like it's done for
>> AVR, even for bigger page sizes. I noticed the comment about "address
>> alignment bits", but I'm confused why bits [0..2) can be used, and not
>> upper ones.
>>
>> Are we storing something else in the middle on other archs, or did I
>> miss some piece of the puzzle?
>>
> 
> After looking better, TLB_SLOW_FLAGS are not part of address, so we don't use bits [0..2).
> 
> For a given TARGET_PAGE_SIZE, how do we define alignment bits?

Alignment bits are the least significant bits that must be 0 in order to enforce a 
particular alignment.  The specific alignment is requested via MO_ALIGN et al as part of 
the guest memory reference.

I think the piece you're missing is the softmmu fast path test in the generated code.

We begin by indexing the tlb to find an entry.  At that index, the entry may or may not 
match because (1) we have never looked up the page so the entry is empty, (2) we have 
looked up a different page that aliases, or (3) the page is present and (3a) correct, or 
(3b) invalidated, or (3c) some other condition that forces the slow path.

The target address and the comparator have several fields:

   page address   [63 ... TARGET_PAGE_BITS]
   page flags     [TARGET_PAGE_BITS - 1 ... TARGET_PAGE_BITS - 5]
   unused         [TARGET_PAGE_BITS - 6 ... align_bits], or empty.
   alignment      [align_bits - 1 ... 0], or empty

In the comparator, the unused and alignment bits are always zero; the page flags may be 
non-zero in order to force the comparison to fail.

In the target address, we mask the page flags and unused bits; if the alignment bits of 
the address are set, then the address is of course unaligned and so the comparison fails.

In order for all this work, the alignment field cannot overlap the page flags.

The maximum alignment currently used by any guest is 5 bits, for Arm Neon,
which means the minimum value for TARGET_PAGE_BITS_MIN is 10.


r~
