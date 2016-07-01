Received: by 10.25.21.96 with SMTP id l93csp378667lfi;
        Fri, 1 Jul 2016 09:26:26 -0700 (PDT)
X-Received: by 10.129.154.208 with SMTP id r199mr8233880ywg.119.1467390386355;
        Fri, 01 Jul 2016 09:26:26 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c71si2513323qke.248.2016.07.01.09.26.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jul 2016 09:26:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34426 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bJ1Gr-0003Kk-OH
	for alex.bennee@linaro.org; Fri, 01 Jul 2016 12:26:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45618)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ1FP-00025y-2W
	for qemu-devel@nongnu.org; Fri, 01 Jul 2016 12:24:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ1FM-0004dW-Tf
	for qemu-devel@nongnu.org; Fri, 01 Jul 2016 12:24:54 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:32895)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ1FM-0004d7-9e
	for qemu-devel@nongnu.org; Fri, 01 Jul 2016 12:24:52 -0400
Received: by mail-vk0-x22b.google.com with SMTP id k68so72998523vkb.0
	for <qemu-devel@nongnu.org>; Fri, 01 Jul 2016 09:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CYOXehKdQkbJu8i836JaCIHgBrau5DSLs2GyjiZFaTg=;
	b=VIbvKTKfDoIbq7sffwf+Sg8O5U5E+IDtZR/VTr4tTr0OsUL4/z9S/O6feoFi/rNZ4K
	A4R76ZRCocDci0EiB3sdgSE+xhiAo7ETJqyPnQ3sUmKKD+ntDJ2x1RuYDmE9DnmHDMjl
	sngfIPxc5HTT6DufBpu90KuzHxE6xmhI2phRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CYOXehKdQkbJu8i836JaCIHgBrau5DSLs2GyjiZFaTg=;
	b=XcOPjaG0dbEywUpCwKEt1lxSmtRbi6nkMisLD3YKE4Uf/ic3pXOjddq5fKy66kAt2v
	bbYZEKx+O1lTmkcJRgKkgnj6b9gqa6wdt7ldhtJjYPAftaF9oRoCqes6QndaLnQqSKTf
	VVKtrG4OhQrc23OmsWGw2jVEO4Ad1ynvP48BSwyYpn0+Q30hN4Bhk1ONzgcCZmBbHutq
	NpzwCmBAND+tkqc9H5NYM87qP1UjEhaMGDFkoc8BjpNqYHgiIHQAhmbT/GBE8OdzkAf1
	jiFA5KEP3Rx0dl4LqRa7khUqtucsvJ40zG+KRuiSgensS1Ceb6bMJuuM8jFjGzdvKaSa
	PqIA==
X-Gm-Message-State: ALyK8tJhuf1uU1Tt6+ok5+c+PhGl3yJsCHCQroR1x9+yA12I1xZ/l56LcPXuJobRg+dQkh4ZTMbWSv+gnDDi3fy4
X-Received: by 10.31.7.78 with SMTP id 75mr10469979vkh.74.1467390291577; Fri,
	01 Jul 2016 09:24:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Fri, 1 Jul 2016 09:24:32 -0700 (PDT)
In-Reply-To: <1467138270-32481-8-git-send-email-clg@kaod.org>
References: <1467138270-32481-1-git-send-email-clg@kaod.org>
	<1467138270-32481-8-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2016 17:24:32 +0100
Message-ID: <CAFEAcA_8+XubTSH2sstoyoXi6s1DkZySckyUqrt0BGiMALC4+Q@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-devel] [PATCH v5 7/9] ast2400: add SPI flash slaves
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
Cc: Kevin Wolf <kwolf@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PJQu1DBDMP4N

On 28 June 2016 at 19:24, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Each controller on the ast2400 has a memory range on which it maps its
> flash module slaves. Each slave is assigned a memory segment for its
> mapping that can be changed at bootime with the Segment Address
> Register. This is not supported in the current implementation so we
> are using the defaults provided by the specs.
>
> Each SPI flash slave can then be accessed in two modes: Command and
> User. When in User mode, accesses to the memory segment of the slaves
> are translated in SPI transfers. When in Command mode, the HW
> generates the SPI commands automatically and the memory segment is
> accessed as if doing a MMIO. Other SPI controllers call that mode
> linear addressing mode.
>
> For this purpose, we are adding below each crontoller an array of
> structs gathering for each SPI flash module, a segment rank, a
> MemoryRegion to handle the memory accesses and the associated SPI
> slave device, which should be a m25p80.
>
> Only the User mode is supported for now but we are preparing ground
> for the Command mode. The framework is sufficient to support Linux.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

> +/*
> + * Default segments mapping addresses and size for each slave per
> + * controller. These can be changed when board is initialized with the
> + * Segment Address Registers but they don't seem do be used on the
> + * field.
> + */
> +static const AspeedSegments aspeed_segments_legacy[] =3D {
> +    { 0x10000000, 32 * 1024 * 1024 },
> +};
> +
> +static const AspeedSegments aspeed_segments_fmc[] =3D {
> +    { 0x20000000, 64 * 1024 * 1024 },
> +    { 0x24000000, 32 * 1024 * 1024 },
> +    { 0x26000000, 32 * 1024 * 1024 },
> +    { 0x28000000, 32 * 1024 * 1024 },
> +    { 0x2A000000, 32 * 1024 * 1024 }
> +};
> +
> +static const AspeedSegments aspeed_segments_spi[] =3D {
> +    { 0x30000000, 64 * 1024 * 1024 },
> +};

If I understand this correctly, and the Segment Address Registers
are part of the SMC controller, then eventually if we want to
implement making these writable then the correct approach is
probably to have a container memory region which the SMC controller
provides to the board (and which the board then maps into the
system memory space), and then the controller is responsible for
mapping and unmapping the individual memory regions inside that
container. This is basically how we do PCI controllers, which also
allow guests to write to PCI BARs to map and unmap bits of memory.
This will be fine for now, though.

>  static bool aspeed_smc_is_ce_stop_active(const AspeedSMCState *s, int cs=
)
> @@ -237,6 +353,8 @@ static void aspeed_smc_realize(DeviceState *dev, Erro=
r **errp)
>      AspeedSMCState *s =3D ASPEED_SMC(dev);
>      AspeedSMCClass *mc =3D ASPEED_SMC_GET_CLASS(s);
>      int i;
> +    char name[32];
> +    hwaddr offset =3D 0;
>
>      s->ctrl =3D mc->ctrl;
>
> @@ -270,6 +388,32 @@ static void aspeed_smc_realize(DeviceState *dev, Err=
or **errp)
>      memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
>                            s->ctrl->name, ASPEED_SMC_R_MAX * 4);
>      sysbus_init_mmio(sbd, &s->mmio);
> +
> +    /*
> +     * Memory region where flash modules are remapped
> +     */
> +    snprintf(name, sizeof(name), "%s.flash", s->ctrl->name);
> +
> +    memory_region_init_io(&s->mmio_flash, OBJECT(s),
> +                          &aspeed_smc_flash_default_ops, s, name,
> +                          s->ctrl->mapping_window_size);
> +    sysbus_init_mmio(sbd, &s->mmio_flash);
> +
> +    s->flashes =3D g_malloc0(sizeof(AspeedSMCFlash) * s->num_cs);

This should be g_new0(AspeedSMCFlash, s->num_cs);  -- multiplying
in a g_malloc0() is usually a sign you should use g_new0 instead.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

so I'll just fix that when I put the series in target-arm.next.

thanks
-- PMM
