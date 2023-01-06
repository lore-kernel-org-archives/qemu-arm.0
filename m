Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp413960ejc;
        Fri, 6 Jan 2023 08:38:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXupE937Gu2QqRZxzGvlJ5eXkguzF40hb+FkLWVeFZnhJ/5FP5wBpaPauqJYbgfArE2t8TCU
X-Received: by 2002:a0c:e394:0:b0:531:8132:4c58 with SMTP id a20-20020a0ce394000000b0053181324c58mr61329767qvl.5.1673023127289;
        Fri, 06 Jan 2023 08:38:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673023127; cv=none;
        d=google.com; s=arc-20160816;
        b=Z+T0/2cXa20q1t4w2trKPyVsounbwIGQWg20I2MTXKZpteWHVD2kKQkXkG/2Gjy3Y5
         vBUvmeLO1iqQpbR5QRIgWGMBQElFKJz15nQ1rG31T3PSlNcpv1IUsZpYM0YDelYrCVys
         HwaWhd0yCKamx/pKCtKl1GOVYIoSnoetYL1X1/T+5IjlonZCM12NIm3mO8+Xrr1VDnPh
         AtaRmDLlmuL1E0CsYSPnminlkyq8wBkqzfWlbS+W//FjyLwW3CYKVUp+iffhjD3q/Yfd
         cpCm4x3MOzQHlNIglVX4c9PZdrAQccjO0Mops5qc6wdPoHJGOLYidWWTsy8zNROoQQ7Z
         7sSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ZnMcY2Ouym7/EXDLo44h2SAEPrFtaGI0tmRFNuUqLII=;
        b=ZWZh9zXzaJdUBS/ADB2LFo9+hjqnXJP/FU14OsA3BYJP7t8O7aUKl/NjedMirnoEp0
         aozg5zN9aCPpjIjaC7YiVemHE+ytFKd0SxKggA4xnIBRglaORB2qTkynyLT3g5b+uUcs
         oBSfdt82dWSEdbNo4fw/KP/eUgsDmYh/ei1xiaItMmLBZQD6NJj3rHy6BDSEunOFkEW1
         HMcrSmKPaDTWSBhaURTkaJxobktRbCbIGMUCglB3/KJnp52CpqRvaPK6AF2Lh/xsW+Qp
         BmhzsswkYwh+Wrl2M0jQmkTuuVNaWmXp2pVj5yL5hjGHTLilQeabl+BdZjpsadLR3s7y
         bAzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cSQybS+D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gw11-20020a0562140f0b00b005320d725ba2si978751qvb.558.2023.01.06.08.38.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Jan 2023 08:38:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cSQybS+D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDpjI-000714-GT; Fri, 06 Jan 2023 11:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDpjH-00070T-7c
 for qemu-arm@nongnu.org; Fri, 06 Jan 2023 11:38:03 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDpjF-0006iW-Il
 for qemu-arm@nongnu.org; Fri, 06 Jan 2023 11:38:03 -0500
Received: by mail-pg1-x52c.google.com with SMTP id h192so1487439pgc.7
 for <qemu-arm@nongnu.org>; Fri, 06 Jan 2023 08:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZnMcY2Ouym7/EXDLo44h2SAEPrFtaGI0tmRFNuUqLII=;
 b=cSQybS+DoKFvPoLnlC0V9ev4gtIqhyX4kgfanJn+5WlPttYju7xyomMV7M5Qf9uNDz
 pI+G/q7v7EN5mcqnUWZA4TmpERIEBWM2oz2XtY3HmZfsM8sphxJxuc9cq08JmpPt8qVl
 IyhupQGQ4Mzw8XM7Az3nyDlBA9WdoVCytsu945nUn+5tuHNS95FZ6CnG9Mwh7TyAb9dQ
 z8NjB/7vyJjx69S95QI/eCmczhU5F/4eq3fhWtYJBccOGvrtWzl6Va68LyZoA9BUMjEV
 rke0DB32huX0ta3g+R4gilG5G97epH0TSIZKmksJx2vWypxvmkNDM1fCZxpInVdRHApZ
 rmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZnMcY2Ouym7/EXDLo44h2SAEPrFtaGI0tmRFNuUqLII=;
 b=B+39OAHS6tDVADgWzEZtWeAf0Lu/yaNMS9uVof5v0nkkk8UqO0jh/eW/w3mjx2K19Q
 dSBkoaVRvq66+IQ8cWFwGw7DXauyBWhytWJytSEYBWJ4nHJCXNPVqpgBD39EkkyzZbXU
 pWXJKH3C7qkWbm3HpgTp3RoPaMDBwpfqPrj75iIgAWAbIsVEHusHWFk0/inX8DgyebBM
 4MCbFxb6cL7gzHJ3ftIDwUp0TrUsmOq0QwypI07G9Eorz4xALQX0PWxIAXrd6UOpw3/q
 kOnLFBc89SF0t6O4iUAaXWgjoTzNbp+kZaVQXDYUgyFFbgdKmbH2qVpgx9h7xd/wq+Po
 FfKw==
X-Gm-Message-State: AFqh2ko9gxuvgTrQcXEgAcKXYBATSJh6hNsvqJjP1QZfS2vwWkuteIci
 0Ky7p0fd5Rb2W0yB3utTxvBwfO/bxg1tkZ6P4PhhWg==
X-Received: by 2002:a63:3d4:0:b0:492:50dc:da4d with SMTP id
 203-20020a6303d4000000b0049250dcda4dmr2568544pgd.192.1673023079906; Fri, 06
 Jan 2023 08:37:59 -0800 (PST)
MIME-Version: 1.0
References: <20221219220808.26392-1-agraf@csgraf.de>
In-Reply-To: <20221219220808.26392-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 16:37:48 +0000
Message-ID: <CAFEAcA-bp_r07s7VQDMbWm=f1iV0rfB8XsZUUqpxENnn5fTe+g@mail.gmail.com>
Subject: Re: [PATCH] hvf: arm: Add support for GICv3
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Dzr0ZeV6o0of

On Mon, 19 Dec 2022 at 22:08, Alexander Graf <agraf@csgraf.de> wrote:
>
> We currently only support GICv2 emulation. To also support GICv3, we will
> need to pass a few system registers into their respective handler functions.
>
> This patch adds support for HVF to call into the TCG callbacks for GICv3
> system register handlers. This is safe because the GICv3 TCG code is generic
> as long as we limit ourselves to EL0 and EL1 - which are the only modes
> supported by HVF.
>
> To make sure nobody trips over that, we also annotate callbacks that don't
> work in HVF mode, such as EL state change hooks.
>
> With GICv3 support in place, we can run with more than 8 vCPUs.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  hw/intc/arm_gicv3_cpuif.c   |   8 +-
>  target/arm/hvf/hvf.c        | 151 ++++++++++++++++++++++++++++++++++++
>  target/arm/hvf/trace-events |   2 +
>  3 files changed, 160 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index b17b29288c..b4e387268c 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -21,6 +21,7 @@
>  #include "hw/irq.h"
>  #include "cpu.h"
>  #include "target/arm/cpregs.h"
> +#include "sysemu/tcg.h"
>
>  /*
>   * Special case return value from hppvi_index(); must be larger than
> @@ -2810,6 +2811,8 @@ void gicv3_init_cpuif(GICv3State *s)
>           * which case we'd get the wrong value.
>           * So instead we define the regs with no ri->opaque info, and
>           * get back to the GICv3CPUState from the CPUARMState.
> +         *
> +         * These CP regs callbacks can be called from either TCG or HVF code.
>           */
>          define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
>
> @@ -2905,6 +2908,9 @@ void gicv3_init_cpuif(GICv3State *s)
>                  define_arm_cp_regs(cpu, gicv3_cpuif_ich_apxr23_reginfo);
>              }
>          }
> -        arm_register_el_change_hook(cpu, gicv3_cpuif_el_change_hook, cs);
> +        if (tcg_enabled()) {
> +            /* We can only trap EL changes with TCG for now */

We could expand this a bit:

 We can only trap EL changes with TCG. However the GIC interrupt
 state only changes on EL changes involving EL2 or EL3, so for
 the non-TCG case this is OK, as EL2 and EL3 can't exist.

and assert:
 assert(!arm_feature(&cpu->env, ARM_FEATURE_EL2));
 assert(!arm_feature(&cpu->env, ARM_FEATURE_EL3));

> +static uint32_t hvf_reg2cp_reg(uint32_t reg)
> +{
> +    return ENCODE_AA64_CP_REG(CP_REG_ARM64_SYSREG_CP,
> +                              (reg >> 10) & 0xf,
> +                              (reg >> 1) & 0xf,
> +                              (reg >> 20) & 0x3,
> +                              (reg >> 14) & 0x7,
> +                              (reg >> 17) & 0x7);

This file has #defines for these shift and mask constants
(SYSREG_OP0_SHIFT etc).

> +}
> +
> +static bool hvf_sysreg_read_cp(CPUState *cpu, uint32_t reg, uint64_t *val)
> +{
> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
> +    CPUARMState *env = &arm_cpu->env;
> +    const ARMCPRegInfo *ri;
> +
> +    ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_reg2cp_reg(reg));
> +    if (ri) {
> +        if (ri->accessfn) {
> +            if (ri->accessfn(env, ri, true) != CP_ACCESS_OK) {
> +                return false;
> +            }
> +        }
> +        if (ri->type & ARM_CP_CONST) {
> +            *val = ri->resetvalue;
> +        } else if (ri->readfn) {
> +            *val = ri->readfn(env, ri);
> +        } else {
> +            *val = CPREG_FIELD64(env, ri);
> +        }
> +        trace_hvf_vgic_read(ri->name, *val);
> +        return true;
> +    }

Can we get here for attempts by EL0 to access EL1-only
sysregs, or does hvf send the exception to EL1 without
trapping out to us? If we can get here for EL0 accesses we
need to check against ri->access as well as ri->accessfn.

Otherwise looks OK.

thanks

-- PMM
