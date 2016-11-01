Received: by 10.80.166.35 with SMTP id d32csp611062edc;
        Tue, 1 Nov 2016 04:36:07 -0700 (PDT)
X-Received: by 10.99.115.14 with SMTP id o14mr49018320pgc.44.1478000167068;
        Tue, 01 Nov 2016 04:36:07 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id a18si30013828pgf.207.2016.11.01.04.36.06;
        Tue, 01 Nov 2016 04:36:07 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1423285AbcKALgF (ORCPT <rfc822;xinliang.liu@linaro.org>
        + 7 others); Tue, 1 Nov 2016 07:36:05 -0400
Received: from mail-ua0-f180.google.com ([209.85.217.180]:36610 "EHLO
        mail-ua0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1423238AbcKALgE (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 1 Nov 2016 07:36:04 -0400
Received: by mail-ua0-f180.google.com with SMTP id b35so54396249uaa.3
        for <kvm@vger.kernel.org>; Tue, 01 Nov 2016 04:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=hzwHVKKGoaKi1O+x+0pEJ/5HJUY8EoDcE98OjOB71gk=;
        b=GyMH3o6bJk6zctAhHCS9vtcIcXKLWqUAWmsCqupzbkNLcnPzTjm0SK90MspZugro8K
         enBlMT6jax5KjMNiaufgl2tU8AkgUIUd+AxNqvkZaA+OChL9bCe432tiTrm6K+9oJbb5
         IjF8I9+wQNicocyG9ON4tYXprxy3JzxRM/fBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=hzwHVKKGoaKi1O+x+0pEJ/5HJUY8EoDcE98OjOB71gk=;
        b=WHimhg1PbSuZZKeXTayoMRmXIxTAMQgxmG6ca3SZlKtbbi1GBjGc5ZXf/ILQM53YXj
         Sf8gY8bZJk7U/bctFteKX1Ho1b7WrQnrl7Qi+pcBiQx86N1YUWuPNojlGSQ/ZOlKTK6Z
         VYtVa7bE4JXBTEZ6wOsKr6Waudi7sCLMSqOr4PfWxnGiW3/kkfp/qmwG1iA44H85vxIv
         wjxJWLviYFsrV5G/LJFx6mHYaXTAJjJYKy91MyXbiBgloywTCo8hv0RA3AStjtv/6YGS
         ZU5mySfAS+NLwnxYdqRp6vAevnKlyo+RjL7dhA5BRfBV6KTR57j4hnNPlPxDbN1YuW86
         wZBQ==
X-Gm-Message-State: ABUngvcm63k9ZsPaeMd0agFtw7cURtyDJNvqLEWMf5UtUN29xKHgc1UUqVyhaDyQabUEHY4aWfSgkn2t+QW1XNoG
X-Received: by 10.176.3.137 with SMTP id 9mr17154167uau.120.1478000163088;
 Tue, 01 Nov 2016 04:36:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 1 Nov 2016 04:35:42 -0700 (PDT)
In-Reply-To: <1477775449-115472-2-git-send-email-agraf@suse.de>
References: <1477775449-115472-1-git-send-email-agraf@suse.de> <1477775449-115472-2-git-send-email-agraf@suse.de>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 1 Nov 2016 11:35:42 +0000
Message-ID: <CAFEAcA9ABvy52WDX++ACUQNo+UiRJkyC+X_mT+QhMxqE154Nqw@mail.gmail.com>
Subject: Re: [RFC 2/2] ARM: KVM: Enable in-kernel timers with user space gic
To:     Alexander Graf <agraf@suse.de>
Cc:     QEMU Developers <qemu-devel@nongnu.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
        "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>
Content-Type: text/plain; charset=UTF-8
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: nYkYnqL/Q07V

On 29 October 2016 at 22:10, Alexander Graf <agraf@suse.de> wrote:
> When running with KVM enabled, you can choose between emulating the
> gic in kernel or user space. If the kernel supports in-kernel virtualization
> of the interrupt controller, it will default to that. If not, if will
> default to user space emulation.
>
> Unfortunately when running in user mode gic emulation, we miss out on
> timer events which are only available from kernel space. This patch leverages
> the new kernel/user space pending line synchronization for those timer events.
>
> Signed-off-by: Alexander Graf <agraf@suse.de>
> ---
>  hw/arm/virt.c    | 10 ++++++++++
>  target-arm/cpu.h |  3 +++
>  target-arm/kvm.c | 19 +++++++++++++++++++
>  3 files changed, 32 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 070bbf8..8ac81e3 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -622,6 +622,16 @@ static void create_gic(VirtBoardInfo *vbi, qemu_irq *pic, int type,
>      } else if (type == 2) {
>          create_v2m(vbi, pic);
>      }
> +
> +#ifdef CONFIG_KVM
> +    if (kvm_enabled() && !kvm_irqchip_in_kernel()) {
> +        if (!kvm_check_extension(kvm_state, KVM_CAP_ARM_TIMER)) {
> +            error_report("KVM with user space irqchip only works when the "
> +                         "host kernel supports KVM_CAP_ARM_TIMER");
> +            exit(1);
> +        }
> +    }
> +#endif

I think this belongs somewhere in target-arm/kvm.c rather
than in hw/arm/virt.c -- it's not the only board model that
supports KVM.

>  }
>
>  static void create_uart(const VirtBoardInfo *vbi, qemu_irq *pic, int uart,
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 19d967b..7686082 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -659,6 +659,9 @@ struct ARMCPU {
>
>      ARMELChangeHook *el_change_hook;
>      void *el_change_hook_opaque;
> +
> +    /* Used to synchronize KVM and QEMU timer levels */
> +    uint8_t timer_irq_level;
>  };
>
>  static inline ARMCPU *arm_env_get_cpu(CPUARMState *env)
> diff --git a/target-arm/kvm.c b/target-arm/kvm.c
> index c00b94e..0d8b642 100644
> --- a/target-arm/kvm.c
> +++ b/target-arm/kvm.c
> @@ -527,6 +527,25 @@ void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)
>
>  MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
>  {
> +    ARMCPU *cpu;
> +
> +    if (kvm_irqchip_in_kernel()) {
> +        /*
> +         * We only need to sync timer states with user-space interrupt
> +         * controllers, so return early and save cycles if we don't.
> +         */
> +        return MEMTXATTRS_UNSPECIFIED;
> +    }
> +
> +    cpu = ARM_CPU(cs);
> +
> +    /* Synchronize our internal vtimer irq line with the kvm one */
> +    if (run->s.regs.timer_irq_level != cpu->timer_irq_level) {
> +        qemu_set_irq(ARM_CPU(cs)->gt_timer_outputs[GTIMER_VIRT],

You just set up a local variable, so you don't need to inline "ARM_CPU(cs)".

> +                     run->s.regs.timer_irq_level & KVM_ARM_TIMER_VTIMER);

This is setting a bear trap for the person who comes along later
to add the next interrupt, because the level argument to qemu_set_irq()
should be 0 or 1. That happens to be true for the KVM_ARM_TIMER_VTIMER
bit but won't be for the cut-n-pasted version with the next bit name...

> +        cpu->timer_irq_level = run->s.regs.timer_irq_level;
> +    }
> +
>      return MEMTXATTRS_UNSPECIFIED;
>  }

Does this code do the right thing across a vcpu reset or
a full-system reset?

>
> --
> 1.8.5.6

thanks
-- PMM
