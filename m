Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2141611ejb;
        Wed, 21 Feb 2024 12:07:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXNUc2xtNa8OUEcTqy2NwJmg6/U/jtpl2fa/pUIWCXHbot7aOFnTglVF6Vt2/RAMS2hhFYZ4Uylga2IAO2P5RoQ1RusRfke
X-Google-Smtp-Source: AGHT+IFw8KG2r6Db1S8ZrX8J0JFyOPQWaPv93aShfjTGYukqFbbqVr0ujCy1tlQ0oawlE9iEbcbp
X-Received: by 2002:a05:6830:18d0:b0:6e2:ed2e:3a9 with SMTP id v16-20020a05683018d000b006e2ed2e03a9mr18583611ote.37.1708546024044;
        Wed, 21 Feb 2024 12:07:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708546024; cv=none;
        d=google.com; s=arc-20160816;
        b=BxkYTTJqhxLHWyaGvMjFRX6U5Vi2DewKNsxdsvKTQ9L/fdJEE0KyznfT9Gid6MdWVQ
         qDvx1QddHZA+YyvMpiNkkiFZKogy/5mO+nhHoZaAQXrLw+C7/zk8oqk5DVSO/jwmX7x3
         rcYfFdX+IqnD6uyt5LPW0/K+jGq71jB7GAR73n4R0BSsm5d4MkeaJ0cMN6yBjBrVaIxf
         HRO0fqJ+tV4WWtUkMGdfGMRLM6yun2slTIbl20TRGRnGZT9RavM3/HQP9vsl/89bmrQG
         b6IVg4eGOOgZhjtaV7tM1TWSv/IVHEUz6nvPSAh05tj7AMAIFoUSry1ig2RAZpqVQg1D
         lxcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=nGTOERJajhvkvcCpTrMLtKW49YgUT4pv8GWLdEl9PbQ=;
        fh=EFiPXfnyUI1ZMotFH5jT0J3zsvdvLv8rZsHj5ZBV2Nc=;
        b=uAiruDoOm69tW0tkfulGXs/YiRYIxZ3GbLVoee4+2bh9FpIBCTSACmtoJZAYPRRWJn
         XHtOSNt2muHj4oE26m8Jdd06cYRcBJ8WQ6SP3E8KnxUG64KEg45Cvvk6qv1qI8E5JR27
         E5WLeDAUSpZng2V9EvtPxYPtxzBCmpNb064f5xAJhB+QbMJDHpBnvHUWOch7+S07Vq/l
         eTmNhxQ+buhXETbYmuRVNaupbC0EtTOBIB0BZuTb/0yrihWsdCgNoz7C1M+nQcL5d8nk
         gMbeNUKW1C2A+Xz9CUD0E6ZeHbUF+ahSZzfHbJ8JUn0tJ9KPoD6S+l5vrrKlJRyiiAxq
         CdEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wPivL64i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jr21-20020a05622a801500b0042ddefa5de7si10837240qtb.169.2024.02.21.12.07.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 12:07:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wPivL64i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcsrS-0006P1-FE; Wed, 21 Feb 2024 15:06:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcsrR-0006OX-3M
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 15:06:33 -0500
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcsrN-0004q5-Vq
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 15:06:32 -0500
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-36517375cc6so11679935ab.1
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 12:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708545987; x=1709150787; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nGTOERJajhvkvcCpTrMLtKW49YgUT4pv8GWLdEl9PbQ=;
 b=wPivL64iXza6VvMUwSMrODIcEFwU1EbUh9uPaBOOIod9eF7s/ODaTvZoHrp6+x/39O
 dO6SV/XwwwQ2WjCcHlZ2W4/ss4GTdVGeK+M1hID1TyoepdPsevn8NxHYiOlVYrrITWfS
 Sf9TYuKR/YKvZYADbTtlocrqJlh6eDcWHPXi4BLqAdF7CCrGXTO5gsc8vm4ICQEqO6OF
 8bJcwMmoRhnw7netsJtCr9EMgxXyBLvajxP/eoRkFERqAxL8QvCStbvLcDEBHRspVGJ4
 MaEsmQ1SNTwxb3IoTNGmyCmznsX5y8F2D8KALNH8PJhFVkbVN1amAixEMwt3tcOY2ziI
 q7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708545987; x=1709150787;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nGTOERJajhvkvcCpTrMLtKW49YgUT4pv8GWLdEl9PbQ=;
 b=HLaJsTdY8CkldOz1Nx/YeNs5ox27oCYLheqmzg9FmmqEYVdZAnIUCD9zX75v8gT2NW
 USTZvZ0rxkUIC8T5ecf6HDwUISf2CbVvUeetV81jR9cUKdvV6xE6zDGsr5QDsQn80miR
 mnKXOkaN/4eFrnyelMqHiY8uoLOcHpjbNPTRcd+b5Jvl4Kdk6j1jwGnSvHZUEWlwf2RQ
 pZMd9iw7sY9K4KRXAc6ujgwdRsqP/jjLEwEXrzajrbpmIpo5p26v5mRIvXzKniMCBzmX
 l46Vxeti2G9pu2g0VXHo6Un5YJ+7mP4ICkSEQOSLcJPgYPnOlWnjsT78AUEvPqIZonei
 UcjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1v4OXp75pyuXbruWwHJOpAEhChIke40SkQFsEvnVIdpJ07BZ9yUsJMwjnTIbpnbMRzEWzwOVWI4XkWN+cRcySgtyU
X-Gm-Message-State: AOJu0YzhdqAyl1Xo7VowrvlbL2cF05lZsYNUYUrs1PXXvA4g6CcMAIAZ
 Dk0xfpOWcqh5eOFM/KC4svbSXbDfBHDwSAJ90UzSsPcMA9whmoPOa9g664NH86M=
X-Received: by 2002:a92:d305:0:b0:364:1e0e:7648 with SMTP id
 x5-20020a92d305000000b003641e0e7648mr18912985ila.7.1708545987548; 
 Wed, 21 Feb 2024 12:06:27 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 a24-20020a637f18000000b005dc27ff85c1sm9092059pgd.0.2024.02.21.12.06.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 12:06:27 -0800 (PST)
Message-ID: <94867836-95f4-4da2-96e9-583e508a762d@linaro.org>
Date: Wed, 21 Feb 2024 10:06:20 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 06/22] target/arm: Add support for Non-maskable
 Interrupt
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-7-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240221130823.677762-7-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: x2NN54uEhOzW

On 2/21/24 03:08, Jinjie Ruan via wrote:
> This only implements the external delivery method via the GICv3.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   target/arm/cpu-qom.h |  3 ++-
>   target/arm/cpu.c     | 39 ++++++++++++++++++++++++++++++++++-----
>   target/arm/cpu.h     |  2 ++
>   target/arm/helper.c  |  1 +
>   4 files changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
> index 8e032691db..66d555a605 100644
> --- a/target/arm/cpu-qom.h
> +++ b/target/arm/cpu-qom.h
> @@ -36,11 +36,12 @@ DECLARE_CLASS_CHECKERS(AArch64CPUClass, AARCH64_CPU,
>   #define ARM_CPU_TYPE_SUFFIX "-" TYPE_ARM_CPU
>   #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
>   
> -/* Meanings of the ARMCPU object's four inbound GPIO lines */
> +/* Meanings of the ARMCPU object's five inbound GPIO lines */
>   #define ARM_CPU_IRQ 0
>   #define ARM_CPU_FIQ 1
>   #define ARM_CPU_VIRQ 2
>   #define ARM_CPU_VFIQ 3
> +#define ARM_CPU_NMI 4
>   
>   /* For M profile, some registers are banked secure vs non-secure;
>    * these are represented as a 2-element array where the first element
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 5e5978c302..055670343e 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -128,7 +128,7 @@ static bool arm_cpu_has_work(CPUState *cs)
>   
>       return (cpu->power_state != PSCI_OFF)
>           && cs->interrupt_request &
> -        (CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD
> +        (CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI
>            | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ | CPU_INTERRUPT_VSERR
>            | CPU_INTERRUPT_EXITTB);
>   }

I think you should not include CPU_INTERRUPT_NMI when it cannot be delivered, e.g. 
FEAT_NMI not enabled.


> @@ -668,6 +668,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
>       CPUARMState *env = cpu_env(cs);
>       bool pstate_unmasked;
>       bool unmasked = false;
> +    bool nmi_unmasked = false;
>   
>       /*
>        * Don't take exceptions if they target a lower EL.
> @@ -678,13 +679,29 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
>           return false;
>       }
>   
> +    nmi_unmasked = (!(env->allint & PSTATE_ALLINT)) &
> +                   (!((env->cp15.sctlr_el[target_el] & SCTLR_SPINTMASK) &&
> +                   (env->pstate & PSTATE_SP) && cur_el == target_el));

I don't see SCTLR_ELx.NMI being tested anywhere, which is required to enable everything else.

>       case EXCP_FIQ:
> -        pstate_unmasked = !(env->daif & PSTATE_F);
> +        if (cpu_isar_feature(aa64_nmi, env_archcpu(env))) {
> +            pstate_unmasked = (!(env->daif & PSTATE_F)) & nmi_unmasked;
> +        } else {
> +            pstate_unmasked = !(env->daif & PSTATE_F);
> +        }
>           break;
>   
>       case EXCP_IRQ:
> -        pstate_unmasked = !(env->daif & PSTATE_I);
> +        if (cpu_isar_feature(aa64_nmi, env_archcpu(env))) {
> +            pstate_unmasked = (!(env->daif & PSTATE_I)) & nmi_unmasked;
> +        } else {
> +            pstate_unmasked = !(env->daif & PSTATE_I);
> +        }
>           break;

I don't see what this is doing.  While Superpriority is IMPLEMENTATION DEFINED, how are 
you defining it for QEMU?  Is there a definition from real hw which makes sense under 
emulation?


r~
