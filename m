Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp822400ejf;
        Fri, 23 Feb 2024 13:21:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWGVbJlf3g5F0TpZ9F9nm+QpF9ZW4UnHMIhLn0TmPuhwmrwrt5hcDn4a3oToOcCBSnohIeZwHTxSX2TMsmgroYPr8px9gAs
X-Google-Smtp-Source: AGHT+IG63ldEcdIYOZRwhW9ha+G1S3ZTcMb9va+PRovjNWPj3f2yaIoV9ydQtrbfsC6TyEj8SXPv
X-Received: by 2002:a05:620a:57c7:b0:787:389c:fc36 with SMTP id wl7-20020a05620a57c700b00787389cfc36mr1154265qkn.8.1708723286845;
        Fri, 23 Feb 2024 13:21:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708723286; cv=none;
        d=google.com; s=arc-20160816;
        b=ddPOi9I2fHFcW7PonV52nXfuNKb54RttGaUVE+243tHWSwtVpHI/ZzezNIAerxzkm1
         iyRIX0cTYaxu14ljNgNUomNHFoHT6yzsOGH+y1rFacYU9v+eb9sj2iYiH5nUYCokQ6Eg
         C1okhx917txHyKuqQJNEbBOms7BRfAYCPiWKmszinb3RPreF7wz18naJ9KlIxqS1C10f
         snZ6DwS0kc1tfbQTxce3mljLSDmp+Psv8J4M2RpWxym5uv135JWSedX3iBValitBw4cc
         vlPdVSdmv8ULs7AJUnx9jJOVsFF+4RWteTtSYDzahX2LPbk1Ld0ksvzJZbH+m25NVrYX
         9bFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=oLiC4OnbOh3lK4zPHLdHplQPQ3q/yVVUpzIq3J07Sec=;
        fh=dUmWZ3KduvhSGHPCY7gjKJIfLID59vNzj6dJ2mThXBQ=;
        b=HjzKbddK9KyNhCzKne8vRcFJ1sIPiFoOQU1c8Tp5HZK8EloRXLHi3U+UoypWcHFahO
         9oUXLU3Q7vucgsR2Lp0Lugo8bG3P9rsCyW63rsJywZ1yMoDFGx91cK9jyXvgU3VWdbYB
         qy9ThBINGGhyr4MfKS6TTq9WITS08h+OjvOGf8wUOZLU5M6eTZ20Vedq7sOJ1hT7X3BL
         wEknWrv4M4VzFHfdpTBC7RUDcnUC6ANQaXyDxu3exjtCa9wP4VfWeReD5CcMM8eARBiK
         NVo0CniaQMkBT806m0VKbYzIu7hT167mQuwcig9Ax/1h4geBBRPrN2TL3U+7SN1IviDg
         I9Gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uWzQSBL2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s18-20020a05620a081200b00787bb723905si952529qks.92.2024.02.23.13.21.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 13:21:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uWzQSBL2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdcyq-0000Kp-Rq; Fri, 23 Feb 2024 16:21:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rdcXY-0000Bw-Dg
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 15:53:04 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rdcXV-0007mY-Fn
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 15:53:04 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1dc7abc692eso3902595ad.2
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 12:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708721580; x=1709326380; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oLiC4OnbOh3lK4zPHLdHplQPQ3q/yVVUpzIq3J07Sec=;
 b=uWzQSBL2ZfRRBqbTS2A2FbaMy74pxtcFzQ1+s7cWxzDN9QpJaKwQN3eLpIR/N8z3Bq
 nQk+CPIucKcUbzVSG6Xhb4zwWNvFTwT49st9+wFuve8ZJWX0q/2w4qh0mg4ZzlcGS2gy
 lm6DVlL70l6vNPSrTKSDZEWPpx/MR4eXy0gUfpHAbTTLwAXFDRjGIkppMVpJLEDTrLt2
 jXP+0srHKhcVfyYogBE/T6aJ8B++JSKwDZqgVD0668xRGnqYhwy3Lg7PoXs5gfxi1PUl
 JEtygWlTxHpYbosr84D7VJ9m3Wn1IKPqaTNkKGQ6S6yHf+h/IpmqIE/U43yDtp9YztdU
 xZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708721580; x=1709326380;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oLiC4OnbOh3lK4zPHLdHplQPQ3q/yVVUpzIq3J07Sec=;
 b=Bkxax8LJ+VqS5Zj1BrFWwphjlnZNXaAuJw9rfBLhBWpfV9dIKNmPx8hV2mCbRtkQvo
 Gj0ArA0KJTM9bDfck/Ysa1ZGOjLWYj7l2T032LT6lX/DJCxrhGCcntni9oGQNyAwVLbQ
 T5to4H2D56nY8+IAeWwW5zLIyhdFRWX1KR265oNxWTpuBvDik8s6RxSJrbzxV8oIHgAu
 rQcHmRBFc4apyHPFPBrP5/rQP0ixAcRRacHFLCg41pOIfiojxPjYoH/WgORXTQVyGcIk
 IG+7132AStRD5L37Gz8CPz7EdsiCDsiUJ0BEREb8cyW4G0aNfnFDABXCglN50lKwM4mz
 8kXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfA+JhV+5fCfkeopGyph/stuFFTmQWyiFvEd1uG4ZTCfQBOmdZBJnkKa6JyPxpP24uvVaP352HOWl5Fo6wg1wF/+aS
X-Gm-Message-State: AOJu0YwnT9vkFG8Q7U/Dm2XINOJ3TObHd4L319EtXPbHjH4HJkGHy9rG
 BDp+fRfcTc9ccrn+NjtPtBoOp0Q/N+BoAvifV4yS+lnnBiZM4hQ5BfQOCLOfgC0=
X-Received: by 2002:a17:902:e752:b0:1dc:2d63:9bf6 with SMTP id
 p18-20020a170902e75200b001dc2d639bf6mr1094466plf.4.1708721579757; 
 Fri, 23 Feb 2024 12:52:59 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 k13-20020a170902f28d00b001dbcf653024sm11404614plc.293.2024.02.23.12.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 12:52:59 -0800 (PST)
Message-ID: <81167528-32e3-4741-84e4-3c70b788fc2c@linaro.org>
Date: Fri, 23 Feb 2024 10:52:56 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 17/21] hw/intc/arm_gicv3: Add NMI handling CPU
 interface registers
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
 <20240223103221.1142518-18-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240223103221.1142518-18-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-TUID: zA2evdO0z7qJ

On 2/23/24 00:32, Jinjie Ruan via wrote:
> Add the NMIAR CPU interface registers which deal with acknowledging NMI.
> 
> When introduce NMI interrupt, there are some updates to the semantics for the
> register ICC_IAR1_EL1 and ICC_HPPIR1_EL1. For ICC_IAR1_EL1 register, it
> should return 1022 if the intid has super priority. And for ICC_NMIAR1_EL1
> register, it should return 1023 if the intid do not have super priority.
> Howerever, these are not necessary for ICC_HPPIR1_EL1 register.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   hw/intc/arm_gicv3_cpuif.c | 46 ++++++++++++++++++++++++++++++++++++---
>   hw/intc/gicv3_internal.h  |  1 +
>   2 files changed, 44 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index e1a60d8c15..f5bf8df32b 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -1097,7 +1097,8 @@ static uint64_t icc_hppir0_value(GICv3CPUState *cs, CPUARMState *env)
>       return cs->hppi.irq;
>   }
>   
> -static uint64_t icc_hppir1_value(GICv3CPUState *cs, CPUARMState *env)
> +static uint64_t icc_hppir1_value(GICv3CPUState *cs, CPUARMState *env,
> +                                 bool is_nmi, bool is_hppi)
>   {
>       /* Return the highest priority pending interrupt register value
>        * for group 1.
> @@ -1108,6 +1109,16 @@ static uint64_t icc_hppir1_value(GICv3CPUState *cs, CPUARMState *env)
>           return INTID_SPURIOUS;
>       }
>   
> +    if (!is_hppi) {
> +        if (is_nmi && (!cs->hppi.superprio)) {
> +            return INTID_SPURIOUS;
> +        }
> +
> +        if ((!is_nmi) && cs->hppi.superprio) {
> +            return INTID_NMI;
> +        }
> +    }
> +
>       /* Check whether we can return the interrupt or if we should return
>        * a special identifier, as per the CheckGroup1ForSpecialIdentifiers
>        * pseudocode. (We can simplify a little because for us ICC_SRE_EL1.RM
> @@ -1168,7 +1179,30 @@ static uint64_t icc_iar1_read(CPUARMState *env, const ARMCPRegInfo *ri)
>       if (!icc_hppi_can_preempt(cs)) {
>           intid = INTID_SPURIOUS;
>       } else {
> -        intid = icc_hppir1_value(cs, env);
> +        intid = icc_hppir1_value(cs, env, false, false);
> +    }
> +
> +    if (!gicv3_intid_is_special(intid)) {
> +        icc_activate_irq(cs, intid);
> +    }
> +
> +    trace_gicv3_icc_iar1_read(gicv3_redist_affid(cs), intid);
> +    return intid;
> +}

This is incorrect.  For icc_iar1_read, you need something like

     if (!is_hppi
         && cs->hppi.superprio
         && env->cp15.sctlr_el[current_el] & SCTLR_NMI) {
         return INTID_NMI;
     }

I think that if SCTLR_NMI is not set, the whole system ignores Superpriority entirely, so 
returning SPURIOUS here would be incorrect.  This would make sense, letting an OS that is 
not configured for FEAT_NMI to run on ARMv8.8 hardware without modification.


> +
> +static uint64_t icc_nmiar1_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    GICv3CPUState *cs = icc_cs_from_env(env);
> +    uint64_t intid;
> +
> +    if (icv_access(env, HCR_IMO)) {
> +        return icv_iar_read(env, ri);
> +    }
> +
> +    if (!icc_hppi_can_preempt(cs)) {
> +        intid = INTID_SPURIOUS;
> +    } else {
> +        intid = icc_hppir1_value(cs, env, true, false);

Here... believe that the result *should* only consider superpriority.  I guess SPURIOUS is 
the correct result when there is no pending interrupt with superpriority?  It's really 
unclear to me from the register description.

Peter?

> @@ -2344,6 +2378,12 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
>         .access = PL1_R, .accessfn = gicv3_irq_access,
>         .readfn = icc_iar1_read,
>       },
> +    { .name = "ICC_NMIAR1_EL1", .state = ARM_CP_STATE_BOTH,
> +      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 9, .opc2 = 5,
> +      .type = ARM_CP_IO | ARM_CP_NO_RAW,
> +      .access = PL1_R, .accessfn = gicv3_irq_access,
> +      .readfn = icc_nmiar1_read,
> +    },

This register is UNDEFINED if FEAT_GICv3_NMI is not implemented.
You need to register this separately.


r~
