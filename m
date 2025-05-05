Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2649195njj;
        Mon, 5 May 2025 11:47:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVZ4U4gWKrc0SxiVC8kci0wyNVdoN3wRvQrB011GZQhEyxD2ClQgH2qqA5qXA6sl4NbZgXJjGLLpPxZ/A==@linaro.org
X-Received: by 2002:a05:6a00:f03:b0:736:6151:c6ca with SMTP id d2e1a72fcca58-7406f08d404mr12911032b3a.4.1746470848416;
        Mon, 05 May 2025 11:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746470848; cv=none;
        d=google.com; s=arc-20240605;
        b=R1fqIpzhuXJCsWZhS+xV/jJkZR/ZzVded7xeUrHyC0SIqactVt0QV9d1bwrO4fHPgo
         oo+xj2OLM/fwoncgeKEnFsAAm+WeDmNUCXumfNl/maXaHBBfr01XkQrIQpEVVawNNAaZ
         0sG6qDNz69Z259vMdcegB3zXmCs4BiV4Lr1qYMry32nhbhJWx+X3j717GsJM2a/o+o0k
         tdRo+Kk/9QjtgilQCma8qFsPoh74sN/cqiMXqcDNLMfw+lOsFHy230jzh+pxERCGMXVJ
         YTHcb1Y+ysYjr0ERFcNMXohfQ9Zfsubr0t51aQNSA58gSaveP7XLA5NiPYTT3L1+Rf3/
         Ey2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=TrysJu1PXbfeK8SZ2A0j/x6crADYuLFKWDlFDWA0zQo=;
        fh=MFMKZ1kgASfxqsx4mcBLC9xZ7l6tR4DpVLpub0Cpsh0=;
        b=U4pGAPpCvgrHUZB+VBhcbYU/BmH2dhLf39qHguve1VAq3i7AgbV1ZcVawfwN23R1Xz
         9/VWyM5GiTUM/1cpVWv8jWvtpbV2+qwJJz1g6jLzzZSfM+T6gUhbEgUqu1OEjKPZUrVE
         MEy70YrhKzfDv97MHdJDd1mNA7lyMO+yyXoh/GClDCq0ul/4VvaGpoSeMS9/HxCabyQD
         a6fmXp3qA0VOHp9CirI2y7cbHemBY3S8jTOdi/WB9XYGfcv8ij3Sy/fSAfKViYdE+bQH
         DKZ99XhRUbUDuBaYzjI1/9ITmPzK2C7ihlyVhkHhe4ZlrrVqM5lXtN5H/1lPnJLvR01M
         35ew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LjsmQxBk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404fa0a249sor4531752b3a.9.2025.05.05.11.47.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 11:47:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LjsmQxBk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746470848; x=1747075648; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TrysJu1PXbfeK8SZ2A0j/x6crADYuLFKWDlFDWA0zQo=;
        b=LjsmQxBkNijXLlB+0kL8q76O7qL42El1XqeQ2FU8vlUG12ALm+XvRC7yOmZ4875a7l
         WHvX3pGz095yaKn15Aor7qLUUAwgCzRuL++EyMM8DS6tBoA8TNmTYKGPYb4oqOKRvHIB
         M6RobSA8WdJVpgW6FbWGafvtlW3wo1IPR0ycFIdoJaXqM0+Zl9qhxQKFBM0EDImo7G0u
         Soi731tlW7/HG6TCsWS4HiW/YayuIyczV1qHGjU7pZy6TJQeIjZpI+tpPwME4IvTuQZQ
         oK06vCzMkcbeKvoXMdjuoNswD8v77C9g4FoqT+eBOuFZVEZ4Jgl8lUAaDUSu+QqZ+Bb+
         4YYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746470848; x=1747075648;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TrysJu1PXbfeK8SZ2A0j/x6crADYuLFKWDlFDWA0zQo=;
        b=dHkJ/TCuQ6hVAs+ORq0Rp+fThy9X0VtHSWz6XIrusmpWd8UjciUXrMFrin9vW3XYjk
         iM1EQOF6zQe9yz3WG4tnG4PrJijiJs0mkoIwb/aWF64vS9pKW+rmBMVeNDHQ+RQAnL9J
         gTs/TWCuF04wsza2uQZ50G0NPDcmD7nSdGFfXrFo8eLwM4Wfpd4cXgomp4ZFjL6h33h9
         1vkgL07I5L8QZ60FuuaE1aYAPMvWdY4tPUsqAUDcuDZ6SJH085ZW1byIQcvMQMMPJaNM
         J9LPEhc06HVizKvDAv8hL07GxKgUpiSajvzXMxF6Na8u57vvqhVo/WmKNxCO2KDFt9CR
         NexA==
X-Forwarded-Encrypted: i=1; AJvYcCVCOU0Mdp3lt+WFSUwRjjD8P7PKBkHku+F57ws+0szlv2fOnDSjz2zj8vwyBlhwdxNJMzm8Q0bjZ1oWWw==@linaro.org
X-Gm-Message-State: AOJu0Yzfp1zUxNWdiBBWcE+TpCbPf0qpS5pRvO1cCmPybUCSDmChLhtr
	4WgLlGqSyy7jr8PSsAGi/BPUdeYA1mZ5bE3+z3iMr456wJuhnDPidtoEHp2uj3Ae+A==
X-Gm-Gg: ASbGncuDUEjgkYKuk1XCwGvd3be7X/JHazj/AkUeGaBkUs3jMvE3QREbvhRUXVxtdPP
	7Ho8ErH8BdeeeZnFyygQWYQhJot2YPrq2i8WYCiW+Hs1WTLMNULm1CFFs5H0VkqnpfABFpkuIcL
	btGYM/L0mjCCxlwpmfxvDBUSe1li1RLzoVOTvwr66Rzox8+wZjOpjwxzkbfVTEb3388TG40aF/G
	eKNE3ni6mCTQjQ0UM0ZQdYOI+bYG1j6vY+isDt/zt+ru/ZdjyCKzJB4zSSHVKo86m+sPj9wGtXq
	/+ExutQHWHr+grbgKZ2YH3nj/n/J+SIhd1rqvbsyRuIp6PBTjpRlaw==
X-Google-Smtp-Source: AGHT+IEt7/lwpwdaScb+0p9Fg8aZK81PZGU74vSUU2NY/HtKI988XqzBXbfqUBIR4rmnm1R5PX8mag==
X-Received: by 2002:a05:6a00:8f0c:b0:736:50c4:3e0f with SMTP id d2e1a72fcca58-7406f0b5e78mr9676093b3a.10.1746470847991;
        Mon, 05 May 2025 11:47:27 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059020f4esm7153739b3a.112.2025.05.05.11.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 11:47:27 -0700 (PDT)
Message-ID: <f33fa744-1557-4c01-ba49-e64b4d3b6368@linaro.org>
Date: Mon, 5 May 2025 11:47:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 41/48] target/arm/tcg/crypto_helper: compile file twice
 (system, user)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
 <20250505015223.3895275-42-pierrick.bouvier@linaro.org>
 <79916f8d-2793-40a7-b769-ee109c52ef63@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <79916f8d-2793-40a7-b769-ee109c52ef63@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: tqVgLD8FTUwt

On 5/5/25 11:38 AM, Richard Henderson wrote:
> On 5/4/25 18:52, Pierrick Bouvier wrote:
>> --- a/target/arm/tcg/meson.build
>> +++ b/target/arm/tcg/meson.build
>> @@ -30,7 +30,6 @@ arm_ss.add(files(
>>      'translate-mve.c',
>>      'translate-neon.c',
>>      'translate-vfp.c',
>> -  'crypto_helper.c',
>>      'hflags.c',
>>      'iwmmxt_helper.c',
>>      'm_helper.c',
>> @@ -63,3 +62,10 @@ arm_system_ss.add(files(
>>    
>>    arm_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
>>    arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
>> +
>> +arm_common_system_ss.add(files(
>> +  'crypto_helper.c',
>> +))
>> +arm_user_ss.add(files(
>> +  'crypto_helper.c',
>> +))
> 
> Could this use arm_common_ss?  I don't see anything that needs to be built user/system in
> this file...
> 

It needs vec_internal.h (clear_tail), which needs CPUARMState, which 
pulls cpu.h, which uses CONFIG_USER_ONLY.

I'll take a look to break this dependency, so it can be built only once, 
and for other files as well.

> 
> r~
