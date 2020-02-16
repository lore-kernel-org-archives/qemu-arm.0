Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3661138lfp;
        Sat, 15 Feb 2020 19:42:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqyDkPL7gLjQ2S0oCi7u2jceJiyPvl2fq1YA/S38c1zM0fxBawEMFpgsPgn4rTuaOm6Z3Lps
X-Received: by 2002:a05:6214:88c:: with SMTP id cz12mr7780235qvb.95.1581824523759;
        Sat, 15 Feb 2020 19:42:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581824523; cv=none;
        d=google.com; s=arc-20160816;
        b=rhFRhfv1k4BzuelAV0Mg1DMsh3FLmhIk5mzRkcEQwmBNXoQcLQ/QbemwSVGnuxX5fL
         QrY7XwEfwzDZw9PjZiS0/2l3MVq5Xp5FxEgjQet2ex1M/anaS2+K+55yd+EX41gxDceb
         lRaOzMnUhDSnDVtNXoj6Ir9HgbH8ooT9fMJbfvI+qv+43zIYYqhP1SJW2SW9m/INBr8w
         0whxykgifmiRudo4phMJBJCFlff4Ol8+/qD97ifVUmFEXQ9UB8cqb3AELhjXjn7+f6Xc
         Tnp/qkPQKH4XHFMYXwwyMXgo1LNANdIpEu4QNX5A/lY/c6RNEskp/w3QYgY91xVVsyNm
         N3cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=+ksXD0DwdmuLCxfx4m4FYg1fC6RAiEAhWQyW1hRC2TQ=;
        b=l0+JKxsAIXFUvtxpKr2ZLTxVt+o6wl1DJAsclJt/2Gpjs+7pUZqn2WweU3DgWo6Y3w
         MolW6X1nnRgVGh2HjS+RrZDMh7Q9I9ApSP6f3uFah2+mf6aNhlvDDnDcLg5QIGKbXfzO
         BX6sfKOPJADe32sMF3w+ELg/p0EqdyBU+bQeGpc4zoPQEIKqFMyNJFtR6SK8K8anZOhp
         B/Pmkuxt+v+zOH0aJuys3/LzDTtSzDPjN0BJnFVvvMWopmaM1Z2jTUoq/1wF0ZFJbEWW
         M7R1eSfX9fGMU6fbTJHxLdGCJmw+VI75ZkkDqH9YR4hIMY5lPf0w7ObSGvGB5Foa6CI3
         6s0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cXqct+Mh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2si4870119qtj.376.2020.02.15.19.42.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Feb 2020 19:42:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cXqct+Mh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3Aol-000227-75
	for alex.bennee@linaro.org; Sat, 15 Feb 2020 22:42:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50791)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3Aoe-00021p-GR
 for qemu-arm@nongnu.org; Sat, 15 Feb 2020 22:41:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3Aoc-0007zj-Vv
 for qemu-arm@nongnu.org; Sat, 15 Feb 2020 22:41:56 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:51004)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3Aoc-0007yA-Nq
 for qemu-arm@nongnu.org; Sat, 15 Feb 2020 22:41:54 -0500
Received: by mail-pj1-x1041.google.com with SMTP id r67so5694230pjb.0
 for <qemu-arm@nongnu.org>; Sat, 15 Feb 2020 19:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+ksXD0DwdmuLCxfx4m4FYg1fC6RAiEAhWQyW1hRC2TQ=;
 b=cXqct+MhNuVTqbLJyLHP8l/EmJNanP4P69mtyJR3nCOacbnYLIyqMnlrmGBGlzsvmw
 zeKOujhSbDoa8TZ0/Y+p9DW5zmbnM4+LHmkw89v+8O0jLk5mpYzna+RGPUiuLKlhbNq+
 trUG8LmvKUrsUZB5UZQRtL/XfZ50oqFB9oKRB9IXhVj6RaN47sLgVJ4PbvX/Wc7T2M52
 SBBrK12fwS/M70m7pF5Y7Mz8TQOtGHTFw4Jx+hP84HD9zJuQHpqZAmAL3XQmOpHUfts7
 h8QMygjwW+c4gdtMZG1Dt8f3c+rjHWsahkc9Ryj4H3yvf/SrVL1nLfsevAcVigib7F+1
 KjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+ksXD0DwdmuLCxfx4m4FYg1fC6RAiEAhWQyW1hRC2TQ=;
 b=l7xxWWUBigAfI0eh5U6GyH8czHjyRk91xrZyI6lePex3Q5tQKRZaQVQeZY0LwPiaIm
 /pWNf/4xgG+xD5ewdVz72OVSwliqjrea51kgCY+9/ij/aRXcRBknT36YIIJ9aLoRJBd1
 2CoT7QtAgHNXYkjq41orgojWihJGOpAW5xZe6V0oSIGAGFJrMsdSj4dVho/1UVsz+rr7
 ZgNZ8RfgqKqCU45qEasM0gnK6LuQaIyh6o20s04wScgchV64cfq0svB56lD/hwzUQy3f
 lJY6Z9/rTWZVZK2EGarB+H9TrnYQqFkidywyzOWQLMV8n8IlIN3Lz7v/5rmzvjJS+hoS
 a4aQ==
X-Gm-Message-State: APjAAAWb87vh0+ag0/ADjMDep1Zpl17EvezbQrlW+dZi0Ue3j8A3HH1G
 CabU4B3V8/hu7tPjpyAf6U0lAw==
X-Received: by 2002:a17:90a:b106:: with SMTP id
 z6mr12693083pjq.91.1581824513480; 
 Sat, 15 Feb 2020 19:41:53 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 g19sm11679128pfh.134.2020.02.15.19.41.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Feb 2020 19:41:52 -0800 (PST)
Subject: Re: [PATCH v3 1/2] target/arm: Support SError injection
To: Gavin Shan <gshan@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20200214055950.62477-1-gshan@redhat.com>
 <20200214055950.62477-2-gshan@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0c00d0d4-19c5-0802-8fd3-f583bb270709@linaro.org>
Date: Sat, 15 Feb 2020 19:41:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214055950.62477-2-gshan@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, jthierry@redhat.com,
 aik@ozlabs.ru, maz@kernel.org, eric.auger@redhat.com, shan.gavin@gmail.com,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CYbqZU+AGaEm

On 2/13/20 9:59 PM, Gavin Shan wrote:
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index b0762a76c4..180e29fb83 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -78,7 +78,7 @@ static bool arm_cpu_has_work(CPUState *cs)
>          && cs->interrupt_request &
>          (CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD
>           | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ
> -         | CPU_INTERRUPT_EXITTB);
> +         | ARM_CPU_SERROR | CPU_INTERRUPT_EXITTB);

CPU_INTERRUPT_SERROR, not ARM_CPU_SERROR.

> @@ -570,6 +573,16 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>              goto found;
>          }
>      }
> +
> +    if (interrupt_request & CPU_INTERRUPT_SERROR) {
> +        excp_idx = EXCP_SERROR;
> +        target_el = arm_phys_excp_target_el(cs, excp_idx, cur_el, secure);
> +        if (arm_excp_unmasked(cs, excp_idx, target_el,
> +                              cur_el, secure, hcr_el2)) {
> +            goto found;
> +        }
> +    }
> +
>      return false;
>  
>   found:

If you're intending to use Serror for NMI, perhaps it should be the first bit
tested, not the last.  Otherwise some bug that leaves a normal hard interrupt
line high will keep delivering the interrupt, and not the Serror.

As the comment at the top of the function says, the priority is implementation
defined, so we can put it anywhere we like.

> @@ -594,13 +607,26 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>       * (which depends on state like BASEPRI, FAULTMASK and the
>       * currently active exception).
>       */
> -    if (interrupt_request & CPU_INTERRUPT_HARD
> -        && (armv7m_nvic_can_take_pending_exception(env->nvic))) {
> -        cs->exception_index = EXCP_IRQ;
> -        cc->do_interrupt(cs);
> -        ret = true;
> +    if (!armv7m_nvic_can_take_pending_exception(env->nvic)) {
> +        return false;
> +    }
> +
> +    if (interrupt_request & CPU_INTERRUPT_HARD) {
> +        excp_idx = EXCP_IRQ;
> +        goto found;
>      }
> -    return ret;
> +
> +    if (interrupt_request & CPU_INTERRUPT_SERROR) {
> +        excp_idx = EXCP_SERROR;
> +        goto found;
> +    }

Likewise.

> -        qdev_init_gpio_in(DEVICE(cpu), arm_cpu_kvm_set_irq, 4);
> +        qdev_init_gpio_in(DEVICE(cpu), arm_cpu_kvm_set_irq, 5);
>      } else {
> -        qdev_init_gpio_in(DEVICE(cpu), arm_cpu_set_irq, 4);
> +        qdev_init_gpio_in(DEVICE(cpu), arm_cpu_set_irq, 5);

I wonder if we should have an ARM_CPU_NUM_IRQ define so that this is more
automatic.

> @@ -98,10 +100,11 @@ enum {
>  #endif
>  
>  /* Meanings of the ARMCPU object's four inbound GPIO lines */
> -#define ARM_CPU_IRQ 0
> -#define ARM_CPU_FIQ 1
> -#define ARM_CPU_VIRQ 2
> -#define ARM_CPU_VFIQ 3
> +#define ARM_CPU_IRQ    0
> +#define ARM_CPU_FIQ    1
> +#define ARM_CPU_VIRQ   2
> +#define ARM_CPU_VFIQ   3
> +#define ARM_CPU_SERROR 4

Comment is now wrong about the count.


r~
