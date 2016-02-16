Received: by 10.25.208.211 with SMTP id h202csp1455924lfg;
        Tue, 16 Feb 2016 10:27:28 -0800 (PST)
X-Received: by 10.140.19.132 with SMTP id 4mr29236217qgh.56.1455647248105;
        Tue, 16 Feb 2016 10:27:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u63si41810757qkl.103.2016.02.16.10.27.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 10:27:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:49452 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVkLP-0003nc-I9
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 13:27:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aVkFz-0005PX-Gc
	for qemu-arm@nongnu.org; Tue, 16 Feb 2016 13:21:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aVkFy-0000Ry-K4
	for qemu-arm@nongnu.org; Tue, 16 Feb 2016 13:21:51 -0500
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:32881)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aVkFy-0000Rr-D8
	for qemu-arm@nongnu.org; Tue, 16 Feb 2016 13:21:50 -0500
Received: by mail-vk0-x22c.google.com with SMTP id k196so141738753vka.0
	for <qemu-arm@nongnu.org>; Tue, 16 Feb 2016 10:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=DpRqdeOKOefzK0mu8Z9G6KiHiaCI8u2+MCHRmmP6LrI=;
	b=G2lvtJ8EsPVUMvpOTuGwnUhUVXCj8ZCuVzq5/XLFK6Sl1PQQwE2wL45Z2wrQtLnOLl
	rCjFgua0uG7+mTppiC6DW94v6Y9fLWbstzEUAMcCN7LYDa90up11i3/lTquurgKDuHKo
	qglMcHhlHLiZdUZJ4CFV+BiWeQv8OreDB2FqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DpRqdeOKOefzK0mu8Z9G6KiHiaCI8u2+MCHRmmP6LrI=;
	b=TI8I/fbrscAbOQf1tDFpr7QMVttV2tdWX3ZgJ85aBi21mrJ0jVdMnUWuu8hWH48IaE
	zp6tW5aE9YPPG9tAHb8imD3m6Ib/vlxRUxl4ilkl4lr7D95X4RL1W7uZg8VZI+LvoY8A
	+9KPjmHR1KayO0keXY1YB8eK3RsRS7Z3swBoz2TL0x0yy+n8aZR5IAZwoKT8Uj9tcQLT
	JRWogu3c4dKLORiy1jgnM4zvvK6yIsKU8pb7mPq4IixNyY7iIdRObo42Ncnv+jr9GfTF
	UfOGntBg1qoUSmU47x0MpBCn1foD6S3jkIc8X78U1k2nprpfKiq210IllfWr+DvZjIMF
	NYwQ==
X-Gm-Message-State: AG10YOSjtZbPZyrBbD2ajjDmFtVUCTJqau15ePursUlCgzYJF91BY/5QFYFVvTDxTtGC1SYsLTrS6aUG5ydGuybu
X-Received: by 10.31.194.130 with SMTP id s124mr18828725vkf.92.1455646909667; 
	Tue, 16 Feb 2016 10:21:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 16 Feb 2016 10:21:30 -0800 (PST)
In-Reply-To: <1454086429-4373-8-git-send-email-eric.auger@linaro.org>
References: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
	<1454086429-4373-8-git-send-email-eric.auger@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2016 18:21:30 +0000
Message-ID: <CAFEAcA87ZXSHDE4v5udfWGH15xGGAFNQGBCzm2TcnFEP0LLutg@mail.gmail.com>
To: Eric Auger <eric.auger@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Cc: eric.auger@st.com, Pranav Sawargaonkar <pranav.sawargaonkar@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>,
	Bharat Bhushan <Bharat.Bhushan@freescale.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>
Subject: Re: [Qemu-arm] [RFC v2 7/8] hw: arm: virt: register reserved IOVA
	region
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
X-TUID: BAqXQXdKpfNx

On 29 January 2016 at 16:53, Eric Auger <eric.auger@linaro.org> wrote:
> Registers a 16x64kB reserved iova region. Currently this iova
> region is used by the host kernel to map host MSI controller frames
> (GICv2m, GITS_TRANSLATER). The host kernel needs this iova window
> since it cannot program the PCIe device with MSI frame physical
> address (as opposed to x86) since the MSI write transactions go
> through the IOMMU.
>
> The reserved region is mapped on the platform bus.

I guess that keeps it neatly out of the way of everybody else :-)

> Signed-off-by: Eric Auger <eric.auger@linaro.org>
>
> ---
>
> RFC v1 -> RFC v2:
> - use the platform bus to map the reserved iova region
> ---
>  hw/arm/virt.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 3839c68..4b2a891 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -805,7 +805,7 @@ static void create_pcie_irq_map(const VirtBoardInfo *vbi, uint32_t gic_phandle,
>  }
>
>  static void create_pcie(const VirtBoardInfo *vbi, qemu_irq *pic,
> -                        bool use_highmem)
> +                        bool use_highmem, MemoryRegion **reserved_reg)
>  {
>      hwaddr base_mmio = vbi->memmap[VIRT_PCIE_MMIO].base;
>      hwaddr size_mmio = vbi->memmap[VIRT_PCIE_MMIO].size;
> @@ -920,10 +920,16 @@ static void create_pcie(const VirtBoardInfo *vbi, qemu_irq *pic,
>      qemu_fdt_setprop_cell(vbi->fdt, nodename, "#interrupt-cells", 1);
>      create_pcie_irq_map(vbi, vbi->gic_phandle, irq, nodename);
>
> +    /* initialize the reserved iova region for MSI binding (16 x 64kb) */
> +    *reserved_reg = g_new0(MemoryRegion, 1);
> +    memory_region_init_reserved_iova(*reserved_reg, OBJECT(dev),
> +                                     "reserved-iova",
> +                                     0x100000, &error_fatal);

So the only reason this is here is because we need to have a pointer to
the PCIe controller DeviceState, right? I think it would be better to
make create_pcie() return the DeviceState* instead of NULL. Then you
can either (a) pass the pcie controller pointer into create_platform_bus()
and have that create and map the reserved iova region, or (b) have a
separate function to create the reserved iova region. In any case I
think it fits more naturally with the rest of the platform bus code
rather than in the PCIe controller creation function.

thanks
-- PMM
