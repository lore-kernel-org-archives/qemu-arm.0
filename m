Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp791499ejf;
        Fri, 23 Feb 2024 12:10:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV9fmPvJrgWbwFnr1R7vHhaIJHQuM+QC0fqhdpILv/UWtCF7hiH3ry/cZQmoIm5K/4tO9i89Uk1BmqS5X5A5anGtpyLNV4e
X-Google-Smtp-Source: AGHT+IGbCl5FPp8KBHReb7ESc6lMtxM/wORsif4qBaOSyOhf27U+ym9qpR53HvT18aCJ7my6IsSf
X-Received: by 2002:ae9:e013:0:b0:787:ad2e:682f with SMTP id m19-20020ae9e013000000b00787ad2e682fmr927171qkk.52.1708719050294;
        Fri, 23 Feb 2024 12:10:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708719050; cv=none;
        d=google.com; s=arc-20160816;
        b=1LvC3WpVaSVQYAbU3NItbsEa54Hrre8L4ArOQa2teKHQWcQOnYmKfSe8XHnrHGmfPr
         FJ1wQ15CLkY0ESbJ84Yn3EFkdahY6JwePsvaPK5ttCOv5VnkuH3tykTeMBVajB18Th41
         Y/fpGRAiO6pye38mW8Vtnt88gm8qKncdRXsQ2qm9E5jcMoBiCk3QMWIkpWc6fqS1mX//
         PcJBrPNPXpNHPagvk94z2KxB3gVp3i8GQeprcgu/dDcYN+JSIZSs0aW8COiklG/1WMt1
         tcF83JvitNMoa2SJbQse2yCf+gFnkFvPXcvs0sshzPl/SZ9jkaZkMdMHmt+E6luies5f
         h+Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=/TrAgSKYB/hWwJb+u0d6mqJR/NMd+hWHz7I91cQWFCM=;
        fh=VAwWamyVkndkV+FKKrLoJ8NS2DbVFcRYohrHyOKy1Sk=;
        b=aL90Wj5ozAlialfqrUO3jceSXCMnnwNGlUKHCxBm88nBSl9vv9HYIPEeMBvbnBbNHU
         ZfK064IwpE+ksI44JhEwcTjrn6C1Kk6/I450qI9wrQP6Y8ADoD/aRaB363xbJEJVEpHk
         zjSUdH5TisaJA18XI6e/JbC21PdhhTT+gKy/RccOujQmp6t/ZrrBRfgScyhFXiXr3RaE
         uOWEsi4jH3mUQVg2mibwEJ3N6uuKeBFZwc0h6GrrBKR4eINjZ0EjGZ7491aDhm/JT/b7
         G+MSxfmdKkNEERk/TmUvSo13TMg1nNXIEl2JWOBrtQRcYa+pBQjJusqMsdBeqRSbTFM8
         az6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UzoxODvp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id vv13-20020a05620a562d00b00787a7a9e59csi3163722qkn.543.2024.02.23.12.10.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 12:10:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UzoxODvp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rdbrC-00083O-2k; Fri, 23 Feb 2024 15:09:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rdbeC-0008PK-Ru
 for qemu-devel@nongnu.org; Fri, 23 Feb 2024 14:56:15 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rdbe0-0000RG-H9
 for qemu-devel@nongnu.org; Fri, 23 Feb 2024 14:55:48 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1dc0d11d1b7so6539965ad.2
 for <qemu-devel@nongnu.org>; Fri, 23 Feb 2024 11:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708718135; x=1709322935; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/TrAgSKYB/hWwJb+u0d6mqJR/NMd+hWHz7I91cQWFCM=;
 b=UzoxODvpRj/Rz3+oPhf4JfIpgDUxlxCPNm0ecOwqEMZmGcI0PjvSdp7p/VZn2SG8G5
 yJubV7SjGWNnxBHZyY+d0Vtvt49il403Ze7HJRzm1z2MP0kPtKutMwoCBYwj1Sn/Ac7t
 cY+mmV9DY2JDgYGKh5gJSRD15Uhw4BZpg1RilUeO5CmZxEb75fjDtGjChte1w3bmbsmb
 AK17CV5Y+NKcY+ku37yM5GgXvJxsu21BK+XFBdRslUukSFODv7Eh0wmWci4SgrgY5FTD
 Uydh1ztKoHpB+mjc8vZFTScu5DHmgiab/hXRwD5il8y+1OXcy3PPfmq6gcieewcx+da6
 ss0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708718135; x=1709322935;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/TrAgSKYB/hWwJb+u0d6mqJR/NMd+hWHz7I91cQWFCM=;
 b=A4SglIQYhlmktLgAgOMd91DelTg4d8QY7umWuqiaexoamkqm7zQMgMzkwyff6tTsyg
 iPm0VhFxGWG7r+9bS7ZIXo6G2PcWTDadH8Wie/SRJ5yeKj+Aemzthbmw7j4qyINPa6fZ
 7Fe5tkR0zi59nJGuSFXLJjSmewGMdTkWAajLMMaUQzAb6w1xC8Uh55L0PYvleTNCocCB
 dIiD+xiWFdl+mtOffgMTf+27y/whsl9dO6nRCBYdTdglhAW6fFhRzy+d/ITFpBrEJemr
 oMn3pQB6C4d7aqFCakKHCnsFUodaFnlEaKmwmYzGRoy3qnkiVK9uz877zvFlZLmmAFj6
 cj9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ36vTyZd1+FngmuGbFUfMzk3I2/QifI4WWnqemXXPZt6o+P92RQ22yQSuo4xIHU3Msjcl25aF5PrGdBpHhSYtcgvaoKs=
X-Gm-Message-State: AOJu0YzsZXDitlRiMV7OZC2yszzRFbkPdb8ptjJiA8edU0urGD0K6Efw
 YTZQ4L/MB+si2LarpWZHrhs+DmISEw3aEDXeQO8fmrH+iPWrzzqq1davJ7RSudE=
X-Received: by 2002:a17:902:f804:b0:1db:f372:a93c with SMTP id
 ix4-20020a170902f80400b001dbf372a93cmr672680plb.43.1708718135074; 
 Fri, 23 Feb 2024 11:55:35 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 d17-20020a170903209100b001d9ef7f4bfdsm12036798plc.164.2024.02.23.11.55.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 11:55:34 -0800 (PST)
Message-ID: <ff7f83e0-c68d-49a0-b41b-aa6c13165333@linaro.org>
Date: Fri, 23 Feb 2024 09:55:31 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 06/21] target/arm: Add support for Non-maskable
 Interrupt
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
 <20240223103221.1142518-7-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240223103221.1142518-7-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KgPXWpl7lkia

On 2/23/24 00:32, Jinjie Ruan via wrote:
> This only implements the external delivery method via the GICv3.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v3:
> - Not include CPU_INTERRUPT_NMI when FEAT_NMI not enabled
> - Add ARM_CPU_VNMI.
> - Refator nmi mask in arm_excp_unmasked().
> - Test SCTLR_ELx.NMI for ALLINT mask for NMI.
> ---
>   target/arm/cpu-qom.h |  4 +++-
>   target/arm/cpu.c     | 54 ++++++++++++++++++++++++++++++++++++--------
>   target/arm/cpu.h     |  4 ++++
>   target/arm/helper.c  |  2 ++
>   4 files changed, 54 insertions(+), 10 deletions(-)
> 
> diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
> index 8e032691db..e0c9e18036 100644
> --- a/target/arm/cpu-qom.h
> +++ b/target/arm/cpu-qom.h
> @@ -36,11 +36,13 @@ DECLARE_CLASS_CHECKERS(AArch64CPUClass, AARCH64_CPU,
>   #define ARM_CPU_TYPE_SUFFIX "-" TYPE_ARM_CPU
>   #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
>   
> -/* Meanings of the ARMCPU object's four inbound GPIO lines */
> +/* Meanings of the ARMCPU object's six inbound GPIO lines */
>   #define ARM_CPU_IRQ 0
>   #define ARM_CPU_FIQ 1
>   #define ARM_CPU_VIRQ 2
>   #define ARM_CPU_VFIQ 3
> +#define ARM_CPU_NMI 4
> +#define ARM_CPU_VNMI 5
>   
>   /* For M profile, some registers are banked secure vs non-secure;
>    * these are represented as a 2-element array where the first element
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 5fa86bc8d5..d40ada9c75 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -126,11 +126,20 @@ static bool arm_cpu_has_work(CPUState *cs)
>   {
>       ARMCPU *cpu = ARM_CPU(cs);
>   
> -    return (cpu->power_state != PSCI_OFF)
> -        && cs->interrupt_request &
> -        (CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD
> -         | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ | CPU_INTERRUPT_VSERR
> -         | CPU_INTERRUPT_EXITTB);
> +    if (cpu_isar_feature(aa64_nmi, cpu)) {
> +        return (cpu->power_state != PSCI_OFF)
> +            && cs->interrupt_request &
> +            (CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD
> +             | CPU_INTERRUPT_NMI | CPU_INTERRUPT_VNMI
> +             | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ | CPU_INTERRUPT_VSERR
> +             | CPU_INTERRUPT_EXITTB);
> +    } else {
> +        return (cpu->power_state != PSCI_OFF)
> +            && cs->interrupt_request &
> +            (CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD
> +             | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ | CPU_INTERRUPT_VSERR
> +             | CPU_INTERRUPT_EXITTB);
> +    }

This can be factored better, to avoid repeating everything.

However, I am reconsidering my previous advice to ignore NMI if FEAT_NMI is not present.

Consider R_MHWBP, where IRQ with Superpriority, with SCTLR_ELx.NMI == 0, is masked 
identically with IRQ without Superpriority.  Moreover, if the GIC is configured so that 
FEAT_GICv3_NMI is only set if FEAT_NMI is set, then we won't ever see CPU_INTERRUPT_*NMI 
anyway.

So we might as well accept NMI here unconditionally.  But document this choice here with a 
comment.


> @@ -678,13 +688,26 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
>           return false;
>       }
>   
> +    if (cpu_isar_feature(aa64_nmi, env_archcpu(env))) {
> +        nmi_unmasked = (cur_el == target_el) &&
> +                       (((env->cp15.sctlr_el[target_el] & SCTLR_NMI) &&
> +                        (env->allint & PSTATE_ALLINT)) ||
> +                        ((env->cp15.sctlr_el[target_el] & SCTLR_SPINTMASK) &&
> +                        (env->pstate & PSTATE_SP)));

In the manual, this is "allintmask".  It is easier to follow the logic if you use this...

> +        nmi_unmasked = !nmi_unmasked;

... and not the inverse.

>       case EXCP_FIQ:
> -        pstate_unmasked = !(env->daif & PSTATE_F);
> +        pstate_unmasked = (!(env->daif & PSTATE_F)) & nmi_unmasked;

Clearer with "&&".

> +    if (cpu_isar_feature(aa64_nmi, env_archcpu(env))) {
> +        if (interrupt_request & CPU_INTERRUPT_NMI) {
> +            excp_idx = EXCP_NMI;
> +            target_el = arm_phys_excp_target_el(cs, excp_idx, cur_el, secure);
> +            if (arm_excp_unmasked(cs, excp_idx, target_el,
> +                                  cur_el, secure, hcr_el2)) {
> +                goto found;
> +            }
> +        }
> +    }

Handling for vNMI?

> @@ -957,6 +992,7 @@ static void arm_cpu_set_irq(void *opaque, int irq, int level)
>           break;
>       case ARM_CPU_IRQ:
>       case ARM_CPU_FIQ:
> +    case ARM_CPU_NMI:
>           if (level) {
>               cpu_interrupt(cs, mask[irq]);
>           } else {

Likewise.


r~
