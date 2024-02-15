Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp823242ejb;
        Thu, 15 Feb 2024 12:48:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUcgdYyLPS4hbPCfPeTehpSDKsKYKz+cfIQlzX+IXROI5jRMBxVpSSThauFcuxmXnztk6BOtlN5kJmE82QR/zMfitaxcUYV
X-Google-Smtp-Source: AGHT+IGDSDAoLsLEGK/O3im3mvUvxdKw4aJRo22bFJ+IzvG65ufK/o11vTIhpsvwF16/xNZuV6GE
X-Received: by 2002:aca:2201:0:b0:3c0:3943:ac88 with SMTP id b1-20020aca2201000000b003c03943ac88mr2938652oic.53.1708030116239;
        Thu, 15 Feb 2024 12:48:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708030116; cv=none;
        d=google.com; s=arc-20160816;
        b=k6uC7zPU8mZ14OINK/E5xnZQl4DvAxUnFyzPxK7vZM15wy1IRVJs2rysUNv0FhX8jX
         oO35UHYGgV+4KS1URxH0Q34Ou+HbbH7q0z3Svrxbo1bSxtO99TajReTHSImolky1avA7
         yCcebuUQJGvZsEbq18CTxtKHz+gYWrLGFQg5DbhtaZOWnH5CpNt5Bf1FjIpSQRejJlqB
         n+hAQrmTrRSwoso8E6VBbzvjK8Wuck+lkbyoMo40OFxVPJWJEQBCUWu5bEkLlEBA+Ecc
         xNmcDW2WbME4M7pXOy16ZRgMJhyu0mlwViQ2m84SMnVUGrDbLqe86ZxfOnSAJpgr/u8V
         DJMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=2/GvBQbcy2M7DzdySdN1BFjdnMxeBt9nuXTinUh+IxA=;
        fh=N5iyjK53tsxckJcqIZQY4BqYr9xFXHHe8Yk+t1ei4pM=;
        b=vP/K8EkDJsNbVYVZvyyWoYHJTZ00An4HtgDE8FjSQquUTRXVhKoA8cw5eYffT5slPR
         9VRoz8NOouXIeOtnHhye64ge534OROnXow/uG1dBXCNKph3heRG+LIVDwPc/Ptk6MgMw
         MzvpFPgVrx0motbxt5eO3stKnvLbeR44eIUoAzW+br4Mivp0jYGcxH3EPMpzAGtJtwIC
         E8btaACzOnCfkMrP7IINqhximPn8mxlZhydGCuYHjd0lV6byvCu/IUfBQYd8mMObcI4J
         tRsFdX5on54y//YZQxcopENjFlWpmtPrDwWi0bcUcoxo7zDlzsz0/eukhkofS+pn7jsf
         pgQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DC10qLAA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9-20020a0562140ca900b0068ee94fc0c0si2344671qvs.1.2024.02.15.12.48.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 12:48:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DC10qLAA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raieK-00016A-A4; Thu, 15 Feb 2024 15:48:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1raieG-000153-9C
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 15:48:01 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1raieE-0003cj-34
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 15:47:59 -0500
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6e0a479a6cbso947972b3a.0
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 12:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708030076; x=1708634876; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2/GvBQbcy2M7DzdySdN1BFjdnMxeBt9nuXTinUh+IxA=;
 b=DC10qLAAeSeLLXfWfyA13505h8jczEqco7wBFovBNvB9rRWc048NoFb+81RAI3gtQD
 Vx3WdqizoT8sTHI+zQC/xfDaaMrWRaNP5V6pcescDqgt8suy/eO5+l/NepY2D1rUYm+0
 XtFY5uwgkmb4xR5xgRz8SWGUZIkPXuEJEhqIb1ElCGLbJBTP8wcu2eSN1Qr6tWEy+fhR
 zykNstm84u6ETjBrFdWCy1d5KMiaE7Pni6fMJVKS/DoqCvErEqKAEvMeL/yyZ6pDu9/J
 SQZdLygaiUOXGlTtwqaBKiM4mYxtleZ0GbmQX15WDHjYg/0vpDYv8Fcj3LglTKm4/8PN
 hcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708030076; x=1708634876;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2/GvBQbcy2M7DzdySdN1BFjdnMxeBt9nuXTinUh+IxA=;
 b=EtLQPL/oGtu6MHmiylKvoLh31LcBip23dVRn5fowvQZpYd9jsW0pAjd0CM1IFafuBK
 fTz6z/ybGtiAeaue0AhW/Su9/1oUwz4sPaXLxaDMYLBT/cVaIf18Mg0vbJnMoHHmbbcR
 MsScPuRkMlPv2jMfsvrR/RU8wI/G2DiU+NOvMQUL7Hss5DyDszrvLxzkvLYRZw5um1TN
 tymGdf9J1v1fVexx++ZHSiUCHIjTuM6yLXWGsmzFwpzzOyWEkx5CbePSEmbVUzsKEhdU
 lrdcK85CWM0AWU7GvWwKG01qe8whmlq2Qx5D2rILu1oeHg2Nj3bfMIW1vLIgMG7LWsBa
 ZGqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0WJjeN4lOYFicr30k6d6NF4eMooNZpKiKq8jpm4f/Yx3+Xlpp5YRSMWVRADv046DSk2daH7jf9VG8MW5HJ3vwgZZ9
X-Gm-Message-State: AOJu0YzjeFcCph6TSm3jtTu5QahkZKM/SyyuRbAWKbCY05ZJf9WhKq94
 avBw+paW+34my2uQNgckQnf9YEJgk4nmWd8nfjssbmNkZDB0R65SQXgpHdos7tM=
X-Received: by 2002:a62:c1c5:0:b0:6e0:ed60:9a27 with SMTP id
 i188-20020a62c1c5000000b006e0ed609a27mr2628126pfg.7.1708030076352; 
 Thu, 15 Feb 2024 12:47:56 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 fa2-20020a056a002d0200b006e0414d7cf8sm1824215pfb.95.2024.02.15.12.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 12:47:55 -0800 (PST)
Message-ID: <e3a9fe96-8462-42d5-9e9d-b15dc304250c@linaro.org>
Date: Thu, 15 Feb 2024 10:47:52 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Advertise Cortex-A53 erratum #843419 fix via
 REVIDR
Content-Language: en-US
To: Ard Biesheuvel <ardb+git@google.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, philmd@linaro.org,
 Ard Biesheuvel <ardb@kernel.org>
References: <20240215160202.2803452-1-ardb+git@google.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240215160202.2803452-1-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
X-TUID: zmTdWJbha89r

On 2/15/24 06:02, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The Cortex-A53 r0p4 revision that QEMU emulates is affected by a CatA
> erratum #843419 (i.e., the most severe), which requires workarounds in
> the toolchain as well as the OS.
> 
> Since the emulation is obviously not affected in the same way, we can
> indicate this via REVIDR bit #8, which on r0p4 has the meaning that no
> workarounds for erratum #843419 are needed.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>   target/arm/cpu64.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 8e30a7993e..0f7a44a28f 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -663,7 +663,7 @@ static void aarch64_a53_initfn(Object *obj)
>       set_feature(&cpu->env, ARM_FEATURE_PMU);
>       cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A53;
>       cpu->midr = 0x410fd034;
> -    cpu->revidr = 0x00000000;
> +    cpu->revidr = 0x00000100;

Is it worth indicating all three errata fixes (bits 7-9)?

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
