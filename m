Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2230243ejb;
        Tue, 30 May 2023 07:48:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:21ca:b0:64e:bce9:3229 with SMTP id t10-20020a056a0021ca00b0064ebce93229mr2800440pfj.9.1685458135972;
        Tue, 30 May 2023 07:48:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685458135; cv=none;
        d=google.com; s=arc-20160816;
        b=Gu0AJdC/9jypHdS8UTtGy6HaVRCQq7wWlyopzYC6SXt02vCxj/KiO/lXY3LNY8j0lJ
         Vlw3JvWu1bvXjc7bywitLz/eiod9q9Vy2G5QTTxOG5ZVaJaOwfYQrv7DiAtEACHJe7HH
         pmJbI2npZSu4W7vNHzuwvKeyn3Ry3ZN/NmoqNQPJK8ykzjdXqgpCDHlPy9EB9SA3quOX
         MH+mNx1wlBCrnod1QIj4r68+rW6lBncb/cjAp/EgXTxSniSVIrmLgAFOyzJ4ZgoUiR5r
         AEm/ch3vJkMFEBCr8L/5iAOzW2SEDkWSwvWPUaNC4YZa7WnN5nPOMeyDVHGIgOuz6GVI
         TcqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/mRotw+iSAUVrUeFod2O6JDCzdceQwIv5HTL8rc+bKk=;
        b=N1gKcXEVhHkQotbaUd/EF1RmrasJmHXByptdh1xBgxDgwqzXc/DF4NzG0UJiU2Hz94
         wxmaqzvWPfNSnnFvkbFFcgqJZUM4gI25i7Z+g0/NxjC8lZzer1pxjyTQ7v4ZybX4Afo3
         oDr1+eDqbv+r9fhxXt1ZWF014fol4a3cWTWSWI3sNKCyG3Hfbade4POAa0TavLQhyf9P
         C/Gb8fsqKSbT15HQiwE1HLssBGBgUkpsGHe6lJx6pOkSP+5E9P6YHHjXilcz8aXls4p2
         uxGek/iX37kQVHmE1vdB1jBOSQbH9JacqOLy9IFO5aV3g1Y3WQo3mDLl+Go0aEBQ/Ex+
         7lJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zA28jFvu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k6-20020a628406000000b006410a66b6d6sor1874891pfd.1.2023.05.30.07.48.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 30 May 2023 07:48:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zA28jFvu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685458135; x=1688050135;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/mRotw+iSAUVrUeFod2O6JDCzdceQwIv5HTL8rc+bKk=;
        b=zA28jFvu3gU/sDQZjNw9sMAUfvHHjlM9OSzCjN+BmK2NEnI8wmRJJLuplOaTEXVG0P
         6GWeYg8DPMscBeUW2D1ipfQY5g2MDkg5IJCy3kVbh0PTRFpRbALSYE4rMZboliXdQGbK
         IPZtpuhcPTXPWTjvM+qsYzqvbN684fPrunaY9nCRlIf4Nw+OS+SmiglkVKtrSQ91MuPX
         1+CghCn3C118vmbqcrwAP0x2rUXiG6OcrCuYyC4YR6b8yManb5puDH31YwaIBMBrAFf0
         I7wT0r3hEQVbJCo5mgC2xwOQtqHHTaIVEbVtrGR+Q4NDzi52Wyav0irec47tw+2WPUDM
         L2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685458135; x=1688050135;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/mRotw+iSAUVrUeFod2O6JDCzdceQwIv5HTL8rc+bKk=;
        b=i2iLhnGVkuCwXH5vMoul16Pfek3GcS5gkXxQ6tgZ6mqQLC0XLEklq+WzJzHmRlh//K
         UGymkDwmoj4sRpzcO6x1Kv7yNxkTdOUaKAzYIloMc82q5mohukg9OebXnBmavunQiIgF
         p9+3t1YYcuvi7Q5mClgDfUjnzz/Fev0CVqhnwzJwEoIuUUcNBkOVslh6fuMe30f9yvSM
         Nf7jF5UuU3jJOCg5qhiO3C+MD+6h48+6ODwz4LwELLlC/A8cLVTTvDL1sWiKbcDuSBrI
         p3tZnzSt8uJzWArrqi4VnlRzYTDLAguaGx+ZD1VpPg4PAN/UR+I68nFhdGv+g2WtpFyo
         dQHA==
X-Gm-Message-State: AC+VfDxRnpLDIl3wDOnGF4O03QccRnmUs12fE3Siwqwo08wNfQeK0XSP
	cf1ZzuIay3w24cEu4l6EibAMIPPb
X-Google-Smtp-Source: ACHHUZ6UFYshVBEpFlDiULXPoDQFGHGHQRNLicj152ZIxlhVGC/4BntXzMpwTvN0CjjJ0WLKZszvcg==
X-Received: by 2002:a17:902:d4c3:b0:1ae:35ba:8c8f with SMTP id o3-20020a170902d4c300b001ae35ba8c8fmr3007356plg.13.1685458135474;
        Tue, 30 May 2023 07:48:55 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1598:4c01:35a2:c45d:7485:f488? ([2602:ae:1598:4c01:35a2:c45d:7485:f488])
        by smtp.gmail.com with ESMTPSA id iw20-20020a170903045400b001b03b7f8adfsm4983013plb.246.2023.05.30.07.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 07:48:55 -0700 (PDT)
Message-ID: <d753128d-d334-e701-a7a2-33c50048e4fb@linaro.org>
Date: Tue, 30 May 2023 07:48:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH] target/arm: use x86 intrinsics to implement AES
 instructions
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20230530135204.2903761-1-ardb@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230530135204.2903761-1-ardb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: r+JKce71VM3s

On 5/30/23 06:52, Ard Biesheuvel wrote:
> ARM intrinsics for AES deviate from the x86 ones in the way they cover
> the different stages of each round, and so mapping one to the other is
> not entirely straight-forward. However, with a bit of care, we can still
> use the x86 ones to emulate the ARM ones, which makes them constant time
> (which is an important property in crypto) and substantially more
> efficient.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Alex Bennée <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
> Suggestions welcome on how to make this more generic across targets and
> compilers etc.
> 
>   target/arm/tcg/crypto_helper.c | 43 ++++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
> index d28690321f..961112b6bd 100644
> --- a/target/arm/tcg/crypto_helper.c
> +++ b/target/arm/tcg/crypto_helper.c
> @@ -18,10 +18,32 @@
>   #include "crypto/sm4.h"
>   #include "vec_internal.h"
>   
> +#ifdef __x86_64
> +#pragma GCC target ("aes")

This doesn't work with clang.

What does work is __attribute__((__target__("aes"))), which requires that you pull those 
little code blocks out to separate functions to be annotated.  I believe they'll be 
inlined afterward, but not really relevant for your improvement.


> +#include <cpuid.h>
> +#include <wmmintrin.h>
> +
> +static bool have_aes(void)
> +{
> +    static int cpuid_have_aes = -1;
> +
> +    if (cpuid_have_aes == -1) {
> +        unsigned int eax, ebx, ecx, edx;
> +        int ret = __get_cpuid(0x1, &eax, &ebx, &ecx, &edx);
> +
> +        cpuid_have_aes = ret && (ecx & bit_AES);
> +    }
> +    return cpuid_have_aes > 0;
> +}
> +#endif

See "host/include/i386/host/cpuinfo.h" and "util/cpuinfo-i386.c".

I'll have a closer look at the other AES uses to see what might be sharable.


r~
