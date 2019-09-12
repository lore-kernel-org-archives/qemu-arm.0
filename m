Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1810967wrp;
        Thu, 12 Sep 2019 00:37:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy+8NOuO6H73jyD2v9+OcWCLlB9pFUOLQnUgLe0bRtvaPktO32rTz7FKM4oT+X/pYmg0LQd
X-Received: by 2002:ae9:f113:: with SMTP id k19mr7631415qkg.377.1568273822143;
        Thu, 12 Sep 2019 00:37:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568273822; cv=none;
        d=google.com; s=arc-20160816;
        b=jGYvdHtPlrA7ssKl5O7ZAlegHw5x7laAexP3l6QKLMO/IskZ0gsCCLn0oK75VxlkuF
         o6Ihf+I5R9K2BcAkF+eXjkf607l6REugHTscyuiKEi0GRd3YuHz3ILZRtf+6BVYOSTJt
         Pps8h0zvzuEZX+5nIZJJ3+NJfOZISKUC7mOpk5VaH/7frF/Husu2AnhKcJmskCCZv+im
         Sq6hcKQgcU1fVqQ53PEn2XySQK5LHdGbiLVFCzhxV7fvDYJYrxsM2ueW1bqkfHJW5vlM
         WIW5nUIrX3gIyNlMeMb5YmYFX3PhSqG+whrs3YcUijdXIBd5v9pPcx9V1L2BM9WMVoJt
         n83A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=mNtDDbThixtfek3Cj+fh9KCCDeKhCgPyBAL9mf4ETRM=;
        b=oHEYf0eHEd4/zN/3PVFcqFBvpdHnkCPBNezhTwbgH7heU80yrm7nSghT0ML6/dWXes
         UzUUGJQJjIZpRVfb9r/L/pSvDRerRIpGSx+2FC46bQddpcyZ6bvoqbIFTy8J5CZN1rRv
         OLzijurpm83kNz3bbBZw5bGP2YzxJcnBMC6MqLZ/bBgzPQDP1QhWbvn9Ow2GQIFgUrYe
         DspV1w0DivCYcrVBLruFhfmyCF/ZTfgiZrqFhS3GLIkMDxe0TF63kO43dumhv668TZ6t
         m/NWcEkZLQhSuJSVfMQbYMyA4YeFT+WzkYUuzCwPJuO1cvq1x9+T7WMwtNT/UCOlsB6B
         NbBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m58si17128709qta.48.2019.09.12.00.37.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Sep 2019 00:37:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i8Jf3-0000WY-8C
	for alex.bennee@linaro.org; Thu, 12 Sep 2019 03:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53587)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1i8Jes-0000WH-Vf
 for qemu-arm@nongnu.org; Thu, 12 Sep 2019 03:36:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1i8Jer-0001zL-JT
 for qemu-arm@nongnu.org; Thu, 12 Sep 2019 03:36:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:9067)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1i8Jer-0001ym-Bw; Thu, 12 Sep 2019 03:36:49 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E55DE3084295;
 Thu, 12 Sep 2019 07:36:47 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0437419C6A;
 Thu, 12 Sep 2019 07:36:43 +0000 (UTC)
Date: Thu, 12 Sep 2019 09:36:41 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190912073641.p5x4gtt2s5rlrhl6@kamzik.brq.redhat.com>
References: <20190911155125.11932-1-eric.auger@redhat.com>
 <20190911155125.11932-3-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190911155125.11932-3-eric.auger@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 12 Sep 2019 07:36:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 2/3] intc/arm_gic: Support IRQ
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
X-TUID: GMn2azGrIjU+

On Wed, Sep 11, 2019 at 05:51:24PM +0200, Eric Auger wrote:
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
> ---
>  hw/intc/arm_gic_kvm.c |  7 ++-----
>  target/arm/cpu.c      | 10 ++++------
>  target/arm/kvm.c      | 16 ++++++++++++++++
>  target/arm/kvm_arm.h  |  1 +
>  4 files changed, 23 insertions(+), 11 deletions(-)
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
> index b2eaa50b8d..6cdfa2204f 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -744,6 +744,22 @@ int kvm_arm_vgic_probe(void)
>      }
>  }
>  
> +int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level)
> +{
> +    int kvm_irq = 0;

No need to init to zero, and could just immediately init with the
line below instead.

> +
> +    kvm_irq = (irqtype << KVM_ARM_IRQ_TYPE_SHIFT) | irq;
> +
> +    if (cpu != 0) {

No need for this 'if'

> +        int cpu_idx2 = cpu / 256;
> +        int cpu_idx1 = cpu % 256;
> +
> +        kvm_irq |= (cpu_idx1 << KVM_ARM_IRQ_VCPU_SHIFT) |
> +           ((cpu_idx2 & KVM_ARM_IRQ_VCPU2_MASK) << KVM_ARM_IRQ_VCPU2_SHIFT);

Masking should be unnecessary as the only way it'll do anything is if we
have vcpus >= 4096, which I imagine will never happen or will be guarded
against happening elsewhere. Silently masking doesn't look right anyway,
so I'd either add an assert(cpu_idx2 < 16) and drop the masking or just
drop the masking.

> +    }
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

Thanks,
drew 
