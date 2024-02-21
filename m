Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2105055ejb;
        Wed, 21 Feb 2024 10:50:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVHLMWG8y03PrD8KwinLMB6FjQqu/R+ZWUJlPG5uvAMcFUQViiMbxv09P5e/Gtmn7RXv/Lc4j7JgFQfYLYn3CSu/0NrnJkH
X-Google-Smtp-Source: AGHT+IHJteljZ6xeODZ7lqsFxqCDXtnxmwDCWu41PVTcQFadMSUkqCjyQ+Jb3EfKcY2ukWtjPNyQ
X-Received: by 2002:a05:6102:5127:b0:470:57a4:42c7 with SMTP id bm39-20020a056102512700b0047057a442c7mr10367047vsb.13.1708541428553;
        Wed, 21 Feb 2024 10:50:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708541428; cv=none;
        d=google.com; s=arc-20160816;
        b=PKN5kOnltRzzByY7rBRsths4tLnob5U6Yb7ZY3T5C+qL/Rt8drAOd/mVu0I5quxLHc
         ognnqVyRGCxrrKICbknaOyK5zHSOk66Y/xSM3dfZ1GQRo5w7pZNm1RiVbRf224I5dLTm
         0mTXy2s1MeNb9hQzYfRTQfPn79GNbRoYj85ZNu15FASW2txtqPAr0gFMRJSc396xyax6
         GhEDiqGjSqUb7Y1eY+DrbeHwLj+pkEDMGJ/0d/+zXLrWHY2z0VF74SHp5NKRl45fTAOO
         WEhGXIh6u7S9MIjw7QV3S9RZ7OPTBwabTaPe/zh+d7kRZ45O3r1JW0VFoDv7BqID/kdY
         8OsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=9xIiLvRY3xbhfc35tIkJp/NU/J0+jshpKxjq/sU0Ku0=;
        fh=aSY50LEB8mcrrnssw1Y0ibfsEMhUxn2CCmdbVrNLfmQ=;
        b=plYGXMRUQPVG8t7hUajzphJziR7vu69M6uYLD2KG9Y4UmqEH5Yh0FS/9NXEeaJoT8F
         on8Zs4XKGt+kvRACX5MOJvfMHG4SvoPDPEtQTryeK0jBj+UXBu80Og8Ylni+FTIMyCmq
         0agOVIjMzDPeKS66hJj4a5tAUGjTWsoK0AObJYjO1KO7w9wpK7H/xecVb7T20jULLdTv
         LWSxaeR7iTw9TsNWl7jbn2PmkulpcsQ8O08+9YywkmLZoSDLBAqe3EwAeiRXJCwjtI5E
         xMrToifazWoWXAq6WQaBKLjyW+fTfIUT+i+UZBbatt3wfBF0ohs8sIyA3AJR8m34jx3x
         gwCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aEFOGx3Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q3-20020ac87343000000b0042de973b9e9si10849277qtp.151.2024.02.21.10.50.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 10:50:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aEFOGx3Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcrfd-0008N6-8F; Wed, 21 Feb 2024 13:50:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcrfa-0008KT-Il
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 13:50:15 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcrfY-0007z9-TY
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 13:50:14 -0500
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-5cddc5455aeso4801515a12.1
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 10:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708541411; x=1709146211; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9xIiLvRY3xbhfc35tIkJp/NU/J0+jshpKxjq/sU0Ku0=;
 b=aEFOGx3QW1by9ld1l84XpFPa9YBfpCW2Y/02/ucrJnX5+TsY43mCvbobFt4icEdg6Y
 mgIccFvTgp+EBAuV2z/vVjAkazl75sKgOh01gLTVuR/4fjar/82M7ty9zd/VsCUoCecb
 17AaS6EEy8TDjSEcck5NBYWsqhDF+mDt29WqfotIJOeKCpAgdcEDwuJW6ZSf5/j3huRf
 hO8mYvXg8ONgsbR6j9US7gLeu2clTpn0CxNbWK++A1UHtMnc0hYOoZc/8emuSIO5NhqJ
 nfLQedNjaCGVFqeSc104Thoe8gqWDfq45jR2MkS5SaMUqAnC3NXzWP0BnHDo8QPdUYJE
 /q8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708541411; x=1709146211;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9xIiLvRY3xbhfc35tIkJp/NU/J0+jshpKxjq/sU0Ku0=;
 b=uj2UE0ztIeOIYXVaFqdwQpJodFag3AFgNQ9GBXJuriEVIPOpoQG8F2udDBDwz1rFZy
 /4BeLX6jyLHTE6W+sJz/FZzOYiPJxUP+xMs4CTtiloxMIBJY/WcQuwE36pKpSLISQFEB
 HmQhpknRlyzQkFbycc3ZLiqN6Yc9cFJUtANHRFvw4w3h+R2VRi//p8UJdlznzC1aO71a
 7RroXpW9TDAoJ2y4SYmciWTib1mp0na7YXtTR53Wlh1K+QWbMeQ7i8iZDeyTM9QDJ5wI
 iAEc7brb3b9UcRtiS6cc7kb59RNyaAZ41KNRkwOQS568+bXybMiWidRnr4zH3EDF1RDH
 bfxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUW3nQNnM/MocEj75/mHZWNGIvvwM5bqZrVgTcYJ9aC0OHjWC8gsNrsCQ2hbsEtsnkjQGt7Z9dA6rICjuBQJ0cR4qcs
X-Gm-Message-State: AOJu0YylW1Vgi2JZSMJlnUAxPndGOkPVhAAbLIx458TSd/ChpikpKNZZ
 XU4UZKALSPZTVyDD//vm7geIYq9PCu8fPCzW/Sy1XtgRzS+NTCMVtr4vNutwZxcVSBkAHw2LgeF
 W
X-Received: by 2002:a05:6a21:168d:b0:19e:9c82:b139 with SMTP id
 np13-20020a056a21168d00b0019e9c82b139mr17733965pzb.45.1708541411185; 
 Wed, 21 Feb 2024 10:50:11 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 ka36-20020a056a0093a400b006e48e0499dfsm1866046pfb.39.2024.02.21.10.50.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 10:50:10 -0800 (PST)
Message-ID: <5f25d9cf-3ca0-4adb-860e-71a8fac3b504@linaro.org>
Date: Wed, 21 Feb 2024 08:50:07 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/22] target/arm: Add PSTATE.ALLINT
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-4-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240221130823.677762-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +Au7f2g0PXwp

On 2/21/24 03:08, Jinjie Ruan via wrote:
> The ALLINT bit in PSTATE is used to mask all IRQ or FIQ interrupts.
> 
> Place this in its own field within ENV, as that will
> make it easier to reset from within TCG generated code.
> 
> With the change to pstate_read/write, exception entry
> and return are automatically handled.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   target/arm/cpu.c | 3 +++
>   target/arm/cpu.h | 9 +++++++--
>   2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 5fa86bc8d5..5e5978c302 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1104,6 +1104,9 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>       if (cpu_isar_feature(aa64_bti, cpu)) {
>           qemu_fprintf(f, "  BTYPE=%d", (psr & PSTATE_BTYPE) >> 10);
>       }
> +    if (cpu_isar_feature(aa64_nmi, cpu)) {
> +        qemu_fprintf(f, "  ALLINT=%d", (psr & PSTATE_ALLINT) >> 13);
> +    }

This is one bit -- !!(psr & ALLINT) is better

We don't individually print DAIF either; why is this bit more special?

> @@ -224,6 +224,7 @@ typedef struct CPUArchState {
>        *    semantics as for AArch32, as described in the comments on each field)
>        *  nRW (also known as M[4]) is kept, inverted, in env->aarch64
>        *  DAIF (exception masks) are kept in env->daif
> +     *  ALLINT (all IRQ or FIQ interrupts masks) are kept in env->allint
>        *  BTYPE is kept in env->btype
>        *  SM and ZA are kept in env->svcr
>        *  all other bits are stored in their correct places in env->pstate
> @@ -261,6 +262,7 @@ typedef struct CPUArchState {
>       uint32_t btype;  /* BTI branch type.  spsr[11:10].  */
>       uint64_t daif; /* exception masks, in the bits they are in PSTATE */
>       uint64_t svcr; /* PSTATE.{SM,ZA} in the bits they are in SVCR */
> +    uint64_t allint; /* All IRQ or FIQ interrupt mask, in the bit in PSTATE */

Why is this split out from env->pstate?

The allint bit matches the documentation for SPSR_EL1, which is how env->pstate is 
documented.  The other exclusions have some performance imperative which I don't see for 
allint.


r~
