Received: by 10.28.71.155 with SMTP id m27csp765798wmi;
        Fri, 13 Apr 2018 06:35:33 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/lk3CK9d/xWFTLDE4Q36UL0jxB1AsL72Ux41ivR+gkLpG7FxPctaIythJDPCqSLcena5KZ
X-Received: by 2002:a25:29c1:: with SMTP id p184-v6mr4440428ybp.253.1523626533215;
        Fri, 13 Apr 2018 06:35:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523626533; cv=none;
        d=google.com; s=arc-20160816;
        b=yPstPo0ifnfnuts9xfLOGr964afNJRRDoqlP6bSlHB4hh1CHZeGORYCxlZTw29sBEQ
         3NtTWngmKQlJEvQFrcJVj4dZWUlhsQ/c9LMP4Px8i7JV9HpGdyXrLi0DT60b9YJMoHuM
         ZbPsgen83KmXTrKlrfKM0dpEBUezCttCUtCf2d7zK5HKTI3qZfxnB4j8MxRkAmUocDdb
         Yqn3Ug7I7wDDYbklNbVbMKbCck2vSFLsul0pvIQD1ZrU1Y+stoF/0QoybsTZqc9LnRyE
         +vd/6ICmqjhztNwpfp8armqM94Yr2mvaSHmJrWevZBHZuGBJLVKXmrGznNyUYQ8en4Sz
         DxUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=6Mtltdhe3k1ZZFNkBSsq2rK4qNcWvbZ7yLdUOW1Dz1g=;
        b=RYsIwMTOsvTY0rjrjxeES4NxSA43PGaruV098Ibl3R+ZRRDtp+qR6V04dUK+z6YjjR
         syDciqqjO3FhR/1Ruk6SHuSub9yHnGTxypkHGhNOfpn8d76O1MIdSccnLDYGWZPK/3WT
         7sz2a30XB6xmlba+P5qikPb6u1iB8IGcZVfFrwsiCQFgiftFukLZ/mZsYCtq2QkzbEd2
         G3VaHoWtkSAc8HnVpg0Vs5aQ/aeY4Xhpi0njPMhOx9vJi5Tojl9xy56WZb6PcOZk/sv1
         fLKs0+wp7hAV0RyfeXlDJecxCZcVWuiQZPoEEJ5v+QjhzdquKrNTAQeOQqdE3T0zThnS
         rOqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UeSbHNRU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g15si3545989qta.378.2018.04.13.06.35.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 06:35:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UeSbHNRU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54048 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6yrU-0007LQ-JX
	for alex.bennee@linaro.org; Fri, 13 Apr 2018 09:35:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6yrC-0007FR-L7
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:35:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6yrB-0008U1-Dy
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:35:14 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:36760)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6yrB-0008TK-0l
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:35:13 -0400
Received: by mail-ot0-x243.google.com with SMTP id n40-v6so9868494otd.3
	for <qemu-arm@nongnu.org>; Fri, 13 Apr 2018 06:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6Mtltdhe3k1ZZFNkBSsq2rK4qNcWvbZ7yLdUOW1Dz1g=;
	b=UeSbHNRUnJGi2ZTQ8G23mj1wD2jZ7xXDSnTQ7/7/Hx6gvMYXqBzbPzaS0QE/hUFFFC
	JjbSG/aFSfmYWzMMax0NXF5eEIEOMeeqVvkzXn86nhX8KL1XVA79JiQJFm6547cJNiHt
	JqnE6JnoO8ukD3VDsPm9wkiZbrz/YADo0tybc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6Mtltdhe3k1ZZFNkBSsq2rK4qNcWvbZ7yLdUOW1Dz1g=;
	b=Qv5BbmYKM0BrOcFMoXAXO9yEeLRumlBhAHANQWxyrLFyKR4b3iObW0qLTJwt0lUkmY
	MDYC+6KblIQ/5iKScZ9xpucArOXp+IDx8bqLvEpRaLQC7dMS+RMksSxr1ORe2ASzgWRd
	NqfBYkxJxti6TJS3Pp8qumemZCIkMJ7PE1PzwVWVplafeOtJgc8fgPPuTigaYRPNoK1G
	t00IRI5zTiyka5uIWd/OTby5aorpKXf7PMeWA4jk12kBhVwbSo3y1hrrlmi6nQ0YFOjk
	8RHsvqMfDLQJ8PcVq+bURg0WDondFvaLpYMrVNnxKJGRVfnuNqxHXR5P9hh1LS7UF45q
	GalQ==
X-Gm-Message-State: ALQs6tA0lI0omo3i8dQym4X8pOa9yxXTOk6BfSWCoK+x+HBmyFzpUexd
	/znB3lDfooxEE8XGvYl/T3SU0fI1zIQw14FhwZ4UM8Ch
X-Received: by 2002:a9d:5cc1:: with SMTP id
	r1-v6mr3479444oti.258.1523626512020; 
	Fri, 13 Apr 2018 06:35:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Fri, 13 Apr 2018 06:34:51
	-0700 (PDT)
In-Reply-To: <1522160122-10744-5-git-send-email-eric.auger@redhat.com>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
	<1522160122-10744-5-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Apr 2018 14:34:51 +0100
Message-ID: <CAFEAcA8sQSuVcYPyE58tjapxxe6FNdD5qcyftYrZeWQ0fbev8w@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [RFC 4/8] hw/intc/arm_gicv3: Implement
 register_redist_region API
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
X-TUID: 0NNQeSFZehn9

On 27 March 2018 at 15:15, Eric Auger <eric.auger@redhat.com> wrote:
> This patch defines and implements the register_redist_region() API
> for both arm_gicv3 and arm_gicv3_kvm. Virt machine now directly calls
> the function to set the single redistributor region. The associated
> memory region init is removed from gicv3_init_irqs_and_mmio.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt.c                      |  6 +++++-
>  hw/intc/arm_gicv3.c                | 21 +++++++++++++++++++++
>  hw/intc/arm_gicv3_common.c         | 10 ++++++----
>  hw/intc/arm_gicv3_kvm.c            | 38 +++++++++++++++++++++++++++++++++++---
>  include/hw/intc/arm_gicv3_common.h |  5 +++--
>  5 files changed, 70 insertions(+), 10 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 94dcb12..0eef6aa 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -526,7 +526,11 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>      gicbusdev = SYS_BUS_DEVICE(gicdev);
>      sysbus_mmio_map(gicbusdev, 0, vms->memmap[VIRT_GIC_DIST].base);
>      if (type == 3) {
> -        sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_REDIST].base);
> +        ARMGICv3CommonClass *agcc = ARM_GICV3_COMMON_GET_CLASS(gicdev);
> +
> +        agcc->register_redist_region((GICv3State *)gicdev,
> +                                 vms->memmap[VIRT_GIC_REDIST].base,
> +                                 vms->memmap[VIRT_GIC_REDIST].size >> 17);

What is this magic number 17 ?

>      } else {
>          sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_CPU].base);
>      }
> diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
> index 479c667..37f7564 100644
> --- a/hw/intc/arm_gicv3.c
> +++ b/hw/intc/arm_gicv3.c
> @@ -378,6 +378,26 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
>      gicv3_init_cpuif(s);
>  }
>
> +static int arm_gicv3_register_redist_region(GICv3State *s, hwaddr base,
> +                                            uint32_t count)
> +{
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(s);
> +
> +    if (s->nb_redist_regions > 0) {
> +        return -EINVAL;
> +    }
> +
> +    s->redist_region[s->nb_redist_regions].base = base;
> +    s->redist_region[s->nb_redist_regions].count = count;
> +    memory_region_init_io(&s->redist_region[s->nb_redist_regions].mr, OBJECT(s),
> +                          gic_ops, s, "gicv3_redist", 0x20000 * count);
> +    sysbus_init_mmio(sbd, &s->redist_region[s->nb_redist_regions].mr);
> +    sysbus_mmio_map(sbd, 1, base);

Devices should never call sysbus_mmio_map() -- they should
just provide sysbus MMIO regions, and let the board code map
them in the right places. More generally the device code
shouldn't be told where in the memory map it is. kvm_arm_register_device()
goes to some lengths to maintain this abstraction (by setting
up a notifier to tell the kernel where things are only once
everything has been created and mapped).

Similar remarks apply to other changes in this patch (and
I suspect will need some restructuring to address).

> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index 3cf132f..549ccc3 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -220,6 +220,7 @@ struct GICv3State {
>      MemoryRegion iomem_dist; /* Distributor */
>      GICv3RDISTRegion redist_region[GICV3_MAX_RDIST_REGIONS];
>      uint32_t nb_redist_regions;
> +    bool support_multiple_redist_regions;
>
>      uint32_t num_cpu;
>      uint32_t num_irq;
> @@ -297,8 +298,8 @@ typedef struct ARMGICv3CommonClass {
>
>      void (*pre_save)(GICv3State *s);
>      void (*post_load)(GICv3State *s);
> -    /* register an RDIST region at @base, containing @pfns 64kB pages */
> -    int (*register_redist_region)(GICv3State *s, hwaddr base, uint32_t pfns);
> +    /* register an RDIST region at @base, containing @count redistributors */
> +    int (*register_redist_region)(GICv3State *s, hwaddr base, uint32_t count);

This looks like a change that should have been folded into a
previous patch.

>  } ARMGICv3CommonClass;
>
>  void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
> --
> 2.5.5

thanks
-- PMM
