Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2181639ejb;
        Wed, 21 Feb 2024 13:36:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVw4wsfj0mnt1A2oP717g7OSdRG25110pwgwbL6n46YXyJKuIvMhVVdT1QMyEXHewm3Wvp2FW2q52QNzfd32ehRGsXn/+Tf
X-Google-Smtp-Source: AGHT+IFFl5uW2EDFuttjP1i0Tm2eiATv536pdvr9WczP7J+FRyi8MrRxP0ANLJkyK/5LA4gOmJQ5
X-Received: by 2002:a0c:e2cb:0:b0:68f:2b1c:5516 with SMTP id t11-20020a0ce2cb000000b0068f2b1c5516mr18087875qvl.32.1708551412297;
        Wed, 21 Feb 2024 13:36:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708551412; cv=none;
        d=google.com; s=arc-20160816;
        b=tciEreQDQD63efMhr8CsbZvD97Z8iWPcwKZj39uyhJ4M91C4pypcys2F7/1s63/tJp
         Mf5SdynXIjVcKZPusxK84nKGl1Yglmykjf5N8U1E/JTnwmw/t3ZIXHF4M4Ej8VtvmNAW
         HGYowAraSYpwqn7f4AUFQqVqEXFPAKu4RCJOCB27KQJZ/SqCrGNCJzca7MQELMuc9j18
         ENY1d2r1UY9R17l6QbXfFp7djcMzOnTy1onu9wCk9UdfpzX9hbCejxbifIfbcgRXLVnH
         aA6sAMXTN2fov8Np0H5hgbnLV5R/kRH5+CLt2TiWGsAcFtdUZJu4h3wMr4D0kgNEHPUC
         x7wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=2v9XGA/E18jXpKOpefIljoZ27yjt5k9rVr1O7vT2Qqc=;
        fh=LxuwBP4eK5mEuVsDqj6D1lGIhotaUbKXMS13R6/K9B0=;
        b=KtPUAqmd3PHjDTOjQ4KMe/kXgVk0UgtlBskgoux2U3HuwOIGvk2/D+bsENDXoO3VSY
         NRmzTRATCRWk2MZgwSeXKi+RkDUzMusgaJV22F/N1b9IzBz6rNJktZw0EIhFHdGL3UUZ
         74gc1Pbb0SfsZ0GDuuTc1viKw7yzNZSyA6vP3pZ0M349X+k5LKrc7/8iuSjAqh4lbNnK
         +9vpVUEEKC9fafg8UQrAp36A2/NRZg65kaYfury3ieyRJTW8AtD1HmLV3p+OmKiWPDb5
         IGDfUHoH9LkBZBO5gea08rDOGLylgCLgJrhqI6T7sZ2RmYueW0IgTMt7OgL6caootrVp
         u9Mg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gXYmLbpy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kc30-20020a056214411e00b0068eeff8b49esi11551331qvb.137.2024.02.21.13.36.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 13:36:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gXYmLbpy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcuGe-0005h0-GY; Wed, 21 Feb 2024 16:36:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcuGd-0005g4-89
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:36:39 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcuGb-0005UG-Ex
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:36:38 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1d71cb97937so71212035ad.3
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 13:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708551396; x=1709156196; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2v9XGA/E18jXpKOpefIljoZ27yjt5k9rVr1O7vT2Qqc=;
 b=gXYmLbpyKXomTgL1ekD+LnNRZ7Xj66RvqMa1pSL/G13lE/Kod1Ux6gwsbyyZzV6cHc
 GPfz3vkBIvtVtPIDm8xg87QEMuMhxrgmBhzz+A62xwWyL9XAL8u80kddcA9K+v4ypTL/
 AiMWRIfR9rdrcF4ESbG9V6c4pxo4vVLU6+lb/rdOrTJl3nEbdUHcNf0Z5k38yr94XTaQ
 arUsBhw1h86vHlUAstrGv6EYP5DtR3wpQziFbUcC0cAjLQB8xC8pbyQgGq1d+rp7/Lee
 W9jVFQMmjc4htCfwTyvdkFebu/9OZPlyjKYbnvCoZ/ZCWLqaokhDDCGweJIrLShScKuS
 W9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708551396; x=1709156196;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2v9XGA/E18jXpKOpefIljoZ27yjt5k9rVr1O7vT2Qqc=;
 b=VlCHA+76htVV8S9OU1UY1YUFQl4ByKtEKfc2juoTnEHHeexO6HrtbUb2fvGyrVgu/R
 ldUqmhFnhRzqLOCcRcjk8CCOXkfc1lVNw1IUl93J4RBdgEsrYZMRIua0UxmxtFRljIws
 cnNOVYTlPHVUu5i45y+zIjH17eERKl3HOBWO0ezgtV1ZJEpAeqWHg/VQKTiGR9feLmjJ
 oQVsv41Wc/hocRWr1k2xadAhp9eCTkC5CL79So5uy7H2zIbFr5zwB9AozORJYU3CeGJF
 j7D8fK1vSQwU7C5IgyVJu+dBOLVAiYSjKg0BtKj1IRYu+R2ZYpMzPGViVsM8+ZDUAHgq
 RNkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZkQ5A0dI5+OwWbS0TQtP7k/kZI7bsq723kewHRo/jfwk2qSPe2lPXm9fEMiw1Qi3BTUzMB5T8MfJ2ufm6GLn+5Exx
X-Gm-Message-State: AOJu0Yy2ZDJ+M1uV8hw8iQxfS/Y6S9+gpd/5f5mn92nPs2yn31D+RpT+
 ed2RSo4J+0ZOkEMt0E2b59jLYd6R6MZC7IABY/JG6IbT19QyUsXiuDro+N0sf5C9W5tHbX9shQk
 Q
X-Received: by 2002:a17:903:1c2:b0:1db:ea2b:d2b4 with SMTP id
 e2-20020a17090301c200b001dbea2bd2b4mr11032096plh.15.1708551395897; 
 Wed, 21 Feb 2024 13:36:35 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 u2-20020a17090282c200b001dbcf653017sm7878074plz.289.2024.02.21.13.36.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 13:36:35 -0800 (PST)
Message-ID: <edbe3faa-d83e-4410-811a-d15fe244817a@linaro.org>
Date: Wed, 21 Feb 2024 11:36:32 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 08/22] target/arm: Handle IS/FS in ISR_EL1 for NMI
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-9-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240221130823.677762-9-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
X-TUID: YveQJ3FHrSrl

On 2/21/24 03:08, Jinjie Ruan via wrote:
> Add IS and FS bit in ISR_EL1 and handle the read according to whether the
> NMI is IRQ or FIQ.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   target/arm/cpu.h    | 2 ++
>   target/arm/helper.c | 9 +++++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 051e589e19..e2d07e3312 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1476,6 +1476,8 @@ FIELD(CPTR_EL3, TCPAC, 31, 1)
>   #define CPSR_N (1U << 31)
>   #define CPSR_NZCV (CPSR_N | CPSR_Z | CPSR_C | CPSR_V)
>   #define CPSR_AIF (CPSR_A | CPSR_I | CPSR_F)
> +#define ISR_FS (1U << 9)
> +#define ISR_IS (1U << 10)
>   
>   #define CPSR_IT (CPSR_IT_0_1 | CPSR_IT_2_7)
>   #define CACHED_CPSR_BITS (CPSR_T | CPSR_AIF | CPSR_GE | CPSR_IT | CPSR_Q \
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 0bd7a87e51..62c8e5d611 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2022,6 +2022,10 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
>           if (cs->interrupt_request & CPU_INTERRUPT_HARD) {
>               ret |= CPSR_I;
>           }
> +
> +        if ((cs->interrupt_request & CPU_INTERRUPT_NMI) && env->nmi_is_irq) {
> +            ret |= ISR_IS;
> +        }
>       }
>   
>       if (hcr_el2 & HCR_FMO) {
> @@ -2032,6 +2036,11 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
>           if (cs->interrupt_request & CPU_INTERRUPT_FIQ) {
>               ret |= CPSR_F;
>           }
> +
> +        if ((cs->interrupt_request & CPU_INTERRUPT_NMI) &&
> +            (!env->nmi_is_irq)) {
> +            ret |= ISR_FS;
> +        }
>       }

The external CPU_INTERRUPT_NMI will never signal FIQ.

With CPU_INTERRUPT_NMI, both CPSR_I and ISR_IS must be set.

Missing is the handling of HCRX_EL2.{VFNMI,VINMI} to signal vFIQ and vIRQ with 
superpriority.  Unless I missed it, I don't see HCRX_EL2 adjusted for FEAT_NMI at all.


r~

