Received: by 10.25.44.15 with SMTP id s15csp544044lfs;
        Fri, 21 Jul 2017 04:30:26 -0700 (PDT)
X-Received: by 10.55.130.66 with SMTP id e63mr9085680qkd.253.1500636626816;
        Fri, 21 Jul 2017 04:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500636626; cv=none;
        d=google.com; s=arc-20160816;
        b=vzp+IE6xz8duMiN+gbMRXRR7bR4jC0IA7Fc1vASxoEc1vg76ns0MGihvQ1vovw0qc7
         0jqG5OmoTDQVNccR3h29WmXzlcAa5nYenrPXQRdy/DhQmAX/ufNpnKh9FCVEJ9yCdcbV
         K59YSUU2LGiO8LnF4Y4VhPfT5nF9DBYa3Mee1NWb5RHfDf4hQtxQJeSqrDX3OxuaEHuD
         KzyMuFEPcG0ThPp3ewanUeaLy4zhJpIjWgN89A0VBqRXSl5tyVTes/z0HlHfxaWHHjQX
         pMikFfzESklVlohvchlHnbujwFTuCaTuSQFO5Ov8FoHJMoAoDl8R7ODMXtSeRhbAaFW9
         Pn8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=uxY/PzXrA7bU8isw/A1a1kFgkkauOg06pOrpXdZQ4TE=;
        b=Wc+P3z4/I+LZB4ZVGTnvdfbR35HRaIsH/CStiTlKiUvc6+KoR69aNmZ2RpuhRlz5JX
         kJ59LRQkKhPz0w1WOTMqz+EG4dp7eD0l0Y8zS9nQAKUSIN2Zpkqcl5dLjkYlMDEYb067
         Qo8/d39UuoTSOC0BLKkQKujhndHXI4mxPn+b3N+d0afGqWFSLU54Dkobv/hycpzWqWdZ
         PxhBY8xwBjBH+Z8oJfk6m6PMPoEFvmDAzTcEDJbNOXrauCdWprOdJgMqA229ivA19f3p
         7I0abuaUlBb6RVdI0SA1wdV5rYg/IwqF4h7yYB7nHx7vC0vtbuGseYRFA6CdZfGj82aU
         l9lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=fqeg6wCu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s125si3593022qkb.174.2017.07.21.04.30.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Jul 2017 04:30:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=fqeg6wCu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42383 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dYW8W-0001x6-6K
	for alex.bennee@linaro.org; Fri, 21 Jul 2017 07:30:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cdall@linaro.org>) id 1dYW7k-0001bx-5F
	for qemu-devel@nongnu.org; Fri, 21 Jul 2017 07:29:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cdall@linaro.org>) id 1dYW7f-000694-8U
	for qemu-devel@nongnu.org; Fri, 21 Jul 2017 07:29:36 -0400
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:38417)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <cdall@linaro.org>) id 1dYW7e-00067W-Vl
	for qemu-devel@nongnu.org; Fri, 21 Jul 2017 07:29:31 -0400
Received: by mail-wm0-x22d.google.com with SMTP id w191so11441737wmw.1
	for <qemu-devel@nongnu.org>; Fri, 21 Jul 2017 04:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=uxY/PzXrA7bU8isw/A1a1kFgkkauOg06pOrpXdZQ4TE=;
	b=fqeg6wCuIe2D3xD7pDhDXboAbFSHbFt+5hAsHeqDGwMC8SUDAHk0wBE8O6MmZQ0egS
	sj9AvpruyiRSShIS58AHj5UJoQNkuPodBKgS3EsIsmdFlZXgMeYotrDgeHXCpo2vaZH/
	l02JIp5nPHLnep6ILW5gBD0LFbh4YbiSHSZ0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=uxY/PzXrA7bU8isw/A1a1kFgkkauOg06pOrpXdZQ4TE=;
	b=SCGFtzxppyFzwbAtJyRI6elpTlLBqvby7MQ4X+A3UDjeBDXc09Dum7wiQMLh4bCETu
	q438hM+ChL1FJfhP9jFip727HTrRjmAbVlEHlq8l8cSrpoiHy86yZzK0HqV7KmfTnptR
	+IknzB1LdIHGZ2tfUweg6M2uSJUxYSeBD41h3H2u9RU0I82cT8yygLLeqCcI4WTU8AW1
	KBw1jN9/af3bfNPYpCS+gtpnKNuOeMViqJ4A/35dJnlEl21RRORA8ikQuhNUMRKtYTQP
	ptBLHn4tlLJGIqp5azu91/xP8+ayG5aaqM55w022OCMwF7qefDBpoau58wVdXUeLjq2J
	9i6Q==
X-Gm-Message-State: AIVw112pUIQJj/2BBMzI7B6QsFF5fOFVxGId2aFDP8guFKlv+AgATFvS
	xmODTsuXb5UxkdutVc19jw==
X-Received: by 10.80.135.79 with SMTP id 15mr4161964edv.35.1500636569847;
	Fri, 21 Jul 2017 04:29:29 -0700 (PDT)
Received: from localhost (xd93ddc2d.cust.hiper.dk. [217.61.220.45])
	by smtp.gmail.com with ESMTPSA id l3sm3047634edc.32.2017.07.21.04.29.29
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 21 Jul 2017 04:29:29 -0700 (PDT)
Date: Fri, 21 Jul 2017 13:29:29 +0200
From: Christoffer Dall <cdall@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20170721112929.GD16350@cbox>
References: <1500471597-2517-1-git-send-email-drjones@redhat.com>
	<1500471597-2517-5-git-send-email-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1500471597-2517-5-git-send-email-drjones@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-devel] [PATCH v2 4/4] target/arm/kvm: pmu: improve error
 handling
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	agraf@suse.de
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ida9gmfhG0oE

On Wed, Jul 19, 2017 at 09:39:57AM -0400, Andrew Jones wrote:
> If a KVM PMU init or set-irq attr call fails we just silently stop
> the PMU DT node generation. The only way they could fail, though,
> is if the attr's respective KVM has-attr call fails. But that should
> never happen if KVM advertises the PMU capability, because both
> attrs have been available since the capability was introduced. Let's
> just abort if this should-never-happen stuff does happen, because,
> if it does, then something is obviously horribly wrong.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>

Reviewed-by: Christoffer Dall <cdall@linaro.org>

> ---
>  hw/arm/virt.c        |  9 +++------
>  target/arm/kvm32.c   |  3 +--
>  target/arm/kvm64.c   | 28 ++++++++++++++++++++--------
>  target/arm/kvm_arm.h | 15 ++++-----------
>  4 files changed, 28 insertions(+), 27 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a215330444da..4bc50964d52b 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -496,13 +496,10 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
>              return;
>          }
>          if (kvm_enabled()) {
> -            if (kvm_irqchip_in_kernel() &&
> -                !kvm_arm_pmu_set_irq(cpu, PPI(VIRTUAL_PMU_IRQ))) {
> -                return;
> -            }
> -            if (!kvm_arm_pmu_init(cpu)) {
> -                return;
> +            if (kvm_irqchip_in_kernel()) {
> +                kvm_arm_pmu_set_irq(cpu, PPI(VIRTUAL_PMU_IRQ));
>              }
> +            kvm_arm_pmu_init(cpu);
>          }
>      }
>  
> diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> index e3aab89a1a94..717a2562670b 100644
> --- a/target/arm/kvm32.c
> +++ b/target/arm/kvm32.c
> @@ -522,10 +522,9 @@ bool kvm_arm_hw_debug_active(CPUState *cs)
>      return false;
>  }
>  
> -int kvm_arm_pmu_set_irq(CPUState *cs, int irq)
> +void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
>  {
>      qemu_log_mask(LOG_UNIMP, "%s: not implemented\n", __func__);
> -    return 0;
>  }
>  
>  int kvm_arm_pmu_init(CPUState *cs)
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index ec7d85314acc..6554c30007a4 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -387,30 +387,36 @@ static bool kvm_arm_pmu_set_attr(CPUState *cs, struct kvm_device_attr *attr)
>  
>      err = kvm_vcpu_ioctl(cs, KVM_HAS_DEVICE_ATTR, attr);
>      if (err != 0) {
> +        error_report("PMU: KVM_HAS_DEVICE_ATTR: %s", strerror(-err));
>          return false;
>      }
>  
>      err = kvm_vcpu_ioctl(cs, KVM_SET_DEVICE_ATTR, attr);
> -    if (err < 0) {
> -        fprintf(stderr, "KVM_SET_DEVICE_ATTR failed: %s\n",
> -                strerror(-err));
> -        abort();
> +    if (err != 0) {
> +        error_report("PMU: KVM_SET_DEVICE_ATTR: %s", strerror(-err));
> +        return false;
>      }
>  
>      return true;
>  }
>  
> -int kvm_arm_pmu_init(CPUState *cs)
> +void kvm_arm_pmu_init(CPUState *cs)
>  {
>      struct kvm_device_attr attr = {
>          .group = KVM_ARM_VCPU_PMU_V3_CTRL,
>          .attr = KVM_ARM_VCPU_PMU_V3_INIT,
>      };
>  
> -    return kvm_arm_pmu_set_attr(cs, &attr);
> +    if (!ARM_CPU(cs)->has_pmu) {
> +        return;
> +    }
> +    if (!kvm_arm_pmu_set_attr(cs, &attr)) {
> +        error_report("failed to init PMU");
> +        abort();
> +    }
>  }
>  
> -int kvm_arm_pmu_set_irq(CPUState *cs, int irq)
> +void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
>  {
>      struct kvm_device_attr attr = {
>          .group = KVM_ARM_VCPU_PMU_V3_CTRL,
> @@ -418,7 +424,13 @@ int kvm_arm_pmu_set_irq(CPUState *cs, int irq)
>          .attr = KVM_ARM_VCPU_PMU_V3_IRQ,
>      };
>  
> -    return kvm_arm_pmu_set_attr(cs, &attr);
> +    if (!ARM_CPU(cs)->has_pmu) {
> +        return;
> +    }
> +    if (!kvm_arm_pmu_set_attr(cs, &attr)) {
> +        error_report("failed to set irq for PMU");
> +        abort();
> +    }
>  }
>  
>  static inline void set_feature(uint64_t *features, int feature)
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index cab5ea9be55c..ff53e9fafb7a 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -195,8 +195,8 @@ int kvm_arm_sync_mpstate_to_qemu(ARMCPU *cpu);
>  
>  int kvm_arm_vgic_probe(void);
>  
> -int kvm_arm_pmu_set_irq(CPUState *cs, int irq);
> -int kvm_arm_pmu_init(CPUState *cs);
> +void kvm_arm_pmu_set_irq(CPUState *cs, int irq);
> +void kvm_arm_pmu_init(CPUState *cs);
>  
>  #else
>  
> @@ -205,15 +205,8 @@ static inline int kvm_arm_vgic_probe(void)
>      return 0;
>  }
>  
> -static inline int kvm_arm_pmu_set_irq(CPUState *cs, int irq)
> -{
> -    return 0;
> -}
> -
> -static inline int kvm_arm_pmu_init(CPUState *cs)
> -{
> -    return 0;
> -}
> +static inline void kvm_arm_pmu_set_irq(CPUState *cs, int irq) {}
> +static inline void kvm_arm_pmu_init(CPUState *cs) {}
>  
>  #endif
>  
> -- 
> 1.8.3.1
> 
