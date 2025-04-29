Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp565098njm;
        Tue, 29 Apr 2025 15:02:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a29:b0:736:69aa:112c with SMTP id d2e1a72fcca58-74038989dc9mr1050006b3a.9.1745964155949;
        Tue, 29 Apr 2025 15:02:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745964155; cv=none;
        d=google.com; s=arc-20240605;
        b=b6yxk6Mj96tw+FyySXOrF16JLCWnRjxJX2ry6HjYBg5VB9K78aJ18KNws8Aais4j/j
         QahV6ggx8IE0oshLIprzUvsKUMrN419o6QD8KyJAr5BQeKldhnLegXkms3B5xZaDHHDu
         fEc+8J0BVRtimyjE7pIgkmMyaAdSu6oOTfkpqaT1kKzrYO2YOOeXM99Z7PHvvkVxQMht
         qEXaLqLKsOhaitXbAKBpR2cuBojybZMKhn5R5H5M1CN9uqSzQxQyQ8rKtH8fz/3z42i/
         KcOlHG74IPIhpqLlg/XKzqapxPRhoNcAEwyttlweBUPlJaSay80Lf5CT6TQ52B7zLp0g
         r83A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=673vfcXckcwVgxogLtZYHU/ZF/jsaUBLKWNXQ1xE/GA=;
        fh=4Axy+T0JtvT4Tro1igfw8O1hAGSdM5Bk9RX6Mc23jTo=;
        b=cpWcveiRXiUe+hPSPtUvbHvxufBEn5gLRBM1dxfPcIHk230RhczUEEjbld+ZHwt6Uu
         C1zR/IaAsIX/MnvphmyL7VFFYtM+EStDZWgwurgdZw1jQ6jgic2z+FMYUZbgcia5WrS7
         YxhdOWd1DpHlt6BtmYidLv6O6wNetv9efOnqqwogCNLfUApZm3JC4c2hpvIWUoG+kXpN
         SFDkwiKDphKSKAb+O1Cv7QUT69eaTJJon6lY0JAM6TxdlrMcIqGkzUsyh3vAXDXYcrdB
         +69ya2MyTuhCCdKLmuhhjZyrx97L3MtSCmQgYR91FzkBmjGWPlLRoE/m9cG9NRHDLgMr
         CVbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u0ZN5Boj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73e25382dd5sor7020249b3a.1.2025.04.29.15.02.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Apr 2025 15:02:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u0ZN5Boj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745964155; x=1746568955; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=673vfcXckcwVgxogLtZYHU/ZF/jsaUBLKWNXQ1xE/GA=;
        b=u0ZN5BojN9eUt3+ivSvdo4z9oiuGcRoM+7tx16Gl17tHNgrynz+eUmO8bf7r7DU0WL
         FzMmJPNns/rw1nWpxjguhIHb8ax66lq4Ypsl5YDBbNGWISMJ3fJFRtPUU+0xq51kNP7h
         K78eM+K87PiYvqhSpT90gN4ByPWdWZF0XQO1BgPcDljpV6FTU/f/E0sbeRegdukJM4Jc
         1/ApL6RGlOLbSenncaz2Adx6lkH7mnjSoPz4V0UOfoX1Tbs5cc2od9rhJWcNudUQPK+H
         Wn8EbgxWWq33kbGApGuo6yfA6z588nMYrj/kmoWXObnWg3unxnbmJvvFTYwf1NZDafpx
         21Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745964155; x=1746568955;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=673vfcXckcwVgxogLtZYHU/ZF/jsaUBLKWNXQ1xE/GA=;
        b=FhNsuMYB51j9j7AUj+h0rnZqmeWcPA6RnO3mBCO/byqNVmLa1E2CnDDi7hVogXOhpd
         c6g0tA00iE5ryqXSWJuUljGUobXn0R+HhjcLCuL9kAD9nwEhQurEOQDA0UsQYKSTNSFp
         lxE/aLA/s6t9hlRHD43PnEcI1uUOU1p379cAeQb3NN+JEnWymK0PNXtkFpETSjEd3VCv
         KXiD/vEagc6PGINcv1D2BqiWtfroxHg39KSXK9LIqI9sKQ80S5xoop5DcyM9b6bUqdhR
         PCG9WNwrkEdx2CjbGtJBUkmX5W2v2hJ8TJ4kx+K6bIn44ULH/CKslarfmmXhTXg8MrY/
         nJvQ==
X-Gm-Message-State: AOJu0YwH9TI9mrHmjEY0KMxNp0qtZZtgxCEcWRNB2HNvO6US/wF4wzWl
	PRTEDjzBTufHMgFJ4XcJmztRtwNRWnoY5XQ1ozY1N6aibhf4kYsNmMO687VK2pY1G6+ZryOchki
	VCm4=
X-Gm-Gg: ASbGncszIlGn2VjnJb7+Zd1fCmQ11K6Ie0ONIUTo6ZiSZQCmlIrbH/mzYK3hsKctx3g
	G7RJfAXLau9CTh0DYwFfPri/Q1fhUAe8Xpi34XP8kkSfUHtN7smrWz4+DCs9TPSsAT3UdpwejNM
	TAvKemrybP/opeV/wzS6RIZYzPAqbAZzzeR3TG1nR5RQprAm7ITj0qHpo0QxB5LDzbMoE7/AfiR
	/xMuR0CT5+9tJwZzdYw6ooODiRFI2iLArRE9gt0Jg/HigeuhIdTj8B/j/zkFYQWoenrl2Sl7Ugb
	4+SLwI/j1r7HEEIIjdEY66ord+XhPVheRqTR/cq/57Jybr0yL2BF0g==
X-Google-Smtp-Source: AGHT+IHGsu3aaaZ8AgfQnKJoDLS8J+k1ti2SO5D4FRDqu2askuRacbj0XulqEPxKT1UI/1sN+VOcPg==
X-Received: by 2002:a05:6a00:3981:b0:737:6d4b:f5f8 with SMTP id d2e1a72fcca58-74038a67154mr1037049b3a.17.1745964155371;
        Tue, 29 Apr 2025 15:02:35 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a5c376sm197194b3a.129.2025.04.29.15.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 15:02:34 -0700 (PDT)
Message-ID: <b044596b-46a0-47ca-a1f0-61160c59efc9@linaro.org>
Date: Tue, 29 Apr 2025 15:02:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] target/arm/kvm_arm: copy definitions from kvm
 headers
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, anjo@rev.ng, richard.henderson@linaro.org
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
 <20250429050010.971128-6-pierrick.bouvier@linaro.org>
 <87msbz45y6.fsf@draig.linaro.org>
 <d455055c-a13b-4e00-b921-5ede2be08e89@linaro.org>
In-Reply-To: <d455055c-a13b-4e00-b921-5ede2be08e89@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: z3qrqkmj2nFl

On 4/29/25 2:14 PM, Pierrick Bouvier wrote:
> On 4/29/25 3:28 AM, Alex Bennée wrote:
>> Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:
>>
>>> "linux/kvm.h" is not included for code compiled without
>>> COMPILING_PER_TARGET, and headers are different depending architecture
>>> (arm, arm64).
>>> Thus we need to manually expose some definitions that will
>>> be used by target/arm, ensuring they are the same for arm amd aarch64.
>>>
>>> As well, we must but prudent to not redefine things if code is already
>>> including linux/kvm.h, thus the #ifndef COMPILING_PER_TARGET guard.
>>>
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>>    target/arm/kvm_arm.h | 15 +++++++++++++++
>>>    1 file changed, 15 insertions(+)
>>>
>>> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
>>> index c8ddf8beb2e..eedd081064c 100644
>>> --- a/target/arm/kvm_arm.h
>>> +++ b/target/arm/kvm_arm.h
>>> @@ -16,6 +16,21 @@
>>>    #define KVM_ARM_VGIC_V2   (1 << 0)
>>>    #define KVM_ARM_VGIC_V3   (1 << 1)
>>>    
>>> +#ifndef COMPILING_PER_TARGET
>>> +
>>> +/* we copy those definitions from asm-arm and asm-aarch64, as they are the same
>>> + * for both architectures */
>>> +#define KVM_ARM_IRQ_CPU_IRQ 0
>>> +#define KVM_ARM_IRQ_CPU_FIQ 1
>>> +#define KVM_ARM_IRQ_TYPE_CPU 0
>>> +typedef unsigned int __u32;
>>> +struct kvm_vcpu_init {
>>> +    __u32 target;
>>> +    __u32 features[7];
>>> +};
>>> +
>>> +#endif /* COMPILING_PER_TARGET */
>>> +
>>
>> I'm not keen on the duplication. It seems to be the only reason we have
>> struct kvm_vcpu_init is for kvm_arm_create_scratch_host_vcpu() where the
>> only *external* user passes in a NULL.
>>
> 
> I'm not keen about it either, so thanks for pointing it.
> 
>> If kvm_arm_create_scratch_host_vcpu() is made internal static to
>> target/arm/kvm.c which will should always include the real linux headers
>> you just need a QMP helper.
>>
> 
> Yes, sounds like the good approach! Thanks.
>

Alas this function is used in target/arm/arm-qmp-cmds.c, and if we move 
the code using it, it pulls QAPI, which is target dependent at this time.

Since struct kvm_vcpu_init is only used by pointer, I could workaround 
this by doing a simple forward declaration in kvm_arm.h.

>> For the IRQ types is this just a sign of target/arm/cpu.c needing
>> splitting into TCG and KVM bits?
>>
> 
> I'll move relevant functions to target/arm/kvm.c, so cpu.c can be
> isolated from this.
> 
>>
>>>    /**
>>>     * kvm_arm_register_device:
>>>     * @mr: memory region for this device
>>
> 
