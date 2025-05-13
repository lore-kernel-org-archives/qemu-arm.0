Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp667098njb;
        Tue, 13 May 2025 10:12:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgNLOVZqs/igyxiWP7IiuvrQ3xCnaFvwY0nerJ7bakuyiHOVTwb0qQ9ierOwZfOZ2aNEysl2cHytd41w==@linaro.org
X-Received: by 2002:a05:600c:3d8a:b0:43d:fa58:700d with SMTP id 5b1f17b1804b1-442f2179e32mr886045e9.32.1747156337623;
        Tue, 13 May 2025 10:12:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747156337; cv=none;
        d=google.com; s=arc-20240605;
        b=HZEQHesL8euXijVVC+wmN0cQRg7DQ349PB/qyC+9mwRAWDFvXQ4mDhUca53U82baC8
         88cU8Ao0Fwzot6jUQHNODUQZrBDlN7+tzchVuIeIw2opWsf0ESlu+xVr92dEpFy6ckQZ
         yVQaooaTNR407sJqmSyRVJKA+OIozjlRf9ed6TLk7NM4KEqiRA+jSjr8WvqOYEHhzKYG
         cqM6YiBtR7420CoIjNY/2mObYqdolgSkotdy4j0I+qb3GU41iTyrBn8x623xbL4ttl8v
         fof6ZujaaHiRB0Ecc67V1W9QjTfVpAtHJC1IXQxvoPVa9YTu2DLBHOcjYUStD6AEdeTn
         RDGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=T540ncNJFrqke0ZjSBQ7eQ9JCXacMOXT7j2qsKpoG/8=;
        fh=iu8zH5QW5H7u2ydexKwFF/pIPEii0ygRK5xIwlFxaKw=;
        b=HZXI1oBdZYvNG8y4z5l4xIhnnmnIDJdHE7stCBkv3Dpt5zdbWG5OmUQ5Ew3t190ISK
         QrYsheJsls36/hSdS9WER1CK4SM+tvKwbFmPeW6Z2IqRqjt7iQJOHvVgJIIp5Mkk31k/
         L5gsDqiuL/+qnSK7J6A19i86IwA6U0kZZwWL3WsdNVTSkKSQPRTHV8a22c5s/aCCbWkw
         v89RHKrIFVG4YZkxGsWK/UfkiJIztqaVQKrz0xnOpbZMAqS3fQLiRFcR4Oe6mwUH88J2
         Tg2BcTJ4B0yol4tPMvmdS2YBndIuhlunZ0H9TREtXjXSjbg7OBjB9gNZJzi5iAIeph1r
         +fwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qW46sCsV;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a1f5c02ecesor4370073f8f.6.2025.05.13.10.12.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 May 2025 10:12:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qW46sCsV;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747156337; x=1747761137; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T540ncNJFrqke0ZjSBQ7eQ9JCXacMOXT7j2qsKpoG/8=;
        b=qW46sCsVkRzYlQwDCPxxLXuR7x3gMuWjlPuaPQoYWvcuGky8DmFMdJJ9AX+0hIGEzK
         w1q0kGG68Acu5RGCzQncyCWcZbB0wdeI+aePskKHWopcaNhCcxggIEg1MDHJkugYGv68
         Co31XN7oTCpZkgLwmAAz3hqMcb1wqCfwo6UY06KRMUyRmMjH40Z9+EzyY8ytALizNBp1
         ON97Lq4p5r0HHzdSJTc8BdUPXjorYdZ7tzbkde2OJjrTR3+LqnPuxblaoe4T2rD6EVj4
         m98U84cKc5s5rwEQiixehBWCs1xA0sCM5PqGg+NfgWIO3eSWIZj5+8Q7ogjNf7y0dCBT
         eu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747156337; x=1747761137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T540ncNJFrqke0ZjSBQ7eQ9JCXacMOXT7j2qsKpoG/8=;
        b=G7bHMegb91DExAV/tBZmLvrv/rHnO08I/k3+vaSkYdg+3A88/1jWDMAMNhdrOed7My
         /J92KT/2YY7c/JjcZpJeHQV12NffJvLzngVXiiX36ys6n+MUWEN28RlZX75JvxbA5Nzr
         elSWw1CTNjjXnBQzaCq3aU9ENoY7O79SYF/md44f3Izq3QSwjywP8bh6sUwGkZaOAYUt
         NRFclkulkZ9JbRJvfE2YA1bPcSu+hUhc0+HQ18BN4LTq2AvhW/8tK6VdQBmZvI0Nqun/
         otbX3Ypi9dyTH6K8oUIvGQNalW4aMclo8xlpOMLvcGmb33obWbuYx9bFNbtrlPO8C7cn
         6Yig==
X-Forwarded-Encrypted: i=1; AJvYcCWqyKfBDvpj3/epl+o/4oJTphjXpEj+z/KYk2tUgCrlC04ZJNc6TUO1VpP38DZLpDl1Ra1A76WQviVDHA==@linaro.org
X-Gm-Message-State: AOJu0YzbDoRfNWdw8yWZlD846crTKgMaJljVWar1YhocS+betyrHiSJN
	zFvVfR1J3N3AGwUVOyo35QSR1Gcs9j4WqYeB3QdIq/A067CTJOu9qWE1Z7ctvHWRNA==
X-Gm-Gg: ASbGnctqp9TAs4eVWPh6w5rEffqj9SPCgVR3hsgvNiMR7mqkOtoFieP+RVPTHT6/WGy
	lhD2OkRyKlSx5qoTSe4C7/uyQCdBWK27GbvxGSMu4yHA/xcp1pUSFziiOOAFJQSciQaAOa5qzJ+
	4Xglb66QF1CKSRVMm2wq26IIa6kYWdixLNO78c60HmsIqu17jUPHAMYwvt6OTTd5msL+ZhE+gJo
	Ia5ZJ9CgmTrZvS88Gwes7DYzznbxZijTyW/OPa2TMt/qcokvCvn8XCu3FLk+wdeticRyGe0ZB2N
	FGZPqORMwHgogcmoT8QX+bH6S6qZU/tyDLp1DKI3KZywdtHbWKe//51KTNA+VYSNHF0es0hfGNX
	PGlE/tMoNocznPSpggQ==
X-Google-Smtp-Source: AGHT+IGL16BdFJ++J2CAKTAD4h7uoECpiXj/ZB09lxvIo8wt2EW36FWymJLMvbNmNt0byDIquGel8A==
X-Received: by 2002:a05:6000:1788:b0:3a0:b8b0:440e with SMTP id ffacd0b85a97d-3a349928fd6mr75822f8f.45.1747156337122;
        Tue, 13 May 2025 10:12:17 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.61.1.197] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ec8f1sm16629888f8f.26.2025.05.13.10.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 10:12:16 -0700 (PDT)
Message-ID: <cb2798a2-e673-427c-a83f-2afbac59751b@linaro.org>
Date: Tue, 13 May 2025 18:12:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 30/48] target/arm/ptw: replace TARGET_AARCH64 by
 CONFIG_ATOMIC64 from arm_casq_ptw
To: Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, alex.bennee@linaro.org, anjo@rev.ng,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
 <20250512180502.2395029-31-pierrick.bouvier@linaro.org>
 <91cd9b9a-8c67-47d3-8b19-ebaf0b4fab5d@linaro.org>
 <39c6f5ab-6e45-491d-a0e8-07408e29e2f8@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <39c6f5ab-6e45-491d-a0e8-07408e29e2f8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: BHa/lPDwo4M+

On 13/5/25 19:03, Richard Henderson wrote:
> On 5/13/25 03:41, Philippe Mathieu-Daudé wrote:
>> On 12/5/25 20:04, Pierrick Bouvier wrote:
>>> This function needs 64 bit compare exchange, so we hide implementation
>>> for hosts not supporting it (some 32 bit target, which don't run 64 bit
>>> guests anyway).
>>>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>>   target/arm/ptw.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
>>> index 68ec3f5e755..44170d831cc 100644
>>> --- a/target/arm/ptw.c
>>> +++ b/target/arm/ptw.c
>>> @@ -737,7 +737,7 @@ static uint64_t arm_casq_ptw(CPUARMState *env, 
>>> uint64_t old_val,
>>>                                uint64_t new_val, S1Translate *ptw,
>>>                                ARMMMUFaultInfo *fi)
>>>   {
>>> -#if defined(TARGET_AARCH64) && defined(CONFIG_TCG)
>>> +#if defined(CONFIG_ATOMIC64) && defined(CONFIG_TCG)
>>>       uint64_t cur_val;
>>>       void *host = ptw->out_host;
>>
>> I'd feel safer squashing:
>>
>> -- >8 --
>> @@ -743,2 +743,5 @@ static uint64_t arm_casq_ptw(CPUARMState *env, 
>> uint64_t old_val,
>>
>> +    /* AArch32 does not have FEAT_HADFS */
>> +    assert(cpu_isar_feature(aa64_hafs, env_archcpu(env)));
> 
> Why?  This is checked in the setting of param.{ha,hd}.
> See aa{32,64}_va_parameters.

I suppose the "AArch32 does not have FEAT_HADFS" is misleading then.

Better if no changes are necessary and this series can go as is.
