Received: by 10.28.71.155 with SMTP id m27csp758189wmi;
        Fri, 13 Apr 2018 06:28:28 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49VJjoXA1fSc7eBRwkbQfdBril7y509nbnhzhnONquwGK1I4qT4u26whUApTjRogbFRfmhY
X-Received: by 10.200.22.50 with SMTP id p47mr3092274qtj.135.1523626108081;
        Fri, 13 Apr 2018 06:28:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523626108; cv=none;
        d=google.com; s=arc-20160816;
        b=0Sa+VC2gzmUn/yLhIhMFnBcMeSbZlh6FUiqfnZPZ+yKu0tsKgc88WQ7NM3hRfGk5Ml
         KCMEIwtX9n56UEyjgH4Nc7whcTI3E/5z/CWrUcNdfAR26Ws2PhUBKGuJUdwI/9Yqc826
         DpnxlYkHUzAcF1lb4av3ZHqH10AstBwZOsygDhqWUaGSOYvTxN+ytsMgIi+aU1518QTq
         SmQcOAUzbwSDiKBqNgBsdY1kWFCaCGjgHdckz2WflMlLD+y3WjFD08z7lJ4nsBk+gzmL
         +JfKRYIdgsor9FNKH3YUaZn+isg/t6FLql7zIT7g+kPWR8veaumHhjRkA3lc4c97HluQ
         oGMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=dKRdVifpAVbKu5azIk5AwWokXQgwgONMOZ9COXFuysY=;
        b=0VlX3wRhPUCbJDkwzyH6dg/U/TfuC3B391kbj4c1ZyWARpF6NthRxH8P9D1Z51LbIz
         eni30nQY+1O8RuBoxZhGlkU4nEsoMrn98JmGAfjuwKAolwNPdji9jTTRPygabeb8ljJ3
         3rmBgEj8Xe0V25PBZw2wcU85RPJISnDT6UpugX8Kv9V23ZBkRGCAPgLp/shrvxqEuKM8
         q/RWBtXcLRQit+d8J4EIoyxErAg/zhS36oKOMtHjOIppMQVTjPkpM0du/0DoauQ/VCvp
         39VH/fQRAHjj1L3psI/noYaNQC0dPD6V50AscLWLyLvaedmxSLgTmFp/f8cBPRnNPvz6
         O5Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dyJGpdjS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s25si559391qts.193.2018.04.13.06.28.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 06:28:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dyJGpdjS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53622 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6ykd-0002yU-Fn
	for alex.bennee@linaro.org; Fri, 13 Apr 2018 09:28:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6ykS-0002wS-HW
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:28:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6ykR-0004SA-0P
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:28:16 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:44068)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6ykQ-0004Ra-RV
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:28:14 -0400
Received: by mail-oi0-x244.google.com with SMTP id j143-v6so8346339oih.11
	for <qemu-arm@nongnu.org>; Fri, 13 Apr 2018 06:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dKRdVifpAVbKu5azIk5AwWokXQgwgONMOZ9COXFuysY=;
	b=dyJGpdjSohDI5qn9r51tjL5HVMIcgZivVQtVHyAB/0uEDKybIO5bvlOMrAbROvY+Dx
	Xhl9fdMAVjaAWOCJIYIpfp9esQJUSRBMV/R6v8z2oqUwgtg+ph5WHfgVinHmjnuwz/qP
	UuQsxdJKN6FgHXsN5Y9dj6ph586ou0MSuJKj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dKRdVifpAVbKu5azIk5AwWokXQgwgONMOZ9COXFuysY=;
	b=abbvS7u99ssNCp43CMf60/oHr8aG4K9kE/hMD9KcWuulAwe2M3M5wnRr62XvnSQbNd
	KwBEEy9a+Vjnej3BRGyqGUOe3kmnY4dFV5Gwp/BBUfJkZHVpfllMm7EZfe6QJgfw+tMP
	bXyvwL085dJmU2VaXDMRugncO3GiTrjNSXs9Avp6IzdzNuv7KfjNvMcf0bf5/TQKUjCG
	prCshtsK1Z9U0D93oGqfyI8r+vAoDKwc4f+ob8Qb02EfakKlu8TLjhwoRbwQbPTXKRPX
	QQF+FnD9lu6+PFQDcxdNEHspiIs5zEBEWPXf70mPJSRGFOtsSsW1OGD5Pz38470IxG7G
	NFow==
X-Gm-Message-State: ALQs6tArrjyMxU9QQW8qTE9o2gergCRbOyEdkbyhLkYISI8EkU8EvaiF
	nTmgaAkbD5k4404IoFYl5umyAWaHzlGK8Hye4gwCdw==
X-Received: by 2002:aca:b3c1:: with SMTP id
	c184-v6mr8662311oif.12.1523626094126; 
	Fri, 13 Apr 2018 06:28:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Fri, 13 Apr 2018 06:27:53
	-0700 (PDT)
In-Reply-To: <1522160122-10744-3-git-send-email-eric.auger@redhat.com>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
	<1522160122-10744-3-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Apr 2018 14:27:53 +0100
Message-ID: <CAFEAcA9nkLs3CF0=52DYWygrprgxexrz1_vf0r5RVfNYMA4H5A@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [RFC 2/8] hw/intc/arm_gicv3: Use an array of
 redistributor regions
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, Christoffer Dall <cdall@kernel.org>,
	Marc Zyngier <marc.zyngier@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mDMiZa0YqB47

On 27 March 2018 at 15:15, Eric Auger <eric.auger@redhat.com> wrote:
> In the prospect to support multiple redistributor regions,
> let's introduce a GICv3RDISTRegion struct datatype and a
> statically sized array of those. For the time being, only
> one redistributor region is used.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/intc/arm_gicv3_common.c         |  5 +++--
>  hw/intc/arm_gicv3_kvm.c            |  3 ++-
>  include/hw/intc/arm_gicv3_common.h | 13 ++++++++++++-
>  3 files changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 7b54d52..cb4ee0e 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -199,11 +199,12 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
>
>      memory_region_init_io(&s->iomem_dist, OBJECT(s), ops, s,
>                            "gicv3_dist", 0x10000);
> -    memory_region_init_io(&s->iomem_redist, OBJECT(s), ops ? &ops[1] : NULL, s,
> +    memory_region_init_io(&s->redist_region[0].mr, OBJECT(s),
> +                          ops ? &ops[1] : NULL, s,
>                            "gicv3_redist", 0x20000 * s->num_cpu);
>
>      sysbus_init_mmio(sbd, &s->iomem_dist);
> -    sysbus_init_mmio(sbd, &s->iomem_redist);
> +    sysbus_init_mmio(sbd, &s->redist_region[0].mr);
>  }
>
>  static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index ec37177..a07bc55 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -755,7 +755,8 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
>
>      kvm_arm_register_device(&s->iomem_dist, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
>                              KVM_VGIC_V3_ADDR_TYPE_DIST, s->dev_fd);
> -    kvm_arm_register_device(&s->iomem_redist, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
> +    kvm_arm_register_device(&s->redist_region[0].mr, -1,
> +                            KVM_DEV_ARM_VGIC_GRP_ADDR,
>                              KVM_VGIC_V3_ADDR_TYPE_REDIST, s->dev_fd);
>
>      if (kvm_has_gsi_routing()) {
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index bccdfe1..3cf132f 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -137,12 +137,20 @@ typedef struct GICv3CPUState GICv3CPUState;
>  #define GICV3_S 0
>  #define GICV3_NS 1
>
> +#define GICV3_MAX_RDIST_REGIONS 8

Where does 8 come from? Is it a limit in the kernel, or just
a random number?

> +
>  typedef struct {
>      int irq;
>      uint8_t prio;
>      int grp;
>  } PendingIrq;
>
> +typedef struct GICv3RDISTRegion {

"GICv3RedistRegion"

> +    hwaddr base;
> +    uint32_t count; /* number or redistributors */

"of"

> +    MemoryRegion mr;
> +} GICv3RDISTRegion ;
> +
>  struct GICv3CPUState {
>      GICv3State *gic;
>      CPUState *cpu;
> @@ -210,7 +218,8 @@ struct GICv3State {
>      /*< public >*/
>
>      MemoryRegion iomem_dist; /* Distributor */
> -    MemoryRegion iomem_redist; /* Redistributors */
> +    GICv3RDISTRegion redist_region[GICV3_MAX_RDIST_REGIONS];
> +    uint32_t nb_redist_regions;
>
>      uint32_t num_cpu;
>      uint32_t num_irq;
> @@ -288,6 +297,8 @@ typedef struct ARMGICv3CommonClass {
>
>      void (*pre_save)(GICv3State *s);
>      void (*post_load)(GICv3State *s);
> +    /* register an RDIST region at @base, containing @pfns 64kB pages */
> +    int (*register_redist_region)(GICv3State *s, hwaddr base, uint32_t pfns);

"pfn" is a kernelism (and I can never remember what it means) -- can you
use a more comprehensible variable name, please ?

>  } ARMGICv3CommonClass;
>
>  void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
> --

thanks
-- PMM
