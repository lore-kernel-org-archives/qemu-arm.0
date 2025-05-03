Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1648222njj;
        Sat, 3 May 2025 15:16:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUHFg+gfi66kSphfLMwggeMLS+phGvodyDa/wApMDgSzjqUooWYBLcVcNqY4dQjkYH7HOpm+NKCOviMJQ==@linaro.org
X-Received: by 2002:a17:903:178b:b0:223:50f0:b97 with SMTP id d9443c01a7336-22e18c6cea9mr54376655ad.52.1746310569056;
        Sat, 03 May 2025 15:16:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746310569; cv=none;
        d=google.com; s=arc-20240605;
        b=ZSVCxpfty7lR70kHPc9N6kEqz+Ybsw/wq0UZ24QH56dzJbtnYJNiVRQxKDPNqaP4U4
         dzyROKJ9ORI+XAQnD9WfkmS5VC1C/xly+n/VeJKSwkk8pf6UZxFcGOp4C4ltS3plnpzu
         3MZZc1K9x/AEI2e1ahyeNom26f1Zvb9HHCmJ4Dx7V5JFD5wW/D9uqJ5zyJtyVfrewwHB
         hf53FrefqEhEZtBjwhOw4W/bAt9g0xcbP45d+2L9a09PsAf/o+8azeEkgItulIcDi8PG
         0Wt03vmz/lTlHvV6Om583bW2htpIiQKRON6i7mDCIPlya+UeKxh1vvw+mVtRZW5/zqGj
         raaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xNJJtrnpFes8ekXTjTuSMN1yHRw6b+bD6cpME1WD6Xs=;
        fh=9fB4x6/3pNeFJTEpCRUiW7nURhS08VlasX8Ce0ZLsmc=;
        b=Z44ABCeWONVarM4h2v9TyrM0V6DxFzXCNyuKnfv/nm68jEaYFrOMbYLB25rLjevMaH
         eu5JxOTTQlVGGAcWgGWbcl8tyUtyLMQgRP5VI5QMFfBvxO70Pns579JtRdFWr5JWFuvv
         Dn0tGc5qe4fJQMG0KSf0cS1HuxHlrNiiuGJEZX9p5/JmyojKQ0xB/yT3+sugN//kCmns
         bYlEeY1pv0DqXdX5COgiSnPGdHhg+wiUQWoKTWNIV/E1DtqtbfPfSgUTrwHSx9TwR5WO
         epu24uG80sRhjQe6bKsHN5BDlDjRuIPwHVjJQBER9KEjAtPYAIshhA9UwuMFL+iC8C+A
         9TCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TXuQIKvj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0ba9c20csor35961425ad.0.2025.05.03.15.16.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 15:16:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TXuQIKvj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746310568; x=1746915368; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xNJJtrnpFes8ekXTjTuSMN1yHRw6b+bD6cpME1WD6Xs=;
        b=TXuQIKvjAgfTEvlZcBz0AYJFvWNJwTGdrhNhCalXP+ZnyKo+QdZxdyaPMzuIqNdzEe
         pI7rYZkwfWLZIEMNBzBuTxzU1Qctr3ccq/wcFQ6sJT2CXrijh0WIo7wLlWQ9pv8mzagZ
         NKwzCM5ByFIBDKjCvmut8mHhM2X8/Lp1Vz2WtWGwl7oAUXwyiRhwAf25XQxlMUf6CZTO
         V8REPKc/I3NElI/WEpB5JC87eYO2OTFD5Pemq6wOFMl1Yyt83mcsK+LNGWYAUS2/vFKy
         5F3BuX9tssp7wtJLh+4i/qVEzeqMr8NokMax9Hr7NUwHWjuyvolKwtk1gWAu/qNm+ZF+
         j9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746310568; x=1746915368;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xNJJtrnpFes8ekXTjTuSMN1yHRw6b+bD6cpME1WD6Xs=;
        b=wTAGcPAtQNh4sEAPmLmpjZOyGu6ko8j+U1Jni7olZX3+RUMliGPJmzFOd7VEKkeUyX
         +Y8rNguwY1pMce3e9GVm2Z1wxTs5uJsTN0pUmcpXcAPoPhPK/4fzGLkCaFBou4ba17oH
         ATiCAUlR+xg5ndHY6iYeT9+OZhero29B1R989RqIQ/cT4DBQ2zvT3uYktSLjTi/lDVhi
         ENkRpnvh7Ma5OJVATXGfS7hrhoIZWnS7PEjps3tEz9EN5cQ2cdOxav52D9q9qTFa8Euo
         Lp4XmHwfYv+24XsmV5TkN3tnAJm/YbSDsmyKxj5Mlnoruwt8xpu1+3Cc+J2v0r6iQgpE
         ny1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhx6nSaR+qwNpzFGSCtmweWtQtoCGD9zrHdzvy9t/Uii9kboM29Uig4cVSMRLSHHQQIznOtS+sry9g1g==@linaro.org
X-Gm-Message-State: AOJu0Yz+EZxtgiLhixMVvrPNdvYFUFLDvTOk5Eez7ZRMIkXD23rl8eKH
	Y8VpL1nlkRAwmnWPV+a1EpY/nkvjpLiKzcvDyGSp8ilrMhF3zSTPQhgM7YemAsk9rA==
X-Gm-Gg: ASbGncvQFBElq7YKush9PjGwRLjR7El0q8Z5dJF//X/feYVGoCqp+9t5UWo1OVdhFWW
	ntr2kLeyP/W5u/nhspytYmN480QZ0/emXIdWmih59nEoBWxPTSIRZR3P7IZggNVtqpfs6S7eoS6
	r64w9UBcE83qHAr1YWRqDn02KZyDzRh0QggFOK2oIkuTP2vqBbvlfkvtOxrWmMd2n8+2/0/VFzP
	gDlV74661mNApj0Nz7c/eHPNgTFp75/BnBwb03cTUGxnd++kjQjiqxQRyLGSjhMrU+EMh5dYUdo
	HhPLP0z7Sq/wzhzLpJvYsfLARXauznDp/BDPA+tl7biXZdV8jc7Ys43J0EEnMz+i
X-Google-Smtp-Source: AGHT+IElNjYwVrPUjFtvyA2d3knY64Cb6zZPqR97k5sUlwVVLCppxJDJZTNzGc+wxdKVsKG/xnF6dw==
X-Received: by 2002:a17:902:f693:b0:223:3bf6:7e6a with SMTP id d9443c01a7336-22e18b97939mr67777725ad.12.1746310568613;
        Sat, 03 May 2025 15:16:08 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7adb1sm3839896b3a.36.2025.05.03.15.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 May 2025 15:16:08 -0700 (PDT)
Message-ID: <dfab0f03-453e-4fea-8313-05c6b08561b8@linaro.org>
Date: Sat, 3 May 2025 15:16:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/33] target/arm/debug_helper: remove target_ulong
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-18-pierrick.bouvier@linaro.org>
 <e1afdcf4-a416-4742-bef2-352a9d184ea9@linaro.org>
 <21b0915b-422f-4186-a6aa-c484f725bdc5@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <21b0915b-422f-4186-a6aa-c484f725bdc5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: wWid47witE1C

On 5/1/25 12:28 PM, Philippe Mathieu-Daudé wrote:
> On 1/5/25 17:07, Richard Henderson wrote:
>> On 4/30/25 23:23, Pierrick Bouvier wrote:
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>>    target/arm/debug_helper.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
>>> index 357bc2141ae..50ef5618f51 100644
>>> --- a/target/arm/debug_helper.c
>>> +++ b/target/arm/debug_helper.c
>>> @@ -381,7 +381,7 @@ bool arm_debug_check_breakpoint(CPUState *cs)
>>>    {
>>>        ARMCPU *cpu = ARM_CPU(cs);
>>>        CPUARMState *env = &cpu->env;
>>> -    target_ulong pc;
>>> +    vaddr pc;
> 
> Why not directly use the symbol type (uint64_t)?
>

IIRC, Richard mentioned "use vaddr instead of uint64_t for pc" on 
another series.

>>>        int n;
>>>        /*
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> r~
> 
