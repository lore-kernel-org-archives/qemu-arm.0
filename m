Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp732766njm;
        Tue, 29 Apr 2025 23:08:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV79QEq8wy7LiH5NyUjMTXp1ny5FPT8NW/3MxxBqKbo+SnLc0m873dOSqG47eI3YSUqBp58NEMGchtS2A==@linaro.org
X-Received: by 2002:a05:600c:1d8d:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-441b268b9f9mr8648705e9.23.1745993292050;
        Tue, 29 Apr 2025 23:08:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745993292; cv=none;
        d=google.com; s=arc-20240605;
        b=USH1YnL5svK+S1yIvYDWEWvlG6ZxhYIKsNez/k+yozf8mzHmdlnR3e2zhxg3+6+FdX
         Zb9uRUaqvIZyxkQggVaE6pp5SRcKh8K48IPJRXjuvXZqPuAKCBpPTF+I9jib8kkzJY8Y
         34eEbIfVFSF/bvMIArs+o9x920y0kucJPwW9+B6QyE+Bl5D7ISv4GHJxIKyjWxR/hWRM
         67oMHErN1857X7fW0+eIMeDEPT7HpU58kTWBsAFSM4aLqjL0m9iraCW7Be2Mpek0h2+t
         qWUBhVvzL5cvSuryFV9OWKBVuUNzbE9Qj9CSossDsJZZIIiXBDeR/Nizv1080QDlrV3t
         +K2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rSasN2qvfne7cnvgn4lGh5pVBMg2PxpSK1Y0mTKtEu8=;
        fh=NwN5smlDoGgCJhj7CsV+KQsGAaXbHU1gii3/n4ad3yk=;
        b=FeeHc0lij5zbav0fTAfZvAct5utQSOiSvd2lbqzQpbDGo3MoMJQorIAfD3M0FHVvAB
         6IxTuorDqTBa8D6OV0I84LmcNuzQG8k/3NGMoHdmykW9OVz1C1rF8GNzHyaMSzepYObx
         ltF+jOxtrGI+mQdoHRAncKdUXcGeM410GPIOvtBMgGkCIi802fDAHChziebijaF9YGMa
         6HsOVPLSXcvb4ZLES0xQ0N+hnFDhWf3a98D5U3QkOLKbXMFw+pnmW8Dj9m2PzJMkX78r
         7tP+c93e5Njp3yM6XtfRBp3Q4mRbaFqVKXRAaE0YBo0RY0QgN7iR2Pte8NFp89vTw/45
         eOTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m6e1QUyE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4409c306ff8sor38638245e9.8.2025.04.29.23.08.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Apr 2025 23:08:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m6e1QUyE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745993291; x=1746598091; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rSasN2qvfne7cnvgn4lGh5pVBMg2PxpSK1Y0mTKtEu8=;
        b=m6e1QUyECOz75NipTYdb7DzAs+vWETjeXbiI91UFr0dl6qgUJP4jDvwu1Ro9QKtNxo
         /+0xVjXr96s8cz6NSpImwmTCQmqmr8HP2b4bXThmnLcaARDHXISiGf1ciSfJbLdQQfkV
         PIpSsSCKgaXfqIbH1RNF0b6axOmjASQjCreDjY8a+XKqu7Fjd21qlq/+eAol+E2+bW8P
         m/Vq0YpGYVpgfqRnFZOCbu/QKCT3zjwGWh+NiYN5rf3Eu6IoFccokJDqaKCGlSDV9YDf
         EGeO0MVwTWcj0dBGGf/xye98/K9g5RwnTxS+3b6h6JOj9ChIj6sAJjr7e1rv1+muJoqK
         zzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745993291; x=1746598091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rSasN2qvfne7cnvgn4lGh5pVBMg2PxpSK1Y0mTKtEu8=;
        b=t/pJCtpAhRchwNkpAFoev1/Kn7EGuDtS+eYYeZmkilHRa2+ivFLJE2+1/WqYwJhkhy
         R70Izbgxdsp19U226BLewbrewjzm1yEVnR+Tt278ltpjUpUIuIjOsK5ixf37/pLPoU4R
         ioquO1y2TMatxjUZ+uAZA77FdfvaHVdqum7xkVjNwgwzGHnFziFSRQHdtekRXnrP62Rj
         LVsXoH02O0/bCebSaXogAmW7kRqM43W1j7Ww2NvX/5whThGDgJdU13Yh9w1SBPWIu+Y2
         mB0OKezXEJCzMYJXxOgmqnwwYXLRL3Pl4blImh0j7Jy7+tlMUDLYmh6+71LO2cRnOCho
         YPaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVszSdiUoqPil3F53G+S9GFiLCHpnByalPh/t5v9KWHwP5wcZgmgtA0eaw4TOEvQVbOzb8POF9NxjSM3A==@linaro.org
X-Gm-Message-State: AOJu0YwHVCRF+7RARO0CHKIT3cbKsxUoI39sZM8PvK+CV4lVHwOpJ149
	K25S/aJX148xXcAiBWIBnaO/YFP/WOZbjrkTBWoNt8jDcqrkuFZyuhTHyxteExHo7A==
X-Gm-Gg: ASbGncsbXzj8QWrlID6icoDb5TPfgXLOyC+PHTpeJJUb+R/E0ojJ2cn7Q5sO8ctwZ+B
	4zKTlSubj94SjumfLNc4med/QBBrUkK+YhEsKaKtV61dO7K651ntVea3pivuKj5Az+gkaau9tVB
	oVn1vZsC/8YOrhKm1Mvxja6WyO/i06bgaizVgx0jTyNYwOV1xu/cQU9Q69aXOPq2eiMgziNPcG8
	AuDWQ89aPHHOn1gHVua0w5xoJJ8QWfodeQfy1Co7t5LvuXDJ3h+g8EUHnVt/zgIixNHbihLn5Fp
	LJq/SM2ssikJPqRJy/rqXyoumeouI8QhcXXjm4u/P6RqW6WLlyeSfFcYj5ea6SiKMheUFkIwzgX
	bj9jiyAzU
X-Google-Smtp-Source: AGHT+IHYmZXRBUbT+lccOGhElxssVlDpwS2bQieP60mt+K+2l6KN+WEnfMLGvN1bTfIOOsLGhLTXEA==
X-Received: by 2002:a05:600c:4ec6:b0:43c:f61e:6ea8 with SMTP id 5b1f17b1804b1-441b2635046mr8742475e9.2.1745993291433;
        Tue, 29 Apr 2025 23:08:11 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.226] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441ad870ae0sm26811145e9.2.2025.04.29.23.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 23:08:10 -0700 (PDT)
Message-ID: <e88f9bfe-1d8e-4571-81d0-55d750a2da9e@linaro.org>
Date: Wed, 30 Apr 2025 08:08:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] target/arm/kvm_arm: copy definitions from kvm
 headers
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, anjo@rev.ng, richard.henderson@linaro.org
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
 <20250429050010.971128-6-pierrick.bouvier@linaro.org>
 <87msbz45y6.fsf@draig.linaro.org>
 <d455055c-a13b-4e00-b921-5ede2be08e89@linaro.org>
 <b044596b-46a0-47ca-a1f0-61160c59efc9@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <b044596b-46a0-47ca-a1f0-61160c59efc9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: yVzeG0GLxl/a

On 30/4/25 00:02, Pierrick Bouvier wrote:
> On 4/29/25 2:14 PM, Pierrick Bouvier wrote:
>> On 4/29/25 3:28 AM, Alex Bennée wrote:
>>> Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:
>>>
>>>> "linux/kvm.h" is not included for code compiled without
>>>> COMPILING_PER_TARGET, and headers are different depending architecture
>>>> (arm, arm64).
>>>> Thus we need to manually expose some definitions that will
>>>> be used by target/arm, ensuring they are the same for arm amd aarch64.
>>>>
>>>> As well, we must but prudent to not redefine things if code is already
>>>> including linux/kvm.h, thus the #ifndef COMPILING_PER_TARGET guard.
>>>>
>>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>> ---
>>>>    target/arm/kvm_arm.h | 15 +++++++++++++++
>>>>    1 file changed, 15 insertions(+)
>>>>
>>>> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
>>>> index c8ddf8beb2e..eedd081064c 100644
>>>> --- a/target/arm/kvm_arm.h
>>>> +++ b/target/arm/kvm_arm.h
>>>> @@ -16,6 +16,21 @@
>>>>    #define KVM_ARM_VGIC_V2   (1 << 0)
>>>>    #define KVM_ARM_VGIC_V3   (1 << 1)
>>>> +#ifndef COMPILING_PER_TARGET
>>>> +
>>>> +/* we copy those definitions from asm-arm and asm-aarch64, as they 
>>>> are the same
>>>> + * for both architectures */
>>>> +#define KVM_ARM_IRQ_CPU_IRQ 0
>>>> +#define KVM_ARM_IRQ_CPU_FIQ 1
>>>> +#define KVM_ARM_IRQ_TYPE_CPU 0
>>>> +typedef unsigned int __u32;
>>>> +struct kvm_vcpu_init {
>>>> +    __u32 target;
>>>> +    __u32 features[7];
>>>> +};
>>>> +
>>>> +#endif /* COMPILING_PER_TARGET */
>>>> +
>>>
>>> I'm not keen on the duplication. It seems to be the only reason we have
>>> struct kvm_vcpu_init is for kvm_arm_create_scratch_host_vcpu() where the
>>> only *external* user passes in a NULL.
>>>
>>
>> I'm not keen about it either, so thanks for pointing it.
>>
>>> If kvm_arm_create_scratch_host_vcpu() is made internal static to
>>> target/arm/kvm.c which will should always include the real linux headers
>>> you just need a QMP helper.
>>>
>>
>> Yes, sounds like the good approach! Thanks.
>>
> 
> Alas this function is used in target/arm/arm-qmp-cmds.c, and if we move 
> the code using it, it pulls QAPI, which is target dependent at this time.
> 
> Since struct kvm_vcpu_init is only used by pointer, I could workaround 
> this by doing a simple forward declaration in kvm_arm.h.

Correct, great!
