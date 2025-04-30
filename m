Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1158894njm;
        Wed, 30 Apr 2025 11:44:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUpJ+zZ2TLqPK1lwese/YwNc9WM+Vtwe4t+Zr0g+kWDLLOdtzQOO0AwJT8FQymVSEKx/Y1nEfNpcV0x7Q==@linaro.org
X-Received: by 2002:a17:903:3bae:b0:21f:617a:f1b2 with SMTP id d9443c01a7336-22df5836fb5mr60927435ad.46.1746038693636;
        Wed, 30 Apr 2025 11:44:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746038693; cv=none;
        d=google.com; s=arc-20240605;
        b=bWYmTuG1Q7YFf/xFNYMLH/I20iZjqRBYP7jOzO6sUhAYxyPNkpYvmT0+VveH4eFrHC
         WUZUAAuqGnV5OqGEjnGVJvSNcaA05etFNNpOVIzJHGUft1cZGOK6+Ig2rbEv7rIKOKTv
         kT/kwI0KEet6Hym64FuBviIov2yZvVKPDw3RVH6iA2/7lgYRhrFS4LD5N51YP1u6tunK
         UUxwdVOKD8mxrpYyu5vpz1Y6HmUccvRVsB0YgqGjURubIPq6DptgKHc1/nCjQezVFPWX
         teG14FXPW1l7IAP4AMzyCGIGvTEQexxCrzDLNjTTEMmw7qJJpu4N0II31ddNElBaF9YF
         WC8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JdWqsLDjnrtyzwFMcIoY/AoiwcaSRG/i7b+cFDcrK9c=;
        fh=iCYHkQ5JfOS9BqWKQHHi3r5xQW/CgONyB9iTsXqWJiY=;
        b=Ur3m9kaxI8WlagjCWibD3frnwyHCbILWNedO1SRqb67QuzTH2CU0+GSFygEgBriipv
         LWbOPoc8oCFtoTlCIpl8MkcCd2EL8i1NXDhFs0Fje8NuoEdBjSdCpv/hWeXod7Sh7o/s
         N/qnsgLwbvjuBwIuRVf9u6+Vygv+llJUEEZzeGYl4izmdzkaLd+1p80N+8VHehgaXx6Y
         a+ceL7lLSmktqimTdIiePMmX7iImzFgCate8wHH8GSnSkRu3YAQ9LUaPAc0WvHOlPBZ/
         6+59gm/NA4tgiBi7/ySmDyQ7uMHbDMZPllqpI+PUvh3kIURWzKIEkDYdW4Q8Eq00+uhW
         xaew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MO9SliWv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db4de1b4fsor135490775ad.6.2025.04.30.11.44.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 11:44:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MO9SliWv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746038693; x=1746643493; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JdWqsLDjnrtyzwFMcIoY/AoiwcaSRG/i7b+cFDcrK9c=;
        b=MO9SliWvJF5Mi+FG7AVMkcSVfSQ1pDi/bcWW68+1eL1UVN5Ab/WFK/vEzJ/v+Bg1Sm
         mqyyosKzSwjzihKLYIVrctL72SBztg8DguNTDv0s0gHuccCxRWEnXZ+VXWJEaQFz/vX3
         XGtNdUac1Zejf7gbs7/A50OCA9C9imHGSWN7++j2RJHu04vEcllzu6hxDz79on9FmZSv
         /LzdQ3vsbcb+EXwyHrEXlUEXeh0GhAMS4hn9Mx91KRaGm/T6t3Q2+qVw2x3Ehb90Jzeb
         weAygBWFK9T+k6+aeytX8RUwxEPc6mI5+SKE+J1B99aHiG4qjKm1qwumCcyHyzZRHWoG
         4Gqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038693; x=1746643493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JdWqsLDjnrtyzwFMcIoY/AoiwcaSRG/i7b+cFDcrK9c=;
        b=XLDRHSEH2QJG3NGvFTLDSsHb5vx6GVtU900hsUqXHk+9w6jdTP/IotOtQRxlsgPmvq
         feAzts2Wfz+l7+UMZA/YCXHhfxtxuRAXCfPH/17Z+Chv/sCXxM7ejC71XHX68t9M6ydT
         aXupX+mrnZB5LNnwcIEVFbKSRS4GQsElOms+/9ZQ66Poe1utsnR+iyFe25/JDS9vaytZ
         grg8ZVPQ7a2oZb+5RWTYZDu1BVQkr6bgyxj5Qwsvv9bQjplNvKcKZ1sgzQ1eWE2ELa/m
         JdtWAhLDRpaHlmFymojwMeOly+VxLTKXai8cu+4YxKV5CeSIq504Vuw0rLRr3sypQT5U
         GY3g==
X-Forwarded-Encrypted: i=1; AJvYcCXA40N+XlylgSCIeWwvHNRDDIoZinNADCv7JuFsWG3b9BlTVKpXSUJE3/KhFqu3SIWC3Jdbx+HJSLug0g==@linaro.org
X-Gm-Message-State: AOJu0Yw6Xh6W4ENCJw8vkxqL2XKX31txWyoQVsqLn3dHzPRTbhz2EDAV
	otvGxEuhuyvOi4lGYI3uzz0dnBMc7nOLt0kfwZynL+aodXJscIsPQIqBVZmRhutWUg==
X-Gm-Gg: ASbGncvB5B2UKu0wHf+5FpSxOiSvuqiNET48b1L5Dkkc6iHfQoKrxmitSpckIb8sg6Y
	PHEJJ+igmTp25j6qIALdH6u5P2KxeNuAdwLg0jZiPH9SRi3eKGH5b1uSdRbdR3C6WMe9g31Mr2x
	LZyZSzohztIRWmtd25AsCYEcJ3nddXPaPHLS4azbLCJ6qH0a6G3G9KfS6mFJUJ++Fi4hx51UuTq
	AEOFPOpA/7fy/YoR9Ek958mbTvPm14hHNKLvsLDy7RZZ9zM0k3Uo30mRTnHd0JFx5JRo70D2j4B
	laG5Jjvc8MhUHyMscu5ScIvLwKKs/OOS3A6bJohtYp5ZZzZvyMEpD2nym5M/ZjWhOBehqIhaO8d
	U3jp8lEY=
X-Google-Smtp-Source: AGHT+IHxn1Zv7Hu1E+clIILqP1pD7IlfPAs6LU2N+d0EY9D8VKYrJPa4AMt91rvWNqyMk4G4YZ47MA==
X-Received: by 2002:a17:903:17cb:b0:224:191d:8a79 with SMTP id d9443c01a7336-22df57ab489mr60984125ad.27.1746038693185;
        Wed, 30 Apr 2025 11:44:53 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7cb2sm126245815ad.112.2025.04.30.11.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 11:44:52 -0700 (PDT)
Message-ID: <639c510f-4843-4c08-9952-83f9e781d679@linaro.org>
Date: Wed, 30 Apr 2025 11:44:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] target/arm/cpu: remove TARGET_BIG_ENDIAN
 dependency
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org, anjo@rev.ng
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
 <20250430145838.1790471-9-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250430145838.1790471-9-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Q19BdAIAyhV5

On 4/30/25 07:58, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/cpu.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 07f279fec8c..37b11e8866f 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -23,6 +23,7 @@
>   #include "qemu/timer.h"
>   #include "qemu/log.h"
>   #include "exec/page-vary.h"
> +#include "exec/tswap.h"
>   #include "target/arm/idau.h"
>   #include "qemu/module.h"
>   #include "qapi/error.h"
> @@ -1172,7 +1173,7 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
>   
>       info->endian = BFD_ENDIAN_LITTLE;
>       if (bswap_code(sctlr_b)) {
> -        info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
> +        info->endian = target_big_endian() ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
>       }
>       info->flags &= ~INSN_ARM_BE32;
>   #ifndef CONFIG_USER_ONLY
