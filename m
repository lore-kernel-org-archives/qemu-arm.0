Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1493043lfm;
        Thu, 25 Jun 2020 10:06:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzq4bdhA/9oNvY3kC0xWRcElw77ug6hYoTJH9lMP8C0pN94lTNX4BgN+7Ri6BuDKbTmwRJx
X-Received: by 2002:a67:ed41:: with SMTP id m1mr28733443vsp.189.1593104765428;
        Thu, 25 Jun 2020 10:06:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593104765; cv=none;
        d=google.com; s=arc-20160816;
        b=AwwTCqpkKInut7Ko5I2HOlkabXD8oEDUedVkaIDcfYnp23r9riOUoZvrRebbldykgt
         EV8A5OGwIOyNpNLymsZmk46rFpzTRJoAn5SgDnuk+d6FuZZVDtfsPWqoGfrzwB8Ni0ZV
         KneD8hly+9sPVB+u9ULgxFJboyMaM5BCV0H+Zg06rdxFwU2wVxQMx6/4Ltd9ZhzqvQyk
         Eih1QcXYuhsYSa93mbaWzJ1yAJD5ELolHSu06jxhCANcBamFoKmpQfobHxseHDO0vBZ9
         S3JFEbVl5PxK7RbN4eiKY5nWo+gKZo0/3fr+Q5HQHicTJYgnd6Mr+qQnrSPbyZ2eABZo
         KMGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lrqlGZt4EkhYEMniyWQVDT1ReAV9Lo0Pau+2CI+Xzdc=;
        b=T4t7PtZ/0RLmssED2+BfpQNhDCCafCE2Q8N44FyejaOT4w2mfAzDycTlKe2HwJTYSq
         bf1lbu2TcC5FvJ3MA6+czEAoDhjWmNGoiD6S/bY+mUT4Vp7ZYC86HaIFVg6EBaOCkUau
         CC9wWu1lRx+RWdjb4koUXE/Zmbg28atspvC33B/EgJk+FjeDtVpYMIc8HU5398HOjIfc
         ALuJ72vT2rDnSjMA/o5Ec2eEEsEdalWlMk/EVdrIT1j4O6HiXQTcGHq8+GsG14B+Dkmh
         mX062EqEyRvWqEzg0QwTKC/1VSVsZIR0gEI9Yotrv7Fv9n1B+jZfWWyhAuPz/FYxhvt7
         KkDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jRaPe2T1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3si3136783uan.113.2020.06.25.10.06.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 10:06:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jRaPe2T1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joVK8-0000kc-Ca
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 13:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joVFC-0001ih-KD
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 13:00:58 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:37266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joVFA-0007j2-2x
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 13:00:58 -0400
Received: by mail-oi1-x243.google.com with SMTP id a3so5591087oid.4
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 10:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lrqlGZt4EkhYEMniyWQVDT1ReAV9Lo0Pau+2CI+Xzdc=;
 b=jRaPe2T18oNPp1c8vmDWcQ0lkkeu7AuDWlzigmJUQPKh/BKLiKop/zrh1V8Lrb1xLz
 VXwO0/h2atoK4O3iOqPjFrU0ioWqgTrUXvgPKOhu8XbxV56jPLS9F4cxEXeAK45BHzZw
 bb6YBdOXu03L4vB5pv1lJw9ahMamTHcy6P3jVHjlVSLAmyubdSrnpgG+eXq5Efp9aeDb
 9885IwUaw8TCH9BAOBNVcJrVj372tLKg4S+N5L931/ub9wj8yv6+p5fPRA3raMyDMHKP
 nHje7h5j/4ZazC6jxsSQapmVY2iUQ3h53I/Hd7hhfvXnXMIwvaRK0YOVrp0J/LfERABC
 LHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lrqlGZt4EkhYEMniyWQVDT1ReAV9Lo0Pau+2CI+Xzdc=;
 b=p39HN8yA6quXzdTpfj2fYgf+Ch07YbvbNC8mIdvxlzk4S8qqomjvVvKjIiO660ABbu
 mrsIQpMG/ByZm5eOASVvnkE9T4tzqmwkfLz5stotcculMxpXseFt3P/XRgH4lxwVN1+D
 i0Kvh67vTa0/RUEzH2jSa9/cy6HWAAEo/xM6cgBp3MkAR5PTbYZfxDCY5XZL3oVdaJQM
 KCwUgUrgNbOu9zXnJNxaEo9cGFm6YWwZpW+BhUhN22DttY5+w4wp6bMLl7rt1vWUPT9A
 kP77RcSpfUJImK706QZI/g5EIPGHWi4nDQMdSYZcXfi/DdxgxJZJ4sOVqm130ghUX6Zx
 UPgQ==
X-Gm-Message-State: AOAM532R8G2FQb0UG9jKnbrpaDBvvpQossr6yfzS7C37+xsen1i0u/f2
 CVKLCZOZ7fEYIphfv6SK6TC9/juEUhW/oCFcIC8uxQ==
X-Received: by 2002:aca:1a07:: with SMTP id a7mr3080411oia.163.1593104454423; 
 Thu, 25 Jun 2020 10:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200605041733.415188-1-richard.henderson@linaro.org>
 <20200605041733.415188-13-richard.henderson@linaro.org>
In-Reply-To: <20200605041733.415188-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 18:00:43 +0100
Message-ID: <CAFEAcA9uUSmg1zwz3-nXW6VQ2inc_mwGXzm+uqaxG1vr=zn2pA@mail.gmail.com>
Subject: Re: [PATCH v2 12/17] linux-user/aarch64: Pass syndrome to EXC_*_ABORT
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /NIQvHLJEWFG

On Fri, 5 Jun 2020 at 05:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> A proper syndrome is required to fill in the proper si_code.
> Use page_get_flags to determine permission vs translation
> for user-only.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/cpu_loop.c | 23 ++++++++++++++++++++---
>  target/arm/tlb_helper.c       | 27 +++++++++++++++++++++------
>  2 files changed, 41 insertions(+), 9 deletions(-)
>
> diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
> index 3cca637bb9..ce56e15be2 100644
> --- a/linux-user/aarch64/cpu_loop.c
> +++ b/linux-user/aarch64/cpu_loop.c
> @@ -75,7 +75,7 @@
>  void cpu_loop(CPUARMState *env)
>  {
>      CPUState *cs = env_cpu(env);
> -    int trapnr;
> +    int trapnr, ec, fsc;
>      abi_long ret;
>      target_siginfo_t info;
>
> @@ -116,9 +116,26 @@ void cpu_loop(CPUARMState *env)
>          case EXCP_DATA_ABORT:
>              info.si_signo = TARGET_SIGSEGV;
>              info.si_errno = 0;
> -            /* XXX: check env->error_code */
> -            info.si_code = TARGET_SEGV_MAPERR;
>              info._sifields._sigfault._addr = env->exception.vaddress;
> +
> +            /* We should only arrive here with EC in {DATAABORT, INSNABORT}. */
> +            ec = extract32(env->exception.syndrome, 26, 6);

 ec = syn_get_ec(env->exception.syndrome);

(though it's in internals.h which implies moving it I guess).

> +            assert(ec == 0x24 || ec == 0x20);

assert(ec == EC_DATAABORT || ec == EC_INSNABORT);

> +
> +            /* Both EC have the same format for FSC, or close enough. */
> +            fsc = extract32(env->exception.syndrome, 0, 6);
> +            switch (fsc) {
> +            case 0x04 ... 0x07: /* Translation fault, level {0-3} */
> +                info.si_code = TARGET_SEGV_MAPERR;
> +                break;
> +            case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
> +            case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
> +                info.si_code = TARGET_SEGV_ACCERR;
> +                break;
> +            default:
> +                g_assert_not_reached();
> +            }
> +
>              queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>              break;
>          case EXCP_UNALIGNED:
> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> index d4e6d37f4f..35d84ac24f 100644
> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -10,8 +10,6 @@
>  #include "internals.h"
>  #include "exec/exec-all.h"
>
> -#if !defined(CONFIG_USER_ONLY)
> -
>  static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
>                                              unsigned int target_el,
>                                              bool same_el, bool ea,
> @@ -51,6 +49,8 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
>      return syn;
>  }
>
> +#if !defined(CONFIG_USER_ONLY)
> +
>  static void QEMU_NORETURN arm_deliver_fault(ARMCPU *cpu, vaddr addr,
>                                              MMUAccessType access_type,
>                                              int mmu_idx, ARMMMUFaultInfo *fi)
> @@ -138,13 +138,28 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      ARMCPU *cpu = ARM_CPU(cs);
>
>  #ifdef CONFIG_USER_ONLY
> +    int flags, fsc, exc;
> +    unsigned syn;
> +
>      cpu->env.exception.vaddress = address;
> -    if (access_type == MMU_INST_FETCH) {
> -        cs->exception_index = EXCP_PREFETCH_ABORT;
> +
> +    flags = page_get_flags(useronly_clean_ptr(address));
> +    if (flags & PAGE_VALID) {
> +        fsc = 0xf; /* permission fault, level 3 */
>      } else {
> -        cs->exception_index = EXCP_DATA_ABORT;
> +        fsc = 0x7; /* translation fault, level 3 */
>      }
> -    cpu_loop_exit_restore(cs, retaddr);
> +
> +    cpu_restore_state(cs, retaddr, true);
> +    if (access_type == MMU_INST_FETCH) {
> +        exc = EXCP_PREFETCH_ABORT;
> +        syn = syn_insn_abort(0, 0, 0, fsc);
> +    } else {
> +        exc = EXCP_DATA_ABORT;
> +        syn = merge_syn_data_abort(cpu->env.exception.syndrome, 1, 0, 0, 0,
> +                                   access_type == MMU_DATA_STORE, fsc);
> +    }
> +    raise_exception(&cpu->env, exc, syn, 1);

Should we call arm_deliver_fault() the way the other series
does for linux-user alignment faults ?

thanks
-- PMM
