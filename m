Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3242815njb;
        Tue, 18 Mar 2025 15:16:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX5SaFkgDc1cPWW0p6eknqCn291jm63qClKmTekt/Zbk20RmnqdQv/JeC5ouGx7GsYQdtSHzAMKQArzzQ==@linaro.org
X-Received: by 2002:a05:6a20:1605:b0:1f5:8179:242f with SMTP id adf61e73a8af0-1fbece4017cmr561123637.30.1742336206344;
        Tue, 18 Mar 2025 15:16:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742336206; cv=none;
        d=google.com; s=arc-20240605;
        b=KZBxoe53dy2Drm0LyfpbJRHtmu1NC00JiMLRIFnzvS5uVOajs9QXrwEtINO3AS9i6o
         kLj50B3m876f4IuLhWW0LeVt3rSC6GM9mqtiX3pAzJKEIMV5n8H/EqC4yMYj5Y1DocHT
         G/YReAq2db5/rKlLwzj9Z3KtuQ9Ub4cYiyaIKIYmaUH/toQPulyLKhmA5MoXJNnw9A7/
         d0aUbcvH7JU1sJaCAqjkZe+VJHLH8liRGyt9WlwgsLg0eS03NKfFoFypftU3yaPMGNJa
         DfIKSltD/B2OFs+0ASdLkjKf+wGd/shHBqcllLoTtYthSA0dew30jzHf6DJTMkCtxV/J
         DZpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Rlhpsl5tgVQ8zMRpowh4yQuosLc3O2JMgDZISfiZ5hM=;
        fh=Bv5/jzK4vEwOCngm4YS1NbLpaRa0dqjj1UniQ/ZL2a4=;
        b=aYChDfzp4UyhSXRZosJqwpJ/H7ms4q3DVyVjiR4BWuU9bXzdSiTGNrSvez52lNENoj
         wygnB2FyaZSWN5pNLqayhL+JibZkOQSv2JnGoK2GvBmxaHUysAr8qeP/CxCuQpDLlP1J
         kP8nCkU94l8u6t/U1wVduWynuq1Ze8G72duOcuixXHD0P13yGReod8umTRnItppKz6yS
         JzOrsaX4+qrlAxCMqw6RplZMO7jL+0uBTMvI4cF25aOcdqWvfApldKXhqXLA2d7lMeM1
         xdc6i9aAZxX0CqojVwxmShWMLqBglfXdZA3/dKLdjrzIbCAnTAegOEL6AsuFbSRHPOg/
         fYEg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H55ukSVS;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af56e9028absor6821812a12.0.2025.03.18.15.16.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Mar 2025 15:16:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H55ukSVS;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742336206; x=1742941006; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rlhpsl5tgVQ8zMRpowh4yQuosLc3O2JMgDZISfiZ5hM=;
        b=H55ukSVSA5xNdaV2G4BOHbaWT2uPCG75G9IASL2BV9NYzSC+rXjDHuJlyjv/GGAOB+
         iVlfgQfZ0fcvDgZlQ38NKfWl2+q8vkygM8a3S/7R1+5h7GIatFOXQT7DGl3yCj/iipWC
         ijmulzViFJOs6X3jyTC3Il7u/6QuzBZBn8vf0BASgooP8lyGv5/pYeoi7BIz6S0yPNwq
         NIdH999tVGRJPx6TprQqYWSfB/WnN6hG27CsicYZCOTSemSAtMX6bzVwRhodphBMAbtw
         Ju5IXh7X4jbGLlsFp8ttwmlAizxn8vDITPizIUrn3nUaEqFJCv+ohDf75B/LU2glyfiX
         CM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742336206; x=1742941006;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rlhpsl5tgVQ8zMRpowh4yQuosLc3O2JMgDZISfiZ5hM=;
        b=i94afaZKyEDKer0ZDRnzSN1sfefnHFY/40wNmGM3m24rcBAi4P8p6WYyieCp12/ni8
         fCAxDRDAu9rR0Dek7x5qu13c/nFYGLppqvoJRjRQOrtNK1Lyl28CB7rWSHfVJRwHqRRh
         3QtLjvfRQIgi9VO6DPW+O5A7erukh0FFXTomtPG+rz3sVhdeJwynioOHkci1eZKHL6tz
         3sskC0q3wnp6xJvGrcjEge7HY1qLLulRsDGegPbk14Qu1dvTo7TavUyaKdVOk+vdSoT8
         j3H9K4nf5CBzR4YdUTM/cytAIl+gdo53iEz9xEQ0S0QpYRFtMif1d6cndREyyGW4ExZ2
         jGgA==
X-Forwarded-Encrypted: i=1; AJvYcCUjPxmVXqKxWKqxBiH0jYoHH5EjwcIrAmA5i17I7FcxYhlbP2NhAYgPod6dUuVagIRiH+TiayP4pSA1zQ==@linaro.org
X-Gm-Message-State: AOJu0YzO25THQeQ7AXbpjiAiIzDJJuyWn28ZZuUxjb6LYRPEBKtO9tqa
	8iE0Awq4PYObL6xi9MaxL9HHBr0Te3ksFY/edGICBZa78eHVl695SCY5DeABF2gs5A==
X-Gm-Gg: ASbGnctOYIn0Cx6Rm/60x6X9gAjKu0iFSm0vl0XFX1HeBDY5jI4MUtgsrKfhp1yGJS7
	rrVqoy74fzXHpqN4RvTYQ0gl1AI9WMwsCKxOCM6KCLqGtneOhZEMIAPQC2l4VWy52E/MMGdYHPL
	cjMStLwhsB0htsjsPc/0WY6gbHZMOezomLk1PZ3Cwe8ny+VIVhZ72SXgTBoXMRgYoh3Ft/fozrA
	0+JG+ipirVZ6ZpjZ5xVnXLWqyskrA0/E03apepQk4X0DpiYUqZWM7wCs7Lo2rp72sFe1+EgDNR2
	f3tXiPkCKCU7PW5SaormWgGcd5OwpMYxzIdrxeU2PEDACqOf90b2Zg1Umw==
X-Google-Smtp-Source: AGHT+IF0Ndckq3b583mtKOlY3MX+DN60sgn8v5grOSR3pSkEnnl/CZ8U2ZVgWTXR0oI67omvJr7PSg==
X-Received: by 2002:a17:90b:4d05:b0:2ff:5ed8:83d0 with SMTP id 98e67ed59e1d1-301be08e808mr471081a91.16.1742336205845;
        Tue, 18 Mar 2025 15:16:45 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf61b34dsm10012a91.30.2025.03.18.15.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 15:16:45 -0700 (PDT)
Message-ID: <7202c9e9-1002-4cdc-9ce4-64785aac5de4@linaro.org>
Date: Tue, 18 Mar 2025 15:16:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] exec/cpu-all: allow to include specific cpu
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-5-pierrick.bouvier@linaro.org>
 <35c90e78-2c2c-4bbb-9996-4031c9eef08a@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <35c90e78-2c2c-4bbb-9996-4031c9eef08a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 8HvPP+VWEQHQ

On 3/18/25 15:11, Richard Henderson wrote:
> On 3/17/25 21:51, Pierrick Bouvier wrote:
>> Including "cpu.h" from code that is not compiled per target is ambiguous
>> by definition. Thus we introduce a conditional include, to allow every
>> architecture to set this, to point to the correct definition.
>>
>> hw/X or target/X will now include directly "target/X/cpu.h", and
>> "target/X/cpu.h" will define CPU_INCLUDE to itself.
>> We already do this change for arm cpu as part of this commit.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    include/exec/cpu-all.h | 4 ++++
>>    target/arm/cpu.h       | 2 ++
>>    2 files changed, 6 insertions(+)
>>
>> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
>> index 7c6c47c43ed..1a756c0cfb3 100644
>> --- a/include/exec/cpu-all.h
>> +++ b/include/exec/cpu-all.h
>> @@ -46,7 +46,11 @@
>>    
>>    CPUArchState *cpu_copy(CPUArchState *env);
>>    
>> +#ifdef CPU_INCLUDE
>> +#include CPU_INCLUDE
>> +#else
>>    #include "cpu.h"
>> +#endif
>>    
>>    #ifdef CONFIG_USER_ONLY
>>    
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index a8177c6c2e8..7aeb012428c 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -31,6 +31,8 @@
>>    #include "target/arm/multiprocessing.h"
>>    #include "target/arm/gtimer.h"
>>    
>> +#define CPU_INCLUDE "target/arm/cpu.h"
>> +
>>    #ifdef TARGET_AARCH64
>>    #define KVM_HAVE_MCE_INJECTION 1
>>    #endif
> 
> This doesn't make any sense to me.  CPU_INCLUDE is defined within the very file that
> you're trying to include by avoiding "cpu.h".
> 

Every target/X/cpu.h includes cpu-all.h, which includes "cpu.h" itself, 
relying on per target include path set by build system. Now we have 
common code, there is no "per target include path".

The other solutions are:
- build hw common libraries with per target include path, but I thought 
it was a good way to cleanup this, and not rely on this hidden 
dependency on the build system
- remove cpu.h inclusion from cpu-all.h, but it requires more 
modifications in other places.

I'm not sure which is the more desirable, compare to having this weird 
CPU_INCLUDE trick.

> 
> r~
