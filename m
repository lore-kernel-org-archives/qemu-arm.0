Received: by 10.25.227.6 with SMTP id a6csp1762165lfh;
        Tue, 27 Jun 2017 06:21:35 -0700 (PDT)
X-Received: by 10.84.224.199 with SMTP id k7mr5614293pln.207.1498569695487;
        Tue, 27 Jun 2017 06:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498569695; cv=none;
        d=google.com; s=arc-20160816;
        b=MumEgHM22rC0xzqTAxOFFTrGQ8gHf02xNwRv3KykqLVAqv0h7JjiuSwImLgiK+d5lM
         QZPE6P2rkvcTZdmt1BIycHNmczX9CDEaxLFZvRnXOiRv8csygnEFEzSZzrZkmzsn4Qq0
         3XWqCL9qX8iGh58m1/wVg0Lsz6NYIfgAXwUUPNAQlBO9VU9yoRzJbmESLKQganY8bfjM
         eciqyD6rlJtOz8+8BxJk03/pCbqbotCVz/mBy1X1VPisezmkr48RUXHSIal9WhDWJyT4
         NwRCORySy0EmoReaqPSxiYqU0rfGNc2iUnQOCjDpCEUJgrKodRlqowmBfMLYwhJmUBWl
         J9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-filter:dmarc-filter:arc-authentication-results;
        bh=4asPbIqTv1cOYywkJG5LgjteU83HgkQ5Kl1InSlGHDY=;
        b=fplUPsslX1TfEC68krKXnuS8kTzUHE5pCLA8ZxCoU16UX6SKN8lJbyNk1HwFk6yAsC
         WZUfCtZ3xdNKxcZv1VlEN6765d4dkBS/HJ0WOw1ca3o5xy1sa9oBiZ7b8xqG7+b7XrQ2
         QZGed/bzv4FO7U8hx0dOdOC6n+14i0dt9f4rjyojFoPMxAGLIKdV/LPraFdKp64ZpTbp
         nszdb6ju7LRAT2GLiVyFdQUcbnGJ2ZEObUNEl+aenXW82NhTd4WBr4k0g7Y6D2WK30V2
         WUgEk52g8VZ58+5PkwlX9/HY8eNIm096PFWDfVwMAuxId6s3RN0Bpj27PR/PSbYy03Ry
         RHYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d6si1949597pgu.372.2017.06.27.06.21.35;
        Tue, 27 Jun 2017 06:21:35 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753067AbdF0NVd (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Tue, 27 Jun 2017 09:21:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50408 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752753AbdF0NVc (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 27 Jun 2017 09:21:32 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id E7B807F3E4;
        Tue, 27 Jun 2017 13:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E7B807F3E4
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com E7B807F3E4
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A48F84398;
        Tue, 27 Jun 2017 13:21:30 +0000 (UTC)
Date:   Tue, 27 Jun 2017 15:21:27 +0200
From:   Andrew Jones <drjones@redhat.com>
To:     Alexander Graf <agraf@suse.de>
Cc:     qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
        kvm@vger.kernel.org, cdall@linaro.org, qemu-arm@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] ARM: KVM: Enable in-kernel timers with user space gic
Message-ID: <20170627132127.j5wnsilcoao3grqe@kamzik.brq.redhat.com>
References: <1498568923-115764-1-git-send-email-agraf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1498568923-115764-1-git-send-email-agraf@suse.de>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 27 Jun 2017 13:21:32 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 9LBkJm/4Gc1c

On Tue, Jun 27, 2017 at 03:08:43PM +0200, Alexander Graf wrote:
> When running with KVM enabled, you can choose between emulating the
> gic in kernel or user space. If the kernel supports in-kernel virtualization
> of the interrupt controller, it will default to that. If not, if will
> default to user space emulation.
> 
> Unfortunately when running in user mode gic emulation, we miss out on
> interrupt events which are only available from kernel space, such as the timer.
> This patch leverages the new kernel/user space pending line synchronization for
> timer events. It does not handle PMU events yet.
> 
> Signed-off-by: Alexander Graf <agraf@suse.de>
> 
> ---
> 
> v1 -> v2:
> 
>   - whitespace fixes
>   - use !! to determine whether bit is set
>   - call in-kernel device IRQs out by their name everywhere
> ---
>  accel/kvm/kvm-all.c    |  5 +++++
>  accel/stubs/kvm-stub.c |  5 +++++
>  hw/intc/arm_gic.c      |  7 +++++++
>  include/sysemu/kvm.h   | 11 +++++++++++
>  target/arm/cpu.h       |  3 +++
>  target/arm/kvm.c       | 51 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 82 insertions(+)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 75feffa..ade32ea 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2285,6 +2285,11 @@ int kvm_has_intx_set_mask(void)
>      return kvm_state->intx_set_mask;
>  }
>  
> +bool kvm_arm_supports_user_irq(void)
> +{
> +    return kvm_check_extension(kvm_state, KVM_CAP_ARM_USER_IRQ);
> +}
> +
>  #ifdef KVM_CAP_SET_GUEST_DEBUG
>  struct kvm_sw_breakpoint *kvm_find_sw_breakpoint(CPUState *cpu,
>                                                   target_ulong pc)
> diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
> index ef0c734..3965c52 100644
> --- a/accel/stubs/kvm-stub.c
> +++ b/accel/stubs/kvm-stub.c
> @@ -155,4 +155,9 @@ void kvm_init_cpu_signals(CPUState *cpu)
>  {
>      abort();
>  }
> +
> +bool kvm_arm_supports_user_irq(void)
> +{
> +    return false;
> +}
>  #endif
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index b305d90..5a0e2a3 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -25,6 +25,7 @@
>  #include "qom/cpu.h"
>  #include "qemu/log.h"
>  #include "trace.h"
> +#include "sysemu/kvm.h"
>  
>  /* #define DEBUG_GIC */
>  
> @@ -1412,6 +1413,12 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> +    if (kvm_enabled() && !kvm_arm_supports_user_irq()) {
> +        error_setg(errp, "KVM with user space irqchip only works when the "
> +                         "host kernel supports KVM_CAP_ARM_USER_IRQ");
> +        return;
> +    }
> +
>      /* This creates distributor and main CPU interface (s->cpuiomem[0]) */
>      gic_init_irqs_and_mmio(s, gic_set_irq, gic_ops);
>  
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index 1e91613..9f11fc0 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -227,6 +227,17 @@ int kvm_init_vcpu(CPUState *cpu);
>  int kvm_cpu_exec(CPUState *cpu);
>  int kvm_destroy_vcpu(CPUState *cpu);
>  
> +/**
> + * kvm_arm_supports_user_irq
> + *
> + * Not all KVM implementations support notifications for kernel generated
> + * interrupt events to user space. This function indicates whether the current
> + * KVM implementation does support them.
> + *
> + * Returns: true if KVM supports using kernel generated IRQs from user space
> + */
> +bool kvm_arm_supports_user_irq(void);
> +
>  #ifdef NEED_CPU_H
>  #include "cpu.h"
>  
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 16a1e59..102c58a 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -706,6 +706,9 @@ struct ARMCPU {
>      void *el_change_hook_opaque;
>  
>      int32_t node_id; /* NUMA node this CPU belongs to */
> +
> +    /* Used to synchronize KVM and QEMU in-kernel device levels */
> +    uint8_t device_irq_level;
>  };
>  
>  static inline ARMCPU *arm_env_get_cpu(CPUARMState *env)
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 4555468..f750f94 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -174,6 +174,12 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>       */
>      kvm_async_interrupts_allowed = true;
>  
> +    /*
> +     * PSCI wakes up secondary cores, so we always need to
> +     * have vCPUs waiting in kernel space
> +     */
> +    kvm_halt_in_kernel_allowed = true;
> +
>      cap_has_mp_state = kvm_check_extension(s, KVM_CAP_MP_STATE);
>  
>      type_register_static(&host_arm_cpu_type_info);
> @@ -528,6 +534,51 @@ void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)
>  
>  MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
>  {
> +    ARMCPU *cpu;
> +    uint32_t switched_level;
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
> +    /* Synchronize our internal timer irq lines with the kvm ones */

Oops, we both missed an s/timer/in-kernel device/ here in this comment.
Anyway,

Reviewed-by: Andrew Jones <drjones@redhat.com>
