Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2124283ejb;
        Wed, 21 Feb 2024 11:29:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW6QbHUqYjMEb9R5YoCjnHgGxtVQFOie8Dcl+TN8FCmgW/0F5hMTGD3bWrBkarPItzygjp9x7mDvwksZy3W67sMoI4j7jAU
X-Google-Smtp-Source: AGHT+IEOxfHm9qcFUHDqPitfNj0oDbSnTjWlWzlZQhmUZoR4Onm58/VaKuHuBN92XuKzAB4027yd
X-Received: by 2002:a05:6214:21ac:b0:68f:5d8f:7bf9 with SMTP id t12-20020a05621421ac00b0068f5d8f7bf9mr12446181qvc.8.1708543749908;
        Wed, 21 Feb 2024 11:29:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708543749; cv=none;
        d=google.com; s=arc-20160816;
        b=QtZH+MaVNpwy1wWiRVvIJfYRMoBVDD3VMtyAhxiHQDpf4mTtejF7Z3/Oz+sCGgMmgN
         +IiU82FbbmBPK1pwu7+a03KbkUxXU1HxEh8tyaeyKeY0p9ZSTLv3Bukzrip94EUTArS8
         4d/eQql6+kWOzoQ3f7OwBLW1Q57WRHVqUETvkRIR9+GmHzcm4ugwL/TucmjGO3aMhvop
         4+tnNfJrQOXCFpz9r6bzQQsUzB7zRO4/o/V6B+P188+0nG0fsIfA3pUlfMl7E03Ve8us
         Bwq4o7lOLPzImLU8nD+jKLMWRD3iQ/YZa05G5Qn007KE60aTdVYQBUqWj8PRzOEHf8Nh
         mTYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ZhlfY+tfIcCgiq79UYeQpxQ7acX7rQbi2TkoHHTCvhI=;
        fh=TNnbMt+uRz3HiSwUF7FxcIThGA+uIYthS8qrzwjFrfM=;
        b=e73w0pOQWdezSiNc54SY1oZcVIvomLZYiabopqjFnMyUbSND7tFNMWtCd8ApiE+l62
         Khx7n1qXLE+wrcBv8H99my17g5T+1hv+wi6lKuOQMtseRPfmvrpzR7HKnubqSExn3c4V
         f4uETF10QBHuduHVyjJEJ+coNh3Mt3DXJPDDnUSSwCKFUbb4wojWoPP01BCZBWbl9C42
         f/xJZrbNuMv/iCe+eA7EHZvBce2iGQCcSvwcu6+eQd31bgh0vHsynEcGnJ1oX9grlGGN
         FzSYNi/IhY3cQzvHGfLDFtAHkLD1JaIFq+z8nsz+G4SQ/9I6arbgof5NuXx6XoZkB6KI
         JqgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FqfBBM/F";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5-20020ad45bc5000000b0068c3d2d61f1si11425343qvt.120.2024.02.21.11.29.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 11:29:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FqfBBM/F";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcsH8-0004T1-Hc; Wed, 21 Feb 2024 14:29:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcsH6-0004Rc-KQ
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 14:29:00 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcsH5-0006lA-0p
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 14:29:00 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6e22e63abf1so3188095b3a.3
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 11:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708543737; x=1709148537; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZhlfY+tfIcCgiq79UYeQpxQ7acX7rQbi2TkoHHTCvhI=;
 b=FqfBBM/FNpPo/DQUcnRpwPr1PMmvxu9Zzb6DPDfnyxO16SnofKUI2wXEg+qQjhQXh0
 u/8LeD8IDzk7eBcHZDmppbI3Q6/ckA0oCsBfOJfajSd8t8ZPHBN9AQpW74I6XYBKMa7m
 f8G8PX8XLEsTRELMppldiBU4UAR7NgahmGxBsI1Blyd0x3W9c6Pxm258AjBxAv15K6Q6
 zPNWGHduzBy/fY5Nfb45iuJASC7oXQ9ZDYPpU16FoFY3wkottXXZhdSyhRhPAHrebulT
 0o+Vk1KFllXc115bO0hxGbr3YBEbjeZb5pAtphq6Fs4yS5HAzQf7ZlfnCpgB6XeBFsCw
 vNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708543737; x=1709148537;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZhlfY+tfIcCgiq79UYeQpxQ7acX7rQbi2TkoHHTCvhI=;
 b=mtFn/mN5pnjXrx3ko8Ay72OmZpzPT1h4qiLnAhFJUAkpAWFnY5tAJlT81uzSoJFLNp
 dAcmb8KfuRewt5yem0sI0mLBzFgkoC1Y1ZZrUEq160TFYCzBaDrM+kY4+T2UNbTErtoy
 DYODcbBjN16444JJQwJH3SlYEBuekACzSfJlGKPm2h8VoJngEnk3VnDq1PwIRLQbkmlv
 94njl93WB3Ff1NhVuJjN0eZuzz7MueSgw8chDWwGDG5VG9hc8yypbilww7T8zBwYQRxB
 qbb6BQvwQh7rLcWhUp6gLQY8PMQa/2eLBIesfBg1mCRoj6lNXBxik/Od5NgZQWEihkwJ
 WsMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWeUVF+6OR9qc1q57Ri72nogUrIafLxBI9pGAoj6A7+QjQEJ7/PyQTn226HLev5/8xu5mj1q/Pw51ZfG74umt1YTR4
X-Gm-Message-State: AOJu0YycuNkiOVKA4JT2cU/9juoIhtQMbNtqWDDhmjwV5XXtgH0w4tpO
 xf/RcUJT7hzSUrZhNuheEjxeyzWe23w65/OSCRbBRQe5KPFjXvV6bValWa9D2mI=
X-Received: by 2002:a62:cd82:0:b0:6e4:3ea4:a7e1 with SMTP id
 o124-20020a62cd82000000b006e43ea4a7e1mr7061123pfg.27.1708543736930; 
 Wed, 21 Feb 2024 11:28:56 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 k2-20020aa79d02000000b006e37814cb11sm8427109pfp.4.2024.02.21.11.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 11:28:56 -0800 (PST)
Message-ID: <699fbf87-8f24-4d3d-b230-f956ce371f20@linaro.org>
Date: Wed, 21 Feb 2024 09:28:48 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 05/22] target/arm: Support MSR access to ALLINT
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-6-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240221130823.677762-6-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
X-TUID: WFCwXuv/imrG

On 2/21/24 03:08, Jinjie Ruan via wrote:
> Support ALLINT msr access as follow:
> 	mrs <xt>, ALLINT	// read allint
> 	msr ALLINT, <xt>	// write allint with imm
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   target/arm/helper.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index a3062cb2ad..211156d640 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4618,6 +4618,31 @@ static void aa64_daif_write(CPUARMState *env, const ARMCPRegInfo *ri,
>       env->daif = value & PSTATE_DAIF;
>   }
>   
> +static void aa64_allint_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                              uint64_t value)
> +{
> +    env->allint = value & PSTATE_ALLINT;
> +}
> +
> +static uint64_t aa64_allint_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    return env->allint & PSTATE_ALLINT;
> +}
> +
> +static CPAccessResult aa64_allint_access(CPUARMState *env,
> +                                         const ARMCPRegInfo *ri, bool isread)
> +{
> +    if (arm_current_el(env) == 0) {
> +        return CP_ACCESS_TRAP_UNCATEGORIZED;
> +    }

This is handled by .access PL1_RW.

> +
> +    if (arm_current_el(env) == 1 && arm_is_el2_enabled(env) &&
> +        cpu_isar_feature(aa64_hcx, env_archcpu(env)) &&
> +        (env->cp15.hcrx_el2 & HCRX_TALLINT))
> +        return CP_ACCESS_TRAP_EL2;

You should be using arm_hcrx_el2_eff(env).
Missing braces.

> @@ -5437,6 +5462,13 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
>         .access = PL0_RW, .accessfn = aa64_daif_access,
>         .fieldoffset = offsetof(CPUARMState, daif),
>         .writefn = aa64_daif_write, .resetfn = arm_cp_reset_ignore },
> +    { .name = "ALLINT", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 0, .opc2 = 0, .crn = 4, .crm = 3,
> +      .type = ARM_CP_NO_RAW,
> +      .access = PL1_RW, .accessfn = aa64_allint_access,
> +      .fieldoffset = offsetof(CPUARMState, allint),
> +      .writefn = aa64_allint_write, .readfn = aa64_allint_read,
> +      .resetfn = arm_cp_reset_ignore },

You cannot add ALLINT here in v8_cp_reginfo[].
Compare fgt_reginfo[], and how it is registered.


r~
