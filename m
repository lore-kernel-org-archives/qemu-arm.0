Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp353297njl;
        Tue, 8 Oct 2024 10:32:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQ6Y2CDKtrYUMa06lkfk+4eAhMlzRxm4dip6mlcQxJ+zDCAX14MLjYgM6DrohmQZ/xD350lS0jnySXmg==@linaro.org
X-Received: by 2002:a05:6a00:3c88:b0:71e:2e2:c91b with SMTP id d2e1a72fcca58-71e02e2ca3fmr10988950b3a.27.1728408765862;
        Tue, 08 Oct 2024 10:32:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728408765; cv=none;
        d=google.com; s=arc-20240605;
        b=Mg+fy0byLz4bB4cClgo41BupTtn8YolA4H0ihSD0LovKPp8g36VGbdnkVdHTXz3Hge
         OHordHvAkvOKct/wtf0lE0weiGv7ud48Dfj+xPXJ6bzWKTrWobKn0bAArO+y3+CcCZMJ
         iWMonMthezs5tO9e7uIAJxkKFMoAlDATl+Vbh8YxHXy2FLpJNZkdkZrFS6M2V0vZkIka
         BCI9NmB7P/TY0BSNqoVFO+uvN+q9HN2l8zp09vT0gKaOrCpsJAPoT1iaxH3Bsujvrsw+
         3VKJCf+8gqBj0pcuOlkVaDFXvn7zymtmMA3qNtlMRIF34qHkcHUGkFCG82Tytr2xTxu2
         Q1Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=U4Y923DNTB69Q7mP3ieLv48ZUpge+neE9bsJN+T0+x8=;
        fh=WIGN84APW/xdQEvcRkgIR7Snnbhv07XbYLjcW4P3+ak=;
        b=a3zWYfTXfyglLcRGrRNRqq6Ge/Twk0913alAUX89+qpetW2Etx/2BI6ebr3uIjjFfO
         ceKlRGYYWM0Lzj7fTP+8Y1B95x8CDXujFyyw5P1NNkGmrt0A9lE8zfslezfkqJgDfIYj
         0ZSKG+sxu00HH+cyS0vf+rhibsYzReZ0MSklSC2U28hIlqJliBfbVk+z+K5A/HailAIY
         AW4sU5J8aZrn0F+UadtrMYo110Ry6j4KjAAo9GSwpfhYHT3Of6TUFNHF7lzXvulGMXOz
         blYhFQ9gnkO1l2seLAlqTqAkoQLgUYXw0Tq6wDbFhjoIpeWQbIqQ+gA+BDhh1P0mOMFV
         HDJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aKJKPzEg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71df0d7f3fesor5473786b3a.12.2024.10.08.10.32.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 10:32:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aKJKPzEg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728408765; x=1729013565; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U4Y923DNTB69Q7mP3ieLv48ZUpge+neE9bsJN+T0+x8=;
        b=aKJKPzEgxYiIIbjOZusW6+v6Xg60AwbcCVBFZ15FSX34OD1J+7CG2HBqq5H37+5U7I
         vdH3Mw+YMqL2sB5rjCOB70NIMzI2I8klZyy/5R9QMm6yQ2lJw6NTbLboApYEscdw/goY
         tSgf8E4LIZJMDqsD7o8LnGALkIiRGGm3uWqODZbGn/nvzfA8G238t5fDZGQgs5Ede1AP
         wbdwtAHIMIA1rennS6m5D63gzmRs+/si1z9dDyLhQR7FhOgLzBt4ErxLjO2YzU+Bi8Dn
         MVwbq0xP2AoiHXY75nZhjo3tyH7HbzwMU2cThjW/RAnhzfC86y5xvhaRGwL+5iArjeae
         wBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728408765; x=1729013565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U4Y923DNTB69Q7mP3ieLv48ZUpge+neE9bsJN+T0+x8=;
        b=Vk4GW6LJ44zlhOKwIRxszKtGj0kJeSONk6h5wsVAj3iInbl7WaQQRe5VpVK9Kgk2b1
         aX3lbz5iLWr9asL059pQZCSsGnWDIqfbad3I3iJ2keRbJUfUCzD24UB9qMAPMnW2xdhb
         h0F/+yI/XW949nkZbPKB0nP7u8bnDvsX9Al8pCG3S/agfwzk45/psCw6kIeZJws74duA
         NGuzZK+XorsTC2pcrhAMjJrdV57puRJCMCilffkjwS6r/vE8QaXPowBypAK940SX0Zhz
         CNH0xUZQyeqGLOHhVmNdga4eBOr4mXYz77d9CJ/TmBxZs6beZyt5Av4leU05N40KxRpE
         azYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU936qglNAJSewjShhVj7shR238vCJKvxoMAYF1v1zu9jt+/5e4XDvenHDDyOx7BTspiNC07HwcSKcDKQ==@linaro.org
X-Gm-Message-State: AOJu0YwGy8sL0sojnTjzNH/o+DtHaU9CGcY4NLL8qKO/+TYc0YQv8lDV
	V05jinoxzXvxIzEPu6NT64GrWxio9cL1WxrItixRQd8/EwgIjtaLdc1hqWegEAT0PQ==
X-Google-Smtp-Source: AGHT+IGNqyg5pdejspXKBggqd2RvQRJTE4x6tHjisJvKdNG8KH+pUiftg7ccR+Rf3hDmeAa8Wu2wqw==
X-Received: by 2002:a05:6a00:1904:b0:71e:1722:d019 with SMTP id d2e1a72fcca58-71e1722d508mr3560925b3a.22.1728408765209;
        Tue, 08 Oct 2024 10:32:45 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d67beasm6573709b3a.179.2024.10.08.10.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 10:32:44 -0700 (PDT)
Message-ID: <5c33b223-10cc-4ad6-a3e8-15082266b31d@linaro.org>
Date: Tue, 8 Oct 2024 10:32:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/21] target/arm: Pass MemOp to get_phys_addr
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-14-richard.henderson@linaro.org>
 <CAFEAcA_jXTuB6c8oVcXmi66zcXn5-PYM7W9z1wf7-fzXg7_Oiw@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_jXTuB6c8oVcXmi66zcXn5-PYM7W9z1wf7-fzXg7_Oiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: sVIK1YGnT+iw

On 10/8/24 07:45, Peter Maydell wrote:
> On Sat, 5 Oct 2024 at 21:06, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Zero is the safe do-nothing value for callers to use.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/internals.h      | 3 ++-
>>   target/arm/ptw.c            | 2 +-
>>   target/arm/tcg/m_helper.c   | 8 ++++----
>>   target/arm/tcg/tlb_helper.c | 2 +-
>>   4 files changed, 8 insertions(+), 7 deletions(-)
> 
>> diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
>> index 23d7f73035..f7354f3c6e 100644
>> --- a/target/arm/tcg/m_helper.c
>> +++ b/target/arm/tcg/m_helper.c
>> @@ -222,7 +222,7 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
>>       int exc;
>>       bool exc_secure;
>>
>> -    if (get_phys_addr(env, addr, MMU_DATA_STORE, mmu_idx, &res, &fi)) {
>> +    if (get_phys_addr(env, addr, MMU_DATA_STORE, 0, mmu_idx, &res, &fi)) {
>>           /* MPU/SAU lookup failed */
>>           if (fi.type == ARMFault_QEMU_SFault) {
>>               if (mode == STACK_LAZYFP) {
>> @@ -311,7 +311,7 @@ static bool v7m_stack_read(ARMCPU *cpu, uint32_t *dest, uint32_t addr,
>>       bool exc_secure;
>>       uint32_t value;
>>
>> -    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi)) {
>> +    if (get_phys_addr(env, addr, MMU_DATA_LOAD, 0, mmu_idx, &res, &fi)) {
>>           /* MPU/SAU lookup failed */
>>           if (fi.type == ARMFault_QEMU_SFault) {
>>               qemu_log_mask(CPU_LOG_INT,
> 
> We do actually know what kind of memory operation we're doing here:
> it's a 4-byte access. (It should never be unaligned because an M-profile
> SP can't ever be un-4-aligned, though I forget whether our implementation
> really enforces that.)
> 
>> @@ -2009,7 +2009,7 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool secure,
>>                         "...really SecureFault with SFSR.INVEP\n");
>>           return false;
>>       }
>> -    if (get_phys_addr(env, addr, MMU_INST_FETCH, mmu_idx, &res, &fi)) {
>> +    if (get_phys_addr(env, addr, MMU_INST_FETCH, 0, mmu_idx, &res, &fi)) {
>>           /* the MPU lookup failed */
>>           env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_IACCVIOL_MASK;
>>           armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM, env->v7m.secure);
> 
> Similarly this is a 16-bit load that in theory should never
> be possible to be unaligned.
> 
>> @@ -2045,7 +2045,7 @@ static bool v7m_read_sg_stack_word(ARMCPU *cpu, ARMMMUIdx mmu_idx,
>>       ARMMMUFaultInfo fi = {};
>>       uint32_t value;
>>
>> -    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi)) {
>> +    if (get_phys_addr(env, addr, MMU_DATA_LOAD, 0, mmu_idx, &res, &fi)) {
>>           /* MPU/SAU lookup failed */
>>           if (fi.type == ARMFault_QEMU_SFault) {
>>               qemu_log_mask(CPU_LOG_INT,
> 
> and this is another 4-byte load via sp.
> 
>> diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
>> index 885bf4ec14..1d8b7bcaa2 100644
>> --- a/target/arm/tcg/tlb_helper.c
>> +++ b/target/arm/tcg/tlb_helper.c
>> @@ -344,7 +344,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>>        * return false.  Otherwise populate fsr with ARM DFSR/IFSR fault
>>        * register format, and signal the fault.
>>        */
>> -    ret = get_phys_addr(&cpu->env, address, access_type,
>> +    ret = get_phys_addr(&cpu->env, address, access_type, 0,
>>                           core_to_arm_mmu_idx(&cpu->env, mmu_idx),
>>                           &res, fi);
>>       if (likely(!ret)) {

The question is: if it should be impossible for them to be misaligned, should we pass an 
argument that checks alignment and then (!) potentially raise a guest exception.

I suspect the answer is no.

If it should be impossible, no alignment fault is ever visible to the guest in this 
context, then we should at most assert(), otherwise do nothing.

We *can* pass, e.g. MO_32 or MO_16 for documentation purposes, if you like.  Without 
additional adornment, this does not imply alignment enforcement (i.e. MO_ALIGN).  But this 
would be functionally indistinguishable from 0 (which I imperfectly documented with "or 0" 
in the function block comments).


r~
