Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp620114ejq;
        Fri, 5 May 2023 11:57:46 -0700 (PDT)
X-Received: by 2002:adf:edd2:0:b0:306:4438:17f6 with SMTP id v18-20020adfedd2000000b00306443817f6mr2109715wro.40.1683313065928;
        Fri, 05 May 2023 11:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683313065; cv=none;
        d=google.com; s=arc-20160816;
        b=J+TF0S/Giunsq3/Y7ozSfg+If8ISUhjf24f9nC2f9fsBTodPYfmWd/cOUK/Z0FXNmO
         0AUi6xrfB75kpw91G7LIASAOmSEPYxPwwdp8UC1CLfK896LKbw9Au+fOK85OeM5Zj03N
         oN3Fj1UqXZ0pvc0UwsZ/wtNCSyjBvu5/coliEGzKsN2qFMeusVYcwfrfMPgghtEvxpOW
         ysg1gSnL/EndjY/RBQNg0VXOTN8+msFS8n7cY0se4c6ABJjlhidg0G1dMKI36+WrLoMI
         jGXg3qNeUltvsl0RXpx4l6YWtd7OPzUfbwhxFL2wWa86OKABVGgzVadBA0y/lG3zBKi/
         CaCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=XwsOKCZcG8dxRC/FHTq259hilGllCAYBzaMsqg4bGAA=;
        b=daWkWsR5T7DFgi7Bck8TjQPVygwoTs9nAxmMh9gjO2bBa1pg3WMllTmEeLcNEPakVQ
         denKCvIOGvCxv+2Z2auzP4xXUEFLknoug2ZsRLg+Jt/kiw+aR3jXS4Xu7ufHQWm6B7lg
         7Hpww+MGe0/ldTEG7t3+9DYg28nmlBjDhuCA4T3yK1kJ1n5b8vfpXKH0yHGdBDvhM6QX
         Wvg+pNunfYFQh6oMOKbRXDbR2AK1CMkXK4GAy/azNO63N5bbeUJwTC5wulE3R6+MlEk9
         z55u3JpDBWGOE54ckF1H6Thu/uTan/Msdf/4FWKwwQCjFwg6/8YDvV10jwf/tixW01zM
         m86g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vwngw8AT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h25-20020adfa4d9000000b003062d23abdfsor770808wrb.4.2023.05.05.11.57.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 May 2023 11:57:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vwngw8AT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683313065; x=1685905065;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XwsOKCZcG8dxRC/FHTq259hilGllCAYBzaMsqg4bGAA=;
        b=Vwngw8ATlGqKotdkwpD9rjzqElmB0wHCJR7SLEWS3lxRPccIcWnv/E5usy5QkseALS
         Apt38GOv9VWnd3+lgjsSU10gPVHe4pcwrzvJKvRjqnaku+qA0QNufMUTfw8wHi3eL0X7
         6NETeshi8VKsRdjR3fkvmHvpDwFJEHEE3/aN5IGTtj2ueweCqxZ11ZSD7IxpKMgmoJWM
         WVTghFFx5SWkOxAEIbhL1PMIgsPGXRs/EAEqzAJvVTGmwfaNjy2+r5j8tI1Hb/ukVEOE
         43aLXHJM6YYG5e9OqvtURlLQV6UwHLy9cd1dSgfA8QI4BIZCee/HRyH9kqfH3HQhdTr7
         JeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683313065; x=1685905065;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XwsOKCZcG8dxRC/FHTq259hilGllCAYBzaMsqg4bGAA=;
        b=B+RSS0Xg+hi1pgat8Le5Nn3Qh9eZ966smFP+VMGBPCNF8MwhAYuWKcYPCyAh9LPCWj
         TJTJmnTcPajhDs7aNeOfy6+zBZqCvbJUYgId3oDflz72cAqNDkojCKRPE56bFzVlf81+
         qpOzjjbKR4RW+Olnw/88XLPZxtkc82mRLYeaNOHOsD4JMzHObk7sfZ0AVpPP1Ya5OOnX
         YQJAnDQlj0LwChTnpKTlg6X88q+7+Mp99p1DJ+TBYyfHiSzWJ7Xy4wPszrgYc0nz153i
         DUNckRusFLQo8jCO+GHGT+JqHgeMUYCen1xM4YtCt4Noc+IEDP4qflweky85BiPhQrX4
         ljkA==
X-Gm-Message-State: AC+VfDzJZLgzkX4gSQK/7qqtqOp1Byg/hr6imu2mOOgcYdkOs1j+49gz
	BCyNsU9ugs+6H6124bbHm0RRtymR
X-Google-Smtp-Source: ACHHUZ4+Xt3Ag3A/uB07vr4ecLaqBVznZ17ztP6nDataDQjXU1HIjRqhU060CAi7MlebIsQ8fPpsZQ==
X-Received: by 2002:adf:e909:0:b0:306:2c5c:980a with SMTP id f9-20020adfe909000000b003062c5c980amr1966953wrm.31.1683313065542;
        Fri, 05 May 2023 11:57:45 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.20.44] ([212.241.182.8])
        by smtp.gmail.com with ESMTPSA id d6-20020a056000114600b00306344eaebfsm3173365wrx.28.2023.05.05.11.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 11:57:45 -0700 (PDT)
Message-ID: <45cba357-ba20-399a-27e6-5e99741179d0@linaro.org>
Date: Fri, 5 May 2023 19:57:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 03/57] accel/tcg: Introduce tlb_read_idx
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-4-richard.henderson@linaro.org>
 <CAFEAcA858-D37=MrvYnGxBVkL1V14wZ_JLEzFahbweRUDvPmwg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA858-D37=MrvYnGxBVkL1V14wZ_JLEzFahbweRUDvPmwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: WAo4CIPOwsA5

On 5/4/23 16:02, Peter Maydell wrote:
> On Wed, 3 May 2023 at 08:15, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Instead of playing with offsetof in various places, use
>> MMUAccessType to index an array.  This is easily defined
>> instead of the previous dummy padding array in the union.
>>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
>> @@ -1802,7 +1763,8 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
>>       if (prot & PAGE_WRITE) {
>>           tlb_addr = tlb_addr_write(tlbe);
>>           if (!tlb_hit(tlb_addr, addr)) {
>> -            if (!VICTIM_TLB_HIT(addr_write, addr)) {
>> +            if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_STORE,
>> +                                addr & TARGET_PAGE_MASK)) {
>>                   tlb_fill(env_cpu(env), addr, size,
>>                            MMU_DATA_STORE, mmu_idx, retaddr);
>>                   index = tlb_index(env, mmu_idx, addr);
>> @@ -1835,7 +1797,8 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
>>       } else /* if (prot & PAGE_READ) */ {
>>           tlb_addr = tlbe->addr_read;

read

>>           if (!tlb_hit(tlb_addr, addr)) {
>> -            if (!VICTIM_TLB_HIT(addr_write, addr)) {

write

>> +            if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_LOAD,
>> +                                addr & TARGET_PAGE_MASK)) {
> 
> This was previously looking at addr_write, but now we pass
> MMU_DATA_LOAD ?

This is the read portion of the read+write check.  The write portion is above in the 
previous hunk.  So this is an existing error, fixed here, and I hadn't noticed.


r~
