Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp541580njm;
        Tue, 29 Apr 2025 14:07:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUrDzHbo7GikUFIt+AktoFlXDpGMaALe+WZxY/AsK0vaA3ITUItxo/HJS2m3ztVXgmQzAACBgZANK7hRg==@linaro.org
X-Received: by 2002:a17:903:190d:b0:220:d439:2485 with SMTP id d9443c01a7336-22df34fc207mr11739085ad.29.1745960825266;
        Tue, 29 Apr 2025 14:07:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745960825; cv=none;
        d=google.com; s=arc-20240605;
        b=kWq9zXDyMi0+5pakqiuPOzYxeXDUFqK8ElXU6dV0O6+DHFGMajOgE32W1TUSvNT5t1
         Kw1kTt/jmNaOkcHDSmDusdQ8YpJT3X64dk8tTdDack3jK5zo2gCMp4d6N9eKbSuyMGrS
         WTctwQE1Rq/VEm+eVc5VYFNb3zZTfyJKeXP/OvJPS3tvSU6k/eQ6gk6OyuxDxoJ6eiSi
         SYUZu8uno1DknL6rVbfDeIwvz2csoo87hyK8dFO0W4Nk5Sw2qf2gvrBT58rTNQV82QS5
         SIZdmV+p8lRJy73OtmifV58wBm8JjMV8z5x8ViwMRkkq90yzV/dYz5La+URNqWwZHgwg
         3GyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=J0R7aQy+3GY23ZMFehDXTfzL4PuUym9QxuFfe3VQUYA=;
        fh=iFdc3WL2o1wLKEgdI5IE2ZT6EodcvXQ7PTkYQEhgzSA=;
        b=iMgos93ANJf6KGAvhHGVTulSHPpsg1fTRZ4ToBRFTbjFwTp+cCmh4tZ4njCfkhM+F0
         p653VwL069/jdb33HRaegFt2qq+pQ9bWXxKwcs7rr3GHlUTBk0296ZFm5Da+eAcs7tTV
         xoGOPn7zVBrPkp7f4gVG8TFrB1QHEcN71782bg84QjSYE+bcLM/nb4NRfC0ZcnelNc4H
         As2XKWIJZvDBgSd+POk3167pTJrkKorikXekG7HMqi+/plC1UjZwGvAeuLkeyIy32LS3
         e9vTdFztfP3jk2LdiVah8KBdHyFADDKqb9dbcjq9NwxcOwOpUd5/087006gDnZltbTFb
         unAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oNuLmWDV;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b15faaf8113sor6520581a12.7.2025.04.29.14.07.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Apr 2025 14:07:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oNuLmWDV;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745960825; x=1746565625; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J0R7aQy+3GY23ZMFehDXTfzL4PuUym9QxuFfe3VQUYA=;
        b=oNuLmWDVba12MO9vZwMkS3JvItu8nvb/SUB2iUOpI3lxCXJOkj4hyzSo9DNgS8o7T3
         +pr5l4Ou0AhRGA9w7T6wyZDlG8CJCc9UdjPAqEqUu2lhzzlMEBOlsPXYbFwO5aVS37fn
         LoCuccavUDL7s5iVSflO7yDkg72+dSmPn6X07QSWMtlRvnygf4KOPh4787ZOgfZ87oxo
         MHpHry2qswxsCEwMN08JO4PNsDFlp0EcjwLLgEDQeIHkH6Z6lUQev4YEJgg6Qt86wgq3
         L2406+PPR3QS/iApt67hVGMAg/2lzWJ8idKPuhW2Pf0Vw5FWYNTZ+uH9bsLiQkWt47Ko
         fLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745960825; x=1746565625;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J0R7aQy+3GY23ZMFehDXTfzL4PuUym9QxuFfe3VQUYA=;
        b=oW5XbC3lBGjzu0zkTYA6MfYyHckCkGefvQUBXQQix73D8kPJ8+0hxR5419wKsqXe6z
         C1eZ7oqRxacVx70zM9M+07RKcBYoojbRrMZDAmF3MQi2Xz7TTSEFruqXusm36OkWmL9U
         fP9dumGkKdPpLP3frmzmo6Ms0OSQqB3wOXuBe4ZDjF9djrvzh7j4G6mh/KTwRpjFEqMh
         WjGa2HI48nw3DUm+bDBxycgKBXcuEONA7i3h8P+ZoAP/FRTl3ps+RSUGJeTw5clt2jbt
         xLMl1g3mTnfMQtAyvjybP8aSpXBPmIB+IdfHsLbVGvHG74x4Kq/DGpV52JKI+q68RgOy
         6Eqg==
X-Forwarded-Encrypted: i=1; AJvYcCUphjTLcLl8h5zQ074177dDuUmxLVuFBZfQMcXXpUdb2LEF/8lnHKk0NhHOKAdNiIv5BtcwPK8JwXVg2w==@linaro.org
X-Gm-Message-State: AOJu0YzxWeI+0vME7HOKjo3CG5A0tCHUDS5v2/LATEoOCt2jeOzxVhxT
	o9TiNGJwj9uowegUAlT/XFzB46Q+c+y/VQuruf9WfAbn8E48ZDKpS33YkxCRCpgpLw==
X-Gm-Gg: ASbGncsAwccZ4xznbgyQvAU9PmzHIVbNwckqaHWKflJqp1lPf+9B737ceAQBcpfk8cV
	kzGjZQlOOSIGoixdSEixZqD/OmxwJYE/C1Kct4/7w+NUkz08w5KCJWSwZMbGx5ZPwtGqjqEkaMR
	PhinnA+DmLBAyJVDpe35YfFPtvPh04eKmvtC6yfgBYfEgQeHvsOcvNgUhQp8N6EbO92FumN9zyX
	mCjZT8XLRRBBCV0bNW0NRmhNPuCraqB/OJtLL/SoLz0GbCY+C6EVUoTZ1lrqLk/qECvtmAcuvZd
	YHHIl+Beu48/ODAJa00PJe4mXZ6Z6exl4g/ttDegOv48LbI5Zp2WSg==
X-Google-Smtp-Source: AGHT+IH32wV8hOys1/FlSKA99ZrcKLdxQ/jVjCKspBhTfIoQlbisbUoYD7FByxZw5MrxgeqxouXjtA==
X-Received: by 2002:a05:6a00:10ce:b0:739:56c2:b661 with SMTP id d2e1a72fcca58-740389b795bmr898455b3a.12.1745960824759;
        Tue, 29 Apr 2025 14:07:04 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a5c36bsm146946b3a.132.2025.04.29.14.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 14:07:04 -0700 (PDT)
Message-ID: <6e628189-f497-4d95-a6ac-c3cc726be2ad@linaro.org>
Date: Tue, 29 Apr 2025 14:07:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] target/arm/cpu: get endianness from cpu state
To: Anton Johansson <anjo@rev.ng>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, alex.bennee@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, richard.henderson@linaro.org
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
 <20250429050010.971128-10-pierrick.bouvier@linaro.org>
 <bwdflzaiqdpq33uzowvrgjbha3wye6k74puwur755pq27z67eu@mnc2ze4it5cl>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
In-Reply-To: <bwdflzaiqdpq33uzowvrgjbha3wye6k74puwur755pq27z67eu@mnc2ze4it5cl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 4FQwD1BK8ft8

On 4/29/25 5:26 AM, Anton Johansson wrote:
> On 29/04/25, Pierrick Bouvier wrote:
>> Remove TARGET_BIG_ENDIAN dependency.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>   target/arm/cpu.c | 22 +++++++++++-----------
>>   1 file changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index e7a15ade8b4..85e886944f6 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -67,6 +67,15 @@ static void arm_cpu_set_pc(CPUState *cs, vaddr value)
>>       }
>>   }
>>   
>> +static bool arm_cpu_is_big_endian(CPUState *cs)
>> +{
>> +    ARMCPU *cpu = ARM_CPU(cs);
>> +    CPUARMState *env = &cpu->env;
>> +
>> +    cpu_synchronize_state(cs);
>> +    return arm_cpu_data_is_big_endian(env);
>> +}
>> +
>>   static vaddr arm_cpu_get_pc(CPUState *cs)
>>   {
>>       ARMCPU *cpu = ARM_CPU(cs);
>> @@ -1130,15 +1139,6 @@ static void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
>>   #endif
>>   }
>>   
>> -static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
>> -{
>> -    ARMCPU *cpu = ARM_CPU(cs);
>> -    CPUARMState *env = &cpu->env;
>> -
>> -    cpu_synchronize_state(cs);
>> -    return arm_cpu_data_is_big_endian(env);
>> -}
>> -
>>   #ifdef CONFIG_TCG
>>   bool arm_cpu_exec_halt(CPUState *cs)
>>   {
>> @@ -1203,7 +1203,7 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
>>   
>>       info->endian = BFD_ENDIAN_LITTLE;
>>       if (bswap_code(sctlr_b)) {
>> -        info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
>> +        info->endian = arm_cpu_is_big_endian(cpu) ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
>>       }
> 
> I'm not the most familiar with arm but as far as I can tell these are
> not equivalent. My understanding is that arm_cpu_is_big_endian() models
> data endianness, and TARGET_BIG_ENDIAN instruction endianness.
> 
> Also, for user mode where this branch is relevant, bswap_code() still
> depends on TARGET_BIG_ENDIAN anyway and the above branch would reduce to
> (on arm32)
> 
>    if (TARGET_BIG_ENDIAN ^ sctlr_b) {
>        info->endian = sctlr_b ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
>    }
> 
> giving the opposite result to the original code.
> 

Ooops, that's a good point, I missed it was calling 
arm_cpu_data_is_big_endian under the hoods.

I'll stick to target_big_endian().

Thanks,
Pierrick
