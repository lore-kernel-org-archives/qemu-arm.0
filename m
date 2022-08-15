Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1396072ejf;
        Mon, 15 Aug 2022 13:26:59 -0700 (PDT)
X-Received: by 2002:a37:c4c:0:b0:6bb:4ec0:b463 with SMTP id 73-20020a370c4c000000b006bb4ec0b463mr2456047qkm.666.1660595219723;
        Mon, 15 Aug 2022 13:26:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660595219; cv=none;
        d=google.com; s=arc-20160816;
        b=enPsiNxO66xzciCWQTMzGBruu0NtRuB1kclwMhSUE1mevw+kAwkvPJJ+DJlmorW7+0
         WjWWob+NXHkEmtcVS/F+wjVrTiERljLqGOkiveLMS2obOcdWiSzj1ydvor6nJU/T79X+
         SlyA/ub2b2ikl5tWziw+AGR0Q5Uyvp90vfjrbHyuNVqftNcCkbCMaP+SzRO8UBvlUz5x
         Gu2PIaveP4MxrftdJwLDfrifnyoL2QC8hmOMiP35LAjF7U9D2nmLXdaPYaIS9d88U5zD
         qb9j2Yx4JQYG4MRwSHmnynNMweJD45tI+AJ7su6m6RIA7rojlVf/c6Oz3V/D/FSJX9u6
         3/EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7kvCSjUGbtTiTEBzCyfkVe/cnxqgIrI2gkhLBAH80cE=;
        b=DhHWa5O0KV3zTpUAMPBBv9cTEz7UxulJk3wpkM7zTAeepdIlyTgpxEi9dm1x2uCmWj
         NuRCXdcd5vpW/1Ws2MOaaOAIYQhnPsoyM1sKI/lxpdWQ+jrgKl3IFsILFNZIxnXXu5UW
         qIBRRTVhNXk0zx1vJWitfURC5kotLInrDdfl/+ngPUgat/xTJ58VnfYD0TjgqYeGCDQh
         DLHxNfvxYQ1nFARzKrPgWNH2ghxOBy01JK8QEbW0nZhzTHSoX5xvcFGimPLk0VTrz7mi
         9D7qYFtX+LnKVmIGjyOyHfCZyL9buICzutCpCftap8x0mECTaEmvBi3Rzw+YM+eQy+F/
         8Dcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IX3afyZr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m17-20020ac86891000000b0034454b5ace3sor4268195qtq.21.2022.08.15.13.26.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Aug 2022 13:26:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IX3afyZr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=7kvCSjUGbtTiTEBzCyfkVe/cnxqgIrI2gkhLBAH80cE=;
        b=IX3afyZr6GMYKFotwlsFribmqXeF+YEQEjfChL5dzLFu5/TuBVUr0tXmm+nyY5hr16
         /PscQe46oZj0GS4+Q0Fd1JVRxwgLYwQgpz/8a1HDrtGkqwnTYfIqK0CyNnyvwjqNEbL/
         /6g2SGth2y6afnDduU6ticJ0PClb3o/JJLZqPxUMTYT55sdG+t0yc0WrhOW3xQXiQ/Az
         wgQ3WPgsKYSYyI5eCm36ziimSi8hDjzmZYDFBTS508bF5Pnjke1rVl4JJM2Ahfxxmoyw
         +c8YV0X+zGmXqL6U+8LuIoJbutTgisy0Mdnd6Q0HnOsIcwjiV174phSfhCxr2EfHxgAC
         xmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=7kvCSjUGbtTiTEBzCyfkVe/cnxqgIrI2gkhLBAH80cE=;
        b=a24ZQdMmsPAbXQaw0xqZ8NEqwDgEbLzPNviYcNZ8BHclqUcOTwjwI3sUTEjbgP+//L
         nO8cmVInbP9KiGBdHJPrxg0yTnqwbOveEtgRhQ0QA/snSLXTi0di39C3VBdqUQEggmMZ
         +RLYPwmt1/I1nIap9bKOJuZXwxcoOgaCypkoesvTfXdzYaVKS/Dio8leGBtpsdErjjN2
         NMq//xVuOXtbwQ4I8edI1B6n4E/aIT4i4oY/Nhs2KWyfLgsR8CrhgkhMLpD+K2W1mRHh
         +eG+rcVUOToYbE84oArgGINDCBEtuQ0FpMDf+6SdNcMIjhKyElzSaGhb0ZtPDb9D2i6q
         nVLw==
X-Gm-Message-State: ACgBeo25HmSi/DcKlT+UDHNQnfI84IFJarsMdiLzzZYEn5G3stCU6je3
	JjF5JKx8GE1GGdAu3r4ttnJTqn7wxjP6NVoR
X-Google-Smtp-Source: AA6agR4imi8S6bmmh3CWG/Q12I+YZIJaNpTGmLDBUea6LH/R7qo/8etEMthUPrYeC1qRoWObvcbpfQ==
X-Received: by 2002:ac8:5ad1:0:b0:343:5e13:795d with SMTP id d17-20020ac85ad1000000b003435e13795dmr15694290qtd.625.1660595219306;
        Mon, 15 Aug 2022 13:26:59 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.125.227] (173-11-255-51-houston.txt.hfc.comcastbusiness.net. [173.11.255.51])
        by smtp.gmail.com with ESMTPSA id a8-20020ac86108000000b003435bb7fe9csm8443384qtm.78.2022.08.15.13.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 13:26:58 -0700 (PDT)
Message-ID: <08d41c28-728a-0ef2-c528-b55c4984ca2b@linaro.org>
Date: Mon, 15 Aug 2022 15:26:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 7/7] target/riscv: Honour -semihosting-config userspace=on
 and enable=on
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Furquan Shaikh <furquan@rivosinc.com>
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
 <20220815190303.2061559-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220815190303.2061559-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 8vGDjIWubC2p

On 8/15/22 14:03, Peter Maydell wrote:
> The riscv target incorrectly enabled semihosting always, whether the
> user asked for it or not.  Call semihosting_enabled() passing the
> correct value to the is_userspace argument, which fixes this and also
> handles the userspace=on argument.
> 
> Note that this is a behaviour change: we used to default to
> semihosting being enabled, and now the user must pass
> "-semihosting-config enable=on" if they want it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/riscv/cpu_helper.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 59b3680b1b2..49c4ea98ac9 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -24,6 +24,7 @@
>   #include "exec/exec-all.h"
>   #include "tcg/tcg-op.h"
>   #include "trace.h"
> +#include "semihosting/semihost.h"
>   #include "semihosting/common-semi.h"
>   
>   int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
> @@ -1342,7 +1343,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>       target_ulong mtval2 = 0;
>   
>       if  (cause == RISCV_EXCP_SEMIHOST) {
> -        if (env->priv >= PRV_S) {
> +        if (semihosting_enabled(env->priv < PRV_S)) {
>               do_common_semihosting(cs);
>               env->pc += 4;
>               return;

I think this should be done in translate.  We should not have the overhead of checking the 
three insn sequence around ebreak unless semihosting is enabled.  Note that ctx->mem_idx 
== env->priv, per cpu_mem_index().


r~
