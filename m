Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp3942383ejd;
        Sun, 21 Apr 2024 19:26:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVSjJuH0W7ZhFpH9hdUJ1aDDfCru1/Q7x+vT7dxfoydY4ndhFjssqqCr0U4jiF5ZWz7xnV6Ya8F4Lrm05Vr/hrMivJ+ZrkI
X-Google-Smtp-Source: AGHT+IFBCqK9l1sUEXEzBjkA/xwEdaLcTvWehWWTs1OFCx25u3rvz+MlbtBIcP4qjxOHVaTT5F24
X-Received: by 2002:a05:620a:f0b:b0:78e:e46b:5b04 with SMTP id v11-20020a05620a0f0b00b0078ee46b5b04mr12642824qkl.44.1713752796189;
        Sun, 21 Apr 2024 19:26:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713752796; cv=none;
        d=google.com; s=arc-20160816;
        b=WOHUrBUteaq0/p3LN/8/MBKdQtqzxUuKQksbu0N36jT2eOD0zhHcAd7rGwTqXCdDMU
         pFkgBixXB9s96Qn3x87eanLEtdbP/zxx2iRV9v6OCDu2wdxlNLwcZCx67QF3KazfAgaq
         N2YW7hKoPGzq2WZNie9bkztCJqYdt9jNbCJ7Vtt+0Jo8Xa8KQBQq2CHj0yTmsn3Lkz9U
         J3pgSWOyKRatl6nEKwW00A8VYTxVoFi+0zttMOPtQm4BqNV2vwqTAb8UuzxvwMTmggcL
         T5/AvYmayimKVomd4Y1/52HTZrDa41TJeB4CgEMxvpNUAISrQ50E7ww7qYc8nudf0muc
         NBlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=2pNpfOrUHwAPQ8HxhyoMzynQNss69ALrGQSKbEKRSpo=;
        fh=/MSHAyhUJiTYoT4ekOyS/HopHNLqBW111kC/699+MBU=;
        b=zpBTRR87/pLmomgg6JQauxgoODA53zcM9s4xXmXQAMPYEtoz1idI1h5vH/cCQd0UIF
         7hhI6+YguGBl1g8ttvMGrHEyDI5cKwF85wr/lp+3lSkuTwtxyKZe4YXIqfR2mzPZ/6Yg
         ETzx6y0SB0h+OPOMKaVe9CxH0F9p+gijXmkfe5N5H/JomO2CBQV64vkVJxw9M4TKVEvp
         HSj0ImgIyfFRKGPcM3NPej/Ny4Fj8ldEzH4I9DDpspxDRMPvbOx4UZkJ/bdUvBRjHnwC
         2Mm7z1ZgSQTqUC42HYiLfhV4DePvpLGQ0iVj5qMJF8MY8jJiwRqEqO+wIAeW7q4mNR5/
         8d4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i10-20020a05620a0a0a00b0078ebc7dcb07si1938065qka.272.2024.04.21.19.26.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Apr 2024 19:26:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ryjNb-00044R-F6; Sun, 21 Apr 2024 22:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1ryjNX-00044B-UP; Sun, 21 Apr 2024 22:26:01 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1ryjNT-00056W-G1; Sun, 21 Apr 2024 22:25:58 -0400
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VN8CR0P0XzXlqV;
 Mon, 22 Apr 2024 10:22:11 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id E6B2E180072;
 Mon, 22 Apr 2024 10:25:36 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 10:25:36 +0800
Message-ID: <b293cb96-bf62-4309-2577-9bc67b251504@huawei.com>
Date: Mon, 22 Apr 2024 10:25:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v13 00/24] target/arm: Implement FEAT_NMI and
 FEAT_GICv3_NMI
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
CC: <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, 
 <wangyanan55@huawei.com>, <richard.henderson@linaro.org>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20240407081733.3231820-1-ruanjinjie@huawei.com>
 <CAFEAcA9Y02am4wfb8Ct9qz7YX_maH4VD+JD+FFc18dBg5+hv7w@mail.gmail.com>
In-Reply-To: <CAFEAcA9Y02am4wfb8Ct9qz7YX_maH4VD+JD+FFc18dBg5+hv7w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=ruanjinjie@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.237,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mYxnbUZ05qFy



On 2024/4/19 21:41, Peter Maydell wrote:
> On Sun, 7 Apr 2024 at 09:19, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>>
>> This patch set implements FEAT_NMI and FEAT_GICv3_NMI for ARMv8. These
>> introduce support for a new category of interrupts in the architecture
>> which we can use to provide NMI like functionality.
> 
> I had one last loose end I wanted to tidy up, and I got round
> to working through reading the spec about it today. This is
> the question of what the "is NMI enabled?" test should be
> in the code in arm_gicv3_cpuif.c.
> 
> The spec wording isn't always super clear, but there are several
> things here:
> 
>  * FEAT_NMI : the changes to the CPU proper which implement
>    superpriority for IRQ and FIQ, PSTATE.ALLINT, etc etc.
>  * FEAT_GICv3_NMI : the changes to the CPU interface for
>    GICv3 NMI handling. Any CPU with FEAT_NMI and FEAT_GICv3
>    must have this.
>  * NMI support in the IRI (Interrupt Routing Infrastructure,
>    i.e. all the bits of the GIC that aren't the cpuif; the
>    distributor and redistributors). Table 3-1 in the GIC spec
>    says that you can have an IRI without NMI support connected
>    to a CPU which does have NMI support. This is what the ID
>    register bit GICD_TYPER.NMI reports.

That is right. It seems reasonable for me.

> 
> At the moment this patchset conflates FEAT_GICv3_NMI and
> the NMI support in the IRI. The effect of this is that we
> allow a machine model to create a CPU with FEAT_NMI but
> without FEAT_GICv3_NMI in the cpuif, and we don't allow
> a setup where the CPU and cpuif have NMI support but the
> IRI does not. (This will actually happen with this patchset
> with the sbsa-ref machine and -cpu max, because we haven't
> (yet) made sbsa-ref enable NMI in the GIC device when the
> CPU has NMI support.)
> 
> For a Linux guest this doesn't make much difference, because
> Linux will only enable NMI support if it finds it in both
> the IRI and the CPU, but I think it would be better to
> get the enable-tests right as these can be awkward to change
> after the fact in a backwards-compatible way.
> 
> I think this is easy to fix -- we can add a new bool field
> GICv3CPUState::nmi_support which we initialize in
> gicv3_init_cpuif() if the CPU has FEAT_NMI, and make the
> checks in arm_gicv3_cpuif.c check cs->nmi_support instead
> of cs->gic->nmi_support. That looks like this squashed into
> patch 18:
> 
> diff --git a/include/hw/intc/arm_gicv3_common.h
> b/include/hw/intc/arm_gicv3_common.h
> index 88533749ebb..cd09bee3bc4 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -225,6 +225,13 @@ struct GICv3CPUState {
> 
>      /* This is temporary working state, to avoid a malloc in gicv3_update() */
>      bool seenbetter;
> +
> +    /*
> +     * Whether the CPU interface has NMI support (FEAT_GICv3_NMI). The
> +     * CPU interface may support NMIs even when the GIC proper (what the
> +     * spec calls the IRI; the redistributors and distributor) does not.
> +     */
> +    bool nmi_support;
>  };
> 
>  /*
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index 2457b7bca23..715909d0f7d 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -21,6 +21,7 @@
>  #include "hw/irq.h"
>  #include "cpu.h"
>  #include "target/arm/cpregs.h"
> +#include "target/arm/cpu-features.h"
>  #include "sysemu/tcg.h"
>  #include "sysemu/qtest.h"
> 
> @@ -839,7 +840,7 @@ static int icc_highest_active_prio(GICv3CPUState *cs)
>       */
>      int i;
> 
> -    if (cs->gic->nmi_support) {
> +    if (cs->nmi_support) {
>          /*
>           * If an NMI is active this takes precedence over anything else
>           * for priority purposes; the NMI bit is only in the AP1R0 bit.
> @@ -1285,7 +1286,7 @@ static void icc_drop_prio(GICv3CPUState *cs, int grp)
>              continue;
>          }
> 
> -        if (i == 0 && cs->gic->nmi_support && (*papr & ICC_AP1R_EL1_NMI)) {
> +        if (i == 0 && cs->nmi_support && (*papr & ICC_AP1R_EL1_NMI)) {
>              *papr &= (~ICC_AP1R_EL1_NMI);
>              break;
>          }
> @@ -1324,7 +1325,7 @@ static int icc_highest_active_group(GICv3CPUState *cs)
>       */
>      int i;
> 
> -    if (cs->gic->nmi_support) {
> +    if (cs->nmi_support) {
>          if (cs->icc_apr[GICV3_G1][0] & ICC_AP1R_EL1_NMI) {
>              return GICV3_G1;
>          }
> @@ -1787,7 +1788,7 @@ static void icc_ap_write(CPUARMState *env, const
> ARMCPRegInfo *ri,
>          return;
>      }
> 
> -    if (cs->gic->nmi_support) {
> +    if (cs->nmi_support) {
>          cs->icc_apr[grp][regno] = value & (0xFFFFFFFFU | ICC_AP1R_EL1_NMI);
>      } else {
>          cs->icc_apr[grp][regno] = value & 0xFFFFFFFFU;
> @@ -1901,7 +1902,7 @@ static uint64_t icc_rpr_read(CPUARMState *env,
> const ARMCPRegInfo *ri)
>          }
>      }
> 
> -    if (cs->gic->nmi_support) {
> +    if (cs->nmi_support) {
>          /* NMI info is reported in the high bits of RPR */
>          if (arm_feature(env, ARM_FEATURE_EL3) && !arm_is_secure(env)) {
>              if (cs->icc_apr[GICV3_G1NS][0] & ICC_AP1R_EL1_NMI) {
> @@ -2961,7 +2962,16 @@ void gicv3_init_cpuif(GICv3State *s)
>           */
>          define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
> 
> -        if (s->nmi_support) {
> +        /*
> +         * If the CPU implements FEAT_NMI and FEAT_GICv3 it must also
> +         * implement FEAT_GICv3_NMI, which is the CPU interface part
> +         * of NMI support. This is distinct from whether the GIC proper
> +         * (redistributors and distributor) have NMI support. In QEMU
> +         * that is a property of the GIC device in s->nmi_support;
> +         * cs->nmi_support indicates the CPU interface's support.
> +         */
> +        if (cpu_isar_feature(aa64_nmi, cpu)) {
> +            cs->nmi_support = true;
>              define_arm_cp_regs(cpu, gicv3_cpuif_gicv3_nmi_reginfo);
>          }
> 
> plus this squashed into patch 19:
> 
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index 20a8e1f2fe4..b1f6c16ffef 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -566,7 +566,7 @@ static void icv_ap_write(CPUARMState *env, const
> ARMCPRegInfo *ri,
> 
>      trace_gicv3_icv_ap_write(ri->crm & 1, regno,
> gicv3_redist_affid(cs), value);
> 
> -    if (cs->gic->nmi_support) {
> +    if (cs->nmi_support) {
>          cs->ich_apr[grp][regno] = value & (0xFFFFFFFFU | ICV_AP1R_EL1_NMI);
>      } else {
>          cs->ich_apr[grp][regno] = value & 0xFFFFFFFFU;
> @@ -1510,7 +1510,7 @@ static int icv_drop_prio(GICv3CPUState *cs, bool *nmi)
>              continue;
>          }
> 
> -        if (i == 0 && cs->gic->nmi_support && (*papr1 & ICV_AP1R_EL1_NMI)) {
> +        if (i == 0 && cs->nmi_support && (*papr1 & ICV_AP1R_EL1_NMI)) {
>              *papr1 &= (~ICV_AP1R_EL1_NMI);
>              *nmi = true;
>              return 0xff;
> @@ -2699,7 +2699,7 @@ static void ich_ap_write(CPUARMState *env, const
> ARMCPRegInfo *ri,
> 
>      trace_gicv3_ich_ap_write(ri->crm & 1, regno,
> gicv3_redist_affid(cs), value);
> 
> -    if (cs->gic->nmi_support) {
> +    if (cs->nmi_support) {
>          cs->ich_apr[grp][regno] = value & (0xFFFFFFFFU | ICV_AP1R_EL1_NMI);
>      } else {
>          cs->ich_apr[grp][regno] = value & 0xFFFFFFFFU;
> @@ -2821,7 +2821,7 @@ static void ich_lr_write(CPUARMState *env, const
> ARMCPRegInfo *ri,
>      }
> 
>      /* Enforce RES0 bit in NMI field when FEAT_GICv3_NMI is not implemented */
> -    if (!cs->gic->nmi_support) {
> +    if (!cs->nmi_support) {
>          value &= ~ICH_LR_EL2_NMI;
>      }
> 
> The comments and commit message for patch 24 also need tweaking,
> because they are written assuming that FEAT_GICv3_NMI means
> "NMI support in the GIC proper", not "NMI support in the cpuif".

Yes, they're different, "FEAT_GICv3_NMI" is something beside PE, that is
the cpuif.

> 
> Since those changes are not too complicated, and I made them
> locally anyway since I wanted to confirm that my plan was
> workable, my proposal is that I will apply these fixes while
> I take this series into target-arm.next for 9.1.
> 
> So I've applied this series to target-arm.next with the above
> changes (preparatory to doing a pull request tail end of next
> week once we release 9.0). Let me know if you'd prefer something
> else.
> 

Thank you! I think that is good.

> thanks
> -- PMM
