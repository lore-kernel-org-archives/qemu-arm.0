Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2291139lfa;
        Sat, 5 Jun 2021 15:06:53 -0700 (PDT)
X-Received: by 2002:a17:902:c408:b029:10e:89a5:7646 with SMTP id k8-20020a170902c408b029010e89a57646mr10751194plk.58.1622930813176;
        Sat, 05 Jun 2021 15:06:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622930813; cv=none;
        d=google.com; s=arc-20160816;
        b=muakddOIg5l6QLFIxdua5zjTZ7zohZ62ucmf9Rnkdr/9a5+ktTQFl0LvvHIxho552Y
         C6ZseYx8YcnH7+B5RymdFKRRmkG/4HTUl2Q58cE50vcu7mNM84Yn5r2xIPg6eZAdv12O
         PmNvA+dwAJOx0FoH7YRQ1h8oXdjEj9cq+9qc/rA/HiML2/zYn+b6onxbgUQyTcIB/ziv
         ZJuZp3Qa4b9CqR30EYMlo0dFtMh0RTeIsxnnaB+dsAsBZdYi1zaKWwtYNRDoJISOj64d
         aY9l/FNlCzS1WR3t32MMppMpW8m7FKfJcjJ9k12rFUPNpBXsbUq6/Hu3vxvRKCKlUof4
         SPnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=D1vHC4nOOZSv8wDXciCt+GBKfzoZEb5SkLvyQVsgHRs=;
        b=IoxoGnqgNSiFRVfqz6nZn/VFllSn9eCG6d/gAhleUyKyRK25UkQ9YeE/IkMEvcw7mj
         8ZvZPzlrat79gTLDtIv0j9DteGrRUVYZZ1ETeolrqpOzcFv3oEToChuJSoMW09eEL10E
         G0g0h4JEoyAQj51iodZm07fCxlewMCTwt78x7YfpFiFEOI/WvNMKLiaGPKJ8P2aK1B0Y
         yAdQXEVz9J1fiVhoBvaK141q+fA1bPHR/6ZCMOUJYp8TCytSR/TY3re5yNzGt1Ioexko
         Pc+flxQoURf8hXuyyo4mmVWS9FfLPORTgtYGDd3sLNF+kZFKORa0ZLhnXv5JV7gqAiB5
         z7xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L56W9p5a;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 9sor5727232plb.12.2021.06.05.15.06.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 15:06:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L56W9p5a;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=D1vHC4nOOZSv8wDXciCt+GBKfzoZEb5SkLvyQVsgHRs=;
        b=L56W9p5aM5g/eaqT7vUq4+lnEdhWIPs9lKf82VCZRsQKY4ZVIQkWo41nsWtpFWjm9r
         hMnNBkcoAcUzj89+3FvIr78VfsCHd8C1RY2xAN3+Plv70dGzcNKsmyB1riw6MbFegLMk
         i27TzdROneeyHuPLz0eTyjKbYxcdezcakGx3MfVtrztWYvCwb/G2qnx9lvWKKzjMyTLz
         6OOUs+LXadL+XfVhqZjz9sjZMTdvziZW2WjsmZFnmwSirWj28RZI1SNzJJnm3NHrofkA
         PeDg3gCmqensD0fHbk+8HOGnbbSp8BKUpfy1ZoCwXUak3GSk0aTMw7/MNIRQv6hAeBAJ
         BTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D1vHC4nOOZSv8wDXciCt+GBKfzoZEb5SkLvyQVsgHRs=;
        b=jsr9Fcx2UIAorFYlqmhqhnQjdfJ6VbimsPI7x0Tbv0IsTpBZT8/mjf6WmEB1rigO4n
         E7WWeNHjaa1rWokrdPb6fMLpmdWhGyUvXInxTjHRQQ4ZRGj69VEFqxt0znuGcSW0K86W
         ifqx+3DMqro+CFNjtEcNe3SGtHSb7G9vRZd37ETlzSFQPWDzZqFB16jDBflUxqX+Wluv
         kU6BrNxIJ5ckJpTZa9L1WY4nRPKhotWi+uV5PyBwrrVPtGGfLMQTOxh4s9qmyAEj3VeS
         KSs8J+G1mONeOk90BibMghWQF3GVoT+AOjc1Pw4v4b14gf8d5WU9ESBeEjxRC8VQmc8A
         5ZHQ==
X-Gm-Message-State: AOAM531v0Y5MtPZk/hP+IjCJ1jasrV8nLr4ztaoib1251Z/IIkhbhS0w
	V0Jgroct4iRnVQw2IMwVVm29PQi7
X-Google-Smtp-Source: ABdhPJzLwFYTvHw8MUcyMGrx+sCNxVPc/HNNoTK1PRgMFBQbib92OrzFZM4EKqx10kSYSIKv8o0d4Q==
X-Received: by 2002:a17:902:c1d2:b029:101:656b:8c06 with SMTP id c18-20020a170902c1d2b0290101656b8c06mr10676927plc.77.1622930812611;
        Sat, 05 Jun 2021 15:06:52 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id n69sm4735944pfd.132.2021.06.05.15.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 15:06:52 -0700 (PDT)
Subject: Re: [PATCH v16 85/99] target/arm: cpu-pauth: new module for ARMv8.3
 Pointer Authentication
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-86-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <59ab1d7c-3529-609f-0e24-4d17f40116b4@linaro.org>
Date: Sat, 5 Jun 2021 15:06:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-86-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 1HMdLJ0MCHEb

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> Pointer Authentication is an AARCH64-only ARMv8.3 optional
> extension, whose cpu properties can be separated out in its own module.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/cpu.h           |  3 --
>   target/arm/tcg/cpu-pauth.h | 34 ++++++++++++++++++++
>   target/arm/cpu.c           |  1 +
>   target/arm/cpu64.c         | 35 ++-------------------
>   target/arm/tcg/cpu-pauth.c | 63 ++++++++++++++++++++++++++++++++++++++
>   target/arm/tcg/meson.build |  1 +
>   6 files changed, 101 insertions(+), 36 deletions(-)
>   create mode 100644 target/arm/tcg/cpu-pauth.h
>   create mode 100644 target/arm/tcg/cpu-pauth.c
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index e9bfb6f575..02e0fe5dbd 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -216,13 +216,10 @@ typedef struct ARMPredicateReg {
>       uint64_t p[DIV_ROUND_UP(2 * ARM_MAX_VQ, 8)] QEMU_ALIGNED(16);
>   } ARMPredicateReg;
>   
> -void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
>   /* In AArch32 mode, PAC keys do not exist at all.  */
>   typedef struct ARMPACKey {
>       uint64_t lo, hi;
>   } ARMPACKey;
> -#else
> -static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
>   
>   #endif /* TARGET_AARCH64 */
>   
> diff --git a/target/arm/tcg/cpu-pauth.h b/target/arm/tcg/cpu-pauth.h
> new file mode 100644
> index 0000000000..af127876fe
> --- /dev/null
> +++ b/target/arm/tcg/cpu-pauth.h
> @@ -0,0 +1,34 @@
> +/*
> + * QEMU AArch64 Pointer Authentication Extensions
> + *
> + * Copyright (c) 2013 Linaro Ltd
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version 2
> + * of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see
> + * <http://www.gnu.org/licenses/gpl-2.0.html>
> + */
> +
> +#ifndef CPU_PAUTH_H
> +#define CPU_PAUTH_H
> +
> +/* ARMv8.3 pauth is an AARCH64 option, only include this for TARGET_AARCH64 */
> +
> +#include "cpu.h"
> +
> +/* called by arm_cpu_finalize_features in realizefn */
> +void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
> +
> +/* add the CPU Pointer Authentication properties */
> +void cpu_pauth_add_props(Object *obj);
> +
> +#endif /* CPU_PAUTH_H */

Similar comments re "cpu.h" and the proliferation of headers.
Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
