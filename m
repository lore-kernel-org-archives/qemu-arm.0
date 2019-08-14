Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp767184wrs;
        Wed, 14 Aug 2019 05:31:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwW5B33iSY4XmTE0dVvhy4vlc71KrrYqkIon7rcHS0ShXrLDzVKlPPQpHBA6Ib1frNyyCYz
X-Received: by 2002:a37:5fc6:: with SMTP id t189mr37186803qkb.483.1565785895409;
        Wed, 14 Aug 2019 05:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565785895; cv=none;
        d=google.com; s=arc-20160816;
        b=RG6YLPbiWW7d56Vyge9rZiUMCVNEFJLRODii0vYpOfXKREhRs3qPVLNkMukYfgEMk8
         aadDS/Lw7QhJBtsOFN13vGSBxQJcsyuNCkcMzVgdNe3Cdpav6gDyDsg4THCCyPM7+5XX
         dWdNJfHYAVqdCd1AnvMrqvTtXsFx8pjSkjXFi5RD+ZxtTzzPpxGUzU1EEJ1z6kOWMyLl
         NkhzBQitA0dn0SiShQWqWPMJgoWtv9OQFneJfhVz7VUJfBS7m/zTPh9O+r7XErRvqFlN
         ZTHZhQQ1fgUoJGcZQq9Jcb1NcFTEwQXkdscosQT5i7+dlwNS50qbfAOMJPbFxFhUCoaI
         LHFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=8UFFxzPpssGPR/5U/FxUNx4cDYKZDMMRDWM5tcpXW9g=;
        b=JwY8ojiAaHC8z/xaNYbI/9tbeiWJ8nNowF8Ou9bA6lXRBATf5STDgoPkpbUaOb74Mq
         hy1TtU0ZUwH1y1iYJvXSEdIIb/cTAHE9dZ1Rh+lXcSqePEYSirnHjFPeT6yCRvHx6WDf
         hqwhzCp2Axjz434lDESrr/20kO02MwcfXQpgqQjBQbATyZ/rH5PY2fw99UZL1eLs7/y1
         v/AKgDFH7nWInxjUQYBUW8cHgPZQXfSUE/WdSGIkYE7CGCNBZsqXr3+etq/X1KbHOyaV
         vUEp+0zCyomHc7oMcAcCc50GQ7ym9cmbkawsvbGfYZM4Qia7dZvtd3EXQH4wHPafHvJx
         pnJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6si7236046qtj.361.2019.08.14.05.31.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Aug 2019 05:31:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hxsRC-0008On-U1
	for alex.bennee@linaro.org; Wed, 14 Aug 2019 08:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44685)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1hxsQZ-0008H6-Qh
 for qemu-arm@nongnu.org; Wed, 14 Aug 2019 08:30:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hxsQY-0008WA-Lw
 for qemu-arm@nongnu.org; Wed, 14 Aug 2019 08:30:55 -0400
Received: from 8.mo3.mail-out.ovh.net ([87.98.172.249]:56954)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hxsQY-0008VX-Fn
 for qemu-arm@nongnu.org; Wed, 14 Aug 2019 08:30:54 -0400
Received: from player759.ha.ovh.net (unknown [10.109.160.217])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 66B7F220830
 for <qemu-arm@nongnu.org>; Wed, 14 Aug 2019 14:30:52 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player759.ha.ovh.net (Postfix) with ESMTPSA id 4E6E18E26E40;
 Wed, 14 Aug 2019 12:30:43 +0000 (UTC)
To: Rashmica Gupta <rashmica.g@gmail.com>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org
References: <20190814071433.22243-1-rashmica.g@gmail.com>
 <20190814071433.22243-3-rashmica.g@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <977d1a64-c9b5-445b-454e-45569c486e1d@kaod.org>
Date: Wed, 14 Aug 2019 14:30:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814071433.22243-3-rashmica.g@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 18373560583225773045
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddruddvkedghedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.172.249
Subject: Re: [Qemu-arm] [PATCH v4 2/3] aspeed: add a GPIO controller to the
 SoC
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
Cc: andrew@aj.id.au, aik@ozlabs.ru, qemu-devel@nongnu.org, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3cpdBMTrZY4g

On 14/08/2019 09:14, Rashmica Gupta wrote:
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
> ---
>  hw/arm/aspeed_soc.c         | 17 +++++++++++++++++
>  include/hw/arm/aspeed_soc.h |  3 +++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index c6fb3700f2..ff422c8ad1 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -124,6 +124,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
>          .spis_num     = 1,
>          .fmc_typename = "aspeed.smc.fmc",
>          .spi_typename = aspeed_soc_ast2400_typenames,
> +        .gpio_typename = "aspeed.gpio-ast2400",

I suppose this patch is based on mainline and not my tree.

My current patchset has removed all these typenames but that's OK. 
It's a minor change we can handle depending on which patch gets
merged first. 

A part from that, it looks good.

Thanks,

C.

  
>          .wdts_num     = 2,
>          .irqmap       = aspeed_soc_ast2400_irqmap,
>          .memmap       = aspeed_soc_ast2400_memmap,
> @@ -136,6 +137,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
>          .spis_num     = 1,
>          .fmc_typename = "aspeed.smc.fmc",
>          .spi_typename = aspeed_soc_ast2400_typenames,
> +        .gpio_typename = "aspeed.gpio-ast2400",
>          .wdts_num     = 2,
>          .irqmap       = aspeed_soc_ast2400_irqmap,
>          .memmap       = aspeed_soc_ast2400_memmap,
> @@ -148,6 +150,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
>          .spis_num     = 1,
>          .fmc_typename = "aspeed.smc.fmc",
>          .spi_typename = aspeed_soc_ast2400_typenames,
> +        .gpio_typename = "aspeed.gpio-ast2400",
>          .wdts_num     = 2,
>          .irqmap       = aspeed_soc_ast2400_irqmap,
>          .memmap       = aspeed_soc_ast2400_memmap,
> @@ -160,6 +163,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
>          .spis_num     = 2,
>          .fmc_typename = "aspeed.smc.ast2500-fmc",
>          .spi_typename = aspeed_soc_ast2500_typenames,
> +        .gpio_typename = "aspeed.gpio-ast2500",
>          .wdts_num     = 3,
>          .irqmap       = aspeed_soc_ast2500_irqmap,
>          .memmap       = aspeed_soc_ast2500_memmap,
> @@ -246,6 +250,9 @@ static void aspeed_soc_init(Object *obj)
>  
>      sysbus_init_child_obj(obj, "xdma", OBJECT(&s->xdma), sizeof(s->xdma),
>                            TYPE_ASPEED_XDMA);
> +
> +    sysbus_init_child_obj(obj, "gpio", OBJECT(&s->gpio), sizeof(s->gpio),
> +                          sc->info->gpio_typename);
>  }
>  
>  static void aspeed_soc_realize(DeviceState *dev, Error **errp)
> @@ -425,6 +432,16 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>                      sc->info->memmap[ASPEED_XDMA]);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->xdma), 0,
>                         aspeed_soc_get_irq(s, ASPEED_XDMA));
> +
> +    /* GPIO */
> +    object_property_set_bool(OBJECT(&s->gpio), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, sc->info->memmap[ASPEED_GPIO]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
> +                       aspeed_soc_get_irq(s, ASPEED_GPIO));
>  }
>  static Property aspeed_soc_properties[] = {
>      DEFINE_PROP_UINT32("num-cpus", AspeedSoCState, num_cpus, 0),
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index cef605ad6b..fa04abddd8 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -22,6 +22,7 @@
>  #include "hw/ssi/aspeed_smc.h"
>  #include "hw/watchdog/wdt_aspeed.h"
>  #include "hw/net/ftgmac100.h"
> +#include "hw/gpio/aspeed_gpio.h"
>  
>  #define ASPEED_SPIS_NUM  2
>  #define ASPEED_WDTS_NUM  3
> @@ -47,6 +48,7 @@ typedef struct AspeedSoCState {
>      AspeedSDMCState sdmc;
>      AspeedWDTState wdt[ASPEED_WDTS_NUM];
>      FTGMAC100State ftgmac100[ASPEED_MACS_NUM];
> +    AspeedGPIOState gpio;
>  } AspeedSoCState;
>  
>  #define TYPE_ASPEED_SOC "aspeed-soc"
> @@ -60,6 +62,7 @@ typedef struct AspeedSoCInfo {
>      int spis_num;
>      const char *fmc_typename;
>      const char **spi_typename;
> +    const char *gpio_typename;
>      int wdts_num;
>      const int *irqmap;
>      const hwaddr *memmap;
> 

