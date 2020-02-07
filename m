Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp721709lfp;
        Fri, 7 Feb 2020 07:47:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqw+v08p/NJsciBOzSbcv/YW207VVgCYrV3tiRMyIwvJ6DUqrPTEPTC77Vz5sOBm5B2h7Tol
X-Received: by 2002:a0c:e150:: with SMTP id c16mr7396037qvl.51.1581090456651;
        Fri, 07 Feb 2020 07:47:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581090456; cv=none;
        d=google.com; s=arc-20160816;
        b=ukegrZVS6UT7eUU9zAu3DDBNxKaP3syumJDdvAg9x5ggJh3jVWQNPUkogzMS74X2qV
         qkl/FUM9TaBdIzAJh+KN3TDLRCAkGtbUD3LP8y4k47Q3DryYc+t6gzT8As+ZcumaNfI8
         whzolofspeWeBTciYS8thYoPJEQtHBbKYs4fOprzut8GlxbJFeWpfjQeS6lJarHvyRmF
         UggX+pHGWyZMidvYonRZGQtg5r3dya9MYbBl1penqyczaYwzWY0ZgV5Fc9SVBGETCOoI
         QfvuQ6anpP8ZD/RdHMGdOSuW1BEjkwAJHfuzn/1BU2VDJy+BjgsFs0ZzK/d9JWM9CYiI
         r2Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=duZEPu1l1Eh0OW7nEyU+mPdd1/KZgAHozoheUHZVJrI=;
        b=slv3nxaGAo9e9xCPSf1H2qymnZYdcwZDFgryE+S3RC356iWgt7CgDVxb7oEYt2qXZR
         ETEwoJpOrFhm/gH62nj5el+WEgI5P3ZnlqWD62Nul8krTTCkb3jA+M1uKtxMBaChT078
         5imwk48n8LfDTBSMuFRBqLnuUY9j2QitioS5uXDBHC8LzQy9iYToBd0vKfTBg3b5oTRY
         0mskHO1JPE/Tr/dUSCK3kUG5RAteHehi+qpoXAd4K66fPH7INqCF1DTr9RM2UeVn1g2i
         ycCE+PMFbluOTICbuqLcWFAr32sLhpqGIk1gB1YG/Wx0NueIY3L1Sh1NA8uzdciBEu3J
         UJFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2si1629601qtv.141.2020.02.07.07.47.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 07:47:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j05qy-0006ta-2k
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 10:47:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45888)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1j05qq-0006rm-3l
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 10:47:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1j05qi-0000iq-Jb
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 10:47:28 -0500
Received: from 20.mo7.mail-out.ovh.net ([46.105.49.208]:43939)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1j05qg-0000ex-Rv
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 10:47:20 -0500
Received: from player735.ha.ovh.net (unknown [10.108.57.183])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 0542D14FB8A
 for <qemu-arm@nongnu.org>; Fri,  7 Feb 2020 16:47:15 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player735.ha.ovh.net (Postfix) with ESMTPSA id 207A1EEAD3F9;
 Fri,  7 Feb 2020 15:47:10 +0000 (UTC)
Subject: Re: [PATCH] hw/arm: ast2600: Wire up EHCI controllers
To: Guenter Roeck <linux@roeck-us.net>
References: <20200207144954.13634-1-linux@roeck-us.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c0bcd37a-0745-69ec-471f-be54c8e5a54e@kaod.org>
Date: Fri, 7 Feb 2020 16:47:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200207144954.13634-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 9692590823282215744
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrheehgdekudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.49.208
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7CovDpK7o97X

On 2/7/20 3:49 PM, Guenter Roeck wrote:
> Initialize EHCI controllers on AST2600 using the existing
> TYPE_PLATFORM_EHCI. After this change, booting ast2600-evb
> into Linux successfully instantiates a USB interface after
> the necessary changes are made to its devicetree files.
> 
> ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> ehci-platform: EHCI generic platform driver
> ehci-platform 1e6a3000.usb: EHCI Host Controller
> ehci-platform 1e6a3000.usb: new USB bus registered, assigned bus number 1
> ehci-platform 1e6a3000.usb: irq 25, io mem 0x1e6a3000
> ehci-platform 1e6a3000.usb: USB 2.0 started, EHCI 1.00
> usb usb1: Manufacturer: Linux 5.5.0-09825-ga0802f2d0ef5-dirty ehci_hcd
> usb 1-1: new high-speed USB device number 2 using ehci-platform
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/arm/aspeed_ast2600.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 931887ac68..a528251c8d 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -31,6 +31,8 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
>      [ASPEED_FMC]       = 0x1E620000,
>      [ASPEED_SPI1]      = 0x1E630000,
>      [ASPEED_SPI2]      = 0x1E641000,
> +    [ASPEED_EHCI1]     = 0x1E6A1000,
> +    [ASPEED_EHCI2]     = 0x1E6A3000,
>      [ASPEED_MII1]      = 0x1E650000,
>      [ASPEED_MII2]      = 0x1E650008,
>      [ASPEED_MII3]      = 0x1E650010,
> @@ -77,6 +79,8 @@ static const int aspeed_soc_ast2600_irqmap[] = {
>      [ASPEED_ADC]       = 78,
>      [ASPEED_XDMA]      = 6,
>      [ASPEED_SDHCI]     = 43,
> +    [ASPEED_EHCI1]     = 5,
> +    [ASPEED_EHCI2]     = 9,

There is a conflict here with commit a29e3e127077 ("hw/arm: ast2600: Wire 
up the eMMC controller") which is mainline already 

C. 

>      [ASPEED_GPIO]      = 40,
>      [ASPEED_GPIO_1_8V] = 11,
>      [ASPEED_RTC]       = 13,
> @@ -167,6 +171,11 @@ static void aspeed_soc_ast2600_init(Object *obj)
>                                sizeof(s->spi[i]), typename);
>      }
>  
> +    for (i = 0; i < sc->ehcis_num; i++) {
> +        sysbus_init_child_obj(obj, "ehci[*]", OBJECT(&s->ehci[i]),
> +                              sizeof(s->ehci[i]), TYPE_PLATFORM_EHCI);
> +    }
> +
>      snprintf(typename, sizeof(typename), "aspeed.sdmc-%s", socname);
>      sysbus_init_child_obj(obj, "sdmc", OBJECT(&s->sdmc), sizeof(s->sdmc),
>                            typename);
> @@ -395,6 +404,19 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>                          s->spi[i].ctrl->flash_window_base);
>      }
>  
> +    /* EHCI */
> +    for (i = 0; i < sc->ehcis_num; i++) {
> +        object_property_set_bool(OBJECT(&s->ehci[i]), true, "realized", &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ehci[i]), 0,
> +                        sc->memmap[ASPEED_EHCI1 + i]);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->ehci[i]), 0,
> +                           aspeed_soc_get_irq(s, ASPEED_EHCI1 + i));
> +    }
> +
>      /* SDMC - SDRAM Memory Controller */
>      object_property_set_bool(OBJECT(&s->sdmc), true, "realized", &err);
>      if (err) {
> @@ -499,6 +521,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
>      sc->silicon_rev  = AST2600_A0_SILICON_REV;
>      sc->sram_size    = 0x10000;
>      sc->spis_num     = 2;
> +    sc->ehcis_num    = 2;
>      sc->wdts_num     = 4;
>      sc->macs_num     = 4;
>      sc->irqmap       = aspeed_soc_ast2600_irqmap;
> 

