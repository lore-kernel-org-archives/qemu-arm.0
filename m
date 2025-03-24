Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2229560njc;
        Mon, 24 Mar 2025 14:11:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU8iOrZkHBrA64egyg5wwLUcryP2kKzS4OKAhSSPlJzFgqFHfuHOVw261HJEay2NrR785M+vfkY9pEoOg==@linaro.org
X-Received: by 2002:a05:6a00:3997:b0:736:5753:12fd with SMTP id d2e1a72fcca58-7390594137emr22152530b3a.4.1742850719723;
        Mon, 24 Mar 2025 14:11:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742850719; cv=none;
        d=google.com; s=arc-20240605;
        b=UUcY0RnesmGy8nrei1xGS9101K8fBujVJ2MPWy3OOZtEeYYR+xH/v7aqiOJ6RV+PWU
         zCc8913fip083yghkJp45ec5mvBQVCVF5650mncg8fTzDvVvfRebVSc2738LhZSBTt/t
         YmJz+TjCpdtX3YKZOx1HN2JXpg7KCJVH6cqxDNKQTqbsQz0L3fC/dZiv4g0XLRhAsW44
         +zEQnPhcPSbl43iptpPnHdC+57eMgaYgJXLEZzvw+CjdaTcJF9HQMb/bMzGlCXlbeTJk
         XuIrqn+x1e+VGYAGPiRo5xlzfAdqi/Z6G+uua7VfJ73uL7+w5mhjyoNl1bxBCgZleg+2
         uMhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0QyIWcLuKy6ayyJnu5/t5A5DBKW0SwtVnX/A9OP+mX0=;
        fh=C3NSFMoyeB0fEO8WwgSV1M5TRXjvhhAVI6dMzr1KQLo=;
        b=CfotT90DXNsjp4DkS+pw16qdC0mifxAdbypYHegxTMXwKWEpfQxxlEcB9c1r4D6Hv/
         SXWP/U8D4Ehw/yIzTS3YPsVyL5iZTTCOebRFyirTem0dOJBmE6BeSpVByYvly/TWkMkV
         uOMKZ2GxIL0FLU4vOiBHPpJpozS9EQkoYiqQa3yNR/aDwYRpWNaw/b2uA58fZoS+Ipui
         yETmx92zZ8n+3u+1BF+ij0Htc0Muu/Dlw6pzAjgOigPewXZuzif+jb7ocQf7zV5/sgea
         18u72GjrEqNqT4tO/v6c/p+a64oVMjv55DxFwQ09u1b8C6K7OhCsrcHWTRCoeZHvDQcL
         IHgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Td3pmoMB;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73905efeaecsor4543698b3a.3.2025.03.24.14.11.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 14:11:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Td3pmoMB;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742850719; x=1743455519; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0QyIWcLuKy6ayyJnu5/t5A5DBKW0SwtVnX/A9OP+mX0=;
        b=Td3pmoMBrI8x7uBCUZJcXJzA75suSMUf5sWPZbk0ugCySamTXhrLrbrVhVdVkN2J3T
         n5V64CYSSGcSf2kRgozf6zNWY25HCHGacGbGJuq3CTQiEylFr2BGtySH4Oc9HxhKXEsb
         +YH81t4YVVLKGN1Bp+iH2MIpI8iWG16mSXKn3IOUyZl6wD5lEoAAbylEXxksCyZoXqbZ
         ncz5CRuSzjn7S7pH93gxo1MbkX5D9QcmBC3Jhvw7SErH2YLiD3S6iPRd+0PLHwmHPStG
         jcKFEo2YGqUhbOrN3X7xU4zZnXbu7Frs/BiuQgmrW4RmycxPhhJZ5gGIjxtfBai1oEqS
         v/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742850719; x=1743455519;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0QyIWcLuKy6ayyJnu5/t5A5DBKW0SwtVnX/A9OP+mX0=;
        b=SJJMq5s6oj5lpcJLTOwFRHJmM2nsRJ29He5qaJwyBTxvrsj0cemt+xYDSQ0T2DvTqy
         0ktXpJ5a+/VS0mcCmjCDbcnbEqUFTK2gLoMnfUyT951LBxVd59S9DKcDnXEsNXI5kZLN
         cf7P7ZHv3+csSdRXkxcVFQ84w2/wxdhpDjS7FBJKEeAp+7XajeOt9TaEpO93tj78e8mt
         SZRACdgyFp88oKB63NmtpfzP1BOKjgyfVwW7jg+4MGJSooo63VsRC1HdE8bkkKJP0HNs
         jMqExG3QDjcaPl1zQuCRZXtdnPsBbms1DuY5C2bYUtFfIuz9Bt5M6Byi5qGMGUHYIOJX
         KfBw==
X-Forwarded-Encrypted: i=1; AJvYcCWysFT2mTBlBNN62yw5t06nrQrqQXblba01LwBf9p6BuKsWf4jG7NXIkWucU91AYRLh6zDhg7+ZEVobug==@linaro.org
X-Gm-Message-State: AOJu0YyswE2YYlJ4vdKx/0nlEnUEdZh8uF3P51KPDy9vFWneOB9rqP7x
	DKeRW+BNS+znK6FED7yM+cWuyakqRUcasS28fxXTw7oBfy9gw44r3RZGblbQAuTkEA==
X-Gm-Gg: ASbGncvEkoxFUZQ/4P92R9Bk+BaY8+gbX6JCiOHGqQDfO+Ki4OUKjvls3QAgy0+Yfu0
	mMhcWd3Ej85LRKyvJo8nIdKjvgta+AHKengRnFjdy7lA/PVIsiWAzrUdLdDwC1816CQ5roUojOl
	Q38W0tf7fG895Jm/XCNygehHZJ8nPlvagaJFL541FzQVZ3na+YxSjgXls2Wx8WbA+abQsQxinJu
	520YZrgFzPSWLgHo3gqdNzztLu1gq/IBUFL5DhuUP8vkb9VinBGWA/grXyhLo9wNPEC7AQpKUr7
	M5a6td3k8mT9LvlUjY/tY1J3Wz6cWKQU4p+gu2iHsiGR3MTYTd/UFj/xjQ==
X-Google-Smtp-Source: AGHT+IHhKhK1Wampe7HG5CfLYgXfzWCQTUvTf2PVOHx87p/lS/w3GjKKNRuQC3jxYB7GAzu+vy6I7g==
X-Received: by 2002:a05:6a00:1702:b0:736:3ea8:4805 with SMTP id d2e1a72fcca58-7390597f7eamr17945734b3a.7.1742850719026;
        Mon, 24 Mar 2025 14:11:59 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73939d2bdb1sm1805196b3a.144.2025.03.24.14.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 14:11:58 -0700 (PDT)
Message-ID: <11b5441f-c7c0-4b4c-8061-471a49e8465a@linaro.org>
Date: Mon, 24 Mar 2025 14:11:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/30] target/arm/cpu: always define kvm related
 registers
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-21-pierrick.bouvier@linaro.org>
 <1109fe22-9008-47c6-b14d-7323f9888822@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <1109fe22-9008-47c6-b14d-7323f9888822@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: pjssGe+FQg/k

On 3/23/25 12:37, Richard Henderson wrote:
> On 3/20/25 15:29, Pierrick Bouvier wrote:
>> This does not hurt, even if they are not used.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    target/arm/cpu.h | 2 --
>>    1 file changed, 2 deletions(-)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index a8a1a8faf6b..ab7412772bc 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -971,7 +971,6 @@ struct ArchCPU {
>>         */
>>        uint32_t kvm_target;
>>    
>> -#ifdef CONFIG_KVM
>>        /* KVM init features for this CPU */
>>        uint32_t kvm_init_features[7];
>>    
>> @@ -984,7 +983,6 @@ struct ArchCPU {
>>    
>>        /* KVM steal time */
>>        OnOffAuto kvm_steal_time;
>> -#endif /* CONFIG_KVM */
>>    
>>        /* Uniprocessor system with MP extensions */
>>        bool mp_is_up;
> 
> I'm not sure what this achieves?   CONFIG_KVM is a configure-time selection.
>

CONFIG_KVM is a poisoned identifier.
It's included via config-target.h, and not config-host.h. So common code 
relying on it might do the wrong thing.
As well, its presence is conditioned by target architecture (see 
meson.build), so it can't be enabled for all targets.

For this patch, it's only cpu definition, but for code based on 
CONFIG_KVM/TCG/HVF/XEN, we should probably check {accel}_enabled() 
accordingly.

However, at the moment, I'm not sure what is the best way to deal with 
it for common code, as {accel}_enabled() symbol can only be present once 
in the end.

> 
> r~
