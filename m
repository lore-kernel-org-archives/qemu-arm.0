Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp985084wrs;
        Fri, 16 Aug 2019 09:06:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxZBdV++LF5NgfY4HkVIiHTiWVEV8eUzAb6Qd+G6OhhuhQdRCTkZW4g55QxjkrwcjbTtwR2
X-Received: by 2002:a37:709:: with SMTP id 9mr9801647qkh.2.1565971602558;
        Fri, 16 Aug 2019 09:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565971602; cv=none;
        d=google.com; s=arc-20160816;
        b=f0sNShIDYUto9l1jRLqrt30hsGWLTb7T2NFTrzRXcerqfIhOYMzVXe4kIvvWdlTvLh
         PIWm49V1ZqB50bqM71TATD6dRvNNYcD4uusAH7l0CR8mxT7PsYP6TxnzPn5MvbK0FZK+
         IK2m5EIkb4UiNhxMbFOvThI+TAIVIY7IvpWcv53TzqZ4k4B/b4Z+GosIgCLdF7+ooMUs
         tXNpyrbAerxAFzNAeb0zhwcf30XcWp29s2v3jjvK03LXOqRDkO61N5zBNT6A9WM+1e4l
         /m6b5KUqqC2pqXrv9EJjvs5qQH4pF5mI/U6r1dtXY2Ug2fcZpIDh+AezQXxcNInSFfKl
         5gpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=Svwf5p2mxEahVoc151LRwswC6gC3/D0dVczxGM69aF4=;
        b=p0KQ203IKv58T3Mb45mSktIrMm8z7sOIC6dF2Gr2Hc+I/la+xqwgifOTXmPTv2I8cZ
         y/MDQW0BHayCqRuCEZnd8cIuaRLOsNUjlMYJsT8sBsgJeu0hKe3xanmJ5BqLmsSwNEON
         abq3LLdVQGy2qcwBx/q5CTl17LyIXbIrF968pNejpJmd/NzGyDtT0zbmypQOTkuXchma
         +bSW2EaHCN05nZhkmRKkZAM6kVtP4x28wv90UAxTJLn5XcjVzXI4BuafGQ9hrgRoO240
         6HEUpUGfrcBHdmgZCnmJPYy5+qJQNMJslZvQ0ulNDSWmRVwtmW1+8a1cpL1ZU93AMCyB
         HbYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w35si3835761qvc.133.2019.08.16.09.06.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 09:06:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyekU-0007lk-2N
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 12:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35810)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1hyeeO-0001MW-5a
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 12:00:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hyeeM-0000wt-Pc
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 12:00:23 -0400
Received: from 1.mo6.mail-out.ovh.net ([46.105.56.136]:35016)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hyeeM-0000vp-JL
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 12:00:22 -0400
Received: from player159.ha.ovh.net (unknown [10.108.54.36])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 9CC0B1DCDC8
 for <qemu-devel@nongnu.org>; Fri, 16 Aug 2019 18:00:20 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player159.ha.ovh.net (Postfix) with ESMTPSA id EFA788CD1206;
 Fri, 16 Aug 2019 16:00:12 +0000 (UTC)
To: Rashmica Gupta <rashmica.g@gmail.com>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org
References: <20190816073229.22787-1-rashmica.g@gmail.com>
 <20190816073229.22787-3-rashmica.g@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <64b7c894-b579-dfa5-7a57-8d8d1e5c6b86@kaod.org>
Date: Fri, 16 Aug 2019 18:00:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816073229.22787-3-rashmica.g@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 15209781843295636469
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudeffedgledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.56.136
Subject: Re: [Qemu-devel] [PATCH v5 2/3] aspeed: add a GPIO controller to
 the SoC
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: andrew@aj.id.au, aik@ozlabs.ru, qemu-devel@nongnu.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /3QCFC0dF1Qg

On 16/08/2019 09:32, Rashmica Gupta wrote:
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>



Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  include/hw/arm/aspeed_soc.h |  3 +++
>  hw/arm/aspeed_soc.c         | 17 +++++++++++++++++
>  2 files changed, 20 insertions(+)
>=20
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index cef605ad6b..fa04abddd8 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -22,6 +22,7 @@
>  #include "hw/ssi/aspeed_smc.h"
>  #include "hw/watchdog/wdt_aspeed.h"
>  #include "hw/net/ftgmac100.h"
> +#include "hw/gpio/aspeed_gpio.h"
> =20
>  #define ASPEED_SPIS_NUM  2
>  #define ASPEED_WDTS_NUM  3
> @@ -47,6 +48,7 @@ typedef struct AspeedSoCState {
>      AspeedSDMCState sdmc;
>      AspeedWDTState wdt[ASPEED_WDTS_NUM];
>      FTGMAC100State ftgmac100[ASPEED_MACS_NUM];
> +    AspeedGPIOState gpio;
>  } AspeedSoCState;
> =20
>  #define TYPE_ASPEED_SOC "aspeed-soc"
> @@ -60,6 +62,7 @@ typedef struct AspeedSoCInfo {
>      int spis_num;
>      const char *fmc_typename;
>      const char **spi_typename;
> +    const char *gpio_typename;
>      int wdts_num;
>      const int *irqmap;
>      const hwaddr *memmap;
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index c6fb3700f2..ff422c8ad1 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -124,6 +124,7 @@ static const AspeedSoCInfo aspeed_socs[] =3D {
>          .spis_num     =3D 1,
>          .fmc_typename =3D "aspeed.smc.fmc",
>          .spi_typename =3D aspeed_soc_ast2400_typenames,
> +        .gpio_typename =3D "aspeed.gpio-ast2400",
>          .wdts_num     =3D 2,
>          .irqmap       =3D aspeed_soc_ast2400_irqmap,
>          .memmap       =3D aspeed_soc_ast2400_memmap,
> @@ -136,6 +137,7 @@ static const AspeedSoCInfo aspeed_socs[] =3D {
>          .spis_num     =3D 1,
>          .fmc_typename =3D "aspeed.smc.fmc",
>          .spi_typename =3D aspeed_soc_ast2400_typenames,
> +        .gpio_typename =3D "aspeed.gpio-ast2400",
>          .wdts_num     =3D 2,
>          .irqmap       =3D aspeed_soc_ast2400_irqmap,
>          .memmap       =3D aspeed_soc_ast2400_memmap,
> @@ -148,6 +150,7 @@ static const AspeedSoCInfo aspeed_socs[] =3D {
>          .spis_num     =3D 1,
>          .fmc_typename =3D "aspeed.smc.fmc",
>          .spi_typename =3D aspeed_soc_ast2400_typenames,
> +        .gpio_typename =3D "aspeed.gpio-ast2400",
>          .wdts_num     =3D 2,
>          .irqmap       =3D aspeed_soc_ast2400_irqmap,
>          .memmap       =3D aspeed_soc_ast2400_memmap,
> @@ -160,6 +163,7 @@ static const AspeedSoCInfo aspeed_socs[] =3D {
>          .spis_num     =3D 2,
>          .fmc_typename =3D "aspeed.smc.ast2500-fmc",
>          .spi_typename =3D aspeed_soc_ast2500_typenames,
> +        .gpio_typename =3D "aspeed.gpio-ast2500",
>          .wdts_num     =3D 3,
>          .irqmap       =3D aspeed_soc_ast2500_irqmap,
>          .memmap       =3D aspeed_soc_ast2500_memmap,
> @@ -246,6 +250,9 @@ static void aspeed_soc_init(Object *obj)
> =20
>      sysbus_init_child_obj(obj, "xdma", OBJECT(&s->xdma), sizeof(s->xdm=
a),
>                            TYPE_ASPEED_XDMA);
> +
> +    sysbus_init_child_obj(obj, "gpio", OBJECT(&s->gpio), sizeof(s->gpi=
o),
> +                          sc->info->gpio_typename);
>  }
> =20
>  static void aspeed_soc_realize(DeviceState *dev, Error **errp)
> @@ -425,6 +432,16 @@ static void aspeed_soc_realize(DeviceState *dev, E=
rror **errp)
>                      sc->info->memmap[ASPEED_XDMA]);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->xdma), 0,
>                         aspeed_soc_get_irq(s, ASPEED_XDMA));
> +
> +    /* GPIO */
> +    object_property_set_bool(OBJECT(&s->gpio), true, "realized", &err)=
;
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, sc->info->memmap[ASPE=
ED_GPIO]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
> +                       aspeed_soc_get_irq(s, ASPEED_GPIO));
>  }
>  static Property aspeed_soc_properties[] =3D {
>      DEFINE_PROP_UINT32("num-cpus", AspeedSoCState, num_cpus, 0),
>=20

