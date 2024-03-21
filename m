Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp384439ejv;
        Thu, 21 Mar 2024 03:00:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWlvXyS83+ZmgG0/5zK8MXWwH9XXMpYxjKSbDl4WKUzX2yiEY/yJd9QN4KrPDLXwVY+OAoYGbO6cstP8+we/vwxpG7uEjc4
X-Google-Smtp-Source: AGHT+IFLtgBhBmySrcqEqDo+olSdT/wh9mHYUMC9jPeT3FmVdVtahv5Ovrq4AZpNVClgc2y7vEko
X-Received: by 2002:a0c:edc8:0:b0:690:b887:901a with SMTP id i8-20020a0cedc8000000b00690b887901amr7080302qvr.48.1711015218983;
        Thu, 21 Mar 2024 03:00:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711015218; cv=none;
        d=google.com; s=arc-20160816;
        b=DTa5VcHQE0RtcLWsqZTDj4Bdy0Obw5kzy8ln2fxNp9/etZBn8tMvf5RZUqRkgqhsDI
         hXi00nFJ4iP/YmbYQLBq5KPVlXslF1jyFCILP9+cwSFIoNMEotlXzV8VnHwF2YeYvxG2
         HrtrzwkJoGDsRxu4bqF5WPpjLpTrK5BwDfH8J8qV94hwi+UQMWzdmRti57Jv8W52W1RB
         bwo1iEDU2mVddmzJiYS5AYyrFpTtNoHUzGpOhmnI69bHT8PnjM/+JwuHC1kRrgjUjT6n
         1Pn9rex/fWWmYnGqCo4NXqo3c2vtDN/DVWmZd8TIXSPdzR1zCKWuu8m2r7rSN2WB3glP
         D52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=VoKRH/EywjLkbCKh6mWJyNVhDWMOYCJQkBm9THdcC9Y=;
        fh=+E87pD+wrwug4KuMusO6MPhF9Vdp1kVoYeYtLXyQqeU=;
        b=zbubmgl3laXNC2FP9Q9HszkJqlybNJPngZxcB58F2k3B+JqnfgowdiEvS5tKRKYsJ7
         HlzQMKIVRB+YTqe+MhXLD14OiopodB2WBGgdHOdkUAAio7DpOiHsbnyydyFvbz7avOr1
         752gsgkMObazqpVHJz4s4lYCRd/tfXhs87Zobm3KO/dkCCBOOz2PkhTObuMvDmjn973N
         iQ9fn13B3+1DM4xcNc5AKELjsvEs/hD6P9d2TtSotVn4kXCktv5rCEUH7BDIYowtuSKk
         OjHto71vdz4Ai2JSpiIESROMJBm0fDgBw822Ty3Keh5iYXX+BGX5//lvz8+Y1Q3z9wBC
         pqjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mf4ec/Yy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6-20020ad45b86000000b00695e33f6d9csi9953465qvp.185.2024.03.21.03.00.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2024 03:00:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mf4ec/Yy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnFDY-0005Da-93; Thu, 21 Mar 2024 06:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnFDV-0005CA-4r
 for qemu-arm@nongnu.org; Thu, 21 Mar 2024 06:00:09 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnFDQ-0006tn-8Q
 for qemu-arm@nongnu.org; Thu, 21 Mar 2024 06:00:08 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56bcbf6bac9so182625a12.3
 for <qemu-arm@nongnu.org>; Thu, 21 Mar 2024 03:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711015202; x=1711620002; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VoKRH/EywjLkbCKh6mWJyNVhDWMOYCJQkBm9THdcC9Y=;
 b=mf4ec/YyNHpAnho/F2RIV5ASkJk5bXDVvEXGhAkfrWbJUd6TKMnzS4sn9UJ4ce3Rag
 Nq7tkBVhwuOYD29NVJjMKHLe0ecrR9EsN37VMP6zxDKuvDCJvCauTvKT0/SfVGcZmy//
 J6biilZ9wOPo3Y96a1rATngkPCRElaENkiwyLOKtsloCK+LqPMTzXuutEFZtN//YZ4L0
 +rNS5lSaqBqKAtwOZ7gCTfrahYKm2JiqGM8YWVriiPNaT5W9/kluP2uoTZtv0y79WTdx
 vU5Q4oLSXX8CZeFaxIoF9+51Txy7lx2WmdwthGlg5sCSnkJmBox2Lf5sBtsT4KcvYcGw
 wVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711015202; x=1711620002;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VoKRH/EywjLkbCKh6mWJyNVhDWMOYCJQkBm9THdcC9Y=;
 b=l3GDplQizjjCP1Xz8/BFLGsxTJNHWHP1R7M1HhPAXSj7KLWZwC6YFZNN9mtDwChLio
 a/dUaHGg7u9emCP0dyh2nx8X1khGi6li+Q+nYSfUKiHwlOUzUj5uk8F8/VIYuMSToaSN
 xqRGaIcI2QLjrT48g/HPapEcZo765FDHL3rhP+Lng6DgtzScz3KZLN+NwXKRbDtWhKLq
 Y+EC1s809h/qhmVdYUf68Ehcq+09FBeGMBOtIaRjKr2s9oUoBfrwhGGb/FFyiuChBpPW
 n8zv+ihOvcI9h7CD0XIP3JD8l7gPRrVKt2Gya0AOLNUqMGccx9igeXRN24JAOFLCWy6U
 1SWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfT59ldsZRS1st6vWORoMXSawhhKWM/wMTkJNRdOwJJcbWHX/z6ru6pRukfQ5P6lH0dFSnAZ44EyUVSm9hEvCeR8l0
X-Gm-Message-State: AOJu0YywoWKycpVNqsI918d0DrWVmYEJVqD00zlcGiv1ywt4bHJRRDiS
 WqGYt3LlB12cX60HOovNB9J+Us7WhwyUF0vVNMBN8b5FYe5H6wxQIyZWHZIkDJ1yOpIwGm93mCO
 dykWbsSDEao0dQNGSF83EAEwVfMY3lFKCS+IrGQ==
X-Received: by 2002:a50:d6cb:0:b0:568:b5d3:2b89 with SMTP id
 l11-20020a50d6cb000000b00568b5d32b89mr1464840edj.31.1711015202388; Thu, 21
 Mar 2024 03:00:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240318093546.2786144-1-ruanjinjie@huawei.com>
 <20240318093546.2786144-7-ruanjinjie@huawei.com>
 <CAFEAcA_xSHAJnn0_O9=zGo9u8omzhuB_WvuMo9gf7wKt8OVDmw@mail.gmail.com>
 <90475c65-f148-9f49-8c5b-ea55137e1a6f@huawei.com>
In-Reply-To: <90475c65-f148-9f49-8c5b-ea55137e1a6f@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Mar 2024 09:59:51 +0000
Message-ID: <CAFEAcA-3O2p3MPMGbV3TBAzjrWncSp7XzE+N4KV_Y7wS1RmRoQ@mail.gmail.com>
Subject: Re: [RFC PATCH v8 06/23] target/arm: Add support for Non-maskable
 Interrupt
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
X-TUID: 4Fm7vlGBWBoa

On Thu, 21 Mar 2024 at 09:27, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
>
>
> On 2024/3/20 1:28, Peter Maydell wrote:
> > On Mon, 18 Mar 2024 at 09:37, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> >>
> >> This only implements the external delivery method via the GICv3.
> >>
> >> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> >> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >> v8:
> >> - Fix the rcu stall after sending a VNMI in qemu VM.
> >> v7:
> >> - Add Reviewed-by.
> >> v6:
> >> - env->cp15.hcr_el2 -> arm_hcr_el2_eff().
> >> - env->cp15.hcrx_el2 -> arm_hcrx_el2_eff().
> >> - Not include VF && VFNMI in CPU_INTERRUPT_VNMI.
> >> v4:
> >> - Accept NMI unconditionally for arm_cpu_has_work() but add comment.
> >> - Change from & to && for EXCP_IRQ or EXCP_FIQ.
> >> - Refator nmi mask in arm_excp_unmasked().
> >> - Also handle VNMI in arm_cpu_exec_interrupt() and arm_cpu_set_irq().
> >> - Rename virtual to Virtual.
> >> v3:
> >> - Not include CPU_INTERRUPT_NMI when FEAT_NMI not enabled
> >> - Add ARM_CPU_VNMI.
> >> - Refator nmi mask in arm_excp_unmasked().
> >> - Test SCTLR_ELx.NMI for ALLINT mask for NMI.
> >> ---
> >>  target/arm/cpu-qom.h   |  4 +-
> >>  target/arm/cpu.c       | 85 +++++++++++++++++++++++++++++++++++++++---
> >>  target/arm/cpu.h       |  4 ++
> >>  target/arm/helper.c    |  2 +
> >>  target/arm/internals.h |  9 +++++
> >>  5 files changed, 97 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
> >> index 8e032691db..e0c9e18036 100644
> >> --- a/target/arm/cpu-qom.h
> >> +++ b/target/arm/cpu-qom.h
> >> @@ -36,11 +36,13 @@ DECLARE_CLASS_CHECKERS(AArch64CPUClass, AARCH64_CPU,
> >>  #define ARM_CPU_TYPE_SUFFIX "-" TYPE_ARM_CPU
> >>  #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
> >>
> >> -/* Meanings of the ARMCPU object's four inbound GPIO lines */
> >> +/* Meanings of the ARMCPU object's six inbound GPIO lines */
> >>  #define ARM_CPU_IRQ 0
> >>  #define ARM_CPU_FIQ 1
> >>  #define ARM_CPU_VIRQ 2
> >>  #define ARM_CPU_VFIQ 3
> >> +#define ARM_CPU_NMI 4
> >> +#define ARM_CPU_VNMI 5
> >>
> >>  /* For M profile, some registers are banked secure vs non-secure;
> >>   * these are represented as a 2-element array where the first element
> >
> >> @@ -678,13 +687,31 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
> >>          return false;
> >>      }
> >>
> >> +    if (cpu_isar_feature(aa64_nmi, env_archcpu(env)) &&
> >> +        env->cp15.sctlr_el[target_el] & SCTLR_NMI && cur_el == target_el) {
> >> +        allIntMask = env->pstate & PSTATE_ALLINT ||
> >> +                     ((env->cp15.sctlr_el[target_el] & SCTLR_SPINTMASK) &&
> >> +                      (env->pstate & PSTATE_SP));
> >> +    }
> >> +
> >>      switch (excp_idx) {
> >> +    case EXCP_NMI:
> >> +        pstate_unmasked = !allIntMask;
> >> +        break;
> >> +
> >> +    case EXCP_VNMI:
> >> +        if ((!(hcr_el2 & HCR_IMO) && !(hcr_el2 & HCR_FMO)) ||
> >> +             (hcr_el2 & HCR_TGE)) {
> >> +            /* VNMIs(VIRQs or VFIQs) are only taken when hypervized.  */
> >> +            return false;
> >> +        }
> >
> > VINMI and VFNMI aren't the same thing: do we definitely want to
> > merge them into one EXCP_VNMI ? It feels like it would be simpler
> > to keep them separate. Similarly CPU_INTERRUPT_VNMI, and
> > arm_cpu_update_vnmi() probably want VINMI and VFNMI versions.
>
> It's not like that. The VFNMI cannot be reported from the GIC, there
> will be no opportunity to call arm_cpu_update_vfnmi().

The GIC can't trigger it, but the hypervisor can by setting
the HCRX_EL2.VFNMI bit. So writes to HCRX_EL2 (and HCR_EL2)
would need to call arm_cpu_update_vfnmi().

-- PMM
