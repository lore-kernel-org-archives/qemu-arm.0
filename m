Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1177550lfc;
        Mon, 8 Feb 2021 05:52:49 -0800 (PST)
X-Received: by 2002:a1c:113:: with SMTP id 19mr11885362wmb.7.1612792369427;
        Mon, 08 Feb 2021 05:52:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612792369; cv=none;
        d=google.com; s=arc-20160816;
        b=EKy01zYww/mOpG4ZA7JgkGV1kTvuvfYplr1udmzZoiaIbzyfdx9CnUcZilfhYhwLvf
         V/p441XR1hfAZAPLHb4lqYlqDf/Up6F1LLPtMaQNlXjSpANI8Jo5dUS7TX8F5+cUF/iG
         31mvNpIOEbjScPRIj88SvI4sblx2XQb4Neh6QDGSVhjrzSBbV44goGCAhrMzHeeLy+1E
         MPpfZHBJGLbvIbC/rwzYu9P3iCiRhCXi2oO5OaLeM5++kM3kDYbHj9dieE1x0uzpvLyL
         leS4bmoYFWPpNk06aLEVA6VnWX7j7MO8i/xetWcT5AD2c9lNm6YHDJ6lg/wcRffRnQQv
         OZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=RO1fjUbPuaoEr7p6+/bv1uAV/ae5IRUpPRFbET0L9rM=;
        b=FH+3Lv9RF9nmrQp39ED6cJmaS4YIzKt2OrZjI5sWjIkyzCcmjRPGEj/IXCtmmqlbcz
         E9YMEh3gA2bF9FSqpRreQvnOvLwDMLM2f7WEZjRAcdg5Q97s5/RBoX99cT7NF9+gC+lL
         vpCeLDm7RegwVEONf8xXhWUflxybOXsX9joRUJCfoLhgbNpUdg4Qvl81b4TKF1Xy91w4
         b0xz57LR+GhV1Txh4J8Vw8DpY7PETuJoV2hLhylpYUx9hkMwXs1rDxHvDe+kCSVbKC8G
         gEZKqbtl4yWaInLN1mYkvgNOsbWI93D/h/aM9wzx7m+YIpcOAa6YXAAgbI4SCygu3pHi
         LMUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zw+zqYLV;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a15sor9315119wru.16.2021.02.08.05.52.49
        (Google Transport Security);
        Mon, 08 Feb 2021 05:52:49 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zw+zqYLV;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RO1fjUbPuaoEr7p6+/bv1uAV/ae5IRUpPRFbET0L9rM=;
        b=Zw+zqYLVHWb/tdInaOgxyIQEeBFiWq8kpg6G8cPmDh/G8CLsn6soPtQbY2TYi0FJPJ
         v/Muybyo9zHn3nQHE60ADe3pebZA3XFv6sV6tdSc3pF/cLWWEj8pKDAq15ZxOdXj/A10
         8wDVqIiJWRm+RZVyU1Hw5pMPcmolu6SWlNjVX1tgvcO0R8WztXZ4N4+rIYD5vPUuf5My
         wTzvlWMyt6WjY1aRJaCh8hbqfMapSK/5ptybQ8bS+i947x1XS1E13OP3aPi3DXlIbMoX
         R7whh5UcOMgquEabRUQ355+jWPMcNyR35IZKMnMUk6lih2VmUh/X9vnFVaPxseSuDNPs
         aMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RO1fjUbPuaoEr7p6+/bv1uAV/ae5IRUpPRFbET0L9rM=;
        b=bP3xl+e4XDCslOm0NGPJ9SPO84/JlHryZ/Bw0em2QfIFh8rGUll6h9m3xfPKQDSroC
         OePB7PA/MUmm2dB6lORzAas//dkY+leTFhGCuUhul51RnXptBTsAUXXXQlZzxuIGBZxF
         /pqeVSf296FMCLtwb1fmP8aKlUt5OD+jZzyLuQYz6B8vYUgSc3dqc/Q+GpiUIr/NmG4K
         XI2ZD4deyCcEkAIkULxvyiXIlfkJ5Jlioaf4K3C8kZgHXd4LC29ZkyUtr2bW0J7HFzY0
         3ncD14VPNsBFZPPSKkHqIWXeoxtSVL78CqbEQF3jrApUw+z6QRWf/vKtciIDjRDmM1qG
         Xc+w==
X-Gm-Message-State: AOAM530J4qSqILxgnK7KtDGhI/NEnlJgm9tFV71WMbMos5y9TAuWS12H
	f40HkiKj1cxKDXSYjCC23Rs=
X-Google-Smtp-Source: ABdhPJyWJe2lgkK058CdMWRHq9VZQGyidshG36Fqs0fj0VRgGWq3Ku1z1XGTWDf+3/1AnvaoCaXAfQ==
X-Received: by 2002:a5d:5051:: with SMTP id h17mr20663485wrt.164.1612792369192;
        Mon, 08 Feb 2021 05:52:49 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id z15sm11933382wmi.38.2021.02.08.05.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Feb 2021 05:52:48 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [RFC PATCH v2 5/6] accel/tcg: Refactor debugging
 tlb_assert_iotlb_entry_for_ptr_present()
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-riscv@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20210207232310.2505283-1-f4bug@amsat.org>
 <20210207232310.2505283-6-f4bug@amsat.org> <87im73aqsq.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <83c71866-2e28-2edb-d79d-f4f96bb765a1@amsat.org>
Date: Mon, 8 Feb 2021 14:52:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87im73aqsq.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: d6nzwcpH/v0k

On 2/8/21 9:42 AM, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> Refactor debug code as tlb_assert_iotlb_entry_for_ptr_present() helper.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> What this code does is out of my league, but refactoring it allow
>> keeping tlb_addr_write() local to accel/tcg/cputlb.c in the next
>> patch.
> 
> The assertion that the table entry is current is just a simple
> housekeeping one. The details of how the MTE implementation uses
> (abuses?) the iotlb entries requires a closer reading of the code.
> 
>> ---
>>  include/exec/exec-all.h |  9 +++++++++
>>  accel/tcg/cputlb.c      | 14 ++++++++++++++
>>  target/arm/mte_helper.c | 11 ++---------
>>  target/arm/sve_helper.c | 10 ++--------
>>  4 files changed, 27 insertions(+), 17 deletions(-)
>>
>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>> index f933c74c446..c5e8e355b7f 100644
>> --- a/include/exec/exec-all.h
>> +++ b/include/exec/exec-all.h
>> @@ -296,6 +296,15 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
>>  void tlb_set_page(CPUState *cpu, target_ulong vaddr,
>>                    hwaddr paddr, int prot,
>>                    int mmu_idx, target_ulong size);
>> +
>> +/*
>> + * Find the iotlbentry for ptr.  This *must* be present in the TLB
>> + * because we just found the mapping.
>> + */
>> +void tlb_assert_iotlb_entry_for_ptr_present(CPUArchState *env, int ptr_mmu_idx,
>> +                                            uint64_t ptr,
>> +                                            MMUAccessType ptr_access,
>> +                                            uintptr_t index);
> 
> Probably worth making this an empty inline for the non CONFIG_DEBUG_TCG
> case so we can eliminate the call to an empty function.

But then we can't make tlb_addr_write() static (next patch) and
we still have to include "tcg/tcg.h" for the TCG_OVERSIZED_GUEST
definition...

> 
>>  #else
>>  static inline void tlb_init(CPUState *cpu)
>>  {
>> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
>> index 8a7b779270a..a6247da34a0 100644
>> --- a/accel/tcg/cputlb.c
>> +++ b/accel/tcg/cputlb.c
>> @@ -429,6 +429,20 @@ void tlb_flush_all_cpus_synced(CPUState *src_cpu)
>>      tlb_flush_by_mmuidx_all_cpus_synced(src_cpu, ALL_MMUIDX_BITS);
>>  }
>>  
>> +void tlb_assert_iotlb_entry_for_ptr_present(CPUArchState *env, int ptr_mmu_idx,
>> +                                            uint64_t ptr,
>> +                                            MMUAccessType ptr_access,
>> +                                            uintptr_t index)
>> +{
>> +#ifdef CONFIG_DEBUG_TCG
>> +    CPUTLBEntry *entry = tlb_entry(env, ptr_mmu_idx, ptr);
>> +    target_ulong comparator = (ptr_access == MMU_DATA_LOAD
>> +                               ? entry->addr_read
>> +                               : tlb_addr_write(entry));
>> +    g_assert(tlb_hit(comparator, ptr));
>> +#endif
>> +}
>> +
>>  static bool tlb_hit_page_mask_anyprot(CPUTLBEntry *tlb_entry,
>>                                        target_ulong page, target_ulong mask)
>>  {
>> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
>> index 6cea9d1b506..f47d3b4570e 100644
>> --- a/target/arm/mte_helper.c
>> +++ b/target/arm/mte_helper.c
>> @@ -111,15 +111,8 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
>>       * matching tlb entry + iotlb entry.
>>       */
>>      index = tlb_index(env, ptr_mmu_idx, ptr);
>> -# ifdef CONFIG_DEBUG_TCG
>> -    {
>> -        CPUTLBEntry *entry = tlb_entry(env, ptr_mmu_idx, ptr);
>> -        target_ulong comparator = (ptr_access == MMU_DATA_LOAD
>> -                                   ? entry->addr_read
>> -                                   : tlb_addr_write(entry));
>> -        g_assert(tlb_hit(comparator, ptr));
>> -    }
>> -# endif
>> +    tlb_assert_iotlb_entry_for_ptr_present(env, ptr_mmu_idx, ptr,
>> +                                           ptr_access, index);
>>      iotlbentry = &env_tlb(env)->d[ptr_mmu_idx].iotlb[index];
>>  
>>      /* If the virtual page MemAttr != Tagged, access unchecked. */
>> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
>> index c8cdf7618eb..a5708da0f2f 100644
>> --- a/target/arm/sve_helper.c
>> +++ b/target/arm/sve_helper.c
>> @@ -4089,14 +4089,8 @@ static bool sve_probe_page(SVEHostPage *info, bool nofault,
>>      {
>>          uintptr_t index = tlb_index(env, mmu_idx, addr);
>>  
>> -# ifdef CONFIG_DEBUG_TCG
>> -        CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
>> -        target_ulong comparator = (access_type == MMU_DATA_LOAD
>> -                                   ? entry->addr_read
>> -                                   : tlb_addr_write(entry));
>> -        g_assert(tlb_hit(comparator, addr));
>> -# endif
>> -
>> +        tlb_assert_iotlb_entry_for_ptr_present(env, mmu_idx, addr,
>> +                                               access_type, index);
>>          CPUIOTLBEntry *iotlbentry = &env_tlb(env)->d[mmu_idx].iotlb[index];
>>          info->attrs = iotlbentry->attrs;
>>      }
> 
> with the inline fix:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 
