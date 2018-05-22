Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1441801wme;
        Tue, 22 May 2018 05:39:23 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoNRc9VZIqx7Y28Ty1I3ZUoT4hUF8qLJKczW2kEts0k+MTMqhb3M7PerEvo+849J79iVkht
X-Received: by 2002:a0c:b02e:: with SMTP id k43-v6mr21685066qvc.231.1526992763691;
        Tue, 22 May 2018 05:39:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526992763; cv=none;
        d=google.com; s=arc-20160816;
        b=ulux8pB2KqiVVq1m19+rMy8Md5afY38EdN+k+f/Nm9EPhWeJoew3syfHL/hN7NmVZt
         VhGm8IqhE3GTJhpNvfZ7x29j8YXV4yhFSrSRIb+VIowy3ehbhKrp6zgq1hpyn+/WlZnF
         ijpXiLyGZ3TmGQ6rf63OPSoCxA5yrmfBPpvXHEw6W+IQ1grUbrhe3Gu64N5Xwh7esR40
         UH74sFhpv/k54wctSGtQME3zlCVqcQQhvnGsTPzLoEYKJ9a9ECY5KnYlj4alao2Mu849
         8tXcTE7r7ODZ2Qn9qP8XNAS18PARw/DzTLUReCyZ1dHQDmLS1rLy8QjhJ5qys2a8QWRQ
         GjSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=67Gq6DeeqzFNbFUSZbB+cvIB6B3mm5llEZ+0YbbDyfk=;
        b=ygjjBs+/OvPFzrOiCtq6zf2qmwDOiIaUN7e6J/S1uUWszd0blhzfFQdVjc3gzxf+qp
         mFNpCZu93+mlC9wZvJ5aokyATYXSJXxxSq8m8yHh/RTLCNmdiW8YqkuLgKrFbihU6aO2
         Mg3oIAFfyzYlLIprlFFnB/CMd/Wb+n6154sR1P7t1BT4rNg9ZZ9WFh0BmSbkZT//Q1ZZ
         8yVoYh4GQzGfPa0Zw+iW0lrtePMG3PpNdmta67dJNDF5Jb9UOlecGJIR8HlHv4xSl1Oy
         Sk/TwnRmOD7UZiU9cCJP8rCSkyZbGuWLjpDbYQh/nMq93vQvULEJili0i2Knhf+Xk1pF
         +uSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OaqNTz6F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l88-v6si2896915qva.48.2018.05.22.05.39.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 May 2018 05:39:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OaqNTz6F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55531 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fL6ZX-0003pW-6Q
	for alex.bennee@linaro.org; Tue, 22 May 2018 08:39:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fL6ZM-0003os-8Q
	for qemu-arm@nongnu.org; Tue, 22 May 2018 08:39:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fL6ZK-0003Fz-VK
	for qemu-arm@nongnu.org; Tue, 22 May 2018 08:39:12 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:35483)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fL6ZK-0003FC-OE
	for qemu-arm@nongnu.org; Tue, 22 May 2018 08:39:10 -0400
Received: by mail-ot0-x244.google.com with SMTP id h8-v6so20757528otb.2
	for <qemu-arm@nongnu.org>; Tue, 22 May 2018 05:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=67Gq6DeeqzFNbFUSZbB+cvIB6B3mm5llEZ+0YbbDyfk=;
	b=OaqNTz6FpydH0trLXhpv0KZgMc8V2By6qqCk9Hx8KboOkQCAg+JbBkUVNONMD5br7q
	r4/gowTo6hAbAhX7uCYpvSMnxwAgJnWN93izT6x3EcNn/xBY7nsJjp1rH4uGCckaJyBY
	Wmk/UYOtKIZn6Qi1tIJNaPpDhpvbzjVRN+0H8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=67Gq6DeeqzFNbFUSZbB+cvIB6B3mm5llEZ+0YbbDyfk=;
	b=Cs4cKX4S/WoHb9dlqkfE29wQOVc4wFj7k1qbuUUFGGfus9oKbUXOu6eJO9n6vRUYCM
	1fqXblv5AccX07PB7Vk1Lscxf4erFUB8a7PS22Aq5Q/Km96e7Y7gXmYHkRXgL44TAr1S
	5v0Cg/3UexSK66yATLpEB7sqEBcv3Qub7mgOw1ryh4AT+UihknWB2kdCMCdTIhEO4Qm/
	u2ko1oJMnkkdED1LWZAifrEVyFPqraw/6QRey1nAyr0m5b8JhkVBLnRh5gH6k18BipCY
	Stv11iSs9U6gXChFAgOTqb7jIVg5IUV18rv8ckKnTc2fk/x9LesSNBq+bIQuNt2VakNj
	7KSw==
X-Gm-Message-State: ALKqPwc47iiG+/EnZHTO2jHvgVzudqUsrjaA8wGwD1pX0l3UFTaJTrBp
	MiwP+PAJedh2aORzaOZrWqbMUiFUt0yCo4HMzqArOA==
X-Received: by 2002:a9d:2013:: with SMTP id
	n19-v6mr15183930ota.258.1526992749927; 
	Tue, 22 May 2018 05:39:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 22 May 2018 05:38:49
	-0700 (PDT)
In-Reply-To: <1526222114-5324-6-git-send-email-eric.auger@redhat.com>
References: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
	<1526222114-5324-6-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 May 2018 13:38:49 +0100
Message-ID: <CAFEAcA_wHJuH0oDHkEs7TMxVqzs9VY6EuTwmuyRbuyvMsrEjiw@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [RFC v2 5/7] hw/arm/virt: GICv3 DT node with one or
 two redistributor regions
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
Cc: Andrew Jones <drjones@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cIqS5jph+Yzc

On 13 May 2018 at 15:35, Eric Auger <eric.auger@redhat.com> wrote:
> This patch allows the creation of a GICv3 node with 1 or 2
> redistributor regions depending on the number of smu_cpus.
> The second redistributor region is located just after the
> existing RAM region, at 256GB and contains up to (512 - 123) vcpus.
>
> Please refer to kernel documentation for further node details:
> Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt.c         | 29 ++++++++++++++++++++++++-----
>  include/hw/arm/virt.h | 12 ++++++++++++
>  2 files changed, 36 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index c9d842d..f35962a 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -151,6 +151,8 @@ static const MemMapEntry a15memmap[] = {
>      [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
>      [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
>      [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
> +    /* Allows 512 - 123 additional vcpus (each 2x64kB) */
> +    [VIRT_GIC_REDIST2] =        { 0x4000000000ULL, 0x30A0000LL },

This is a weird size.

>      /* Second PCIe window, 512GB wide at the 512GB boundary */
>      [VIRT_PCIE_MMIO_HIGH] =   { 0x8000000000ULL, 0x8000000000ULL },
>  };
> @@ -404,13 +406,30 @@ static void fdt_add_gic_node(VirtMachineState *vms)
>      qemu_fdt_setprop_cell(vms->fdt, "/intc", "#size-cells", 0x2);
>      qemu_fdt_setprop(vms->fdt, "/intc", "ranges", NULL, 0);
>      if (vms->gic_version == 3) {
> +        int nb_redist_regions = virt_gicv3_redist_region_count(vms);
> +
>          qemu_fdt_setprop_string(vms->fdt, "/intc", "compatible",
>                                  "arm,gic-v3");
> -        qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
> -                                     2, vms->memmap[VIRT_GIC_DIST].base,
> -                                     2, vms->memmap[VIRT_GIC_DIST].size,
> -                                     2, vms->memmap[VIRT_GIC_REDIST].base,
> -                                     2, vms->memmap[VIRT_GIC_REDIST].size);
> +
> +        qemu_fdt_setprop_cell(vms->fdt, "/intc",
> +                              "#redistributor-regions", nb_redist_regions);
> +
> +        if (nb_redist_regions == 1) {
> +            qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
> +                                         2, vms->memmap[VIRT_GIC_DIST].base,
> +                                         2, vms->memmap[VIRT_GIC_DIST].size,
> +                                         2, vms->memmap[VIRT_GIC_REDIST].base,
> +                                         2, vms->memmap[VIRT_GIC_REDIST].size);
> +        } else {
> +            qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
> +                                         2, vms->memmap[VIRT_GIC_DIST].base,
> +                                         2, vms->memmap[VIRT_GIC_DIST].size,
> +                                         2, vms->memmap[VIRT_GIC_REDIST].base,
> +                                         2, vms->memmap[VIRT_GIC_REDIST].size,
> +                                         2, vms->memmap[VIRT_GIC_REDIST2].base,
> +                                         2, vms->memmap[VIRT_GIC_REDIST2].size);
> +        }
> +
>          if (vms->virt) {
>              qemu_fdt_setprop_cells(vms->fdt, "/intc", "interrupts",
>                                     GIC_FDT_IRQ_TYPE_PPI, ARCH_GICV3_MAINT_IRQ,
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 886372c..ba52716 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -35,6 +35,7 @@
>  #include "qemu/notify.h"
>  #include "hw/boards.h"
>  #include "hw/arm/arm.h"
> +#include "sysemu/kvm.h"
>
>  #define NUM_GICV2M_SPIS       64
>  #define NUM_VIRTIO_TRANSPORTS 32
> @@ -60,6 +61,7 @@ enum {
>      VIRT_GIC_V2M,
>      VIRT_GIC_ITS,
>      VIRT_GIC_REDIST,
> +    VIRT_GIC_REDIST2,
>      VIRT_SMMU,
>      VIRT_UART,
>      VIRT_MMIO,
> @@ -129,4 +131,14 @@ typedef struct {
>
>  void virt_acpi_setup(VirtMachineState *vms);
>
> +/* Return the number of used redistributor regions  */
> +static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
> +{
> +    uint32_t rdist1_count = vms->memmap[VIRT_GIC_REDIST].size / 0x20000;
> +
> +    assert(vms->gic_version == 3);
> +
> +    return kvm_irqchip_in_kernel() && vms->smp_cpus > rdist1_count ? 2 : 1;

Why does kvm_irqchip_in_kernel() matter here? If we have more CPUs than
we can fit in the first region, we need 2 regardless. If we're using
the TCG GICv3 then hopefully we'll bail out with a useful error
message when we try to create multiple redistributor regions for it
(until we add support for that).

> +}

I notice there's a lot of 0x20000 constants floating about in this
patch set; could we use a suitable #define ?

thanks
-- PMM
