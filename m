Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4156821wrp;
        Mon, 16 Sep 2019 08:36:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzYINJrYyPZS2qINHjxLdetwEVaUj4KKPJCSqFW0FcbLjWreMRd/4gcDWw9Os9uvAaWP1mk
X-Received: by 2002:ac8:60c3:: with SMTP id i3mr193197qtm.212.1568648198875;
        Mon, 16 Sep 2019 08:36:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568648198; cv=none;
        d=google.com; s=arc-20160816;
        b=ik9mMpZGp8kPmK+BGglphyZ823O6D/FqQKVD9YVlT/9fC76CTYD+29ZcsSSqwaBiI5
         AuXNXh5MVKwjkrxqsy3xzzSnkP+RPFmWcGWdemS5/3VhGVuc2+pxoizLckM3/Rl8XHTx
         rRICUUB+8O6qTKTuQLEXe9dcbk+jywyM0dMEh4lHskYQvji203sKl6Mhhp6SVTM7xTMX
         hKugV9/0/Ttc3bF/k+HoGv43cs/dFrYTjUbTekzYf3Qlq/BXWT/bSZuELU32edzexvQX
         yuCns5/hRsGRmobRy2njqveG3AZyh5WEh3GBp1UQYrxM9LfLZ4Y+wIjCMvtA+3sxB7Bz
         icfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=0eHq5a+LvYWsetjz8TbM7vK2hEjTvkXpnvyhM9Xv45c=;
        b=SiP4pI4AMwoLOT2TNmRoNG5gWawPzHYrOhks4QOxoHq5PSj3o9FePwOQH4OA4XqaA2
         Ts97CWtTuT97EM07SPMCEvgjT7wfATjtNWsAdCGuZLSeTSQ+QIGeU1bUbGQCjRysi0vd
         14tBOjqUQxdge+8FXVl/2SWzL2n5hjzKneAZ5fZAgr6D9sj1P6jdxOvVP5OAtm7H+Oau
         uEp+cJTZOvw3uwaiRj/hkuaziaVdM6i53VaFwICHB4OsNgeU2dY6HUZwpJ/DoaW6qXb6
         Bcc+/GYdGwVjZsVI2CHVdUsBM9wRSOeCpLjxXRt2YmC/o3qr5Ew+eNIuZyeFGP6aMoRb
         S9Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p5si9248179qtn.234.2019.09.16.08.36.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2019 08:36:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i9t3N-0001cl-Md
	for alex.bennee@linaro.org; Mon, 16 Sep 2019 11:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55228)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1i9sME-0005lh-BZ
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 10:52:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1i9sMC-0002et-Rn
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 10:52:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57010)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1i9sMC-0002eF-BV; Mon, 16 Sep 2019 10:52:00 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F22AB10F2E81;
 Mon, 16 Sep 2019 14:51:58 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80F2E450C;
 Mon, 16 Sep 2019 14:51:54 +0000 (UTC)
Date: Mon, 16 Sep 2019 16:51:52 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190916145152.c7l7omclx4jf7otl@kamzik.brq.redhat.com>
References: <20190913095639.25447-1-eric.auger@redhat.com>
 <20190913095639.25447-3-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190913095639.25447-3-eric.auger@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Mon, 16 Sep 2019 14:51:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v3 2/3] intc/arm_gic: Support IRQ
 injection for more than 256 vpus
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
Cc: peter.maydell@linaro.org, maz@kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, yuzenghui@huawei.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zqcHBXT/BDoD

On Fri, Sep 13, 2019 at 11:56:38AM +0200, Eric Auger wrote:
> Host kernels that expose the KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 capability
> allow injection of interrupts along with vcpu ids larger than 255.
> Let's encode the vpcu id on 12 bits according to the upgraded KVM_IRQ_LINE
> ABI when needed.
> 
> Given that we have two callsites that need to assemble
> the value for kvm_set_irq(), a new helper routine, kvm_arm_set_irq
> is introduced.
> 
> Without that patch qemu exits with "kvm_set_irq: Invalid argument"
> message.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Zenghui Yu <yuzenghui@huawei.com>
> 
> ---
> 
> v2 -> v3:
> - remove if (cpu !=0), drop mask, as per Drew's suggestions
> ---
>  hw/intc/arm_gic_kvm.c |  7 ++-----
>  target/arm/cpu.c      | 10 ++++------
>  target/arm/kvm.c      | 12 ++++++++++++
>  target/arm/kvm_arm.h  |  1 +
>  4 files changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
> index b56fda144f..9deb15e7e6 100644
> --- a/hw/intc/arm_gic_kvm.c
> +++ b/hw/intc/arm_gic_kvm.c
> @@ -55,7 +55,7 @@ void kvm_arm_gic_set_irq(uint32_t num_irq, int irq, int level)
>       * has separate fields in the irq number for type,
>       * CPU number and interrupt number.
>       */
> -    int kvm_irq, irqtype, cpu;
> +    int irqtype, cpu;
>  
>      if (irq < (num_irq - GIC_INTERNAL)) {
>          /* External interrupt. The kernel numbers these like the GIC
> @@ -72,10 +72,7 @@ void kvm_arm_gic_set_irq(uint32_t num_irq, int irq, int level)
>          cpu = irq / GIC_INTERNAL;
>          irq %= GIC_INTERNAL;
>      }
> -    kvm_irq = (irqtype << KVM_ARM_IRQ_TYPE_SHIFT)
> -        | (cpu << KVM_ARM_IRQ_VCPU_SHIFT) | irq;
> -
> -    kvm_set_irq(kvm_state, kvm_irq, !!level);
> +    kvm_arm_set_irq(cpu, irqtype, irq, !!level);
>  }
>  
>  static void kvm_arm_gicv2_set_irq(void *opaque, int irq, int level)
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 2399c14471..13813fb213 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -576,16 +576,16 @@ static void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
>      ARMCPU *cpu = opaque;
>      CPUARMState *env = &cpu->env;
>      CPUState *cs = CPU(cpu);
> -    int kvm_irq = KVM_ARM_IRQ_TYPE_CPU << KVM_ARM_IRQ_TYPE_SHIFT;
>      uint32_t linestate_bit;
> +    int irq_id;
>  
>      switch (irq) {
>      case ARM_CPU_IRQ:
> -        kvm_irq |= KVM_ARM_IRQ_CPU_IRQ;
> +        irq_id = KVM_ARM_IRQ_CPU_IRQ;
>          linestate_bit = CPU_INTERRUPT_HARD;
>          break;
>      case ARM_CPU_FIQ:
> -        kvm_irq |= KVM_ARM_IRQ_CPU_FIQ;
> +        irq_id = KVM_ARM_IRQ_CPU_FIQ;
>          linestate_bit = CPU_INTERRUPT_FIQ;
>          break;
>      default:
> @@ -597,9 +597,7 @@ static void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
>      } else {
>          env->irq_line_state &= ~linestate_bit;
>      }
> -
> -    kvm_irq |= cs->cpu_index << KVM_ARM_IRQ_VCPU_SHIFT;
> -    kvm_set_irq(kvm_state, kvm_irq, level ? 1 : 0);
> +    kvm_arm_set_irq(cs->cpu_index, KVM_ARM_IRQ_TYPE_CPU, irq_id, !!level);
>  #endif
>  }
>  
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index b2eaa50b8d..b10581fa06 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -744,6 +744,18 @@ int kvm_arm_vgic_probe(void)
>      }
>  }
>  
> +int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level)
> +{
> +    int kvm_irq = (irqtype << KVM_ARM_IRQ_TYPE_SHIFT) | irq;
> +    int cpu_idx1 = cpu % 256;
> +    int cpu_idx2 = cpu / 256;
> +
> +    kvm_irq |= (cpu_idx1 << KVM_ARM_IRQ_VCPU_SHIFT) |
> +               (cpu_idx2 << KVM_ARM_IRQ_VCPU2_SHIFT);
> +
> +    return kvm_set_irq(kvm_state, kvm_irq, !!level);
> +}
> +
>  int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
>                               uint64_t address, uint32_t data, PCIDevice *dev)
>  {
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index b3106c8600..b4e19457a0 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -253,6 +253,7 @@ int kvm_arm_vgic_probe(void);
>  
>  void kvm_arm_pmu_set_irq(CPUState *cs, int irq);
>  void kvm_arm_pmu_init(CPUState *cs);
> +int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
>  
>  #else
>  
> -- 
> 2.20.1
> 
>

Reviewed-by: Andrew Jones <drjones@redhat.com>
