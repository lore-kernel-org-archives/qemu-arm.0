Received: by 10.25.208.211 with SMTP id h202csp1452026lfg;
        Tue, 16 Feb 2016 10:18:47 -0800 (PST)
X-Received: by 10.140.249.6 with SMTP id u6mr31078248qhc.83.1455646717899;
        Tue, 16 Feb 2016 10:18:37 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 107si41763785qgo.100.2016.02.16.10.18.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 10:18:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:49247 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVkCr-0008V2-7k
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 13:18:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aVkBA-0005S4-8X
	for qemu-arm@nongnu.org; Tue, 16 Feb 2016 13:16:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aVkB9-0007t2-7s
	for qemu-arm@nongnu.org; Tue, 16 Feb 2016 13:16:52 -0500
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:36142)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aVkB9-0007sv-2a
	for qemu-arm@nongnu.org; Tue, 16 Feb 2016 13:16:51 -0500
Received: by mail-vk0-x22b.google.com with SMTP id c3so140837305vkb.3
	for <qemu-arm@nongnu.org>; Tue, 16 Feb 2016 10:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=EYbg0pEdYb2Ctm/IiwjLx2p+i8Scbtq9mnGoFdS+CfY=;
	b=RNxhjEA1IPYLGK0tRvo7nFTIN+/JAhbhKHKu/r6et9o+kP6wOfgFnnCxkV4htGRi71
	uIQNWj8z0TanRYh9mdv8zxy+nfi4YlEtJq86EbIMJqhqdn9NujZjzV19kSPb0IaB+7vI
	VTakuRI5HCFqCu5qv4ZC+YjCgDYttikvLIctI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=EYbg0pEdYb2Ctm/IiwjLx2p+i8Scbtq9mnGoFdS+CfY=;
	b=RM2zxKh6HKf22gbugnRCgkn1D66v3vKoOWhFKxu2PETX3W87mS6FS5Th55RxxL2yAE
	l4SK2bXpL1jVNm82r6YsgLhTcAa/lZTOJLAhmWCCzvYp3DvzsL8afuJtLrAHY5WCq+pH
	F9KAPcJ8nbX1uqQqINk64aIMtORSCfH0iDU2l2oroz+UVWxJyFc606TU3AaQn1PtXy9z
	9BYMoc2EJ2gq3OWo7o3UVfWxBE0QBXztVXyvxgdTkpfXPHfVQjPepof2l5sGtk5/CLtl
	j01MIfvKNg+AAZxa8WV0YksraQcvkppEr9cGF5B6ZepqNfLyxTAZfLcvoDwX59x1bgXz
	aJnw==
X-Gm-Message-State: AG10YORopCXvyh9U/xIRPSfDrgleY/9ppACOVAtgJHG0ruKlwLz/7tAJx7f6S9Q+xNrpuS29U6O7ujgAZGbQFjNN
X-Received: by 10.31.141.2 with SMTP id p2mr19124947vkd.37.1455646610753; Tue,
	16 Feb 2016 10:16:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 16 Feb 2016 10:16:31 -0800 (PST)
In-Reply-To: <1454086429-4373-7-git-send-email-eric.auger@linaro.org>
References: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
	<1454086429-4373-7-git-send-email-eric.auger@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2016 18:16:31 +0000
Message-ID: <CAFEAcA8mEAu9WjS2MtR2cs5CgiGR+mdc3JdkhmN4eHULvveJYw@mail.gmail.com>
To: Eric Auger <eric.auger@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Cc: eric.auger@st.com, Pranav Sawargaonkar <pranav.sawargaonkar@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>,
	Bharat Bhushan <Bharat.Bhushan@freescale.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>
Subject: Re: [Qemu-arm] [RFC v2 6/8] hw: platform-bus: enable to map any
 memory region onto the platform-bus
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: C4Om/6EV3Wv9

On 29 January 2016 at 16:53, Eric Auger <eric.auger@linaro.org> wrote:
> The platform bus currently is used to map dynamically instantiable
> platform device MMIO regions. The platform bus also can be seen as a
> pool of free guest physical addresses. We would like to use that pool
> to allocate a contiguous reserved IOVA region usable for MSI message
> address IOMMU mapping.
>
> This patch introduces platform_bus_map_region which enables to map any
> memory region onto the platform bus.
>
> Signed-off-by: Eric Auger <eric.auger@linaro.org>
> ---
>  hw/core/platform-bus.c    | 26 ++++++++++++++++----------
>  include/hw/platform-bus.h |  7 +++++++
>  2 files changed, 23 insertions(+), 10 deletions(-)
>
> diff --git a/hw/core/platform-bus.c b/hw/core/platform-bus.c
> index aa55d01..7d0f5e0 100644
> --- a/hw/core/platform-bus.c
> +++ b/hw/core/platform-bus.c
> @@ -128,16 +128,14 @@ static void platform_bus_map_irq(PlatformBusDevice *pbus, SysBusDevice *sbdev,
>      sysbus_connect_irq(sbdev, n, pbus->irqs[irqn]);
>  }
>
> -static void platform_bus_map_mmio(PlatformBusDevice *pbus, SysBusDevice *sbdev,
> -                                  int n)
> +void platform_bus_map_region(PlatformBusDevice *pbus, MemoryRegion *mr)
>  {
> -    MemoryRegion *sbdev_mr = sysbus_mmio_get_region(sbdev, n);
> -    uint64_t size = memory_region_size(sbdev_mr);
> +    uint64_t size = memory_region_size(mr);
>      uint64_t alignment = (1ULL << (63 - clz64(size + size - 1)));
>      uint64_t off;
>      bool found_region = false;
>
> -    if (memory_region_is_mapped(sbdev_mr)) {
> +    if (memory_region_is_mapped(mr)) {
>          /* Region is already mapped, nothing to do */
>          return;
>      }
> @@ -154,13 +152,21 @@ static void platform_bus_map_mmio(PlatformBusDevice *pbus, SysBusDevice *sbdev,
>      }
>
>      if (!found_region) {
> -        error_report("Platform Bus: Can not fit MMIO region of size %"PRIx64,
> -                     size);
> -        exit(1);
> +        error_setg(&error_fatal,
> +                   "Platform Bus: Can not fit region %s of size %"PRIx64,
> +                   mr->name, size);
>      }
>
> -    /* Map the device's region into our Platform Bus MMIO space */
> -    memory_region_add_subregion(&pbus->mmio, off, sbdev_mr);
> +    /* Map the region into our Platform Bus MMIO space */
> +    memory_region_add_subregion(&pbus->mmio, off, mr);
> +}
> +
> +static void platform_bus_map_mmio(PlatformBusDevice *pbus, SysBusDevice *sbdev,
> +                                  int n)
> +{
> +    MemoryRegion *sbdev_mr = sysbus_mmio_get_region(sbdev, n);
> +
> +    platform_bus_map_region(pbus, sbdev_mr);
>  }
>
>  /*
> diff --git a/include/hw/platform-bus.h b/include/hw/platform-bus.h
> index bd42b83..ee19674 100644
> --- a/include/hw/platform-bus.h
> +++ b/include/hw/platform-bus.h
> @@ -54,4 +54,11 @@ int platform_bus_get_irqn(PlatformBusDevice *platform_bus, SysBusDevice *sbdev,
>  hwaddr platform_bus_get_mmio_addr(PlatformBusDevice *pbus, SysBusDevice *sbdev,
>                                    int n);
>
> +/**
> + * platform_bus_map_region: map a region into the platform bus

s/region/MemoryRegion/

> + * @pbus: platform bus handle
> + * @mr: memory region handle
> + */
> +void platform_bus_map_region(PlatformBusDevice *pbus, MemoryRegion *mr);
> +
>  #endif /* !HW_PLATFORM_BUS_H */
> --
> 1.9.1

otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
