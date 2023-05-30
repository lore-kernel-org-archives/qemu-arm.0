Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2202676ejb;
        Tue, 30 May 2023 07:08:26 -0700 (PDT)
X-Received: by 2002:a5d:470b:0:b0:306:2b40:1258 with SMTP id y11-20020a5d470b000000b003062b401258mr1573934wrq.21.1685455706699;
        Tue, 30 May 2023 07:08:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685455706; cv=none;
        d=google.com; s=arc-20160816;
        b=Z5FyRh0OoWqRfDV7Zsep8SjZPYaO1S0sTP0XvvUmp+DkNiCVzGRCKtkJG7GzS7brJK
         uABFEMK0yb/MrNXw/lXZIgX8vlfzYgWNuEUO9Y8WxJzMiVPlMl8EUGHNtjO1FiraHeEz
         vjzlHI/guZY4PdQoqXmBFw2ZLPSFeY7Hq8qQclehtn4wc5SFSKfbVkvSlEZ+ZWt5L3Rh
         32mk9wRbo1Lkc1SoIBSKV+KQcwMSkIukUKnoJ58XoGAc0QoSAvMHECWEqBCHK/pccjmI
         tdzqFAWZ3OnppSJ0DQk4djZqTCCcbZw2QAfJhyTg2pkYDdHhKk/UG+15hd/lQmMo/4uT
         2EbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=c6HkpIykue4z315sGe067YeidNKQP5gS5byB5c6QgE4=;
        b=ZRPgROpKeJ826+X3RTt7M7CRw+OHQqP4fDrb56IcSkacfsJHyuu6yar+BmqLbyGero
         pFC88DYiBKDatooZ70w71HR8MAK5RM9TjlQLhjk0voVvloFQeQAOiF9SVacktlg8uNY/
         CtXiu0u/MT6brNsni4MgW+JEmPYya0CFG9bzj1rW23QQkVdAarPl2ruOUSRSB24p6ZLr
         l13S7M30Y5ceLEI3zd/3qFtTif0O23a8/E57wLA3mdAgYSIlIFvNM3Xo0VXKhnN86Qf5
         /sKKEg1rlPNfIho3sfEpaZMbEaoZHYpRvFVTOgxpUhF7zPlkga57qsj6hMTKJOC7Azbc
         kxrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i3h6CEhi;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bq24-20020a5d5a18000000b0030ae35f5ed7sor856692wrb.4.2023.05.30.07.08.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 30 May 2023 07:08:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i3h6CEhi;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685455706; x=1688047706;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c6HkpIykue4z315sGe067YeidNKQP5gS5byB5c6QgE4=;
        b=i3h6CEhiSWh+Cp0xHlohdJyQeaiKFVgeYsputGtLjNRg1xH2HD9MFvJuuSZlo1VCK6
         DYj0ALLc9XHLOv0lHQ95xWJ4U63jvo2z/1+AuLMiQgSzsHdDfkJpWWpffJfhJchZT5bN
         GZH9twe7sLIRF2AorqfIDi6CoQuWFWAwxq7K5jJLmbS0mbHf49Xjgod8/jlTGI9eSHnA
         XIE15V6O+IYrtPTpTXyqOhNS+gDmq26YXG+uUxqHKJM4yYNuTgsyLJIhkNYsT3g79FPQ
         mH6T2bPKle9sMTtOm3f8/6/dwfEwUSd9cZZOI7Iezcy4Wb3MleZ+BaFSu0+jSO5uQ9YQ
         CNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685455706; x=1688047706;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c6HkpIykue4z315sGe067YeidNKQP5gS5byB5c6QgE4=;
        b=XD1Qsjr3vKve/ULkPI6f8e22avvxOiMMNUs9DfwTaqwnToPVOwjhlh4Wav+NXMjKD8
         2VUC4/VUz/xTA8kjUvtJxWOF8MysLoS4eEeOKKl+tX/VPGRL7GKb3jXVu769Z5jSwWvV
         GmDrGdFCGAtfh65wsmcIiABHWgyThI1HJnrMiXzIaMDJJ5p+xjJZ6Nnh6D+odoefSu6P
         fXafbquWjB2y3iPSGr1kb/mEFwnkgB9K8AuZfwW4vkrDDBrBjuQFDrbvMDvwCqPRliM8
         fY0HRCDZmhCv+daFb737yiDX/CtKYfTHdDySd/ujXtWwxS1feLzQ0e7aWpIWqOplncpn
         /q/w==
X-Gm-Message-State: AC+VfDxUznRFqhxHePeapXdyTt3fa6vzxjfFBacLWhb3Yoni89A0q1bc
	6t8TgFV+klL98WncYw3A8CmrTajGDhA6dui+8Ahvy9Nr
X-Google-Smtp-Source: ACHHUZ5LLDC8WZcnZA7W6MZ9AM25TzwXhXTeEBs3wK1bCB6wtveW6gd9AmUHS8nyMSh0j1A4zSutsg==
X-Received: by 2002:a05:6000:136f:b0:309:4e85:897e with SMTP id q15-20020a056000136f00b003094e85897emr1598771wrz.17.1685455706324;
        Tue, 30 May 2023 07:08:26 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.176.180.1])
        by smtp.gmail.com with ESMTPSA id c3-20020a05600c0ac300b003f50e88ffc1sm21328712wmr.0.2023.05.30.07.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 07:08:25 -0700 (PDT)
Message-ID: <61d22bb4-96de-c49f-525d-a236cacf564d@linaro.org>
Date: Tue, 30 May 2023 16:08:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [RFC PATCH] target/arm: use x86 intrinsics to implement AES
 instructions
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20230530135204.2903761-1-ardb@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230530135204.2903761-1-ardb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: jeg2jiZhSNpa

Hi Ard,

On 30/5/23 15:52, Ard Biesheuvel wrote:
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

Per the recent cpuinfo API added in commit 6bc12fd042, I suppose
we should add CPUINFO_AES to host/include/i386/host/cpuinfo.h.
