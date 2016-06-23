Received: by 10.25.21.96 with SMTP id l93csp668093lfi;
        Thu, 23 Jun 2016 11:49:23 -0700 (PDT)
X-Received: by 10.200.40.88 with SMTP id 24mr15785qtr.73.1466707763448;
        Thu, 23 Jun 2016 11:49:23 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v65si1456192qkh.228.2016.06.23.11.49.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 11:49:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38747 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG9go-0007eN-KB
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 14:49:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG9fw-0007NH-0W
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 14:48:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG9ft-00048p-SB
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 14:48:27 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:35227)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG9ft-00048i-N2
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 14:48:25 -0400
Received: by mail-vk0-x231.google.com with SMTP id j2so119401873vkg.2
	for <qemu-devel@nongnu.org>; Thu, 23 Jun 2016 11:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=bbvVm+4f5l8fjBuq0fgH5F/GQgSxYz/X7kVhI72b5Uw=;
	b=TyoQUBhxtnn1xczM9O3wlMFU8Ny7qgxusm6DZcU//yxxUZHQRyfUhJQfBehyASuSAS
	L6ZsYVfifhqH5b1tBTM3y9dG4FmjEPv2iFsmwuYxz2o+LplgaOrGtH689nt4JteX9ziT
	gJ0yfbheu2clpItrrdKBOYTcZm/tIv3Ap89q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bbvVm+4f5l8fjBuq0fgH5F/GQgSxYz/X7kVhI72b5Uw=;
	b=lTqaABX5hrwFOzsBy1aB+c9IK2Wo/fRVqUFOfJUJvswWCmL6+1S74d6wchx/R6Eob2
	uaO7Aym4lERc37K1OLttCbNrAmQXiSAz34k5BohghiLwJskwQbV79MoPllWuPSkoA5bT
	y59a/MuX8g5NKT64c4cN7aurdeNZBBo99PHY8ZCtnWEkpKJHK4DQLzC0zRkzHZNjxFOh
	BtCcGPIhjxwBinLJTKyqd+4rGQKr9ZNUaoG91N4ZFBuzqZWg0iS40uzuwJptNw2negaL
	hJ9sWGVEBkPxtf3oUVD1PbrILXfTIXIZku2vJhx7HdaeblJ5ENx0yDiGhW7ZjMZmtgdW
	anvg==
X-Gm-Message-State: ALyK8tLuGyTdgAzuy1houNtVyRPxe65CAFb049HOIw0WpweaOtsp3hIJmyPchWptJoDjkvWA7LPpdzl+gJ5OkNwu
X-Received: by 10.176.69.138 with SMTP id u10mr16472747uau.24.1466707705198;
	Thu, 23 Jun 2016 11:48:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Thu, 23 Jun 2016 11:48:05 -0700 (PDT)
In-Reply-To: <1466699607-30406-5-git-send-email-clg@kaod.org>
References: <1466699607-30406-1-git-send-email-clg@kaod.org>
	<1466699607-30406-5-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2016 19:48:05 +0100
Message-ID: <CAFEAcA-5cN57rrcCw=dXbdDE+Pk33pG=8=+LjvXht8GMy_4vcg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Subject: Re: [Qemu-devel] [PATCH v3 4/5] ast2400: create SPI flash slaves
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
X-TUID: GKcfXLvGKx94

On 23 June 2016 at 17:33, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> A set of SPI flash slaves is attached under the flash controllers of
> the palmetto platform. "n25q256a" flash modules are used for the BMC
> and "mx25l25635e" for the host. These types are common in the
> OpenPower ecosystem.
>
> The segment addresses used for the memory mappings are the defaults
> provided by the specs. They can be changed with the Segment Address
> Register but this is not supported in the current implementation.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index d97c077565c3..6be911ed36d0 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -98,13 +98,32 @@
>  #define R_SPI_MISC_CRTL   (0x10 / 4)
>  #define R_SPI_TIMINGS     (0x14 / 4)
>
> +/*
> + * Default segments mappings and size for each slave
> + */
> +static const AspeedSegments aspeed_segments_legacy[] =3D {
> +    { 0x14000000, 32 * 1024 * 1024 },
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
> +
>  static const AspeedSMCController controllers[] =3D {
>      { "aspeed.smc.smc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
> -      CONF_ENABLE_W0, 5 },
> +      CONF_ENABLE_W0, 5, aspeed_segments_legacy },
>      { "aspeed.smc.fmc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
> -      CONF_ENABLE_W0, 5 },
> +      CONF_ENABLE_W0, 5, aspeed_segments_fmc },
>      { "aspeed.smc.spi", R_SPI_CONF, 0xff, R_SPI_CTRL0, R_SPI_TIMINGS,
> -      SPI_CONF_ENABLE_W0, 1 },
> +      SPI_CONF_ENABLE_W0, 1, aspeed_segments_spi },
>  };
>
>  static bool aspeed_smc_is_ce_stop_active(AspeedSMCState *s, int cs)
> @@ -217,6 +236,8 @@ static const MemoryRegionOps aspeed_smc_ops =3D {
>      .valid.unaligned =3D true,
>  };
>
> +static const MemoryRegionOps aspeed_smc_flash_ops;
> +
>  static void aspeed_smc_realize(DeviceState *dev, Error **errp)
>  {
>      SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> @@ -254,6 +275,27 @@ static void aspeed_smc_realize(DeviceState *dev, Err=
or **errp)
>      memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
>                            s->ctrl->name, ASPEED_SMC_R_MAX * 4);
>      sysbus_init_mmio(sbd, &s->mmio);
> +
> +    s->flashes =3D g_new0(AspeedSMCFlashState *, s->num_cs);
> +
> +    for (i =3D 0; i < s->num_cs; ++i) {
> +        Object *obj =3D object_new(TYPE_ASPEED_SMC_FLASH);
> +        AspeedSMCFlashState *fl =3D ASPEED_SMC_FLASH(obj);
> +        char name[32];
> +
> +        s->flashes[i] =3D fl;
> +
> +        snprintf(name, sizeof(name), "%s.%d", s->ctrl->name, i);
> +
> +        fl->id =3D i;
> +        fl->controller =3D s;
> +        fl->size =3D s->ctrl->segments[i].size;
> +
> +        memory_region_init_io(&fl->mmio, obj, &aspeed_smc_flash_ops, fl,=
 name,
> +                              fl->size);
> +        sysbus_init_mmio(SYS_BUS_DEVICE(fl), &fl->mmio);
> +        sysbus_mmio_map(SYS_BUS_DEVICE(fl), 0, s->ctrl->segments[i].addr=
);

Device code shouldn't call sysbus_mmio_map() -- the system memory map is
the board's responsibility.

thanks
-- PMM
