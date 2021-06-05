Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2279924lfa;
        Sat, 5 Jun 2021 14:37:56 -0700 (PDT)
X-Received: by 2002:a17:90b:803:: with SMTP id bk3mr23822237pjb.224.1622929076075;
        Sat, 05 Jun 2021 14:37:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622929076; cv=none;
        d=google.com; s=arc-20160816;
        b=GUDNvPmRTHd43tt0nf9SxyVCLSwvBosj+rVWlzYlTkpgez8msYeTKSaPf4UDx2/8zs
         1BCNmgRkJA3lseuXKQnxsfQGDfyWExom/JVoQ/ypfzTV+LXVnkuO/iXvKLsSSgft9UgJ
         HaS6i8UDYbSshXW/kT4SxBfnpLd/6+AlQIWhIPCIJfLJRQcCv7GyruLDisrzjJuizS+7
         jBkUWRj5Vdn65FAS2tw5MWdOWTwLbdmfx71r7zuDrRk5UMkAeTbrOkhDuX76nxt7v+Ei
         wet/vY7OwsJbkyr/UFN0VnbaQW7fw8BARIpK0ThNFIX4YDXGBuQPQ1urZPvp1ha3X3xS
         hUcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=sNN2OkMhqKUqiMmhybJw47GbbvMAVw+88Q2gc/Kf5Ko=;
        b=ixHLSTBy2M4/mxp/RjaPd8t8ZYj9ho3aAYafFFX6KCpJMDs97h8h+53xef4PQr06h8
         aK7YSxzWqfxJ4d1GlyGEjC8KcuGtPvrf7ifvj7uUG4qjPfsgGKrmyOYgIUYeg3Z8zuui
         5m2BLhf4txLm39sG1WvLvB8jKvvbbSJhvANZJsG9VEh/kIMI0WAiJE49v1aytSzKUWDj
         JLpZjvZKrpJevp5sgJsRkZI7T1NjIMYVzkYWX2KnZthGBvuxJ9ik4bCqPQhikWqieoKx
         iaUyNfR7SrHc1kT2ihvqKT+osJDnQzJTsEsnCqXRzTPl/ZLG4LNX+hkF2me45npkHVAn
         Pckg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M9F68V2b;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x3sor5631838pjl.5.2021.06.05.14.37.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 14:37:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M9F68V2b;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sNN2OkMhqKUqiMmhybJw47GbbvMAVw+88Q2gc/Kf5Ko=;
        b=M9F68V2buCDF5bO9vjdGYbXYFrqShD5nCD+0tpnk8Bb3YWuuTiGhQ4Kx/xSiDINp10
         2tXWC/wMXTIgY43W8HnmP7MMUAO9/yj6Pp1VLBEBaEi5gOWAwULpivO9g90SL2nCQtzW
         KRwabM23+ZF0K+dhcODMuuJF1Uu27Rl9gC1Dniyw20KJIYcDZtBwJG/fiwQ9BeBRhYiV
         n7Nl2HbkQhs+s4Ces6O6zdkXyJGKi0874sXtsMc0dU1D41Z5w0qcxCg2SxXQ8UaICldb
         f+VN6tzQYYMWCVaCz0Wk9xPBFYgK0DdiPrgdQua8GT5XS0yV8FPGY9+9/PncYWm/O+wJ
         SorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sNN2OkMhqKUqiMmhybJw47GbbvMAVw+88Q2gc/Kf5Ko=;
        b=ECxwLMihxWgv/hA8x1bpWI24neJ9RT8BdwKxJfQLirwdTBsZOMbp4DociSwxZnkNr0
         Zgv+aVQ6v8luFIcp1NfKAl20GmDR9cj9mfNJt6YeLKJWfTjFQP8whohXKe7v9woBxYSL
         bIjDuUmKA0teRZvWI12oJ2jqhniUP43tVgpB23Z97UmsFQDghrv9AF8vOAYyxBd1vMYp
         lVfY1DIedpRvCjng4X1X+xBAZS0jL68rRvdcfahVvrUrURiduNrfqAttujx5409yRTgA
         puyOo6S9Ze7xfTOwOWshete3uQvSzQ1BOuLk0pFq1affz1Za0KuxF6rJe+ftIkWWpqp+
         jf1g==
X-Gm-Message-State: AOAM531BD+GlEzeuIZf8J2S/5Cy+cChPRILvazEewwgN35BSTja767+f
	ua799HaLXdt1xCxkVqH/95eZvb0FjTMm1N1s
X-Google-Smtp-Source: ABdhPJzbj6kAFRP9SeAlMKMiZ8sS9kMPrfPJebriVoB15e9B2JSv+Iv6C7fQVckBy9ash7mD9H+5iA==
X-Received: by 2002:a17:90a:f0d5:: with SMTP id fa21mr12445921pjb.4.1622929075558;
        Sat, 05 Jun 2021 14:37:55 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id v11sm4725951pfm.143.2021.06.05.14.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 14:37:55 -0700 (PDT)
Subject: Re: [PATCH v16 82/99] target/arm: move sve_zcr_len_for_el to
 TARGET_AARCH64-only cpu-sve
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-83-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4cae0f86-d7a8-7c0e-c2a6-442b49f25dfc@linaro.org>
Date: Sat, 5 Jun 2021 14:37:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-83-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: XwUftDDJtSP1

On 6/4/21 8:52 AM, Alex Bennée wrote:
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 3edf8bb4ec..e9bfb6f575 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -223,7 +223,8 @@ typedef struct ARMPACKey {
>   } ARMPACKey;
>   #else
>   static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
> -#endif
> +
> +#endif /* TARGET_AARCH64 */
>   
>   /* See the commentary above the TBFLAG field definitions.  */
>   typedef struct CPUARMTBFlags {

Unrelated change.

> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index b297d0e6aa..0e41854b92 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -23,7 +23,11 @@
>   #include "target/arm/idau.h"
>   #include "qapi/error.h"
>   #include "cpu.h"
> +
> +#ifdef TARGET_AARCH64
>   #include "cpu-sve.h"
> +#endif /* TARGET_AARCH64 */
> +

Unrelated change and unnecessary.

> diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
> index edc4b4cb4e..984dae7643 100644
> --- a/target/arm/tcg/helper.c
> +++ b/target/arm/tcg/helper.c
> @@ -18,6 +18,10 @@
>   #include "cpregs.h"
>   #include "tcg-cpu.h"
>   
> +#ifdef TARGET_AARCH64
> +#include "cpu-sve.h"
> +#endif /* TARGET_AARCH64 */

Are the ifdefs really necessary?

r~
