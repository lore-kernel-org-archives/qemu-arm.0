Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1654114njj;
        Sat, 3 May 2025 15:35:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXx2BM5gK8w/wXbjuSt89zQEjgpY8sgHEb7TLb/vbZEgGsp8iOOCFhcTWjOFM06JdUwZDFtM1Y0eB2X0A==@linaro.org
X-Received: by 2002:a05:6a21:3514:b0:1ee:45a4:eb3a with SMTP id adf61e73a8af0-20bd6e48fd3mr17326492637.3.1746311739371;
        Sat, 03 May 2025 15:35:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746311739; cv=none;
        d=google.com; s=arc-20240605;
        b=Kdolulw6FRV6rI0XsZoU1gKl3SPgphVKNNd3bbvWnwOdNfbuxeP4neQ27p5xvXE8mj
         qVq2arBvCOd+zbFS6LKjbb0k/X+4HZ+mGo/vo4H5CIA5UW0wf28w5fo30sh7FuV/rzkd
         4x3Pz0q2Ea8ndpR08o+vMgRofcTTPJ5a0Twy7Kqez4dGp9bpNfPZKmlBoh55XmqctPNl
         sht50CcKgltXlUqhb/ohKjpD1fcriFSulTCu15ZNOilAZdHyGZWVOTh246cZUkZJlUTP
         XElvBFOj877g5ivLyHfFEgNt4nw6e5Jdnk3bwyvueBX75PgGJ3dfgGS/utEhbX7ksMV3
         67/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zBDLv71STM75w0x2/WasV/3cQ/v/8orxvJvsjTDMfqY=;
        fh=/UW7UMSNFZjYCpFpaDjL5T8B9fwvhxLpNwanL+IRxUw=;
        b=h5qcn1z4OtCpVBTFGQ+yT1h8iDjSfXT0gZlJxp0vVT8Yvf+WqcqF7lCKhUNIv6Z/H0
         +7RQg78MlMFs6DtUsWdXgZda62GIo92GrtntvTjDhX1aY/dAzNS5woXCYEynus+znfbp
         2asR8zePWSGyaqQwO5typXvNQYf+1CGRd5yzAQQxvyTD3ObcQYcxSEEltrQ0n4ysFaH4
         r4fJn9TFVUrX9KJWK9WRa9LQbbjRCpxAwi+6KwkSdF/FC2MUIaUVNpR/5yFMlFnJGYIh
         UDJHzG8ao5/sLWjPZunUEv+nh1wx3jc4EGUm2FA1rwDRbhByDxuBU34qugj8bCC0lr3D
         sX0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nhLlQbZ4;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b1f7b40e87fsor4704080a12.2.2025.05.03.15.35.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 15:35:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nhLlQbZ4;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746311739; x=1746916539; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zBDLv71STM75w0x2/WasV/3cQ/v/8orxvJvsjTDMfqY=;
        b=nhLlQbZ4Mk5IY5maRsz3MwcEbGARL0lpWtUkSe60ugpZsOyM7bKFrVJwDM0+a/lFBf
         FlJJCb9Oq7gDNIEweBAjZD+LAA5ERtC2JbfQu9TNhZqME6Tv55CRRZZ2u8ZBs0M7f2kp
         2GAPNfZ8ndfDrKrq5ipteG+FiC+bcSGh+E6oe2UtYHxU0ed7kJS7o9F1UZ6spQ4Mzcmc
         MAZKYO27vu1xTCYPqE6zVtHPTPq+n4gGHIHeJfaEJoYEpaEDcZDMySfFb7819FZ1q66q
         Vf188FUFT23tQxI7B2nybI4OuwQPd7oDgh8L8gipXeDT7/fbQZYd8GG6xFeVsBdLJbrn
         n2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746311739; x=1746916539;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zBDLv71STM75w0x2/WasV/3cQ/v/8orxvJvsjTDMfqY=;
        b=wZYt70MXK/SLRMMnBOYHIrc9z/w+zbOPQUJcCRqy8reFNSlJ7hEkDpgn7WYn7dBSKo
         WM0SB6Fqi8bFrwZZ8CB/MomvL2JTAM7Te+CXn3b9fpdqzGUSi6BAj21f+qUWbvuqhklW
         vmeHOGn4FsARCsNfabO8VBiQldH8QlFu5pBvJU/99I4zpsqOLNbGmSTkXsKeFYJZtzXr
         7cDep4I9+vmf9BnhY7rXlYlG/UG/oEja11U10hF6Raz7H8XUO8onnzRknIP07chL6Tve
         VbMDRfkTKY8j5FlqAJxqLybmh748qHtv1vVRiLWQwqYnWB81vfyWgbqqlYJiqu5NghJI
         mE8A==
X-Forwarded-Encrypted: i=1; AJvYcCWDelyf7zeUC7L27gJr966XOD1pUVG2ZnpKHCMilJ1GTJrCPgCbSOpgadTml3JJgZACFcKqb1tRqmv0JQ==@linaro.org
X-Gm-Message-State: AOJu0YwMBurzsRSE6ID2SCoru0P480hCQovQaSlys7oiZsxME/LehRme
	hJe1Ttp/7d3VI2IJvekn1heRJ07ZNzU06GKRhRpnEEOCcxIyF0XJS5FE39Fo9ay0Sw==
X-Gm-Gg: ASbGnctj6BTF58B/8peVwXckoP5sp9RY/ChbNEr/6AsKKfIZT17FwmcCyjYavP4QWDU
	7PDc1W2mukaGLHKRLRzRPo9g0F1G1k5ud7bIJUuHm66BmqkJ8oyGTbbQ8LPnH++zd5GrZzkEkSr
	Ts5sJsYACiX1T5tpuplrQvCubI958qCCyXRw5/yaDI+x5h52e1R6kXg+fwZSdzSev5x8XbgmvjW
	fJ+PUbindCbL5GN36XViBzPCMzxvGGQ+r5FmAF10CS4r5HXtO/K8Sm6K533jKFmKSPlRaU42+dA
	I+j+Vd4iY2RHD3L3d7Epf+bRWgXi/mKIIgWLk4Zy3H+TGqqd2ukBbQ==
X-Google-Smtp-Source: AGHT+IFJAVVz+DXuFU/KI+fGh5lxTsxPYTq2T+1ENcK3xXo/V3zdiRTE8LsOsqIZ267Yuwp1VlKb5w==
X-Received: by 2002:a17:90b:3bc6:b0:2fa:2268:1af4 with SMTP id 98e67ed59e1d1-30a42e72d1amr15068492a91.7.1746311738932;
        Sat, 03 May 2025 15:35:38 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e150eae35sm28820185ad.27.2025.05.03.15.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 May 2025 15:35:38 -0700 (PDT)
Message-ID: <a1894468-896f-41ba-8c20-851f92b465d5@linaro.org>
Date: Sat, 3 May 2025 15:35:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 29/33] target/arm/ptw: replace target_ulong with
 uint64_t
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng, kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-30-pierrick.bouvier@linaro.org>
 <21d32a4f-8954-4a36-ba0d-6cb7a50f242d@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <21d32a4f-8954-4a36-ba0d-6cb7a50f242d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: dgN8/kUr9XRf

On 5/1/25 12:35 PM, Philippe Mathieu-Daudé wrote:
> On 1/5/25 08:23, Pierrick Bouvier wrote:
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    target/arm/ptw.c | 4 ++--
>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
>> index d0a53d0987f..424d1b54275 100644
>> --- a/target/arm/ptw.c
>> +++ b/target/arm/ptw.c
>> @@ -1660,7 +1660,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>>        uint64_t ttbr;
>>        hwaddr descaddr, indexmask, indexmask_grainsize;
>>        uint32_t tableattrs;
>> -    target_ulong page_size;
>> +    uint64_t page_size;
> 
> Alternatively size_t.
> 
>>        uint64_t attrs;
>>        int32_t stride;
>>        int addrsize, inputsize, outputsize;
>> @@ -1733,7 +1733,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>>         * validation to do here.
>>         */
>>        if (inputsize < addrsize) {
>> -        target_ulong top_bits = sextract64(address, inputsize,
>> +        uint64_t top_bits = sextract64(address, inputsize,
>>                                               addrsize - inputsize);
> 
> Maybe use int64_t for signed? Anyway, pre-existing, so:
>

Yes, I'll change to signed integer.

> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
>>            if (-top_bits != param.select) {
>>                /* The gap between the two regions is a Translation fault */
> 
