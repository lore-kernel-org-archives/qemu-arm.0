Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1595580ejb;
        Mon, 7 Aug 2023 10:05:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOZdJOXWDmLMrHSHB19iThLk/qa0ijK2GhD5/yK783tq6XIeWp1BRi/FQN6IOnMCIDuESS
X-Received: by 2002:a05:622a:3cf:b0:403:eb5b:1f6 with SMTP id k15-20020a05622a03cf00b00403eb5b01f6mr13536673qtx.63.1691427950623;
        Mon, 07 Aug 2023 10:05:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691427950; cv=none;
        d=google.com; s=arc-20160816;
        b=o7M2iUKLNqxGbjq6/oVs3PpCm2PaCHTvDtxKFEzRkXPNpBgboxOaoI/vDtvHWla5Mj
         wRYOeRFHodrxzJDu8Hw2juSaAeJhM0bhsMkMPaxHy6551Q0bE7iAX5hOFrboWL6/1tpg
         dK5oWPR3PacelSK13ML3Ui+SwtisTstBpVd3Q2CHQTw7NnF5KOnDMdX1Q1a6+Z2YYZ43
         9lRRlH66GrEi0rh54GcbPBiXWvciO2MS+M4FWXuNatYk4y2suipnaUdsyCGSN2uuQxFQ
         L8sEUjoAY7GSW8IOofpwwFX/KptAQjimAkJo6QpBGIPVWWFjbmqs4zk/XZQgCY1uDamY
         JS9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8Eb2iwDQi8uXQ7Vs6C6LMdZHQVqkmTYON29HiT8SG6I=;
        fh=CEa3UdY0L+UQ/2T/5R8rkDkdq4jlW1F1hWJjDNQD42w=;
        b=pSfFhoiii4OCM8QzbwhBEg6TKLd+rxDfaCiC1t+F6PF/AwTGDQOd3KyqQtXLmlcVKc
         m9BWR4JS3rBSRD+ji0rGzLzlWawdy27embwWb8uStUlf64MUawe0zh/nlzx/uUGCALOh
         vUpAkdARttR41Q+R4fCc80ZIpYCSK2BEQFjyTpEgcnbZZNWpCB43ytip4s9Re8igQSG/
         P/MnvIU770um6jW8VHvusuSrrPzqJQA6mij+AoYj47u5GIxNrWsyalbNbeYCflOp0P0U
         2LSNDJyduTmBnm4onx/KxLE9Ez1fxV0CR6nL5d2WZ2Ab12bBDS8+q6Mize+lIx3BPB+L
         ZhBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oTNZI5CX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9-20020ac85c09000000b0040fd2436deesi5102855qti.283.2023.08.07.10.05.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 10:05:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oTNZI5CX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qT3fb-0000DF-39; Mon, 07 Aug 2023 13:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT3fW-0000CH-8U
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 13:05:23 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qT3fU-0008Of-B5
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 13:05:21 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5230ac6dbc5so6424077a12.3
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 10:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691427918; x=1692032718;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8Eb2iwDQi8uXQ7Vs6C6LMdZHQVqkmTYON29HiT8SG6I=;
 b=oTNZI5CXXn+WmFclgMsKMU+3W4Pstq9uAJBL3Spsz/tQ097Zb9UTOanWQ1a0F5NnLA
 OYPRaLpuhyD2oMGYr/v1RvnJF0wedjWml5IjO1uHt7PA7DYUiNUJFhypWK9Wb8tnw+Ci
 WOgKbMps1Z1MZRxvw7FPWktA1FUOKEfv2FbK9rubJ1pQHO/P7308Dz3+I0ZNK84sSSE/
 NDxgt/jAf18MDiyAEaJ9kUYyAI58R2e9516Co/tpuNKyXHFJd3dbnvnrEdj/VApL1SQn
 sFScLbssEGGTcXph5Ee2pZFLiXLsiJdZp4DsUPzfSarfUmgwTQTTzLANgzq1Eoommy6q
 /Pdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691427918; x=1692032718;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Eb2iwDQi8uXQ7Vs6C6LMdZHQVqkmTYON29HiT8SG6I=;
 b=bclAaHSRvnG6CiVjZgHWDdftZdgrclnrcdv/3+0wcPRooW3wjYEFV8XM5kvIDZZ+ek
 qS7xs22uASJmiyNQq3xAuZuE6VDEN79B0XeGu2IZ86unigOnZBEQjou6hIV9sH8KA5dr
 W6lu6ANw2648RMxJng0xwRV+HYjsH58nUEkcxWliAoE5fZmGBzTb75hEvNKSOap+uRje
 KXw+r8iAqiPlawr57BIxulABDAMiRXbc8vKfpbMVdR5yaCdP13nfpxE3qOSOV6Bnctpi
 1iXGbdsgGsh36EBtWughXtrHQZj85hGz4gcqT3qxm3u+z76l8eElq+VhaU2pFNIRWQgM
 hK2w==
X-Gm-Message-State: AOJu0YzfVlSGRRxDIp31wmYM/RTKGW0Oq2xu4RSNBUg4XXEyq205Smfk
 8GCZBtQRNUhtyKsXzCQRosdmYP/xpqtFJzjongLJeQ==
X-Received: by 2002:aa7:d6cd:0:b0:522:21a1:5153 with SMTP id
 x13-20020aa7d6cd000000b0052221a15153mr9250367edr.11.1691427918579; Mon, 07
 Aug 2023 10:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230802170157.401491-1-jean-philippe@linaro.org>
 <20230802170157.401491-7-jean-philippe@linaro.org>
In-Reply-To: <20230802170157.401491-7-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Aug 2023 18:05:07 +0100
Message-ID: <CAFEAcA9rt7tfsjWitQA1HN5cY3y_8FjDNN=p07jB4B3WRdEZrw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] target/arm/helper: Implement
 CNTHCTL_EL2.CNT[VP]MASK
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
X-TUID: kZbK+gL065sM

On Wed, 2 Aug 2023 at 18:02, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> When FEAT_RME is implemented, these bits override the value of
> CNT[VP]_CTL_EL0.IMASK in Realm and Root state. Move the IRQ state update
> into a new gt_update_irq() function and test those bits every time we
> recompute the IRQ state.
>
> Since we're removing the IRQ state from some trace events, add a new
> trace event for gt_update_irq().
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  target/arm/cpu.h        |  3 +++
>  target/arm/helper.c     | 54 ++++++++++++++++++++++++++++++++---------
>  target/arm/trace-events |  7 +++---
>  3 files changed, 50 insertions(+), 14 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index bcd65a63ca..bedc7ec6dc 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1743,6 +1743,9 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
>  #define HSTR_TTEE (1 << 16)
>  #define HSTR_TJDBX (1 << 17)
>
> +#define CNTHCTL_CNTVMASK      (1 << 18)
> +#define CNTHCTL_CNTPMASK      (1 << 19)
> +
>  /* Return the current FPSCR value.  */
>  uint32_t vfp_get_fpscr(CPUARMState *env);
>  void vfp_set_fpscr(CPUARMState *env, uint32_t val);
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 77dd80ad28..68e915ddda 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2608,6 +2608,28 @@ static uint64_t gt_get_countervalue(CPUARMState *env)
>      return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) / gt_cntfrq_period_ns(cpu);
>  }
>
> +static void gt_update_irq(ARMCPU *cpu, int timeridx)
> +{
> +    CPUARMState *env = &cpu->env;
> +    uint64_t cnthctl = env->cp15.cnthctl_el2;
> +    ARMSecuritySpace ss = arm_security_space(env);
> +    /* ISTATUS && !IMASK */
> +    int irqstate = (env->cp15.c14_timer[timeridx].ctl & 6) == 4;
> +
> +    /*
> +     * If bit CNTHCTL_EL2.CNT[VP]MASK is set, it overrides IMASK.
> +     * It is RES0 in Secure and NonSecure state.
> +     */
> +    if ((ss == ARMSS_Root || ss == ARMSS_Realm) &&
> +        ((timeridx == GTIMER_VIRT && (cnthctl & CNTHCTL_CNTVMASK)) ||
> +         (timeridx == GTIMER_PHYS && (cnthctl & CNTHCTL_CNTPMASK)))) {
> +        irqstate = 0;
> +    }
> +
> +    qemu_set_irq(cpu->gt_timer_outputs[timeridx], irqstate);
> +    trace_arm_gt_update_irq(timeridx, irqstate);
> +}

> @@ -2888,6 +2904,21 @@ static void gt_virt_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      gt_ctl_write(env, ri, GTIMER_VIRT, value);
>  }
>
> +static void gt_cnthctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                             uint64_t value)
> +{
> +    ARMCPU *cpu = env_archcpu(env);
> +    uint32_t oldval = env->cp15.cnthctl_el2;
> +
> +    raw_write(env, ri, value);
> +
> +    if ((oldval ^ value) & CNTHCTL_CNTVMASK) {
> +        gt_update_irq(cpu, GTIMER_VIRT);
> +    } else if ((oldval ^ value) & CNTHCTL_CNTPMASK) {
> +        gt_update_irq(cpu, GTIMER_PHYS);
> +    }
> +}
> +
>  static void gt_cntvoff_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                                uint64_t value)
>  {
> @@ -6200,7 +6231,8 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>         * reset values as IMPDEF. We choose to reset to 3 to comply with
>         * both ARMv7 and ARMv8.
>         */
> -      .access = PL2_RW, .resetvalue = 3,
> +      .access = PL2_RW, .type = ARM_CP_IO, .resetvalue = 3,
> +      .writefn = gt_cnthctl_write,
>        .fieldoffset = offsetof(CPUARMState, cp15.cnthctl_el2) },

You also need to add ".raw_writefn = raw_write". Otherwise
on an inbound migration we will use the writefn to update
the register value from the inbound data, which will
update the irq line and potentially mess up the state of
the device on the other end of it.

>      { .name = "CNTVOFF_EL2", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 0, .opc2 = 3,

The other missing thing here is that we now need to recalculate
the interrupt state when the security state changes, because
a transition from (for instance) EL1 NonSecure to EL3 Root
means the CNTVMASK and CNTPMASK bits should now take effect.
The security state can only change on a transition either
into or out of EL3, so you can do this with an el_change_hook:
call arm_register_el_change_hook() in the same way we do
already to set up the pmu_post_el_change function. Then in
that function you can call gt_update_irq(). (The hook gets
called after the exception return has updated the CPU state
to the target exception level.)

thanks
-- PMM
