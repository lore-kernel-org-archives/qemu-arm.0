Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp422792njj;
        Thu, 1 May 2025 12:28:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+OoWFzNjFsIqk0UL0uftC0QWjs4jv6JFrvfxUf58moxzmSb9P8O1JL7W0KQfCPJb2p5VEEFeOrkVYfg==@linaro.org
X-Received: by 2002:a05:6e02:1c2d:b0:3d3:d067:73f8 with SMTP id e9e14a558f8ab-3d97c1be92fmr1477655ab.11.1746127694980;
        Thu, 01 May 2025 12:28:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746127694; cv=none;
        d=google.com; s=arc-20240605;
        b=GvHSSyEjcYqWEUYtYxarfxFuNRKyOUIlurUU/ra67owHzk4FVHLYaP+gabXD3dgpit
         1SJvp0uKpJb/YIuxTiCLLtOhztT8Wy7qda1yJxrwiVAj4cho5S8QyTlgwaoFqIDqS66O
         NAeIo1q1PHfb4VHzvWH6Qj40RaBaKo9/YH4e+l9NxpX25xRHWQmdIYFdoX3igArrzhfP
         y2Cuwl4SyhjTzaxRu+YnyWVDFz+wUexCnfnlA+ImgZ2HgNUzvcBjRkdlLJU6+poIbb0w
         pKXSh27eQY+JJA/r44MQ9sMG9Y3DCRcieygXv3qneIBWt1j8yWxgWYCvUZZSHZxEnzHo
         QHYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lIT25lodBDqzC8QsLNZY/pbMkuQESJLFEJeOOfYgS7k=;
        fh=08ml/YzmqM0JDkJwVeP+h7mU9I7tE45rjJIIg2NK36A=;
        b=iIY9NQBnDs+WEAHQVtpzmCNVOpgDJnUmc9b6umAfj6SDQlaM3O9IGJvgf1nURPwCxk
         L2E1mqBwC3B2FxAmKwvzqWdg+kr63+YlUg7gRNQeNamyBdoB1CxSHZ/NPjybjeKiHgra
         xNe3Tdm3p2AKgTwc7jxNXliIrYK3XCBlMl7PFwP19YHcJUfUS8CEFYYStTqFl7Yhvx9k
         9SDEBFZM1WStuaVET56lRphPlJ9SteWgsAEwk7WyxEUtVUizWhohOJLfA8zxJvuy+1wq
         6Vw8EzrRIyYUmStp11vY5umT16Jtm5wStIn4fMi5pHisf4zNdeLazOKbXFmUG9DXNzH3
         AX4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="B/wVdyV1";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 8926c6da1cb9f-4f882eb523asor1005566173.6.2025.05.01.12.28.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 12:28:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="B/wVdyV1";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746127694; x=1746732494; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lIT25lodBDqzC8QsLNZY/pbMkuQESJLFEJeOOfYgS7k=;
        b=B/wVdyV1OsIEAI7HaJQomkO+jMn3rXbUpDjCqq70xAqaHuWB9/w7qjAcBfnTfzENVH
         nIaxkXWpGkbPLbo8YbE7o1ct1iMcPYRemoUH2XU2eHZKV3YazUhsogFveIaDQiCoCCLB
         DNfD6sb9BzfBJO2pzSl8/Hu1uu9ZrlL6IiPMjh1jV4Og9dcCo/KK74OWgr78LRx0gJKV
         Y6VQpk1HUZlb8fKLHVRx28VjNlDjEA7z9mKNVlQ99bg0jY1va+nrD1BfwRtez7WWnV3j
         8cg9pY6bYFv+CSmh1LlKAFImiYMI0V8FJjNdyOOOssaiL6rAlxFGhufctGeeU4NRl/N7
         Svfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746127694; x=1746732494;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lIT25lodBDqzC8QsLNZY/pbMkuQESJLFEJeOOfYgS7k=;
        b=kv+z/vJJSQAToQXn2OChVCR70DYmCxzRMUyl8RDXLBFpZptJlhbrANVwjqiz8dcGHH
         QxPyAAkoz/ohYmv1xb9gyjh7BjrxjxOhngrsrxg244AWaBCEXieecQhK5X3Vb7qiKMP+
         TTevAZbA6VKklbZbKu3xN2Gxyeb5owog7U66a5+kVSYzgU4ikrskBpBYXLjbmIuyHWb7
         nQTXKfLUIegC25RpgVJACNJbM6ix4tXerYlACg04455GQ8df9EStSKgmF9UcZ1/jaZE/
         VlqkEG03oCMW1s8+OYlJ1W/iaTIlBac7Bp1RdpqO/n8mGbqvo1cMrTp/1GrO38M4m3uX
         aMLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCZh7OJrEyK1ix8AxbZtt/KsUsEH/aK+uBcxbIzbLGgRYFap1vu1KB7jDlfMkqzjPoUR5j7LlZO6Xa8Q==@linaro.org
X-Gm-Message-State: AOJu0YwYACKwUnLXrv2xwdmvIKJ9wmnvcCBEFqBYp88IWpyeIhu4MDQZ
	NSUShAqgL0qfyjmg2n4nKDnjNlcYbaS87jhINA8jWZKHEZteSkrDF+UTLD/EVkczTg==
X-Gm-Gg: ASbGncs4Xc3lFPONL9EAt+2S3HFPlVMkjjEOGMBd7CjnJxVQkDOhWXVrtVuA7ypXI6n
	uEYZTbpGDJGsZ1YnO88EKgmDlYnlJsCEjbabjPmJbCa6tjX/5R38kNpL8aBNNfxJFMLSWxCxyW3
	+D8eQ8cVCUBtt14AuymatrOsKMX5wL/BRwHMQIqLEfQwjMo2XbA8YgRpgBCR7RrCSVo28OopQ5H
	4m6IexPqo63xO+b+y0+99+7uC64P4bNxRJYHDOcYI7OQDnLRwnGWMwz266TFohHsUR0JqayydSh
	tkhVEonfJXHsHUhv64ws/7ufEvRdG+jmvzuZCnhhWJ00Ng80p4EecZaxKiRAs+9C0NQIbl/THke
	4SNkQMNrNUxcEew==
X-Google-Smtp-Source: AGHT+IEoAXhkyPuNP0/8DAdoHy/HqssAna10I2RNVsH3pSdrPQk7pJA03PtTmN5jQqJrUcwb+a9PlA==
X-Received: by 2002:a05:6e02:12e7:b0:3d9:6dfe:5137 with SMTP id e9e14a558f8ab-3d97c19976fmr1707275ab.10.1746127694518;
        Thu, 01 May 2025 12:28:14 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.244] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aac80f6sm6839173.141.2025.05.01.12.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 12:28:13 -0700 (PDT)
Message-ID: <21b0915b-422f-4186-a6aa-c484f725bdc5@linaro.org>
Date: Thu, 1 May 2025 21:28:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/33] target/arm/debug_helper: remove target_ulong
To: Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-18-pierrick.bouvier@linaro.org>
 <e1afdcf4-a416-4742-bef2-352a9d184ea9@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <e1afdcf4-a416-4742-bef2-352a9d184ea9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: F5qZMsTIEHG9

On 1/5/25 17:07, Richard Henderson wrote:
> On 4/30/25 23:23, Pierrick Bouvier wrote:
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>   target/arm/debug_helper.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
>> index 357bc2141ae..50ef5618f51 100644
>> --- a/target/arm/debug_helper.c
>> +++ b/target/arm/debug_helper.c
>> @@ -381,7 +381,7 @@ bool arm_debug_check_breakpoint(CPUState *cs)
>>   {
>>       ARMCPU *cpu = ARM_CPU(cs);
>>       CPUARMState *env = &cpu->env;
>> -    target_ulong pc;
>> +    vaddr pc;

Why not directly use the symbol type (uint64_t)?

>>       int n;
>>       /*
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> r~
