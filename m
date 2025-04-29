Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp544865njm;
        Tue, 29 Apr 2025 14:14:03 -0700 (PDT)
X-Received: by 2002:a17:903:3c48:b0:220:d257:cdbd with SMTP id d9443c01a7336-22df358762bmr13224225ad.48.1745961243514;
        Tue, 29 Apr 2025 14:14:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745961243; cv=none;
        d=google.com; s=arc-20240605;
        b=CJhBTkdlbZwYDfOcRLjN58LczoXhsxzWBkNcqpGd3F442NWfXGhJuXUUIMkb8b39uH
         mv0lwMTAsXeA+4BVxlLVi2iSUEOjwFjLBlvMwXdLcd9vTbFsUJ+FEevm86IYydpN6KjH
         TMTYplYSlpPVADvmj/ls6ZN8yBn+uC74d1F/t/IdYyVB1Ba/DJbkf4BEF49VxBDP6FfV
         WkLvuo7ddujWz6ZJ/RI9NwjbLjYjCYBu1AUhOXElO/Lyt1GPrUBAJPUkZAwC/GNxzuNF
         qW/p8g7pK41AuHY+TNdp+zizlDveu4TZ7Eccx6cCgDBSXTCgnXiyJqnDB24U/ru+QcHI
         kkXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=hOHQaZoxZ7UbKQya7ht8bDTHCEK26P6Ba+yTQsPhO10=;
        fh=4Axy+T0JtvT4Tro1igfw8O1hAGSdM5Bk9RX6Mc23jTo=;
        b=W1gNJM5V8OZlL1cGadtY+GUYlbOQRqUGdZTZLFrXYoltHN9K6/PXV8/ZLoZZtpTuGZ
         StVbAbi97Rny0xUxO8kcvvCL/llQkUsqRpNkxH5z8jddrX70oCCKpjq0vYB8q08m2Ies
         +sMqXi3kRd8SS3R71m+YUFOrSaB/B5PXxSy6AZMMwzrPrO+EBO8NSUiNSywU5hX7gdba
         MvqqKETuI7lh/8XTSSksHbclNJwo+I0ERa9hpZ/xRUoS3eq8yOeDUuqGmu6fqR4ckD0S
         p5+TM0F37dCQUjGO4FKoYs2BUVDnBKvvJG0UG3Yno/khrlVcNG5Wy2QOwp5Vyd6oyurN
         Yq2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="y/SLmQIG";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db5205d21sor75601335ad.15.2025.04.29.14.14.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Apr 2025 14:14:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="y/SLmQIG";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745961243; x=1746566043; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hOHQaZoxZ7UbKQya7ht8bDTHCEK26P6Ba+yTQsPhO10=;
        b=y/SLmQIGDX3CpZ7RbnpjmE0AvmsupzXax6u2w1aJ3NRrsBdxlKhxOPv5CAfjm3OWdK
         Xj+oKb1AeeKQf/2KPma4rvQPbyoCRFHH8AVP3HcaMAmmxRpR8v2hSAT4WnHfcOyg3Yl/
         x/+F2RD9djxLhPwkLZKKsWYFMAiZT4bzzgM8/kdubC6k6lsyc6ecQdb1/LGwssa54sUh
         7QlQvKNHCsPfdqYHCi2VtgKhvuG3eaAxTxcYojhvEMEDG6eASNgmYmChe6W9zRqf/gEv
         /urjqS+wvhOw3SnvUWGOOwUcK3KVuOuozjPdgx7NdNDox6ZFDkeV0qFZojtC3L7l4d23
         N+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745961243; x=1746566043;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hOHQaZoxZ7UbKQya7ht8bDTHCEK26P6Ba+yTQsPhO10=;
        b=NOpflVTJ4tWoURqEH67YF39uyH6dKlQf9sg1Ja43KLyuLwu7dXuIstouJB+MogFqz+
         uBMWZyNBs9DDvXLxhTJGvMN3tDO/HWfAj7B8Zfo8If5ZLLglk012sPdaLP1jfp3fbPWT
         dqOhYWTGbPeQQbson9kRDpuVQQKCeJONn4yuVsjYQGUWqzgYmOaGpymFypgjgQGhKvqe
         UBmjiYllILheHxvlC7eUnzaLypmoZ4vvW8dXViZda9QH4D1GaBypwV/cp0DsaXUNB+7D
         xAmUofJWBVG6GlNoPjlt241hlSrvxw8on6iMK8nVTRyh02REWuTv2C+ECDw4CH2tXb9q
         pHGw==
X-Gm-Message-State: AOJu0YxQFHDMemSPwaBx1NJj1EQqKzy76xs+ypsei61rYEYrgh07YDSs
	4CtypVpCEb6Q7eJgBhn6qj7YU+LqvbLYGcfjtzUgaFbuLiIxkzGZ+jTccrBwnQkzQGRzVWQuN9O
	oFqQ=
X-Gm-Gg: ASbGnctUlhaqz8qzZSqgLLG2ZIj7GSBxgZATz2/UAbOMXhZSuREn3e3ymdVofEj+DvR
	R4K6m60A7krm2pB+WlTkdvTWgFUEMo0gKwAy4ZSwGgV201mPbmibB+cNx7BfFuEEduxMd1vl2j6
	dT0kI4kobVFCDXz2cLKU7RMyUG1QuMUA4Dm4Sns9HDB0xOLJud8GxlpNwcTlcILX+MoWy6ptc/+
	gCWesQaFqQxTslaMpFW07UlZkgmQiSVWlCCWNyn6ApWu5P7xuoK25dipQ3tPrs+4rcWqtxLjlpj
	8k4UiW2L+im4gK40RknRPcioNJxp40PBQd1xNpYeYEuqU5j+3hj1mi4PYNlnMhf0
X-Google-Smtp-Source: AGHT+IGVp4+1Bhotq0d4aremIqEwnPUtzY6snkcOfYlsGofhxa81gl1LdUI7VT6xUzXDUNe4F7okDg==
X-Received: by 2002:a17:903:2f43:b0:224:1943:c5c with SMTP id d9443c01a7336-22df34d33edmr13219515ad.15.1745961243059;
        Tue, 29 Apr 2025 14:14:03 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7b50sm107997675ad.130.2025.04.29.14.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 14:14:02 -0700 (PDT)
Message-ID: <d455055c-a13b-4e00-b921-5ede2be08e89@linaro.org>
Date: Tue, 29 Apr 2025 14:14:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] target/arm/kvm_arm: copy definitions from kvm
 headers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, anjo@rev.ng, richard.henderson@linaro.org
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
 <20250429050010.971128-6-pierrick.bouvier@linaro.org>
 <87msbz45y6.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <87msbz45y6.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: nVdrIQCIXAgu

On 4/29/25 3:28 AM, Alex Bennée wrote:
> Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:
> 
>> "linux/kvm.h" is not included for code compiled without
>> COMPILING_PER_TARGET, and headers are different depending architecture
>> (arm, arm64).
>> Thus we need to manually expose some definitions that will
>> be used by target/arm, ensuring they are the same for arm amd aarch64.
>>
>> As well, we must but prudent to not redefine things if code is already
>> including linux/kvm.h, thus the #ifndef COMPILING_PER_TARGET guard.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>   target/arm/kvm_arm.h | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
>> index c8ddf8beb2e..eedd081064c 100644
>> --- a/target/arm/kvm_arm.h
>> +++ b/target/arm/kvm_arm.h
>> @@ -16,6 +16,21 @@
>>   #define KVM_ARM_VGIC_V2   (1 << 0)
>>   #define KVM_ARM_VGIC_V3   (1 << 1)
>>   
>> +#ifndef COMPILING_PER_TARGET
>> +
>> +/* we copy those definitions from asm-arm and asm-aarch64, as they are the same
>> + * for both architectures */
>> +#define KVM_ARM_IRQ_CPU_IRQ 0
>> +#define KVM_ARM_IRQ_CPU_FIQ 1
>> +#define KVM_ARM_IRQ_TYPE_CPU 0
>> +typedef unsigned int __u32;
>> +struct kvm_vcpu_init {
>> +    __u32 target;
>> +    __u32 features[7];
>> +};
>> +
>> +#endif /* COMPILING_PER_TARGET */
>> +
> 
> I'm not keen on the duplication. It seems to be the only reason we have
> struct kvm_vcpu_init is for kvm_arm_create_scratch_host_vcpu() where the
> only *external* user passes in a NULL.
>

I'm not keen about it either, so thanks for pointing it.

> If kvm_arm_create_scratch_host_vcpu() is made internal static to
> target/arm/kvm.c which will should always include the real linux headers
> you just need a QMP helper.
>

Yes, sounds like the good approach! Thanks.

> For the IRQ types is this just a sign of target/arm/cpu.c needing
> splitting into TCG and KVM bits?
> 

I'll move relevant functions to target/arm/kvm.c, so cpu.c can be 
isolated from this.

> 
>>   /**
>>    * kvm_arm_register_device:
>>    * @mr: memory region for this device
> 
