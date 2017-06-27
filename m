Received: by 10.25.227.6 with SMTP id a6csp1717878lfh;
        Tue, 27 Jun 2017 05:37:25 -0700 (PDT)
X-Received: by 10.84.195.129 with SMTP id j1mr5635164pld.191.1498567045522;
        Tue, 27 Jun 2017 05:37:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498567045; cv=none;
        d=google.com; s=arc-20160816;
        b=Vvq1YA6VoZO5VSbYVu7G3huFJOKDL+FN1P/O42FLr9DzcFYYkbDsgs00ajxzETyvfe
         abE4NttBeP+nJNzce7RHs2UTrgoDx87IDq3xl4fcTvIL6raHwcHHDcvXmkutLbP7aAeP
         0yTtoG7vhRcA6M5uwIU5T86IEbteMUlbOGYRTq3H5AbniYDtqcOXlGZJx1oweHB67wEz
         rGXZm9I1RZTsaKzBndsc0S5xOYxBaNNsXLGuHbh/s5Me45+O7gh6QSTSeod6UzFDOdto
         QWaR25l5T50A1uwdFehfH6Gwwr5C/U2td4kXbhNsW/JQtPJDkhYC6e8QR+u5zsWwTOKV
         WcvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-filter:dmarc-filter:arc-authentication-results;
        bh=b3WSF9tej3seRSRIjSWTPvl1QlP/SZ3k6wM3WzxduzE=;
        b=i61dNw/6uYtXcrY89KNoqUDpK3S/IC1Q3xQ9HFQvdZ61Fq+KdJ9ymxxzOMLSu8TubV
         r/811tN9q5ixySzM7w8DW51puxgAfu959VPASk8vtxVMwFUuFt5TiRLVj6xOysrtxMHx
         HqHHzMJqoxDsZBys9RhXTNciKgX4NBsRyV1cZrEIc5xwWPntQWvDgLH5joxCT2cyt1Wr
         QFUsznXJ3hDMJVrGe3IrwZzcIwiwK09secMElDr8z+z5d6okqoHaG99BnnFXTYQUyXj9
         +GfBuktXYgPrg8wTOQyjZ1Zj+Gg65eWTwLZQLrSZjFDYUiNWCIKWGXqFiL8K2LbiLrhF
         28Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id k2si1873275pfh.174.2017.06.27.05.37.25;
        Tue, 27 Jun 2017 05:37:25 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752694AbdF0MhY (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Tue, 27 Jun 2017 08:37:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50574 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751699AbdF0MhW (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 27 Jun 2017 08:37:22 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 4697C40F2C;
        Tue, 27 Jun 2017 12:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4697C40F2C
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 4697C40F2C
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B7D582AFA;
        Tue, 27 Jun 2017 12:37:20 +0000 (UTC)
Date:   Tue, 27 Jun 2017 14:37:18 +0200
From:   Andrew Jones <drjones@redhat.com>
To:     Alexander Graf <agraf@suse.de>
Cc:     qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
        kvm@vger.kernel.org, cdall@linaro.org, qemu-arm@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] ARM: KVM: Enable in-kernel timers with user
 space gic
Message-ID: <20170627123718.mdfn3o7heu6v7x6n@kamzik.brq.redhat.com>
References: <1498512656-75289-1-git-send-email-agraf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1498512656-75289-1-git-send-email-agraf@suse.de>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Tue, 27 Jun 2017 12:37:22 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: crq2Fe7yFC9r

On Mon, Jun 26, 2017 at 11:30:56PM +0200, Alexander Graf wrote:
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
> ---
>  accel/kvm/kvm-all.c    |  5 +++++
>  accel/stubs/kvm-stub.c |  5 +++++
>  hw/intc/arm_gic.c      |  7 +++++++
>  include/sysemu/kvm.h   | 11 +++++++++++
>  target/arm/cpu.h       |  3 +++
>  target/arm/kvm.c       | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 80 insertions(+)
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
> index b305d90..4ffd905 100644
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
> +            error_setg(errp, "KVM with user space irqchip only works when the "
> +                             "host kernel supports KVM_CAP_ARM_USER_IRQ");
> +            return;

extra spaces here

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
> index 16a1e59..88ec3ee 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -706,6 +706,9 @@ struct ARMCPU {
>      void *el_change_hook_opaque;
>  
>      int32_t node_id; /* NUMA node this CPU belongs to */
> +
> +    /* Used to synchronize KVM and QEMU timer levels */

Eventually it won't only be for timer levels

> +    uint8_t device_irq_level;
>  };
>  
>  static inline ARMCPU *arm_env_get_cpu(CPUARMState *env)
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 4555468..29ee72d 100644
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
> @@ -528,6 +534,49 @@ void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)
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
> +    if (run->s.regs.device_irq_level != cpu->device_irq_level) {
> +        switched_level = cpu->device_irq_level ^ run->s.regs.device_irq_level;
> +
> +        qemu_mutex_lock_iothread();
> +
> +        if (switched_level & KVM_ARM_DEV_EL1_VTIMER) {
> +            qemu_set_irq(cpu->gt_timer_outputs[GTIMER_VIRT],
> +                         run->s.regs.device_irq_level & KVM_ARM_DEV_EL1_VTIMER);

Should be !!(run->s.regs.device_irq_level & KVM_ARM_DEV_EL1_VTIMER)

> +            switched_level &= ~KVM_ARM_DEV_EL1_VTIMER;
> +        }
> +
> +        if (switched_level & KVM_ARM_DEV_EL1_PTIMER) {
> +            qemu_set_irq(cpu->gt_timer_outputs[GTIMER_PHYS],
> +                         run->s.regs.device_irq_level & KVM_ARM_DEV_EL1_PTIMER);

Also need the !!

> +            switched_level &= ~KVM_ARM_DEV_EL1_PTIMER;
> +        }
> +
> +        /* XXX PMU IRQ is missing */

So I was wondering why you chose not to wire up the PMU in order to finish
this off, since I knew KVM has commit 3dbbdf78636e "KVM: arm/arm64: Report
PMU overflow interrupts to userspace irqchip", which I presume should
allow the PMU to work too. However, attempting to start a guest with
-machine virt,accel=kvm,kernel-irqchip=off -cpu host,pmu=on doesn't provide
it a PMU. AFAICT, that's only because KVM still has

        /*
         * We currently require an in-kernel VGIC to use the PMU emulation,
         * because we do not support forwarding PMU overflow interrupts to
         * userspace yet.
         */
        if (!irqchip_in_kernel(vcpu->kvm) || !vgic_initialized(vcpu->kvm))
                return -ENODEV;

in kvm_arm_pmu_v3_init(). Anyone know why that wasn't removed with
3dbbdf78636e?

> +
> +        if (switched_level) {
> +            qemu_log_mask(LOG_UNIMP, "%s: unhandled device IRQ %x\n",

Misleading message here. It's not a device IRQ that switched_level
contains.

> +                          __func__, switched_level);
> +        }
> +
> +        /* We also mark unknown levels as processed to not waste cycles */
> +        cpu->device_irq_level = run->s.regs.device_irq_level;
> +        qemu_mutex_unlock_iothread();
> +    }
> +
>      return MEMTXATTRS_UNSPECIFIED;
>  }
>  
> -- 
> 1.8.5.6
> 
>

Thanks,
drew 
