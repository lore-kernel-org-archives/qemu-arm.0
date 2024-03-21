Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp594484ejv;
        Thu, 21 Mar 2024 08:47:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXvE2CrTkMMIHTTqc8kuU+qIiTE8xQLuarrnO/9+HhyBni+LXXy2Wpx582AqBRnJX+Vm9XhAXeyp88Gj18qVci+pNoOpKf7
X-Google-Smtp-Source: AGHT+IEmg9GKTezHjuJewqD3tvGkgoFEC1ZwH6U5AjYhJDxb8KeDn8ubZWwy+NVAeiGQexCMr3zR
X-Received: by 2002:a05:620a:1d95:b0:789:e800:b39f with SMTP id pj21-20020a05620a1d9500b00789e800b39fmr8741005qkn.76.1711036065044;
        Thu, 21 Mar 2024 08:47:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711036065; cv=none;
        d=google.com; s=arc-20160816;
        b=OIjwMF3pbB+PkQZoUcW1x9rXgngQ+QjN4LQ5Rmd5g4kV1T+bidAG8dyiUWafCJNwZD
         pKRc8pvLY64iIcznfDqiUBrt8xzNAqnLWbBPceh4yhoKh34VyEgkGiV5dAr6EmjAjf5M
         kTUHjZyJqkb+nK3zI8scjtd+ZeOtO4EQZwyDV97ZOLx9pNwXMTOEA5BrcTUmkqTjDRZa
         hmR1zELkykrqipLdSScnvC0KjtZLw0okMtmgQYsIqyFMRojnEu/IS7WyhdRYBYFwnEek
         neGX5pW/yoymQueGBNOI6NEcxBZoBPO5UMS38UVRG/QFmRCLTFGm0RgBRW1DEOrdJhJp
         +fqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=cGmGEYY6yU0tXOc940KV3JvaFbQB+MYIs7LoX5GET70=;
        fh=WBWJYfhnm7E0CLBY/EOSAD6cL/no8G7gKSPODKAF7TU=;
        b=rUQ6oK73Cl6PYiURn1ZWSZq86VhbyU1xzuJ1i2PMv+TYixizQpUg9lRNmawrPUCMXx
         iZBDH39dk147M3AQKqmE8sLE/Bjz4MTKiTaB6hMwwmDiOvNpmqGp8vQFYrmjJzLL6di0
         PTb6TcYvxdkkaFhNpzT+kH9UJl68WROyHlvZKhQuNPlX76XPG4II4FBkfzfJQCC16pN+
         Yjqu6lspuG0KkIcIo21QxJFCFmLR35HJOSJRZjMk+3uffmGiSjFfDZHfxv3tIBZGSqr+
         n0kg0sESuFe2sguTHqucAiDKyu08NXSt+/Y8DpBHkGmok9deQcCxcTjiHZqZU8sbrmMo
         4ucQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YanhX9FU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8-20020ae9ec08000000b007884e2ac8d8si16109900qkg.428.2024.03.21.08.47.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2024 08:47:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YanhX9FU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnKdA-0003Lr-Em; Thu, 21 Mar 2024 11:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnKd7-0003Km-GV
 for qemu-arm@nongnu.org; Thu, 21 Mar 2024 11:46:57 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnKd5-0000WK-A5
 for qemu-arm@nongnu.org; Thu, 21 Mar 2024 11:46:57 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-513dc9d6938so1526128e87.2
 for <qemu-arm@nongnu.org>; Thu, 21 Mar 2024 08:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711036013; x=1711640813; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cGmGEYY6yU0tXOc940KV3JvaFbQB+MYIs7LoX5GET70=;
 b=YanhX9FUfUo1pQS1mT+2I1A8thMedClHrUlMv5W1vgEc1pARJ28993x0lopFA3S+Rg
 2GgrY7TeYw1K71clAZ2GSEecP1/a4RtllY6EO7omt2BvwXHaXgcG43smssK1xMOBjihR
 vTaMy/lzxZHW5dWAvBuThlOFpr/9QIT3YjEhcZwvZp2Cch2jtqT+LG7hCnt2LTkKfNZY
 Cs0kuMu+pBnDSqa+9NLu9IX9YRCPOzyGeDNhjMAH2usbzTpXqXK7gHA89033HzVt8H1g
 XzlfKedbUaRxXaV9KlRsPbpmReY45xHwUIgKRiMylYDNZSSZMbhJ7xZbtbScCk38uoZe
 D+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711036013; x=1711640813;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cGmGEYY6yU0tXOc940KV3JvaFbQB+MYIs7LoX5GET70=;
 b=dglhU07ZSRLqLl/+Rsk/vZs8sbCriM6igysTDZnLkujWZogJJpk0lo9y5cAcLEZZER
 cwmeOxoeSvS+pX5EW1bXBnxTePkDsyUouvFIBWC7hJ2o+bsXDhhanSK9xiyV3fEiMyoc
 IWP87Jbe9JtgrzFFhokGe3ymk9cn8/34XkUUFpjj06+M0pZzAKYEXccpi9Em9ULHO/Uq
 2Fe8P8n4KCOtHzAh8XH+S2XCFDzkaIBWtxa97EPTJW+4ujUCa12fcZ8qJ/jRrQOSV1Kr
 +Wa2YNuxv6k1VwsUA/GDowxwyT8jkMjpYIc3O6Qtm/gPDkx1p+KM0NP8UwRSxFCg0JCX
 4L5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlJyiQCrKZ6EvaVAC+DaWXgVGcFV6Jpi9AxcV/992QiXmDnmfQfScg1vj868Lq4WBeTNgXHSYF2e76zAnnsG04R05Q
X-Gm-Message-State: AOJu0Yw0oAFxTiElBrV+MxKyN3NS6bM0/nSoHcs2EncI+tWZeTwWOVQx
 tm68ErROVOkCUKgKB9tK+NFH1KVxwsJgRH6zn6L5SW9YddxYcIcJOYBiH15OhWX5ucSSJ7tHPae
 knLAewyYEFW7O63556d+bNEN1fAMbauHrUQkbtw==
X-Received: by 2002:ac2:5f9a:0:b0:513:cfa0:b689 with SMTP id
 r26-20020ac25f9a000000b00513cfa0b689mr1598164lfe.61.1711036013293; Thu, 21
 Mar 2024 08:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240321130812.2983113-1-ruanjinjie@huawei.com>
 <20240321130812.2983113-7-ruanjinjie@huawei.com>
In-Reply-To: <20240321130812.2983113-7-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Mar 2024 15:46:41 +0000
Message-ID: <CAFEAcA-SO3akirm+jgKGRvKH1bcsf1bLJE2uOCOoXi1h78WwFA@mail.gmail.com>
Subject: Re: [RFC PATCH v9 06/23] target/arm: Add support for Non-maskable
 Interrupt
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x129.google.com
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
X-TUID: I1+C5t53QIkc

On Thu, 21 Mar 2024 at 13:10, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> This only implements the external delivery method via the GICv3.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v9:
> - Update the GPIOs passed in the arm_cpu_kvm_set_irq, and update the comment.
> - Definitely not merge VINMI and VFNMI into EXCP_VNMI.
> - Update VINMI and VFNMI when writing HCR_EL2 or HCRX_EL2.
> v8:
> - Fix the rcu stall after sending a VNMI in qemu VM.
> v7:
> - Add Reviewed-by.
> v6:
> - env->cp15.hcr_el2 -> arm_hcr_el2_eff().
> - env->cp15.hcrx_el2 -> arm_hcrx_el2_eff().
> - Not include VF && VFNMI in CPU_INTERRUPT_VNMI.
> v4:
> - Accept NMI unconditionally for arm_cpu_has_work() but add comment.
> - Change from & to && for EXCP_IRQ or EXCP_FIQ.
> - Refator nmi mask in arm_excp_unmasked().
> - Also handle VNMI in arm_cpu_exec_interrupt() and arm_cpu_set_irq().
> - Rename virtual to Virtual.
> v3:
> - Not include CPU_INTERRUPT_NMI when FEAT_NMI not enabled
> - Add ARM_CPU_VNMI.
> - Refator nmi mask in arm_excp_unmasked().
> - Test SCTLR_ELx.NMI for ALLINT mask for NMI.
> ---
>  target/arm/cpu-qom.h   |   5 +-
>  target/arm/cpu.c       | 124 ++++++++++++++++++++++++++++++++++++++---
>  target/arm/cpu.h       |   6 ++
>  target/arm/helper.c    |  33 +++++++++--
>  target/arm/internals.h |  18 ++++++
>  5 files changed, 172 insertions(+), 14 deletions(-)
>
> diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
> index 8e032691db..b497667d61 100644
> --- a/target/arm/cpu-qom.h
> +++ b/target/arm/cpu-qom.h
> @@ -36,11 +36,14 @@ DECLARE_CLASS_CHECKERS(AArch64CPUClass, AARCH64_CPU,
>  #define ARM_CPU_TYPE_SUFFIX "-" TYPE_ARM_CPU
>  #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
>
> -/* Meanings of the ARMCPU object's four inbound GPIO lines */
> +/* Meanings of the ARMCPU object's seven inbound GPIO lines */
>  #define ARM_CPU_IRQ 0
>  #define ARM_CPU_FIQ 1
>  #define ARM_CPU_VIRQ 2
>  #define ARM_CPU_VFIQ 3
> +#define ARM_CPU_NMI 4
> +#define ARM_CPU_VINMI 5
> +#define ARM_CPU_VFNMI 6
>
>  /* For M profile, some registers are banked secure vs non-secure;
>   * these are represented as a 2-element array where the first element
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index ab8d007a86..f1e7ae0975 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -122,6 +122,13 @@ void arm_restore_state_to_opc(CPUState *cs,
>  }
>  #endif /* CONFIG_TCG */
>
> +/*
> + * With SCTLR_ELx.NMI == 0, IRQ with Superpriority is masked identically with
> + * IRQ without Superpriority. Moreover, if the GIC is configured so that
> + * FEAT_GICv3_NMI is only set if FEAT_NMI is set, then we won't ever see
> + * CPU_INTERRUPT_*NMI anyway. So we might as well accept NMI here
> + * unconditionally.
> + */
>  static bool arm_cpu_has_work(CPUState *cs)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
> @@ -129,6 +136,7 @@ static bool arm_cpu_has_work(CPUState *cs)
>      return (cpu->power_state != PSCI_OFF)
>          && cs->interrupt_request &
>          (CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD
> +         | CPU_INTERRUPT_NMI | CPU_INTERRUPT_VINMI | CPU_INTERRUPT_VFNMI
>           | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ | CPU_INTERRUPT_VSERR
>           | CPU_INTERRUPT_EXITTB);
>  }
> @@ -668,6 +676,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
>      CPUARMState *env = cpu_env(cs);
>      bool pstate_unmasked;
>      bool unmasked = false;
> +    bool allIntMask = false;
>
>      /*
>       * Don't take exceptions if they target a lower EL.
> @@ -678,13 +687,36 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
>          return false;
>      }
>
> +    if (cpu_isar_feature(aa64_nmi, env_archcpu(env)) &&
> +        env->cp15.sctlr_el[target_el] & SCTLR_NMI && cur_el == target_el) {
> +        allIntMask = env->pstate & PSTATE_ALLINT ||
> +                     ((env->cp15.sctlr_el[target_el] & SCTLR_SPINTMASK) &&
> +                      (env->pstate & PSTATE_SP));
> +    }
> +
>      switch (excp_idx) {
> +    case EXCP_NMI:
> +        pstate_unmasked = !allIntMask;
> +        break;
> +
> +    case EXCP_VINMI:
> +        if (!(hcr_el2 & HCR_IMO) || (hcr_el2 & HCR_TGE)) {
> +            /* VINMIs are only taken when hypervized.  */
> +            return false;
> +        }
> +        return !allIntMask;
> +    case EXCP_VFNMI:
> +        if (!(hcr_el2 & HCR_FMO) || (hcr_el2 & HCR_TGE)) {
> +            /* VFNMIs are only taken when hypervized.  */
> +            return false;
> +        }
> +        return !allIntMask;
>      case EXCP_FIQ:
> -        pstate_unmasked = !(env->daif & PSTATE_F);
> +        pstate_unmasked = (!(env->daif & PSTATE_F)) && (!allIntMask);
>          break;
>
>      case EXCP_IRQ:
> -        pstate_unmasked = !(env->daif & PSTATE_I);
> +        pstate_unmasked = (!(env->daif & PSTATE_I)) && (!allIntMask);
>          break;
>
>      case EXCP_VFIQ:
> @@ -692,13 +724,13 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
>              /* VFIQs are only taken when hypervized.  */
>              return false;
>          }
> -        return !(env->daif & PSTATE_F);
> +        return !(env->daif & PSTATE_F) && (!allIntMask);
>      case EXCP_VIRQ:
>          if (!(hcr_el2 & HCR_IMO) || (hcr_el2 & HCR_TGE)) {
>              /* VIRQs are only taken when hypervized.  */
>              return false;
>          }
> -        return !(env->daif & PSTATE_I);
> +        return !(env->daif & PSTATE_I) && (!allIntMask);
>      case EXCP_VSERR:
>          if (!(hcr_el2 & HCR_AMO) || (hcr_el2 & HCR_TGE)) {
>              /* VIRQs are only taken when hypervized.  */
> @@ -804,6 +836,32 @@ static bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>
>      /* The prioritization of interrupts is IMPLEMENTATION DEFINED. */
>
> +    if (cpu_isar_feature(aa64_nmi, env_archcpu(env))) {
> +        if (interrupt_request & CPU_INTERRUPT_NMI) {
> +            excp_idx = EXCP_NMI;
> +            target_el = arm_phys_excp_target_el(cs, excp_idx, cur_el, secure);
> +            if (arm_excp_unmasked(cs, excp_idx, target_el,
> +                                  cur_el, secure, hcr_el2)) {
> +                goto found;
> +            }
> +        }
> +        if (interrupt_request & CPU_INTERRUPT_VINMI) {
> +            excp_idx = EXCP_VINMI;
> +            target_el = 1;
> +            if (arm_excp_unmasked(cs, excp_idx, target_el,
> +                                  cur_el, secure, hcr_el2)) {
> +                goto found;
> +            }
> +        }
> +        if (interrupt_request & CPU_INTERRUPT_VFNMI) {
> +            excp_idx = EXCP_VFNMI;
> +            target_el = 1;
> +            if (arm_excp_unmasked(cs, excp_idx, target_el,
> +                                  cur_el, secure, hcr_el2)) {
> +                goto found;
> +            }
> +        }
> +    }

Something somewhere needs to implement "if SCTLR_ELx.NMI is 0 then
we don't take EXCP_VINMI etc but instead (maybe) EXCP_VIRQ etc".
At the moment nothing does that:
 * arm_cpu_update_vinmi() doesn't look at the NMI bit before
   deciding whether to set CPU_INTERRUPT_VINMI
 * in arm_excp_unmasked() if NMI is 0 then allIntMask takes its
   default value of false and so arm_excp_unmasked() returns true,
   so VINMI is not masked
 * arm_cpu_exec_interrupt() doesn't look at the NMI bit before
   deciding whether to check the CPU_INTERRUPT_VINMI bit in interrupt_request

So even if SCTLR_ELx.NMI is 0 we'll still try to take a VINMI
if it's set up in the HCR_EL2 bits.

However we do this the required behaviour is that if NMI is 0
then it is as if the interrupt doesn't have superpriority and
it falls back to being handled as an ordinary IRQ, VIRQ, VFIQ etc.
I think the best place to do this is probably here in
arm_cpu_exec_interrupt() -- if SCTLR_ELx.NMI isn't set then
treat the VFNMI bit like VFIQ, the VINMI bit like VIRQ, and
the NMI bit like IRQ.

>      if (interrupt_request & CPU_INTERRUPT_FIQ) {
>          excp_idx = EXCP_FIQ;
>          target_el = arm_phys_excp_target_el(cs, excp_idx, cur_el, secure);
> @@ -900,6 +958,48 @@ void arm_cpu_update_vfiq(ARMCPU *cpu)
>      }
>  }
>
> +void arm_cpu_update_vinmi(ARMCPU *cpu)
> +{
> +    /*
> +     * Update the interrupt level for VINMI, which is the logical OR of
> +     * the HCRX_EL2.VINMI bit and the input line level from the GIC.
> +     */
> +    CPUARMState *env = &cpu->env;
> +    CPUState *cs = CPU(cpu);
> +
> +    bool new_state = ((arm_hcr_el2_eff(env) & HCR_VI) &&
> +                      (arm_hcrx_el2_eff(env) & HCRX_VINMI)) ||
> +        (env->irq_line_state & CPU_INTERRUPT_VINMI);
> +
> +    if (new_state != ((cs->interrupt_request & CPU_INTERRUPT_VINMI) != 0)) {
> +        if (new_state) {
> +            cpu_interrupt(cs, CPU_INTERRUPT_VINMI);
> +        } else {
> +            cpu_reset_interrupt(cs, CPU_INTERRUPT_VINMI);
> +        }
> +    }
> +}

What semantics do we intend for the VINMI/VFNMI bits in interrupt_request
and for the incoming IRQ, FIQ, NMI lines? The GIC spec suggests
(but doesn't mandate) that NMI could be signalled by asserting
both NMI and IRQ, and plain IRQ by asserting just IRQ (table 4-6
in the GIC spec). I think the GIC changes in this patchset assert
only the NMI line for an IRQNMI, and not both NMI and IRQ. That's OK
and I think makes more sense for QEMU than signalling both lines,
but it's not the same as what we wind up doing with the handling
of the HCR_EL2 bits in these functions, because you don't change
the existing arm_cpu_update_virq() so that it only sets the
CPU_INTERRUPT_VIRQ bit if this is a VIRQ and not a VIRQNMI.
So if the guest sets HCR_EL2.VI and HCRX_EL2.VINMI then
arm_cpu_update_virq() will say "this is a VIRQ" and also
arm_cpu_update_vinmi() will say "This is a VINMI" and so both bits
get set in the interrupt_request field.

I think the fix for this is probably to have arm_cpu_update_virq()
and arm_cpu_update_vfiq() check that this is not a VINMI/VFNMI,
so we only set 1 bit in interrupt_request, not 2.

thanks
-- PMM
