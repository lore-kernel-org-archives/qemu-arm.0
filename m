Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4055232ejv;
        Tue, 2 Apr 2024 09:06:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKt824GjdWVo+4IT5ZU3gtNLsVaw7ZqROACAVRGdVMLkQhvgNl3zavRE3/++IRYdY7Nny9OaK3A3EI2+hA7MaiqyJ2bPxj
X-Google-Smtp-Source: AGHT+IGNNVDUliVAK+qsC1X8NtkFMVcL79sZIdhZsdDcBOuaXkFXmNT33VdV8FOiI33wAKt36HVo
X-Received: by 2002:ac8:7dca:0:b0:431:74e2:9621 with SMTP id c10-20020ac87dca000000b0043174e29621mr12455346qte.67.1712073974724;
        Tue, 02 Apr 2024 09:06:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712073974; cv=none;
        d=google.com; s=arc-20160816;
        b=TNeKJKCnzg7DbqNLCn6o9VjwAD2mxGTLJZ1iKHMl8/hWL3U/5iodMMlByCoIF/qMOg
         2XG5RTRO6sEaCw6EPD8VGkhFcOpEz8YFeSRRjOfFM+hipYzOVPvUPSFW9bx0KVAOIaRy
         bZBXx/6uwY4Q/kq8Qw+FUdxNSWVq70A9wh575CVd8h34vu3GCayIegtFL1OfiiC2AxUk
         kOKowRaPLMl4ZeZiUQ0G1WIVfSE51YTIWxOUkb0SK09X64DpIfKOZ1j4wh60jGSIl0Gt
         oPN5mmJoN2OYCtY3wvtyh96zL4hchfbe699+qFYHMxUaruJG3hxKnoBZ+2bUWBxa3Tqw
         J/8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DvijPh6kNQvCoFSeIBmTJDUL1uXvuBvXdUna/OBo6/w=;
        fh=5dJ2S2rvWdImkEAtBCKsjjrc2TU0xy7FV3HXPv1oQvE=;
        b=lEsIxNdnAyoBYfunToCqPzUzJaCLiOpOPVJjjJPEsZ8HyKofU2QMrVgGeUVFqvaTum
         BpokI5FTRjnWSAvL1jwNbUfn4A/c9oHAUfNIG64KUgOD0vfFxo6pEEzNuuK7MhDQkuaM
         YmYxH/DMwru4Aw9R97sTR4JanwOW+Eatakta1R0WNH3pf3mLL7+Lb08kGc92L9jvbDJ6
         wVbZoEf3lgOJXTOwBdWWtb+jWKcEVTdQAAu4ifT1r8TliN5dqMs8WRTZVsxUWc2dAkzH
         ndX0tdXvDX0Jaw3rkXCsaJNsMIsD7AGVzC2kJQXJ2zmHm30cyuwjYVp3GaDbgPtYPLNg
         cKdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hCUkoWWG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n12-20020a05622a040c00b004312328fa27si12471461qtx.587.2024.04.02.09.06.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2024 09:06:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hCUkoWWG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrge9-0001Y8-Dv; Tue, 02 Apr 2024 12:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrge1-0001XF-LB
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 12:05:54 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rrgdx-0005bk-Se
 for qemu-arm@nongnu.org; Tue, 02 Apr 2024 12:05:53 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56c404da0ebso7772079a12.0
 for <qemu-arm@nongnu.org>; Tue, 02 Apr 2024 09:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712073947; x=1712678747; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DvijPh6kNQvCoFSeIBmTJDUL1uXvuBvXdUna/OBo6/w=;
 b=hCUkoWWGi3EDh7SphVCo9YIEOxWUd+le7eB17nglpNmPkF+lhgD2wIvfRAJFprkDaG
 WEehK38VaEamUIE1F0Ozfmi7CUSkSeXSsXeki/xxLuOfeYLjHrrXbtfm1Sm8gddP21EN
 bBVgrhx9fOtXychm1h4CI+H88MHsZELIa9Bi27i16urH51oTXqPF4SUUT0CcW3zxlqTV
 ppsGCAQCd+ypos/mpORdDgomCKHbFOrIzZojfS7BCDcmSpl83t0qLtsnsQnCJbxTWsRb
 FLXlFmp8HaC4oqmddk4FgGHw2FxgFGFFHPNZ036VBGEGNvRud7N0sq6m15PWIiG+gsmX
 1EPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712073947; x=1712678747;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DvijPh6kNQvCoFSeIBmTJDUL1uXvuBvXdUna/OBo6/w=;
 b=Fc6TCLlnlF15xmIGBLTOogJ1qtpetXiuGPkQYej/wTvM+OUMbSOa9R27tYfDW0RI7p
 W5VUzkxpA+Fd21ZcZuLfuOrML5mWsxeogWdXRzyAhhqTR+V9UjyzQR370y/majsbHxZS
 681A/GZ2fHI+lVAjbzswH9SdzCHsJoZ95IewImTNDPSfyAawGBj/0N91/YyeeVk+kS8r
 lCekYuMnoQu3R+382rGaVn0dp82Ii85YPO20LcrVzpcuSIF85/hIpp7PrbKLFRkTY96O
 +9Pj4ZxCEeoM+n6cJ/HL6L8bxzA13WTKkVWkI8waMuGD7S6Bv5wBvYjuhyWkngBBtWRQ
 eDpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQO90+hEU1L++AlDpCJaX4Qm+VaOZwNM2+Nk2L9rAKmEjkbd+vwnaSTeQasok+k/3dKFZMcBZUZ675bgB2LqJwOoHp
X-Gm-Message-State: AOJu0YzlGkGmiEl5NIA8sJSHFEqD/qcLgQgqnCFSraQ1gpXgyFLIjPtf
 9kGRGMevM28xZiCOy8TtYqHcJgQlX/sGOjqSnT1LStdkrVOFEVTLMFhmpe8eb7w/rejl589839T
 LjxYw7L8m0RaaYWAa2Sj8savP5Wnxsst3p8VzJA==
X-Received: by 2002:a05:6402:350e:b0:56c:5ab5:5fb7 with SMTP id
 b14-20020a056402350e00b0056c5ab55fb7mr10150335edd.30.1712073947080; Tue, 02
 Apr 2024 09:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240330103128.3185962-1-ruanjinjie@huawei.com>
 <20240330103128.3185962-18-ruanjinjie@huawei.com>
In-Reply-To: <20240330103128.3185962-18-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Apr 2024 17:05:35 +0100
Message-ID: <CAFEAcA9=jEY9vj0bxrLBAtrYDJwwfQH=KK6BK3n7_9GvQnqygg@mail.gmail.com>
Subject: Re: [PATCH v11 17/23] hw/intc/arm_gicv3: Add NMI handling CPU
 interface registers
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: zXmgSOvAViKp

On Sat, 30 Mar 2024 at 10:34, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> Add the NMIAR CPU interface registers which deal with acknowledging NMI.
>
> When introduce NMI interrupt, there are some updates to the semantics for the
> register ICC_IAR1_EL1 and ICC_HPPIR1_EL1. For ICC_IAR1_EL1 register, it
> should return 1022 if the intid has non-maskable property. And for
> ICC_NMIAR1_EL1 register, it should return 1023 if the intid do not have
> non-maskable property. Howerever, these are not necessary for ICC_HPPIR1_EL1
> register.
>
> And the APR and RPR has NMI bits which should be handled correctly.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I have a few more comments below but otherwise I think this
patch is looking OK.


> @@ -898,12 +922,24 @@ static bool icc_hppi_can_preempt(GICv3CPUState *cs)
>       */
>      int rprio;
>      uint32_t mask;
> +    ARMCPU *cpu = ARM_CPU(cs->cpu);
> +    CPUARMState *env = &cpu->env;
>
>      if (icc_no_enabled_hppi(cs)) {
>          return false;
>      }
>
> -    if (cs->hppi.prio >= cs->icc_pmr_el1) {
> +    if (cs->gic->nmi_support && cs->hppi.nmi) {

If cs->hppi.nmi is set then nmi_support must be true, as we won't
ever set hppi.nmi if the GIC doesn't have NMI support (because the
registers where the guest can set the NMI bit will not be writeable
and so the nmi bits will always be zero). Elsewhere in the code
we assume this (eg in icc_iar1_read() below), so I think we can
also assume it here.

> +        if (!(cs->gic->gicd_ctlr & GICD_CTLR_DS) &&
> +            cs->hppi.grp == GICV3_G1NS) {
> +            if (cs->icc_pmr_el1 < 0x80) {
> +                return false;
> +            }
> +            if (arm_is_secure(env) && cs->icc_pmr_el1 == 0x80) {
> +                return false;
> +            }
> +        }
> +    } else if (cs->hppi.prio >= cs->icc_pmr_el1) {
>          /* Priority mask masks this interrupt */
>          return false;
>      }
> @@ -923,6 +959,18 @@ static bool icc_hppi_can_preempt(GICv3CPUState *cs)
>          return true;
>      }
>
> +    if (cs->gic->nmi_support && cs->hppi.nmi &&
> +        (cs->hppi.prio & mask) == (rprio & mask)) {
> +        if ((cs->hppi.grp == GICV3_G1NS) &&
> +            !(cs->icc_apr[GICV3_G1NS][0] & ICC_AP1R_EL1_NMI)) {
> +            return true;
> +        }
> +        if ((cs->hppi.grp == GICV3_G1) &&
> +            !(cs->icc_apr[GICV3_G1][0] & ICC_AP1R_EL1_NMI)) {
> +            return true;
> +        }

You can write this part a bit more concisely:

           if (!(cs->icc_apr[cs->hppi.grp][0] & ICC_AP1R_EL1_NMI)) {
               return true;
           }

rather than writing out the G1 and G1NS cases separately.

> +    }
> +
>      return false;
>  }

> @@ -1159,13 +1212,16 @@ static uint64_t icc_iar0_read(CPUARMState *env, const ARMCPRegInfo *ri)
>  static uint64_t icc_iar1_read(CPUARMState *env, const ARMCPRegInfo *ri)
>  {
>      GICv3CPUState *cs = icc_cs_from_env(env);
> +    int el = arm_current_el(env);
>      uint64_t intid;
>
>      if (icv_access(env, HCR_IMO)) {
>          return icv_iar_read(env, ri);
>      }
>
> -    if (!icc_hppi_can_preempt(cs)) {
> +    if (cs->hppi.nmi && env->cp15.sctlr_el[el] & SCTLR_NMI) {
> +        intid = INTID_NMI;
> +    } else if (!icc_hppi_can_preempt(cs)) {
>          intid = INTID_SPURIOUS;
>      } else {
>          intid = icc_hppir1_value(cs, env);

This is the wrong order -- the cases where icc_hppi_can_preempt()
returns false need to take priority over the case where we return
INTID_NMI. You can get that by structuring it similarly to the
pseudocode:

    if (!icc_hppi_can_preempt(cs)) {
        intid = INTID_SPURIOUS;
    } else {
        intid = icc_hppir1_value(cs, env);
    }

    if (!gicv3_intid_is_special(intid)) {
        if (cs->hppi.nmi && env->cp15.sctlr_el[el] & SCTLR_NMI) {
            intid = INTID_NMI;
        } else {
            icc_activate_irq(cs, intid);
        }
    }

> @@ -1803,6 +1901,22 @@ static uint64_t icc_rpr_read(CPUARMState *env, const ARMCPRegInfo *ri)
>          }
>      }
>
> +    if (cs->gic->nmi_support) {
> +        /* NMI info is reported in the high bits of RPR */
> +        if (arm_feature(env, ARM_FEATURE_EL3) && !arm_is_secure(env)) {
> +            if (cs->icc_apr[GICV3_G1NS][0] & ICC_AP1R_EL1_NMI) {
> +                prio |= ICC_RPR_EL1_NSNMI;

This should be ICC_RPR_EL1_NMI. Compare the pseudocode for ICC_RPR_EL1:
in the EL3-nonsecure case we set pPriority<63>.

> +            }
> +        } else {
> +            if (cs->icc_apr[GICV3_G1NS][0] & ICC_AP1R_EL1_NMI) {
> +                prio |= ICC_RPR_EL1_NSNMI;
> +            }
> +            if (cs->icc_apr[GICV3_G1][0] & ICC_AP1R_EL1_NMI) {
> +                prio |= ICC_RPR_EL1_NMI;
> +            }
> +        }
> +    }
> +
>      trace_gicv3_icc_rpr_read(gicv3_redist_affid(cs), prio);
>      return prio;
>  }

thanks
-- PMM
