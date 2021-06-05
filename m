Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2269478lfa;
        Sat, 5 Jun 2021 14:10:06 -0700 (PDT)
X-Received: by 2002:a63:ef04:: with SMTP id u4mr11032150pgh.429.1622927406057;
        Sat, 05 Jun 2021 14:10:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622927406; cv=none;
        d=google.com; s=arc-20160816;
        b=yOJOPSv8TGsAixqYZrB7NAL/1vu6k3L2m+qDsZ08jGqJfqZeG9eoAQ0Jtw4mLAAirj
         NdTdE6OfVcbKnF8vY6JQyuXyj+d2OPBYOdhCh+Gau/Cf0AwLWhOh++hs+eJBPU7TXf0q
         k/ST0nvZSFE4DDRk+4lcTsclBztJ6bmPC6zZL+kSVJKgVMgZ/FgSlP/asrDqsrJmvgA6
         Uyj2cHhxYNArRDFH6Bsipi43SsTUUN7tsNK8xSYniaO3vqfPtAKISBeHmdF0cyQAwuum
         gFj4bUnY/tS+XKuENWgNx4YyBAXvT+fgAbL7je3j2WzqqUsGlZPLfHdy2duWeQ+tOZd4
         FRRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=DV6Erc8PED0Jd4lSzka68vrGoU7Y5MzE624El6lRw6Y=;
        b=r2P6PwrF3n4AyUE7avxq8kQrqjmHxTw8e0UjBI5iil9pKX0xsKUa0HurZOyYmksxhV
         NnEMENL+iSBFnyFZwteeiMKAKe8ljIHHAUht4aKkNTa7Zo+eHXfcI6689f5xd3jEFEPJ
         5zErLW8qg0+Jq5mrfvL6F/0Y5mpDjsK4h6EDBGpqRGD5VSNuj+O2dbRUELFx23MoEoOH
         z845vowjgfxh7lKH+ioSvVvCaRnGJl/o7vuBEh5ERhodh//rM7Hp++w/CfxlpMG5HsOf
         O8162PLZ8tkkngQsQJ6X4IJZIMrnnJrVvLuqpXx8aM1RYEomCgSDBq2UapJFGwoQ6Bpb
         /BpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QJybwDgH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y63sor3066402pgb.80.2021.06.05.14.10.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 14:10:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QJybwDgH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DV6Erc8PED0Jd4lSzka68vrGoU7Y5MzE624El6lRw6Y=;
        b=QJybwDgH4zuqyEoErQAcVfYe+LBb8Wg2knXXYhLADUUmjGjD3SFL8kRw8qukaOBPqQ
         azwR6jSUFEeRrhYDvF3TcV4gw5CXtmhDa/NRkMkw0NTzxVfsk8NUYFk68Y89zRIqUjxV
         qp91mfYVgNiJcy26NEbF2nTOcIp+TnSLKOXPfpiGgeXiWv8OZi261ckRHYydw/lUuz14
         dhD368lhQmy6q4Q8mHthEoMBk6+FqxsBKIPc1zVlFsmx5u+9eCj5xstkZ7rBceR169y5
         N5DVIqgqORwHuOJYJTNnOWDFJc22eu2drinkC0q9N+tjztICEBsqqIPsqLEmfDGw+iyN
         hdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DV6Erc8PED0Jd4lSzka68vrGoU7Y5MzE624El6lRw6Y=;
        b=iVXgXKE3PUFQgKarAWqVC2UXPSI34BkuPwm3Jw+fi1T500M2ydpnHrZyA3oNJWCkwy
         qOX5PatzyY3yEnSmkw4clWMI+od4USDsCo+844sWcaiarHkPPZK/O9Ud4HMa1hbShcsq
         dNxiVI6zaqajAtZ8ygloFoyCAQlYL4kXzHYtoe5yvFue/6z5J6608sJAu09GSsUgv7LP
         fGUSxB6jllBwyevTdPSiJ1jvH25wzEOLq/7UCp9F/UgAz3vgNHY35fYUGFQ9bAYVqS8E
         Lt3FRaDPA+AtWEum9+UBWnrrR4CLzYYrMs7OhEECsS4NcwbOo+GusqI/tThejfZuNnr3
         TfLA==
X-Gm-Message-State: AOAM532IZDUMKShY3e3hd+tk+onFBeZPJLplfgO6pEnddoRzBv3HGVEw
	A1yUR3MufFR2VkFPJ+B2IRGBlcqo
X-Google-Smtp-Source: ABdhPJw5YXonkD+YzR0UIGOTHzc7zTqNBMjJU7eUR1rdtLiQVu8WOXGNk828y08CmdpPqfITDWG96A==
X-Received: by 2002:a63:bf0d:: with SMTP id v13mr11169018pgf.303.1622927405492;
        Sat, 05 Jun 2021 14:10:05 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id k1sm4560865pfa.30.2021.06.05.14.10.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 14:10:05 -0700 (PDT)
Subject: Re: [PATCH v16 80/99] target/arm: tcg-sve: import narrow_vq and
 change_el functions
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Laurent Vivier <laurent@vivier.eu>, Peter Maydell <peter.maydell@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-81-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <484b0d7d-69e2-9a83-d431-4887615723a1@linaro.org>
Date: Sat, 5 Jun 2021 14:10:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-81-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: WytvIVMv5k+X

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> aarch64_sve_narrow_vq and aarch64_sve_change_el are SVE-related
> functions only used for TCG, so we can put them in the
> tcg-sve.c module.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/cpu.h                 |  7 ---
>   target/arm/tcg/tcg-sve.h         |  5 ++
>   linux-user/syscall.c             |  4 ++
>   target/arm/cpu-exceptions-aa64.c |  1 +
>   target/arm/tcg/cpregs.c          |  4 ++
>   target/arm/tcg/helper-a64.c      |  1 +
>   target/arm/tcg/helper.c          | 87 --------------------------------
>   target/arm/tcg/tcg-sve.c         | 86 +++++++++++++++++++++++++++++++
>   8 files changed, 101 insertions(+), 94 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 8614948543..3edf8bb4ec 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1056,9 +1056,6 @@ int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
>   #ifdef TARGET_AARCH64
>   int aarch64_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>   int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> -void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
> -void aarch64_sve_change_el(CPUARMState *env, int old_el,
> -                           int new_el, bool el0_a64);
>   
>   static inline bool is_a64(CPUARMState *env)
>   {
> @@ -1090,10 +1087,6 @@ static inline uint64_t *sve_bswap64(uint64_t *dst, uint64_t *src, int nr)
>   }
>   
>   #else
> -static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
> -static inline void aarch64_sve_change_el(CPUARMState *env, int o,
> -                                         int n, bool a)
> -{ }
>   
>   #define is_a64(env) ((void)env, false)
>   
> diff --git a/target/arm/tcg/tcg-sve.h b/target/arm/tcg/tcg-sve.h
> index 4bed809b9a..5855bb4289 100644
> --- a/target/arm/tcg/tcg-sve.h
> +++ b/target/arm/tcg/tcg-sve.h
> @@ -21,4 +21,9 @@ uint32_t tcg_sve_disable_lens(unsigned long *sve_vq_map,
>   bool tcg_sve_validate_lens(unsigned long *sve_vq_map, uint32_t max_vq,
>                              Error **errp);
>   
> +void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
> +
> +void aarch64_sve_change_el(CPUARMState *env, int old_el,
> +                           int new_el, bool el0_a64);
> +
>   #endif /* TCG_SVE_H */
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index c9f812091c..db4b7b1e46 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -134,6 +134,10 @@
>   #include "fd-trans.h"
>   #include "tcg/tcg.h"
>   
> +#ifdef TARGET_AARCH64
> +#include "tcg/tcg-sve.h"
> +#endif /* TARGET_AARCH64 */
> +
>   #ifndef CLONE_IO
>   #define CLONE_IO                0x80000000      /* Clone io context */
>   #endif
> diff --git a/target/arm/cpu-exceptions-aa64.c b/target/arm/cpu-exceptions-aa64.c
> index 7daaba0426..adaf3bab17 100644
> --- a/target/arm/cpu-exceptions-aa64.c
> +++ b/target/arm/cpu-exceptions-aa64.c
> @@ -21,6 +21,7 @@
>   #include "qemu/osdep.h"
>   #include "qemu/log.h"
>   #include "cpu.h"
> +#include "tcg/tcg-sve.h"
>   #include "internals.h"
>   #include "sysemu/tcg.h"

Ok, sure.

>   
> diff --git a/target/arm/tcg/cpregs.c b/target/arm/tcg/cpregs.c
> index 56d56f7f81..9d3c9ae841 100644
> --- a/target/arm/tcg/cpregs.c
> +++ b/target/arm/tcg/cpregs.c
> @@ -16,6 +16,10 @@
>   #include "cpu-mmu.h"
>   #include "cpregs.h"
>   
> +#ifdef TARGET_AARCH64
> +#include "tcg/tcg-sve.h"
> +#endif /* TARGET_AARCH64 */

Don't like the ifdef here.  If in the previous patch we had moved zcr to 
cpregs-a64.c, it certainly wouldn't be required.

> diff --git a/target/arm/tcg/tcg-sve.c b/target/arm/tcg/tcg-sve.c
> index 99cfde1f41..908d2c2f2c 100644
> --- a/target/arm/tcg/tcg-sve.c
> +++ b/target/arm/tcg/tcg-sve.c
> @@ -24,6 +24,7 @@
>   #include "sysemu/tcg.h"
>   #include "cpu-sve.h"
>   #include "tcg-sve.h"
> +#include "cpu-exceptions-aa64.h"

Unnecessary.


r~
