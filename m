Received: by 2002:a0c:aac5:0:0:0:0:0 with SMTP id g5csp2014867qvb;
        Mon, 8 Feb 2021 14:34:28 -0800 (PST)
X-Received: by 2002:a63:555b:: with SMTP id f27mr18961958pgm.365.1612823668018;
        Mon, 08 Feb 2021 14:34:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612823668; cv=none;
        d=google.com; s=arc-20160816;
        b=aj5Zqu0uvxb/KY0t+68n7fW9Z5BvRKAyTvlfxcgpu5yqy5+PhbWw4mJosUa3e2gFwm
         GeXLf33ZgmrzaQ2XpU/8Dc4SLnyC61lbd+no7xz72UdzGNAhyGffDNimi+pgK/lYBs3d
         7S8ar2yLFRFDCgrq5aA8B/wTi4EE3QTL5Vg3L5aZtx+rL1zGtCNHUq6yXezk9wrB+IjU
         hCaGdxOsdYMQGiX0mDYSSYXf0m52h3T5oLkZbGB3COA1ZMiXdqQmXbWCja2fTNCLE/LE
         qLvIgNKM3HDsyMIsNzvv8k5Wlhp8SgYaO/KhTBghhtE6IsPyXbgyQEq+KMhQvTd0DiV+
         VpvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=B3ycbnVqO5qmpQR0+kxdOZc1+K23PTet73ziktMTo8g=;
        b=ahPSs8jXiccVUq94DPmCEiPzA77SJVrm0lxC4iddp+Ug2ohPuawU5KRcC4PPasI/k7
         JRewF9RRE/9E1slXPeyaOhCJVwB8/e/Mcjm/A+A39exvNgf3x3ckVrpqmhM3En2Qmgw4
         oRCBdlc7Ic1CUbsE/oPHAroYykz4FrYr4xYBB6EnwRQ9UZgItlDmjI+Y8jgbxMuerUJs
         qB9GXeFe0FH2690BhrDiWkgY4+HHmlhstOo3aH+B08v9/+3H79JDo2slMF/2P3uE3amo
         ifMNbbS8v5sUmpO3mTjFSVWXKm2LEHhTp4l3goEszWca6rkIgfjbTzrKGf4+oFJiZ70R
         skgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jVvZMz3i;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e21sor10369106pgk.80.2021.02.08.14.34.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 08 Feb 2021 14:34:27 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jVvZMz3i;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B3ycbnVqO5qmpQR0+kxdOZc1+K23PTet73ziktMTo8g=;
        b=jVvZMz3iWPboc5tLiQD9LbEE1VzgDrQX6vbfMNuBs2e2yxRUVoTgr4KzI0Oazc7nwS
         gbsJZWk0cNGF52uK1aNymTCoDzeE0JTI36Nyl9cNjjezOrxfw4uEBnzthHV/fjDMYvJj
         qQ1SlTWBS1N4PdZEsM7NZo8rR5+Qb7JczyXme5jZgLkRga38eIR39L22qVkOFqqtP7Ee
         NjzjN5cujGqgRL4dlACK8uNudHOOofiyO//dvZqOsUIL9Uu2AFe+WNPWVXIZBPbmqIa7
         6z0RyykNiU3eniI0qjyCfKYZBqchHqxBQv26QqkzxWAAQZ2kCyORzNgOy2qvyA9NJ63d
         7RuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B3ycbnVqO5qmpQR0+kxdOZc1+K23PTet73ziktMTo8g=;
        b=AezDlaHwGd5ZBGn1jfWtgKMPGWveqI7x7zFTPz9yvfuzoUOWtgLx86XnDMuBWm3Zj7
         becszt/kkDCcuPct9FmV6FXudROiXZGQNevUzNSc4v+oX3bjFHtYXttIleArkUxhQkAm
         WNODJT8qUPtWOHi54AwJPE2h0Tb60184kk05W/APhAtTCmj92x13Cahvog9UhkiROqBA
         9eBW5J7fJob8mYvV4wdbGezZpcYw71PHGSI/jd+lkyPX1C3+zOydbRxF7UzaRFiWLJoS
         dGOSCHhbnECcEbgjmFBFlNXGHdgZZE93kfFnnWsmBfI1mn7yk6l50YXi6i/wnyW48YJ8
         msJA==
X-Gm-Message-State: AOAM531HTxumo59JPKQZstXyK2d+zIXPMV9rMVJ6lUiUVW2klLFrB2R+
	P8icsK5ikXKr09tYGd1iKknTUTTh
X-Google-Smtp-Source: ABdhPJxrc0yntA8EvrHBZp80AedKIhBtVd/LCkesfnJRwyzPW15LWX4o3kvC5kXXwI5b+oLhZP9lPg==
X-Received: by 2002:a63:c84a:: with SMTP id l10mr19111782pgi.159.1612823667575;
        Mon, 08 Feb 2021 14:34:27 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
        by smtp.gmail.com with ESMTPSA id r15sm20717845pgh.39.2021.02.08.14.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Feb 2021 14:34:26 -0800 (PST)
Subject: Re: [RFC PATCH v2 5/6] accel/tcg: Refactor debugging
 tlb_assert_iotlb_entry_for_ptr_present()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-riscv@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20210207232310.2505283-1-f4bug@amsat.org>
 <20210207232310.2505283-6-f4bug@amsat.org> <87im73aqsq.fsf@linaro.org>
 <83c71866-2e28-2edb-d79d-f4f96bb765a1@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e79856a7-f437-df71-f557-b2ace11ffb3e@linaro.org>
Date: Mon, 8 Feb 2021 14:34:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <83c71866-2e28-2edb-d79d-f4f96bb765a1@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: XwLuCijzo17Z

On 2/8/21 5:52 AM, Philippe Mathieu-Daudé wrote:
> On 2/8/21 9:42 AM, Alex Bennée wrote:
>>
>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>
>>> Refactor debug code as tlb_assert_iotlb_entry_for_ptr_present() helper.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>> What this code does is out of my league, but refactoring it allow
>>> keeping tlb_addr_write() local to accel/tcg/cputlb.c in the next
>>> patch.
>>
>> The assertion that the table entry is current is just a simple
>> housekeeping one. The details of how the MTE implementation uses
>> (abuses?) the iotlb entries requires a closer reading of the code.
>>
>>> ---
>>>  include/exec/exec-all.h |  9 +++++++++
>>>  accel/tcg/cputlb.c      | 14 ++++++++++++++
>>>  target/arm/mte_helper.c | 11 ++---------
>>>  target/arm/sve_helper.c | 10 ++--------
>>>  4 files changed, 27 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>>> index f933c74c446..c5e8e355b7f 100644
>>> --- a/include/exec/exec-all.h
>>> +++ b/include/exec/exec-all.h
>>> @@ -296,6 +296,15 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
>>>  void tlb_set_page(CPUState *cpu, target_ulong vaddr,
>>>                    hwaddr paddr, int prot,
>>>                    int mmu_idx, target_ulong size);
>>> +
>>> +/*
>>> + * Find the iotlbentry for ptr.  This *must* be present in the TLB
>>> + * because we just found the mapping.
>>> + */
>>> +void tlb_assert_iotlb_entry_for_ptr_present(CPUArchState *env, int ptr_mmu_idx,
>>> +                                            uint64_t ptr,
>>> +                                            MMUAccessType ptr_access,
>>> +                                            uintptr_t index);
>>
>> Probably worth making this an empty inline for the non CONFIG_DEBUG_TCG
>> case so we can eliminate the call to an empty function.
> 
> But then we can't make tlb_addr_write() static (next patch) and
> we still have to include "tcg/tcg.h" for the TCG_OVERSIZED_GUEST
> definition...

Certainly you can, though it's not especially pretty:

#ifdef CONFIG_DEBUG_TCG
void tlb_assert_iotlb_entry_for_ptr_present
      (CPUArchState *env, int ptr_mmu_idx,
       uint64_t ptr, MMUAccessType ptr_access,
       uintptr_t index);
#else
static inline void
tlb_assert_iotlb_entry_for_ptr_present
      (CPUArchState *env, int ptr_mmu_idx,
       uint64_t ptr, MMUAccessType ptr_access,
       uintptr_t index)
{ }
#endif


r~
