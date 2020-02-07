Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp294728lfp;
        Fri, 7 Feb 2020 00:16:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqx7pd4K5fuXkrsrwuDGy9L3i0EtwBuwkNmDz8b7lEWAElaJ8rPwDeGR6mUEahuPcpV3DPOE
X-Received: by 2002:a05:6214:20c:: with SMTP id i12mr5901762qvt.48.1581063418255;
        Fri, 07 Feb 2020 00:16:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581063418; cv=none;
        d=google.com; s=arc-20160816;
        b=tbgSWCcAWolxifDimf5kBS7umUzucZ5vLpWB1aVSinUJxdTdGAgwn23A59AZppvm+5
         j087+OprY9zX0N3DpIprDBYVtrVXh5LPLrVgg4RobGvftcLXy1YPLneq4cg/N0DiA4UW
         jpAShtt7Rviq+DRbwzRvC8TLT0RoORaThtj5Qv+e9oOranov/kJTxSB4O//XfHRYNCUj
         lASGaCFiy+Mci/P7noOZ/zRZ4avjUCEWRpWNLAzsmJ5Mk8E7N//hDtyIY8mzBpW0T999
         /zf27vvrCGcWKBpmUtYzPgPNI/dFYHvslJ2AWsH9NESi5uT6B2j+xhxqYzlSzxecA2xU
         MROA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=KZ5JyYj9I1fKWgDwbyxCdunTJ3DQyPr04lJNt9yN/cw=;
        b=LOhDDfBlyw30JcavKZ+nQSMPAkZc9PiB+BjkYjwCKfCXucNvrOV5EBpR2ayO5nBfIb
         bmrqCBNnIdYzgtF7BZ/4kGzBH1+n6zqnlsMRMyS4ievhsFNSfHki+SZgjkRPsdGe2ar+
         MFqx9G0RuDUw6IjUcg6zB0JL+REtpg9ZxxQbSRDmmlbwqp4m6KYL0PDSWjQEQy0E5wmF
         k4RKIGveZRpCv/G7NMen9i2Zisy5rIiMpj7+RwBwN7vMeo568awvtHlKbpGFTdbR7Ydc
         ptbCzveWA176cMqUN50xB21sEuGTx8hcwKhkJtc5/1gLlFTjXXquerUO482PYTnNDDx/
         wO5w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t28si942941qkg.61.2020.02.07.00.16.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 00:16:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izyor-0002aB-Ma
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 03:16:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47122)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1izyog-0002WX-UJ
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 03:16:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1izyof-0006zS-G9
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 03:16:46 -0500
Received: from 2.mo68.mail-out.ovh.net ([46.105.52.162]:49897)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1izyof-0006rS-Ah
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 03:16:45 -0500
Received: from player715.ha.ovh.net (unknown [10.110.171.96])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 0D615159F10
 for <qemu-arm@nongnu.org>; Fri,  7 Feb 2020 09:16:42 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player715.ha.ovh.net (Postfix) with ESMTPSA id 4323AEEB6B74;
 Fri,  7 Feb 2020 08:16:37 +0000 (UTC)
Subject: Re: [PATCH] hw/arm: ast2400/ast2500: Wire up EHCI controllers
To: Guenter Roeck <linux@roeck-us.net>
References: <20200206183437.3979-1-linux@roeck-us.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e9f490fe-34d3-6830-832c-155f6fa63482@kaod.org>
Date: Fri, 7 Feb 2020 09:16:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200206183437.3979-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 2083477778856250176
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrheeggdduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejudehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.52.162
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
X-TUID: Dk+4vDNeyzxq

On 2/6/20 7:34 PM, Guenter Roeck wrote:
> Initialize EHCI controllers on AST2400 and AST2500 using the existing
> TYPE_PLATFORM_EHCI. After this change, booting ast2500-evb into Linux
> successfully instantiates a USB interface.
> 
> ehci-platform 1e6a3000.usb: EHCI Host Controller
> ehci-platform 1e6a3000.usb: new USB bus registered, assigned bus number 1
> ehci-platform 1e6a3000.usb: irq 21, io mem 0x1e6a3000
> ehci-platform 1e6a3000.usb: USB 2.0 started, EHCI 1.00
> usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.05
> usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> usb usb1: Product: EHCI Host Controller

Cool. Have you tried to plug any devices ? 

> Signed-off-by: Guenter Roeck <linux@roeck-us.net>


This looks good. Could you add the AST2600 also ?

Thanks,

C.

> ---
>  hw/arm/aspeed_soc.c         | 25 +++++++++++++++++++++++++
>  include/hw/arm/aspeed_soc.h |  6 ++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index b5e809a1d3..696c7fda14 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -30,6 +30,7 @@ static const hwaddr aspeed_soc_ast2400_memmap[] = {
>      [ASPEED_IOMEM]  = 0x1E600000,
>      [ASPEED_FMC]    = 0x1E620000,
>      [ASPEED_SPI1]   = 0x1E630000,
> +    [ASPEED_EHCI1]  = 0x1E6A1000,
>      [ASPEED_VIC]    = 0x1E6C0000,
>      [ASPEED_SDMC]   = 0x1E6E0000,
>      [ASPEED_SCU]    = 0x1E6E2000,
> @@ -59,6 +60,8 @@ static const hwaddr aspeed_soc_ast2500_memmap[] = {
>      [ASPEED_FMC]    = 0x1E620000,
>      [ASPEED_SPI1]   = 0x1E630000,
>      [ASPEED_SPI2]   = 0x1E631000,
> +    [ASPEED_EHCI1]  = 0x1E6A1000,
> +    [ASPEED_EHCI2]  = 0x1E6A3000,
>      [ASPEED_VIC]    = 0x1E6C0000,
>      [ASPEED_SDMC]   = 0x1E6E0000,
>      [ASPEED_SCU]    = 0x1E6E2000,
> @@ -91,6 +94,8 @@ static const int aspeed_soc_ast2400_irqmap[] = {
>      [ASPEED_UART5]  = 10,
>      [ASPEED_VUART]  = 8,
>      [ASPEED_FMC]    = 19,
> +    [ASPEED_EHCI1]  = 5,
> +    [ASPEED_EHCI2]  = 13,
>      [ASPEED_SDMC]   = 0,
>      [ASPEED_SCU]    = 21,
>      [ASPEED_ADC]    = 31,
> @@ -180,6 +185,11 @@ static void aspeed_soc_init(Object *obj)
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
> @@ -364,6 +374,19 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
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
> @@ -472,6 +495,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
>      sc->silicon_rev  = AST2400_A1_SILICON_REV;
>      sc->sram_size    = 0x8000;
>      sc->spis_num     = 1;
> +    sc->ehcis_num    = 1;
>      sc->wdts_num     = 2;
>      sc->macs_num     = 2;
>      sc->irqmap       = aspeed_soc_ast2400_irqmap;
> @@ -496,6 +520,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
>      sc->silicon_rev  = AST2500_A1_SILICON_REV;
>      sc->sram_size    = 0x9000;
>      sc->spis_num     = 2;
> +    sc->ehcis_num    = 2;
>      sc->wdts_num     = 3;
>      sc->macs_num     = 2;
>      sc->irqmap       = aspeed_soc_ast2500_irqmap;
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 90ac7f7ffa..78b9f6ae53 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -26,8 +26,10 @@
>  #include "target/arm/cpu.h"
>  #include "hw/gpio/aspeed_gpio.h"
>  #include "hw/sd/aspeed_sdhci.h"
> +#include "hw/usb/hcd-ehci.h"
>  
>  #define ASPEED_SPIS_NUM  2
> +#define ASPEED_EHCIS_NUM 2
>  #define ASPEED_WDTS_NUM  4
>  #define ASPEED_CPUS_NUM  2
>  #define ASPEED_MACS_NUM  4
> @@ -50,6 +52,7 @@ typedef struct AspeedSoCState {
>      AspeedXDMAState xdma;
>      AspeedSMCState fmc;
>      AspeedSMCState spi[ASPEED_SPIS_NUM];
> +    EHCISysBusState ehci[ASPEED_EHCIS_NUM];
>      AspeedSDMCState sdmc;
>      AspeedWDTState wdt[ASPEED_WDTS_NUM];
>      FTGMAC100State ftgmac100[ASPEED_MACS_NUM];
> @@ -71,6 +74,7 @@ typedef struct AspeedSoCClass {
>      uint32_t silicon_rev;
>      uint64_t sram_size;
>      int spis_num;
> +    int ehcis_num;
>      int wdts_num;
>      int macs_num;
>      const int *irqmap;
> @@ -94,6 +98,8 @@ enum {
>      ASPEED_FMC,
>      ASPEED_SPI1,
>      ASPEED_SPI2,
> +    ASPEED_EHCI1,
> +    ASPEED_EHCI2,
>      ASPEED_VIC,
>      ASPEED_SDMC,
>      ASPEED_SCU,
> 

