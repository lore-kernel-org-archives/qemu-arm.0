Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp660209njb;
        Tue, 13 May 2025 10:03:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWoFIYgKQrnCmNYUbZKsTAJrZ1M3hsES91thvuGh6ReV1zrtimc+SvjWR8/AWi7T0xmOthJnBCYSU0xMA==@linaro.org
X-Received: by 2002:a05:600c:358b:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-442f20e8141mr1125485e9.8.1747155813038;
        Tue, 13 May 2025 10:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747155813; cv=none;
        d=google.com; s=arc-20240605;
        b=knuWw/zYtWRSwK3WxtoBwDH3p9MNKw03HJvwUD6Sm/xUq1WWOxQ3WI+kvHyEuR1qbO
         b4R2KPSioE3ONOLYtpxM0xYIWsqyDAR9bmy7IPtsQOEic3bXhLLPC+qY5nYMMzIR9io3
         A69vyS2/d+rL+ifNUysd2zlJME/LA2oabZ79VfPLtxULeK7BuxFx/MmaDrx4oIpWjqei
         XuAuwB4kOAB7KYns1/OX1/ppQms3033aAsBazPDelI7NwRkfLv08/LQ/ERe6ITNWAZ3a
         XXJ+PeaWCgE829Bednd/t0ConBq157/18dTsrHNlxgyeCZIFsYsVYFuzuMiYz1f9GSiO
         Q8mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ec7nBzZXny1twVolLK/NIf749kxcJmpJJJ9Zt7x7exA=;
        fh=J34ZExoMr9iQReftymWN90GeH9rkpv8QIehE3RzimX8=;
        b=DdsO+QHuDMUtiHOvE1JCgb625i+jMmUBbS9Zn9VqmBhpejmaRQPGDtzS+oWgBvKmnl
         K6M5YEwmz8wAvOX07KP7iQgOWgOa+R3IzEmEOlvY24a2LL0EkqIaRc2JQ4/dWD78ylVW
         QCkMs+d+B0kllTtOpXdcEtHGIZCAN5OsVXtqYS83SCGeecQtBd3zBlHSnhgAm0weWZ3O
         xN5GQNuvLgX2UYZbFy66/Fl2CvTO0odsDJOTVIvToAvXN7PO+J+MwjiI4EwyO6xzL2G5
         ny5MOv2FOjP0VeP52J1tDgs2YKxYLrhXDIzwv7DlViIA6YUSut99ltKyt5PdlCsTRdsz
         FCbw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JiFVsDNt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-442d67e2c6dsor27801365e9.3.2025.05.13.10.03.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 May 2025 10:03:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JiFVsDNt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747155812; x=1747760612; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ec7nBzZXny1twVolLK/NIf749kxcJmpJJJ9Zt7x7exA=;
        b=JiFVsDNts6RiumFGlK511SUw2Hfl2oCmSxkx5HjEeK6JA5GJStGCaAFHD9RnrG14XK
         Q9Aw+yAfAOPaRsTVwINprtf/C/p5jyALqaBIH0DYWn5kSaNcDAaA/+ImZPXQJjASh4y0
         EdFIZp13dke388ZyEX5yOOvD84WwsxFImRPKMz6cBGJjkUUuauDK2DFC6PboDZZKtN2C
         q7ww8Te4E+I6xwMnr67jEnHWNq/bL7gZPn/AWRoJ8QmRk98ZJUxvErw8hcRdwBEciDpo
         b2/sjp1WzkHQON25o2jF3M4ugNLngGsZIvz+BUb5v2cn9TG84K02VmvY9SvAAxtW7i8R
         FSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747155812; x=1747760612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ec7nBzZXny1twVolLK/NIf749kxcJmpJJJ9Zt7x7exA=;
        b=OqBVa2FQ6XHe5f9L/jAoRHQNMY5wOFCUPj9G5XobGz2z+2XrX8oNdMGmXyD8Po24ye
         TvI0d1YzJVr8ZDkcrQfQaNrRx5f2+eRdPm8MOpNASuiVhWs3c9Pufy4se37i2JADowZO
         n9rSJ3989VqRjpCz6FqJwkgBIfBoqfgN2gdJDFTYzxayzFKAUN8kDX5OhNs2EQqATvgm
         ec0CKl+N04Zn8a1tgvV1pEuh9ToxnOYApfWxZ/m0aS0vX8uG9jkDgMkcJPsh+vZPCnWh
         BinwV0EEp7fE4MUVFI8DZEsSPK7Gn89hCCTt4j3L6ziDYlVwhyXckf/PBlyIJn22pOKd
         H2zA==
X-Forwarded-Encrypted: i=1; AJvYcCUOSeCDcMJ93Oux7lb8eOrMmapppyhMdF4r+/femOkGnm0By4pwDr2maBfqk02mFcI1O5Vk00HUG1PsBg==@linaro.org
X-Gm-Message-State: AOJu0YyaENH8fkarQJCudMTASzIAMRowrdeOoPQ0p/VAOf0BfnwhZCct
	390r6oJGGiLcHsik6sGxfiTsyseREtcLoag9Y94Pm0RF4P6VDYGQ+QxfxBMGg54wzw==
X-Gm-Gg: ASbGncsnKKq0hC+amgmaXFevzsfYz7pLRWZRacDsdKHzkUUFOHDQ1wyUfKNKl7+ScCi
	jX+vls7YFtKe+x0EQZSOv6n7jINEBbHrk27kNOOxysR5L91ca0YMZw+0yqIPPI7rn0q0YDa7ve+
	q9JMsNzX8Oyya67jTK01KgcSONY50mJUSNNKPrnsKbSwV/bV2vnTl/swrR9gnl47Qv0XEH37It+
	cKMXOvBPM1iO9Ei94YmVF1PDo5/pcU+oiYTGkTmRN/Aiai1OIlwrI00tNuJxT672qOHeJVZml1P
	GaV8NA4jOPFn1p3txivwdsdZyG8RFmKFbwPHG4C14PxxaOv5uzeJoN0vAvu1pdH8aG2lIrSc27l
	NIv3JF2Sn8FkBRyJ/X+7M9VatJk4=
X-Google-Smtp-Source: AGHT+IHuvD7b+uKWAZi2SJclzjF+sG6qnTzikqIaAqLvy1x6sWnsYSvbygtOJLCjYHGjW57+5kTnug==
X-Received: by 2002:a05:600c:3b17:b0:43c:f8fc:f686 with SMTP id 5b1f17b1804b1-442f20bb64dmr1242485e9.3.1747155812242;
        Tue, 13 May 2025 10:03:32 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.61.1.204] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687bdcbsm176408005e9.40.2025.05.13.10.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 10:03:31 -0700 (PDT)
Message-ID: <39c6f5ab-6e45-491d-a0e8-07408e29e2f8@linaro.org>
Date: Tue, 13 May 2025 18:03:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 30/48] target/arm/ptw: replace TARGET_AARCH64 by
 CONFIG_ATOMIC64 from arm_casq_ptw
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, alex.bennee@linaro.org, anjo@rev.ng,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
 <20250512180502.2395029-31-pierrick.bouvier@linaro.org>
 <91cd9b9a-8c67-47d3-8b19-ebaf0b4fab5d@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <91cd9b9a-8c67-47d3-8b19-ebaf0b4fab5d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: WGvfWWq3jBZn

On 5/13/25 03:41, Philippe Mathieu-Daudé wrote:
> On 12/5/25 20:04, Pierrick Bouvier wrote:
>> This function needs 64 bit compare exchange, so we hide implementation
>> for hosts not supporting it (some 32 bit target, which don't run 64 bit
>> guests anyway).
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>   target/arm/ptw.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
>> index 68ec3f5e755..44170d831cc 100644
>> --- a/target/arm/ptw.c
>> +++ b/target/arm/ptw.c
>> @@ -737,7 +737,7 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
>>                                uint64_t new_val, S1Translate *ptw,
>>                                ARMMMUFaultInfo *fi)
>>   {
>> -#if defined(TARGET_AARCH64) && defined(CONFIG_TCG)
>> +#if defined(CONFIG_ATOMIC64) && defined(CONFIG_TCG)
>>       uint64_t cur_val;
>>       void *host = ptw->out_host;
> 
> I'd feel safer squashing:
> 
> -- >8 --
> @@ -743,2 +743,5 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
> 
> +    /* AArch32 does not have FEAT_HADFS */
> +    assert(cpu_isar_feature(aa64_hafs, env_archcpu(env)));

Why?  This is checked in the setting of param.{ha,hd}.
See aa{32,64}_va_parameters.


r~
